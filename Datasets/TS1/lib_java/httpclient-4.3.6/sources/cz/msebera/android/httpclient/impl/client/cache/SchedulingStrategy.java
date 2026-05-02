package cz.msebera.android.httpclient.impl.client.cache;

import java.io.Closeable;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/SchedulingStrategy.class */
public interface SchedulingStrategy extends Closeable {
    void schedule(AsynchronousValidationRequest asynchronousValidationRequest);
}
