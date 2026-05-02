package android.support.v4.os;

import android.os.CancellationSignal;

/* loaded from: internal_impl-23.0.0.jar:android/support/v4/os/CancellationSignalCompatJellybean.class */
class CancellationSignalCompatJellybean {
    CancellationSignalCompatJellybean() {
    }

    public static Object create() {
        return new CancellationSignal();
    }

    public static void cancel(Object cancellationSignalObj) {
        ((CancellationSignal) cancellationSignalObj).cancel();
    }
}
