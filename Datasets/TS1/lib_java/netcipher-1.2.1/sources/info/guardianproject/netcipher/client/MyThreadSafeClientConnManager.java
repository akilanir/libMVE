package info.guardianproject.netcipher.client;

import ch.boye.httpclientandroidlib.conn.ClientConnectionOperator;
import ch.boye.httpclientandroidlib.conn.scheme.SchemeRegistry;
import ch.boye.httpclientandroidlib.impl.conn.tsccm.ThreadSafeClientConnManager;
import ch.boye.httpclientandroidlib.params.HttpParams;

/* loaded from: netcipher-1.2.1.jar:info/guardianproject/netcipher/client/MyThreadSafeClientConnManager.class */
public class MyThreadSafeClientConnManager extends ThreadSafeClientConnManager {
    public MyThreadSafeClientConnManager(HttpParams params, SchemeRegistry schreg) {
        super(params, schreg);
    }

    protected ClientConnectionOperator createConnectionOperator(SchemeRegistry schreg) {
        return new MyDefaultClientConnectionOperator(schreg);
    }
}
