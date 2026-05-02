package com.sun.mail.smtp;

import com.sun.mail.util.ASCIIUtility;
import com.sun.mail.util.BASE64EncoderStream;
import com.sun.mail.util.MailLogger;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Hashtable;
import java.util.StringTokenizer;
import java.util.logging.Level;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/smtp/DigestMD5.class */
public class DigestMD5 {
    private MailLogger logger;
    private MessageDigest md5;
    private String uri;
    private String clientResponse;
    private static char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    public DigestMD5(MailLogger logger) {
        this.logger = logger.getLogger(getClass(), "DEBUG DIGEST-MD5");
        logger.config("DIGEST-MD5 Loaded");
    }

    public byte[] authClient(String host, String user, String passwd, String realm, String serverChallenge) throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        OutputStream b64os = new BASE64EncoderStream(bos, Integer.MAX_VALUE);
        try {
            SecureRandom random = new SecureRandom();
            this.md5 = MessageDigest.getInstance("MD5");
            StringBuffer result = new StringBuffer();
            this.uri = "smtp/" + host;
            byte[] bytes = new byte[32];
            this.logger.fine("Begin authentication ...");
            Hashtable map = tokenize(serverChallenge);
            if (realm == null) {
                String text = (String) map.get("realm");
                realm = text != null ? new StringTokenizer(text, ",").nextToken() : host;
            }
            String nonce = (String) map.get("nonce");
            random.nextBytes(bytes);
            b64os.write(bytes);
            b64os.flush();
            String cnonce = bos.toString("iso-8859-1");
            bos.reset();
            this.md5.update(this.md5.digest(ASCIIUtility.getBytes(user + ":" + realm + ":" + passwd)));
            this.md5.update(ASCIIUtility.getBytes(":" + nonce + ":" + cnonce));
            this.clientResponse = toHex(this.md5.digest()) + ":" + nonce + ":00000001:" + cnonce + ":auth:";
            this.md5.update(ASCIIUtility.getBytes("AUTHENTICATE:" + this.uri));
            this.md5.update(ASCIIUtility.getBytes(this.clientResponse + toHex(this.md5.digest())));
            result.append("username=\"" + user + "\"");
            result.append(",realm=\"" + realm + "\"");
            result.append(",qop=auth");
            result.append(",nc=00000001");
            result.append(",nonce=\"" + nonce + "\"");
            result.append(",cnonce=\"" + cnonce + "\"");
            result.append(",digest-uri=\"" + this.uri + "\"");
            result.append(",response=" + toHex(this.md5.digest()));
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("Response => " + result.toString());
            }
            b64os.write(ASCIIUtility.getBytes(result.toString()));
            b64os.flush();
            return bos.toByteArray();
        } catch (NoSuchAlgorithmException ex) {
            this.logger.log(Level.FINE, "NoSuchAlgorithmException", (Throwable) ex);
            throw new IOException(ex.toString());
        }
    }

    public boolean authServer(String serverResponse) throws IOException {
        Hashtable map = tokenize(serverResponse);
        this.md5.update(ASCIIUtility.getBytes(":" + this.uri));
        this.md5.update(ASCIIUtility.getBytes(this.clientResponse + toHex(this.md5.digest())));
        String text = toHex(this.md5.digest());
        if (!text.equals((String) map.get("rspauth"))) {
            if (this.logger.isLoggable(Level.FINE)) {
                this.logger.fine("Expected => rspauth=" + text);
                return false;
            }
            return false;
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x00f0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.Hashtable tokenize(java.lang.String r14) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 263
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.sun.mail.smtp.DigestMD5.tokenize(java.lang.String):java.util.Hashtable");
    }

    private static String toHex(byte[] bytes) {
        char[] result = new char[bytes.length * 2];
        int i = 0;
        for (byte b : bytes) {
            int temp = b & 255;
            int i2 = i;
            int i3 = i + 1;
            result[i2] = digits[temp >> 4];
            i = i3 + 1;
            result[i3] = digits[temp & 15];
        }
        return new String(result);
    }
}
