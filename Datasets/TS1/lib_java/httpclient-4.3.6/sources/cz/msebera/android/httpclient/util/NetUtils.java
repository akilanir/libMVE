package cz.msebera.android.httpclient.util;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.SocketAddress;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/util/NetUtils.class */
public final class NetUtils {
    public static void formatAddress(StringBuilder buffer, SocketAddress socketAddress) {
        Args.notNull(buffer, "Buffer");
        Args.notNull(socketAddress, "Socket address");
        if (socketAddress instanceof InetSocketAddress) {
            InetSocketAddress socketaddr = (InetSocketAddress) socketAddress;
            InetAddress inetaddr = socketaddr.getAddress();
            buffer.append((Object) (inetaddr != null ? inetaddr.getHostAddress() : inetaddr)).append(':').append(socketaddr.getPort());
            return;
        }
        buffer.append(socketAddress);
    }
}
