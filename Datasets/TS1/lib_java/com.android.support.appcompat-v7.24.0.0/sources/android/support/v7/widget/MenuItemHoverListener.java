package android.support.v7.widget;

import android.support.annotation.NonNull;
import android.support.v7.view.menu.MenuBuilder;
import android.view.MenuItem;

/* loaded from: com.android.support.appcompat-v7.24.0.0.jar:android/support/v7/widget/MenuItemHoverListener.class */
public interface MenuItemHoverListener {
    void onItemHoverExit(@NonNull MenuBuilder menuBuilder, @NonNull MenuItem menuItem);

    void onItemHoverEnter(@NonNull MenuBuilder menuBuilder, @NonNull MenuItem menuItem);
}
