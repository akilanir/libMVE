package android.support.v4.os;

import android.os.Environment;
import java.io.File;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/os/EnvironmentCompatKitKat.class */
class EnvironmentCompatKitKat {
    EnvironmentCompatKitKat() {
    }

    public static String getStorageState(File path) {
        return Environment.getStorageState(path);
    }
}
