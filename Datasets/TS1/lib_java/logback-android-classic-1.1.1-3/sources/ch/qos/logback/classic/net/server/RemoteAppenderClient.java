package ch.qos.logback.classic.net.server;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.net.server.Client;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/RemoteAppenderClient.class */
interface RemoteAppenderClient extends Client {
    void setLoggerContext(LoggerContext loggerContext);
}
