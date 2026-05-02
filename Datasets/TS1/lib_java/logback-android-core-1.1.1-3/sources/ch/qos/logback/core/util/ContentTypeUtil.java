package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/ContentTypeUtil.class */
public class ContentTypeUtil {
    public static boolean isTextual(String str) {
        if (str == null) {
            return false;
        }
        return str.startsWith("text");
    }

    public static String getSubType(String str) {
        int indexOf;
        int i;
        if (str == null || (indexOf = str.indexOf(47)) == -1 || (i = indexOf + 1) >= str.length()) {
            return null;
        }
        return str.substring(i);
    }
}
