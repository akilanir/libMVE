package okhttp3.internal.tls;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.cert.TrustAnchor;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/tls/AndroidTrustRootIndex.class */
public final class AndroidTrustRootIndex implements TrustRootIndex {
    private final X509TrustManager trustManager;
    private final Method findByIssuerAndSignatureMethod;

    public AndroidTrustRootIndex(X509TrustManager trustManager, Method findByIssuerAndSignatureMethod) {
        this.findByIssuerAndSignatureMethod = findByIssuerAndSignatureMethod;
        this.trustManager = trustManager;
    }

    @Override // okhttp3.internal.tls.TrustRootIndex
    public X509Certificate findByIssuerAndSignature(X509Certificate cert) {
        try {
            TrustAnchor trustAnchor = (TrustAnchor) this.findByIssuerAndSignatureMethod.invoke(this.trustManager, cert);
            return trustAnchor.getTrustedCert();
        } catch (IllegalAccessException e) {
            throw new AssertionError();
        } catch (InvocationTargetException e2) {
            return null;
        }
    }

    public static TrustRootIndex get(X509TrustManager trustManager) {
        try {
            Method method = trustManager.getClass().getDeclaredMethod("findTrustAnchorByIssuerAndSignature", X509Certificate.class);
            method.setAccessible(true);
            return new AndroidTrustRootIndex(trustManager, method);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }
}
