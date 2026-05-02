package de.robv.android.xposed.callbacks;

import android.content.res.XResources;
import android.view.View;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.callbacks.XCallback;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LayoutInflated.class */
public abstract class XC_LayoutInflated extends XCallback {
    public abstract void handleLayoutInflated(LayoutInflatedParam layoutInflatedParam) throws Throwable;

    public XC_LayoutInflated() {
    }

    public XC_LayoutInflated(int priority) {
        super(priority);
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam.class */
    public static class LayoutInflatedParam extends XCallback.Param {
        public View view;
        public XResources.ResourceNames resNames;
        public String variant;
        public XResources res;

        public LayoutInflatedParam(XposedBridge.CopyOnWriteSortedSet<XC_LayoutInflated> callbacks) {
            super(callbacks);
        }
    }

    @Override // de.robv.android.xposed.callbacks.XCallback
    protected void call(XCallback.Param param) throws Throwable {
        if (param instanceof LayoutInflatedParam) {
            handleLayoutInflated((LayoutInflatedParam) param);
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook.class */
    public class Unhook implements IXUnhook {
        private final String resDir;
        private final int id;

        public Unhook(String resDir, int id) {
            this.resDir = resDir;
            this.id = id;
        }

        public String getResDir() {
            return this.resDir;
        }

        public int getId() {
            return this.id;
        }

        public XC_LayoutInflated getCallback() {
            return XC_LayoutInflated.this;
        }

        @Override // de.robv.android.xposed.callbacks.IXUnhook
        public void unhook() {
            XResources.unhookLayout(this.resDir, this.id, XC_LayoutInflated.this);
        }
    }
}
