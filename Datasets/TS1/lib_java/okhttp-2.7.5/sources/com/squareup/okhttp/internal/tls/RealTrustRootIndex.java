package com.squareup.okhttp.internal.tls;

import java.security.PublicKey;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.security.auth.x500.X500Principal;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/tls/RealTrustRootIndex.class */
public final class RealTrustRootIndex implements TrustRootIndex {
    private final Map<X500Principal, List<X509Certificate>> subjectToCaCerts = new LinkedHashMap();

    public RealTrustRootIndex(X509Certificate... caCerts) {
        for (X509Certificate caCert : caCerts) {
            X500Principal subject = caCert.getSubjectX500Principal();
            List<X509Certificate> subjectCaCerts = this.subjectToCaCerts.get(subject);
            if (subjectCaCerts == null) {
                subjectCaCerts = new ArrayList(1);
                this.subjectToCaCerts.put(subject, subjectCaCerts);
            }
            subjectCaCerts.add(caCert);
        }
    }

    @Override // com.squareup.okhttp.internal.tls.TrustRootIndex
    public X509Certificate findByIssuerAndSignature(X509Certificate cert) {
        X500Principal issuer = cert.getIssuerX500Principal();
        List<X509Certificate> subjectCaCerts = this.subjectToCaCerts.get(issuer);
        if (subjectCaCerts == null) {
            return null;
        }
        for (X509Certificate caCert : subjectCaCerts) {
            PublicKey publicKey = caCert.getPublicKey();
            try {
                cert.verify(publicKey);
                return caCert;
            } catch (Exception e) {
            }
        }
        return null;
    }
}
