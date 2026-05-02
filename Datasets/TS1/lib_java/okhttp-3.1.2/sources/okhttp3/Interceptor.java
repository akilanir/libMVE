package okhttp3;

import java.io.IOException;

/* loaded from: okhttp-3.1.2.jar:okhttp3/Interceptor.class */
public interface Interceptor {

    /* loaded from: okhttp-3.1.2.jar:okhttp3/Interceptor$Chain.class */
    public interface Chain {
        Request request();

        Response proceed(Request request) throws IOException;

        Connection connection();
    }

    Response intercept(Chain chain) throws IOException;
}
