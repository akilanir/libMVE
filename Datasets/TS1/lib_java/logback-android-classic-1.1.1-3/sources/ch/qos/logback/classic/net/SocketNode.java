package ch.qos.logback.classic.net;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.spi.ILoggingEvent;
import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SocketNode.class */
public class SocketNode implements Runnable {
    Socket socket;
    LoggerContext context;
    ObjectInputStream ois;
    SocketAddress remoteSocketAddress;
    Logger logger;
    boolean closed = false;
    SimpleSocketServer socketServer;

    public SocketNode(SimpleSocketServer simpleSocketServer, Socket socket, LoggerContext loggerContext) {
        this.socketServer = simpleSocketServer;
        this.socket = socket;
        this.remoteSocketAddress = socket.getRemoteSocketAddress();
        this.context = loggerContext;
        this.logger = loggerContext.getLogger(SocketNode.class);
    }

    @Override // java.lang.Runnable
    public void run() {
        try {
            this.ois = new ObjectInputStream(new BufferedInputStream(this.socket.getInputStream()));
        } catch (Exception e) {
            this.logger.error("Could not open ObjectInputStream to " + this.socket, (Throwable) e);
            this.closed = true;
        }
        while (!this.closed) {
            try {
                ILoggingEvent iLoggingEvent = (ILoggingEvent) this.ois.readObject();
                Logger m4getLogger = this.context.m4getLogger(iLoggingEvent.getLoggerName());
                if (m4getLogger.isEnabledFor(iLoggingEvent.getLevel())) {
                    m4getLogger.callAppenders(iLoggingEvent);
                }
            } catch (EOFException e2) {
                this.logger.info("Caught java.io.EOFException closing connection.");
            } catch (SocketException e3) {
                this.logger.info("Caught java.net.SocketException closing connection.");
            } catch (IOException e4) {
                this.logger.info("Caught java.io.IOException: " + e4);
                this.logger.info("Closing connection.");
            } catch (Exception e5) {
                this.logger.error("Unexpected exception. Closing connection.", (Throwable) e5);
            }
        }
        this.socketServer.socketNodeClosing(this);
        close();
    }

    void close() {
        if (this.closed) {
            return;
        }
        this.closed = true;
        try {
        } catch (IOException e) {
            this.logger.warn("Could not close connection.", (Throwable) e);
        } finally {
            this.ois = null;
        }
        if (this.ois != null) {
            this.ois.close();
        }
    }

    public String toString() {
        return getClass().getName() + this.remoteSocketAddress.toString();
    }
}
