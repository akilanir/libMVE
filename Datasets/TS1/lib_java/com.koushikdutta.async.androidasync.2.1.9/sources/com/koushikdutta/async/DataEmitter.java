package com.koushikdutta.async;

import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.DataCallback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/DataEmitter.class */
public interface DataEmitter {
    void setDataCallback(DataCallback dataCallback);

    DataCallback getDataCallback();

    boolean isChunked();

    void pause();

    void resume();

    void close();

    boolean isPaused();

    void setEndCallback(CompletedCallback completedCallback);

    CompletedCallback getEndCallback();

    AsyncServer getServer();

    String charset();
}
