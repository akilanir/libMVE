package com.mikepenz.materialdrawer;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RelativeLayout;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.model.interfaces.Badgeable;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Iconable;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.util.KeyboardUtil;
import com.mikepenz.materialdrawer.util.UIUtils;
import com.mikepenz.materialdrawer.view.ScrimInsetsFrameLayout;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer.class */
public class Drawer {
    protected static final String BUNDLE_SELECTION = "bundle_selection";
    protected static final String BUNDLE_FOOTER_SELECTION = "bundle_footer_selection";
    protected static final String PREF_USER_LEARNED_DRAWER = "navigation_drawer_learned";
    private final DrawerBuilder mDrawerBuilder;
    private FrameLayout mContentView;
    private OnDrawerItemClickListener originalOnDrawerItemClickListener;
    private ArrayList<IDrawerItem> originalDrawerItems;
    private KeyboardUtil mKeyboardUtil = null;
    private int originalDrawerSelection = -1;

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener.class */
    public interface OnDrawerItemClickListener {
        boolean onItemClick(AdapterView<?> adapterView, View view, int i, long j, IDrawerItem iDrawerItem);
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener.class */
    public interface OnDrawerItemLongClickListener {
        boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long j, IDrawerItem iDrawerItem);
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener.class */
    public interface OnDrawerItemSelectedListener {
        void onItemSelected(AdapterView<?> adapterView, View view, int i, long j, IDrawerItem iDrawerItem);

        void onNothingSelected(AdapterView<?> adapterView);
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerListener.class */
    public interface OnDrawerListener {
        void onDrawerOpened(View view);

        void onDrawerClosed(View view);

        void onDrawerSlide(View view, float f);
    }

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener.class */
    public interface OnDrawerNavigationListener {
        boolean onNavigationClickListener(View view);
    }

    protected Drawer(DrawerBuilder drawerBuilder) {
        this.mDrawerBuilder = drawerBuilder;
    }

    public DrawerLayout getDrawerLayout() {
        return this.mDrawerBuilder.mDrawerLayout;
    }

    public void openDrawer() {
        if (this.mDrawerBuilder.mDrawerLayout != null && this.mDrawerBuilder.mSliderLayout != null) {
            this.mDrawerBuilder.mDrawerLayout.openDrawer(this.mDrawerBuilder.mDrawerGravity.intValue());
        }
    }

    public void closeDrawer() {
        if (this.mDrawerBuilder.mDrawerLayout != null) {
            this.mDrawerBuilder.mDrawerLayout.closeDrawer(this.mDrawerBuilder.mDrawerGravity.intValue());
        }
    }

    public boolean isDrawerOpen() {
        if (this.mDrawerBuilder.mDrawerLayout != null && this.mDrawerBuilder.mSliderLayout != null) {
            return this.mDrawerBuilder.mDrawerLayout.isDrawerOpen(this.mDrawerBuilder.mDrawerGravity.intValue());
        }
        return false;
    }

    public void setFullscreen(boolean fullscreen) {
        if (this.mDrawerBuilder.mDrawerContentRoot != null) {
            this.mDrawerBuilder.mDrawerContentRoot.setEnabled(!fullscreen);
        }
    }

    public void setStatusBarColor(int statusBarColor) {
        if (this.mDrawerBuilder.mDrawerContentRoot != null) {
            this.mDrawerBuilder.mDrawerContentRoot.setInsetForeground(statusBarColor);
            this.mDrawerBuilder.mDrawerContentRoot.invalidate();
        }
    }

    public ScrimInsetsFrameLayout getScrimInsetsFrameLayout() {
        return this.mDrawerBuilder.mDrawerContentRoot;
    }

    public void keyboardSupportEnabled(Activity activity, boolean enable) {
        if (getContent() != null && getContent().getChildCount() > 0) {
            if (this.mKeyboardUtil == null) {
                this.mKeyboardUtil = new KeyboardUtil(activity, getContent().getChildAt(0));
                this.mKeyboardUtil.disable();
            }
            if (enable) {
                this.mKeyboardUtil.enable();
            } else {
                this.mKeyboardUtil.disable();
            }
        }
    }

    public RelativeLayout getSlider() {
        return this.mDrawerBuilder.mSliderLayout;
    }

    public FrameLayout getContent() {
        if (this.mContentView == null && this.mDrawerBuilder.mDrawerLayout != null) {
            this.mContentView = (FrameLayout) this.mDrawerBuilder.mDrawerLayout.findViewById(R.id.content_layout);
        }
        return this.mContentView;
    }

    public ListView getListView() {
        return this.mDrawerBuilder.mListView;
    }

    public BaseDrawerAdapter getAdapter() {
        return this.mDrawerBuilder.mAdapter;
    }

    public ArrayList<IDrawerItem> getDrawerItems() {
        return this.mDrawerBuilder.mDrawerItems;
    }

    public View getHeader() {
        return this.mDrawerBuilder.mHeaderView;
    }

    public View getStickyHeader() {
        return this.mDrawerBuilder.mStickyHeaderView;
    }

    public void setHeader(View view) {
        if (getListView() != null) {
            BaseDrawerAdapter adapter = getAdapter();
            getListView().setAdapter((ListAdapter) null);
            if (getHeader() != null) {
                getListView().removeHeaderView(getHeader());
            }
            getListView().addHeaderView(view);
            getListView().setAdapter((ListAdapter) adapter);
            this.mDrawerBuilder.mHeaderView = view;
            this.mDrawerBuilder.mHeaderOffset = 1;
        }
    }

    public void removeHeader() {
        if (getListView() != null && getHeader() != null) {
            getListView().removeHeaderView(getHeader());
            this.mDrawerBuilder.mHeaderView = null;
            this.mDrawerBuilder.mHeaderOffset = 0;
        }
    }

    public View getFooter() {
        return this.mDrawerBuilder.mFooterView;
    }

    public View getStickyFooter() {
        return this.mDrawerBuilder.mStickyFooterView;
    }

    public ActionBarDrawerToggle getActionBarDrawerToggle() {
        return this.mDrawerBuilder.mActionBarDrawerToggle;
    }

    public int getPositionFromIdentifier(IDrawerItem drawerItem) {
        return getPositionFromIdentifier(drawerItem.getIdentifier());
    }

    public int getPositionFromIdentifier(int identifier) {
        return DrawerUtils.getPositionFromIdentifier(this.mDrawerBuilder, identifier);
    }

    public int getFooterPositionFromIdentifier(IDrawerItem drawerItem) {
        return getFooterPositionFromIdentifier(drawerItem.getIdentifier());
    }

    public int getFooterPositionFromIdentifier(int identifier) {
        return DrawerUtils.getFooterPositionFromIdentifier(this.mDrawerBuilder, identifier);
    }

    public int getCurrentSelection() {
        return this.mDrawerBuilder.mCurrentSelection;
    }

    public int getCurrentFooterSelection() {
        return this.mDrawerBuilder.mCurrentFooterSelection;
    }

    public boolean setSelectionByIdentifier(int identifier) {
        return setSelection(getPositionFromIdentifier(identifier), true);
    }

    public boolean setSelectionByIdentifier(int identifier, boolean fireOnClick) {
        return setSelection(getPositionFromIdentifier(identifier), fireOnClick);
    }

    public void setFooterSelectionByIdentifier(int identifier, boolean fireOnClick) {
        setFooterSelection(getPositionFromIdentifier(identifier), fireOnClick);
    }

    public boolean setSelection(IDrawerItem drawerItem) {
        return setSelection(getPositionFromIdentifier(drawerItem), true);
    }

    public boolean setSelection(IDrawerItem drawerItem, boolean fireOnClick) {
        return setSelection(getPositionFromIdentifier(drawerItem), fireOnClick);
    }

    public boolean setSelection(int position) {
        return setSelection(position, true);
    }

    public boolean setSelection(int position, boolean fireOnClick) {
        if (this.mDrawerBuilder.mListView != null) {
            return DrawerUtils.setListSelection(this.mDrawerBuilder, position, fireOnClick, this.mDrawerBuilder.getDrawerItem(position, false));
        }
        return false;
    }

    public void setFooterSelection(int position) {
        setFooterSelection(position, true);
    }

    public void setFooterSelection(int position, boolean fireOnClick) {
        DrawerUtils.setFooterSelection(this.mDrawerBuilder, position, fireOnClick);
    }

    public void updateItem(IDrawerItem drawerItem) {
        updateItem(drawerItem, getPositionFromIdentifier(drawerItem));
    }

    public void updateItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void addItem(IDrawerItem drawerItem) {
        if (this.mDrawerBuilder.mDrawerItems != null) {
            this.mDrawerBuilder.mDrawerItems.add(drawerItem);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void addItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mDrawerItems != null) {
            this.mDrawerBuilder.mDrawerItems.add(position, drawerItem);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void setItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mDrawerItems != null) {
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void removeItem(int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            this.mDrawerBuilder.mDrawerItems.remove(position);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void removeAllItems() {
        this.mDrawerBuilder.mDrawerItems.clear();
        this.mDrawerBuilder.mAdapter.dataUpdated();
    }

    public void addItems(IDrawerItem... drawerItems) {
        if (this.mDrawerBuilder.mDrawerItems != null) {
            Collections.addAll(this.mDrawerBuilder.mDrawerItems, drawerItems);
            this.mDrawerBuilder.mAdapter.dataUpdated();
        }
    }

    public void setItems(ArrayList<IDrawerItem> drawerItems) {
        setItems(drawerItems, false);
    }

    private void setItems(ArrayList<IDrawerItem> drawerItems, boolean switchedItems) {
        this.mDrawerBuilder.mDrawerItems = drawerItems;
        if (this.originalDrawerItems != null && !switchedItems) {
            this.originalDrawerItems = drawerItems;
        } else {
            this.mDrawerBuilder.mAdapter.setDrawerItems(this.mDrawerBuilder.mDrawerItems);
        }
        this.mDrawerBuilder.mAdapter.dataUpdated();
    }

    public void updateName(int nameRes, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Nameable) {
                ((Nameable) drawerItem).setName(null);
                ((Nameable) drawerItem).setNameRes(nameRes);
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateName(String name, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Nameable) {
                ((Nameable) drawerItem).setNameRes(-1);
                ((Nameable) drawerItem).setName(name);
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateBadge(String badge, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Badgeable) {
                ((Badgeable) drawerItem).setBadge(badge);
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateIcon(Drawable icon, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Iconable) {
                ((Iconable) drawerItem).setIcon(icon);
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateIcon(int iconRes, int position) {
        if (this.mDrawerBuilder.mRootView != null && this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Iconable) {
                ((Iconable) drawerItem).setIcon(UIUtils.getCompatDrawable(this.mDrawerBuilder.mRootView.getContext(), iconRes));
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateIcon(IIcon icon, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            IDrawerItem drawerItem = this.mDrawerBuilder.mDrawerItems.get(position);
            if (drawerItem instanceof Iconable) {
                ((Iconable) drawerItem).setIIcon(icon);
            }
            this.mDrawerBuilder.mDrawerItems.set(position, drawerItem);
            this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
        }
    }

    public void updateFooterItem(IDrawerItem drawerItem) {
        updateFooterItem(drawerItem, getFooterPositionFromIdentifier(drawerItem));
    }

    public void updateFooterItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.set(position, drawerItem);
        }
        DrawerUtils.rebuildFooterView(this.mDrawerBuilder);
    }

    public void addFooterItem(IDrawerItem drawerItem) {
        if (this.mDrawerBuilder.mStickyDrawerItems == null) {
            this.mDrawerBuilder.mStickyDrawerItems = new ArrayList<>();
        }
        this.mDrawerBuilder.mStickyDrawerItems.add(drawerItem);
        DrawerUtils.rebuildFooterView(this.mDrawerBuilder);
    }

    public void addFooterItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems == null) {
            this.mDrawerBuilder.mStickyDrawerItems = new ArrayList<>();
        }
        this.mDrawerBuilder.mStickyDrawerItems.add(position, drawerItem);
        DrawerUtils.rebuildFooterView(this.mDrawerBuilder);
    }

    public void setFooterItem(IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.set(position, drawerItem);
        }
        DrawerUtils.rebuildFooterView(this.mDrawerBuilder);
    }

    public void removeFooterItem(int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.remove(position);
        }
        DrawerUtils.rebuildFooterView(this.mDrawerBuilder);
    }

    public void removeAllFooterItems() {
        if (this.mDrawerBuilder.mStickyDrawerItems != null) {
            this.mDrawerBuilder.mStickyDrawerItems.clear();
        }
        if (this.mDrawerBuilder.mStickyFooterView != null) {
            this.mDrawerBuilder.mStickyFooterView.setVisibility(8);
        }
    }

    public void setOnDrawerItemClickListener(OnDrawerItemClickListener onDrawerItemClickListener) {
        this.mDrawerBuilder.mOnDrawerItemClickListener = onDrawerItemClickListener;
    }

    public OnDrawerItemClickListener getOnDrawerItemClickListener() {
        return this.mDrawerBuilder.mOnDrawerItemClickListener;
    }

    public void setOnDrawerItemLongClickListener(OnDrawerItemLongClickListener onDrawerItemLongClickListener) {
        this.mDrawerBuilder.mOnDrawerItemLongClickListener = onDrawerItemLongClickListener;
    }

    public OnDrawerItemLongClickListener getOnDrawerItemLongClickListener() {
        return this.mDrawerBuilder.mOnDrawerItemLongClickListener;
    }

    public boolean switchedDrawerContent() {
        return (this.originalOnDrawerItemClickListener == null && this.originalDrawerItems == null && this.originalDrawerSelection == -1) ? false : true;
    }

    public void switchDrawerContent(OnDrawerItemClickListener onDrawerItemClickListener, ArrayList<IDrawerItem> drawerItems, int drawerSelection) {
        if (!switchedDrawerContent()) {
            this.originalOnDrawerItemClickListener = getOnDrawerItemClickListener();
            this.originalDrawerItems = getDrawerItems();
            this.originalDrawerSelection = getCurrentSelection();
            setOnDrawerItemClickListener(onDrawerItemClickListener);
            setItems(drawerItems, true);
            setSelection(drawerSelection, false);
            this.mDrawerBuilder.mAdapter.resetAnimation();
            if (getStickyFooter() != null) {
                getStickyFooter().setVisibility(8);
            }
        }
    }

    public void resetDrawerContent() {
        if (switchedDrawerContent()) {
            setOnDrawerItemClickListener(this.originalOnDrawerItemClickListener);
            setItems(this.originalDrawerItems, true);
            setSelection(this.originalDrawerSelection, false);
            this.originalOnDrawerItemClickListener = null;
            this.originalDrawerItems = null;
            this.originalDrawerSelection = -1;
            this.mDrawerBuilder.mAdapter.resetAnimation();
            if (getStickyFooter() != null) {
                getStickyFooter().setVisibility(0);
            }
        }
    }

    public Bundle saveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            savedInstanceState.putInt(BUNDLE_SELECTION, this.mDrawerBuilder.mCurrentSelection);
            savedInstanceState.putInt(BUNDLE_FOOTER_SELECTION, this.mDrawerBuilder.mCurrentFooterSelection);
        }
        return savedInstanceState;
    }
}
