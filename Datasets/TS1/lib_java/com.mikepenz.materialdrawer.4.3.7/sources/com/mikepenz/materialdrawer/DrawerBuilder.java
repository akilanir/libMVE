package com.mikepenz.materialdrawer;

import android.R;
import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.MenuRes;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.internal.view.SupportMenuInflater;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.widget.DefaultItemAnimator;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.mikepenz.iconics.utils.Utils;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.adapter.DrawerAdapter;
import com.mikepenz.materialdrawer.model.DividerDrawerItem;
import com.mikepenz.materialdrawer.model.PrimaryDrawerItem;
import com.mikepenz.materialdrawer.model.SecondaryDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.model.interfaces.Selectable;
import com.mikepenz.materialdrawer.util.IdDistributor;
import com.mikepenz.materialdrawer.util.RecyclerViewCacheUtil;
import com.mikepenz.materialize.Materialize;
import com.mikepenz.materialize.MaterializeBuilder;
import com.mikepenz.materialize.util.UIUtils;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/DrawerBuilder.class */
public class DrawerBuilder {
    protected Activity mActivity;
    protected RecyclerView.LayoutManager mLayoutManager;
    protected ViewGroup mRootView;
    protected Materialize mMaterialize;
    protected Boolean mDisplayBelowStatusBar;
    protected Toolbar mToolbar;
    protected View mCustomView;
    protected DrawerLayout mDrawerLayout;
    protected RelativeLayout mSliderLayout;
    protected AccountHeader mAccountHeader;
    protected ActionBarDrawerToggle mActionBarDrawerToggle;
    protected View mHeaderView;
    protected View mStickyHeaderView;
    protected View mFooterView;
    protected ViewGroup mStickyFooterView;
    protected View mStickyFooterShadowView;
    protected RecyclerView mRecyclerView;
    protected BaseDrawerAdapter mAdapter;
    protected RecyclerView.Adapter mAdapterWrapper;
    protected Drawer.OnDrawerListener mOnDrawerListener;
    protected Drawer.OnDrawerItemClickListener mOnDrawerItemClickListener;
    protected Drawer.OnDrawerItemLongClickListener mOnDrawerItemLongClickListener;
    protected Drawer.OnDrawerNavigationListener mOnDrawerNavigationListener;
    protected Bundle mSavedInstance;
    protected boolean mUsed = false;
    protected int mCurrentSelection = -1;
    protected int mCurrentStickyFooterSelection = -1;
    protected boolean mAppended = false;
    protected boolean mTranslucentStatusBar = true;
    protected boolean mTranslucentStatusBarProgrammatically = true;
    protected Boolean mTranslucentStatusBarShadow = null;
    private boolean mInnerShadow = false;
    protected boolean mTranslucentNavigationBar = false;
    protected boolean mTranslucentNavigationBarProgrammatically = false;
    protected boolean mFullscreen = false;
    protected boolean mSystemUIHidden = false;
    protected int mStatusBarColor = 0;
    protected int mStatusBarColorRes = -1;
    protected int mSliderBackgroundColor = 0;
    protected int mSliderBackgroundColorRes = -1;
    protected Drawable mSliderBackgroundDrawable = null;
    protected int mSliderBackgroundDrawableRes = -1;
    protected int mDrawerWidth = -1;
    protected Integer mDrawerGravity = 8388611;
    protected boolean mAccountHeaderSticky = false;
    protected boolean mAnimateActionBarDrawerToggle = false;
    protected boolean mActionBarDrawerToggleEnabled = true;
    protected boolean mScrollToTopAfterClick = false;
    protected boolean mHeaderDivider = true;
    protected boolean mHeaderClickable = false;
    protected boolean mFooterDivider = true;
    protected boolean mFooterClickable = false;
    protected boolean mStickyFooterDivider = false;
    protected boolean mStickyFooterShadow = true;
    protected boolean mFireInitialOnClick = false;
    protected int mSelectedItemPosition = 0;
    protected int mSelectedItemIdentifier = 0;
    protected boolean mHasStableIds = false;
    protected RecyclerView.ItemAnimator mItemAnimator = null;
    protected ArrayList<IDrawerItem> mStickyDrawerItems = new ArrayList<>();
    protected boolean mCloseOnClick = true;
    protected int mDelayOnDrawerClose = 50;
    protected boolean mShowDrawerOnFirstLaunch = false;

    public DrawerBuilder() {
        RecyclerViewCacheUtil.getInstance().clear();
    }

    public DrawerBuilder(@NonNull Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
        this.mLayoutManager = new LinearLayoutManager(this.mActivity);
    }

    public DrawerBuilder withActivity(@NonNull Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
        this.mLayoutManager = new LinearLayoutManager(this.mActivity);
        return this;
    }

    public DrawerBuilder withRootView(@NonNull ViewGroup rootView) {
        this.mRootView = rootView;
        withTranslucentStatusBar(false);
        return this;
    }

    public DrawerBuilder withRootView(@IdRes int rootViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        return withRootView((ViewGroup) this.mActivity.findViewById(rootViewRes));
    }

    public DrawerBuilder withTranslucentStatusBar(boolean translucentStatusBar) {
        this.mTranslucentStatusBar = translucentStatusBar;
        if (!translucentStatusBar) {
            this.mTranslucentStatusBarProgrammatically = false;
        }
        return this;
    }

    public DrawerBuilder withDisplayBelowStatusBar(boolean displayBelowStatusBar) {
        this.mDisplayBelowStatusBar = Boolean.valueOf(displayBelowStatusBar);
        return this;
    }

    public DrawerBuilder withTranslucentStatusBarProgrammatically(boolean translucentStatusBarProgrammatically) {
        this.mTranslucentStatusBarProgrammatically = translucentStatusBarProgrammatically;
        if (translucentStatusBarProgrammatically) {
            this.mTranslucentStatusBar = true;
        }
        return this;
    }

    public DrawerBuilder withTranslucentStatusBarShadow(Boolean translucentStatusBarShadow) {
        this.mTranslucentStatusBarShadow = translucentStatusBarShadow;
        return this;
    }

    public DrawerBuilder withInnerShadow(boolean innerShadow) {
        this.mInnerShadow = innerShadow;
        return this;
    }

    public DrawerBuilder withToolbar(@NonNull Toolbar toolbar) {
        this.mToolbar = toolbar;
        return this;
    }

    public DrawerBuilder withTranslucentNavigationBar(boolean translucentNavigationBar) {
        this.mTranslucentNavigationBar = translucentNavigationBar;
        if (!translucentNavigationBar) {
            this.mTranslucentNavigationBarProgrammatically = false;
        }
        return this;
    }

    public DrawerBuilder withTranslucentNavigationBarProgrammatically(boolean translucentNavigationBarProgrammatically) {
        this.mTranslucentNavigationBarProgrammatically = translucentNavigationBarProgrammatically;
        if (translucentNavigationBarProgrammatically) {
            this.mTranslucentNavigationBar = true;
        }
        return this;
    }

    public DrawerBuilder withFullscreen(boolean fullscreen) {
        this.mFullscreen = fullscreen;
        if (fullscreen) {
            withTranslucentStatusBar(false);
            withTranslucentNavigationBar(false);
        }
        return this;
    }

    public DrawerBuilder withSystemUIHidden(boolean systemUIHidden) {
        this.mSystemUIHidden = systemUIHidden;
        if (systemUIHidden) {
            withFullscreen(systemUIHidden);
        }
        return this;
    }

    public DrawerBuilder withCustomView(@NonNull View customView) {
        this.mCustomView = customView;
        return this;
    }

    public DrawerBuilder withDrawerLayout(@NonNull DrawerLayout drawerLayout) {
        this.mDrawerLayout = drawerLayout;
        return this;
    }

    public DrawerBuilder withDrawerLayout(@LayoutRes int resLayout) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (resLayout != -1) {
            this.mDrawerLayout = this.mActivity.getLayoutInflater().inflate(resLayout, this.mRootView, false);
        } else {
            this.mDrawerLayout = this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer, this.mRootView, false);
        }
        return this;
    }

    public DrawerBuilder withStatusBarColor(@ColorInt int statusBarColor) {
        this.mStatusBarColor = statusBarColor;
        return this;
    }

    public DrawerBuilder withStatusBarColorRes(@ColorRes int statusBarColorRes) {
        this.mStatusBarColorRes = statusBarColorRes;
        return this;
    }

    public DrawerBuilder withSliderBackgroundColor(@ColorInt int sliderBackgroundColor) {
        this.mSliderBackgroundColor = sliderBackgroundColor;
        return this;
    }

    public DrawerBuilder withSliderBackgroundColorRes(@ColorRes int sliderBackgroundColorRes) {
        this.mSliderBackgroundColorRes = sliderBackgroundColorRes;
        return this;
    }

    public DrawerBuilder withSliderBackgroundDrawable(@NonNull Drawable sliderBackgroundDrawable) {
        this.mSliderBackgroundDrawable = sliderBackgroundDrawable;
        return this;
    }

    public DrawerBuilder withSliderBackgroundDrawableRes(@DrawableRes int sliderBackgroundDrawableRes) {
        this.mSliderBackgroundDrawableRes = sliderBackgroundDrawableRes;
        return this;
    }

    public DrawerBuilder withDrawerWidthPx(int drawerWidthPx) {
        this.mDrawerWidth = drawerWidthPx;
        return this;
    }

    public DrawerBuilder withDrawerWidthDp(int drawerWidthDp) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        this.mDrawerWidth = Utils.convertDpToPx(this.mActivity, drawerWidthDp);
        return this;
    }

    public DrawerBuilder withDrawerWidthRes(@DimenRes int drawerWidthRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        this.mDrawerWidth = this.mActivity.getResources().getDimensionPixelSize(drawerWidthRes);
        return this;
    }

    public DrawerBuilder withDrawerGravity(int gravity) {
        this.mDrawerGravity = Integer.valueOf(gravity);
        return this;
    }

    public DrawerBuilder withAccountHeader(@NonNull AccountHeader accountHeader) {
        return withAccountHeader(accountHeader, false);
    }

    public DrawerBuilder withAccountHeader(@NonNull AccountHeader accountHeader, boolean accountHeaderSticky) {
        this.mAccountHeader = accountHeader;
        this.mAccountHeaderSticky = accountHeaderSticky;
        return this;
    }

    public DrawerBuilder withActionBarDrawerToggleAnimated(boolean actionBarDrawerToggleAnimated) {
        this.mAnimateActionBarDrawerToggle = actionBarDrawerToggleAnimated;
        return this;
    }

    public DrawerBuilder withActionBarDrawerToggle(boolean actionBarDrawerToggleEnabled) {
        this.mActionBarDrawerToggleEnabled = actionBarDrawerToggleEnabled;
        return this;
    }

    public DrawerBuilder withActionBarDrawerToggle(@NonNull ActionBarDrawerToggle actionBarDrawerToggle) {
        this.mActionBarDrawerToggleEnabled = true;
        this.mActionBarDrawerToggle = actionBarDrawerToggle;
        return this;
    }

    public DrawerBuilder withScrollToTopAfterClick(boolean scrollToTopAfterClick) {
        this.mScrollToTopAfterClick = scrollToTopAfterClick;
        return this;
    }

    public DrawerBuilder withHeader(@NonNull View headerView) {
        this.mHeaderView = headerView;
        return this;
    }

    public DrawerBuilder withHeader(@LayoutRes int headerViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (headerViewRes != -1) {
            this.mHeaderView = this.mActivity.getLayoutInflater().inflate(headerViewRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withHeaderClickable(boolean headerClickable) {
        this.mHeaderClickable = headerClickable;
        return this;
    }

    public DrawerBuilder withHeaderDivider(boolean headerDivider) {
        this.mHeaderDivider = headerDivider;
        return this;
    }

    public DrawerBuilder withStickyHeader(@NonNull View stickyHeader) {
        this.mStickyHeaderView = stickyHeader;
        return this;
    }

    public DrawerBuilder withStickyHeader(@LayoutRes int stickyHeaderRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (stickyHeaderRes != -1) {
            this.mStickyHeaderView = this.mActivity.getLayoutInflater().inflate(stickyHeaderRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withFooter(@NonNull View footerView) {
        this.mFooterView = footerView;
        return this;
    }

    public DrawerBuilder withFooter(@LayoutRes int footerViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (footerViewRes != -1) {
            this.mFooterView = this.mActivity.getLayoutInflater().inflate(footerViewRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withFooterClickable(boolean footerClickable) {
        this.mFooterClickable = footerClickable;
        return this;
    }

    public DrawerBuilder withFooterDivider(boolean footerDivider) {
        this.mFooterDivider = footerDivider;
        return this;
    }

    public DrawerBuilder withStickyFooter(@NonNull ViewGroup stickyFooter) {
        this.mStickyFooterView = stickyFooter;
        return this;
    }

    public DrawerBuilder withStickyFooter(@LayoutRes int stickyFooterRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (stickyFooterRes != -1) {
            this.mStickyFooterView = (ViewGroup) this.mActivity.getLayoutInflater().inflate(stickyFooterRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withStickyFooterDivider(boolean stickyFooterDivider) {
        this.mStickyFooterDivider = stickyFooterDivider;
        return this;
    }

    public DrawerBuilder withStickyFooterShadow(boolean stickyFooterShadow) {
        this.mStickyFooterShadow = stickyFooterShadow;
        return this;
    }

    public DrawerBuilder withFireOnInitialOnClick(boolean fireOnInitialOnClick) {
        this.mFireInitialOnClick = fireOnInitialOnClick;
        return this;
    }

    public DrawerBuilder withSelectedItemByPosition(int selectedItemPosition) {
        this.mSelectedItemPosition = selectedItemPosition;
        return this;
    }

    public DrawerBuilder withSelectedItem(int selectedItemIdentifier) {
        this.mSelectedItemIdentifier = selectedItemIdentifier;
        return this;
    }

    public DrawerBuilder withRecyclerView(@NonNull RecyclerView recyclerView) {
        this.mRecyclerView = recyclerView;
        return this;
    }

    public DrawerBuilder withHasStableIds(boolean hasStableIds) {
        this.mHasStableIds = hasStableIds;
        return this;
    }

    public DrawerBuilder withAdapter(@NonNull BaseDrawerAdapter adapter) {
        if (this.mAdapter != null) {
            throw new RuntimeException("the adapter was already set or items were added to it. A header is also a RecyclerItem");
        }
        this.mAdapter = adapter;
        return this;
    }

    protected BaseDrawerAdapter getAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = new DrawerAdapter();
            this.mAdapter.setHasStableIds(this.mHasStableIds);
        }
        return this.mAdapter;
    }

    public DrawerBuilder withAdapterWrapper(@NonNull RecyclerView.Adapter adapterWrapper) {
        if (this.mAdapter == null) {
            throw new RuntimeException("this adapter has to be set in conjunction to a normal adapter which is used inside this wrapper adapter");
        }
        this.mAdapterWrapper = adapterWrapper;
        return this;
    }

    public DrawerBuilder withItemAnimator(@NonNull RecyclerView.ItemAnimator itemAnimator) {
        this.mItemAnimator = itemAnimator;
        return this;
    }

    public DrawerBuilder withDrawerItems(@NonNull ArrayList<IDrawerItem> drawerItems) {
        getAdapter().setDrawerItems(IdDistributor.checkIds(drawerItems));
        return this;
    }

    public DrawerBuilder addDrawerItems(@NonNull IDrawerItem... drawerItems) {
        getAdapter().addDrawerItems((IDrawerItem[]) IdDistributor.checkIds(drawerItems));
        return this;
    }

    public DrawerBuilder withStickyDrawerItems(@NonNull ArrayList<IDrawerItem> stickyDrawerItems) {
        this.mStickyDrawerItems = IdDistributor.checkIds(stickyDrawerItems);
        return this;
    }

    public DrawerBuilder addStickyDrawerItems(@NonNull IDrawerItem... stickyDrawerItems) {
        if (this.mStickyDrawerItems == null) {
            this.mStickyDrawerItems = new ArrayList<>();
        }
        Collections.addAll(this.mStickyDrawerItems, IdDistributor.checkIds(stickyDrawerItems));
        return this;
    }

    public DrawerBuilder inflateMenu(@MenuRes int menuRes) {
        SupportMenuInflater supportMenuInflater = new SupportMenuInflater(this.mActivity);
        MenuBuilder mMenu = new MenuBuilder(this.mActivity);
        supportMenuInflater.inflate(menuRes, mMenu);
        addMenuItems(mMenu, false);
        return this;
    }

    private void addMenuItems(Menu mMenu, boolean subMenu) {
        int groupId = R.id.material_drawer_menu_default_group;
        for (int i = 0; i < mMenu.size(); i++) {
            MenuItem mMenuItem = mMenu.getItem(i);
            if (!subMenu && mMenuItem.getGroupId() != groupId && mMenuItem.getGroupId() != 0) {
                groupId = mMenuItem.getGroupId();
                IDrawerItem iDrawerItem = new DividerDrawerItem();
                getAdapter().addDrawerItems(iDrawerItem);
            }
            if (mMenuItem.hasSubMenu()) {
                IDrawerItem iDrawerItem2 = new PrimaryDrawerItem().withName(mMenuItem.getTitle().toString()).withIcon(mMenuItem.getIcon()).withIdentifier(mMenuItem.getItemId()).withEnabled(mMenuItem.isEnabled()).withSelectable(false);
                getAdapter().addDrawerItems(iDrawerItem2);
                addMenuItems(mMenuItem.getSubMenu(), true);
            } else if (mMenuItem.getGroupId() != 0 || subMenu) {
                IDrawerItem iDrawerItem3 = new SecondaryDrawerItem().withName(mMenuItem.getTitle().toString()).withIcon(mMenuItem.getIcon()).withIdentifier(mMenuItem.getItemId()).withEnabled(mMenuItem.isEnabled());
                getAdapter().addDrawerItems(iDrawerItem3);
            } else {
                IDrawerItem iDrawerItem4 = new PrimaryDrawerItem().withName(mMenuItem.getTitle().toString()).withIcon(mMenuItem.getIcon()).withIdentifier(mMenuItem.getItemId()).withEnabled(mMenuItem.isEnabled());
                getAdapter().addDrawerItems(iDrawerItem4);
            }
        }
    }

    public DrawerBuilder withCloseOnClick(boolean closeOnClick) {
        this.mCloseOnClick = closeOnClick;
        return this;
    }

    public DrawerBuilder withDelayOnDrawerClose(int delayOnDrawerClose) {
        this.mDelayOnDrawerClose = delayOnDrawerClose;
        return this;
    }

    public DrawerBuilder withOnDrawerListener(@NonNull Drawer.OnDrawerListener onDrawerListener) {
        this.mOnDrawerListener = onDrawerListener;
        return this;
    }

    public DrawerBuilder withOnDrawerItemClickListener(@NonNull Drawer.OnDrawerItemClickListener onDrawerItemClickListener) {
        this.mOnDrawerItemClickListener = onDrawerItemClickListener;
        return this;
    }

    public DrawerBuilder withOnDrawerItemLongClickListener(@NonNull Drawer.OnDrawerItemLongClickListener onDrawerItemLongClickListener) {
        this.mOnDrawerItemLongClickListener = onDrawerItemLongClickListener;
        return this;
    }

    public DrawerBuilder withOnDrawerNavigationListener(@NonNull Drawer.OnDrawerNavigationListener onDrawerNavigationListener) {
        this.mOnDrawerNavigationListener = onDrawerNavigationListener;
        return this;
    }

    public DrawerBuilder withShowDrawerOnFirstLaunch(boolean showDrawerOnFirstLaunch) {
        this.mShowDrawerOnFirstLaunch = showDrawerOnFirstLaunch;
        return this;
    }

    public DrawerBuilder withSavedInstance(Bundle savedInstance) {
        this.mSavedInstance = savedInstance;
        return this;
    }

    private void handleShowOnFirstLaunch() {
        if (this.mActivity != null && this.mDrawerLayout != null && this.mShowDrawerOnFirstLaunch) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(this.mActivity);
            if (!preferences.getBoolean("navigation_drawer_learned", false)) {
                this.mDrawerLayout.openDrawer(this.mSliderLayout);
                SharedPreferences.Editor editor = preferences.edit();
                editor.putBoolean("navigation_drawer_learned", true);
                editor.apply();
            }
        }
    }

    public Drawer build() {
        if (this.mUsed) {
            throw new RuntimeException("you must not reuse a DrawerBuilder builder");
        }
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity");
        }
        this.mUsed = true;
        if (this.mDrawerLayout == null) {
            withDrawerLayout(-1);
        }
        this.mMaterialize = new MaterializeBuilder().withActivity(this.mActivity).withRootView(this.mRootView).withFullscreen(this.mFullscreen).withSystemUIHidden(this.mSystemUIHidden).withTranslucentStatusBar(this.mTranslucentStatusBar).withTranslucentStatusBarProgrammatically(this.mTranslucentStatusBarProgrammatically).withTranslucentNavigationBar(this.mTranslucentNavigationBar).withTranslucentNavigationBarProgrammatically(this.mTranslucentNavigationBarProgrammatically).withContainer(this.mDrawerLayout).withStatusBarColor(this.mStatusBarColor).withStatusBarColorRes(this.mStatusBarColorRes).build();
        handleDrawerNavigation(this.mActivity, false);
        Drawer result = buildView();
        this.mDrawerLayout.addView(this.mSliderLayout, 1);
        return result;
    }

    public Drawer buildForFragment() {
        if (this.mUsed) {
            throw new RuntimeException("you must not reuse a DrawerBuilder builder");
        }
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity");
        }
        if (this.mRootView == null) {
            throw new RuntimeException("please pass the view which should host the DrawerLayout");
        }
        this.mUsed = true;
        if (this.mDrawerLayout == null) {
            withDrawerLayout(-1);
        }
        View originalContentView = this.mRootView.getChildAt(0);
        boolean alreadyInflated = originalContentView.getId() == R.id.materialize_root;
        if (!alreadyInflated) {
            this.mRootView.removeView(originalContentView);
        } else {
            this.mRootView.removeAllViews();
        }
        FrameLayout.LayoutParams layoutParamsContentView = new FrameLayout.LayoutParams(-1, -1);
        this.mRootView.addView((View) this.mDrawerLayout, (ViewGroup.LayoutParams) layoutParamsContentView);
        this.mDrawerLayout.setId(R.id.materialize_root);
        handleDrawerNavigation(this.mActivity, false);
        Drawer result = buildView();
        this.mDrawerLayout.addView(originalContentView, 0);
        this.mDrawerLayout.addView(this.mSliderLayout, 1);
        return result;
    }

    protected void handleDrawerNavigation(Activity activity, boolean recreateActionBarDrawerToggle) {
        View.OnClickListener toolbarNavigationListener = new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                boolean handled = false;
                if (DrawerBuilder.this.mOnDrawerNavigationListener != null && DrawerBuilder.this.mActionBarDrawerToggle != null && !DrawerBuilder.this.mActionBarDrawerToggle.isDrawerIndicatorEnabled()) {
                    handled = DrawerBuilder.this.mOnDrawerNavigationListener.onNavigationClickListener(v);
                }
                if (!handled) {
                    if (DrawerBuilder.this.mDrawerLayout.isDrawerOpen(DrawerBuilder.this.mDrawerGravity.intValue())) {
                        DrawerBuilder.this.mDrawerLayout.closeDrawer(DrawerBuilder.this.mDrawerGravity.intValue());
                    } else {
                        DrawerBuilder.this.mDrawerLayout.openDrawer(DrawerBuilder.this.mDrawerGravity.intValue());
                    }
                }
            }
        };
        if (recreateActionBarDrawerToggle) {
            this.mActionBarDrawerToggle = null;
        }
        if (this.mActionBarDrawerToggleEnabled && this.mActionBarDrawerToggle == null && this.mToolbar != null) {
            this.mActionBarDrawerToggle = new ActionBarDrawerToggle(activity, this.mDrawerLayout, this.mToolbar, R.string.material_drawer_open, R.string.material_drawer_close) { // from class: com.mikepenz.materialdrawer.DrawerBuilder.2
                public void onDrawerOpened(View drawerView) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerOpened(drawerView);
                    }
                    super.onDrawerOpened(drawerView);
                }

                public void onDrawerClosed(View drawerView) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerClosed(drawerView);
                    }
                    super.onDrawerClosed(drawerView);
                }

                public void onDrawerSlide(View drawerView, float slideOffset) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerSlide(drawerView, slideOffset);
                    }
                    if (!DrawerBuilder.this.mAnimateActionBarDrawerToggle) {
                        super.onDrawerSlide(drawerView, 0.0f);
                    } else {
                        super.onDrawerSlide(drawerView, slideOffset);
                    }
                }
            };
            this.mActionBarDrawerToggle.syncState();
        }
        if (this.mToolbar != null) {
            this.mToolbar.setNavigationOnClickListener(toolbarNavigationListener);
        }
        if (this.mActionBarDrawerToggle != null) {
            this.mActionBarDrawerToggle.setToolbarNavigationClickListener(toolbarNavigationListener);
            this.mDrawerLayout.setDrawerListener(this.mActionBarDrawerToggle);
        } else {
            this.mDrawerLayout.setDrawerListener(new DrawerLayout.DrawerListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.3
                public void onDrawerSlide(View drawerView, float slideOffset) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerSlide(drawerView, slideOffset);
                    }
                }

                public void onDrawerOpened(View drawerView) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerOpened(drawerView);
                    }
                }

                public void onDrawerClosed(View drawerView) {
                    if (DrawerBuilder.this.mOnDrawerListener != null) {
                        DrawerBuilder.this.mOnDrawerListener.onDrawerClosed(drawerView);
                    }
                }

                public void onDrawerStateChanged(int newState) {
                }
            });
        }
    }

    public Drawer buildView() {
        this.mSliderLayout = (RelativeLayout) this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_slider, (ViewGroup) this.mDrawerLayout, false);
        this.mSliderLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
        DrawerLayout.LayoutParams params = this.mSliderLayout.getLayoutParams();
        if (params != null) {
            params.gravity = this.mDrawerGravity.intValue();
            this.mSliderLayout.setLayoutParams(DrawerUtils.processDrawerLayoutParams(this, params));
        }
        createContent();
        Drawer result = new Drawer(this);
        if (this.mAccountHeader != null) {
            this.mAccountHeader.setDrawer(result);
        }
        if (this.mSavedInstance != null && this.mSavedInstance.getBoolean("bundle_drawer_content_switched", false)) {
            this.mAccountHeader.toggleSelectionList(this.mActivity);
        }
        handleShowOnFirstLaunch();
        this.mActivity = null;
        return result;
    }

    public Drawer append(@NonNull Drawer result) {
        if (this.mUsed) {
            throw new RuntimeException("you must not reuse a DrawerBuilder builder");
        }
        if (this.mDrawerGravity == null) {
            throw new RuntimeException("please set the gravity for the drawer");
        }
        this.mUsed = true;
        this.mAppended = true;
        this.mDrawerLayout = result.getDrawerLayout();
        this.mSliderLayout = (RelativeLayout) this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_slider, (ViewGroup) this.mDrawerLayout, false);
        this.mSliderLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
        DrawerLayout.LayoutParams params = this.mSliderLayout.getLayoutParams();
        params.gravity = this.mDrawerGravity.intValue();
        this.mSliderLayout.setLayoutParams(DrawerUtils.processDrawerLayoutParams(this, params));
        this.mDrawerLayout.addView(this.mSliderLayout, 1);
        createContent();
        Drawer appendedResult = new Drawer(this);
        if (this.mSavedInstance != null && this.mSavedInstance.getBoolean("bundle_drawer_content_switched_appended", false)) {
            this.mAccountHeader.toggleSelectionList(this.mActivity);
        }
        this.mActivity = null;
        return appendedResult;
    }

    private void createContent() {
        if (this.mCustomView != null) {
            LinearLayout.LayoutParams contentParams = new LinearLayout.LayoutParams(-1, -1);
            contentParams.weight = 1.0f;
            this.mSliderLayout.addView(this.mCustomView, contentParams);
            return;
        }
        if (Build.VERSION.SDK_INT < 21 && this.mDrawerLayout != null) {
            if (this.mDrawerGravity.intValue() == 8388611) {
                this.mDrawerLayout.setDrawerShadow(R.drawable.material_drawer_shadow_right, this.mDrawerGravity.intValue());
            } else {
                this.mDrawerLayout.setDrawerShadow(R.drawable.material_drawer_shadow_left, this.mDrawerGravity.intValue());
            }
        }
        if (this.mRecyclerView == null) {
            this.mRecyclerView = LayoutInflater.from(this.mActivity).inflate(R.layout.material_drawer_recycler_view, (ViewGroup) this.mSliderLayout, false);
            if (this.mItemAnimator == null) {
                this.mRecyclerView.setItemAnimator(new DefaultItemAnimator());
            } else {
                this.mRecyclerView.setItemAnimator(this.mItemAnimator);
            }
            this.mRecyclerView.setFadingEdgeLength(0);
            this.mRecyclerView.setClipToPadding(false);
            this.mRecyclerView.setLayoutManager(this.mLayoutManager);
            int paddingTop = 0;
            if ((this.mTranslucentStatusBar || this.mFullscreen) && ((this.mDisplayBelowStatusBar == null || !this.mDisplayBelowStatusBar.booleanValue()) && !this.mSystemUIHidden)) {
                paddingTop = UIUtils.getStatusBarHeight(this.mActivity);
            }
            int paddingBottom = 0;
            if ((this.mTranslucentNavigationBar || this.mFullscreen) && Build.VERSION.SDK_INT >= 19 && !this.mSystemUIHidden) {
                paddingBottom = UIUtils.getNavigationBarHeight(this.mActivity);
            }
            this.mRecyclerView.setPadding(0, paddingTop, 0, paddingBottom);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -1);
        params.weight = 1.0f;
        this.mSliderLayout.addView((View) this.mRecyclerView, (ViewGroup.LayoutParams) params);
        View statusBarShadow = this.mSliderLayout.findViewById(R.id.material_drawer_shadow_top);
        RelativeLayout.LayoutParams shadowLayoutParams = (RelativeLayout.LayoutParams) statusBarShadow.getLayoutParams();
        shadowLayoutParams.height = UIUtils.getStatusBarHeight(this.mActivity, true);
        statusBarShadow.setLayoutParams(shadowLayoutParams);
        if (this.mInnerShadow) {
            View innerShadow = this.mSliderLayout.findViewById(R.id.material_drawer_inner_shadow);
            innerShadow.setVisibility(0);
            innerShadow.bringToFront();
            if (this.mDrawerGravity.intValue() == 8388611) {
                innerShadow.setBackgroundResource(R.drawable.material_drawer_shadow_left);
            } else {
                innerShadow.setBackgroundResource(R.drawable.material_drawer_shadow_right);
            }
        }
        if (this.mSliderBackgroundColor != 0) {
            this.mSliderLayout.setBackgroundColor(this.mSliderBackgroundColor);
        } else if (this.mSliderBackgroundColorRes != -1) {
            this.mSliderLayout.setBackgroundColor(ContextCompat.getColor(this.mActivity, this.mSliderBackgroundColorRes));
        } else if (this.mSliderBackgroundDrawable != null) {
            UIUtils.setBackground(this.mSliderLayout, this.mSliderBackgroundDrawable);
        } else if (this.mSliderBackgroundDrawableRes != -1) {
            UIUtils.setBackground(this.mSliderLayout, this.mSliderBackgroundColorRes);
        }
        if (this.mTranslucentStatusBar || (this.mTranslucentStatusBarShadow != null && this.mTranslucentStatusBarShadow.booleanValue())) {
            if (this.mTranslucentStatusBarShadow != null || Build.VERSION.SDK_INT >= 21) {
                statusBarShadow.bringToFront();
            } else {
                statusBarShadow.setVisibility(8);
            }
        } else {
            statusBarShadow.setVisibility(8);
        }
        if (this.mDisplayBelowStatusBar != null && this.mDisplayBelowStatusBar.booleanValue()) {
            statusBarShadow.setVisibility(8);
        }
        DrawerUtils.handleHeaderView(this);
        DrawerUtils.handleFooterView(this, new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                IDrawerItem drawerItem = (IDrawerItem) v.getTag();
                DrawerUtils.onFooterDrawerItemClick(DrawerBuilder.this, drawerItem, v, true);
            }
        });
        if (this.mAdapterWrapper == null) {
            this.mRecyclerView.setAdapter(getAdapter());
        } else {
            this.mRecyclerView.setAdapter(this.mAdapterWrapper);
        }
        if (this.mSelectedItemPosition == 0 && this.mSelectedItemIdentifier != 0) {
            this.mSelectedItemPosition = DrawerUtils.getPositionByIdentifier(this, this.mSelectedItemIdentifier);
        }
        if (this.mHeaderView != null && this.mSelectedItemPosition == 0) {
            this.mSelectedItemPosition = 1;
        }
        DrawerUtils.setRecyclerViewSelection(this, this.mSelectedItemPosition, false);
        this.mAdapter.setOnClickListener(new BaseDrawerAdapter.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.5
            @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter.OnClickListener
            public void onClick(View view, int position, IDrawerItem item) {
                if (item == null || !(item instanceof Selectable) || ((Selectable) item).isSelectable()) {
                    DrawerBuilder.this.resetStickyFooterSelection();
                    DrawerBuilder.this.mCurrentSelection = position;
                    DrawerBuilder.this.mCurrentStickyFooterSelection = -1;
                }
                boolean consumed = false;
                if (DrawerBuilder.this.mOnDrawerItemClickListener != null) {
                    consumed = DrawerBuilder.this.mOnDrawerItemClickListener.onItemClick(view, position, item);
                }
                if (!consumed) {
                    DrawerBuilder.this.closeDrawerDelayed();
                }
            }
        });
        this.mAdapter.setOnLongClickListener(new BaseDrawerAdapter.OnLongClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.6
            @Override // com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter.OnLongClickListener
            public boolean onLongClick(View view, int position, IDrawerItem item) {
                if (DrawerBuilder.this.mOnDrawerItemLongClickListener != null) {
                    return DrawerBuilder.this.mOnDrawerItemLongClickListener.onItemLongClick(view, position, DrawerBuilder.this.getDrawerItem(position));
                }
                return false;
            }
        });
        if (this.mRecyclerView != null) {
            this.mRecyclerView.scrollToPosition(0);
        }
        if (this.mSavedInstance != null) {
            if (!this.mAppended) {
                DrawerUtils.setRecyclerViewSelection(this, this.mSavedInstance.getInt("bundle_selection", -1), false);
                DrawerUtils.setStickyFooterSelection(this, this.mSavedInstance.getInt("bundle_sticky_footer_selection", -1), null);
            } else {
                DrawerUtils.setRecyclerViewSelection(this, this.mSavedInstance.getInt("bundle_selection_appended", -1), false);
                DrawerUtils.setStickyFooterSelection(this, this.mSavedInstance.getInt("bundle_sticky_footer_selection_appended", -1), null);
            }
        }
        if (this.mFireInitialOnClick && this.mOnDrawerItemClickListener != null) {
            this.mOnDrawerItemClickListener.onItemClick(null, this.mCurrentSelection, getDrawerItem(this.mCurrentSelection));
        }
    }

    protected void closeDrawerDelayed() {
        if (this.mCloseOnClick && this.mDrawerLayout != null) {
            if (this.mDelayOnDrawerClose > -1) {
                new Handler().postDelayed(new Runnable() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.7
                    @Override // java.lang.Runnable
                    public void run() {
                        DrawerBuilder.this.mDrawerLayout.closeDrawers();
                        if (DrawerBuilder.this.mScrollToTopAfterClick) {
                            DrawerBuilder.this.mRecyclerView.smoothScrollToPosition(0);
                        }
                    }
                }, this.mDelayOnDrawerClose);
            } else {
                this.mDrawerLayout.closeDrawers();
            }
        }
    }

    protected IDrawerItem getDrawerItem(int position) {
        return getAdapter().getItem(position);
    }

    protected boolean checkDrawerItem(int position, boolean includeOffset) {
        return getAdapter().getItem(position) != null;
    }

    protected void resetStickyFooterSelection() {
        if (this.mStickyFooterView instanceof LinearLayout) {
            for (int i = 0; i < this.mStickyFooterView.getChildCount(); i++) {
                if (Build.VERSION.SDK_INT >= 11) {
                    this.mStickyFooterView.getChildAt(i).setActivated(false);
                }
                this.mStickyFooterView.getChildAt(i).setSelected(false);
            }
        }
    }
}
