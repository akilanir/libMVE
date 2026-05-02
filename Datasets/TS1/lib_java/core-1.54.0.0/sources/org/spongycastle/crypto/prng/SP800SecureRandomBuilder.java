package org.spongycastle.crypto.prng;

import java.security.SecureRandom;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.Mac;
import org.spongycastle.crypto.prng.drbg.CTRSP800DRBG;
import org.spongycastle.crypto.prng.drbg.DualECPoints;
import org.spongycastle.crypto.prng.drbg.DualECSP800DRBG;
import org.spongycastle.crypto.prng.drbg.HMacSP800DRBG;
import org.spongycastle.crypto.prng.drbg.HashSP800DRBG;
import org.spongycastle.crypto.prng.drbg.SP80090DRBG;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder.class */
public class SP800SecureRandomBuilder {
    private final SecureRandom random;
    private final EntropySourceProvider entropySourceProvider;
    private byte[] personalizationString;
    private int securityStrength;
    private int entropyBitsRequired;

    public SP800SecureRandomBuilder() {
        this(new SecureRandom(), false);
    }

    public SP800SecureRandomBuilder(SecureRandom entropySource, boolean predictionResistant) {
        this.securityStrength = 256;
        this.entropyBitsRequired = 256;
        this.random = entropySource;
        this.entropySourceProvider = new BasicEntropySourceProvider(this.random, predictionResistant);
    }

    public SP800SecureRandomBuilder(EntropySourceProvider entropySourceProvider) {
        this.securityStrength = 256;
        this.entropyBitsRequired = 256;
        this.random = null;
        this.entropySourceProvider = entropySourceProvider;
    }

    public SP800SecureRandomBuilder setPersonalizationString(byte[] personalizationString) {
        this.personalizationString = personalizationString;
        return this;
    }

    public SP800SecureRandomBuilder setSecurityStrength(int securityStrength) {
        this.securityStrength = securityStrength;
        return this;
    }

    public SP800SecureRandomBuilder setEntropyBitsRequired(int entropyBitsRequired) {
        this.entropyBitsRequired = entropyBitsRequired;
        return this;
    }

    public SP800SecureRandom buildHash(Digest digest, byte[] nonce, boolean predictionResistant) {
        return new SP800SecureRandom(this.random, this.entropySourceProvider.get(this.entropyBitsRequired), new HashDRBGProvider(digest, nonce, this.personalizationString, this.securityStrength), predictionResistant);
    }

    public SP800SecureRandom buildCTR(BlockCipher cipher, int keySizeInBits, byte[] nonce, boolean predictionResistant) {
        return new SP800SecureRandom(this.random, this.entropySourceProvider.get(this.entropyBitsRequired), new CTRDRBGProvider(cipher, keySizeInBits, nonce, this.personalizationString, this.securityStrength), predictionResistant);
    }

    public SP800SecureRandom buildHMAC(Mac hMac, byte[] nonce, boolean predictionResistant) {
        return new SP800SecureRandom(this.random, this.entropySourceProvider.get(this.entropyBitsRequired), new HMacDRBGProvider(hMac, nonce, this.personalizationString, this.securityStrength), predictionResistant);
    }

    public SP800SecureRandom buildDualEC(Digest digest, byte[] nonce, boolean predictionResistant) {
        return new SP800SecureRandom(this.random, this.entropySourceProvider.get(this.entropyBitsRequired), new DualECDRBGProvider(digest, nonce, this.personalizationString, this.securityStrength), predictionResistant);
    }

    public SP800SecureRandom buildDualEC(DualECPoints[] pointSet, Digest digest, byte[] nonce, boolean predictionResistant) {
        return new SP800SecureRandom(this.random, this.entropySourceProvider.get(this.entropyBitsRequired), new ConfigurableDualECDRBGProvider(pointSet, digest, nonce, this.personalizationString, this.securityStrength), predictionResistant);
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder$HashDRBGProvider.class */
    private static class HashDRBGProvider implements DRBGProvider {
        private final Digest digest;
        private final byte[] nonce;
        private final byte[] personalizationString;
        private final int securityStrength;

        public HashDRBGProvider(Digest digest, byte[] nonce, byte[] personalizationString, int securityStrength) {
            this.digest = digest;
            this.nonce = nonce;
            this.personalizationString = personalizationString;
            this.securityStrength = securityStrength;
        }

        @Override // org.spongycastle.crypto.prng.DRBGProvider
        public SP80090DRBG get(EntropySource entropySource) {
            return new HashSP800DRBG(this.digest, this.securityStrength, entropySource, this.personalizationString, this.nonce);
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder$DualECDRBGProvider.class */
    private static class DualECDRBGProvider implements DRBGProvider {
        private final Digest digest;
        private final byte[] nonce;
        private final byte[] personalizationString;
        private final int securityStrength;

        public DualECDRBGProvider(Digest digest, byte[] nonce, byte[] personalizationString, int securityStrength) {
            this.digest = digest;
            this.nonce = nonce;
            this.personalizationString = personalizationString;
            this.securityStrength = securityStrength;
        }

        @Override // org.spongycastle.crypto.prng.DRBGProvider
        public SP80090DRBG get(EntropySource entropySource) {
            return new DualECSP800DRBG(this.digest, this.securityStrength, entropySource, this.personalizationString, this.nonce);
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder$ConfigurableDualECDRBGProvider.class */
    private static class ConfigurableDualECDRBGProvider implements DRBGProvider {
        private final DualECPoints[] pointSet;
        private final Digest digest;
        private final byte[] nonce;
        private final byte[] personalizationString;
        private final int securityStrength;

        public ConfigurableDualECDRBGProvider(DualECPoints[] pointSet, Digest digest, byte[] nonce, byte[] personalizationString, int securityStrength) {
            this.pointSet = new DualECPoints[pointSet.length];
            System.arraycopy(pointSet, 0, this.pointSet, 0, pointSet.length);
            this.digest = digest;
            this.nonce = nonce;
            this.personalizationString = personalizationString;
            this.securityStrength = securityStrength;
        }

        @Override // org.spongycastle.crypto.prng.DRBGProvider
        public SP80090DRBG get(EntropySource entropySource) {
            return new DualECSP800DRBG(this.pointSet, this.digest, this.securityStrength, entropySource, this.personalizationString, this.nonce);
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder$HMacDRBGProvider.class */
    private static class HMacDRBGProvider implements DRBGProvider {
        private final Mac hMac;
        private final byte[] nonce;
        private final byte[] personalizationString;
        private final int securityStrength;

        public HMacDRBGProvider(Mac hMac, byte[] nonce, byte[] personalizationString, int securityStrength) {
            this.hMac = hMac;
            this.nonce = nonce;
            this.personalizationString = personalizationString;
            this.securityStrength = securityStrength;
        }

        @Override // org.spongycastle.crypto.prng.DRBGProvider
        public SP80090DRBG get(EntropySource entropySource) {
            return new HMacSP800DRBG(this.hMac, this.securityStrength, entropySource, this.personalizationString, this.nonce);
        }
    }

    /* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/prng/SP800SecureRandomBuilder$CTRDRBGProvider.class */
    private static class CTRDRBGProvider implements DRBGProvider {
        private final BlockCipher blockCipher;
        private final int keySizeInBits;
        private final byte[] nonce;
        private final byte[] personalizationString;
        private final int securityStrength;

        public CTRDRBGProvider(BlockCipher blockCipher, int keySizeInBits, byte[] nonce, byte[] personalizationString, int securityStrength) {
            this.blockCipher = blockCipher;
            this.keySizeInBits = keySizeInBits;
            this.nonce = nonce;
            this.personalizationString = personalizationString;
            this.securityStrength = securityStrength;
        }

        @Override // org.spongycastle.crypto.prng.DRBGProvider
        public SP80090DRBG get(EntropySource entropySource) {
            return new CTRSP800DRBG(this.blockCipher, this.keySizeInBits, this.securityStrength, entropySource, this.personalizationString, this.nonce);
        }
    }
}
