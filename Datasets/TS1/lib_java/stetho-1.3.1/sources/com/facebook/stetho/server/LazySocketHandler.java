package com.facebook.stetho.server;

import android.net.LocalSocket;
import java.io.IOException;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/LazySocketHandler.class */
public class LazySocketHandler implements SocketHandler {
    private final SocketHandlerFactory mSocketHandlerFactory;

    @Nullable
    private SocketHandler mSocketHandler;

    public LazySocketHandler(SocketHandlerFactory socketHandlerFactory) {
        this.mSocketHandlerFactory = socketHandlerFactory;
    }

    @Override // com.facebook.stetho.server.SocketHandler
    public void onAccepted(LocalSocket socket) throws IOException {
        getSocketHandler().onAccepted(socket);
    }

    @Nonnull
    private synchronized SocketHandler getSocketHandler() {
        if (this.mSocketHandler == null) {
            this.mSocketHandler = this.mSocketHandlerFactory.create();
        }
        return this.mSocketHandler;
    }
}
