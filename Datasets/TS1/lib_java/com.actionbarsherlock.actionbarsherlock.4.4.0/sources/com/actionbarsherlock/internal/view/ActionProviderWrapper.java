package com.actionbarsherlock.internal.view;

import android.view.ActionProvider;
import android.view.SubMenu;
import android.view.View;
import com.actionbarsherlock.internal.view.menu.SubMenuWrapper;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/ActionProviderWrapper.class */
public class ActionProviderWrapper extends ActionProvider {
    private final com.actionbarsherlock.view.ActionProvider mProvider;

    public ActionProviderWrapper(com.actionbarsherlock.view.ActionProvider provider) {
        super(null);
        this.mProvider = provider;
    }

    public com.actionbarsherlock.view.ActionProvider unwrap() {
        return this.mProvider;
    }

    @Override // android.view.ActionProvider
    public View onCreateActionView() {
        return this.mProvider.onCreateActionView();
    }

    @Override // android.view.ActionProvider
    public boolean hasSubMenu() {
        return this.mProvider.hasSubMenu();
    }

    @Override // android.view.ActionProvider
    public boolean onPerformDefaultAction() {
        return this.mProvider.onPerformDefaultAction();
    }

    @Override // android.view.ActionProvider
    public void onPrepareSubMenu(SubMenu subMenu) {
        this.mProvider.onPrepareSubMenu(new SubMenuWrapper(subMenu));
    }
}
