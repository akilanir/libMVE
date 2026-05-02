package com.facebook.stetho.server;

import android.net.LocalSocket;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/server/SocketLike.class */
public class SocketLike {
    private final LocalSocket mSocket;
    private final LeakyBufferedInputStream mLeakyInput;

    public SocketLike(SocketLike socketLike, LeakyBufferedInputStream leakyInput) {
        this(socketLike.mSocket, leakyInput);
    }

    public SocketLike(LocalSocket socket, LeakyBufferedInputStream leakyInput) {
        this.mSocket = socket;
        this.mLeakyInput = leakyInput;
    }

    public InputStream getInput() throws IOException {
        return this.mLeakyInput.leakBufferAndStream();
    }

    public OutputStream getOutput() throws IOException {
        return this.mSocket.getOutputStream();
    }
}
