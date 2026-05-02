package org.spongycastle.jcajce.provider.asymmetric.dh;

import java.math.BigInteger;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Hashtable;
import javax.crypto.spec.DHParameterSpec;
import org.spongycastle.crypto.AsymmetricCipherKeyPair;
import org.spongycastle.crypto.generators.DHBasicKeyPairGenerator;
import org.spongycastle.crypto.generators.DHParametersGenerator;
import org.spongycastle.crypto.params.DHKeyGenerationParameters;
import org.spongycastle.crypto.params.DHParameters;
import org.spongycastle.crypto.params.DHPrivateKeyParameters;
import org.spongycastle.crypto.params.DHPublicKeyParameters;
import org.spongycastle.jce.provider.BouncyCastleProvider;
import org.spongycastle.util.Integers;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/asymmetric/dh/KeyPairGeneratorSpi.class */
public class KeyPairGeneratorSpi extends KeyPairGenerator {
    private static Hashtable params = new Hashtable();
    private static Object lock = new Object();
    DHKeyGenerationParameters param;
    DHBasicKeyPairGenerator engine;
    int strength;
    int certainty;
    SecureRandom random;
    boolean initialised;

    public KeyPairGeneratorSpi() {
        super("DH");
        this.engine = new DHBasicKeyPairGenerator();
        this.strength = 1024;
        this.certainty = 20;
        this.random = new SecureRandom();
        this.initialised = false;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public void initialize(int strength, SecureRandom random) {
        this.strength = strength;
        this.random = random;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public void initialize(AlgorithmParameterSpec params2, SecureRandom random) throws InvalidAlgorithmParameterException {
        if (!(params2 instanceof DHParameterSpec)) {
            throw new InvalidAlgorithmParameterException("parameter object not a DHParameterSpec");
        }
        DHParameterSpec dhParams = (DHParameterSpec) params2;
        this.param = new DHKeyGenerationParameters(random, new DHParameters(dhParams.getP(), dhParams.getG(), (BigInteger) null, dhParams.getL()));
        this.engine.init(this.param);
        this.initialised = true;
    }

    @Override // java.security.KeyPairGenerator, java.security.KeyPairGeneratorSpi
    public KeyPair generateKeyPair() {
        if (!this.initialised) {
            Integer paramStrength = Integers.valueOf(this.strength);
            if (params.containsKey(paramStrength)) {
                this.param = (DHKeyGenerationParameters) params.get(paramStrength);
            } else {
                DHParameterSpec dhParams = BouncyCastleProvider.CONFIGURATION.getDHDefaultParameters(this.strength);
                if (dhParams != null) {
                    this.param = new DHKeyGenerationParameters(this.random, new DHParameters(dhParams.getP(), dhParams.getG(), (BigInteger) null, dhParams.getL()));
                } else {
                    synchronized (lock) {
                        if (params.containsKey(paramStrength)) {
                            this.param = (DHKeyGenerationParameters) params.get(paramStrength);
                        } else {
                            DHParametersGenerator pGen = new DHParametersGenerator();
                            pGen.init(this.strength, this.certainty, this.random);
                            this.param = new DHKeyGenerationParameters(this.random, pGen.generateParameters());
                            params.put(paramStrength, this.param);
                        }
                    }
                }
            }
            this.engine.init(this.param);
            this.initialised = true;
        }
        AsymmetricCipherKeyPair pair = this.engine.generateKeyPair();
        DHPublicKeyParameters pub = pair.getPublic();
        DHPrivateKeyParameters priv = pair.getPrivate();
        return new KeyPair(new BCDHPublicKey(pub), new BCDHPrivateKey(priv));
    }
}
