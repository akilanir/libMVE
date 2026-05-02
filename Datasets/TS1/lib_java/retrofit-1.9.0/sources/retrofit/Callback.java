package retrofit;

import retrofit.client.Response;

/* loaded from: retrofit-1.9.0.jar:retrofit/Callback.class */
public interface Callback<T> {
    void success(T t, Response response);

    void failure(RetrofitError retrofitError);
}
