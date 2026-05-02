package de.robv.android.xposed.callbacks;

import android.content.res.XResources;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.callbacks.XCallback;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_InitPackageResources.class */
public abstract class XC_InitPackageResources extends XCallback {
    public abstract void handleInitPackageResources(InitPackageResourcesParam initPackageResourcesParam) throws Throwable;

    public XC_InitPackageResources() {
    }

    public XC_InitPackageResources(int priority) {
        super(priority);
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam.class */
    public static class InitPackageResourcesParam extends XCallback.Param {
        public String packageName;
        public XResources res;

        public InitPackageResourcesParam(XposedBridge.CopyOnWriteSortedSet<XC_InitPackageResources> callbacks) {
            super(callbacks);
        }
    }

    @Override // de.robv.android.xposed.callbacks.XCallback
    protected void call(XCallback.Param param) throws Throwable {
        if (param instanceof InitPackageResourcesParam) {
            handleInitPackageResources((InitPackageResourcesParam) param);
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook.class */
    public class Unhook implements IXUnhook {
        public Unhook() {
        }

        public XC_InitPackageResources getCallback() {
            return XC_InitPackageResources.this;
        }

        @Override // de.robv.android.xposed.callbacks.IXUnhook
        public void unhook() {
            XposedBridge.unhookInitPackageResources(XC_InitPackageResources.this);
        }
    }
}
