package com.koushikdutta.async.callback;

import com.koushikdutta.async.AsyncSocket;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/ConnectCallback.class */
public interface ConnectCallback {
    void onConnectCompleted(Exception exc, AsyncSocket asyncSocket);
}
