package com.koushikdutta.async.callback;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/CompletedCallback.class */
public interface CompletedCallback {
    void onCompleted(Exception exc);

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/CompletedCallback$NullCompletedCallback.class */
    public static class NullCompletedCallback implements CompletedCallback {
        @Override // com.koushikdutta.async.callback.CompletedCallback
        public void onCompleted(Exception ex) {
        }
    }
}
