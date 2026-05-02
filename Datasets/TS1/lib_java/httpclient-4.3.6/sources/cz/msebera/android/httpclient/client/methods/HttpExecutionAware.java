package cz.msebera.android.httpclient.client.methods;

import cz.msebera.android.httpclient.concurrent.Cancellable;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/methods/HttpExecutionAware.class */
public interface HttpExecutionAware {
    boolean isAborted();

    void setCancellable(Cancellable cancellable);
}
