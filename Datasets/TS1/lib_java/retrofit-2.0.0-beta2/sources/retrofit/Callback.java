package retrofit;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Callback.class */
public interface Callback<T> {
    void onResponse(Response<T> response, Retrofit retrofit2);

    void onFailure(Throwable th);
}
