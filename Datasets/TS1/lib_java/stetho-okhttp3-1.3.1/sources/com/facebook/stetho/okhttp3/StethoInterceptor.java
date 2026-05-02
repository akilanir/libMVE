package com.facebook.stetho.okhttp3;

import com.facebook.stetho.inspector.network.DefaultResponseHandler;
import com.facebook.stetho.inspector.network.NetworkEventReporter;
import com.facebook.stetho.inspector.network.NetworkEventReporterImpl;
import com.facebook.stetho.inspector.network.RequestBodyHelper;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;
import okhttp3.Connection;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;

/* loaded from: stetho-okhttp3-1.3.1.jar:com/facebook/stetho/okhttp3/StethoInterceptor.class */
public class StethoInterceptor implements Interceptor {
    private final NetworkEventReporter mEventReporter = NetworkEventReporterImpl.get();
    private final AtomicInteger mNextRequestId = new AtomicInteger(0);

    public Response intercept(Interceptor.Chain chain) throws IOException {
        String requestId = String.valueOf(this.mNextRequestId.getAndIncrement());
        Request request = chain.request();
        RequestBodyHelper requestBodyHelper = null;
        if (this.mEventReporter.isEnabled()) {
            requestBodyHelper = new RequestBodyHelper(this.mEventReporter, requestId);
            OkHttpInspectorRequest inspectorRequest = new OkHttpInspectorRequest(requestId, request, requestBodyHelper);
            this.mEventReporter.requestWillBeSent(inspectorRequest);
        }
        try {
            Response response = chain.proceed(request);
            if (this.mEventReporter.isEnabled()) {
                if (requestBodyHelper != null && requestBodyHelper.hasBody()) {
                    requestBodyHelper.reportDataSent();
                }
                Connection connection = chain.connection();
                this.mEventReporter.responseHeadersReceived(new OkHttpInspectorResponse(requestId, request, response, connection));
                ResponseBody body = response.body();
                MediaType contentType = null;
                InputStream responseStream = null;
                if (body != null) {
                    contentType = body.contentType();
                    responseStream = body.byteStream();
                }
                InputStream responseStream2 = this.mEventReporter.interpretResponseStream(requestId, contentType != null ? contentType.toString() : null, response.header("Content-Encoding"), responseStream, new DefaultResponseHandler(this.mEventReporter, requestId));
                if (responseStream2 != null) {
                    response = response.newBuilder().body(new ForwardingResponseBody(body, responseStream2)).build();
                }
            }
            return response;
        } catch (IOException e) {
            if (this.mEventReporter.isEnabled()) {
                this.mEventReporter.httpExchangeFailed(requestId, e.toString());
            }
            throw e;
        }
    }

    /* loaded from: stetho-okhttp3-1.3.1.jar:com/facebook/stetho/okhttp3/StethoInterceptor$OkHttpInspectorRequest.class */
    private static class OkHttpInspectorRequest implements NetworkEventReporter.InspectorRequest {
        private final String mRequestId;
        private final Request mRequest;
        private RequestBodyHelper mRequestBodyHelper;

        public OkHttpInspectorRequest(String requestId, Request request, RequestBodyHelper requestBodyHelper) {
            this.mRequestId = requestId;
            this.mRequest = request;
            this.mRequestBodyHelper = requestBodyHelper;
        }

        public String id() {
            return this.mRequestId;
        }

        public String friendlyName() {
            return null;
        }

        @Nullable
        public Integer friendlyNameExtra() {
            return null;
        }

        public String url() {
            return this.mRequest.url().toString();
        }

        public String method() {
            return this.mRequest.method();
        }

        @Nullable
        public byte[] body() throws IOException {
            RequestBody body = this.mRequest.body();
            if (body == null) {
                return null;
            }
            OutputStream out = this.mRequestBodyHelper.createBodySink(firstHeaderValue("Content-Encoding"));
            BufferedSink bufferedSink = Okio.buffer(Okio.sink(out));
            try {
                body.writeTo(bufferedSink);
                bufferedSink.close();
                return this.mRequestBodyHelper.getDisplayBody();
            } catch (Throwable th) {
                bufferedSink.close();
                throw th;
            }
        }

        public int headerCount() {
            return this.mRequest.headers().size();
        }

        public String headerName(int index) {
            return this.mRequest.headers().name(index);
        }

        public String headerValue(int index) {
            return this.mRequest.headers().value(index);
        }

        @Nullable
        public String firstHeaderValue(String name) {
            return this.mRequest.header(name);
        }
    }

    /* loaded from: stetho-okhttp3-1.3.1.jar:com/facebook/stetho/okhttp3/StethoInterceptor$OkHttpInspectorResponse.class */
    private static class OkHttpInspectorResponse implements NetworkEventReporter.InspectorResponse {
        private final String mRequestId;
        private final Request mRequest;
        private final Response mResponse;
        private final Connection mConnection;

        public OkHttpInspectorResponse(String requestId, Request request, Response response, Connection connection) {
            this.mRequestId = requestId;
            this.mRequest = request;
            this.mResponse = response;
            this.mConnection = connection;
        }

        public String requestId() {
            return this.mRequestId;
        }

        public String url() {
            return this.mRequest.url().toString();
        }

        public int statusCode() {
            return this.mResponse.code();
        }

        public String reasonPhrase() {
            return this.mResponse.message();
        }

        public boolean connectionReused() {
            return false;
        }

        public int connectionId() {
            return this.mConnection.hashCode();
        }

        public boolean fromDiskCache() {
            return this.mResponse.cacheResponse() != null;
        }

        public int headerCount() {
            return this.mResponse.headers().size();
        }

        public String headerName(int index) {
            return this.mResponse.headers().name(index);
        }

        public String headerValue(int index) {
            return this.mResponse.headers().value(index);
        }

        @Nullable
        public String firstHeaderValue(String name) {
            return this.mResponse.header(name);
        }
    }

    /* loaded from: stetho-okhttp3-1.3.1.jar:com/facebook/stetho/okhttp3/StethoInterceptor$ForwardingResponseBody.class */
    private static class ForwardingResponseBody extends ResponseBody {
        private final ResponseBody mBody;
        private final BufferedSource mInterceptedSource;

        public ForwardingResponseBody(ResponseBody body, InputStream interceptedStream) {
            this.mBody = body;
            this.mInterceptedSource = Okio.buffer(Okio.source(interceptedStream));
        }

        public MediaType contentType() {
            return this.mBody.contentType();
        }

        public long contentLength() {
            return this.mBody.contentLength();
        }

        public BufferedSource source() {
            return this.mInterceptedSource;
        }
    }
}
