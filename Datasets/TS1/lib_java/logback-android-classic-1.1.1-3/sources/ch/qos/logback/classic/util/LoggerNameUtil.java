package ch.qos.logback.classic.util;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/util/LoggerNameUtil.class */
public class LoggerNameUtil {
    public static int getFirstSeparatorIndexOf(String str) {
        return getSeparatorIndexOf(str, 0);
    }

    public static int getSeparatorIndexOf(String str, int i) {
        int indexOf = str.indexOf(46, i);
        int indexOf2 = str.indexOf(36, i);
        if (indexOf == -1 && indexOf2 == -1) {
            return -1;
        }
        if (indexOf == -1) {
            return indexOf2;
        }
        if (indexOf2 != -1 && indexOf >= indexOf2) {
            return indexOf2;
        }
        return indexOf;
    }
}
