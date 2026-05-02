package org.jivesoftware.smack;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.Principal;
import java.security.PublicKey;
import java.security.cert.CertificateException;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.ssl.X509TrustManager;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/ServerTrustManager.class */
class ServerTrustManager implements X509TrustManager {
    private static Pattern cnPattern = Pattern.compile("(?i)(cn=)([^,]*)");
    private ConnectionConfiguration configuration;
    private String server;
    private KeyStore trustStore;

    public ServerTrustManager(String server, ConnectionConfiguration configuration) {
        this.configuration = configuration;
        this.server = server;
        InputStream in = null;
        try {
            try {
                this.trustStore = KeyStore.getInstance(configuration.getTruststoreType());
                in = new FileInputStream(configuration.getTruststorePath());
                this.trustStore.load(in, configuration.getTruststorePassword().toCharArray());
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException e) {
                    }
                }
            } catch (Throwable th) {
                if (in != null) {
                    try {
                        in.close();
                    } catch (IOException e2) {
                    }
                }
                throw th;
            }
        } catch (Exception e3) {
            e3.printStackTrace();
            configuration.setVerifyRootCAEnabled(false);
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e4) {
                }
            }
        }
    }

    @Override // javax.net.ssl.X509TrustManager
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkServerTrusted(X509Certificate[] x509Certificates, String arg1) throws CertificateException {
        int nSize = x509Certificates.length;
        List<String> peerIdentities = getPeerIdentity(x509Certificates[0]);
        if (this.configuration.isVerifyChainEnabled()) {
            Principal principalLast = null;
            for (int i = nSize - 1; i >= 0; i--) {
                X509Certificate x509certificate = x509Certificates[i];
                Principal principalIssuer = x509certificate.getIssuerDN();
                Principal principalSubject = x509certificate.getSubjectDN();
                if (principalLast != null) {
                    if (principalIssuer.equals(principalLast)) {
                        try {
                            PublicKey publickey = x509Certificates[i + 1].getPublicKey();
                            x509Certificates[i].verify(publickey);
                        } catch (GeneralSecurityException e) {
                            throw new CertificateException("signature verification failed of " + peerIdentities);
                        }
                    } else {
                        throw new CertificateException("subject/issuer verification failed of " + peerIdentities);
                    }
                }
                principalLast = principalSubject;
            }
        }
        if (this.configuration.isVerifyRootCAEnabled()) {
            boolean trusted = false;
            try {
                trusted = this.trustStore.getCertificateAlias(x509Certificates[nSize - 1]) != null;
                if (!trusted && nSize == 1 && this.configuration.isSelfSignedCertificateEnabled()) {
                    System.out.println("Accepting self-signed certificate of remote server: " + peerIdentities);
                    trusted = true;
                }
            } catch (KeyStoreException e2) {
                e2.printStackTrace();
            }
            if (!trusted) {
                throw new CertificateException("root certificate not trusted of " + peerIdentities);
            }
        }
        if (this.configuration.isNotMatchingDomainCheckEnabled()) {
            if (peerIdentities.size() == 1 && peerIdentities.get(0).startsWith("*.")) {
                String peerIdentity = peerIdentities.get(0).replace("*.", XmlPullParser.NO_NAMESPACE);
                if (!this.server.endsWith(peerIdentity)) {
                    throw new CertificateException("target verification failed of " + peerIdentities);
                }
            } else if (!peerIdentities.contains(this.server)) {
                throw new CertificateException("target verification failed of " + peerIdentities);
            }
        }
        if (this.configuration.isExpiredCertificatesCheckEnabled()) {
            Date date = new Date();
            for (X509Certificate x509Certificate : x509Certificates) {
                try {
                    x509Certificate.checkValidity(date);
                } catch (GeneralSecurityException e3) {
                    throw new CertificateException("invalid date of " + this.server);
                }
            }
        }
    }

    public static List<String> getPeerIdentity(X509Certificate x509Certificate) {
        List<String> names = getSubjectAlternativeNames(x509Certificate);
        if (names.isEmpty()) {
            String name = x509Certificate.getSubjectDN().getName();
            Matcher matcher = cnPattern.matcher(name);
            if (matcher.find()) {
                name = matcher.group(2);
            }
            names = new ArrayList();
            names.add(name);
        }
        return names;
    }

    private static List<String> getSubjectAlternativeNames(X509Certificate certificate) {
        List<String> identities = new ArrayList<>();
        try {
            Collection<List<?>> altNames = certificate.getSubjectAlternativeNames();
            if (altNames == null) {
                return Collections.emptyList();
            }
        } catch (CertificateParsingException e) {
            e.printStackTrace();
        }
        return identities;
    }
}
