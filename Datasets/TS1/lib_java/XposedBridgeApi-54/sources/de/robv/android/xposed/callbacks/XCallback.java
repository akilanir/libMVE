package de.robv.android.xposed.callbacks;

import android.os.Bundle;
import de.robv.android.xposed.XposedBridge;
import java.io.Serializable;

/* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XCallback.class */
public abstract class XCallback implements Comparable<XCallback> {
    public final int priority;
    public static final int PRIORITY_DEFAULT = 50;
    public static final int PRIORITY_LOWEST = -10000;
    public static final int PRIORITY_HIGHEST = 10000;

    public XCallback() {
        this.priority = 50;
    }

    public XCallback(int priority) {
        this.priority = priority;
    }

    /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XCallback$Param.class */
    public static class Param {
        public final Object[] callbacks;
        private Bundle extra;

        protected Param() {
            this.callbacks = null;
        }

        protected Param(XposedBridge.CopyOnWriteSortedSet<? extends XCallback> callbacks) {
            this.callbacks = callbacks.getSnapshot();
        }

        public synchronized Bundle getExtra() {
            if (this.extra == null) {
                this.extra = new Bundle();
            }
            return this.extra;
        }

        public Object getObjectExtra(String key) {
            Serializable o = getExtra().getSerializable(key);
            if (!(o instanceof SerializeWrapper)) {
                return null;
            }
            return ((SerializeWrapper) o).object;
        }

        public void setObjectExtra(String key, Object o) {
            getExtra().putSerializable(key, new SerializeWrapper(o));
        }

        /* loaded from: XposedBridgeApi-54.jar:de/robv/android/xposed/callbacks/XCallback$Param$SerializeWrapper.class */
        private static class SerializeWrapper implements Serializable {
            private static final long serialVersionUID = 1;
            private Object object;

            public SerializeWrapper(Object o) {
                this.object = o;
            }
        }
    }

    public static final void callAll(Param param) {
        if (param.callbacks == null) {
            throw new IllegalStateException("This object was not created for use with callAll");
        }
        for (int i = 0; i < param.callbacks.length; i++) {
            try {
                ((XCallback) param.callbacks[i]).call(param);
            } catch (Throwable t) {
                XposedBridge.log(t);
            }
        }
    }

    protected void call(Param param) throws Throwable {
    }

    @Override // java.lang.Comparable
    public int compareTo(XCallback other) {
        if (this == other) {
            return 0;
        }
        if (other.priority != this.priority) {
            return other.priority - this.priority;
        }
        if (System.identityHashCode(this) < System.identityHashCode(other)) {
            return -1;
        }
        return 1;
    }
}
