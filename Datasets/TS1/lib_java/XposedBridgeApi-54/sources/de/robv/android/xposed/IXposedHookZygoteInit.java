package de.robv.android.xposed;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookZygoteInit.class */
public interface IXposedHookZygoteInit extends IXposedMod {

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookZygoteInit$StartupParam.class */
    public static class StartupParam {
        public String modulePath;
    }

    void initZygote(StartupParam startupParam) throws Throwable;
}
