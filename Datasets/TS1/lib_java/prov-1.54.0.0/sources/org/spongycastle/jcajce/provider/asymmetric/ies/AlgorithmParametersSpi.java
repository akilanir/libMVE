package org.spongycastle.jcajce.provider.asymmetric.ies;

import java.io.IOException;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidParameterSpecException;
import org.spongycastle.asn1.ASN1EncodableVector;
import org.spongycastle.asn1.ASN1Integer;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.DEROctetString;
import org.spongycastle.asn1.DERSequence;
import org.spongycastle.jce.spec.IESParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/ies/AlgorithmParametersSpi.class */
public class AlgorithmParametersSpi extends java.security.AlgorithmParametersSpi {
    IESParameterSpec currentSpec;

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

    @Override // java.security.AlgorithmParametersSpi
    protected byte[] engineGetEncoded() {
        try {
            ASN1EncodableVector v = new ASN1EncodableVector();
            v.add(new DEROctetString(this.currentSpec.getDerivationV()));
            v.add(new DEROctetString(this.currentSpec.getEncodingV()));
            v.add(new ASN1Integer(this.currentSpec.getMacKeySize()));
            return new DERSequence(v).getEncoded("DER");
        } catch (IOException e) {
            throw new RuntimeException("Error encoding IESParameters");
        }
    }

    @Override // java.security.AlgorithmParametersSpi
    protected byte[] engineGetEncoded(String format) {
        if (isASN1FormatString(format) || format.equalsIgnoreCase("X.509")) {
            return engineGetEncoded();
        }
        return null;
    }

    protected AlgorithmParameterSpec localEngineGetParameterSpec(Class paramSpec) throws InvalidParameterSpecException {
        if (paramSpec == IESParameterSpec.class || paramSpec == AlgorithmParameterSpec.class) {
            return this.currentSpec;
        }
        throw new InvalidParameterSpecException("unknown parameter spec passed to ElGamal parameters object.");
    }

    @Override // java.security.AlgorithmParametersSpi
    protected void engineInit(AlgorithmParameterSpec paramSpec) throws InvalidParameterSpecException {
        if (!(paramSpec instanceof IESParameterSpec)) {
            throw new InvalidParameterSpecException("IESParameterSpec required to initialise a IES algorithm parameters object");
        }
        this.currentSpec = (IESParameterSpec) paramSpec;
    }

    @Override // java.security.AlgorithmParametersSpi
    protected void engineInit(byte[] params) throws IOException {
        try {
            ASN1Sequence s = ASN1Primitive.fromByteArray(params);
            this.currentSpec = new IESParameterSpec(s.getObjectAt(0).getOctets(), s.getObjectAt(0).getOctets(), s.getObjectAt(0).getValue().intValue());
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new IOException("Not a valid IES Parameter encoding.");
        } catch (ClassCastException e2) {
            throw new IOException("Not a valid IES Parameter encoding.");
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
        return "IES Parameters";
    }
}
