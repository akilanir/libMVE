package cz.msebera.android.httpclient.conn;

import java.net.InetAddress;
import java.net.UnknownHostException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/DnsResolver.class */
public interface DnsResolver {
    InetAddress[] resolve(String str) throws UnknownHostException;
}
