package org.piwik.sdk.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/tools/Checksum.class */
public class Checksum {
    private static final String HEXES = "0123456789ABCDEF";

    public static String getHex(byte[] raw) {
        if (raw == null) {
            return null;
        }
        StringBuilder hex = new StringBuilder(2 * raw.length);
        for (byte b : raw) {
            hex.append(HEXES.charAt((b & 240) >> 4)).append(HEXES.charAt(b & 15));
        }
        return hex.toString();
    }

    public static String getMD5Checksum(String string) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        digest.update(string.getBytes());
        byte[] messageDigest = digest.digest();
        return getHex(messageDigest);
    }

    public static String getMD5Checksum(File file) throws Exception {
        int numRead;
        if (!file.isFile()) {
            return null;
        }
        InputStream fis = new FileInputStream(file);
        byte[] buffer = new byte[1024];
        MessageDigest complete = MessageDigest.getInstance("MD5");
        do {
            numRead = fis.read(buffer);
            if (numRead > 0) {
                complete.update(buffer, 0, numRead);
            }
        } while (numRead != -1);
        fis.close();
        return getHex(complete.digest());
    }
}
