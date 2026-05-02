package com.nispok.snackbar;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.util.Log;
import android.view.ViewGroup;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/SnackbarManager.class */
public class SnackbarManager {
    private static final String TAG = SnackbarManager.class.getSimpleName();
    private static Snackbar currentSnackbar;

    private SnackbarManager() {
    }

    public static void show(@NonNull Snackbar snackbar) {
        try {
            show(snackbar, (Activity) snackbar.getContext());
        } catch (ClassCastException e) {
            Log.e(TAG, "Couldn't get Activity from the Snackbar's Context. Try calling #show(Snackbar, Activity) instead", e);
        }
    }

    public static void show(@NonNull Snackbar snackbar, @NonNull Activity activity) {
        if (currentSnackbar != null) {
            if (currentSnackbar.isShowing() && !currentSnackbar.isDimissing()) {
                currentSnackbar.dismissByReplace();
                currentSnackbar = snackbar;
                currentSnackbar.showByReplace(activity);
                return;
            }
            currentSnackbar.dismiss();
        }
        currentSnackbar = snackbar;
        currentSnackbar.show(activity);
    }

    public static void show(@NonNull Snackbar snackbar, @NonNull ViewGroup parent) {
        show(snackbar, parent, Snackbar.shouldUsePhoneLayout(snackbar.getContext()));
    }

    public static void show(@NonNull Snackbar snackbar, @NonNull ViewGroup parent, boolean usePhoneLayout) {
        if (currentSnackbar != null) {
            if (currentSnackbar.isShowing() && !currentSnackbar.isDimissing()) {
                currentSnackbar.dismissByReplace();
                currentSnackbar = snackbar;
                currentSnackbar.showByReplace(parent, usePhoneLayout);
                return;
            }
            currentSnackbar.dismiss();
        }
        currentSnackbar = snackbar;
        currentSnackbar.show(parent, usePhoneLayout);
    }

    public static void dismiss() {
        if (currentSnackbar != null) {
            currentSnackbar.dismiss();
        }
    }

    public static Snackbar getCurrentSnackbar() {
        return currentSnackbar;
    }
}
