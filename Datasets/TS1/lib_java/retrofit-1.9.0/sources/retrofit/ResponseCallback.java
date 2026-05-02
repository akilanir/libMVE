package retrofit;

import retrofit.client.Response;

/* loaded from: retrofit-1.9.0.jar:retrofit/ResponseCallback.class */
public abstract class ResponseCallback implements Callback<Response> {
    public abstract void success(Response response);

    @Override // retrofit.Callback
    public void success(Response response, Response response2) {
        success(response);
    }
}
