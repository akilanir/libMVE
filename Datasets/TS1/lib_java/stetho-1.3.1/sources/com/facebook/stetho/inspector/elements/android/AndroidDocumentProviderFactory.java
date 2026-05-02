package com.facebook.stetho.inspector.elements.android;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import com.facebook.stetho.common.ThreadBound;
import com.facebook.stetho.common.UncheckedCallable;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.common.android.HandlerUtil;
import com.facebook.stetho.inspector.elements.DocumentProvider;
import com.facebook.stetho.inspector.elements.DocumentProviderFactory;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/AndroidDocumentProviderFactory.class */
public final class AndroidDocumentProviderFactory implements DocumentProviderFactory, ThreadBound {
    private final Application mApplication;
    private final Handler mHandler = new Handler(Looper.getMainLooper());

    public AndroidDocumentProviderFactory(Application application) {
        this.mApplication = (Application) Util.throwIfNull(application);
    }

    @Override // com.facebook.stetho.inspector.elements.DocumentProviderFactory
    public DocumentProvider create() {
        return new AndroidDocumentProvider(this.mApplication, this);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public boolean checkThreadAccess() {
        return HandlerUtil.checkThreadAccess(this.mHandler);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public void verifyThreadAccess() {
        HandlerUtil.verifyThreadAccess(this.mHandler);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public <V> V postAndWait(UncheckedCallable<V> uncheckedCallable) {
        return (V) HandlerUtil.postAndWait(this.mHandler, uncheckedCallable);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public void postAndWait(Runnable r) {
        HandlerUtil.postAndWait(this.mHandler, r);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public void postDelayed(Runnable r, long delayMillis) {
        if (!this.mHandler.postDelayed(r, delayMillis)) {
            throw new RuntimeException("Handler.postDelayed() returned false");
        }
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public void removeCallbacks(Runnable r) {
        this.mHandler.removeCallbacks(r);
    }
}
