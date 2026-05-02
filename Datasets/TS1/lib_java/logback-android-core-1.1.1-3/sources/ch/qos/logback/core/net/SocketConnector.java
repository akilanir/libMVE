package ch.qos.logback.core.net;

import java.net.Socket;
import java.util.concurrent.Callable;
import javax.net.SocketFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnector.class */
public interface SocketConnector extends Callable<Socket> {

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/SocketConnector$ExceptionHandler.class */
    public interface ExceptionHandler {
        void connectionFailed(SocketConnector socketConnector, Exception exc);
    }

    @Override // java.util.concurrent.Callable
    Socket call() throws InterruptedException;

    void setExceptionHandler(ExceptionHandler exceptionHandler);

    void setSocketFactory(SocketFactory socketFactory);
}
