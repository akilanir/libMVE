package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import java.io.IOException;
import okio.Sink;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/http/HttpStream.class */
public interface HttpStream {
    public static final int DISCARD_STREAM_TIMEOUT_MILLIS = 100;

    Sink createRequestBody(Request request, long j) throws IOException;

    void writeRequestHeaders(Request request) throws IOException;

    void writeRequestBody(RetryableSink retryableSink) throws IOException;

    void finishRequest() throws IOException;

    Response.Builder readResponseHeaders() throws IOException;

    ResponseBody openResponseBody(Response response) throws IOException;

    void setHttpEngine(HttpEngine httpEngine);

    void cancel();
}
