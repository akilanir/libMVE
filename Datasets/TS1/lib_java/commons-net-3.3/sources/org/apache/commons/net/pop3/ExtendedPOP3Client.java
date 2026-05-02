package org.apache.commons.net.pop3;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.net.util.Base64;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/pop3/ExtendedPOP3Client.class */
public class ExtendedPOP3Client extends POP3SClient {
    public boolean auth(AUTH_METHOD method, String username, String password) throws IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidKeySpecException {
        if (sendCommand(13, method.getAuthName()) != 2) {
            return false;
        }
        switch (method) {
            case PLAIN:
                if (sendCommand(new String(Base64.encodeBase64(("��" + username + "��" + password).getBytes(getCharsetName())), getCharsetName())) == 0) {
                }
                break;
            case CRAM_MD5:
                byte[] serverChallenge = Base64.decodeBase64(getReplyString().substring(2).trim());
                Mac hmac_md5 = Mac.getInstance("HmacMD5");
                hmac_md5.init(new SecretKeySpec(password.getBytes(getCharsetName()), "HmacMD5"));
                byte[] hmacResult = _convertToHexString(hmac_md5.doFinal(serverChallenge)).getBytes(getCharsetName());
                byte[] usernameBytes = username.getBytes(getCharsetName());
                byte[] toEncode = new byte[usernameBytes.length + 1 + hmacResult.length];
                System.arraycopy(usernameBytes, 0, toEncode, 0, usernameBytes.length);
                toEncode[usernameBytes.length] = 32;
                System.arraycopy(hmacResult, 0, toEncode, usernameBytes.length + 1, hmacResult.length);
                if (sendCommand(Base64.encodeBase64StringUnChunked(toEncode)) == 0) {
                }
                break;
        }
        return false;
    }

    private String _convertToHexString(byte[] a) {
        StringBuilder result = new StringBuilder(a.length * 2);
        for (byte element : a) {
            if ((element & 255) <= 15) {
                result.append("0");
            }
            result.append(Integer.toHexString(element & 255));
        }
        return result.toString();
    }

    /* loaded from: commons-net-3.3.jar:org/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD.class */
    public enum AUTH_METHOD {
        PLAIN("PLAIN"),
        CRAM_MD5("CRAM-MD5");

        private final String methodName;

        AUTH_METHOD(String methodName) {
            this.methodName = methodName;
        }

        public final String getAuthName() {
            return this.methodName;
        }
    }
}
