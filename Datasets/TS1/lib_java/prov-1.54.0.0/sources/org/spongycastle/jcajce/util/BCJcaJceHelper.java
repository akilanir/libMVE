package org.spongycastle.jcajce.util;

import java.security.Provider;
import java.security.Security;
import org.spongycastle.jce.provider.BouncyCastleProvider;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/util/BCJcaJceHelper.class */
public class BCJcaJceHelper extends ProviderJcaJceHelper {
    private static Provider getBouncyCastleProvider() {
        if (Security.getProvider(BouncyCastleProvider.PROVIDER_NAME) != null) {
            return Security.getProvider(BouncyCastleProvider.PROVIDER_NAME);
        }
        return new BouncyCastleProvider();
    }

    public BCJcaJceHelper() {
        super(getBouncyCastleProvider());
    }
}
