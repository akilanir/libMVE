package ch.qos.logback.core.net.server;

import ch.qos.logback.core.net.server.Client;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/server/ClientVisitor.class */
public interface ClientVisitor<T extends Client> {
    void visit(T t);
}
