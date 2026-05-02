package com.koushikdutta.async;

import com.koushikdutta.async.callback.DataCallback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/LineEmitter.class */
public class LineEmitter implements DataCallback {
    StringBuilder data = new StringBuilder();
    StringCallback mLineCallback;
    static final /* synthetic */ boolean $assertionsDisabled;

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/LineEmitter$StringCallback.class */
    public interface StringCallback {
        void onStringAvailable(String str);
    }

    static {
        $assertionsDisabled = !LineEmitter.class.desiredAssertionStatus();
    }

    public void setLineCallback(StringCallback callback) {
        this.mLineCallback = callback;
    }

    public StringCallback getLineCallback() {
        return this.mLineCallback;
    }

    @Override // com.koushikdutta.async.callback.DataCallback
    public void onDataAvailable(DataEmitter emitter, ByteBufferList bb) {
        while (bb.remaining() > 0) {
            byte b = bb.get();
            if (b == 10) {
                if (!$assertionsDisabled && this.mLineCallback == null) {
                    throw new AssertionError();
                }
                this.mLineCallback.onStringAvailable(this.data.toString());
                this.data = new StringBuilder();
                return;
            }
            this.data.append((char) b);
        }
    }
}
