package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.ImageButton;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.view.ActionProvider;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter.class */
public class ActionMenuPresenter extends BaseMenuPresenter implements ActionProvider.SubUiVisibilityListener {
    private View mOverflowButton;
    private boolean mReserveOverflow;
    private boolean mReserveOverflowSet;
    private int mWidthLimit;
    private int mActionItemWidthLimit;
    private int mMaxItems;
    private boolean mMaxItemsSet;
    private boolean mStrictWidthLimit;
    private boolean mWidthLimitSet;
    private boolean mExpandedActionViewsExclusive;
    private int mMinCellSize;
    private final SparseBooleanArray mActionButtonGroups;
    private View mScrapActionButtonView;
    private OverflowPopup mOverflowPopup;
    private ActionButtonSubmenu mActionButtonPopup;
    private OpenOverflowRunnable mPostedOpenRunnable;
    final PopupPresenterCallback mPopupPresenterCallback;
    int mOpenSubMenuId;

    public ActionMenuPresenter(Context context) {
        super(context, R.layout.abs__action_menu_layout, R.layout.abs__action_menu_item_layout);
        this.mActionButtonGroups = new SparseBooleanArray();
        this.mPopupPresenterCallback = new PopupPresenterCallback();
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void initForMenu(Context context, MenuBuilder menu) {
        super.initForMenu(context, menu);
        Resources res = context.getResources();
        if (!this.mReserveOverflowSet) {
            this.mReserveOverflow = reserveOverflow(this.mContext);
        }
        if (!this.mWidthLimitSet) {
            this.mWidthLimit = res.getDisplayMetrics().widthPixels / 2;
        }
        if (!this.mMaxItemsSet) {
            this.mMaxItems = ResourcesCompat.getResources_getInteger(context, R.integer.abs__max_action_buttons);
        }
        int width = this.mWidthLimit;
        if (this.mReserveOverflow) {
            if (this.mOverflowButton == null) {
                this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
                int spec = View.MeasureSpec.makeMeasureSpec(0, 0);
                this.mOverflowButton.measure(spec, spec);
            }
            width -= this.mOverflowButton.getMeasuredWidth();
        } else {
            this.mOverflowButton = null;
        }
        this.mActionItemWidthLimit = width;
        this.mMinCellSize = (int) (56.0f * res.getDisplayMetrics().density);
        this.mScrapActionButtonView = null;
    }

    public static boolean reserveOverflow(Context context) {
        return Build.VERSION.SDK_INT < 14 ? Build.VERSION.SDK_INT >= 11 : !HasPermanentMenuKey.get(context);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$HasPermanentMenuKey.class */
    private static class HasPermanentMenuKey {
        private HasPermanentMenuKey() {
        }

        public static boolean get(Context context) {
            return ViewConfiguration.get(context).hasPermanentMenuKey();
        }
    }

    public void onConfigurationChanged(Configuration newConfig) {
        if (!this.mMaxItemsSet) {
            this.mMaxItems = ResourcesCompat.getResources_getInteger(this.mContext, R.integer.abs__max_action_buttons);
            if (this.mMenu != null) {
                this.mMenu.onItemsChanged(true);
            }
        }
    }

    public void setWidthLimit(int width, boolean strict) {
        this.mWidthLimit = width;
        this.mStrictWidthLimit = strict;
        this.mWidthLimitSet = true;
    }

    public void setReserveOverflow(boolean reserveOverflow) {
        this.mReserveOverflow = reserveOverflow;
        this.mReserveOverflowSet = true;
    }

    public void setItemLimit(int itemCount) {
        this.mMaxItems = itemCount;
        this.mMaxItemsSet = true;
    }

    public void setExpandedActionViewsExclusive(boolean isExclusive) {
        this.mExpandedActionViewsExclusive = isExclusive;
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public MenuView getMenuView(ViewGroup root) {
        MenuView result = super.getMenuView(root);
        ((ActionMenuView) result).setPresenter(this);
        return result;
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter
    public View getItemView(MenuItemImpl item, View convertView, ViewGroup parent) {
        View actionView = item.getActionView();
        if (actionView == null || item.hasCollapsibleActionView()) {
            if (!(convertView instanceof ActionMenuItemView)) {
                convertView = null;
            }
            actionView = super.getItemView(item, convertView, parent);
        }
        actionView.setVisibility(item.isActionViewExpanded() ? 8 : 0);
        ActionMenuView menuParent = (ActionMenuView) parent;
        ViewGroup.LayoutParams lp = actionView.getLayoutParams();
        if (!menuParent.checkLayoutParams(lp)) {
            actionView.setLayoutParams(menuParent.generateLayoutParams(lp));
        }
        return actionView;
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter
    public void bindItemView(MenuItemImpl item, MenuView.ItemView itemView) {
        itemView.initialize(item, 0);
        ActionMenuView menuView = (ActionMenuView) this.mMenuView;
        ActionMenuItemView actionItemView = (ActionMenuItemView) itemView;
        actionItemView.setItemInvoker(menuView);
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter
    public boolean shouldIncludeItem(int childIndex, MenuItemImpl item) {
        return item.isActionButton();
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void updateMenuView(boolean cleared) {
        super.updateMenuView(cleared);
        if (this.mMenu != null) {
            ArrayList<MenuItemImpl> actionItems = this.mMenu.getActionItems();
            int count = actionItems.size();
            for (int i = 0; i < count; i++) {
                ActionProvider provider = actionItems.get(i).getActionProvider();
                if (provider != null) {
                    provider.setSubUiVisibilityListener(this);
                }
            }
        }
        ArrayList<MenuItemImpl> nonActionItems = this.mMenu != null ? this.mMenu.getNonActionItems() : null;
        boolean hasOverflow = false;
        if (this.mReserveOverflow && nonActionItems != null) {
            int count2 = nonActionItems.size();
            hasOverflow = count2 == 1 ? !nonActionItems.get(0).isActionViewExpanded() : count2 > 0;
        }
        if (hasOverflow) {
            if (this.mOverflowButton == null) {
                this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
            }
            ViewGroup parent = (ViewGroup) this.mOverflowButton.getParent();
            if (parent != this.mMenuView) {
                if (parent != null) {
                    parent.removeView(this.mOverflowButton);
                }
                ActionMenuView menuView = (ActionMenuView) this.mMenuView;
                menuView.addView(this.mOverflowButton, menuView.generateOverflowButtonLayoutParams());
            }
        } else if (this.mOverflowButton != null && this.mOverflowButton.getParent() == this.mMenuView) {
            ((ViewGroup) this.mMenuView).removeView(this.mOverflowButton);
        }
        ((ActionMenuView) this.mMenuView).setOverflowReserved(this.mReserveOverflow);
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter
    public boolean filterLeftoverView(ViewGroup parent, int childIndex) {
        if (parent.getChildAt(childIndex) == this.mOverflowButton) {
            return false;
        }
        return super.filterLeftoverView(parent, childIndex);
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean onSubMenuSelected(SubMenuBuilder subMenu) {
        SubMenuBuilder topSubMenu;
        if (!subMenu.hasVisibleItems()) {
            return false;
        }
        SubMenuBuilder subMenuBuilder = subMenu;
        while (true) {
            topSubMenu = subMenuBuilder;
            if (topSubMenu.getParentMenu() == this.mMenu) {
                break;
            }
            subMenuBuilder = (SubMenuBuilder) topSubMenu.getParentMenu();
        }
        View anchor = findViewForItem(topSubMenu.getItem());
        if (anchor == null) {
            if (this.mOverflowButton == null) {
                return false;
            }
            anchor = this.mOverflowButton;
        }
        this.mOpenSubMenuId = subMenu.getItem().getItemId();
        this.mActionButtonPopup = new ActionButtonSubmenu(this.mContext, subMenu);
        this.mActionButtonPopup.setAnchorView(anchor);
        this.mActionButtonPopup.show();
        super.onSubMenuSelected(subMenu);
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private View findViewForItem(MenuItem item) {
        ViewGroup parent = (ViewGroup) this.mMenuView;
        if (parent == null) {
            return null;
        }
        int count = parent.getChildCount();
        for (int i = 0; i < count; i++) {
            View childAt = parent.getChildAt(i);
            if ((childAt instanceof MenuView.ItemView) && ((MenuView.ItemView) childAt).getItemData() == item) {
                return childAt;
            }
        }
        return null;
    }

    public boolean showOverflowMenu() {
        if (this.mReserveOverflow && !isOverflowMenuShowing() && this.mMenu != null && this.mMenuView != null && this.mPostedOpenRunnable == null && !this.mMenu.getNonActionItems().isEmpty()) {
            OverflowPopup popup = new OverflowPopup(this.mContext, this.mMenu, this.mOverflowButton, true);
            this.mPostedOpenRunnable = new OpenOverflowRunnable(popup);
            ((View) this.mMenuView).post(this.mPostedOpenRunnable);
            super.onSubMenuSelected(null);
            return true;
        }
        return false;
    }

    public boolean hideOverflowMenu() {
        if (this.mPostedOpenRunnable != null && this.mMenuView != null) {
            ((View) this.mMenuView).removeCallbacks(this.mPostedOpenRunnable);
            this.mPostedOpenRunnable = null;
            return true;
        }
        MenuPopupHelper popup = this.mOverflowPopup;
        if (popup != null) {
            popup.dismiss();
            return true;
        }
        return false;
    }

    public boolean dismissPopupMenus() {
        boolean result = hideOverflowMenu();
        return result | hideSubMenus();
    }

    public boolean hideSubMenus() {
        if (this.mActionButtonPopup != null) {
            this.mActionButtonPopup.dismiss();
            return true;
        }
        return false;
    }

    public boolean isOverflowMenuShowing() {
        return this.mOverflowPopup != null && this.mOverflowPopup.isShowing();
    }

    public boolean isOverflowReserved() {
        return this.mReserveOverflow;
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean flagActionItems() {
        ArrayList<MenuItemImpl> visibleItems = this.mMenu.getVisibleItems();
        int itemsSize = visibleItems.size();
        int maxActions = this.mMaxItems;
        int widthLimit = this.mActionItemWidthLimit;
        int querySpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        ViewGroup parent = (ViewGroup) this.mMenuView;
        int requiredItems = 0;
        int requestedItems = 0;
        int firstActionWidth = 0;
        boolean hasOverflow = false;
        for (int i = 0; i < itemsSize; i++) {
            MenuItemImpl item = visibleItems.get(i);
            if (item.requiresActionButton()) {
                requiredItems++;
            } else if (item.requestsActionButton()) {
                requestedItems++;
            } else {
                hasOverflow = true;
            }
            if (this.mExpandedActionViewsExclusive && item.isActionViewExpanded()) {
                maxActions = 0;
            }
        }
        if (this.mReserveOverflow && (hasOverflow || requiredItems + requestedItems > maxActions)) {
            maxActions--;
        }
        int maxActions2 = maxActions - requiredItems;
        SparseBooleanArray seenGroups = this.mActionButtonGroups;
        seenGroups.clear();
        int cellSize = 0;
        int cellsRemaining = 0;
        if (this.mStrictWidthLimit) {
            cellsRemaining = widthLimit / this.mMinCellSize;
            int cellSizeRemaining = widthLimit % this.mMinCellSize;
            cellSize = this.mMinCellSize + (cellSizeRemaining / cellsRemaining);
        }
        for (int i2 = 0; i2 < itemsSize; i2++) {
            MenuItemImpl item2 = visibleItems.get(i2);
            if (item2.requiresActionButton()) {
                View v = getItemView(item2, this.mScrapActionButtonView, parent);
                if (this.mScrapActionButtonView == null) {
                    this.mScrapActionButtonView = v;
                }
                if (this.mStrictWidthLimit) {
                    cellsRemaining -= ActionMenuView.measureChildForCells(v, cellSize, cellsRemaining, querySpec, 0);
                } else {
                    v.measure(querySpec, querySpec);
                }
                int measuredWidth = v.getMeasuredWidth();
                widthLimit -= measuredWidth;
                if (firstActionWidth == 0) {
                    firstActionWidth = measuredWidth;
                }
                int groupId = item2.getGroupId();
                if (groupId != 0) {
                    seenGroups.put(groupId, true);
                }
                item2.setIsActionButton(true);
            } else if (item2.requestsActionButton()) {
                int groupId2 = item2.getGroupId();
                boolean inGroup = seenGroups.get(groupId2);
                boolean isAction = (maxActions2 > 0 || inGroup) && widthLimit > 0 && (!this.mStrictWidthLimit || cellsRemaining > 0);
                if (isAction) {
                    View v2 = getItemView(item2, this.mScrapActionButtonView, parent);
                    if (this.mScrapActionButtonView == null) {
                        this.mScrapActionButtonView = v2;
                    }
                    if (this.mStrictWidthLimit) {
                        int cells = ActionMenuView.measureChildForCells(v2, cellSize, cellsRemaining, querySpec, 0);
                        cellsRemaining -= cells;
                        if (cells == 0) {
                            isAction = false;
                        }
                    } else {
                        v2.measure(querySpec, querySpec);
                    }
                    int measuredWidth2 = v2.getMeasuredWidth();
                    widthLimit -= measuredWidth2;
                    if (firstActionWidth == 0) {
                        firstActionWidth = measuredWidth2;
                    }
                    if (this.mStrictWidthLimit) {
                        isAction &= widthLimit >= 0;
                    } else {
                        isAction &= widthLimit + firstActionWidth > 0;
                    }
                }
                if (isAction && groupId2 != 0) {
                    seenGroups.put(groupId2, true);
                } else if (inGroup) {
                    seenGroups.put(groupId2, false);
                    for (int j = 0; j < i2; j++) {
                        MenuItemImpl areYouMyGroupie = visibleItems.get(j);
                        if (areYouMyGroupie.getGroupId() == groupId2) {
                            if (areYouMyGroupie.isActionButton()) {
                                maxActions2++;
                            }
                            areYouMyGroupie.setIsActionButton(false);
                        }
                    }
                }
                if (isAction) {
                    maxActions2--;
                }
                item2.setIsActionButton(isAction);
            }
        }
        return true;
    }

    @Override // com.actionbarsherlock.internal.view.menu.BaseMenuPresenter, com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
        dismissPopupMenus();
        super.onCloseMenu(menu, allMenusAreClosing);
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public Parcelable onSaveInstanceState() {
        SavedState state = new SavedState();
        state.openSubMenuId = this.mOpenSubMenuId;
        return state;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void onRestoreInstanceState(Parcelable state) {
        MenuItem item;
        SavedState saved = (SavedState) state;
        if (saved.openSubMenuId > 0 && (item = this.mMenu.findItem(saved.openSubMenuId)) != null) {
            SubMenuBuilder subMenu = (SubMenuBuilder) item.getSubMenu();
            onSubMenuSelected(subMenu);
        }
    }

    @Override // com.actionbarsherlock.view.ActionProvider.SubUiVisibilityListener
    public void onSubUiVisibilityChanged(boolean isVisible) {
        if (isVisible) {
            super.onSubMenuSelected(null);
        } else {
            this.mMenu.close(false);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$SavedState.class */
    private static class SavedState implements Parcelable {
        public int openSubMenuId;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.actionbarsherlock.internal.view.menu.ActionMenuPresenter.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        SavedState() {
        }

        SavedState(Parcel in) {
            this.openSubMenuId = in.readInt();
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.openSubMenuId);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$OverflowMenuButton.class */
    private class OverflowMenuButton extends ImageButton implements ActionMenuView.ActionMenuChildView, View_HasStateListenerSupport {
        private final Set<View_OnAttachStateChangeListener> mListeners;

        public OverflowMenuButton(Context context) {
            super(context, null, R.attr.actionOverflowButtonStyle);
            this.mListeners = new HashSet();
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
        }

        @Override // android.view.View
        public boolean performClick() {
            if (super.performClick()) {
                return true;
            }
            playSoundEffect(0);
            ActionMenuPresenter.this.showOverflowMenu();
            return true;
        }

        @Override // com.actionbarsherlock.internal.view.menu.ActionMenuView.ActionMenuChildView
        public boolean needsDividerBefore() {
            return false;
        }

        @Override // com.actionbarsherlock.internal.view.menu.ActionMenuView.ActionMenuChildView
        public boolean needsDividerAfter() {
            return false;
        }

        @Override // android.widget.ImageView, android.view.View
        protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            for (View_OnAttachStateChangeListener listener : this.mListeners) {
                listener.onViewAttachedToWindow(this);
            }
        }

        @Override // android.widget.ImageView, android.view.View
        protected void onDetachedFromWindow() {
            super.onDetachedFromWindow();
            for (View_OnAttachStateChangeListener listener : this.mListeners) {
                listener.onViewDetachedFromWindow(this);
            }
            if (ActionMenuPresenter.this.mOverflowPopup != null) {
                ActionMenuPresenter.this.mOverflowPopup.dismiss();
            }
        }

        @Override // com.actionbarsherlock.internal.view.View_HasStateListenerSupport
        public void addOnAttachStateChangeListener(View_OnAttachStateChangeListener listener) {
            this.mListeners.add(listener);
        }

        @Override // com.actionbarsherlock.internal.view.View_HasStateListenerSupport
        public void removeOnAttachStateChangeListener(View_OnAttachStateChangeListener listener) {
            this.mListeners.remove(listener);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$OverflowPopup.class */
    private class OverflowPopup extends MenuPopupHelper {
        public OverflowPopup(Context context, MenuBuilder menu, View anchorView, boolean overflowOnly) {
            super(context, menu, anchorView, overflowOnly);
            setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuPopupHelper, android.widget.PopupWindow.OnDismissListener
        public void onDismiss() {
            super.onDismiss();
            ActionMenuPresenter.this.mMenu.close();
            ActionMenuPresenter.this.mOverflowPopup = null;
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$ActionButtonSubmenu.class */
    private class ActionButtonSubmenu extends MenuPopupHelper {
        public ActionButtonSubmenu(Context context, SubMenuBuilder subMenu) {
            super(context, subMenu);
            MenuItemImpl item = (MenuItemImpl) subMenu.getItem();
            if (!item.isActionButton()) {
                setAnchorView(ActionMenuPresenter.this.mOverflowButton == null ? (View) ActionMenuPresenter.this.mMenuView : ActionMenuPresenter.this.mOverflowButton);
            }
            setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
            boolean preserveIconSpacing = false;
            int count = subMenu.size();
            int i = 0;
            while (true) {
                if (i >= count) {
                    break;
                }
                MenuItem childItem = subMenu.getItem(i);
                if (!childItem.isVisible() || childItem.getIcon() == null) {
                    i++;
                } else {
                    preserveIconSpacing = true;
                    break;
                }
            }
            setForceShowIcon(preserveIconSpacing);
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuPopupHelper, android.widget.PopupWindow.OnDismissListener
        public void onDismiss() {
            super.onDismiss();
            ActionMenuPresenter.this.mActionButtonPopup = null;
            ActionMenuPresenter.this.mOpenSubMenuId = 0;
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$PopupPresenterCallback.class */
    private class PopupPresenterCallback implements MenuPresenter.Callback {
        private PopupPresenterCallback() {
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback
        public boolean onOpenSubMenu(MenuBuilder subMenu) {
            if (subMenu == null) {
                return false;
            }
            ActionMenuPresenter.this.mOpenSubMenuId = ((SubMenuBuilder) subMenu).getItem().getItemId();
            return false;
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter.Callback
        public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
            if (menu instanceof SubMenuBuilder) {
                ((SubMenuBuilder) menu).getRootMenu().close(false);
            }
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/ActionMenuPresenter$OpenOverflowRunnable.class */
    private class OpenOverflowRunnable implements Runnable {
        private OverflowPopup mPopup;

        public OpenOverflowRunnable(OverflowPopup popup) {
            this.mPopup = popup;
        }

        @Override // java.lang.Runnable
        public void run() {
            ActionMenuPresenter.this.mMenu.changeMenuMode();
            View menuView = (View) ActionMenuPresenter.this.mMenuView;
            if (menuView != null && menuView.getWindowToken() != null && this.mPopup.tryShow()) {
                ActionMenuPresenter.this.mOverflowPopup = this.mPopup;
            }
            ActionMenuPresenter.this.mPostedOpenRunnable = null;
        }
    }
}
