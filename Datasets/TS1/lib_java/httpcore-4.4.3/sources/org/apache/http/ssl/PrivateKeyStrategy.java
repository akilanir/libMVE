package org.apache.http.ssl;

import java.net.Socket;
import java.util.Map;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/ssl/PrivateKeyStrategy.class */
public interface PrivateKeyStrategy {
    String chooseAlias(Map<String, PrivateKeyDetails> map, Socket socket);
}
