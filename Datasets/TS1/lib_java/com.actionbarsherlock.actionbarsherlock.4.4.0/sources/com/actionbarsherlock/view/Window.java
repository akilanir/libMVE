package com.actionbarsherlock.view;

import android.content.Context;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/Window.class */
public abstract class Window extends android.view.Window {
    public static final long FEATURE_ACTION_BAR = 8;
    public static final long FEATURE_ACTION_BAR_OVERLAY = 9;
    public static final long FEATURE_ACTION_MODE_OVERLAY = 10;
    public static final long FEATURE_NO_TITLE = 1;
    public static final long FEATURE_PROGRESS = 2;
    public static final long FEATURE_INDETERMINATE_PROGRESS = 5;

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/Window$Callback.class */
    public interface Callback {
        boolean onMenuItemSelected(int i, MenuItem menuItem);
    }

    private Window(Context context) {
        super(context);
    }
}
