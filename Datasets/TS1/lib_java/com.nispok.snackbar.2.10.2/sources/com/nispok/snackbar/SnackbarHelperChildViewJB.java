package com.nispok.snackbar;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.View;
import android.view.ViewParent;

@TargetApi(16)
/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/SnackbarHelperChildViewJB.class */
class SnackbarHelperChildViewJB extends View {
    public SnackbarHelperChildViewJB(Context context) {
        super(context);
        setSaveEnabled(false);
        setWillNotDraw(true);
        setVisibility(8);
    }

    @Override // android.view.View
    public void onWindowSystemUiVisibilityChanged(int visible) {
        super.onWindowSystemUiVisibilityChanged(visible);
        ViewParent parent = getParent();
        if (parent instanceof Snackbar) {
            ((Snackbar) parent).dispatchOnWindowSystemUiVisibilityChangedCompat(visible);
        }
    }
}
