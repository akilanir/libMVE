package org.spongycastle.crypto.tls;

import java.io.IOException;
import org.spongycastle.crypto.modes.AEADBlockCipher;
import org.spongycastle.crypto.params.AEADParameters;
import org.spongycastle.crypto.params.KeyParameter;
import org.spongycastle.util.Arrays;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/TlsAEADCipher.class */
public class TlsAEADCipher implements TlsCipher {
    protected TlsContext context;
    protected int macSize;
    protected int nonce_explicit_length;
    protected AEADBlockCipher encryptCipher;
    protected AEADBlockCipher decryptCipher;
    protected byte[] encryptImplicitNonce;
    protected byte[] decryptImplicitNonce;

    public TlsAEADCipher(TlsContext context, AEADBlockCipher clientWriteCipher, AEADBlockCipher serverWriteCipher, int cipherKeySize, int macSize) throws IOException {
        KeyParameter encryptKey;
        KeyParameter decryptKey;
        if (!TlsUtils.isTLSv12(context)) {
            throw new TlsFatalAlert((short) 80);
        }
        this.context = context;
        this.macSize = macSize;
        this.nonce_explicit_length = 8;
        int key_block_size = (2 * cipherKeySize) + (2 * 4);
        byte[] key_block = TlsUtils.calculateKeyBlock(context, key_block_size);
        KeyParameter client_write_key = new KeyParameter(key_block, 0, cipherKeySize);
        int offset = 0 + cipherKeySize;
        KeyParameter server_write_key = new KeyParameter(key_block, offset, cipherKeySize);
        int offset2 = offset + cipherKeySize;
        byte[] client_write_IV = Arrays.copyOfRange(key_block, offset2, offset2 + 4);
        int offset3 = offset2 + 4;
        byte[] server_write_IV = Arrays.copyOfRange(key_block, offset3, offset3 + 4);
        if (offset3 + 4 != key_block_size) {
            throw new TlsFatalAlert((short) 80);
        }
        if (context.isServer()) {
            this.encryptCipher = serverWriteCipher;
            this.decryptCipher = clientWriteCipher;
            this.encryptImplicitNonce = server_write_IV;
            this.decryptImplicitNonce = client_write_IV;
            encryptKey = server_write_key;
            decryptKey = client_write_key;
        } else {
            this.encryptCipher = clientWriteCipher;
            this.decryptCipher = serverWriteCipher;
            this.encryptImplicitNonce = client_write_IV;
            this.decryptImplicitNonce = server_write_IV;
            encryptKey = client_write_key;
            decryptKey = server_write_key;
        }
        byte[] dummyNonce = new byte[4 + this.nonce_explicit_length];
        this.encryptCipher.init(true, new AEADParameters(encryptKey, 8 * macSize, dummyNonce));
        this.decryptCipher.init(false, new AEADParameters(decryptKey, 8 * macSize, dummyNonce));
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public int getPlaintextLimit(int ciphertextLimit) {
        return (ciphertextLimit - this.macSize) - this.nonce_explicit_length;
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public byte[] encodePlaintext(long seqNo, short type, byte[] plaintext, int offset, int len) throws IOException {
        byte[] nonce = new byte[this.encryptImplicitNonce.length + this.nonce_explicit_length];
        System.arraycopy(this.encryptImplicitNonce, 0, nonce, 0, this.encryptImplicitNonce.length);
        TlsUtils.writeUint64(seqNo, nonce, this.encryptImplicitNonce.length);
        int ciphertextLength = this.encryptCipher.getOutputSize(len);
        byte[] output = new byte[this.nonce_explicit_length + ciphertextLength];
        System.arraycopy(nonce, this.encryptImplicitNonce.length, output, 0, this.nonce_explicit_length);
        int outputPos = this.nonce_explicit_length;
        byte[] additionalData = getAdditionalData(seqNo, type, len);
        AEADParameters parameters = new AEADParameters(null, 8 * this.macSize, nonce, additionalData);
        try {
            this.encryptCipher.init(true, parameters);
            int outputPos2 = outputPos + this.encryptCipher.processBytes(plaintext, offset, len, output, outputPos);
            if (outputPos2 + this.encryptCipher.doFinal(output, outputPos2) != output.length) {
                throw new TlsFatalAlert((short) 80);
            }
            return output;
        } catch (Exception e) {
            throw new TlsFatalAlert((short) 80, e);
        }
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public byte[] decodeCiphertext(long seqNo, short type, byte[] ciphertext, int offset, int len) throws IOException {
        if (getPlaintextLimit(len) < 0) {
            throw new TlsFatalAlert((short) 50);
        }
        byte[] nonce = new byte[this.decryptImplicitNonce.length + this.nonce_explicit_length];
        System.arraycopy(this.decryptImplicitNonce, 0, nonce, 0, this.decryptImplicitNonce.length);
        System.arraycopy(ciphertext, offset, nonce, this.decryptImplicitNonce.length, this.nonce_explicit_length);
        int ciphertextOffset = offset + this.nonce_explicit_length;
        int ciphertextLength = len - this.nonce_explicit_length;
        int plaintextLength = this.decryptCipher.getOutputSize(ciphertextLength);
        byte[] output = new byte[plaintextLength];
        byte[] additionalData = getAdditionalData(seqNo, type, plaintextLength);
        AEADParameters parameters = new AEADParameters(null, 8 * this.macSize, nonce, additionalData);
        try {
            this.decryptCipher.init(false, parameters);
            int outputPos = 0 + this.decryptCipher.processBytes(ciphertext, ciphertextOffset, ciphertextLength, output, 0);
            if (outputPos + this.decryptCipher.doFinal(output, outputPos) != output.length) {
                throw new TlsFatalAlert((short) 80);
            }
            return output;
        } catch (Exception e) {
            throw new TlsFatalAlert((short) 20, e);
        }
    }

    protected byte[] getAdditionalData(long seqNo, short type, int len) throws IOException {
        byte[] additional_data = new byte[13];
        TlsUtils.writeUint64(seqNo, additional_data, 0);
        TlsUtils.writeUint8(type, additional_data, 8);
        TlsUtils.writeVersion(this.context.getServerVersion(), additional_data, 9);
        TlsUtils.writeUint16(len, additional_data, 11);
        return additional_data;
    }
}
