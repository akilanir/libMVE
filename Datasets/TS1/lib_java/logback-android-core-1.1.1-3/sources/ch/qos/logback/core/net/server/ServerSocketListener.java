package ch.qos.logback.core.net.server;

import ch.qos.logback.core.net.server.Client;
import ch.qos.logback.core.util.CloseUtil;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/ServerSocketListener.class */
public abstract class ServerSocketListener<T extends Client> implements ServerListener<T> {
    private final ServerSocket serverSocket;

    public ServerSocketListener(ServerSocket serverSocket) {
        this.serverSocket = serverSocket;
    }

    @Override // ch.qos.logback.core.net.server.ServerListener
    public T acceptClient() throws IOException {
        Socket accept = this.serverSocket.accept();
        return (T) createClient(socketAddressToString(accept.getRemoteSocketAddress()), accept);
    }

    protected abstract T createClient(String str, Socket socket) throws IOException;

    @Override // ch.qos.logback.core.net.server.ServerListener, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        CloseUtil.closeQuietly(this.serverSocket);
    }

    public String toString() {
        return socketAddressToString(this.serverSocket.getLocalSocketAddress());
    }

    private String socketAddressToString(SocketAddress socketAddress) {
        String obj = socketAddress.toString();
        int indexOf = obj.indexOf("/");
        if (indexOf >= 0) {
            obj = obj.substring(indexOf + 1);
        }
        return obj;
    }
}
