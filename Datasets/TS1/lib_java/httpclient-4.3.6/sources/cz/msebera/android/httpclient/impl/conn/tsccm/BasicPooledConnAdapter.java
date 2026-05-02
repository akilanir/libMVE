package cz.msebera.android.httpclient.impl.conn.tsccm;

import cz.msebera.android.httpclient.conn.ClientConnectionManager;
import cz.msebera.android.httpclient.impl.conn.AbstractPoolEntry;
import cz.msebera.android.httpclient.impl.conn.AbstractPooledConnAdapter;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/tsccm/BasicPooledConnAdapter.class */
public class BasicPooledConnAdapter extends AbstractPooledConnAdapter {
    protected BasicPooledConnAdapter(ThreadSafeClientConnManager tsccm, AbstractPoolEntry entry) {
        super(tsccm, entry);
        markReusable();
    }

    @Override // cz.msebera.android.httpclient.impl.conn.AbstractClientConnAdapter
    protected ClientConnectionManager getManager() {
        return super.getManager();
    }

    @Override // cz.msebera.android.httpclient.impl.conn.AbstractPooledConnAdapter
    protected AbstractPoolEntry getPoolEntry() {
        return super.getPoolEntry();
    }

    @Override // cz.msebera.android.httpclient.impl.conn.AbstractPooledConnAdapter, cz.msebera.android.httpclient.impl.conn.AbstractClientConnAdapter
    protected void detach() {
        super.detach();
    }
}
