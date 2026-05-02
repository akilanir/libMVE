package org.spongycastle.jcajce.provider.asymmetric.dsa;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidParameterException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.DSAParameterSpec;
import org.spongycastle.crypto.AsymmetricCipherKeyPair;
import org.spongycastle.crypto.generators.DSAKeyPairGenerator;
import org.spongycastle.crypto.generators.DSAParametersGenerator;
import org.spongycastle.crypto.params.DSAKeyGenerationParameters;
import org.spongycastle.crypto.params.DSAParameters;
import org.spongycastle.crypto.params.DSAPrivateKeyParameters;
import org.spongycastle.crypto.params.DSAPublicKeyParameters;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dsa/KeyPairGeneratorSpi.class */
public class KeyPairGeneratorSpi extends KeyPairGenerator {
    DSAKeyGenerationParameters param;
    DSAKeyPairGenerator engine;
    int strength;
    int certainty;
    SecureRandom random;
    boolean initialised;

    public KeyPairGeneratorSpi() {
        super("DSA");
        this.engine = new DSAKeyPairGenerator();
        this.strength = 1024;
        this.certainty = 20;
        this.random = new SecureRandom();
        this.initialised = false;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public void initialize(int strength, SecureRandom random) {
        if (strength < 512 || strength > 4096 || ((strength < 1024 && strength % 64 != 0) || (strength >= 1024 && strength % 1024 != 0))) {
            throw new InvalidParameterException("strength must be from 512 - 4096 and a multiple of 1024 above 1024");
        }
        this.strength = strength;
        this.random = random;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public void initialize(AlgorithmParameterSpec params, SecureRandom random) throws InvalidAlgorithmParameterException {
        if (!(params instanceof DSAParameterSpec)) {
            throw new InvalidAlgorithmParameterException("parameter object not a DSAParameterSpec");
        }
        DSAParameterSpec dsaParams = (DSAParameterSpec) params;
        this.param = new DSAKeyGenerationParameters(random, new DSAParameters(dsaParams.getP(), dsaParams.getQ(), dsaParams.getG()));
        this.engine.init(this.param);
        this.initialised = true;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public KeyPair generateKeyPair() {
        if (!this.initialised) {
            DSAParametersGenerator pGen = new DSAParametersGenerator();
            pGen.init(this.strength, this.certainty, this.random);
            this.param = new DSAKeyGenerationParameters(this.random, pGen.generateParameters());
            this.engine.init(this.param);
            this.initialised = true;
        }
        AsymmetricCipherKeyPair pair = this.engine.generateKeyPair();
        DSAPublicKeyParameters pub = pair.getPublic();
        DSAPrivateKeyParameters priv = pair.getPrivate();
        return new KeyPair(new BCDSAPublicKey(pub), new BCDSAPrivateKey(priv));
    }
}
