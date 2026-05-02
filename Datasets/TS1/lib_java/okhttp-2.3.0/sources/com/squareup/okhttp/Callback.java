package com.squareup.okhttp;

import java.io.IOException;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/Callback.class */
public interface Callback {
    void onFailure(Request request, IOException iOException);

    void onResponse(Response response) throws IOException;
}
