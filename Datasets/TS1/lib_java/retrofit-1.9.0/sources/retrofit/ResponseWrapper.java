package retrofit;

import retrofit.client.Response;

/* loaded from: retrofit-1.9.0.jar:retrofit/ResponseWrapper.class */
final class ResponseWrapper {
    final Response response;
    final Object responseBody;

    ResponseWrapper(Response response, Object responseBody) {
        this.response = response;
        this.responseBody = responseBody;
    }
}
