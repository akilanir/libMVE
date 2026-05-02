package com.mikepenz.materialdrawer;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.holder.ImageHolder;
import com.mikepenz.materialdrawer.holder.StringHolder;
import com.mikepenz.materialdrawer.model.ContainerDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Badgeable;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Iconable;
import com.mikepenz.materialdrawer.model.interfaces.Nameable;
import com.mikepenz.materialdrawer.util.IdDistributor;
import com.mikepenz.materialdrawer.util.KeyboardUtil;
import com.mikepenz.materialize.Materialize;
import com.mikepenz.materialize.view.IScrimInsetsLayout;
import java.util.ArrayList;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer.class */
public class Drawer {
    protected static final String BUNDLE_SELECTION = "bundle_selection";
    protected static final String BUNDLE_SELECTION_APPENDED = "bundle_selection_appended";
    protected static final String BUNDLE_STICKY_FOOTER_SELECTION = "bundle_sticky_footer_selection";
    protected static final String BUNDLE_STICKY_FOOTER_SELECTION_APPENDED = "bundle_sticky_footer_selection_appended";
    protected static final String BUNDLE_DRAWER_CONTENT_SWITCHED = "bundle_drawer_content_switched";
    protected static final String BUNDLE_DRAWER_CONTENT_SWITCHED_APPENDED = "bundle_drawer_content_switched_appended";
    protected static final String PREF_USER_LEARNED_DRAWER = "navigation_drawer_learned";
    protected final DrawerBuilder mDrawerBuilder;
    private FrameLayout mContentView;
    private OnDrawerItemClickListener originalOnDrawerItemClickListener;
    private ArrayList<IDrawerItem> originalDrawerItems;
    private KeyboardUtil mKeyboardUtil = null;
    private int originalDrawerSelection = -1;

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener.class */
    public interface OnDrawerItemClickListener {
        boolean onItemClick(View view, int i, IDrawerItem iDrawerItem);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener.class */
    public interface OnDrawerItemLongClickListener {
        boolean onItemLongClick(View view, int i, IDrawerItem iDrawerItem);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener.class */
    public interface OnDrawerItemSelectedListener {
        void onItemSelected(AdapterView<?> adapterView, View view, int i, long j, IDrawerItem iDrawerItem);

        void onNothingSelected(AdapterView<?> adapterView);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerListener.class */
    public interface OnDrawerListener {
        void onDrawerOpened(View view);

        void onDrawerClosed(View view);

        void onDrawerSlide(View view, float f);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener.class */
    public interface OnDrawerNavigationListener {
        boolean onNavigationClickListener(View view);
    }

    protected Drawer(DrawerBuilder drawerBuilder) {
        this.mDrawerBuilder = drawerBuilder;
    }

    public DrawerLayout getDrawerLayout() {
        return this.mDrawerBuilder.mDrawerLayout;
    }

    public void setToolbar(@NonNull Activity activity, @NonNull Toolbar toolbar) {
        setToolbar(activity, toolbar, false);
    }

    public void setToolbar(@NonNull Activity activity, @NonNull Toolbar toolbar, boolean recreateActionBarDrawerToggle) {
        this.mDrawerBuilder.mToolbar = toolbar;
        this.mDrawerBuilder.handleDrawerNavigation(activity, recreateActionBarDrawerToggle);
    }

    public void setActionBarDrawerToggle(@NonNull ActionBarDrawerToggle actionBarDrawerToggle) {
        this.mDrawerBuilder.mActionBarDrawerToggleEnabled = true;
        this.mDrawerBuilder.mActionBarDrawerToggle = actionBarDrawerToggle;
        this.mDrawerBuilder.handleDrawerNavigation(null, false);
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
        if (this.mDrawerBuilder.mMaterialize != null) {
            this.mDrawerBuilder.mMaterialize.setFullscreen(fullscreen);
        }
    }

    public void setStatusBarColor(@ColorInt int statusBarColor) {
        if (this.mDrawerBuilder.mMaterialize != null) {
            this.mDrawerBuilder.mMaterialize.setStatusBarColor(statusBarColor);
            this.mDrawerBuilder.mMaterialize.getScrimInsetsFrameLayout().getView().invalidate();
        }
    }

    public IScrimInsetsLayout getScrimInsetsFrameLayout() {
        if (this.mDrawerBuilder.mMaterialize != null) {
            return this.mDrawerBuilder.mMaterialize.getScrimInsetsFrameLayout();
        }
        return null;
    }

    public Materialize getMaterialize() {
        return this.mDrawerBuilder.mMaterialize;
    }

    public void keyboardSupportEnabled(@NonNull Activity activity, boolean enable) {
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

    public RecyclerView getRecyclerView() {
        return this.mDrawerBuilder.mRecyclerView;
    }

    public BaseDrawerAdapter getAdapter() {
        return this.mDrawerBuilder.mAdapter;
    }

    public ArrayList<IDrawerItem> getDrawerItems() {
        return this.mDrawerBuilder.getAdapter().getDrawerItems();
    }

    public View getHeader() {
        return this.mDrawerBuilder.mHeaderView;
    }

    public View getStickyHeader() {
        return this.mDrawerBuilder.mStickyHeaderView;
    }

    public void setHeader(@NonNull View view) {
        setHeader(view, true);
    }

    public void setHeader(@NonNull View view, boolean divider) {
        getAdapter().clearHeaderItems();
        if (divider) {
            getAdapter().addHeaderDrawerItems(new ContainerDrawerItem().withView(view).withViewPosition(ContainerDrawerItem.Position.TOP));
        } else {
            getAdapter().addHeaderDrawerItems(new ContainerDrawerItem().withView(view).withViewPosition(ContainerDrawerItem.Position.NONE));
        }
    }

    public void removeHeader() {
        getAdapter().clearHeaderItems();
    }

    public View getFooter() {
        return this.mDrawerBuilder.mFooterView;
    }

    public View getStickyFooter() {
        return this.mDrawerBuilder.mStickyFooterView;
    }

    private View getStickyFooterShadow() {
        return this.mDrawerBuilder.mStickyFooterShadowView;
    }

    public ActionBarDrawerToggle getActionBarDrawerToggle() {
        return this.mDrawerBuilder.mActionBarDrawerToggle;
    }

    public int getPosition(@NonNull IDrawerItem drawerItem) {
        return getPosition(drawerItem.getIdentifier());
    }

    public int getPosition(int identifier) {
        return DrawerUtils.getPositionByIdentifier(this.mDrawerBuilder, identifier);
    }

    public IDrawerItem getDrawerItem(int identifier) {
        return getAdapter().getItem(getPosition(identifier));
    }

    public int getStickyFooterPosition(@NonNull IDrawerItem drawerItem) {
        return getStickyFooterPosition(drawerItem.getIdentifier());
    }

    public int getStickyFooterPosition(int identifier) {
        return DrawerUtils.getStickyFooterPositionByIdentifier(this.mDrawerBuilder, identifier);
    }

    public int getCurrentSelectedPosition() {
        return this.mDrawerBuilder.mCurrentSelection;
    }

    public int getCurrentSelection() {
        IDrawerItem drawerItem = this.mDrawerBuilder.getDrawerItem(this.mDrawerBuilder.mCurrentSelection);
        if (drawerItem != null) {
            return drawerItem.getIdentifier();
        }
        return -1;
    }

    public int getCurrentStickyFooterSelectedPosition() {
        return this.mDrawerBuilder.mCurrentStickyFooterSelection;
    }

    public boolean setSelection(int identifier) {
        return setSelectionAtPosition(getPosition(identifier), true);
    }

    public boolean setSelection(int identifier, boolean fireOnClick) {
        return setSelectionAtPosition(getPosition(identifier), fireOnClick);
    }

    public void setStickyFooterSelection(int identifier, boolean fireOnClick) {
        setStickyFooterSelectionAtPosition(getPosition(identifier), fireOnClick);
    }

    public boolean setSelection(@NonNull IDrawerItem drawerItem) {
        return setSelectionAtPosition(getPosition(drawerItem), true);
    }

    public boolean setSelection(@NonNull IDrawerItem drawerItem, boolean fireOnClick) {
        return setSelectionAtPosition(getPosition(drawerItem), fireOnClick);
    }

    public boolean setSelectionAtPosition(int position) {
        return setSelectionAtPosition(position, true);
    }

    public boolean setSelectionAtPosition(int position, boolean fireOnClick) {
        if (this.mDrawerBuilder.mRecyclerView != null) {
            return DrawerUtils.setRecyclerViewSelection(this.mDrawerBuilder, position, fireOnClick, this.mDrawerBuilder.getDrawerItem(position));
        }
        return false;
    }

    public void setStickyFooterSelectionAtPosition(int position) {
        setStickyFooterSelectionAtPosition(position, true);
    }

    public void setStickyFooterSelectionAtPosition(int position, boolean fireOnClick) {
        DrawerUtils.setStickyFooterSelection(this.mDrawerBuilder, position, Boolean.valueOf(fireOnClick));
    }

    public void updateItem(@NonNull IDrawerItem drawerItem) {
        updateItemAtPosition(drawerItem, getPosition(drawerItem));
    }

    public void updateBadge(int identifier, StringHolder badge) {
        IDrawerItem drawerItem = getDrawerItem(identifier);
        if (drawerItem instanceof Badgeable) {
            Badgeable badgeable = (Badgeable) drawerItem;
            badgeable.withBadge(badge);
            updateItem((IDrawerItem) badgeable);
        }
    }

    public void updateName(int identifier, StringHolder name) {
        IDrawerItem drawerItem = getDrawerItem(identifier);
        if (drawerItem instanceof Nameable) {
            Nameable pdi = (Nameable) drawerItem;
            pdi.withName(name);
            updateItem((IDrawerItem) pdi);
        }
    }

    public void updateIcon(int identifier, ImageHolder image) {
        IDrawerItem drawerItem = getDrawerItem(identifier);
        if (drawerItem instanceof Iconable) {
            Iconable pdi = (Iconable) drawerItem;
            pdi.withIcon(image);
            updateItem((IDrawerItem) pdi);
        }
    }

    public void updateItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            this.mDrawerBuilder.getAdapter().setDrawerItem(position, drawerItem);
        }
    }

    public void addItem(@NonNull IDrawerItem drawerItem) {
        this.mDrawerBuilder.getAdapter().addDrawerItem((IDrawerItem) IdDistributor.checkId(drawerItem));
    }

    public void addItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        this.mDrawerBuilder.getAdapter().addDrawerItem(position, (IDrawerItem) IdDistributor.checkId(drawerItem));
    }

    public void setItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        this.mDrawerBuilder.getAdapter().addDrawerItem(position, (IDrawerItem) IdDistributor.checkId(drawerItem));
    }

    public void removeItemByPosition(int position) {
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            this.mDrawerBuilder.getAdapter().removeDrawerItem(position);
        }
    }

    public void removeItem(int identifier) {
        int position = getPosition(identifier);
        if (this.mDrawerBuilder.checkDrawerItem(position, false)) {
            this.mDrawerBuilder.getAdapter().removeDrawerItem(position);
        }
    }

    public void removeAllItems() {
        this.mDrawerBuilder.getAdapter().clearDrawerItems();
    }

    public void addItems(@NonNull IDrawerItem... drawerItems) {
        this.mDrawerBuilder.getAdapter().addDrawerItems((IDrawerItem[]) IdDistributor.checkIds(drawerItems));
    }

    public void setItems(@NonNull ArrayList<IDrawerItem> drawerItems) {
        setItems(IdDistributor.checkIds(drawerItems), false);
    }

    private void setItems(@NonNull ArrayList<IDrawerItem> drawerItems, boolean switchedItems) {
        if (this.originalDrawerItems != null && !switchedItems) {
            this.originalDrawerItems = drawerItems;
        } else {
            this.mDrawerBuilder.getAdapter().setDrawerItems(drawerItems);
        }
        this.mDrawerBuilder.mAdapter.notifyDataSetChanged();
    }

    public void updateStickyFooterItem(@NonNull IDrawerItem drawerItem) {
        updateStickyFooterItemAtPosition(drawerItem, getStickyFooterPosition(drawerItem));
    }

    public void updateStickyFooterItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.set(position, drawerItem);
        }
        DrawerUtils.rebuildStickyFooterView(this.mDrawerBuilder);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void addStickyFooterItem(@NonNull IDrawerItem drawerItem) {
        if (this.mDrawerBuilder.mStickyDrawerItems == null) {
            this.mDrawerBuilder.mStickyDrawerItems = new ArrayList<>();
        }
        this.mDrawerBuilder.mStickyDrawerItems.add(IdDistributor.checkId(drawerItem));
        DrawerUtils.rebuildStickyFooterView(this.mDrawerBuilder);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void addStickyFooterItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems == null) {
            this.mDrawerBuilder.mStickyDrawerItems = new ArrayList<>();
        }
        this.mDrawerBuilder.mStickyDrawerItems.add(position, IdDistributor.checkId(drawerItem));
        DrawerUtils.rebuildStickyFooterView(this.mDrawerBuilder);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void setStickyFooterItemAtPosition(@NonNull IDrawerItem drawerItem, int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.set(position, IdDistributor.checkId(drawerItem));
        }
        DrawerUtils.rebuildStickyFooterView(this.mDrawerBuilder);
    }

    public void removeStickyFooterItemAtPosition(int position) {
        if (this.mDrawerBuilder.mStickyDrawerItems != null && this.mDrawerBuilder.mStickyDrawerItems.size() > position) {
            this.mDrawerBuilder.mStickyDrawerItems.remove(position);
        }
        DrawerUtils.rebuildStickyFooterView(this.mDrawerBuilder);
    }

    public void removeAllStickyFooterItems() {
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

    public ArrayList<IDrawerItem> getOriginalDrawerItems() {
        return this.originalDrawerItems;
    }

    public void switchDrawerContent(@NonNull OnDrawerItemClickListener onDrawerItemClickListener, @NonNull ArrayList<IDrawerItem> drawerItems, int drawerSelection) {
        if (!switchedDrawerContent()) {
            this.originalOnDrawerItemClickListener = getOnDrawerItemClickListener();
            this.originalDrawerItems = getDrawerItems();
            this.originalDrawerSelection = getCurrentSelectedPosition();
            setOnDrawerItemClickListener(onDrawerItemClickListener);
            setItems(drawerItems, true);
            setSelectionAtPosition(drawerSelection, false);
            if (getStickyFooter() != null) {
                getStickyFooter().setVisibility(8);
            }
            if (getStickyFooterShadow() != null) {
                getStickyFooterShadow().setVisibility(8);
            }
        }
    }

    public void resetDrawerContent() {
        if (switchedDrawerContent()) {
            setOnDrawerItemClickListener(this.originalOnDrawerItemClickListener);
            setItems(this.originalDrawerItems, true);
            setSelectionAtPosition(this.originalDrawerSelection, false);
            this.originalOnDrawerItemClickListener = null;
            this.originalDrawerItems = null;
            this.originalDrawerSelection = -1;
            this.mDrawerBuilder.mRecyclerView.smoothScrollToPosition(0);
            if (getStickyFooter() != null) {
                getStickyFooter().setVisibility(0);
            }
            if (getStickyFooterShadow() != null) {
                getStickyFooterShadow().setVisibility(0);
            }
            if (this.mDrawerBuilder.mAccountHeader != null && this.mDrawerBuilder.mAccountHeader.mAccountHeaderBuilder != null) {
                this.mDrawerBuilder.mAccountHeader.mAccountHeaderBuilder.mSelectionListShown = false;
            }
        }
    }

    public Bundle saveInstanceState(Bundle savedInstanceState) {
        if (savedInstanceState != null) {
            if (!this.mDrawerBuilder.mAppended) {
                savedInstanceState.putInt(BUNDLE_SELECTION, switchedDrawerContent() ? this.originalDrawerSelection : this.mDrawerBuilder.mCurrentSelection);
                savedInstanceState.putInt(BUNDLE_STICKY_FOOTER_SELECTION, this.mDrawerBuilder.mCurrentStickyFooterSelection);
                savedInstanceState.putBoolean(BUNDLE_DRAWER_CONTENT_SWITCHED, switchedDrawerContent());
            } else {
                savedInstanceState.putInt(BUNDLE_SELECTION_APPENDED, switchedDrawerContent() ? this.originalDrawerSelection : this.mDrawerBuilder.mCurrentSelection);
                savedInstanceState.putInt(BUNDLE_STICKY_FOOTER_SELECTION_APPENDED, this.mDrawerBuilder.mCurrentStickyFooterSelection);
                savedInstanceState.putBoolean(BUNDLE_DRAWER_CONTENT_SWITCHED_APPENDED, switchedDrawerContent());
            }
        }
        return savedInstanceState;
    }
}
