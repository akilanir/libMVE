package com.facebook.stetho.server;

import java.io.IOException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/SocketLikeHandler.class */
public interface SocketLikeHandler {
    void onAccepted(SocketLike socketLike) throws IOException;
}
