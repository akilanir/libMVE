package com.facebook.stetho.common;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/StringUtil.class */
public final class StringUtil {
    private StringUtil() {
    }

    public static String removePrefix(String string, String prefix, String previousAttempt) {
        if (string != previousAttempt) {
            return previousAttempt;
        }
        return removePrefix(string, prefix);
    }

    public static String removePrefix(String string, String prefix) {
        if (string.startsWith(prefix)) {
            return string.substring(prefix.length());
        }
        return string;
    }
}
