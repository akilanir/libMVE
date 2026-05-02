package com.koushikdutta.async.callback;

import com.koushikdutta.async.future.Continuation;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/callback/ContinuationCallback.class */
public interface ContinuationCallback {
    void onContinue(Continuation continuation, CompletedCallback completedCallback) throws Exception;
}
