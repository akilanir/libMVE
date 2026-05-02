package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.spdy.ErrorCode;
import com.squareup.okhttp.internal.spdy.Header;
import com.squareup.okhttp.internal.spdy.SpdyConnection;
import com.squareup.okhttp.internal.spdy.SpdyStream;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import okio.ByteString;
import okio.Okio;
import okio.Sink;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/http/SpdyTransport.class */
public final class SpdyTransport implements Transport {
    private static final List<ByteString> SPDY_3_PROHIBITED_HEADERS = Util.immutableList(ByteString.encodeUtf8("connection"), ByteString.encodeUtf8("host"), ByteString.encodeUtf8("keep-alive"), ByteString.encodeUtf8("proxy-connection"), ByteString.encodeUtf8("transfer-encoding"));
    private static final List<ByteString> HTTP_2_PROHIBITED_HEADERS = Util.immutableList(ByteString.encodeUtf8("connection"), ByteString.encodeUtf8("host"), ByteString.encodeUtf8("keep-alive"), ByteString.encodeUtf8("proxy-connection"), ByteString.encodeUtf8("te"), ByteString.encodeUtf8("transfer-encoding"), ByteString.encodeUtf8("encoding"), ByteString.encodeUtf8("upgrade"));
    private final HttpEngine httpEngine;
    private final SpdyConnection spdyConnection;
    private SpdyStream stream;

    public SpdyTransport(HttpEngine httpEngine, SpdyConnection spdyConnection) {
        this.httpEngine = httpEngine;
        this.spdyConnection = spdyConnection;
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public Sink createRequestBody(Request request, long contentLength) throws IOException {
        return this.stream.getSink();
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void writeRequestHeaders(Request request) throws IOException {
        if (this.stream != null) {
            return;
        }
        this.httpEngine.writingRequestHeaders();
        boolean permitsRequestBody = this.httpEngine.permitsRequestBody();
        String version = RequestLine.version(this.httpEngine.getConnection().getProtocol());
        this.stream = this.spdyConnection.newStream(writeNameValueBlock(request, this.spdyConnection.getProtocol(), version), permitsRequestBody, true);
        this.stream.readTimeout().timeout(this.httpEngine.client.getReadTimeout(), TimeUnit.MILLISECONDS);
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void writeRequestBody(RetryableSink requestBody) throws IOException {
        requestBody.writeToSocket(this.stream.getSink());
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void finishRequest() throws IOException {
        this.stream.getSink().close();
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public Response.Builder readResponseHeaders() throws IOException {
        return readNameValueBlock(this.stream.getResponseHeaders(), this.spdyConnection.getProtocol());
    }

    public static List<Header> writeNameValueBlock(Request request, Protocol protocol, String version) {
        Headers headers = request.headers();
        List<Header> result = new ArrayList<>(headers.size() + 10);
        result.add(new Header(Header.TARGET_METHOD, request.method()));
        result.add(new Header(Header.TARGET_PATH, RequestLine.requestPath(request.url())));
        String host = HttpEngine.hostHeader(request.url());
        if (Protocol.SPDY_3 == protocol) {
            result.add(new Header(Header.VERSION, version));
            result.add(new Header(Header.TARGET_HOST, host));
        } else if (Protocol.HTTP_2 == protocol) {
            result.add(new Header(Header.TARGET_AUTHORITY, host));
        } else {
            throw new AssertionError();
        }
        result.add(new Header(Header.TARGET_SCHEME, request.url().getProtocol()));
        Set<ByteString> names = new LinkedHashSet<>();
        int size = headers.size();
        for (int i = 0; i < size; i++) {
            ByteString name = ByteString.encodeUtf8(headers.name(i).toLowerCase(Locale.US));
            String value = headers.value(i);
            if (!isProhibitedHeader(protocol, name) && !name.equals(Header.TARGET_METHOD) && !name.equals(Header.TARGET_PATH) && !name.equals(Header.TARGET_SCHEME) && !name.equals(Header.TARGET_AUTHORITY) && !name.equals(Header.TARGET_HOST) && !name.equals(Header.VERSION)) {
                if (names.add(name)) {
                    result.add(new Header(name, value));
                } else {
                    int j = 0;
                    while (true) {
                        if (j >= result.size()) {
                            break;
                        }
                        if (!result.get(j).name.equals(name)) {
                            j++;
                        } else {
                            String concatenated = joinOnNull(result.get(j).value.utf8(), value);
                            result.set(j, new Header(name, concatenated));
                            break;
                        }
                    }
                }
            }
        }
        return result;
    }

    private static String joinOnNull(String first, String second) {
        return first + (char) 0 + second;
    }

    public static Response.Builder readNameValueBlock(List<Header> headerBlock, Protocol protocol) throws IOException {
        String status = null;
        String version = "HTTP/1.1";
        Headers.Builder headersBuilder = new Headers.Builder();
        headersBuilder.set(OkHeaders.SELECTED_PROTOCOL, protocol.toString());
        int size = headerBlock.size();
        for (int i = 0; i < size; i++) {
            ByteString name = headerBlock.get(i).name;
            String values = headerBlock.get(i).value.utf8();
            int i2 = 0;
            while (true) {
                int start = i2;
                if (start < values.length()) {
                    int end = values.indexOf(0, start);
                    if (end == -1) {
                        end = values.length();
                    }
                    String value = values.substring(start, end);
                    if (name.equals(Header.RESPONSE_STATUS)) {
                        status = value;
                    } else if (name.equals(Header.VERSION)) {
                        version = value;
                    } else if (!isProhibitedHeader(protocol, name)) {
                        headersBuilder.add(name.utf8(), value);
                    }
                    i2 = end + 1;
                }
            }
        }
        if (status == null) {
            throw new ProtocolException("Expected ':status' header not present");
        }
        StatusLine statusLine = StatusLine.parse(version + " " + status);
        return new Response.Builder().protocol(protocol).code(statusLine.code).message(statusLine.message).headers(headersBuilder.build());
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public ResponseBody openResponseBody(Response response) throws IOException {
        return new RealResponseBody(response.headers(), Okio.buffer(this.stream.getSource()));
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void releaseConnectionOnIdle() {
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public void disconnect(HttpEngine engine) throws IOException {
        if (this.stream != null) {
            this.stream.close(ErrorCode.CANCEL);
        }
    }

    @Override // com.squareup.okhttp.internal.http.Transport
    public boolean canReuseConnection() {
        return true;
    }

    private static boolean isProhibitedHeader(Protocol protocol, ByteString name) {
        if (protocol == Protocol.SPDY_3) {
            return SPDY_3_PROHIBITED_HEADERS.contains(name);
        }
        if (protocol == Protocol.HTTP_2) {
            return HTTP_2_PROHIBITED_HEADERS.contains(name);
        }
        throw new AssertionError(protocol);
    }
}
