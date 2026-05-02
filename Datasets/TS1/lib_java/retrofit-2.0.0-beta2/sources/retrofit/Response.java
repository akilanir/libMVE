package retrofit;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Response.class */
public final class Response<T> {
    private final com.squareup.okhttp.Response rawResponse;
    private final T body;
    private final ResponseBody errorBody;

    public static <T> Response<T> success(T body) {
        return success(body, new Response.Builder().code(200).protocol(Protocol.HTTP_1_1).request(new Request.Builder().url(HttpUrl.parse("http://localhost")).build()).build());
    }

    public static <T> Response<T> success(T body, com.squareup.okhttp.Response rawResponse) {
        return new Response<>(rawResponse, body, null);
    }

    public static <T> Response<T> error(int code, ResponseBody body) {
        return error(body, new Response.Builder().code(code).protocol(Protocol.HTTP_1_1).request(new Request.Builder().url(HttpUrl.parse("http://localhost")).build()).build());
    }

    public static <T> Response<T> error(ResponseBody body, com.squareup.okhttp.Response rawResponse) {
        return new Response<>(rawResponse, null, body);
    }

    private Response(com.squareup.okhttp.Response rawResponse, T body, ResponseBody errorBody) {
        this.rawResponse = (com.squareup.okhttp.Response) Utils.checkNotNull(rawResponse, "rawResponse == null");
        this.body = body;
        this.errorBody = errorBody;
    }

    public com.squareup.okhttp.Response raw() {
        return this.rawResponse;
    }

    public int code() {
        return this.rawResponse.code();
    }

    public String message() {
        return this.rawResponse.message();
    }

    public Headers headers() {
        return this.rawResponse.headers();
    }

    public boolean isSuccess() {
        return this.rawResponse.isSuccessful();
    }

    public T body() {
        return this.body;
    }

    public ResponseBody errorBody() {
        return this.errorBody;
    }
}
