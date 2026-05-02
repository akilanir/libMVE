package com.facebook.stetho.websocket;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/websocket/WriteHandler.class */
class WriteHandler {
    private final BufferedOutputStream mBufferedOutput;

    public WriteHandler(OutputStream rawSocketOutput) {
        this.mBufferedOutput = new BufferedOutputStream(rawSocketOutput, 1024);
    }

    public synchronized void write(Frame frame, WriteCallback callback) {
        try {
            frame.writeTo(this.mBufferedOutput);
            this.mBufferedOutput.flush();
            callback.onSuccess();
        } catch (IOException e) {
            callback.onFailure(e);
        }
    }
}
