package com.squareup.okhttp;

import java.io.IOException;
import java.net.Proxy;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/Authenticator.class */
public interface Authenticator {
    Request authenticate(Proxy proxy, Response response) throws IOException;

    Request authenticateProxy(Proxy proxy, Response response) throws IOException;
}
