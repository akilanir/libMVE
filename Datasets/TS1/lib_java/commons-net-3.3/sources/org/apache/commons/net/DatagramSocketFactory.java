package org.apache.commons.net;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/DatagramSocketFactory.class */
public interface DatagramSocketFactory {
    DatagramSocket createDatagramSocket() throws SocketException;

    DatagramSocket createDatagramSocket(int i) throws SocketException;

    DatagramSocket createDatagramSocket(int i, InetAddress inetAddress) throws SocketException;
}
