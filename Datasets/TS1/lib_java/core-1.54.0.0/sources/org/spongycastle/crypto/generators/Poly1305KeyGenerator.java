package org.spongycastle.crypto.generators;

import org.spongycastle.crypto.CipherKeyGenerator;
import org.spongycastle.crypto.KeyGenerationParameters;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/generators/Poly1305KeyGenerator.class */
public class Poly1305KeyGenerator extends CipherKeyGenerator {
    private static final byte R_MASK_LOW_2 = -4;
    private static final byte R_MASK_HIGH_4 = 15;

    @Override // org.spongycastle.crypto.CipherKeyGenerator
    public void init(KeyGenerationParameters param) {
        super.init(new KeyGenerationParameters(param.getRandom(), 256));
    }

    @Override // org.spongycastle.crypto.CipherKeyGenerator
    public byte[] generateKey() {
        byte[] key = super.generateKey();
        clamp(key);
        return key;
    }

    public static void clamp(byte[] key) {
        if (key.length != 32) {
            throw new IllegalArgumentException("Poly1305 key must be 256 bits.");
        }
        key[19] = (byte) (key[19] & 15);
        key[23] = (byte) (key[23] & 15);
        key[27] = (byte) (key[27] & 15);
        key[31] = (byte) (key[31] & 15);
        key[20] = (byte) (key[20] & R_MASK_LOW_2);
        key[24] = (byte) (key[24] & R_MASK_LOW_2);
        key[28] = (byte) (key[28] & R_MASK_LOW_2);
    }

    public static void checkKey(byte[] key) {
        if (key.length != 32) {
            throw new IllegalArgumentException("Poly1305 key must be 256 bits.");
        }
        checkMask(key[19], (byte) 15);
        checkMask(key[23], (byte) 15);
        checkMask(key[27], (byte) 15);
        checkMask(key[31], (byte) 15);
        checkMask(key[20], (byte) -4);
        checkMask(key[24], (byte) -4);
        checkMask(key[28], (byte) -4);
    }

    private static void checkMask(byte b, byte mask) {
        if ((b & (mask ^ (-1))) != 0) {
            throw new IllegalArgumentException("Invalid format for r portion of Poly1305 key.");
        }
    }
}
