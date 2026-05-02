package org.spongycastle.crypto.tls;

import java.io.IOException;
import org.spongycastle.crypto.BlockCipher;
import org.spongycastle.crypto.Digest;
import org.spongycastle.crypto.StreamCipher;
import org.spongycastle.crypto.engines.AESEngine;
import org.spongycastle.crypto.engines.CamelliaEngine;
import org.spongycastle.crypto.engines.DESedeEngine;
import org.spongycastle.crypto.engines.RC4Engine;
import org.spongycastle.crypto.engines.SEEDEngine;
import org.spongycastle.crypto.engines.Salsa20Engine;
import org.spongycastle.crypto.modes.AEADBlockCipher;
import org.spongycastle.crypto.modes.CBCBlockCipher;
import org.spongycastle.crypto.modes.CCMBlockCipher;
import org.spongycastle.crypto.modes.GCMBlockCipher;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/DefaultTlsCipherFactory.class */
public class DefaultTlsCipherFactory extends AbstractTlsCipherFactory {
    @Override // org.spongycastle.crypto.tls.AbstractTlsCipherFactory, org.spongycastle.crypto.tls.TlsCipherFactory
    public TlsCipher createCipher(TlsContext context, int encryptionAlgorithm, int macAlgorithm) throws IOException {
        switch (encryptionAlgorithm) {
            case 0:
                return createNullCipher(context, macAlgorithm);
            case 2:
                return createRC4Cipher(context, 16, macAlgorithm);
            case 7:
                return createDESedeCipher(context, macAlgorithm);
            case 8:
                return createAESCipher(context, 16, macAlgorithm);
            case 9:
                return createAESCipher(context, 32, macAlgorithm);
            case 10:
                return createCipher_AES_GCM(context, 16, 16);
            case 11:
                return createCipher_AES_GCM(context, 32, 16);
            case 12:
                return createCamelliaCipher(context, 16, macAlgorithm);
            case 13:
                return createCamelliaCipher(context, 32, macAlgorithm);
            case 14:
                return createSEEDCipher(context, macAlgorithm);
            case 15:
                return createCipher_AES_CCM(context, 16, 16);
            case 16:
                return createCipher_AES_CCM(context, 16, 8);
            case 17:
                return createCipher_AES_CCM(context, 32, 16);
            case 18:
                return createCipher_AES_CCM(context, 32, 8);
            case 19:
                return createCipher_Camellia_GCM(context, 16, 16);
            case 20:
                return createCipher_Camellia_GCM(context, 32, 16);
            case 100:
                return createSalsa20Cipher(context, 12, 32, macAlgorithm);
            case 101:
                return createSalsa20Cipher(context, 20, 32, macAlgorithm);
            case 102:
                return createChaCha20Poly1305(context);
            default:
                throw new TlsFatalAlert((short) 80);
        }
    }

    protected TlsBlockCipher createAESCipher(TlsContext context, int cipherKeySize, int macAlgorithm) throws IOException {
        return new TlsBlockCipher(context, createAESBlockCipher(), createAESBlockCipher(), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), cipherKeySize);
    }

    protected TlsBlockCipher createCamelliaCipher(TlsContext context, int cipherKeySize, int macAlgorithm) throws IOException {
        return new TlsBlockCipher(context, createCamelliaBlockCipher(), createCamelliaBlockCipher(), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), cipherKeySize);
    }

    protected TlsCipher createChaCha20Poly1305(TlsContext context) throws IOException {
        return new Chacha20Poly1305(context);
    }

    protected TlsAEADCipher createCipher_AES_CCM(TlsContext context, int cipherKeySize, int macSize) throws IOException {
        return new TlsAEADCipher(context, createAEADBlockCipher_AES_CCM(), createAEADBlockCipher_AES_CCM(), cipherKeySize, macSize);
    }

    protected TlsAEADCipher createCipher_AES_GCM(TlsContext context, int cipherKeySize, int macSize) throws IOException {
        return new TlsAEADCipher(context, createAEADBlockCipher_AES_GCM(), createAEADBlockCipher_AES_GCM(), cipherKeySize, macSize);
    }

    protected TlsAEADCipher createCipher_Camellia_GCM(TlsContext context, int cipherKeySize, int macSize) throws IOException {
        return new TlsAEADCipher(context, createAEADBlockCipher_Camellia_GCM(), createAEADBlockCipher_Camellia_GCM(), cipherKeySize, macSize);
    }

    protected TlsBlockCipher createDESedeCipher(TlsContext context, int macAlgorithm) throws IOException {
        return new TlsBlockCipher(context, createDESedeBlockCipher(), createDESedeBlockCipher(), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), 24);
    }

    protected TlsNullCipher createNullCipher(TlsContext context, int macAlgorithm) throws IOException {
        return new TlsNullCipher(context, createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm));
    }

    protected TlsStreamCipher createRC4Cipher(TlsContext context, int cipherKeySize, int macAlgorithm) throws IOException {
        return new TlsStreamCipher(context, createRC4StreamCipher(), createRC4StreamCipher(), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), cipherKeySize, false);
    }

    protected TlsStreamCipher createSalsa20Cipher(TlsContext context, int rounds, int cipherKeySize, int macAlgorithm) throws IOException {
        return new TlsStreamCipher(context, createSalsa20StreamCipher(rounds), createSalsa20StreamCipher(rounds), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), cipherKeySize, true);
    }

    protected TlsBlockCipher createSEEDCipher(TlsContext context, int macAlgorithm) throws IOException {
        return new TlsBlockCipher(context, createSEEDBlockCipher(), createSEEDBlockCipher(), createHMACDigest(macAlgorithm), createHMACDigest(macAlgorithm), 16);
    }

    protected BlockCipher createAESEngine() {
        return new AESEngine();
    }

    protected BlockCipher createCamelliaEngine() {
        return new CamelliaEngine();
    }

    protected BlockCipher createAESBlockCipher() {
        return new CBCBlockCipher(createAESEngine());
    }

    protected AEADBlockCipher createAEADBlockCipher_AES_CCM() {
        return new CCMBlockCipher(createAESEngine());
    }

    protected AEADBlockCipher createAEADBlockCipher_AES_GCM() {
        return new GCMBlockCipher(createAESEngine());
    }

    protected AEADBlockCipher createAEADBlockCipher_Camellia_GCM() {
        return new GCMBlockCipher(createCamelliaEngine());
    }

    protected BlockCipher createCamelliaBlockCipher() {
        return new CBCBlockCipher(createCamelliaEngine());
    }

    protected BlockCipher createDESedeBlockCipher() {
        return new CBCBlockCipher(new DESedeEngine());
    }

    protected StreamCipher createRC4StreamCipher() {
        return new RC4Engine();
    }

    protected StreamCipher createSalsa20StreamCipher(int rounds) {
        return new Salsa20Engine(rounds);
    }

    protected BlockCipher createSEEDBlockCipher() {
        return new CBCBlockCipher(new SEEDEngine());
    }

    protected Digest createHMACDigest(int macAlgorithm) throws IOException {
        switch (macAlgorithm) {
            case 0:
                return null;
            case 1:
                return TlsUtils.createHash((short) 1);
            case 2:
                return TlsUtils.createHash((short) 2);
            case 3:
                return TlsUtils.createHash((short) 4);
            case 4:
                return TlsUtils.createHash((short) 5);
            case 5:
                return TlsUtils.createHash((short) 6);
            default:
                throw new TlsFatalAlert((short) 80);
        }
    }
}
