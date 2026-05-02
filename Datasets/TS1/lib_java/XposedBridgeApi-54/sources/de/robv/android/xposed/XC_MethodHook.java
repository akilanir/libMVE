package de.robv.android.xposed;

import de.robv.android.xposed.callbacks.IXUnhook;
import de.robv.android.xposed.callbacks.XCallback;
import java.lang.reflect.Member;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XC_MethodHook.class */
public abstract class XC_MethodHook extends XCallback {
    public XC_MethodHook() {
    }

    public XC_MethodHook(int priority) {
        super(priority);
    }

    protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
    }

    protected void afterHookedMethod(MethodHookParam param) throws Throwable {
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XC_MethodHook$MethodHookParam.class */
    public static class MethodHookParam extends XCallback.Param {
        public Member method;
        public Object thisObject;
        public Object[] args;
        private Object result = null;
        private Throwable throwable = null;
        boolean returnEarly = false;

        public Object getResult() {
            return this.result;
        }

        public void setResult(Object result) {
            this.result = result;
            this.throwable = null;
            this.returnEarly = true;
        }

        public Throwable getThrowable() {
            return this.throwable;
        }

        public boolean hasThrowable() {
            return this.throwable != null;
        }

        public void setThrowable(Throwable throwable) {
            this.throwable = throwable;
            this.result = null;
            this.returnEarly = true;
        }

        public Object getResultOrThrowable() throws Throwable {
            if (this.throwable != null) {
                throw this.throwable;
            }
            return this.result;
        }
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/XC_MethodHook$Unhook.class */
    public class Unhook implements IXUnhook {
        private final Member hookMethod;

        public Unhook(Member hookMethod) {
            this.hookMethod = hookMethod;
        }

        public Member getHookedMethod() {
            return this.hookMethod;
        }

        public XC_MethodHook getCallback() {
            return XC_MethodHook.this;
        }

        @Override // de.robv.android.xposed.callbacks.IXUnhook
        public void unhook() {
            XposedBridge.unhookMethod(this.hookMethod, XC_MethodHook.this);
        }
    }
}
