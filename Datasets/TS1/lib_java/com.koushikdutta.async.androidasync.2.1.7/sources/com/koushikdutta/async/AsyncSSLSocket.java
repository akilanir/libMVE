package com.koushikdutta.async;

import java.security.cert.X509Certificate;
import javax.net.ssl.SSLEngine;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/AsyncSSLSocket.class */
public interface AsyncSSLSocket extends AsyncSocket {
    X509Certificate[] getPeerCertificates();

    SSLEngine getSSLEngine();
}
