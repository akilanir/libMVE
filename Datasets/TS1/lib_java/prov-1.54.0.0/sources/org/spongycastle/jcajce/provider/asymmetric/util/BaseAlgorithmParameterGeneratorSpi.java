package org.spongycastle.jcajce.provider.asymmetric.util;

import java.security.AlgorithmParameterGeneratorSpi;
import java.security.AlgorithmParameters;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import org.spongycastle.jcajce.util.BCJcaJceHelper;
import org.spongycastle.jcajce.util.JcaJceHelper;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/util/BaseAlgorithmParameterGeneratorSpi.class */
public abstract class BaseAlgorithmParameterGeneratorSpi extends AlgorithmParameterGeneratorSpi {
    private final JcaJceHelper helper = new BCJcaJceHelper();

    protected final AlgorithmParameters createParametersInstance(String algorithm) throws NoSuchAlgorithmException, NoSuchProviderException {
        return this.helper.createAlgorithmParameters(algorithm);
    }
}
