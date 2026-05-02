package com.koushikdutta.async.callback;

import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.DataEmitter;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/DataCallback.class */
public interface DataCallback {
    void onDataAvailable(DataEmitter dataEmitter, ByteBufferList byteBufferList);

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/DataCallback$NullDataCallback.class */
    public static class NullDataCallback implements DataCallback {
        @Override // com.koushikdutta.async.callback.DataCallback
        public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
            bb.recycle();
        }
    }
}
