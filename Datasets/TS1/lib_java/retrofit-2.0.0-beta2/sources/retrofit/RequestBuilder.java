package retrofit;

import com.squareup.okhttp.FormEncodingBuilder;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.MultipartBuilder;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import java.io.IOException;
import okio.Buffer;
import okio.BufferedSink;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilder.class */
final class RequestBuilder {
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    private static final String PATH_SEGMENT_ENCODE_SET = " \"<>^`{}|/\\?#";
    private final String method;
    private final HttpUrl baseUrl;
    private String relativeUrl;
    private HttpUrl.Builder urlBuilder;
    private final Request.Builder requestBuilder = new Request.Builder();
    private MediaType contentType;
    private final boolean hasBody;
    private MultipartBuilder multipartBuilder;
    private FormEncodingBuilder formEncodingBuilder;
    private RequestBody body;

    RequestBuilder(String method, HttpUrl baseUrl, String relativeUrl, Headers headers, MediaType contentType, boolean hasBody, boolean isFormEncoded, boolean isMultipart) {
        this.method = method;
        this.baseUrl = baseUrl;
        this.relativeUrl = relativeUrl;
        this.contentType = contentType;
        this.hasBody = hasBody;
        if (headers != null) {
            this.requestBuilder.headers(headers);
        }
        if (isFormEncoded) {
            this.formEncodingBuilder = new FormEncodingBuilder();
        } else if (isMultipart) {
            this.multipartBuilder = new MultipartBuilder();
            this.multipartBuilder.type(MultipartBuilder.FORM);
        }
    }

    void setRelativeUrl(String relativeUrl) {
        this.relativeUrl = relativeUrl;
    }

    void addHeader(String name, String value) {
        if ("Content-Type".equalsIgnoreCase(name)) {
            this.contentType = MediaType.parse(value);
        } else {
            this.requestBuilder.addHeader(name, value);
        }
    }

    void addPathParam(String name, String value, boolean encoded) {
        if (this.relativeUrl == null) {
            throw new AssertionError();
        }
        this.relativeUrl = this.relativeUrl.replace("{" + name + "}", canonicalize(value, encoded));
    }

    static String canonicalize(String input, boolean alreadyEncoded) {
        int i = 0;
        int limit = input.length();
        while (i < limit) {
            int codePoint = input.codePointAt(i);
            if (codePoint >= 32 && codePoint < 127 && PATH_SEGMENT_ENCODE_SET.indexOf(codePoint) == -1 && (codePoint != 37 || alreadyEncoded)) {
                i += Character.charCount(codePoint);
            } else {
                Buffer out = new Buffer();
                out.writeUtf8(input, 0, i);
                canonicalize(out, input, i, limit, alreadyEncoded);
                return out.readUtf8();
            }
        }
        return input;
    }

    static void canonicalize(Buffer out, String input, int pos, int limit, boolean alreadyEncoded) {
        Buffer utf8Buffer = null;
        int i = pos;
        while (true) {
            int i2 = i;
            if (i2 < limit) {
                int codePoint = input.codePointAt(i2);
                if (!alreadyEncoded || (codePoint != 9 && codePoint != 10 && codePoint != 12 && codePoint != 13)) {
                    if (codePoint < 32 || codePoint >= 127 || PATH_SEGMENT_ENCODE_SET.indexOf(codePoint) != -1 || (codePoint == 37 && !alreadyEncoded)) {
                        if (utf8Buffer == null) {
                            utf8Buffer = new Buffer();
                        }
                        utf8Buffer.writeUtf8CodePoint(codePoint);
                        while (!utf8Buffer.exhausted()) {
                            int b = utf8Buffer.readByte() & 255;
                            out.writeByte(37);
                            out.writeByte(HEX_DIGITS[(b >> 4) & 15]);
                            out.writeByte(HEX_DIGITS[b & 15]);
                        }
                    } else {
                        out.writeUtf8CodePoint(codePoint);
                    }
                }
                i = i2 + Character.charCount(codePoint);
            } else {
                return;
            }
        }
    }

    void addQueryParam(String name, String value, boolean encoded) {
        if (this.relativeUrl != null) {
            this.urlBuilder = this.baseUrl.resolve(this.relativeUrl).newBuilder();
            this.relativeUrl = null;
        }
        if (encoded) {
            this.urlBuilder.addEncodedQueryParameter(name, value);
        } else {
            this.urlBuilder.addQueryParameter(name, value);
        }
    }

    void addFormField(String name, String value, boolean encoded) {
        if (encoded) {
            this.formEncodingBuilder.addEncoded(name, value);
        } else {
            this.formEncodingBuilder.add(name, value);
        }
    }

    void addPart(Headers headers, RequestBody body) {
        this.multipartBuilder.addPart(headers, body);
    }

    void setBody(RequestBody body) {
        this.body = body;
    }

    Request build() {
        HttpUrl url;
        HttpUrl.Builder urlBuilder = this.urlBuilder;
        if (urlBuilder != null) {
            url = urlBuilder.build();
        } else {
            url = this.baseUrl.resolve(this.relativeUrl);
        }
        RequestBody body = this.body;
        if (body == null) {
            if (this.formEncodingBuilder != null) {
                body = this.formEncodingBuilder.build();
            } else if (this.multipartBuilder != null) {
                body = this.multipartBuilder.build();
            } else if (this.hasBody) {
                body = RequestBody.create((MediaType) null, new byte[0]);
            }
        }
        MediaType contentType = this.contentType;
        if (contentType != null) {
            if (body != null) {
                body = new ContentTypeOverridingRequestBody(body, contentType);
            } else {
                this.requestBuilder.addHeader("Content-Type", contentType.toString());
            }
        }
        return this.requestBuilder.url(url).method(this.method, body).build();
    }

    /* loaded from: retrofit-2.0.0-beta2.jar:retrofit/RequestBuilder$ContentTypeOverridingRequestBody.class */
    private static class ContentTypeOverridingRequestBody extends RequestBody {
        private final RequestBody delegate;
        private final MediaType contentType;

        ContentTypeOverridingRequestBody(RequestBody delegate, MediaType contentType) {
            this.delegate = delegate;
            this.contentType = contentType;
        }

        public MediaType contentType() {
            return this.contentType;
        }

        public long contentLength() throws IOException {
            return this.delegate.contentLength();
        }

        public void writeTo(BufferedSink sink) throws IOException {
            this.delegate.writeTo(sink);
        }
    }
}
