package ch.qos.logback.core.net.ssl;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import javax.net.ssl.KeyManagerFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/KeyManagerFactoryFactoryBean.class */
public class KeyManagerFactoryFactoryBean {
    private String algorithm;
    private String provider;

    public KeyManagerFactory createKeyManagerFactory() throws NoSuchProviderException, NoSuchAlgorithmException {
        return getProvider() != null ? KeyManagerFactory.getInstance(getAlgorithm(), getProvider()) : KeyManagerFactory.getInstance(getAlgorithm());
    }

    public String getAlgorithm() {
        return this.algorithm == null ? KeyManagerFactory.getDefaultAlgorithm() : this.algorithm;
    }

    public void setAlgorithm(String str) {
        this.algorithm = str;
    }

    public String getProvider() {
        return this.provider;
    }

    public void setProvider(String str) {
        this.provider = str;
    }
}
