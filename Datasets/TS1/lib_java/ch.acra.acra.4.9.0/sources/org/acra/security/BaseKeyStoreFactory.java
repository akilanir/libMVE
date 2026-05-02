package org.acra.security;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.util.IOUtils;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/BaseKeyStoreFactory.class */
public abstract class BaseKeyStoreFactory implements KeyStoreFactory {
    private final String certificateType;

    /* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/BaseKeyStoreFactory$Type.class */
    public enum Type {
        CERTIFICATE,
        KEYSTORE
    }

    protected abstract InputStream getInputStream(@NonNull Context context);

    public BaseKeyStoreFactory() {
        this(ACRAConstants.DEFAULT_CERTIFICATE_TYPE);
    }

    public BaseKeyStoreFactory(String certificateType) {
        this.certificateType = certificateType;
    }

    protected String getKeyStoreType() {
        return KeyStore.getDefaultType();
    }

    protected Type getStreamType() {
        return Type.CERTIFICATE;
    }

    protected char[] getPassword() {
        return null;
    }

    @Override // org.acra.security.KeyStoreFactory
    @Nullable
    public final KeyStore create(@NonNull Context context) {
        InputStream inputStream = getInputStream(context);
        if (inputStream == null) {
            return null;
        }
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        try {
            try {
                try {
                    KeyStore keyStore = KeyStore.getInstance(getKeyStoreType());
                    switch (getStreamType()) {
                        case CERTIFICATE:
                            CertificateFactory certificateFactory = CertificateFactory.getInstance(this.certificateType);
                            Certificate certificate = certificateFactory.generateCertificate(bufferedInputStream);
                            keyStore.load(null, null);
                            keyStore.setCertificateEntry("ca", certificate);
                            break;
                        case KEYSTORE:
                            keyStore.load(bufferedInputStream, getPassword());
                            break;
                    }
                    IOUtils.safeClose(bufferedInputStream);
                    return keyStore;
                } catch (KeyStoreException e) {
                    ACRA.log.e(ACRA.LOG_TAG, "Could not load keystore", e);
                    IOUtils.safeClose(bufferedInputStream);
                    return null;
                } catch (CertificateException e2) {
                    ACRA.log.e(ACRA.LOG_TAG, "Could not load certificate", e2);
                    IOUtils.safeClose(bufferedInputStream);
                    return null;
                }
            } catch (IOException e3) {
                ACRA.log.e(ACRA.LOG_TAG, "Could not load keystore", e3);
                IOUtils.safeClose(bufferedInputStream);
                return null;
            } catch (NoSuchAlgorithmException e4) {
                ACRA.log.e(ACRA.LOG_TAG, "Could not load keystore", e4);
                IOUtils.safeClose(bufferedInputStream);
                return null;
            }
        } catch (Throwable th) {
            IOUtils.safeClose(bufferedInputStream);
            throw th;
        }
    }
}
