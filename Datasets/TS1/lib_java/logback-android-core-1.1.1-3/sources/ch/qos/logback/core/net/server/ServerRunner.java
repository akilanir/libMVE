package ch.qos.logback.core.net.server;

import ch.qos.logback.core.net.server.Client;
import ch.qos.logback.core.spi.ContextAware;
import java.io.IOException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/ServerRunner.class */
public interface ServerRunner<T extends Client> extends ContextAware, Runnable {
    boolean isRunning();

    void stop() throws IOException;

    void accept(ClientVisitor<T> clientVisitor);
}
