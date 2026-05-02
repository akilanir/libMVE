package android.support.v4.app;

import android.app.Activity;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* loaded from: internal_impl-21.0.0.jar:android/support/v4/app/ActivityCompatHoneycomb.class */
class ActivityCompatHoneycomb {
    ActivityCompatHoneycomb() {
    }

    static void invalidateOptionsMenu(Activity activity) {
        activity.invalidateOptionsMenu();
    }

    static void dump(Activity activity, String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        activity.dump(prefix, fd, writer, args);
    }
}
