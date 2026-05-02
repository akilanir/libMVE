package com.actionbarsherlock.internal.view;

import android.content.Context;
import android.view.View;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuPopupHelper;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.internal.widget.ActionBarContextView;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.lang.ref.WeakReference;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/StandaloneActionMode.class */
public class StandaloneActionMode extends ActionMode implements MenuBuilder.Callback {
    private Context mContext;
    private ActionBarContextView mContextView;
    private ActionMode.Callback mCallback;
    private WeakReference<View> mCustomView;
    private boolean mFinished;
    private boolean mFocusable;
    private MenuBuilder mMenu;

    public StandaloneActionMode(Context context, ActionBarContextView view, ActionMode.Callback callback, boolean isFocusable) {
        this.mContext = context;
        this.mContextView = view;
        this.mCallback = callback;
        this.mMenu = new MenuBuilder(context).setDefaultShowAsAction(1);
        this.mMenu.setCallback(this);
        this.mFocusable = isFocusable;
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void setTitle(CharSequence title) {
        this.mContextView.setTitle(title);
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void setSubtitle(CharSequence subtitle) {
        this.mContextView.setSubtitle(subtitle);
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void setTitle(int resId) {
        setTitle(this.mContext.getString(resId));
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void setSubtitle(int resId) {
        setSubtitle(this.mContext.getString(resId));
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void setCustomView(View view) {
        this.mContextView.setCustomView(view);
        this.mCustomView = view != null ? new WeakReference<>(view) : null;
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void invalidate() {
        this.mCallback.onPrepareActionMode(this, this.mMenu);
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public void finish() {
        if (this.mFinished) {
            return;
        }
        this.mFinished = true;
        this.mContextView.sendAccessibilityEvent(32);
        this.mCallback.onDestroyActionMode(this);
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public Menu getMenu() {
        return this.mMenu;
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public CharSequence getTitle() {
        return this.mContextView.getTitle();
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public CharSequence getSubtitle() {
        return this.mContextView.getSubtitle();
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public View getCustomView() {
        if (this.mCustomView != null) {
            return this.mCustomView.get();
        }
        return null;
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public MenuInflater getMenuInflater() {
        return new MenuInflater(this.mContext);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
    public boolean onMenuItemSelected(MenuBuilder menu, MenuItem item) {
        return this.mCallback.onActionItemClicked(this, item);
    }

    public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
    }

    public boolean onSubMenuSelected(SubMenuBuilder subMenu) {
        if (!subMenu.hasVisibleItems()) {
            return true;
        }
        new MenuPopupHelper(this.mContext, subMenu).show();
        return true;
    }

    public void onCloseSubMenu(SubMenuBuilder menu) {
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
    public void onMenuModeChange(MenuBuilder menu) {
        invalidate();
        this.mContextView.showOverflowMenu();
    }

    @Override // com.actionbarsherlock.view.ActionMode
    public boolean isUiFocusable() {
        return this.mFocusable;
    }
}
