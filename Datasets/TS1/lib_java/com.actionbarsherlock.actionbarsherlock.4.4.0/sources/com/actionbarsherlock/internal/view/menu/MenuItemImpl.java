package com.actionbarsherlock.internal.view.menu;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.view.ActionProvider;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.view.SubMenu;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuItemImpl.class */
public final class MenuItemImpl implements MenuItem {
    private static final String TAG = "MenuItemImpl";
    private static final int SHOW_AS_ACTION_MASK = 3;
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
    private MenuBuilder mMenu;
    private SubMenuBuilder mSubMenu;
    private Runnable mItemCallback;
    private MenuItem.OnMenuItemClickListener mClickListener;
    private static final int CHECKABLE = 1;
    private static final int CHECKED = 2;
    private static final int EXCLUSIVE = 4;
    private static final int HIDDEN = 8;
    private static final int ENABLED = 16;
    private static final int IS_ACTION = 32;
    private int mShowAsAction;
    private View mActionView;
    private ActionProvider mActionProvider;
    private MenuItem.OnActionExpandListener mOnActionExpandListener;
    static final int NO_ICON = 0;
    private ContextMenu.ContextMenuInfo mMenuInfo;
    private static String sPrependShortcutLabel;
    private static String sEnterShortcutLabel;
    private static String sDeleteShortcutLabel;
    private static String sSpaceShortcutLabel;
    private int mIconResId = 0;
    private int mFlags = 16;
    private boolean mIsActionViewExpanded = false;

    MenuItemImpl(MenuBuilder menu, int group, int id, int categoryOrder, int ordering, CharSequence title, int showAsAction) {
        this.mShowAsAction = 0;
        this.mMenu = menu;
        this.mId = id;
        this.mGroup = group;
        this.mCategoryOrder = categoryOrder;
        this.mOrdering = ordering;
        this.mTitle = title;
        this.mShowAsAction = showAsAction;
    }

    public boolean invoke() {
        if ((this.mClickListener != null && this.mClickListener.onMenuItemClick(this)) || this.mMenu.dispatchMenuItemSelected(this.mMenu.getRootMenu(), this)) {
            return true;
        }
        if (this.mItemCallback != null) {
            this.mItemCallback.run();
            return true;
        }
        if (this.mIntent != null) {
            try {
                this.mMenu.getContext().startActivity(this.mIntent);
                return true;
            } catch (ActivityNotFoundException e) {
                Log.e(TAG, "Can't find activity to handle intent; ignoring", e);
            }
        }
        if (this.mActionProvider != null && this.mActionProvider.onPerformDefaultAction()) {
            return true;
        }
        return false;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean isEnabled() {
        return (this.mFlags & 16) != 0;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setEnabled(boolean enabled) {
        if (enabled) {
            this.mFlags |= 16;
        } else {
            this.mFlags &= -17;
        }
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public int getGroupId() {
        return this.mGroup;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    @ViewDebug.CapturedViewProperty
    public int getItemId() {
        return this.mId;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public int getOrder() {
        return this.mCategoryOrder;
    }

    public int getOrdering() {
        return this.mOrdering;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public Intent getIntent() {
        return this.mIntent;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setIntent(Intent intent) {
        this.mIntent = intent;
        return this;
    }

    Runnable getCallback() {
        return this.mItemCallback;
    }

    public MenuItem setCallback(Runnable callback) {
        this.mItemCallback = callback;
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public char getAlphabeticShortcut() {
        return this.mShortcutAlphabeticChar;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setAlphabeticShortcut(char alphaChar) {
        if (this.mShortcutAlphabeticChar == alphaChar) {
            return this;
        }
        this.mShortcutAlphabeticChar = Character.toLowerCase(alphaChar);
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public char getNumericShortcut() {
        return this.mShortcutNumericChar;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setNumericShortcut(char numericChar) {
        if (this.mShortcutNumericChar == numericChar) {
            return this;
        }
        this.mShortcutNumericChar = numericChar;
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setShortcut(char numericChar, char alphaChar) {
        this.mShortcutNumericChar = numericChar;
        this.mShortcutAlphabeticChar = Character.toLowerCase(alphaChar);
        this.mMenu.onItemsChanged(false);
        return this;
    }

    char getShortcut() {
        return this.mMenu.isQwertyMode() ? this.mShortcutAlphabeticChar : this.mShortcutNumericChar;
    }

    String getShortcutLabel() {
        char shortcut = getShortcut();
        if (shortcut == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(sPrependShortcutLabel);
        switch (shortcut) {
            case '\b':
                sb.append(sDeleteShortcutLabel);
                break;
            case '\n':
                sb.append(sEnterShortcutLabel);
                break;
            case IS_ACTION /* 32 */:
                sb.append(sSpaceShortcutLabel);
                break;
            default:
                sb.append(shortcut);
                break;
        }
        return sb.toString();
    }

    boolean shouldShowShortcut() {
        return this.mMenu.isShortcutsVisible() && getShortcut() != 0;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public SubMenu getSubMenu() {
        return this.mSubMenu;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean hasSubMenu() {
        return this.mSubMenu != null;
    }

    void setSubMenu(SubMenuBuilder subMenu) {
        this.mSubMenu = subMenu;
        subMenu.setHeaderTitle(getTitle());
    }

    @Override // com.actionbarsherlock.view.MenuItem
    @ViewDebug.CapturedViewProperty
    public CharSequence getTitle() {
        return this.mTitle;
    }

    CharSequence getTitleForItemView(MenuView.ItemView itemView) {
        if (itemView != null && itemView.prefersCondensedTitle()) {
            return getTitleCondensed();
        }
        return getTitle();
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setTitle(CharSequence title) {
        this.mTitle = title;
        this.mMenu.onItemsChanged(false);
        if (this.mSubMenu != null) {
            this.mSubMenu.setHeaderTitle(title);
        }
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setTitle(int title) {
        return setTitle(this.mMenu.getContext().getString(title));
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public CharSequence getTitleCondensed() {
        return this.mTitleCondensed != null ? this.mTitleCondensed : this.mTitle;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setTitleCondensed(CharSequence title) {
        this.mTitleCondensed = title;
        if (title == null) {
            CharSequence charSequence = this.mTitle;
        }
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public Drawable getIcon() {
        if (this.mIconDrawable != null) {
            return this.mIconDrawable;
        }
        if (this.mIconResId != 0) {
            return this.mMenu.getResources().getDrawable(this.mIconResId);
        }
        return null;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setIcon(Drawable icon) {
        this.mIconResId = 0;
        this.mIconDrawable = icon;
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setIcon(int iconResId) {
        this.mIconDrawable = null;
        this.mIconResId = iconResId;
        this.mMenu.onItemsChanged(false);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean isCheckable() {
        return (this.mFlags & 1) == 1;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setCheckable(boolean checkable) {
        int oldFlags = this.mFlags;
        this.mFlags = (this.mFlags & (-2)) | (checkable ? 1 : 0);
        if (oldFlags != this.mFlags) {
            this.mMenu.onItemsChanged(false);
        }
        return this;
    }

    public void setExclusiveCheckable(boolean exclusive) {
        this.mFlags = (this.mFlags & (-5)) | (exclusive ? 4 : 0);
    }

    public boolean isExclusiveCheckable() {
        return (this.mFlags & 4) != 0;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean isChecked() {
        return (this.mFlags & 2) == 2;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setChecked(boolean checked) {
        if ((this.mFlags & 4) != 0) {
            this.mMenu.setExclusiveItemChecked(this);
        } else {
            setCheckedInt(checked);
        }
        return this;
    }

    void setCheckedInt(boolean checked) {
        int oldFlags = this.mFlags;
        this.mFlags = (this.mFlags & (-3)) | (checked ? 2 : 0);
        if (oldFlags != this.mFlags) {
            this.mMenu.onItemsChanged(false);
        }
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean isVisible() {
        return (this.mFlags & 8) == 0;
    }

    boolean setVisibleInt(boolean shown) {
        int oldFlags = this.mFlags;
        this.mFlags = (this.mFlags & (-9)) | (shown ? 0 : 8);
        return oldFlags != this.mFlags;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setVisible(boolean shown) {
        if (setVisibleInt(shown)) {
            this.mMenu.onItemVisibleChanged(this);
        }
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener clickListener) {
        this.mClickListener = clickListener;
        return this;
    }

    public String toString() {
        return this.mTitle.toString();
    }

    void setMenuInfo(ContextMenu.ContextMenuInfo menuInfo) {
        this.mMenuInfo = menuInfo;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public ContextMenu.ContextMenuInfo getMenuInfo() {
        return this.mMenuInfo;
    }

    public void actionFormatChanged() {
        this.mMenu.onItemActionRequestChanged(this);
    }

    public boolean shouldShowIcon() {
        return this.mMenu.getOptionalIconsVisible();
    }

    public boolean isActionButton() {
        return (this.mFlags & IS_ACTION) == IS_ACTION;
    }

    public boolean requestsActionButton() {
        return (this.mShowAsAction & 1) == 1;
    }

    public boolean requiresActionButton() {
        return (this.mShowAsAction & 2) == 2;
    }

    public void setIsActionButton(boolean isActionButton) {
        if (isActionButton) {
            this.mFlags |= IS_ACTION;
        } else {
            this.mFlags &= -33;
        }
    }

    public boolean showsTextAsAction() {
        return (this.mShowAsAction & 4) == 4;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public void setShowAsAction(int actionEnum) {
        switch (actionEnum & SHOW_AS_ACTION_MASK) {
            case 0:
            case 1:
            case 2:
                this.mShowAsAction = actionEnum;
                this.mMenu.onItemActionRequestChanged(this);
                return;
            default:
                throw new IllegalArgumentException("SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive.");
        }
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setActionView(View view) {
        this.mActionView = view;
        this.mActionProvider = null;
        if (view != null && view.getId() == -1 && this.mId > 0) {
            view.setId(this.mId);
        }
        this.mMenu.onItemActionRequestChanged(this);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setActionView(int resId) {
        Context context = this.mMenu.getContext();
        LayoutInflater inflater = LayoutInflater.from(context);
        setActionView(inflater.inflate(resId, (ViewGroup) new LinearLayout(context), false));
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public View getActionView() {
        if (this.mActionView != null) {
            return this.mActionView;
        }
        if (this.mActionProvider != null) {
            this.mActionView = this.mActionProvider.onCreateActionView();
            return this.mActionView;
        }
        return null;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public ActionProvider getActionProvider() {
        return this.mActionProvider;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setActionProvider(ActionProvider actionProvider) {
        this.mActionView = null;
        this.mActionProvider = actionProvider;
        this.mMenu.onItemsChanged(true);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setShowAsActionFlags(int actionEnum) {
        setShowAsAction(actionEnum);
        return this;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean expandActionView() {
        if ((this.mShowAsAction & 8) == 0 || this.mActionView == null) {
            return false;
        }
        if (this.mOnActionExpandListener == null || this.mOnActionExpandListener.onMenuItemActionExpand(this)) {
            return this.mMenu.expandItemActionView(this);
        }
        return false;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean collapseActionView() {
        if ((this.mShowAsAction & 8) == 0) {
            return false;
        }
        if (this.mActionView == null) {
            return true;
        }
        if (this.mOnActionExpandListener == null || this.mOnActionExpandListener.onMenuItemActionCollapse(this)) {
            return this.mMenu.collapseItemActionView(this);
        }
        return false;
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener listener) {
        this.mOnActionExpandListener = listener;
        return this;
    }

    public boolean hasCollapsibleActionView() {
        return ((this.mShowAsAction & 8) == 0 || this.mActionView == null) ? false : true;
    }

    public void setActionViewExpanded(boolean isExpanded) {
        this.mIsActionViewExpanded = isExpanded;
        this.mMenu.onItemsChanged(false);
    }

    @Override // com.actionbarsherlock.view.MenuItem
    public boolean isActionViewExpanded() {
        return this.mIsActionViewExpanded;
    }
}
