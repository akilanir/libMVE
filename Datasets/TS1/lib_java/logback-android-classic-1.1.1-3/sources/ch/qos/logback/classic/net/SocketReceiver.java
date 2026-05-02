package ch.qos.logback.classic.net;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.net.DefaultSocketConnector;
import ch.qos.logback.core.net.SocketConnector;
import ch.qos.logback.core.util.CloseUtil;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.ConnectException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import javax.net.SocketFactory;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SocketReceiver.class */
public class SocketReceiver extends ReceiverBase implements Runnable, SocketConnector.ExceptionHandler {
    private static final int DEFAULT_ACCEPT_CONNECTION_DELAY = 5000;
    private String remoteHost;
    private InetAddress address;
    private int port;
    private int reconnectionDelay;
    private int acceptConnectionTimeout = 5000;
    private String receiverId;
    private volatile Socket socket;
    private Future<Socket> connectorTask;

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected boolean shouldStart() {
        int i = 0;
        if (this.port == 0) {
            i = 0 + 1;
            addError("No port was configured for receiver. For more information, please visit http://logback.qos.ch/codes.html#receiver_no_port");
        }
        if (this.remoteHost == null) {
            i++;
            addError("No host name or address was configured for receiver. For more information, please visit http://logback.qos.ch/codes.html#receiver_no_host");
        }
        if (this.reconnectionDelay == 0) {
            this.reconnectionDelay = Level.WARN_INT;
        }
        if (i == 0) {
            try {
                this.address = InetAddress.getByName(this.remoteHost);
            } catch (UnknownHostException e) {
                addError("unknown host: " + this.remoteHost);
                i++;
            }
        }
        if (i == 0) {
            this.receiverId = "receiver " + this.remoteHost + ":" + this.port + ": ";
        }
        return i == 0;
    }

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected void onStop() {
        if (this.socket != null) {
            CloseUtil.closeQuietly(this.socket);
        }
    }

    @Override // ch.qos.logback.classic.net.ReceiverBase
    protected Runnable getRunnableTask() {
        return this;
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            LoggerContext loggerContext = (LoggerContext) getContext();
            while (!Thread.currentThread().isInterrupted()) {
                this.connectorTask = activateConnector(createConnector(this.address, this.port, 0, this.reconnectionDelay));
                if (this.connectorTask == null) {
                    break;
                }
                this.socket = waitForConnectorToReturnASocket();
                if (this.socket == null) {
                    break;
                } else {
                    dispatchEvents(loggerContext);
                }
            }
        } catch (InterruptedException e) {
        }
        addInfo("shutting down");
    }

    private SocketConnector createConnector(InetAddress inetAddress, int i, int i2, int i3) {
        SocketConnector newConnector = newConnector(inetAddress, i, i2, i3);
        newConnector.setExceptionHandler(this);
        newConnector.setSocketFactory(getSocketFactory());
        return newConnector;
    }

    private Future<Socket> activateConnector(SocketConnector socketConnector) {
        try {
            return getContext().getExecutorService().submit((Callable) socketConnector);
        } catch (RejectedExecutionException e) {
            return null;
        }
    }

    private Socket waitForConnectorToReturnASocket() throws InterruptedException {
        try {
            Socket socket = this.connectorTask.get();
            this.connectorTask = null;
            return socket;
        } catch (ExecutionException e) {
            return null;
        }
    }

    private void dispatchEvents(LoggerContext loggerContext) {
        try {
            try {
                try {
                    this.socket.setSoTimeout(this.acceptConnectionTimeout);
                    ObjectInputStream objectInputStream = new ObjectInputStream(this.socket.getInputStream());
                    this.socket.setSoTimeout(0);
                    addInfo(this.receiverId + "connection established");
                    while (true) {
                        ILoggingEvent iLoggingEvent = (ILoggingEvent) objectInputStream.readObject();
                        Logger m4getLogger = loggerContext.m4getLogger(iLoggingEvent.getLoggerName());
                        if (m4getLogger.isEnabledFor(iLoggingEvent.getLevel())) {
                            m4getLogger.callAppenders(iLoggingEvent);
                        }
                    }
                } catch (IOException e) {
                    addInfo(this.receiverId + "connection failed: " + e);
                    CloseUtil.closeQuietly(this.socket);
                    this.socket = null;
                    addInfo(this.receiverId + "connection closed");
                }
            } catch (EOFException e2) {
                addInfo(this.receiverId + "end-of-stream detected");
                CloseUtil.closeQuietly(this.socket);
                this.socket = null;
                addInfo(this.receiverId + "connection closed");
            } catch (ClassNotFoundException e3) {
                addInfo(this.receiverId + "unknown event class: " + e3);
                CloseUtil.closeQuietly(this.socket);
                this.socket = null;
                addInfo(this.receiverId + "connection closed");
            }
        } catch (Throwable th) {
            CloseUtil.closeQuietly(this.socket);
            this.socket = null;
            addInfo(this.receiverId + "connection closed");
            throw th;
        }
    }

    public void connectionFailed(SocketConnector socketConnector, Exception exc) {
        if (exc instanceof InterruptedException) {
            addInfo("connector interrupted");
        } else if (exc instanceof ConnectException) {
            addInfo(this.receiverId + "connection refused");
        } else {
            addInfo(this.receiverId + exc);
        }
    }

    protected SocketConnector newConnector(InetAddress inetAddress, int i, int i2, int i3) {
        return new DefaultSocketConnector(inetAddress, i, i2, i3);
    }

    protected SocketFactory getSocketFactory() {
        return SocketFactory.getDefault();
    }

    public void setRemoteHost(String str) {
        this.remoteHost = str;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setReconnectionDelay(int i) {
        this.reconnectionDelay = i;
    }

    public void setAcceptConnectionTimeout(int i) {
        this.acceptConnectionTimeout = i;
    }
}
