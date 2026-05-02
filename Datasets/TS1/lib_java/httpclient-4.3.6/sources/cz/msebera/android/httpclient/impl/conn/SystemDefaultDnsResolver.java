package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.conn.DnsResolver;
import java.net.InetAddress;
import java.net.UnknownHostException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/SystemDefaultDnsResolver.class */
public class SystemDefaultDnsResolver implements DnsResolver {
    public static final SystemDefaultDnsResolver INSTANCE = new SystemDefaultDnsResolver();

    @Override // cz.msebera.android.httpclient.conn.DnsResolver
    public InetAddress[] resolve(String host) throws UnknownHostException {
        return InetAddress.getAllByName(host);
    }
}
