package ch.qos.logback.core.net.ssl;

import ch.qos.logback.core.util.LocationUtil;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/net/ssl/KeyStoreFactoryBean.class */
public class KeyStoreFactoryBean {
    private String location;
    private String provider;
    private String type;
    private String password;

    public KeyStore createKeyStore() throws NoSuchProviderException, NoSuchAlgorithmException, KeyStoreException {
        if (getLocation() == null) {
            throw new IllegalArgumentException("location is required");
        }
        InputStream inputStream = null;
        try {
            try {
                try {
                    try {
                        try {
                            inputStream = LocationUtil.urlForResource(getLocation()).openStream();
                            KeyStore newKeyStore = newKeyStore();
                            newKeyStore.load(inputStream, getPassword().toCharArray());
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e) {
                                    e.printStackTrace(System.err);
                                }
                            }
                            return newKeyStore;
                        } catch (Exception e2) {
                            throw new KeyStoreException(getLocation() + ": " + e2.getMessage(), e2);
                        }
                    } catch (NoSuchAlgorithmException e3) {
                        throw new NoSuchAlgorithmException("no such keystore type: " + getType());
                    }
                } catch (FileNotFoundException e4) {
                    throw new KeyStoreException(getLocation() + ": file not found");
                }
            } catch (Throwable th) {
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e5) {
                        e5.printStackTrace(System.err);
                        throw th;
                    }
                }
                throw th;
            }
        } catch (NoSuchProviderException e6) {
            throw new NoSuchProviderException("no such keystore provider: " + getProvider());
        }
    }

    private KeyStore newKeyStore() throws NoSuchAlgorithmException, NoSuchProviderException, KeyStoreException {
        return getProvider() != null ? KeyStore.getInstance(getType(), getProvider()) : KeyStore.getInstance(getType());
    }

    public String getLocation() {
        return this.location;
    }

    public void setLocation(String str) {
        this.location = str;
    }

    public String getType() {
        return this.type == null ? SSL.DEFAULT_KEYSTORE_TYPE : this.type;
    }

    public void setType(String str) {
        this.type = str;
    }

    public String getProvider() {
        return this.provider;
    }

    public void setProvider(String str) {
        this.provider = str;
    }

    public String getPassword() {
        return this.password == null ? SSL.DEFAULT_KEYSTORE_PASSWORD : this.password;
    }

    public void setPassword(String str) {
        this.password = str;
    }
}
