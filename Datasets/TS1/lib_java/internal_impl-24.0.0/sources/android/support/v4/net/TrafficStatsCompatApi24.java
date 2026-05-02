package android.support.v4.net;

import android.net.TrafficStats;
import java.net.DatagramSocket;
import java.net.SocketException;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/net/TrafficStatsCompatApi24.class */
public class TrafficStatsCompatApi24 {
    public static void tagDatagramSocket(DatagramSocket socket) throws SocketException {
        TrafficStats.tagDatagramSocket(socket);
    }

    public static void untagDatagramSocket(DatagramSocket socket) throws SocketException {
        TrafficStats.untagDatagramSocket(socket);
    }
}
