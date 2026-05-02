package okhttp3;

import java.security.Principal;
import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.Collections;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import okhttp3.internal.Util;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Handshake.class */
public final class Handshake {
    private final TlsVersion tlsVersion;
    private final CipherSuite cipherSuite;
    private final List<Certificate> peerCertificates;
    private final List<Certificate> localCertificates;

    private Handshake(TlsVersion tlsVersion, CipherSuite cipherSuite, List<Certificate> peerCertificates, List<Certificate> localCertificates) {
        this.tlsVersion = tlsVersion;
        this.cipherSuite = cipherSuite;
        this.peerCertificates = peerCertificates;
        this.localCertificates = localCertificates;
    }

    public static Handshake get(SSLSession session) {
        Certificate[] peerCertificates;
        List<Certificate> emptyList;
        List<Certificate> emptyList2;
        String cipherSuiteString = session.getCipherSuite();
        if (cipherSuiteString == null) {
            throw new IllegalStateException("cipherSuite == null");
        }
        CipherSuite cipherSuite = CipherSuite.forJavaName(cipherSuiteString);
        String tlsVersionString = session.getProtocol();
        if (tlsVersionString == null) {
            throw new IllegalStateException("tlsVersion == null");
        }
        TlsVersion tlsVersion = TlsVersion.forJavaName(tlsVersionString);
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
        return new Handshake(tlsVersion, cipherSuite, peerCertificatesList, localCertificatesList);
    }

    public static Handshake get(TlsVersion tlsVersion, CipherSuite cipherSuite, List<Certificate> peerCertificates, List<Certificate> localCertificates) {
        if (cipherSuite == null) {
            throw new IllegalArgumentException("cipherSuite == null");
        }
        return new Handshake(tlsVersion, cipherSuite, Util.immutableList(peerCertificates), Util.immutableList(localCertificates));
    }

    public TlsVersion tlsVersion() {
        return this.tlsVersion;
    }

    public CipherSuite cipherSuite() {
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
        return Util.equal(this.cipherSuite, that.cipherSuite) && this.cipherSuite.equals(that.cipherSuite) && this.peerCertificates.equals(that.peerCertificates) && this.localCertificates.equals(that.localCertificates);
    }

    public int hashCode() {
        int result = (31 * 17) + (this.tlsVersion != null ? this.tlsVersion.hashCode() : 0);
        return (31 * ((31 * ((31 * result) + this.cipherSuite.hashCode())) + this.peerCertificates.hashCode())) + this.localCertificates.hashCode();
    }
}
