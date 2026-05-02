package ch.qos.logback.classic.net.server;

import ch.qos.logback.classic.net.ReceiverBase;
import ch.qos.logback.core.net.server.ServerListener;
import ch.qos.logback.core.net.server.ServerRunner;
import ch.qos.logback.core.util.CloseUtil;
import java.io.IOException;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.UnknownHostException;
import java.util.concurrent.Executor;
import javax.net.ServerSocketFactory;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/ServerSocketReceiver.class */
public class ServerSocketReceiver extends ReceiverBase {
    public static final int DEFAULT_BACKLOG = 50;
    private int port = 4560;
    private int backlog = 50;
    private String address;
    private ServerSocket serverSocket;
    private ServerRunner runner;

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected boolean shouldStart() {
        try {
            this.runner = createServerRunner(createServerListener(getServerSocketFactory().createServerSocket(getPort(), getBacklog(), getInetAddress())), getContext().getExecutorService());
            this.runner.setContext(getContext());
            return true;
        } catch (Exception e) {
            addError("server startup error: " + e, e);
            CloseUtil.closeQuietly(this.serverSocket);
            return false;
        }
    }

    protected ServerListener<RemoteAppenderClient> createServerListener(ServerSocket serverSocket) {
        return new RemoteAppenderServerListener(serverSocket);
    }

    protected ServerRunner createServerRunner(ServerListener<RemoteAppenderClient> serverListener, Executor executor) {
        return new RemoteAppenderServerRunner(serverListener, executor);
    }

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected Runnable getRunnableTask() {
        return this.runner;
    }

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected void onStop() {
        try {
            if (this.runner == null) {
                return;
            }
            this.runner.stop();
        } catch (IOException e) {
            addError("server shutdown error: " + e, e);
        }
    }

    protected ServerSocketFactory getServerSocketFactory() throws Exception {
        return ServerSocketFactory.getDefault();
    }

    protected InetAddress getInetAddress() throws UnknownHostException {
        if (getAddress() == null) {
            return null;
        }
        return InetAddress.getByName(getAddress());
    }

    public int getPort() {
        return this.port;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public int getBacklog() {
        return this.backlog;
    }

    public void setBacklog(int i) {
        this.backlog = i;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String str) {
        this.address = str;
    }
}
