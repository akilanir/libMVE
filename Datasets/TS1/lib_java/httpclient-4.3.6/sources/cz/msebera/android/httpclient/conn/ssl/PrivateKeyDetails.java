package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.util.Args;
import java.security.cert.X509Certificate;
import java.util.Arrays;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/PrivateKeyDetails.class */
public final class PrivateKeyDetails {
    private final String type;
    private final X509Certificate[] certChain;

    public PrivateKeyDetails(String type, X509Certificate[] certChain) {
        this.type = (String) Args.notNull(type, "Private key type");
        this.certChain = certChain;
    }

    public String getType() {
        return this.type;
    }

    public X509Certificate[] getCertChain() {
        return this.certChain;
    }

    public String toString() {
        return this.type + ':' + Arrays.toString(this.certChain);
    }
}
