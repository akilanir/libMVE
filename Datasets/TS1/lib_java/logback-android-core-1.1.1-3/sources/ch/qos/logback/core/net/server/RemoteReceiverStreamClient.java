package ch.qos.logback.core.net.server;

import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.util.CloseUtil;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.net.Socket;
import java.net.SocketException;
import java.util.concurrent.BlockingQueue;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/RemoteReceiverStreamClient.class */
class RemoteReceiverStreamClient extends ContextAwareBase implements RemoteReceiverClient {
    private final String clientId;
    private final Socket socket;
    private final OutputStream outputStream;
    private BlockingQueue<Serializable> queue;

    public RemoteReceiverStreamClient(String str, Socket socket) {
        this.clientId = "client " + str + ": ";
        this.socket = socket;
        this.outputStream = null;
    }

    RemoteReceiverStreamClient(String str, OutputStream outputStream) {
        this.clientId = "client " + str + ": ";
        this.socket = null;
        this.outputStream = outputStream;
    }

    @Override // ch.qos.logback.core.net.server.RemoteReceiverClient
    public void setQueue(BlockingQueue<Serializable> blockingQueue) {
        this.queue = blockingQueue;
    }

    @Override // ch.qos.logback.core.net.server.RemoteReceiverClient
    public boolean offer(Serializable serializable) {
        if (this.queue == null) {
            throw new IllegalStateException("client has no event queue");
        }
        return this.queue.offer(serializable);
    }

    @Override // ch.qos.logback.core.net.server.Client, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.socket == null) {
            return;
        }
        CloseUtil.closeQuietly(this.socket);
    }

    @Override // java.lang.Runnable
    public void run() {
        addInfo(this.clientId + "connected");
        ObjectOutputStream objectOutputStream = null;
        try {
            try {
                try {
                    try {
                        int i = 0;
                        objectOutputStream = createObjectOutputStream();
                        while (!Thread.currentThread().isInterrupted()) {
                            try {
                                objectOutputStream.writeObject(this.queue.take());
                                objectOutputStream.flush();
                                i++;
                                if (i >= 70) {
                                    i = 0;
                                    objectOutputStream.reset();
                                }
                            } catch (InterruptedException e) {
                                Thread.currentThread().interrupt();
                            }
                        }
                        if (objectOutputStream != null) {
                            CloseUtil.closeQuietly(objectOutputStream);
                        }
                        close();
                        addInfo(this.clientId + "connection closed");
                    } catch (IOException e2) {
                        addError(this.clientId + e2);
                        if (objectOutputStream != null) {
                            CloseUtil.closeQuietly(objectOutputStream);
                        }
                        close();
                        addInfo(this.clientId + "connection closed");
                    }
                } catch (SocketException e3) {
                    addInfo(this.clientId + e3);
                    if (objectOutputStream != null) {
                        CloseUtil.closeQuietly(objectOutputStream);
                    }
                    close();
                    addInfo(this.clientId + "connection closed");
                }
            } catch (RuntimeException e4) {
                addError(this.clientId + e4);
                if (objectOutputStream != null) {
                    CloseUtil.closeQuietly(objectOutputStream);
                }
                close();
                addInfo(this.clientId + "connection closed");
            }
        } catch (Throwable th) {
            if (objectOutputStream != null) {
                CloseUtil.closeQuietly(objectOutputStream);
            }
            close();
            addInfo(this.clientId + "connection closed");
            throw th;
        }
    }

    private ObjectOutputStream createObjectOutputStream() throws IOException {
        return this.socket == null ? new ObjectOutputStream(this.outputStream) : new ObjectOutputStream(this.socket.getOutputStream());
    }
}
