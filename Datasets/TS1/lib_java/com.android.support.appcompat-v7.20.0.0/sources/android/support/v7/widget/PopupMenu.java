package android.support.v7.widget;

import android.content.Context;
import android.support.v7.internal.view.SupportMenuInflater;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuPopupHelper;
import android.support.v7.internal.view.menu.MenuPresenter;
import android.support.v7.internal.view.menu.SubMenuBuilder;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/widget/PopupMenu.class */
public class PopupMenu implements MenuBuilder.Callback, MenuPresenter.Callback {
    private Context mContext;
    private MenuBuilder mMenu;
    private View mAnchor;
    private MenuPopupHelper mPopup;
    private OnMenuItemClickListener mMenuItemClickListener;
    private OnDismissListener mDismissListener;

    /* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/widget/PopupMenu$OnDismissListener.class */
    public interface OnDismissListener {
        void onDismiss(PopupMenu popupMenu);
    }

    /* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/widget/PopupMenu$OnMenuItemClickListener.class */
    public interface OnMenuItemClickListener {
        boolean onMenuItemClick(MenuItem menuItem);
    }

    public PopupMenu(Context context, View anchor) {
        this.mContext = context;
        this.mMenu = new MenuBuilder(context);
        this.mMenu.setCallback(this);
        this.mAnchor = anchor;
        this.mPopup = new MenuPopupHelper(context, this.mMenu, anchor);
        this.mPopup.setCallback(this);
    }

    public Menu getMenu() {
        return this.mMenu;
    }

    public MenuInflater getMenuInflater() {
        return new SupportMenuInflater(this.mContext);
    }

    public void inflate(int menuRes) {
        getMenuInflater().inflate(menuRes, this.mMenu);
    }

    public void show() {
        this.mPopup.show();
    }

    public void dismiss() {
        this.mPopup.dismiss();
    }

    public void setOnMenuItemClickListener(OnMenuItemClickListener listener) {
        this.mMenuItemClickListener = listener;
    }

    public void setOnDismissListener(OnDismissListener listener) {
        this.mDismissListener = listener;
    }

    @Override // android.support.v7.internal.view.menu.MenuBuilder.Callback
    public boolean onMenuItemSelected(MenuBuilder menu, MenuItem item) {
        if (this.mMenuItemClickListener != null) {
            return this.mMenuItemClickListener.onMenuItemClick(item);
        }
        return false;
    }

    @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
    public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
        if (this.mDismissListener != null) {
            this.mDismissListener.onDismiss(this);
        }
    }

    @Override // android.support.v7.internal.view.menu.MenuPresenter.Callback
    public boolean onOpenSubMenu(MenuBuilder subMenu) {
        if (subMenu == null) {
            return false;
        }
        if (!subMenu.hasVisibleItems()) {
            return true;
        }
        new MenuPopupHelper(this.mContext, subMenu, this.mAnchor).show();
        return true;
    }

    public void onCloseSubMenu(SubMenuBuilder menu) {
    }

    @Override // android.support.v7.internal.view.menu.MenuBuilder.Callback
    public void onMenuModeChange(MenuBuilder menu) {
    }
}
