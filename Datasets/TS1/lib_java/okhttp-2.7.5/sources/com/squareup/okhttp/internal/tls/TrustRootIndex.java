package com.squareup.okhttp.internal.tls;

import java.security.cert.X509Certificate;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/internal/tls/TrustRootIndex.class */
public interface TrustRootIndex {
    X509Certificate findByIssuerAndSignature(X509Certificate x509Certificate);
}
