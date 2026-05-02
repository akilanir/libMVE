package com.actionbarsherlock.view;

import android.graphics.drawable.Drawable;
import android.view.View;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/SubMenu.class */
public interface SubMenu extends Menu {
    SubMenu setHeaderTitle(int i);

    SubMenu setHeaderTitle(CharSequence charSequence);

    SubMenu setHeaderIcon(int i);

    SubMenu setHeaderIcon(Drawable drawable);

    SubMenu setHeaderView(View view);

    void clearHeader();

    SubMenu setIcon(int i);

    SubMenu setIcon(Drawable drawable);

    MenuItem getItem();
}
