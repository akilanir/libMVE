package android.support.v7.view.menu;

import android.widget.ListView;

/* loaded from: com.android.support.appcompat-v7.24.0.0-beta1.jar:android/support/v7/view/menu/ShowableListMenu.class */
public interface ShowableListMenu {
    void show();

    void dismiss();

    boolean isShowing();

    ListView getListView();
}
