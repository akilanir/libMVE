package org.spongycastle.jcajce.provider.config;

import javax.crypto.spec.DHParameterSpec;
import org.spongycastle.jce.spec.ECParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/config/ProviderConfiguration.class */
public interface ProviderConfiguration {
    ECParameterSpec getEcImplicitlyCa();

    DHParameterSpec getDHDefaultParameters(int i);
}
