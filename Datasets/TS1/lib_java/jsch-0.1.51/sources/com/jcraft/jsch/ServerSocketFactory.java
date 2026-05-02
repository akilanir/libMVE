package com.jcraft.jsch;

import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/ServerSocketFactory.class */
public interface ServerSocketFactory {
    ServerSocket createServerSocket(int i, int i2, InetAddress inetAddress) throws IOException;
}
