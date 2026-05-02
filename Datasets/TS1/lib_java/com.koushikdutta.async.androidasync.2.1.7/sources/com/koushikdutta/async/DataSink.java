package com.koushikdutta.async;

import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.WritableCallback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/DataSink.class */
public interface DataSink {
    void write(ByteBufferList byteBufferList);

    void setWriteableCallback(WritableCallback writableCallback);

    WritableCallback getWriteableCallback();

    boolean isOpen();

    void end();

    void setClosedCallback(CompletedCallback completedCallback);

    CompletedCallback getClosedCallback();

    AsyncServer getServer();
}
