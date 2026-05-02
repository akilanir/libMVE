package cz.msebera.android.httpclient.conn.ssl;

import java.net.Socket;
import java.util.Map;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/PrivateKeyStrategy.class */
public interface PrivateKeyStrategy {
    String chooseAlias(Map<String, PrivateKeyDetails> map, Socket socket);
}
