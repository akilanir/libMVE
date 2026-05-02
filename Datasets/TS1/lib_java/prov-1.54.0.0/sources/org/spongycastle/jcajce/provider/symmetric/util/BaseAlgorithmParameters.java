package org.spongycastle.jcajce.provider.symmetric.util;

import java.security.AlgorithmParametersSpi;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameters.class */
public abstract class BaseAlgorithmParameters extends AlgorithmParametersSpi {
    protected abstract AlgorithmParameterSpec localEngineGetParameterSpec(Class cls) throws InvalidParameterSpecException;

    protected boolean isASN1FormatString(String format) {
        return format == null || format.equals("ASN.1");
    }

    @Override // java.security.AlgorithmParametersSpi
    protected AlgorithmParameterSpec engineGetParameterSpec(Class paramSpec) throws InvalidParameterSpecException {
        if (paramSpec == null) {
            throw new NullPointerException("argument to getParameterSpec must not be null");
        }
        return localEngineGetParameterSpec(paramSpec);
    }
}
