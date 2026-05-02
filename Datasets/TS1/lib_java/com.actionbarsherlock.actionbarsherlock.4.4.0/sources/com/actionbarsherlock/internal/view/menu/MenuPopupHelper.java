package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.view.View_HasStateListenerSupport;
import com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener;
import com.actionbarsherlock.internal.view.menu.MenuPresenter;
import com.actionbarsherlock.internal.view.menu.MenuView;
import com.actionbarsherlock.internal.widget.IcsListPopupWindow;
import com.actionbarsherlock.view.MenuItem;
import java.util.ArrayList;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuPopupHelper.class */
public class MenuPopupHelper implements AdapterView.OnItemClickListener, View.OnKeyListener, ViewTreeObserver.OnGlobalLayoutListener, PopupWindow.OnDismissListener, View_OnAttachStateChangeListener, MenuPresenter {
    static final int ITEM_LAYOUT = R.layout.abs__popup_menu_item_layout;
    private Context mContext;
    private LayoutInflater mInflater;
    private IcsListPopupWindow mPopup;
    private MenuBuilder mMenu;
    private int mPopupMaxWidth;
    private View mAnchorView;
    private boolean mOverflowOnly;
    private ViewTreeObserver mTreeObserver;
    private MenuAdapter mAdapter;
    private MenuPresenter.Callback mPresenterCallback;
    boolean mForceShowIcon;
    private ViewGroup mMeasureParent;

    public MenuPopupHelper(Context context, MenuBuilder menu) {
        this(context, menu, null, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menu, View anchorView) {
        this(context, menu, anchorView, false);
    }

    public MenuPopupHelper(Context context, MenuBuilder menu, View anchorView, boolean overflowOnly) {
        this.mContext = context;
        this.mInflater = LayoutInflater.from(context);
        this.mMenu = menu;
        this.mOverflowOnly = overflowOnly;
        Resources res = context.getResources();
        this.mPopupMaxWidth = Math.max(res.getDisplayMetrics().widthPixels / 2, res.getDimensionPixelSize(R.dimen.abs__config_prefDialogWidth));
        this.mAnchorView = anchorView;
        menu.addMenuPresenter(this);
    }

    public void setAnchorView(View anchor) {
        this.mAnchorView = anchor;
    }

    public void setForceShowIcon(boolean forceShow) {
        this.mForceShowIcon = forceShow;
    }

    public void show() {
        if (!tryShow()) {
            throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean tryShow() {
        this.mPopup = new IcsListPopupWindow(this.mContext, null, R.attr.popupMenuStyle);
        this.mPopup.setOnDismissListener(this);
        this.mPopup.setOnItemClickListener(this);
        this.mAdapter = new MenuAdapter(this.mMenu);
        this.mPopup.setAdapter(this.mAdapter);
        this.mPopup.setModal(true);
        View view = this.mAnchorView;
        if (view != 0) {
            if (view.getWindowToken() != null) {
                ViewTreeObserver vto = view.getViewTreeObserver();
                if (vto != this.mTreeObserver) {
                    if (this.mTreeObserver != null && this.mTreeObserver.isAlive()) {
                        this.mTreeObserver.removeGlobalOnLayoutListener(this);
                    }
                    this.mTreeObserver = vto;
                    if (vto != null) {
                        vto.addOnGlobalLayoutListener(this);
                    }
                }
            } else if (view instanceof View_HasStateListenerSupport) {
                ((View_HasStateListenerSupport) view).addOnAttachStateChangeListener(this);
            }
            this.mPopup.setAnchorView(view);
            this.mPopup.setContentWidth(Math.min(measureContentWidth(this.mAdapter), this.mPopupMaxWidth));
            this.mPopup.setInputMethodMode(2);
            this.mPopup.show();
            this.mPopup.getListView().setOnKeyListener(this);
            return true;
        }
        return false;
    }

    public void dismiss() {
        if (isShowing()) {
            this.mPopup.dismiss();
        }
    }

    public void onDismiss() {
        this.mPopup = null;
        this.mMenu.close();
        if (this.mTreeObserver != null) {
            if (this.mTreeObserver.isAlive()) {
                this.mTreeObserver.removeGlobalOnLayoutListener(this);
            }
            this.mTreeObserver = null;
        } else if (this.mAnchorView instanceof View_HasStateListenerSupport) {
            ((View_HasStateListenerSupport) this.mAnchorView).removeOnAttachStateChangeListener(this);
        }
    }

    public boolean isShowing() {
        return this.mPopup != null && this.mPopup.isShowing();
    }

    @Override // android.widget.AdapterView.OnItemClickListener
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        MenuAdapter adapter = this.mAdapter;
        adapter.mAdapterMenu.performItemAction(adapter.getItem(position), 0);
    }

    @Override // android.view.View.OnKeyListener
    public boolean onKey(View v, int keyCode, KeyEvent event) {
        if (event.getAction() == 1 && keyCode == 82) {
            dismiss();
            return true;
        }
        return false;
    }

    private int measureContentWidth(ListAdapter adapter) {
        int width = 0;
        View itemView = null;
        int itemType = 0;
        int widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int count = adapter.getCount();
        for (int i = 0; i < count; i++) {
            int positionType = adapter.getItemViewType(i);
            if (positionType != itemType) {
                itemType = positionType;
                itemView = null;
            }
            if (this.mMeasureParent == null) {
                this.mMeasureParent = new FrameLayout(this.mContext);
            }
            itemView = adapter.getView(i, itemView, this.mMeasureParent);
            itemView.measure(widthMeasureSpec, heightMeasureSpec);
            width = Math.max(width, itemView.getMeasuredWidth());
        }
        return width;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public void onGlobalLayout() {
        if (isShowing()) {
            View anchor = this.mAnchorView;
            if (anchor == null || !anchor.isShown()) {
                dismiss();
            } else if (isShowing()) {
                this.mPopup.show();
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener
    public void onViewAttachedToWindow(View view) {
        ((View_HasStateListenerSupport) view).removeOnAttachStateChangeListener(this);
        if (this.mPopup != null && this.mTreeObserver == null) {
            ViewTreeObserver viewTreeObserver = view.getViewTreeObserver();
            this.mTreeObserver = viewTreeObserver;
            viewTreeObserver.addOnGlobalLayoutListener(this);
        }
    }

    @Override // com.actionbarsherlock.internal.view.View_OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View v) {
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void initForMenu(Context context, MenuBuilder menu) {
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public MenuView getMenuView(ViewGroup root) {
        throw new UnsupportedOperationException("MenuPopupHelpers manage their own views");
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void updateMenuView(boolean cleared) {
        if (this.mAdapter != null) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void setCallback(MenuPresenter.Callback cb) {
        this.mPresenterCallback = cb;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean onSubMenuSelected(SubMenuBuilder subMenu) {
        if (subMenu.hasVisibleItems()) {
            MenuPopupHelper subPopup = new MenuPopupHelper(this.mContext, subMenu, this.mAnchorView, false);
            subPopup.setCallback(this.mPresenterCallback);
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
            subPopup.setForceShowIcon(preserveIconSpacing);
            if (subPopup.tryShow()) {
                if (this.mPresenterCallback != null) {
                    this.mPresenterCallback.onOpenSubMenu(subMenu);
                    return true;
                }
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
        if (menu != this.mMenu) {
            return;
        }
        dismiss();
        if (this.mPresenterCallback != null) {
            this.mPresenterCallback.onCloseMenu(menu, allMenusAreClosing);
        }
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean flagActionItems() {
        return false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean expandItemActionView(MenuBuilder menu, MenuItemImpl item) {
        return false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public boolean collapseItemActionView(MenuBuilder menu, MenuItemImpl item) {
        return false;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public int getId() {
        return 0;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public Parcelable onSaveInstanceState() {
        return null;
    }

    @Override // com.actionbarsherlock.internal.view.menu.MenuPresenter
    public void onRestoreInstanceState(Parcelable state) {
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuPopupHelper$MenuAdapter.class */
    private class MenuAdapter extends BaseAdapter {
        private MenuBuilder mAdapterMenu;
        private int mExpandedIndex = -1;

        public MenuAdapter(MenuBuilder menu) {
            this.mAdapterMenu = menu;
            registerDataSetObserver(new ExpandedIndexObserver());
            findExpandedIndex();
        }

        @Override // android.widget.Adapter
        public int getCount() {
            ArrayList<MenuItemImpl> items = MenuPopupHelper.this.mOverflowOnly ? this.mAdapterMenu.getNonActionItems() : this.mAdapterMenu.getVisibleItems();
            if (this.mExpandedIndex < 0) {
                return items.size();
            }
            return items.size() - 1;
        }

        @Override // android.widget.Adapter
        public MenuItemImpl getItem(int position) {
            ArrayList<MenuItemImpl> items = MenuPopupHelper.this.mOverflowOnly ? this.mAdapterMenu.getNonActionItems() : this.mAdapterMenu.getVisibleItems();
            if (this.mExpandedIndex >= 0 && position >= this.mExpandedIndex) {
                position++;
            }
            return items.get(position);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return position;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = MenuPopupHelper.this.mInflater.inflate(MenuPopupHelper.ITEM_LAYOUT, parent, false);
            }
            MenuView.ItemView itemView = (MenuView.ItemView) convertView;
            if (MenuPopupHelper.this.mForceShowIcon) {
                ((ListMenuItemView) convertView).setForceShowIcon(true);
            }
            itemView.initialize(getItem(position), 0);
            return convertView;
        }

        void findExpandedIndex() {
            MenuItemImpl expandedItem = MenuPopupHelper.this.mMenu.getExpandedItem();
            if (expandedItem != null) {
                ArrayList<MenuItemImpl> items = MenuPopupHelper.this.mMenu.getNonActionItems();
                int count = items.size();
                for (int i = 0; i < count; i++) {
                    MenuItemImpl item = items.get(i);
                    if (item == expandedItem) {
                        this.mExpandedIndex = i;
                        return;
                    }
                }
            }
            this.mExpandedIndex = -1;
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/view/menu/MenuPopupHelper$ExpandedIndexObserver.class */
    private class ExpandedIndexObserver extends DataSetObserver {
        private ExpandedIndexObserver() {
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            MenuPopupHelper.this.mAdapter.findExpandedIndex();
        }
    }
}
