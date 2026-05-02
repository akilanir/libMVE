package org.spongycastle.pqc.jcajce.provider.gmss;

import java.security.PublicKey;
import org.spongycastle.asn1.ASN1Encodable;
import org.spongycastle.asn1.x509.AlgorithmIdentifier;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.pqc.asn1.GMSSPublicKey;
import org.spongycastle.pqc.asn1.PQCObjectIdentifiers;
import org.spongycastle.pqc.asn1.ParSet;
import org.spongycastle.pqc.crypto.gmss.GMSSParameters;
import org.spongycastle.pqc.crypto.gmss.GMSSPublicKeyParameters;
import org.spongycastle.pqc.jcajce.provider.util.KeyUtil;
import org.spongycastle.pqc.jcajce.spec.GMSSPublicKeySpec;
import org.spongycastle.util.encoders.Hex;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/gmss/BCGMSSPublicKey.class */
public class BCGMSSPublicKey implements CipherParameters, PublicKey {
    private static final long serialVersionUID = 1;
    private byte[] publicKeyBytes;
    private GMSSParameters gmssParameterSet;
    private GMSSParameters gmssParams;

    public BCGMSSPublicKey(byte[] pub, GMSSParameters gmssParameterSet) {
        this.gmssParameterSet = gmssParameterSet;
        this.publicKeyBytes = pub;
    }

    protected BCGMSSPublicKey(GMSSPublicKeySpec keySpec) {
        this(keySpec.getPublicKey(), keySpec.getParameters());
    }

    public BCGMSSPublicKey(GMSSPublicKeyParameters params) {
        this(params.getPublicKey(), params.getParameters());
    }

    @Override // java.security.Key
    public String getAlgorithm() {
        return "GMSS";
    }

    public byte[] getPublicKeyBytes() {
        return this.publicKeyBytes;
    }

    public GMSSParameters getParameterSet() {
        return this.gmssParameterSet;
    }

    public String toString() {
        String out = "GMSS public key : " + new String(Hex.encode(this.publicKeyBytes)) + "\nHeight of Trees: \n";
        for (int i = 0; i < this.gmssParameterSet.getHeightOfTrees().length; i++) {
            out = out + "Layer " + i + " : " + this.gmssParameterSet.getHeightOfTrees()[i] + " WinternitzParameter: " + this.gmssParameterSet.getWinternitzParameter()[i] + " K: " + this.gmssParameterSet.getK()[i] + "\n";
        }
        return out;
    }

    @Override // java.security.Key
    public byte[] getEncoded() {
        return KeyUtil.getEncodedSubjectPublicKeyInfo(new AlgorithmIdentifier(PQCObjectIdentifiers.gmss, new ParSet(this.gmssParameterSet.getNumOfLayers(), this.gmssParameterSet.getHeightOfTrees(), this.gmssParameterSet.getWinternitzParameter(), this.gmssParameterSet.getK()).toASN1Primitive()), (ASN1Encodable) new GMSSPublicKey(this.publicKeyBytes));
    }

    @Override // java.security.Key
    public String getFormat() {
        return "X.509";
    }
}
