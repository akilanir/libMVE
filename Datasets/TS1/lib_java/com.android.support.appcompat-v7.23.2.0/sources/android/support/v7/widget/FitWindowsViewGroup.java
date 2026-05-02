package android.support.v7.widget;

import android.graphics.Rect;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/widget/FitWindowsViewGroup.class */
public interface FitWindowsViewGroup {

    /* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/widget/FitWindowsViewGroup$OnFitSystemWindowsListener.class */
    public interface OnFitSystemWindowsListener {
        void onFitSystemWindows(Rect rect);
    }

    void setOnFitSystemWindowsListener(OnFitSystemWindowsListener onFitSystemWindowsListener);
}
