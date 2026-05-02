package ch.qos.logback.core.net.ssl;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import javax.net.ssl.TrustManagerFactory;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/TrustManagerFactoryFactoryBean.class */
public class TrustManagerFactoryFactoryBean {
    private String algorithm;
    private String provider;

    public TrustManagerFactory createTrustManagerFactory() throws NoSuchProviderException, NoSuchAlgorithmException {
        return getProvider() != null ? TrustManagerFactory.getInstance(getAlgorithm(), getProvider()) : TrustManagerFactory.getInstance(getAlgorithm());
    }

    public String getAlgorithm() {
        return this.algorithm == null ? TrustManagerFactory.getDefaultAlgorithm() : this.algorithm;
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
