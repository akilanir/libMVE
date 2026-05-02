package org.springframework.util;

import android.os.Build;
import android.util.Base64;
import java.io.IOException;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/Base64Utils.class */
public class Base64Utils {
    private static final Boolean froyoOrNewer;

    static {
        froyoOrNewer = Boolean.valueOf(Build.VERSION.SDK_INT >= 8);
    }

    public static byte[] encode(byte[] input) {
        if (froyoOrNewer.booleanValue()) {
            return Base64.encode(input, 2);
        }
        return org.springframework.util.support.Base64.encodeBytesToBytes(input);
    }

    public static String encodeToString(byte[] input) {
        if (froyoOrNewer.booleanValue()) {
            return Base64.encodeToString(input, 2);
        }
        return org.springframework.util.support.Base64.encodeBytes(input);
    }

    public static byte[] decode(byte[] input) {
        if (froyoOrNewer.booleanValue()) {
            return Base64.decode(input, 2);
        }
        try {
            return org.springframework.util.support.Base64.decode(input);
        } catch (IOException e) {
            throw new IllegalArgumentException(e.getLocalizedMessage());
        }
    }

    public static byte[] decode(String str) {
        if (froyoOrNewer.booleanValue()) {
            return Base64.decode(str, 2);
        }
        try {
            return org.springframework.util.support.Base64.decode(str);
        } catch (IOException e) {
            throw new IllegalArgumentException(e.getLocalizedMessage());
        }
    }
}
