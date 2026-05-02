package de.robv.android.xposed;

import de.robv.android.xposed.callbacks.XC_InitPackageResources;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookInitPackageResources.class */
public interface IXposedHookInitPackageResources extends IXposedMod {
    void handleInitPackageResources(XC_InitPackageResources.InitPackageResourcesParam initPackageResourcesParam) throws Throwable;

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/IXposedHookInitPackageResources$Wrapper.class */
    public static class Wrapper extends XC_InitPackageResources {
        private final IXposedHookInitPackageResources instance;

        public Wrapper(IXposedHookInitPackageResources instance) {
            this.instance = instance;
        }

        @Override // de.robv.android.xposed.callbacks.XC_InitPackageResources
        public void handleInitPackageResources(XC_InitPackageResources.InitPackageResourcesParam resparam) throws Throwable {
            this.instance.handleInitPackageResources(resparam);
        }
    }
}
