package retrofit;

import java.io.IOException;

/* loaded from: retrofit-2.0.0-beta2.jar:retrofit/Call.class */
public interface Call<T> extends Cloneable {
    Response<T> execute() throws IOException;

    void enqueue(Callback<T> callback);

    void cancel();

    /* renamed from: clone */
    Call<T> m2clone();
}
