package okhttp3.internal.tls;

import java.security.GeneralSecurityException;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.Iterator;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/tls/CertificateChainCleaner.class */
public final class CertificateChainCleaner {
    private final TrustRootIndex trustRootIndex;

    public CertificateChainCleaner(TrustRootIndex trustRootIndex) {
        this.trustRootIndex = trustRootIndex;
    }

    public List<Certificate> clean(List<Certificate> chain) throws SSLPeerUnverifiedException {
        Iterator<Certificate> i;
        X509Certificate signingCert;
        Deque<Certificate> queue = new ArrayDeque<>(chain);
        List<Certificate> result = new ArrayList<>();
        result.add(queue.removeFirst());
        while (true) {
            X509Certificate toVerify = (X509Certificate) result.get(result.size() - 1);
            X509Certificate caCert = this.trustRootIndex.findByIssuerAndSignature(toVerify);
            if (caCert != null) {
                if (result.size() > 1 || !toVerify.equals(caCert)) {
                    result.add(caCert);
                }
                return result;
            }
            i = queue.iterator();
            while (i.hasNext()) {
                signingCert = (X509Certificate) i.next();
                if (!toVerify.getIssuerDN().equals(signingCert.getSubjectDN()) || !verifySignature(toVerify, signingCert)) {
                }
            }
            throw new SSLPeerUnverifiedException("Failed to find a cert that signed " + toVerify);
            i.remove();
            result.add(signingCert);
        }
    }

    private boolean verifySignature(X509Certificate toVerify, X509Certificate signingCert) {
        try {
            toVerify.verify(signingCert.getPublicKey());
            return true;
        } catch (GeneralSecurityException e) {
            return false;
        }
    }
}
