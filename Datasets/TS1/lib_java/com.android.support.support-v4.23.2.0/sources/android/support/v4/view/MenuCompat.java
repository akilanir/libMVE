package android.support.v4.view;

import android.view.MenuItem;

/* loaded from: com.android.support.support-v4.23.2.0.jar:android/support/v4/view/MenuCompat.class */
public final class MenuCompat {
    @Deprecated
    public static void setShowAsAction(MenuItem item, int actionEnum) {
        MenuItemCompat.setShowAsAction(item, actionEnum);
    }

    private MenuCompat() {
    }
}
