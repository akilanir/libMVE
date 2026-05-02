package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.annotation.Immutable;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.SSLContext;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/SSLContexts.class */
public class SSLContexts {
    public static SSLContext createDefault() throws SSLInitializationException {
        try {
            SSLContext sslcontext = SSLContext.getInstance("TLS");
            sslcontext.init(null, null, null);
            return sslcontext;
        } catch (KeyManagementException ex) {
            throw new SSLInitializationException(ex.getMessage(), ex);
        } catch (NoSuchAlgorithmException ex2) {
            throw new SSLInitializationException(ex2.getMessage(), ex2);
        }
    }

    public static SSLContext createSystemDefault() throws SSLInitializationException {
        try {
            return SSLContext.getInstance("Default");
        } catch (NoSuchAlgorithmException e) {
            return createDefault();
        }
    }

    public static SSLContextBuilder custom() {
        return new SSLContextBuilder();
    }
}
