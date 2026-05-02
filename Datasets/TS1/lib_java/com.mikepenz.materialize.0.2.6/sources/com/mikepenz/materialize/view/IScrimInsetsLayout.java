package com.mikepenz.materialize.view;

import android.graphics.drawable.Drawable;
import android.view.ViewGroup;

/* loaded from: com.mikepenz.materialize.0.2.6.jar:com/mikepenz/materialize/view/IScrimInsetsLayout.class */
public interface IScrimInsetsLayout {
    ViewGroup getView();

    Drawable getInsetForeground();

    void setInsetForeground(Drawable drawable);

    void setInsetForeground(int i);

    boolean isTintStatusBar();

    void setTintStatusBar(boolean z);

    boolean isTintNavigationBar();

    void setTintNavigationBar(boolean z);

    boolean isSystemUIVisible();

    void setSystemUIVisible(boolean z);

    void setOnInsetsCallback(OnInsetsCallback onInsetsCallback);

    OnInsetsCallback getOnInsetsCallback();
}
