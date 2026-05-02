package ch.qos.logback.core.net.ssl;

import ch.qos.logback.core.spi.ContextAware;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/SSLContextFactoryBean.class */
public class SSLContextFactoryBean {
    private static final String JSSE_KEY_STORE_PROPERTY = "javax.net.ssl.keyStore";
    private static final String JSSE_TRUST_STORE_PROPERTY = "javax.net.ssl.trustStore";
    private KeyStoreFactoryBean keyStore;
    private KeyStoreFactoryBean trustStore;
    private SecureRandomFactoryBean secureRandom;
    private KeyManagerFactoryFactoryBean keyManagerFactory;
    private TrustManagerFactoryFactoryBean trustManagerFactory;
    private String protocol;
    private String provider;

    public SSLContext createContext(ContextAware contextAware) throws NoSuchProviderException, NoSuchAlgorithmException, KeyManagementException, UnrecoverableKeyException, KeyStoreException, CertificateException {
        SSLContext sSLContext = getProvider() != null ? SSLContext.getInstance(getProtocol(), getProvider()) : SSLContext.getInstance(getProtocol());
        contextAware.addInfo("SSL protocol '" + sSLContext.getProtocol() + "' provider '" + sSLContext.getProvider() + "'");
        sSLContext.init(createKeyManagers(contextAware), createTrustManagers(contextAware), createSecureRandom(contextAware));
        return sSLContext;
    }

    private KeyManager[] createKeyManagers(ContextAware contextAware) throws NoSuchProviderException, NoSuchAlgorithmException, UnrecoverableKeyException, KeyStoreException {
        if (getKeyStore() == null) {
            return null;
        }
        KeyStore createKeyStore = getKeyStore().createKeyStore();
        contextAware.addInfo("key store of type '" + createKeyStore.getType() + "' provider '" + createKeyStore.getProvider() + "': " + getKeyStore().getLocation());
        KeyManagerFactory createKeyManagerFactory = getKeyManagerFactory().createKeyManagerFactory();
        contextAware.addInfo("key manager algorithm '" + createKeyManagerFactory.getAlgorithm() + "' provider '" + createKeyManagerFactory.getProvider() + "'");
        createKeyManagerFactory.init(createKeyStore, getKeyStore().getPassword().toCharArray());
        return createKeyManagerFactory.getKeyManagers();
    }

    private TrustManager[] createTrustManagers(ContextAware contextAware) throws NoSuchProviderException, NoSuchAlgorithmException, KeyStoreException {
        if (getTrustStore() == null) {
            return null;
        }
        KeyStore createKeyStore = getTrustStore().createKeyStore();
        contextAware.addInfo("trust store of type '" + createKeyStore.getType() + "' provider '" + createKeyStore.getProvider() + "': " + getTrustStore().getLocation());
        TrustManagerFactory createTrustManagerFactory = getTrustManagerFactory().createTrustManagerFactory();
        contextAware.addInfo("trust manager algorithm '" + createTrustManagerFactory.getAlgorithm() + "' provider '" + createTrustManagerFactory.getProvider() + "'");
        createTrustManagerFactory.init(createKeyStore);
        return createTrustManagerFactory.getTrustManagers();
    }

    private SecureRandom createSecureRandom(ContextAware contextAware) throws NoSuchProviderException, NoSuchAlgorithmException {
        SecureRandom createSecureRandom = getSecureRandom().createSecureRandom();
        contextAware.addInfo("secure random algorithm '" + createSecureRandom.getAlgorithm() + "' provider '" + createSecureRandom.getProvider() + "'");
        return createSecureRandom;
    }

    public KeyStoreFactoryBean getKeyStore() {
        if (this.keyStore == null) {
            this.keyStore = keyStoreFromSystemProperties(JSSE_KEY_STORE_PROPERTY);
        }
        return this.keyStore;
    }

    public void setKeyStore(KeyStoreFactoryBean keyStoreFactoryBean) {
        this.keyStore = keyStoreFactoryBean;
    }

    public KeyStoreFactoryBean getTrustStore() {
        if (this.trustStore == null) {
            this.trustStore = keyStoreFromSystemProperties(JSSE_TRUST_STORE_PROPERTY);
        }
        return this.trustStore;
    }

    public void setTrustStore(KeyStoreFactoryBean keyStoreFactoryBean) {
        this.trustStore = keyStoreFactoryBean;
    }

    private KeyStoreFactoryBean keyStoreFromSystemProperties(String str) {
        if (System.getProperty(str) == null) {
            return null;
        }
        KeyStoreFactoryBean keyStoreFactoryBean = new KeyStoreFactoryBean();
        keyStoreFactoryBean.setLocation(locationFromSystemProperty(str));
        keyStoreFactoryBean.setProvider(System.getProperty(str + "Provider"));
        keyStoreFactoryBean.setPassword(System.getProperty(str + "Password"));
        keyStoreFactoryBean.setType(System.getProperty(str + "Type"));
        return keyStoreFactoryBean;
    }

    private String locationFromSystemProperty(String str) {
        String property = System.getProperty(str);
        if (property != null && !property.startsWith("file:")) {
            property = "file:" + property;
        }
        return property;
    }

    public SecureRandomFactoryBean getSecureRandom() {
        return this.secureRandom == null ? new SecureRandomFactoryBean() : this.secureRandom;
    }

    public void setSecureRandom(SecureRandomFactoryBean secureRandomFactoryBean) {
        this.secureRandom = secureRandomFactoryBean;
    }

    public KeyManagerFactoryFactoryBean getKeyManagerFactory() {
        return this.keyManagerFactory == null ? new KeyManagerFactoryFactoryBean() : this.keyManagerFactory;
    }

    public void setKeyManagerFactory(KeyManagerFactoryFactoryBean keyManagerFactoryFactoryBean) {
        this.keyManagerFactory = keyManagerFactoryFactoryBean;
    }

    public TrustManagerFactoryFactoryBean getTrustManagerFactory() {
        return this.trustManagerFactory == null ? new TrustManagerFactoryFactoryBean() : this.trustManagerFactory;
    }

    public void setTrustManagerFactory(TrustManagerFactoryFactoryBean trustManagerFactoryFactoryBean) {
        this.trustManagerFactory = trustManagerFactoryFactoryBean;
    }

    public String getProtocol() {
        return this.protocol == null ? SSL.DEFAULT_PROTOCOL : this.protocol;
    }

    public void setProtocol(String str) {
        this.protocol = str;
    }

    public String getProvider() {
        return this.provider;
    }

    public void setProvider(String str) {
        this.provider = str;
    }
}
