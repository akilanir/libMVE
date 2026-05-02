package org.spongycastle.jcajce.provider.asymmetric.elgamal;

import java.io.IOException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import javax.crypto.spec.DHParameterSpec;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.oiw.ElGamalParameter;
import org.spongycastle.jcajce.provider.symmetric.util.BaseAlgorithmParameters;
import org.spongycastle.jce.spec.ElGamalParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/elgamal/AlgorithmParametersSpi.class */
public class AlgorithmParametersSpi extends BaseAlgorithmParameters {
    ElGamalParameterSpec currentSpec;

    @Override // java.security.AlgorithmParametersSpi
    protected byte[] engineGetEncoded() {
        ElGamalParameter elP = new ElGamalParameter(this.currentSpec.getP(), this.currentSpec.getG());
        try {
            return elP.getEncoded("DER");
        } catch (IOException e) {
            throw new RuntimeException("Error encoding ElGamalParameters");
        }
    }

    @Override // java.security.AlgorithmParametersSpi
    protected byte[] engineGetEncoded(String format) {
        if (isASN1FormatString(format) || format.equalsIgnoreCase("X.509")) {
            return engineGetEncoded();
        }
        return null;
    }

    @Override // org.spongycastle.jcajce.provider.symmetric.util.BaseAlgorithmParameters
    protected AlgorithmParameterSpec localEngineGetParameterSpec(Class paramSpec) throws InvalidParameterSpecException {
        if (paramSpec == ElGamalParameterSpec.class || paramSpec == AlgorithmParameterSpec.class) {
            return this.currentSpec;
        }
        if (paramSpec == DHParameterSpec.class) {
            return new DHParameterSpec(this.currentSpec.getP(), this.currentSpec.getG());
        }
        throw new InvalidParameterSpecException("unknown parameter spec passed to ElGamal parameters object.");
    }

    @Override // java.security.AlgorithmParametersSpi
    protected void engineInit(AlgorithmParameterSpec paramSpec) throws InvalidParameterSpecException {
        if (!(paramSpec instanceof ElGamalParameterSpec) && !(paramSpec instanceof DHParameterSpec)) {
            throw new InvalidParameterSpecException("DHParameterSpec required to initialise a ElGamal algorithm parameters object");
        }
        if (paramSpec instanceof ElGamalParameterSpec) {
            this.currentSpec = (ElGamalParameterSpec) paramSpec;
        } else {
            DHParameterSpec s = (DHParameterSpec) paramSpec;
            this.currentSpec = new ElGamalParameterSpec(s.getP(), s.getG());
        }
    }

    @Override // java.security.AlgorithmParametersSpi
    protected void engineInit(byte[] params) throws IOException {
        try {
            ElGamalParameter elP = ElGamalParameter.getInstance(ASN1Primitive.fromByteArray(params));
            this.currentSpec = new ElGamalParameterSpec(elP.getP(), elP.getG());
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new IOException("Not a valid ElGamal Parameter encoding.");
        } catch (ClassCastException e2) {
            throw new IOException("Not a valid ElGamal Parameter encoding.");
        }
    }

    @Override // java.security.AlgorithmParametersSpi
    protected void engineInit(byte[] params, String format) throws IOException {
        if (isASN1FormatString(format) || format.equalsIgnoreCase("X.509")) {
            engineInit(params);
            return;
        }
        throw new IOException("Unknown parameter format " + format);
    }

    @Override // java.security.AlgorithmParametersSpi
    protected String engineToString() {
        return "ElGamal Parameters";
    }
}
