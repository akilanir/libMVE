package com.actionbarsherlock.view;

import android.content.Context;
import android.view.View;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/ActionProvider.class */
public abstract class ActionProvider {
    private SubUiVisibilityListener mSubUiVisibilityListener;

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/view/ActionProvider$SubUiVisibilityListener.class */
    public interface SubUiVisibilityListener {
        void onSubUiVisibilityChanged(boolean z);
    }

    public abstract View onCreateActionView();

    public ActionProvider(Context context) {
    }

    public boolean onPerformDefaultAction() {
        return false;
    }

    public boolean hasSubMenu() {
        return false;
    }

    public void onPrepareSubMenu(SubMenu subMenu) {
    }

    public void subUiVisibilityChanged(boolean isVisible) {
        if (this.mSubUiVisibilityListener != null) {
            this.mSubUiVisibilityListener.onSubUiVisibilityChanged(isVisible);
        }
    }

    public void setSubUiVisibilityListener(SubUiVisibilityListener listener) {
        this.mSubUiVisibilityListener = listener;
    }
}
