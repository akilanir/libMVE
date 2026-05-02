package org.spongycastle.crypto.tls;

import java.io.IOException;
import org.spongycastle.crypto.Mac;
import org.spongycastle.crypto.engines.ChaChaEngine;
import org.spongycastle.crypto.generators.Poly1305KeyGenerator;
import org.spongycastle.crypto.macs.Poly1305;
import org.spongycastle.crypto.params.KeyParameter;
import org.spongycastle.crypto.params.ParametersWithIV;
import org.spongycastle.util.Arrays;
import org.spongycastle.util.Pack;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/crypto/tls/Chacha20Poly1305.class */
public class Chacha20Poly1305 implements TlsCipher {
    protected TlsContext context;
    protected ChaChaEngine encryptCipher;
    protected ChaChaEngine decryptCipher;

    public Chacha20Poly1305(TlsContext context) throws IOException {
        KeyParameter encryptKey;
        KeyParameter decryptKey;
        if (!TlsUtils.isTLSv12(context)) {
            throw new TlsFatalAlert((short) 80);
        }
        this.context = context;
        byte[] key_block = TlsUtils.calculateKeyBlock(context, 64);
        KeyParameter client_write_key = new KeyParameter(key_block, 0, 32);
        KeyParameter server_write_key = new KeyParameter(key_block, 32, 32);
        this.encryptCipher = new ChaChaEngine(20);
        this.decryptCipher = new ChaChaEngine(20);
        if (context.isServer()) {
            encryptKey = server_write_key;
            decryptKey = client_write_key;
        } else {
            encryptKey = client_write_key;
            decryptKey = server_write_key;
        }
        byte[] dummyNonce = new byte[8];
        this.encryptCipher.init(true, new ParametersWithIV(encryptKey, dummyNonce));
        this.decryptCipher.init(false, new ParametersWithIV(decryptKey, dummyNonce));
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public int getPlaintextLimit(int ciphertextLimit) {
        return ciphertextLimit - 16;
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public byte[] encodePlaintext(long seqNo, short type, byte[] plaintext, int offset, int len) throws IOException {
        int ciphertextLength = len + 16;
        KeyParameter macKey = initRecordMAC(this.encryptCipher, true, seqNo);
        byte[] output = new byte[ciphertextLength];
        this.encryptCipher.processBytes(plaintext, offset, len, output, 0);
        byte[] additionalData = getAdditionalData(seqNo, type, len);
        byte[] mac = calculateRecordMAC(macKey, additionalData, output, 0, len);
        System.arraycopy(mac, 0, output, len, mac.length);
        return output;
    }

    @Override // org.spongycastle.crypto.tls.TlsCipher
    public byte[] decodeCiphertext(long seqNo, short type, byte[] ciphertext, int offset, int len) throws IOException {
        if (getPlaintextLimit(len) < 0) {
            throw new TlsFatalAlert((short) 50);
        }
        int plaintextLength = len - 16;
        byte[] receivedMAC = Arrays.copyOfRange(ciphertext, offset + plaintextLength, offset + len);
        KeyParameter macKey = initRecordMAC(this.decryptCipher, false, seqNo);
        byte[] additionalData = getAdditionalData(seqNo, type, plaintextLength);
        byte[] calculatedMAC = calculateRecordMAC(macKey, additionalData, ciphertext, offset, plaintextLength);
        if (!Arrays.constantTimeAreEqual(calculatedMAC, receivedMAC)) {
            throw new TlsFatalAlert((short) 20);
        }
        byte[] output = new byte[plaintextLength];
        this.decryptCipher.processBytes(ciphertext, offset, plaintextLength, output, 0);
        return output;
    }

    protected KeyParameter initRecordMAC(ChaChaEngine cipher, boolean forEncryption, long seqNo) {
        byte[] nonce = new byte[8];
        TlsUtils.writeUint64(seqNo, nonce, 0);
        cipher.init(forEncryption, new ParametersWithIV(null, nonce));
        byte[] firstBlock = new byte[64];
        cipher.processBytes(firstBlock, 0, firstBlock.length, firstBlock, 0);
        System.arraycopy(firstBlock, 0, firstBlock, 32, 16);
        KeyParameter macKey = new KeyParameter(firstBlock, 16, 32);
        Poly1305KeyGenerator.clamp(macKey.getKey());
        return macKey;
    }

    protected byte[] calculateRecordMAC(KeyParameter macKey, byte[] additionalData, byte[] buf, int off, int len) {
        Mac mac = new Poly1305();
        mac.init(macKey);
        updateRecordMAC(mac, additionalData, 0, additionalData.length);
        updateRecordMAC(mac, buf, off, len);
        byte[] output = new byte[mac.getMacSize()];
        mac.doFinal(output, 0);
        return output;
    }

    protected void updateRecordMAC(Mac mac, byte[] buf, int off, int len) {
        mac.update(buf, off, len);
        byte[] longLen = Pack.longToLittleEndian(len & 4294967295L);
        mac.update(longLen, 0, longLen.length);
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
