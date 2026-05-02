package org.spongycastle.pqc.jcajce.provider.mceliece;

import java.security.InvalidAlgorithmParameterException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import org.spongycastle.crypto.AsymmetricCipherKeyPair;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2KeyGenerationParameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2KeyPairGenerator;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2Parameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2PrivateKeyParameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceCCA2PublicKeyParameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceKeyGenerationParameters;
import org.spongycastle.pqc.crypto.mceliece.McElieceKeyPairGenerator;
import org.spongycastle.pqc.crypto.mceliece.McElieceParameters;
import org.spongycastle.pqc.crypto.mceliece.McEliecePrivateKeyParameters;
import org.spongycastle.pqc.crypto.mceliece.McEliecePublicKeyParameters;
import org.spongycastle.pqc.jcajce.spec.ECCKeyGenParameterSpec;
import org.spongycastle.pqc.jcajce.spec.McElieceCCA2ParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeyPairGeneratorSpi.class */
public abstract class McElieceKeyPairGeneratorSpi extends KeyPairGenerator {
    public McElieceKeyPairGeneratorSpi(String algorithmName) {
        super(algorithmName);
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeyPairGeneratorSpi$McElieceCCA2.class */
    public static class McElieceCCA2 extends McElieceKeyPairGeneratorSpi {
        McElieceCCA2KeyPairGenerator kpg;

        public McElieceCCA2() {
            super("McElieceCCA-2");
        }

        public McElieceCCA2(String s) {
            super(s);
        }

        @Override // java.security.KeyPairGenerator
        public void initialize(AlgorithmParameterSpec params) throws InvalidAlgorithmParameterException {
            this.kpg = new McElieceCCA2KeyPairGenerator();
            super.initialize(params);
            ECCKeyGenParameterSpec ecc = (ECCKeyGenParameterSpec) params;
            McElieceCCA2KeyGenerationParameters mccca2KGParams = new McElieceCCA2KeyGenerationParameters(new SecureRandom(), new McElieceCCA2Parameters(ecc.getM(), ecc.getT()));
            this.kpg.init(mccca2KGParams);
        }

        @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
        public void initialize(int keySize, SecureRandom random) {
            McElieceCCA2ParameterSpec paramSpec = new McElieceCCA2ParameterSpec();
            try {
                initialize(paramSpec);
            } catch (InvalidAlgorithmParameterException e) {
            }
        }

        @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
        public KeyPair generateKeyPair() {
            AsymmetricCipherKeyPair generateKeyPair = this.kpg.generateKeyPair();
            McElieceCCA2PrivateKeyParameters sk = generateKeyPair.getPrivate();
            McElieceCCA2PublicKeyParameters pk = generateKeyPair.getPublic();
            return new KeyPair(new BCMcElieceCCA2PublicKey(pk), new BCMcElieceCCA2PrivateKey(sk));
        }
    }

    /* loaded from: prov-1.54.0.0.jar:org/spongycastle/pqc/jcajce/provider/mceliece/McElieceKeyPairGeneratorSpi$McEliece.class */
    public static class McEliece extends McElieceKeyPairGeneratorSpi {
        McElieceKeyPairGenerator kpg;

        public McEliece() {
            super("McEliece");
        }

        @Override // java.security.KeyPairGenerator
        public void initialize(AlgorithmParameterSpec params) throws InvalidAlgorithmParameterException {
            this.kpg = new McElieceKeyPairGenerator();
            super.initialize(params);
            ECCKeyGenParameterSpec ecc = (ECCKeyGenParameterSpec) params;
            McElieceKeyGenerationParameters mccKGParams = new McElieceKeyGenerationParameters(new SecureRandom(), new McElieceParameters(ecc.getM(), ecc.getT()));
            this.kpg.init(mccKGParams);
        }

        @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
        public void initialize(int keySize, SecureRandom random) {
            ECCKeyGenParameterSpec paramSpec = new ECCKeyGenParameterSpec();
            try {
                initialize(paramSpec);
            } catch (InvalidAlgorithmParameterException e) {
            }
        }

        @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
        public KeyPair generateKeyPair() {
            AsymmetricCipherKeyPair generateKeyPair = this.kpg.generateKeyPair();
            McEliecePrivateKeyParameters sk = generateKeyPair.getPrivate();
            McEliecePublicKeyParameters pk = generateKeyPair.getPublic();
            return new KeyPair(new BCMcEliecePublicKey(pk), new BCMcEliecePrivateKey(sk));
        }
    }
}
