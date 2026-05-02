package com.sun.mail.auth;

import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.MailLogger;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;
import java.util.logging.Level;
import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/auth/Ntlm.class */
public class Ntlm {
    private byte[] type1;
    private byte[] type3;
    private SecretKeyFactory fac;
    private Cipher cipher;
    private MD4 md4;
    private String hostname;
    private String ntdomain;
    private String username;
    private String password;
    private MailLogger logger;
    private static char[] hex;
    static final /* synthetic */ boolean $assertionsDisabled;

    static {
        $assertionsDisabled = !Ntlm.class.desiredAssertionStatus();
        hex = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    }

    private void init0() {
        this.type1 = new byte[256];
        this.type3 = new byte[256];
        System.arraycopy(new byte[]{78, 84, 76, 77, 83, 83, 80, 0, 1}, 0, this.type1, 0, 9);
        this.type1[12] = 3;
        this.type1[13] = -78;
        this.type1[28] = 32;
        System.arraycopy(new byte[]{78, 84, 76, 77, 83, 83, 80, 0, 3}, 0, this.type3, 0, 9);
        this.type3[12] = 24;
        this.type3[14] = 24;
        this.type3[20] = 24;
        this.type3[22] = 24;
        this.type3[32] = 64;
        this.type3[60] = 1;
        this.type3[61] = -126;
        try {
            this.fac = SecretKeyFactory.getInstance("DES");
            this.cipher = Cipher.getInstance("DES/ECB/NoPadding");
            this.md4 = new MD4();
        } catch (NoSuchAlgorithmException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        } catch (NoSuchPaddingException e2) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
    }

    public Ntlm(String ntdomain, String hostname, String username, String password, MailLogger logger) {
        int i = hostname.indexOf(46);
        hostname = i != -1 ? hostname.substring(0, i) : hostname;
        int i2 = username.indexOf(92);
        if (i2 != -1) {
            ntdomain = username.substring(0, i2).toUpperCase(Locale.ENGLISH);
            username = username.substring(i2 + 1);
        } else if (ntdomain == null) {
            ntdomain = "";
        }
        this.ntdomain = ntdomain;
        this.hostname = hostname;
        this.username = username;
        this.password = password;
        this.logger = logger.getLogger(getClass(), "DEBUG NTLM");
        init0();
    }

    private void copybytes(byte[] dest, int destpos, String src, String enc) {
        try {
            byte[] x = src.getBytes(enc);
            System.arraycopy(x, 0, dest, destpos, x.length);
        } catch (UnsupportedEncodingException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
    }

    public String generateType1Msg(int flags) {
        int dlen = this.ntdomain.length();
        this.type1[16] = (byte) (dlen % 256);
        this.type1[17] = (byte) (dlen / 256);
        this.type1[18] = this.type1[16];
        this.type1[19] = this.type1[17];
        if (dlen == 0) {
            byte[] bArr = this.type1;
            bArr[13] = (byte) (bArr[13] & (-17));
        }
        int hlen = this.hostname.length();
        this.type1[24] = (byte) (hlen % 256);
        this.type1[25] = (byte) (hlen / 256);
        this.type1[26] = this.type1[24];
        this.type1[27] = this.type1[25];
        copybytes(this.type1, 32, this.hostname, "iso-8859-1");
        copybytes(this.type1, hlen + 32, this.ntdomain, "iso-8859-1");
        this.type1[20] = (byte) ((hlen + 32) % 256);
        this.type1[21] = (byte) ((hlen + 32) / 256);
        byte[] msg = new byte[32 + hlen + dlen];
        System.arraycopy(this.type1, 0, msg, 0, 32 + hlen + dlen);
        if (this.logger.isLoggable(Level.FINE)) {
            this.logger.fine("type 1 message: " + toHex(msg));
        }
        String result = null;
        try {
            result = new String(BASE64EncoderStream.encode(msg), "iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        return result;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v2, types: [int[]] */
    /* JADX WARN: Type inference failed for: r2v1, types: [int] */
    /* JADX WARN: Type inference failed for: r2v10, types: [int] */
    /* JADX WARN: Type inference failed for: r2v16, types: [int] */
    /* JADX WARN: Type inference failed for: r2v22, types: [int] */
    /* JADX WARN: Type inference failed for: r2v28, types: [int] */
    /* JADX WARN: Type inference failed for: r2v34, types: [int] */
    /* JADX WARN: Type inference failed for: r2v4, types: [int] */
    /* JADX WARN: Type inference failed for: r2v40, types: [int] */
    /* JADX WARN: Type inference failed for: r2v45 */
    /* JADX WARN: Type inference failed for: r2v47 */
    /* JADX WARN: Type inference failed for: r2v48 */
    /* JADX WARN: Type inference failed for: r2v50 */
    /* JADX WARN: Type inference failed for: r2v51, types: [int] */
    /* JADX WARN: Type inference failed for: r3v14, types: [int] */
    /* JADX WARN: Type inference failed for: r3v21, types: [int] */
    /* JADX WARN: Type inference failed for: r3v28, types: [int] */
    /* JADX WARN: Type inference failed for: r3v35, types: [int] */
    /* JADX WARN: Type inference failed for: r3v42, types: [int] */
    /* JADX WARN: Type inference failed for: r3v7, types: [int] */
    private byte[] makeDesKey(byte[] bArr, int i) {
        ?? r0 = new int[bArr.length];
        for (int i2 = 0; i2 < r0.length; i2++) {
            r0[i2] = bArr[i2] < 0 ? (bArr[i2] == true ? 1 : 0) + 256 : bArr[i2];
        }
        return new byte[]{(byte) r0[i + 0], (byte) (((r0[i + 0] << 7) & 255) | (r0[i + 1] >> 1)), (byte) (((r0[i + 1] << 6) & 255) | (r0[i + 2] >> 2)), (byte) (((r0[i + 2] << 5) & 255) | (r0[i + 3] >> 3)), (byte) (((r0[i + 3] << 4) & 255) | (r0[i + 4] >> 4)), (byte) (((r0[i + 4] << 3) & 255) | (r0[i + 5] >> 5)), (byte) (((r0[i + 5] << 2) & 255) | (r0[i + 6] >> 6)), (byte) ((r0[i + 6] << 1) & 255)};
    }

    private byte[] calcLMHash() throws GeneralSecurityException {
        byte[] magic = {75, 71, 83, 33, 64, 35, 36, 37};
        byte[] pwb = null;
        try {
            pwb = this.password.toUpperCase(Locale.ENGLISH).getBytes("iso-8859-1");
        } catch (UnsupportedEncodingException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        byte[] pwb1 = new byte[14];
        int len = this.password.length();
        if (len > 14) {
            len = 14;
        }
        System.arraycopy(pwb, 0, pwb1, 0, len);
        DESKeySpec dks1 = new DESKeySpec(makeDesKey(pwb1, 0));
        DESKeySpec dks2 = new DESKeySpec(makeDesKey(pwb1, 7));
        SecretKey key1 = this.fac.generateSecret(dks1);
        SecretKey key2 = this.fac.generateSecret(dks2);
        this.cipher.init(1, key1);
        byte[] out1 = this.cipher.doFinal(magic, 0, 8);
        this.cipher.init(1, key2);
        byte[] out2 = this.cipher.doFinal(magic, 0, 8);
        byte[] result = new byte[21];
        System.arraycopy(out1, 0, result, 0, 8);
        System.arraycopy(out2, 0, result, 8, 8);
        return result;
    }

    private byte[] calcNTHash() throws GeneralSecurityException {
        byte[] pw = null;
        try {
            pw = this.password.getBytes("UnicodeLittleUnmarked");
        } catch (UnsupportedEncodingException e) {
            if (!$assertionsDisabled) {
                throw new AssertionError();
            }
        }
        byte[] out = this.md4.digest(pw);
        byte[] result = new byte[21];
        System.arraycopy(out, 0, result, 0, 16);
        return result;
    }

    private byte[] calcResponse(byte[] key, byte[] text) throws GeneralSecurityException {
        if (!$assertionsDisabled && key.length != 21) {
            throw new AssertionError();
        }
        DESKeySpec dks1 = new DESKeySpec(makeDesKey(key, 0));
        DESKeySpec dks2 = new DESKeySpec(makeDesKey(key, 7));
        DESKeySpec dks3 = new DESKeySpec(makeDesKey(key, 14));
        SecretKey key1 = this.fac.generateSecret(dks1);
        SecretKey key2 = this.fac.generateSecret(dks2);
        SecretKey key3 = this.fac.generateSecret(dks3);
        this.cipher.init(1, key1);
        byte[] out1 = this.cipher.doFinal(text, 0, 8);
        this.cipher.init(1, key2);
        byte[] out2 = this.cipher.doFinal(text, 0, 8);
        this.cipher.init(1, key3);
        byte[] out3 = this.cipher.doFinal(text, 0, 8);
        byte[] result = new byte[24];
        System.arraycopy(out1, 0, result, 0, 8);
        System.arraycopy(out2, 0, result, 8, 8);
        System.arraycopy(out3, 0, result, 16, 8);
        return result;
    }

    public String generateType3Msg(String challenge) {
        byte[] type2 = null;
        try {
            try {
                type2 = BASE64DecoderStream.decode(challenge.getBytes("us-ascii"));
            } catch (UnsupportedEncodingException e) {
                if (!$assertionsDisabled) {
                    throw new AssertionError();
                }
            }
            byte[] nonce = new byte[8];
            System.arraycopy(type2, 24, nonce, 0, 8);
            int ulen = this.username.length() * 2;
            byte[] bArr = this.type3;
            byte b = (byte) (ulen % 256);
            this.type3[38] = b;
            bArr[36] = b;
            byte[] bArr2 = this.type3;
            byte b2 = (byte) (ulen / 256);
            this.type3[39] = b2;
            bArr2[37] = b2;
            int dlen = this.ntdomain.length() * 2;
            byte[] bArr3 = this.type3;
            byte b3 = (byte) (dlen % 256);
            this.type3[30] = b3;
            bArr3[28] = b3;
            byte[] bArr4 = this.type3;
            byte b4 = (byte) (dlen / 256);
            this.type3[31] = b4;
            bArr4[29] = b4;
            int hlen = this.hostname.length() * 2;
            byte[] bArr5 = this.type3;
            byte b5 = (byte) (hlen % 256);
            this.type3[46] = b5;
            bArr5[44] = b5;
            byte[] bArr6 = this.type3;
            byte b6 = (byte) (hlen / 256);
            this.type3[47] = b6;
            bArr6[45] = b6;
            copybytes(this.type3, 64, this.ntdomain, "UnicodeLittleUnmarked");
            this.type3[32] = (byte) (64 % 256);
            this.type3[33] = (byte) (64 / 256);
            int l = 64 + dlen;
            copybytes(this.type3, l, this.username, "UnicodeLittleUnmarked");
            this.type3[40] = (byte) (l % 256);
            this.type3[41] = (byte) (l / 256);
            int l2 = l + ulen;
            copybytes(this.type3, l2, this.hostname, "UnicodeLittleUnmarked");
            this.type3[48] = (byte) (l2 % 256);
            this.type3[49] = (byte) (l2 / 256);
            int l3 = l2 + hlen;
            byte[] lmhash = calcLMHash();
            byte[] lmresponse = calcResponse(lmhash, nonce);
            byte[] nthash = calcNTHash();
            byte[] ntresponse = calcResponse(nthash, nonce);
            System.arraycopy(lmresponse, 0, this.type3, l3, 24);
            this.type3[16] = (byte) (l3 % 256);
            this.type3[17] = (byte) (l3 / 256);
            int l4 = l3 + 24;
            System.arraycopy(ntresponse, 0, this.type3, l4, 24);
            this.type3[24] = (byte) (l4 % 256);
            this.type3[25] = (byte) (l4 / 256);
            int l5 = l4 + 24;
            this.type3[56] = (byte) (l5 % 256);
            this.type3[57] = (byte) (l5 / 256);
            byte[] msg = new byte[l5];
            System.arraycopy(this.type3, 0, msg, 0, l5);
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("type 3 message: " + toHex(msg));
            }
            String result = null;
            try {
                result = new String(BASE64EncoderStream.encode(msg), "iso-8859-1");
            } catch (UnsupportedEncodingException e2) {
                if (!$assertionsDisabled) {
                    throw new AssertionError();
                }
            }
            return result;
        } catch (GeneralSecurityException ex) {
            this.logger.log(Level.FINE, "GeneralSecurityException", (Throwable) ex);
            return "";
        }
    }

    private static String toHex(byte[] b) {
        StringBuffer sb = new StringBuffer(b.length * 3);
        for (int i = 0; i < b.length; i++) {
            sb.append(hex[(b[i] >> 4) & 15]).append(hex[b[i] & 15]).append(' ');
        }
        return sb.toString();
    }
}
