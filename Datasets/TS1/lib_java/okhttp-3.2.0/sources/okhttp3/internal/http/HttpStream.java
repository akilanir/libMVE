package okhttp3.internal.http;

import java.io.IOException;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Sink;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/http/HttpStream.class */
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
