package android.support.v4.os;

import android.os.Trace;

/* loaded from: internal_impl-23.3.0.jar:android/support/v4/os/TraceJellybeanMR2.class */
class TraceJellybeanMR2 {
    TraceJellybeanMR2() {
    }

    public static void beginSection(String section) {
        Trace.beginSection(section);
    }

    public static void endSection() {
        Trace.endSection();
    }
}
