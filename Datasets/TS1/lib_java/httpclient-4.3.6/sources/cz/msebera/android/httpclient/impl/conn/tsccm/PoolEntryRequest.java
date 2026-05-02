package cz.msebera.android.httpclient.impl.conn.tsccm;

import cz.msebera.android.httpclient.conn.ConnectionPoolTimeoutException;
import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/tsccm/PoolEntryRequest.class */
public interface PoolEntryRequest {
    BasicPoolEntry getPoolEntry(long j, TimeUnit timeUnit) throws InterruptedException, ConnectionPoolTimeoutException;

    void abortRequest();
}
