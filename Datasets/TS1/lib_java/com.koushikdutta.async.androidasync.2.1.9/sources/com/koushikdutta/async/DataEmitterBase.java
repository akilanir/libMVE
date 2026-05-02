package com.koushikdutta.async;

import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.callback.DataCallback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/DataEmitterBase.class */
public abstract class DataEmitterBase implements DataEmitter {
    private boolean ended;
    CompletedCallback endCallback;
    DataCallback mDataCallback;

    protected void report(Exception e) {
        if (this.ended) {
            return;
        }
        this.ended = true;
        if (getEndCallback() != null) {
            getEndCallback().onCompleted(e);
        }
    }

    @Override // com.koushikdutta.async.DataEmitter
    public final void setEndCallback(CompletedCallback callback) {
        this.endCallback = callback;
    }

    @Override // com.koushikdutta.async.DataEmitter
    public final CompletedCallback getEndCallback() {
        return this.endCallback;
    }

    @Override // com.koushikdutta.async.DataEmitter
    public void setDataCallback(DataCallback callback) {
        this.mDataCallback = callback;
    }

    @Override // com.koushikdutta.async.DataEmitter
    public DataCallback getDataCallback() {
        return this.mDataCallback;
    }

    @Override // com.koushikdutta.async.DataEmitter
    public String charset() {
        return null;
    }
}
