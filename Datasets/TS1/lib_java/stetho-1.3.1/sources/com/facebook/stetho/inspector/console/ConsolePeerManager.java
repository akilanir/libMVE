package com.facebook.stetho.inspector.console;

import com.facebook.stetho.inspector.helper.ChromePeerManager;
import javax.annotation.Nullable;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/console/ConsolePeerManager.class */
public class ConsolePeerManager extends ChromePeerManager {
    private static ConsolePeerManager sInstance;

    private ConsolePeerManager() {
    }

    @Nullable
    public static synchronized ConsolePeerManager getInstanceOrNull() {
        return sInstance;
    }

    public static synchronized ConsolePeerManager getOrCreateInstance() {
        if (sInstance == null) {
            sInstance = new ConsolePeerManager();
        }
        return sInstance;
    }
}
