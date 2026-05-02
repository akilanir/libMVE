package cz.msebera.android.httpclient.impl.pool;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.ThreadSafe;
import cz.msebera.android.httpclient.pool.PoolEntry;
import java.io.IOException;

@ThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/pool/BasicPoolEntry.class */
public class BasicPoolEntry extends PoolEntry<HttpHost, HttpClientConnection> {
    public BasicPoolEntry(String id, HttpHost route, HttpClientConnection conn) {
        super(id, route, conn);
    }

    @Override // cz.msebera.android.httpclient.pool.PoolEntry
    public void close() {
        try {
            getConnection().close();
        } catch (IOException e) {
        }
    }

    @Override // cz.msebera.android.httpclient.pool.PoolEntry
    public boolean isClosed() {
        return !getConnection().isOpen();
    }
}
