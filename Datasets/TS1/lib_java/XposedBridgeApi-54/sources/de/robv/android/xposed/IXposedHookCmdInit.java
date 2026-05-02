package de.robv.android.xposed;

@Deprecated
/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookCmdInit.class */
public interface IXposedHookCmdInit extends IXposedMod {

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookCmdInit$StartupParam.class */
    public static class StartupParam {
        public String modulePath;
        public String startClassName;
    }

    void initCmdApp(StartupParam startupParam) throws Throwable;
}
