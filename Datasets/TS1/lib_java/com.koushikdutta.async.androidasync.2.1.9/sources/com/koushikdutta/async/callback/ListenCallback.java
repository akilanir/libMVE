package com.koushikdutta.async.callback;

import com.koushikdutta.async.AsyncServerSocket;
import com.koushikdutta.async.AsyncSocket;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/callback/ListenCallback.class */
public interface ListenCallback extends CompletedCallback {
    void onAccepted(AsyncSocket asyncSocket);

    void onListening(AsyncServerSocket asyncServerSocket);
}
