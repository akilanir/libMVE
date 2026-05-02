package pl.droidsonroids.gif;

import android.graphics.drawable.Drawable;
import java.lang.ref.WeakReference;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/MultiCallback.class */
public class MultiCallback implements Drawable.Callback {
    private final CopyOnWriteArrayList<CallbackWeakReference> mCallbacks = new CopyOnWriteArrayList<>();

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        for (int i = 0; i < this.mCallbacks.size(); i++) {
            CallbackWeakReference reference = this.mCallbacks.get(i);
            Drawable.Callback callback = (Drawable.Callback) reference.get();
            if (callback != null) {
                callback.invalidateDrawable(who);
            } else {
                this.mCallbacks.remove(reference);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        for (int i = 0; i < this.mCallbacks.size(); i++) {
            CallbackWeakReference reference = this.mCallbacks.get(i);
            Drawable.Callback callback = (Drawable.Callback) reference.get();
            if (callback != null) {
                callback.scheduleDrawable(who, what, when);
            } else {
                this.mCallbacks.remove(reference);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        for (int i = 0; i < this.mCallbacks.size(); i++) {
            CallbackWeakReference reference = this.mCallbacks.get(i);
            Drawable.Callback callback = (Drawable.Callback) reference.get();
            if (callback != null) {
                callback.unscheduleDrawable(who, what);
            } else {
                this.mCallbacks.remove(reference);
            }
        }
    }

    public void addView(Drawable.Callback callback) {
        for (int i = 0; i < this.mCallbacks.size(); i++) {
            CallbackWeakReference reference = this.mCallbacks.get(i);
            Drawable.Callback item = (Drawable.Callback) reference.get();
            if (item == null) {
                this.mCallbacks.remove(reference);
            }
        }
        this.mCallbacks.addIfAbsent(new CallbackWeakReference(callback));
    }

    public void removeView(Drawable.Callback callback) {
        for (int i = 0; i < this.mCallbacks.size(); i++) {
            CallbackWeakReference reference = this.mCallbacks.get(i);
            Drawable.Callback item = (Drawable.Callback) reference.get();
            if (item == null || item == callback) {
                this.mCallbacks.remove(reference);
            }
        }
    }

    /* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/MultiCallback$CallbackWeakReference.class */
    private static final class CallbackWeakReference extends WeakReference<Drawable.Callback> {
        CallbackWeakReference(Drawable.Callback r) {
            super(r);
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            return o != null && getClass() == o.getClass() && get() == ((CallbackWeakReference) o).get();
        }

        public int hashCode() {
            Drawable.Callback callback = (Drawable.Callback) get();
            if (callback != null) {
                return callback.hashCode();
            }
            return 0;
        }
    }
}
