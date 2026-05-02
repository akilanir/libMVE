package ch.qos.logback.core.net;

import ch.qos.logback.core.AppenderBase;
import ch.qos.logback.core.net.SocketConnector;
import ch.qos.logback.core.spi.PreSerializationTransformer;
import ch.qos.logback.core.util.CloseUtil;
import ch.qos.logback.core.util.Duration;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.ConnectException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;
import javax.net.SocketFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/AbstractSocketAppender.class */
public abstract class AbstractSocketAppender<E> extends AppenderBase<E> implements Runnable, SocketConnector.ExceptionHandler {
    public static final int DEFAULT_PORT = 4560;
    public static final int DEFAULT_RECONNECTION_DELAY = 30000;
    public static final int DEFAULT_QUEUE_SIZE = 128;
    private static final int DEFAULT_ACCEPT_CONNECTION_DELAY = 5000;
    private static final int DEFAULT_EVENT_DELAY_TIMEOUT = 100;
    private String remoteHost;
    private int port;
    private InetAddress address;
    private Duration reconnectionDelay;
    private int queueSize;
    private int acceptConnectionTimeout;
    private Duration eventDelayLimit;
    private BlockingQueue<E> queue;
    private String peerId;
    private Future<?> task;
    private Future<Socket> connectorTask;
    private volatile Socket socket;

    protected AbstractSocketAppender() {
        this.port = DEFAULT_PORT;
        this.reconnectionDelay = new Duration(30000L);
        this.queueSize = 128;
        this.acceptConnectionTimeout = DEFAULT_ACCEPT_CONNECTION_DELAY;
        this.eventDelayLimit = new Duration(100L);
    }

    @Deprecated
    protected AbstractSocketAppender(String str, int i) {
        this.port = DEFAULT_PORT;
        this.reconnectionDelay = new Duration(30000L);
        this.queueSize = 128;
        this.acceptConnectionTimeout = DEFAULT_ACCEPT_CONNECTION_DELAY;
        this.eventDelayLimit = new Duration(100L);
        this.remoteHost = str;
        this.port = i;
    }

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void start() {
        if (isStarted()) {
            return;
        }
        int i = 0;
        if (this.port <= 0) {
            i = 0 + 1;
            addError("No port was configured for appender" + this.name + " For more information, please visit http://logback.qos.ch/codes.html#socket_no_port");
        }
        if (this.remoteHost == null) {
            i++;
            addError("No remote host was configured for appender" + this.name + " For more information, please visit http://logback.qos.ch/codes.html#socket_no_host");
        }
        if (this.queueSize < 0) {
            i++;
            addError("Queue size must be non-negative");
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
            this.queue = newBlockingQueue(this.queueSize);
            this.peerId = "remote peer " + this.remoteHost + ":" + this.port + ": ";
            this.task = getContext().getExecutorService().submit(this);
            super.start();
        }
    }

    @Override // ch.qos.logback.core.AppenderBase, ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        if (isStarted()) {
            CloseUtil.closeQuietly(this.socket);
            this.task.cancel(true);
            if (this.connectorTask != null) {
                this.connectorTask.cancel(true);
            }
            super.stop();
        }
    }

    @Override // ch.qos.logback.core.AppenderBase
    protected void append(E e) {
        if (e == null || !isStarted()) {
            return;
        }
        try {
            if (!this.queue.offer(e, this.eventDelayLimit.getMilliseconds(), TimeUnit.MILLISECONDS)) {
                addInfo("Dropping event due to timeout limit of [" + this.eventDelayLimit + "] milliseconds being exceeded");
            }
        } catch (InterruptedException e2) {
            addError("Interrupted while appending event to SocketAppender", e2);
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        signalEntryInRunMethod();
        while (!Thread.currentThread().isInterrupted()) {
            try {
                this.connectorTask = activateConnector(createConnector(this.address, this.port, 0, this.reconnectionDelay.getMilliseconds()));
                if (this.connectorTask == null) {
                    break;
                }
                this.socket = waitForConnectorToReturnASocket();
                if (this.socket == null) {
                    break;
                } else {
                    dispatchEvents();
                }
            } catch (InterruptedException e) {
            }
        }
        addInfo("shutting down");
    }

    protected void signalEntryInRunMethod() {
    }

    private SocketConnector createConnector(InetAddress inetAddress, int i, int i2, long j) {
        SocketConnector newConnector = newConnector(inetAddress, i, i2, j);
        newConnector.setExceptionHandler(this);
        newConnector.setSocketFactory(getSocketFactory());
        return newConnector;
    }

    private Future<Socket> activateConnector(SocketConnector socketConnector) {
        try {
            return getContext().getExecutorService().submit(socketConnector);
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

    private void dispatchEvents() throws InterruptedException {
        try {
            try {
                this.socket.setSoTimeout(this.acceptConnectionTimeout);
                ObjectOutputStream objectOutputStream = new ObjectOutputStream(this.socket.getOutputStream());
                this.socket.setSoTimeout(0);
                addInfo(this.peerId + "connection established");
                int i = 0;
                while (true) {
                    E take = this.queue.take();
                    postProcessEvent(take);
                    objectOutputStream.writeObject(getPST().transform(take));
                    objectOutputStream.flush();
                    i++;
                    if (i >= 70) {
                        objectOutputStream.reset();
                        i = 0;
                    }
                }
            } catch (IOException e) {
                addInfo(this.peerId + "connection failed: " + e);
                CloseUtil.closeQuietly(this.socket);
                this.socket = null;
                addInfo(this.peerId + "connection closed");
            }
        } catch (Throwable th) {
            CloseUtil.closeQuietly(this.socket);
            this.socket = null;
            addInfo(this.peerId + "connection closed");
            throw th;
        }
    }

    @Override // ch.qos.logback.core.net.SocketConnector.ExceptionHandler
    public void connectionFailed(SocketConnector socketConnector, Exception exc) {
        if (exc instanceof InterruptedException) {
            addInfo("connector interrupted");
        } else if (exc instanceof ConnectException) {
            addInfo(this.peerId + "connection refused");
        } else {
            addInfo(this.peerId + exc);
        }
    }

    protected SocketConnector newConnector(InetAddress inetAddress, int i, long j, long j2) {
        return new DefaultSocketConnector(inetAddress, i, j, j2);
    }

    protected SocketFactory getSocketFactory() {
        return SocketFactory.getDefault();
    }

    BlockingQueue<E> newBlockingQueue(int i) {
        return i <= 0 ? new SynchronousQueue<>() : new ArrayBlockingQueue<>(i);
    }

    protected abstract void postProcessEvent(E e);

    protected abstract PreSerializationTransformer<E> getPST();

    @Deprecated
    protected static InetAddress getAddressByName(String str) {
        try {
            return InetAddress.getByName(str);
        } catch (Exception e) {
            return null;
        }
    }

    public void setRemoteHost(String str) {
        this.remoteHost = str;
    }

    public String getRemoteHost() {
        return this.remoteHost;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public int getPort() {
        return this.port;
    }

    public void setReconnectionDelay(Duration duration) {
        this.reconnectionDelay = duration;
    }

    public Duration getReconnectionDelay() {
        return this.reconnectionDelay;
    }

    public void setQueueSize(int i) {
        this.queueSize = i;
    }

    public int getQueueSize() {
        return this.queueSize;
    }

    public void setEventDelayLimit(Duration duration) {
        this.eventDelayLimit = duration;
    }

    public Duration getEventDelayLimit() {
        return this.eventDelayLimit;
    }

    void setAcceptConnectionTimeout(int i) {
        this.acceptConnectionTimeout = i;
    }
}
