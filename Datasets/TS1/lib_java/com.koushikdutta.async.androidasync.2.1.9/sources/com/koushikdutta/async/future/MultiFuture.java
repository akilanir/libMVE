package com.koushikdutta.async.future;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/future/MultiFuture.class */
public class MultiFuture<T> extends SimpleFuture<T> {
    ArrayList<FutureCallback<T>> callbacks;
    final FutureCallback<T> callback = new FutureCallback<T>() { // from class: com.koushikdutta.async.future.MultiFuture.1
        @Override // com.koushikdutta.async.future.FutureCallback
        public void onCompleted(Exception e, T result) {
            ArrayList<FutureCallback<T>> callbacks;
            synchronized (MultiFuture.this) {
                callbacks = MultiFuture.this.callbacks;
                MultiFuture.this.callbacks = null;
            }
            if (callbacks == null) {
                return;
            }
            Iterator i$ = callbacks.iterator();
            while (i$.hasNext()) {
                FutureCallback<T> cb = i$.next();
                cb.onCompleted(e, result);
            }
        }
    };

    @Override // com.koushikdutta.async.future.SimpleFuture, com.koushikdutta.async.future.Future
    public MultiFuture<T> setCallback(FutureCallback<T> callback) {
        synchronized (this) {
            if (this.callbacks == null) {
                this.callbacks = new ArrayList<>();
            }
            this.callbacks.add(callback);
        }
        super.setCallback((FutureCallback) this.callback);
        return this;
    }
}
