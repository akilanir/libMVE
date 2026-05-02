package com.facebook.stetho.server;

import android.net.LocalSocket;
import java.io.IOException;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/SocketHandler.class */
public interface SocketHandler {
    void onAccepted(LocalSocket localSocket) throws IOException;
}
