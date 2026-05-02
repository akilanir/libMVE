package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyFactorySpi;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.pkcs.PrivateKeyInfo;
import org.spongycastle.asn1.x509.SubjectPublicKeyInfo;
import org.spongycastle.pqc.asn1.McEliecePrivateKey;
import org.spongycastle.pqc.asn1.McEliecePublicKey;
import org.spongycastle.pqc.jcajce.spec.McEliecePrivateKeySpec;
import org.spongycastle.pqc.jcajce.spec.McEliecePublicKeySpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeyFactorySpi.class */
public class McElieceKeyFactorySpi extends KeyFactorySpi {
    public static final String OID = "1.3.6.1.4.1.8301.3.1.3.4.1";

    public PublicKey generatePublic(KeySpec keySpec) throws InvalidKeySpecException {
        if (keySpec instanceof McEliecePublicKeySpec) {
            return new BCMcEliecePublicKey((McEliecePublicKeySpec) keySpec);
        }
        if (keySpec instanceof X509EncodedKeySpec) {
            byte[] encKey = ((X509EncodedKeySpec) keySpec).getEncoded();
            try {
                SubjectPublicKeyInfo pki = SubjectPublicKeyInfo.getInstance(ASN1Primitive.fromByteArray(encKey));
                try {
                    ASN1Sequence publicKey = pki.parsePublicKey();
                    publicKey.getObjectAt(0).toString();
                    BigInteger bigN = publicKey.getObjectAt(1).getValue();
                    int n = bigN.intValue();
                    BigInteger bigT = publicKey.getObjectAt(2).getValue();
                    int t = bigT.intValue();
                    byte[] matrixG = publicKey.getObjectAt(3).getOctets();
                    return new BCMcEliecePublicKey(new McEliecePublicKeySpec(OID, t, n, matrixG));
                } catch (IOException cce) {
                    throw new InvalidKeySpecException("Unable to decode X509EncodedKeySpec: " + cce.getMessage());
                }
            } catch (IOException e) {
                throw new InvalidKeySpecException(e.toString());
            }
        }
        throw new InvalidKeySpecException("Unsupported key specification: " + keySpec.getClass() + ".");
    }

    /* JADX WARN: Type inference failed for: r0v63, types: [byte[], byte[][]] */
    public PrivateKey generatePrivate(KeySpec keySpec) throws InvalidKeySpecException {
        if (keySpec instanceof McEliecePrivateKeySpec) {
            return new BCMcEliecePrivateKey((McEliecePrivateKeySpec) keySpec);
        }
        if (keySpec instanceof PKCS8EncodedKeySpec) {
            byte[] encKey = ((PKCS8EncodedKeySpec) keySpec).getEncoded();
            try {
                PrivateKeyInfo pki = PrivateKeyInfo.getInstance(ASN1Primitive.fromByteArray(encKey));
                try {
                    ASN1Sequence privKey = pki.parsePrivateKey().toASN1Primitive();
                    privKey.getObjectAt(0).toString();
                    BigInteger bigN = privKey.getObjectAt(1).getValue();
                    int n = bigN.intValue();
                    BigInteger bigK = privKey.getObjectAt(2).getValue();
                    int k = bigK.intValue();
                    byte[] encFieldPoly = privKey.getObjectAt(3).getOctets();
                    byte[] encGoppaPoly = privKey.getObjectAt(4).getOctets();
                    byte[] encSInv = privKey.getObjectAt(5).getOctets();
                    byte[] encP1 = privKey.getObjectAt(6).getOctets();
                    byte[] encP2 = privKey.getObjectAt(7).getOctets();
                    byte[] encH = privKey.getObjectAt(8).getOctets();
                    ASN1Sequence qSeq = privKey.getObjectAt(9);
                    ?? r0 = new byte[qSeq.size()];
                    for (int i = 0; i < qSeq.size(); i++) {
                        r0[i] = qSeq.getObjectAt(i).getOctets();
                    }
                    return new BCMcEliecePrivateKey(new McEliecePrivateKeySpec(OID, n, k, encFieldPoly, encGoppaPoly, encSInv, encP1, encP2, encH, (byte[][]) r0));
                } catch (IOException e) {
                    throw new InvalidKeySpecException("Unable to decode PKCS8EncodedKeySpec.");
                }
            } catch (IOException e2) {
                throw new InvalidKeySpecException("Unable to decode PKCS8EncodedKeySpec: " + e2);
            }
        }
        throw new InvalidKeySpecException("Unsupported key specification: " + keySpec.getClass() + ".");
    }

    public KeySpec getKeySpec(Key key, Class keySpec) throws InvalidKeySpecException {
        if (key instanceof BCMcEliecePrivateKey) {
            if (PKCS8EncodedKeySpec.class.isAssignableFrom(keySpec)) {
                return new PKCS8EncodedKeySpec(key.getEncoded());
            }
            if (McEliecePrivateKeySpec.class.isAssignableFrom(keySpec)) {
                BCMcEliecePrivateKey privKey = (BCMcEliecePrivateKey) key;
                return new McEliecePrivateKeySpec(OID, privKey.getN(), privKey.getK(), privKey.getField(), privKey.getGoppaPoly(), privKey.getSInv(), privKey.getP1(), privKey.getP2(), privKey.getH(), privKey.getQInv());
            }
        } else if (key instanceof BCMcEliecePublicKey) {
            if (X509EncodedKeySpec.class.isAssignableFrom(keySpec)) {
                return new X509EncodedKeySpec(key.getEncoded());
            }
            if (McEliecePublicKeySpec.class.isAssignableFrom(keySpec)) {
                BCMcEliecePublicKey pubKey = (BCMcEliecePublicKey) key;
                return new McEliecePublicKeySpec(OID, pubKey.getN(), pubKey.getT(), pubKey.getG());
            }
        } else {
            throw new InvalidKeySpecException("Unsupported key type: " + key.getClass() + ".");
        }
        throw new InvalidKeySpecException("Unknown key specification: " + keySpec + ".");
    }

    public Key translateKey(Key key) throws InvalidKeyException {
        if ((key instanceof BCMcEliecePrivateKey) || (key instanceof BCMcEliecePublicKey)) {
            return key;
        }
        throw new InvalidKeyException("Unsupported key type.");
    }

    public PublicKey generatePublic(SubjectPublicKeyInfo pki) throws InvalidKeySpecException {
        try {
            ASN1Primitive innerType = pki.parsePublicKey();
            McEliecePublicKey key = McEliecePublicKey.getInstance(innerType);
            return new BCMcEliecePublicKey(key.getOID().getId(), key.getN(), key.getT(), key.getG());
        } catch (IOException e) {
            throw new InvalidKeySpecException("Unable to decode X509EncodedKeySpec");
        }
    }

    public PrivateKey generatePrivate(PrivateKeyInfo pki) throws InvalidKeySpecException {
        try {
            ASN1Primitive innerType = pki.parsePrivateKey().toASN1Primitive();
            McEliecePrivateKey key = McEliecePrivateKey.getInstance(innerType);
            return new BCMcEliecePrivateKey(key.getOID().getId(), key.getN(), key.getK(), key.getField(), key.getGoppaPoly(), key.getSInv(), key.getP1(), key.getP2(), key.getH(), key.getQInv());
        } catch (IOException e) {
            throw new InvalidKeySpecException("Unable to decode PKCS8EncodedKeySpec");
        }
    }

    @Override // java.security.KeyFactorySpi
    protected PublicKey engineGeneratePublic(KeySpec keySpec) throws InvalidKeySpecException {
        return null;
    }

    @Override // java.security.KeyFactorySpi
    protected PrivateKey engineGeneratePrivate(KeySpec keySpec) throws InvalidKeySpecException {
        return null;
    }

    @Override // java.security.KeyFactorySpi
    protected KeySpec engineGetKeySpec(Key key, Class tClass) throws InvalidKeySpecException {
        return null;
    }

    @Override // java.security.KeyFactorySpi
    protected Key engineTranslateKey(Key key) throws InvalidKeyException {
        return null;
    }
}
