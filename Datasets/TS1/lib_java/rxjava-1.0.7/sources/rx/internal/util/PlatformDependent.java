package rx.internal.util;

import java.security.AccessController;
import java.security.PrivilegedAction;

/* loaded from: rxjava-1.0.7.jar:rx/internal/util/PlatformDependent.class */
public final class PlatformDependent {
    private static final boolean IS_ANDROID = isAndroid0();

    public static boolean isAndroid() {
        return IS_ANDROID;
    }

    private static boolean isAndroid0() {
        boolean android;
        try {
            Class.forName("android.app.Application", false, getSystemClassLoader());
            android = true;
        } catch (Exception e) {
            android = false;
        }
        return android;
    }

    static ClassLoader getSystemClassLoader() {
        if (System.getSecurityManager() == null) {
            return ClassLoader.getSystemClassLoader();
        }
        return (ClassLoader) AccessController.doPrivileged(new PrivilegedAction<ClassLoader>() { // from class: rx.internal.util.PlatformDependent.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.security.PrivilegedAction
            public ClassLoader run() {
                return ClassLoader.getSystemClassLoader();
            }
        });
    }
}
