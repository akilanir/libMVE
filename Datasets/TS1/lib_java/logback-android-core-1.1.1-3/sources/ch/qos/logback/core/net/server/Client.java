package ch.qos.logback.core.net.server;

import java.io.Closeable;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/Client.class */
public interface Client extends Runnable, Closeable {
    @Override // java.io.Closeable, java.lang.AutoCloseable
    void close();
}
