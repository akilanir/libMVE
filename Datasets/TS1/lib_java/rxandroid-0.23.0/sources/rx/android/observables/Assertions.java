package rx.android.observables;

import android.os.Looper;

/* loaded from: rxandroid-0.23.0.jar:rx/android/observables/Assertions.class */
public class Assertions {
    public static void assertUiThread() {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            throw new IllegalStateException("Observers must subscribe from the main UI thread, but was " + Thread.currentThread());
        }
    }
}
