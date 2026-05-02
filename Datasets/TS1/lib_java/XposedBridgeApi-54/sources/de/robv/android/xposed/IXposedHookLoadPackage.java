package de.robv.android.xposed;

import de.robv.android.xposed.callbacks.XC_LoadPackage;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookLoadPackage.class */
public interface IXposedHookLoadPackage extends IXposedMod {
    void handleLoadPackage(XC_LoadPackage.LoadPackageParam loadPackageParam) throws Throwable;

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookLoadPackage$Wrapper.class */
    public static class Wrapper extends XC_LoadPackage {
        private final IXposedHookLoadPackage instance;

        public Wrapper(IXposedHookLoadPackage instance) {
            this.instance = instance;
        }

        @Override // de.robv.android.xposed.callbacks.XC_LoadPackage
        public void handleLoadPackage(XC_LoadPackage.LoadPackageParam lpparam) throws Throwable {
            this.instance.handleLoadPackage(lpparam);
        }
    }
}
