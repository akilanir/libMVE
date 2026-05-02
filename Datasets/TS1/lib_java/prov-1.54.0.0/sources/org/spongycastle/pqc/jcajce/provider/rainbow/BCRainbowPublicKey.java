package org.spongycastle.pqc.jcajce.provider.rainbow;

import java.security.PublicKey;
import org.spongycastle.asn1.ASN1Encodable;
import org.spongycastle.asn1.DERNull;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.pqc.asn1.PQCObjectIdentifiers;
import org.spongycastle.pqc.asn1.RainbowPublicKey;
import org.spongycastle.pqc.crypto.rainbow.RainbowParameters;
import org.spongycastle.pqc.crypto.rainbow.RainbowPublicKeyParameters;
import org.spongycastle.pqc.crypto.rainbow.util.RainbowUtil;
import org.spongycastle.pqc.jcajce.provider.util.KeyUtil;
import org.spongycastle.pqc.jcajce.spec.RainbowPublicKeySpec;
import org.spongycastle.util.Arrays;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPublicKey.class */
public class BCRainbowPublicKey implements PublicKey {
    private static final long serialVersionUID = 1;
    private short[][] coeffquadratic;
    private short[][] coeffsingular;
    private short[] coeffscalar;
    private int docLength;
    private RainbowParameters rainbowParams;

    public BCRainbowPublicKey(int docLength, short[][] coeffQuadratic, short[][] coeffSingular, short[] coeffScalar) {
        this.docLength = docLength;
        this.coeffquadratic = coeffQuadratic;
        this.coeffsingular = coeffSingular;
        this.coeffscalar = coeffScalar;
    }

    public BCRainbowPublicKey(RainbowPublicKeySpec keySpec) {
        this(keySpec.getDocLength(), keySpec.getCoeffQuadratic(), keySpec.getCoeffSingular(), keySpec.getCoeffScalar());
    }

    public BCRainbowPublicKey(RainbowPublicKeyParameters params) {
        this(params.getDocLength(), params.getCoeffQuadratic(), params.getCoeffSingular(), params.getCoeffScalar());
    }

    public int getDocLength() {
        return this.docLength;
    }

    public short[][] getCoeffQuadratic() {
        return this.coeffquadratic;
    }

    /* JADX WARN: Type inference failed for: r0v3, types: [short[], short[][]] */
    public short[][] getCoeffSingular() {
        ?? r0 = new short[this.coeffsingular.length];
        for (int i = 0; i != this.coeffsingular.length; i++) {
            r0[i] = Arrays.clone(this.coeffsingular[i]);
        }
        return r0;
    }

    public short[] getCoeffScalar() {
        return Arrays.clone(this.coeffscalar);
    }

    public boolean equals(Object other) {
        if (other == null || !(other instanceof BCRainbowPublicKey)) {
            return false;
        }
        BCRainbowPublicKey otherKey = (BCRainbowPublicKey) other;
        return this.docLength == otherKey.getDocLength() && RainbowUtil.equals(this.coeffquadratic, otherKey.getCoeffQuadratic()) && RainbowUtil.equals(this.coeffsingular, otherKey.getCoeffSingular()) && RainbowUtil.equals(this.coeffscalar, otherKey.getCoeffScalar());
    }

    public int hashCode() {
        int hash = this.docLength;
        return (((((hash * 37) + Arrays.hashCode(this.coeffquadratic)) * 37) + Arrays.hashCode(this.coeffsingular)) * 37) + Arrays.hashCode(this.coeffscalar);
    }

    @Override // java.security.Key
    public final String getAlgorithm() {
        return "Rainbow";
    }

    @Override // java.security.Key
    public String getFormat() {
        return "X.509";
    }

    @Override // java.security.Key
    public byte[] getEncoded() {
        RainbowPublicKey key = new RainbowPublicKey(this.docLength, this.coeffquadratic, this.coeffsingular, this.coeffscalar);
        AlgorithmIdentifier algorithmIdentifier = new AlgorithmIdentifier(PQCObjectIdentifiers.rainbow, DERNull.INSTANCE);
        return KeyUtil.getEncodedSubjectPublicKeyInfo(algorithmIdentifier, (ASN1Encodable) key);
    }
}
