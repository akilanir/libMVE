package cz.msebera.android.httpclient.conn.scheme;

import java.io.IOException;
import java.net.InetAddress;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/HostNameResolver.class */
public interface HostNameResolver {
    InetAddress resolve(String str) throws IOException;
}
