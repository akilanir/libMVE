package de.robv.android.xposed.callbacks;

import android.content.pm.ApplicationInfo;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.callbacks.XCallback;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LoadPackage.class */
public abstract class XC_LoadPackage extends XCallback {
    public abstract void handleLoadPackage(LoadPackageParam loadPackageParam) throws Throwable;

    public XC_LoadPackage() {
    }

    public XC_LoadPackage(int priority) {
        super(priority);
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam.class */
    public static class LoadPackageParam extends XCallback.Param {
        public String packageName;
        public String processName;
        public ClassLoader classLoader;
        public ApplicationInfo appInfo;
        public boolean isFirstApplication;

        public LoadPackageParam(XposedBridge.CopyOnWriteSortedSet<XC_LoadPackage> callbacks) {
            super(callbacks);
        }
    }

    @Override // de.robv.android.xposed.callbacks.XCallback
    protected void call(XCallback.Param param) throws Throwable {
        if (param instanceof LoadPackageParam) {
            handleLoadPackage((LoadPackageParam) param);
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LoadPackage$Unhook.class */
    public class Unhook implements IXUnhook {
        public Unhook() {
        }

        public XC_LoadPackage getCallback() {
            return XC_LoadPackage.this;
        }

        @Override // de.robv.android.xposed.callbacks.IXUnhook
        public void unhook() {
            XposedBridge.unhookLoadPackage(XC_LoadPackage.this);
        }
    }
}
