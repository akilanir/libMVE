package android.support.v7.view.menu;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v4.internal.view.SupportMenuItem;
import android.support.v4.view.MenuItemCompat;
import android.view.ActionProvider;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;

/* loaded from: com.android.support.appcompat-v7.24.0.0-beta1.jar:android/support/v7/view/menu/ActionMenuItem.class */
public class ActionMenuItem implements SupportMenuItem {
    private final int mId;
    private final int mGroup;
    private final int mCategoryOrder;
    private final int mOrdering;
    private CharSequence mTitle;
    private CharSequence mTitleCondensed;
    private Intent mIntent;
    private char mShortcutNumericChar;
    private char mShortcutAlphabeticChar;
    private Drawable mIconDrawable;
    private Context mContext;
    private MenuItem.OnMenuItemClickListener mClickListener;
    private static final int NO_ICON = 0;
    private static final int CHECKABLE = 1;
    private static final int CHECKED = 2;
    private static final int EXCLUSIVE = 4;
    private static final int HIDDEN = 8;
    private static final int ENABLED = 16;
    private int mIconResId = 0;
    private int mFlags = 16;

    public ActionMenuItem(Context context, int group, int id, int categoryOrder, int ordering, CharSequence title) {
        this.mContext = context;
        this.mId = id;
        this.mGroup = group;
        this.mCategoryOrder = categoryOrder;
        this.mOrdering = ordering;
        this.mTitle = title;
    }

    public char getAlphabeticShortcut() {
        return this.mShortcutAlphabeticChar;
    }

    public int getGroupId() {
        return this.mGroup;
    }

    public Drawable getIcon() {
        return this.mIconDrawable;
    }

    public Intent getIntent() {
        return this.mIntent;
    }

    public int getItemId() {
        return this.mId;
    }

    public ContextMenu.ContextMenuInfo getMenuInfo() {
        return null;
    }

    public char getNumericShortcut() {
        return this.mShortcutNumericChar;
    }

    public int getOrder() {
        return this.mOrdering;
    }

    public SubMenu getSubMenu() {
        return null;
    }

    public CharSequence getTitle() {
        return this.mTitle;
    }

    public CharSequence getTitleCondensed() {
        return this.mTitleCondensed != null ? this.mTitleCondensed : this.mTitle;
    }

    public boolean hasSubMenu() {
        return false;
    }

    public boolean isCheckable() {
        return (this.mFlags & 1) != 0;
    }

    public boolean isChecked() {
        return (this.mFlags & 2) != 0;
    }

    public boolean isEnabled() {
        return (this.mFlags & 16) != 0;
    }

    public boolean isVisible() {
        return (this.mFlags & 8) == 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setAlphabeticShortcut(char alphaChar) {
        this.mShortcutAlphabeticChar = alphaChar;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setCheckable(boolean checkable) {
        this.mFlags = (this.mFlags & (-2)) | (checkable ? 1 : 0);
        return this;
    }

    public ActionMenuItem setExclusiveCheckable(boolean exclusive) {
        this.mFlags = (this.mFlags & (-5)) | (exclusive ? 4 : 0);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setChecked(boolean checked) {
        this.mFlags = (this.mFlags & (-3)) | (checked ? 2 : 0);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setEnabled(boolean enabled) {
        this.mFlags = (this.mFlags & (-17)) | (enabled ? 16 : 0);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIcon(Drawable icon) {
        this.mIconDrawable = icon;
        this.mIconResId = 0;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIcon(int iconRes) {
        this.mIconResId = iconRes;
        this.mIconDrawable = ContextCompat.getDrawable(this.mContext, iconRes);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setIntent(Intent intent) {
        this.mIntent = intent;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setNumericShortcut(char numericChar) {
        this.mShortcutNumericChar = numericChar;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener menuItemClickListener) {
        this.mClickListener = menuItemClickListener;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setShortcut(char numericChar, char alphaChar) {
        this.mShortcutNumericChar = numericChar;
        this.mShortcutAlphabeticChar = alphaChar;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitle(CharSequence title) {
        this.mTitle = title;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitle(int title) {
        this.mTitle = this.mContext.getResources().getString(title);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setTitleCondensed(CharSequence title) {
        this.mTitleCondensed = title;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MenuItem setVisible(boolean visible) {
        this.mFlags = (this.mFlags & 8) | (visible ? 0 : 8);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean invoke() {
        if (this.mClickListener != null && this.mClickListener.onMenuItemClick(this)) {
            return true;
        }
        if (this.mIntent != null) {
            this.mContext.startActivity(this.mIntent);
            return true;
        }
        return false;
    }

    public void setShowAsAction(int show) {
    }

    /* renamed from: setActionView, reason: merged with bridge method [inline-methods] */
    public SupportMenuItem m15setActionView(View actionView) {
        throw new UnsupportedOperationException();
    }

    public View getActionView() {
        return null;
    }

    public MenuItem setActionProvider(ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    public ActionProvider getActionProvider() {
        throw new UnsupportedOperationException();
    }

    /* renamed from: setActionView, reason: merged with bridge method [inline-methods] */
    public SupportMenuItem m14setActionView(int resId) {
        throw new UnsupportedOperationException();
    }

    public android.support.v4.view.ActionProvider getSupportActionProvider() {
        return null;
    }

    public SupportMenuItem setSupportActionProvider(android.support.v4.view.ActionProvider actionProvider) {
        throw new UnsupportedOperationException();
    }

    /* renamed from: setShowAsActionFlags, reason: merged with bridge method [inline-methods] */
    public SupportMenuItem m16setShowAsActionFlags(int actionEnum) {
        setShowAsAction(actionEnum);
        return this;
    }

    public boolean expandActionView() {
        return false;
    }

    public boolean collapseActionView() {
        return false;
    }

    public boolean isActionViewExpanded() {
        return false;
    }

    public MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener listener) {
        throw new UnsupportedOperationException();
    }

    public SupportMenuItem setSupportOnActionExpandListener(MenuItemCompat.OnActionExpandListener listener) {
        return this;
    }
}
