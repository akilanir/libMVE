package com.squareup.okhttp;

import java.io.IOException;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Interceptor.class */
public interface Interceptor {

    /* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Interceptor$Chain.class */
    public interface Chain {
        Request request();

        Response proceed(Request request) throws IOException;

        Connection connection();
    }

    Response intercept(Chain chain) throws IOException;
}
