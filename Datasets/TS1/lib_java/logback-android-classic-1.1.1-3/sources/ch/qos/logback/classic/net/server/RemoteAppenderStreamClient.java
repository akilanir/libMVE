package ch.qos.logback.classic.net.server;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.util.CloseUtil;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.net.Socket;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/RemoteAppenderStreamClient.class */
class RemoteAppenderStreamClient implements RemoteAppenderClient {
    private final String id;
    private final Socket socket;
    private final InputStream inputStream;
    private LoggerContext lc;
    private Logger logger;

    public RemoteAppenderStreamClient(String str, Socket socket) {
        this.id = str;
        this.socket = socket;
        this.inputStream = null;
    }

    public RemoteAppenderStreamClient(String str, InputStream inputStream) {
        this.id = str;
        this.socket = null;
        this.inputStream = inputStream;
    }

    @Override // ch.qos.logback.classic.net.server.RemoteAppenderClient
    public void setLoggerContext(LoggerContext loggerContext) {
        this.lc = loggerContext;
        this.logger = loggerContext.m4getLogger(getClass().getPackage().getName());
    }

    public void close() {
        if (this.socket == null) {
            return;
        }
        CloseUtil.closeQuietly(this.socket);
    }

    public void run() {
        this.logger.info(this + ": connected");
        ObjectInputStream objectInputStream = null;
        try {
            try {
                try {
                    objectInputStream = createObjectInputStream();
                    while (true) {
                        ILoggingEvent iLoggingEvent = (ILoggingEvent) objectInputStream.readObject();
                        Logger m4getLogger = this.lc.m4getLogger(iLoggingEvent.getLoggerName());
                        if (m4getLogger.isEnabledFor(iLoggingEvent.getLevel())) {
                            m4getLogger.callAppenders(iLoggingEvent);
                        }
                    }
                } catch (IOException e) {
                    this.logger.info(this + ": " + e);
                    if (objectInputStream != null) {
                        CloseUtil.closeQuietly(objectInputStream);
                    }
                    close();
                    this.logger.info(this + ": connection closed");
                } catch (RuntimeException e2) {
                    this.logger.error(this + ": " + e2);
                    if (objectInputStream != null) {
                        CloseUtil.closeQuietly(objectInputStream);
                    }
                    close();
                    this.logger.info(this + ": connection closed");
                }
            } catch (EOFException e3) {
                if (objectInputStream != null) {
                    CloseUtil.closeQuietly(objectInputStream);
                }
                close();
                this.logger.info(this + ": connection closed");
            } catch (ClassNotFoundException e4) {
                this.logger.error(this + ": unknown event class");
                if (objectInputStream != null) {
                    CloseUtil.closeQuietly(objectInputStream);
                }
                close();
                this.logger.info(this + ": connection closed");
            }
        } catch (Throwable th) {
            if (objectInputStream != null) {
                CloseUtil.closeQuietly(objectInputStream);
            }
            close();
            this.logger.info(this + ": connection closed");
            throw th;
        }
    }

    private ObjectInputStream createObjectInputStream() throws IOException {
        return this.inputStream != null ? new ObjectInputStream(this.inputStream) : new ObjectInputStream(this.socket.getInputStream());
    }

    public String toString() {
        return "client " + this.id;
    }
}
