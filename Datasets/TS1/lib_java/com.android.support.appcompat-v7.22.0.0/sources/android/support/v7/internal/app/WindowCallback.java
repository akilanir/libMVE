package android.support.v7.internal.app;

import android.support.v7.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

/* loaded from: com.android.support.appcompat-v7.22.0.0.jar:android/support/v7/internal/app/WindowCallback.class */
public interface WindowCallback {
    boolean onMenuItemSelected(int i, MenuItem menuItem);

    boolean onCreatePanelMenu(int i, Menu menu);

    boolean onPreparePanel(int i, View view, Menu menu);

    void onPanelClosed(int i, Menu menu);

    boolean onMenuOpened(int i, Menu menu);

    ActionMode startActionMode(ActionMode.Callback callback);

    View onCreatePanelView(int i);
}
