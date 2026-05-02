package com.jcraft.jsch;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/Proxy.class */
public interface Proxy {
    void connect(SocketFactory socketFactory, String str, int i, int i2) throws Exception;

    InputStream getInputStream();

    OutputStream getOutputStream();

    Socket getSocket();

    void close();
}
