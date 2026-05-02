package org.apache.http.impl.bootstrap;

import javax.net.ssl.SSLException;
import javax.net.ssl.SSLServerSocket;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/impl/bootstrap/SSLServerSetupHandler.class */
public interface SSLServerSetupHandler {
    void initialize(SSLServerSocket sSLServerSocket) throws SSLException;
}
