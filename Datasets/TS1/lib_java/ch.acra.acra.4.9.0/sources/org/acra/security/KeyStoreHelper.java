package org.acra.security;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.security.KeyStore;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/security/KeyStoreHelper.class */
public final class KeyStoreHelper {
    private static final String ASSET_PREFIX = "asset://";

    private KeyStoreHelper() {
    }

    @Nullable
    public static KeyStore getKeyStore(@NonNull Context context, @NonNull ACRAConfiguration config) {
        Class<? extends KeyStoreFactory> keyStoreFactory = config.keyStoreFactoryClass();
        KeyStore keyStore = null;
        try {
            keyStore = keyStoreFactory.newInstance().create(context);
        } catch (IllegalAccessException e) {
            ACRA.log.e(ACRA.LOG_TAG, "Could not get keystore from factory", e);
        } catch (InstantiationException e2) {
            ACRA.log.e(ACRA.LOG_TAG, "Could not get keystore from factory", e2);
        }
        if (keyStore == null) {
            int certificateRes = config.resCertificate();
            String certificatePath = config.certificatePath();
            String certificateType = config.certificateType();
            if (certificateRes != 0) {
                keyStore = new ResourceKeyStoreFactory(certificateType, certificateRes).create(context);
            } else if (!certificatePath.equals("")) {
                if (certificatePath.startsWith(ASSET_PREFIX)) {
                    keyStore = new AssetKeyStoreFactory(certificateType, certificatePath.substring(ASSET_PREFIX.length())).create(context);
                } else {
                    keyStore = new FileKeyStoreFactory(certificateType, certificatePath).create(context);
                }
            }
        }
        return keyStore;
    }
}
