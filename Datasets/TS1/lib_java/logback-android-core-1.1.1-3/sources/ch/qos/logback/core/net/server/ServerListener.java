package ch.qos.logback.core.net.server;

import ch.qos.logback.core.net.server.Client;
import java.io.Closeable;
import java.io.IOException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/ServerListener.class */
public interface ServerListener<T extends Client> extends Closeable {
    T acceptClient() throws IOException, InterruptedException;

    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();
}
