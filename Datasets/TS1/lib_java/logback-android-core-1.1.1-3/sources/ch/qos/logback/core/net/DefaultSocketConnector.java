package ch.qos.logback.core.net;

import ch.qos.logback.core.net.SocketConnector;
import ch.qos.logback.core.util.DelayStrategy;
import ch.qos.logback.core.util.FixedDelay;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import javax.net.SocketFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/DefaultSocketConnector.class */
public class DefaultSocketConnector implements SocketConnector {
    private final InetAddress address;
    private final int port;
    private final DelayStrategy delayStrategy;
    private SocketConnector.ExceptionHandler exceptionHandler;
    private SocketFactory socketFactory;

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/DefaultSocketConnector$ConsoleExceptionHandler.class */
    private static class ConsoleExceptionHandler implements SocketConnector.ExceptionHandler {
        private ConsoleExceptionHandler() {
        }

        @Override // ch.qos.logback.core.net.SocketConnector.ExceptionHandler
        public void connectionFailed(SocketConnector socketConnector, Exception exc) {
            System.out.println(exc);
        }
    }

    public DefaultSocketConnector(InetAddress inetAddress, int i, long j, long j2) {
        this(inetAddress, i, new FixedDelay(j, j2));
    }

    public DefaultSocketConnector(InetAddress inetAddress, int i, DelayStrategy delayStrategy) {
        this.address = inetAddress;
        this.port = i;
        this.delayStrategy = delayStrategy;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.concurrent.Callable
    public Socket call() throws InterruptedException {
        Socket socket;
        useDefaultsForMissingFields();
        Socket createSocket = createSocket();
        while (true) {
            socket = createSocket;
            if (socket != null || Thread.currentThread().isInterrupted()) {
                break;
            }
            Thread.sleep(this.delayStrategy.nextDelay());
            createSocket = createSocket();
        }
        return socket;
    }

    private Socket createSocket() {
        Socket socket = null;
        try {
            socket = this.socketFactory.createSocket(this.address, this.port);
        } catch (IOException e) {
            this.exceptionHandler.connectionFailed(this, e);
        }
        return socket;
    }

    private void useDefaultsForMissingFields() {
        if (this.exceptionHandler == null) {
            this.exceptionHandler = new ConsoleExceptionHandler();
        }
        if (this.socketFactory == null) {
            this.socketFactory = SocketFactory.getDefault();
        }
    }

    @Override // ch.qos.logback.core.net.SocketConnector
    public void setExceptionHandler(SocketConnector.ExceptionHandler exceptionHandler) {
        this.exceptionHandler = exceptionHandler;
    }

    @Override // ch.qos.logback.core.net.SocketConnector
    public void setSocketFactory(SocketFactory socketFactory) {
        this.socketFactory = socketFactory;
    }
}
