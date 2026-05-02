package com.jcraft.jsch;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

/* loaded from: jsch-0.1.51.jar:com/jcraft/jsch/SocketFactory.class */
public interface SocketFactory {
    Socket createSocket(String str, int i) throws IOException, UnknownHostException;

    InputStream getInputStream(Socket socket) throws IOException;

    OutputStream getOutputStream(Socket socket) throws IOException;
}
