package ch.qos.logback.core.util;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/EnvUtil.class */
public class EnvUtil {
    public static boolean isAndroidOS() {
        String systemProperty = OptionHelper.getSystemProperty("os.name");
        String env = OptionHelper.getEnv("ANDROID_ROOT");
        String env2 = OptionHelper.getEnv("ANDROID_DATA");
        return systemProperty != null && systemProperty.contains("Linux") && env != null && env.contains("/system") && env2 != null && env2.contains("/data");
    }

    private static boolean isJDK_N_OrHigher(int i) {
        ArrayList arrayList = new ArrayList();
        for (int i2 = 0; i2 < 5; i2++) {
            arrayList.add("1." + (i + i2));
        }
        String property = System.getProperty("java.version");
        if (property == null) {
            return false;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            if (property.startsWith((String) it.next())) {
                return true;
            }
        }
        return false;
    }

    public static boolean isJDK5() {
        return isJDK_N_OrHigher(5);
    }

    public static boolean isJDK6OrHigher() {
        return isJDK_N_OrHigher(6);
    }

    public static boolean isJDK7OrHigher() {
        return isJDK_N_OrHigher(7);
    }

    public static boolean isWindows() {
        return System.getProperty("os.name").startsWith("Windows");
    }
}
