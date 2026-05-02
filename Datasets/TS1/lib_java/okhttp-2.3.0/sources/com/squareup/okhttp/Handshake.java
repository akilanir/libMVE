package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.security.Principal;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Collections;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/Handshake.class */
public final class Handshake {
    private final String cipherSuite;
    private final List<Certificate> peerCertificates;
    private final List<Certificate> localCertificates;

    private Handshake(String cipherSuite, List<Certificate> peerCertificates, List<Certificate> localCertificates) {
        this.cipherSuite = cipherSuite;
        this.peerCertificates = peerCertificates;
        this.localCertificates = localCertificates;
    }

    public static Handshake get(SSLSession session) {
        Certificate[] peerCertificates;
        List<Certificate> emptyList;
        List<Certificate> emptyList2;
        String cipherSuite = session.getCipherSuite();
        if (cipherSuite == null) {
            throw new IllegalStateException("cipherSuite == null");
        }
        try {
            peerCertificates = session.getPeerCertificates();
        } catch (SSLPeerUnverifiedException e) {
            peerCertificates = null;
        }
        if (peerCertificates != null) {
            emptyList = Util.immutableList(peerCertificates);
        } else {
            emptyList = Collections.emptyList();
        }
        List<Certificate> peerCertificatesList = emptyList;
        Certificate[] localCertificates = session.getLocalCertificates();
        if (localCertificates != null) {
            emptyList2 = Util.immutableList(localCertificates);
        } else {
            emptyList2 = Collections.emptyList();
        }
        List<Certificate> localCertificatesList = emptyList2;
        return new Handshake(cipherSuite, peerCertificatesList, localCertificatesList);
    }

    public static Handshake get(String cipherSuite, List<Certificate> peerCertificates, List<Certificate> localCertificates) {
        if (cipherSuite == null) {
            throw new IllegalArgumentException("cipherSuite == null");
        }
        return new Handshake(cipherSuite, Util.immutableList(peerCertificates), Util.immutableList(localCertificates));
    }

    public String cipherSuite() {
        return this.cipherSuite;
    }

    public List<Certificate> peerCertificates() {
        return this.peerCertificates;
    }

    public Principal peerPrincipal() {
        if (this.peerCertificates.isEmpty()) {
            return null;
        }
        return ((X509Certificate) this.peerCertificates.get(0)).getSubjectX500Principal();
    }

    public List<Certificate> localCertificates() {
        return this.localCertificates;
    }

    public Principal localPrincipal() {
        if (this.localCertificates.isEmpty()) {
            return null;
        }
        return ((X509Certificate) this.localCertificates.get(0)).getSubjectX500Principal();
    }

    public boolean equals(Object other) {
        if (!(other instanceof Handshake)) {
            return false;
        }
        Handshake that = (Handshake) other;
        return this.cipherSuite.equals(that.cipherSuite) && this.peerCertificates.equals(that.peerCertificates) && this.localCertificates.equals(that.localCertificates);
    }

    public int hashCode() {
        int result = (31 * 17) + this.cipherSuite.hashCode();
        return (31 * ((31 * result) + this.peerCertificates.hashCode())) + this.localCertificates.hashCode();
    }
}
