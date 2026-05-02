package ch.qos.logback.core.net;

import ch.qos.logback.core.net.SocketConnector;
import java.net.InetAddress;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import javax.net.SocketFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnectorBase.class */
public class SocketConnectorBase implements SocketConnector {
    private final Lock lock;
    private final Condition connectCondition;
    private final InetAddress address;
    private final int port;
    private SocketConnector.ExceptionHandler exceptionHandler;
    private SocketFactory socketFactory;
    private DelayStrategy delayStrategy;
    private Socket socket;

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnectorBase$ConsoleExceptionHandler.class */
    private static class ConsoleExceptionHandler implements SocketConnector.ExceptionHandler {
        private ConsoleExceptionHandler() {
        }

        @Override // ch.qos.logback.core.net.SocketConnector.ExceptionHandler
        public void connectionFailed(SocketConnector socketConnector, Exception exc) {
            System.out.println(exc);
        }
    }

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnectorBase$DelayStrategy.class */
    public interface DelayStrategy {
        int nextDelay();
    }

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnectorBase$FixedDelay.class */
    private static class FixedDelay implements DelayStrategy {
        private final int retryDelay;
        private int nextDelay;

        public FixedDelay(int i, int i2) {
            this.nextDelay = i;
            this.retryDelay = i2;
        }

        @Override // ch.qos.logback.core.net.SocketConnectorBase.DelayStrategy
        public int nextDelay() {
            int i = this.nextDelay;
            this.nextDelay = this.retryDelay;
            return i;
        }
    }

    public SocketConnectorBase(InetAddress inetAddress, int i, int i2, int i3) {
        this(inetAddress, i, new FixedDelay(i2, i3));
    }

    public SocketConnectorBase(InetAddress inetAddress, int i, DelayStrategy delayStrategy) {
        this.lock = new ReentrantLock();
        this.connectCondition = this.lock.newCondition();
        this.address = inetAddress;
        this.port = i;
        this.delayStrategy = delayStrategy;
    }

    public void run() {
        if (this.socket != null) {
            throw new IllegalStateException("connector cannot be reused");
        }
        if (this.exceptionHandler == null) {
            this.exceptionHandler = new ConsoleExceptionHandler();
        }
        if (this.socketFactory == null) {
            this.socketFactory = SocketFactory.getDefault();
        }
        while (!Thread.currentThread().isInterrupted()) {
            try {
                Thread.sleep(this.delayStrategy.nextDelay());
                try {
                    this.socket = this.socketFactory.createSocket(this.address, this.port);
                    signalConnected();
                    break;
                } catch (Exception e) {
                    this.exceptionHandler.connectionFailed(this, e);
                }
            } catch (InterruptedException e2) {
                this.exceptionHandler.connectionFailed(this, e2);
                return;
            }
        }
    }

    private void signalConnected() {
        this.lock.lock();
        try {
            this.connectCondition.signalAll();
        } finally {
            this.lock.unlock();
        }
    }

    public Socket awaitConnection() throws InterruptedException {
        return awaitConnection(Long.MAX_VALUE);
    }

    public Socket awaitConnection(long j) throws InterruptedException {
        this.lock.lock();
        boolean z = false;
        while (this.socket == null && !z) {
            try {
                z = !this.connectCondition.await(j, TimeUnit.MILLISECONDS);
            } catch (Throwable th) {
                this.lock.unlock();
                throw th;
            }
        }
        Socket socket = this.socket;
        this.lock.unlock();
        return socket;
    }

    @Override // ch.qos.logback.core.net.SocketConnector
    public void setExceptionHandler(SocketConnector.ExceptionHandler exceptionHandler) {
        this.exceptionHandler = exceptionHandler;
    }

    @Override // ch.qos.logback.core.net.SocketConnector
    public void setSocketFactory(SocketFactory socketFactory) {
        this.socketFactory = socketFactory;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.concurrent.Callable
    public Socket call() throws InterruptedException {
        return null;
    }
}
