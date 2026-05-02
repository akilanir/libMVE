package com.mikepenz.materialdrawer;

import android.R;
import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RelativeLayout;
import com.mikepenz.iconics.utils.Utils;
import com.mikepenz.materialdrawer.Drawer;
import com.mikepenz.materialdrawer.accountswitcher.AccountHeader;
import com.mikepenz.materialdrawer.adapter.BaseDrawerAdapter;
import com.mikepenz.materialdrawer.adapter.DrawerAdapter;
import com.mikepenz.materialdrawer.model.interfaces.Checkable;
import com.mikepenz.materialdrawer.model.interfaces.IDrawerItem;
import com.mikepenz.materialdrawer.util.UIUtils;
import com.mikepenz.materialdrawer.view.ScrimInsetsFrameLayout;
import java.util.ArrayList;
import java.util.Collections;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/DrawerBuilder.class */
public class DrawerBuilder {
    protected Activity mActivity;
    protected ViewGroup mRootView;
    protected ScrimInsetsFrameLayout mDrawerContentRoot;
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
    protected ListView mListView;
    protected BaseDrawerAdapter mAdapter;
    protected Drawer.OnDrawerListener mOnDrawerListener;
    protected Drawer.OnDrawerItemClickListener mOnDrawerItemClickListener;
    protected Drawer.OnDrawerItemLongClickListener mOnDrawerItemLongClickListener;
    protected Drawer.OnDrawerItemSelectedListener mOnDrawerItemSelectedListener;
    protected Drawer.OnDrawerNavigationListener mOnDrawerNavigationListener;
    protected Bundle mSavedInstance;
    protected boolean mUsed = false;
    protected int mCurrentSelection = -1;
    protected int mCurrentFooterSelection = -1;
    protected boolean mTranslucentActionBarCompatibility = false;
    protected boolean mTranslucentStatusBar = true;
    protected boolean mTranslucentStatusBarProgrammatically = true;
    protected Boolean mTranslucentStatusBarShadow = null;
    protected boolean mTranslucentNavigationBar = false;
    protected boolean mTranslucentNavigationBarProgrammatically = false;
    protected boolean mFullscreen = false;
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
    protected int mHeaderOffset = 0;
    protected boolean mHeaderDivider = true;
    protected boolean mHeaderClickable = false;
    protected boolean mFooterDivider = true;
    protected boolean mFooterClickable = false;
    protected Boolean mStickyFooterDivider = null;
    protected boolean mFireInitialOnClick = false;
    protected int mSelectedItem = 0;
    protected boolean mAnimateDrawerItems = false;
    protected ArrayList<IDrawerItem> mDrawerItems = new ArrayList<>();
    protected ArrayList<IDrawerItem> mStickyDrawerItems = new ArrayList<>();
    protected boolean mCloseOnClick = true;
    protected int mDelayOnDrawerClose = 150;
    protected boolean mShowDrawerOnFirstLaunch = false;

    public DrawerBuilder() {
    }

    public DrawerBuilder(Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
    }

    public DrawerBuilder withActivity(Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
        return this;
    }

    public DrawerBuilder withRootView(ViewGroup rootView) {
        this.mRootView = rootView;
        withTranslucentStatusBar(false);
        return this;
    }

    public DrawerBuilder withRootView(int rootViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        return withRootView((ViewGroup) this.mActivity.findViewById(rootViewRes));
    }

    public DrawerBuilder withTranslucentActionBarCompatibility(boolean translucentActionBarCompatibility) {
        this.mTranslucentActionBarCompatibility = translucentActionBarCompatibility;
        return this;
    }

    public DrawerBuilder withDisplayBelowToolbar(boolean displayBelowToolbar) {
        this.mTranslucentActionBarCompatibility = displayBelowToolbar;
        return this;
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

    public DrawerBuilder withToolbar(Toolbar toolbar) {
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

    public DrawerBuilder withCustomView(View customView) {
        this.mCustomView = customView;
        return this;
    }

    public DrawerBuilder withDrawerLayout(DrawerLayout drawerLayout) {
        this.mDrawerLayout = drawerLayout;
        return this;
    }

    public DrawerBuilder withDrawerLayout(int resLayout) {
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

    public DrawerBuilder withStatusBarColor(int statusBarColor) {
        this.mStatusBarColor = statusBarColor;
        return this;
    }

    public DrawerBuilder withStatusBarColorRes(int statusBarColorRes) {
        this.mStatusBarColorRes = statusBarColorRes;
        return this;
    }

    public DrawerBuilder withSliderBackgroundColor(int sliderBackgroundColor) {
        this.mSliderBackgroundColor = sliderBackgroundColor;
        return this;
    }

    public DrawerBuilder withSliderBackgroundColorRes(int sliderBackgroundColorRes) {
        this.mSliderBackgroundColorRes = sliderBackgroundColorRes;
        return this;
    }

    public DrawerBuilder withSliderBackgroundDrawable(Drawable sliderBackgroundDrawable) {
        this.mSliderBackgroundDrawable = sliderBackgroundDrawable;
        return this;
    }

    public DrawerBuilder withSliderBackgroundDrawableRes(int sliderBackgroundDrawableRes) {
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

    public DrawerBuilder withDrawerWidthRes(int drawerWidthRes) {
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

    public DrawerBuilder withAccountHeader(AccountHeader accountHeader) {
        return withAccountHeader(accountHeader, false);
    }

    public DrawerBuilder withAccountHeader(AccountHeader accountHeader, boolean accountHeaderSticky) {
        this.mAccountHeader = accountHeader;
        this.mAccountHeaderSticky = accountHeaderSticky;
        if (!accountHeaderSticky) {
            this.mHeaderOffset = 1;
        }
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

    public DrawerBuilder withActionBarDrawerToggle(ActionBarDrawerToggle actionBarDrawerToggle) {
        this.mActionBarDrawerToggleEnabled = true;
        this.mActionBarDrawerToggle = actionBarDrawerToggle;
        return this;
    }

    public DrawerBuilder withHeader(View headerView) {
        this.mHeaderView = headerView;
        this.mHeaderOffset = 1;
        return this;
    }

    public DrawerBuilder withHeader(int headerViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (headerViewRes != -1) {
            this.mHeaderView = this.mActivity.getLayoutInflater().inflate(headerViewRes, (ViewGroup) null, false);
            this.mHeaderOffset = 1;
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

    public DrawerBuilder withStickyHeader(View stickyHeader) {
        this.mStickyHeaderView = stickyHeader;
        return this;
    }

    public DrawerBuilder withStickyHeader(int stickyHeaderRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (stickyHeaderRes != -1) {
            this.mStickyHeaderView = this.mActivity.getLayoutInflater().inflate(stickyHeaderRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withFooter(View footerView) {
        this.mFooterView = footerView;
        return this;
    }

    public DrawerBuilder withFooter(int footerViewRes) {
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

    public DrawerBuilder withStickyFooter(ViewGroup stickyFooter) {
        this.mStickyFooterView = stickyFooter;
        return this;
    }

    public DrawerBuilder withStickyFooter(int stickyFooterRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        if (stickyFooterRes != -1) {
            this.mStickyFooterView = (ViewGroup) this.mActivity.getLayoutInflater().inflate(stickyFooterRes, (ViewGroup) null, false);
        }
        return this;
    }

    public DrawerBuilder withStickyFooterDivider(Boolean stickyFooterDivider) {
        this.mStickyFooterDivider = stickyFooterDivider;
        return this;
    }

    public DrawerBuilder withFireOnInitialOnClick(boolean fireOnInitialOnClick) {
        this.mFireInitialOnClick = fireOnInitialOnClick;
        return this;
    }

    public DrawerBuilder withSelectedItem(int selectedItem) {
        this.mSelectedItem = selectedItem;
        return this;
    }

    public DrawerBuilder withListView(ListView listView) {
        this.mListView = listView;
        return this;
    }

    public DrawerBuilder withAdapter(BaseDrawerAdapter adapter) {
        this.mAdapter = adapter;
        return this;
    }

    public DrawerBuilder withAnimateDrawerItems(boolean animateDrawerItems) {
        this.mAnimateDrawerItems = animateDrawerItems;
        return this;
    }

    public DrawerBuilder withDrawerItems(ArrayList<IDrawerItem> drawerItems) {
        this.mDrawerItems = drawerItems;
        return this;
    }

    public DrawerBuilder addDrawerItems(IDrawerItem... drawerItems) {
        if (this.mDrawerItems == null) {
            this.mDrawerItems = new ArrayList<>();
        }
        if (drawerItems != null) {
            Collections.addAll(this.mDrawerItems, drawerItems);
        }
        return this;
    }

    public DrawerBuilder withStickyDrawerItems(ArrayList<IDrawerItem> stickyDrawerItems) {
        this.mStickyDrawerItems = stickyDrawerItems;
        return this;
    }

    public DrawerBuilder addStickyDrawerItems(IDrawerItem... stickyDrawerItems) {
        if (this.mStickyDrawerItems == null) {
            this.mStickyDrawerItems = new ArrayList<>();
        }
        if (stickyDrawerItems != null) {
            Collections.addAll(this.mStickyDrawerItems, stickyDrawerItems);
        }
        return this;
    }

    public DrawerBuilder withCloseOnClick(boolean closeOnClick) {
        this.mCloseOnClick = closeOnClick;
        return this;
    }

    public DrawerBuilder withDelayOnDrawerClose(int delayOnDrawerClose) {
        this.mDelayOnDrawerClose = delayOnDrawerClose;
        return this;
    }

    public DrawerBuilder withOnDrawerListener(Drawer.OnDrawerListener onDrawerListener) {
        this.mOnDrawerListener = onDrawerListener;
        return this;
    }

    public DrawerBuilder withOnDrawerItemClickListener(Drawer.OnDrawerItemClickListener onDrawerItemClickListener) {
        this.mOnDrawerItemClickListener = onDrawerItemClickListener;
        return this;
    }

    public DrawerBuilder withOnDrawerItemLongClickListener(Drawer.OnDrawerItemLongClickListener onDrawerItemLongClickListener) {
        this.mOnDrawerItemLongClickListener = onDrawerItemLongClickListener;
        return this;
    }

    public DrawerBuilder withOnDrawerItemSelectedListener(Drawer.OnDrawerItemSelectedListener onDrawerItemSelectedListener) {
        this.mOnDrawerItemSelectedListener = onDrawerItemSelectedListener;
        return this;
    }

    public DrawerBuilder withOnDrawerNavigationListener(Drawer.OnDrawerNavigationListener onDrawerNavigationListener) {
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
        if (this.mRootView == null || this.mRootView.getChildCount() == 0) {
            throw new RuntimeException("You have to set your layout for this activity with setContentView() first. Or you build the drawer on your own with .buildView()");
        }
        View contentView = this.mRootView.getChildAt(0);
        boolean alreadyInflated = contentView instanceof DrawerLayout;
        this.mDrawerContentRoot = (ScrimInsetsFrameLayout) this.mDrawerLayout.getChildAt(0);
        if (!alreadyInflated && this.mTranslucentStatusBar) {
            if (Build.VERSION.SDK_INT >= 19 && Build.VERSION.SDK_INT < 21) {
                DrawerUtils.setTranslucentStatusFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 19 && this.mTranslucentStatusBarProgrammatically) {
                this.mActivity.getWindow().getDecorView().setSystemUiVisibility(1280);
            }
            if (Build.VERSION.SDK_INT >= 21) {
                DrawerUtils.setTranslucentStatusFlag(this.mActivity, false);
                if (this.mTranslucentStatusBarProgrammatically) {
                    this.mActivity.getWindow().setStatusBarColor(0);
                }
            }
            this.mDrawerContentRoot.setPadding(0, UIUtils.getStatusBarHeight(this.mActivity), 0, 0);
            if (this.mStatusBarColor == 0 && this.mStatusBarColorRes != -1) {
                this.mStatusBarColor = this.mActivity.getResources().getColor(this.mStatusBarColorRes);
            } else if (this.mStatusBarColor == 0) {
                this.mStatusBarColor = UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.colorPrimaryDark, R.color.material_drawer_primary_dark);
            }
            this.mDrawerContentRoot.setInsetForeground(this.mStatusBarColor);
        }
        if (!alreadyInflated && this.mTranslucentNavigationBar) {
            if (Build.VERSION.SDK_INT >= 19 && Build.VERSION.SDK_INT < 21) {
                DrawerUtils.setTranslucentNavigationFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 19 && this.mTranslucentNavigationBarProgrammatically) {
                this.mActivity.getWindow().getDecorView().setSystemUiVisibility(1280);
                DrawerUtils.setTranslucentNavigationFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 21 && this.mTranslucentNavigationBarProgrammatically) {
                this.mActivity.getWindow().setNavigationBarColor(0);
            }
        }
        if (this.mFullscreen && Build.VERSION.SDK_INT >= 19) {
            this.mDrawerContentRoot.setEnabled(false);
        }
        if (!alreadyInflated) {
            this.mRootView.removeView(contentView);
        } else {
            this.mRootView.removeAllViews();
        }
        FrameLayout.LayoutParams layoutParamsContentView = new FrameLayout.LayoutParams(-1, -1);
        if (this.mTranslucentNavigationBar && Build.VERSION.SDK_INT >= 19) {
            layoutParamsContentView.bottomMargin = UIUtils.getNavigationBarHeight(this.mActivity);
        }
        this.mDrawerContentRoot.addView(contentView, layoutParamsContentView);
        this.mRootView.addView((View) this.mDrawerLayout, new ViewGroup.LayoutParams(-1, -1));
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
        if (this.mActionBarDrawerToggleEnabled && this.mActionBarDrawerToggle == null && this.mToolbar != null) {
            this.mActionBarDrawerToggle = new ActionBarDrawerToggle(this.mActivity, this.mDrawerLayout, this.mToolbar, R.string.drawer_open, R.string.drawer_close) { // from class: com.mikepenz.materialdrawer.DrawerBuilder.2
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
        Drawer result = buildView();
        this.mDrawerLayout.addView(this.mSliderLayout, 1);
        return result;
    }

    public Drawer buildView() {
        this.mSliderLayout = (RelativeLayout) this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_slider, (ViewGroup) this.mDrawerLayout, false);
        this.mSliderLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
        DrawerLayout.LayoutParams params = this.mSliderLayout.getLayoutParams();
        if (params != null) {
            params.gravity = this.mDrawerGravity.intValue();
            this.mSliderLayout.setLayoutParams(DrawerUtils.processDrawerLayoutParams(this, params));
        }
        if (this.mSliderBackgroundColor != 0) {
            this.mSliderLayout.setBackgroundColor(this.mSliderBackgroundColor);
        } else if (this.mSliderBackgroundColorRes != -1) {
            this.mSliderLayout.setBackgroundColor(this.mActivity.getResources().getColor(this.mSliderBackgroundColorRes));
        } else if (this.mSliderBackgroundDrawable != null) {
            UIUtils.setBackground(this.mSliderLayout, this.mSliderBackgroundDrawable);
        } else if (this.mSliderBackgroundDrawableRes != -1) {
            UIUtils.setBackground(this.mSliderLayout, this.mSliderBackgroundColorRes);
        }
        if (Build.VERSION.SDK_INT < 21) {
            this.mDrawerLayout.setDrawerShadow(R.drawable.drawer_shadow, this.mDrawerGravity.intValue());
        }
        createContent();
        Drawer result = new Drawer(this);
        if (this.mAccountHeader != null) {
            this.mAccountHeader.setDrawer(result);
        }
        handleShowOnFirstLaunch();
        this.mActivity = null;
        return result;
    }

    public Drawer append(Drawer result) {
        if (this.mUsed) {
            throw new RuntimeException("you must not reuse a DrawerBuilder builder");
        }
        if (this.mDrawerGravity == null) {
            throw new RuntimeException("please set the gravity for the drawer");
        }
        this.mUsed = true;
        this.mDrawerLayout = result.getDrawerLayout();
        this.mSliderLayout = (RelativeLayout) this.mActivity.getLayoutInflater().inflate(R.layout.material_drawer_slider, (ViewGroup) this.mDrawerLayout, false);
        this.mSliderLayout.setBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
        DrawerLayout.LayoutParams params = this.mSliderLayout.getLayoutParams();
        params.gravity = this.mDrawerGravity.intValue();
        this.mSliderLayout.setLayoutParams(DrawerUtils.processDrawerLayoutParams(this, params));
        this.mDrawerLayout.addView(this.mSliderLayout, 1);
        createContent();
        this.mActivity = null;
        return new Drawer(this);
    }

    private void createContent() {
        if (this.mCustomView != null) {
            LinearLayout.LayoutParams contentParams = new LinearLayout.LayoutParams(-1, -1);
            contentParams.weight = 1.0f;
            this.mSliderLayout.addView(this.mCustomView, contentParams);
            return;
        }
        if (this.mListView == null) {
            this.mListView = new ListView(this.mActivity);
            this.mListView.setChoiceMode(1);
            this.mListView.setDivider(null);
            this.mListView.setFadingEdgeLength(0);
            this.mListView.setCacheColorHint(0);
            this.mListView.setDrawingCacheBackgroundColor(UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.material_drawer_background, R.color.material_drawer_background));
            if (Build.VERSION.SDK_INT > 21) {
                this.mListView.setDrawSelectorOnTop(true);
            }
            this.mListView.setClipToPadding(false);
            int paddingTop = 0;
            if ((this.mTranslucentStatusBar && !this.mTranslucentActionBarCompatibility) || this.mFullscreen) {
                paddingTop = UIUtils.getStatusBarHeight(this.mActivity);
            }
            int paddingBottom = 0;
            if ((this.mTranslucentNavigationBar || this.mFullscreen) && Build.VERSION.SDK_INT >= 19) {
                paddingBottom = UIUtils.getNavigationBarHeight(this.mActivity);
            }
            this.mListView.setPadding(0, paddingTop, 0, paddingBottom);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -1);
        params.weight = 1.0f;
        this.mSliderLayout.addView(this.mListView, params);
        View statusBarShadow = this.mSliderLayout.findViewById(R.id.shadow_top);
        RelativeLayout.LayoutParams shadowLayoutParams = (RelativeLayout.LayoutParams) statusBarShadow.getLayoutParams();
        shadowLayoutParams.height = UIUtils.getStatusBarHeight(this.mActivity, true);
        statusBarShadow.setLayoutParams(shadowLayoutParams);
        if ((this.mTranslucentStatusBar && !this.mTranslucentActionBarCompatibility) || (this.mTranslucentStatusBarShadow != null && this.mTranslucentStatusBarShadow.booleanValue())) {
            if (this.mTranslucentStatusBarShadow != null || Build.VERSION.SDK_INT > 20) {
                statusBarShadow.bringToFront();
            } else {
                statusBarShadow.setVisibility(8);
            }
        } else {
            statusBarShadow.setVisibility(8);
        }
        if (this.mDrawerItems != null && this.mAdapter == null) {
            this.mAdapter = new DrawerAdapter(this.mActivity, this.mDrawerItems, this.mAnimateDrawerItems);
        }
        DrawerUtils.handleHeaderView(this);
        DrawerUtils.handleFooterView(this, new View.OnClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                IDrawerItem drawerItem = (IDrawerItem) v.getTag();
                DrawerUtils.onFooterDrawerItemClick(DrawerBuilder.this, drawerItem, v, true);
            }
        });
        if (this.mAdapter != null) {
            this.mListView.setAdapter((ListAdapter) this.mAdapter);
            DrawerUtils.setListSelection(this, this.mSelectedItem, false);
        }
        this.mListView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.5
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                IDrawerItem i = DrawerBuilder.this.getDrawerItem(position, true);
                if (i != null && (i instanceof Checkable) && !((Checkable) i).isCheckable()) {
                    DrawerBuilder.this.mListView.setSelection(DrawerBuilder.this.mCurrentSelection + DrawerBuilder.this.mHeaderOffset);
                    DrawerBuilder.this.mListView.setItemChecked(DrawerBuilder.this.mCurrentSelection + DrawerBuilder.this.mHeaderOffset, true);
                } else {
                    DrawerBuilder.this.resetStickyFooterSelection();
                    DrawerBuilder.this.mCurrentSelection = position - DrawerBuilder.this.mHeaderOffset;
                    DrawerBuilder.this.mCurrentFooterSelection = -1;
                }
                boolean consumed = false;
                if (DrawerBuilder.this.mOnDrawerItemClickListener != null) {
                    consumed = DrawerBuilder.this.mOnDrawerItemClickListener.onItemClick(parent, view, position - DrawerBuilder.this.mHeaderOffset, id, i);
                }
                if (!consumed) {
                    DrawerBuilder.this.closeDrawerDelayed();
                }
            }
        });
        this.mListView.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.6
            @Override // android.widget.AdapterView.OnItemLongClickListener
            public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
                if (DrawerBuilder.this.mOnDrawerItemLongClickListener != null) {
                    return DrawerBuilder.this.mOnDrawerItemLongClickListener.onItemLongClick(parent, view, position - DrawerBuilder.this.mHeaderOffset, id, DrawerBuilder.this.getDrawerItem(position, true));
                }
                return false;
            }
        });
        this.mListView.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.7
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                if (DrawerBuilder.this.mOnDrawerItemSelectedListener != null) {
                    DrawerBuilder.this.mOnDrawerItemSelectedListener.onItemSelected(parent, view, position - DrawerBuilder.this.mHeaderOffset, id, DrawerBuilder.this.getDrawerItem(position, true));
                }
                DrawerBuilder.this.mCurrentSelection = position - DrawerBuilder.this.mHeaderOffset;
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> parent) {
                if (DrawerBuilder.this.mOnDrawerItemSelectedListener != null) {
                    DrawerBuilder.this.mOnDrawerItemSelectedListener.onNothingSelected(parent);
                }
            }
        });
        if (this.mListView != null) {
            this.mListView.smoothScrollToPosition(0);
        }
        if (this.mSavedInstance != null) {
            int selection = this.mSavedInstance.getInt("bundle_selection", -1);
            DrawerUtils.setListSelection(this, selection, false);
            int footerSelection = this.mSavedInstance.getInt("bundle_footer_selection", -1);
            DrawerUtils.setFooterSelection(this, footerSelection, false);
        }
        if (this.mFireInitialOnClick && this.mOnDrawerItemClickListener != null) {
            this.mOnDrawerItemClickListener.onItemClick(null, null, this.mCurrentSelection, this.mCurrentSelection, getDrawerItem(this.mCurrentSelection, false));
        }
    }

    protected void closeDrawerDelayed() {
        if (this.mCloseOnClick && this.mDrawerLayout != null) {
            if (this.mDelayOnDrawerClose > -1) {
                new Handler().postDelayed(new Runnable() { // from class: com.mikepenz.materialdrawer.DrawerBuilder.8
                    @Override // java.lang.Runnable
                    public void run() {
                        DrawerBuilder.this.mDrawerLayout.closeDrawers();
                    }
                }, this.mDelayOnDrawerClose);
            } else {
                this.mDrawerLayout.closeDrawers();
            }
        }
    }

    protected IDrawerItem getDrawerItem(int position, boolean includeOffset) {
        if (includeOffset) {
            if (this.mDrawerItems != null && this.mDrawerItems.size() > position - this.mHeaderOffset && position - this.mHeaderOffset > -1) {
                return this.mDrawerItems.get(position - this.mHeaderOffset);
            }
            return null;
        }
        if (this.mDrawerItems != null && this.mDrawerItems.size() > position && position > -1) {
            return this.mDrawerItems.get(position);
        }
        return null;
    }

    protected boolean checkDrawerItem(int position, boolean includeOffset) {
        if (includeOffset) {
            if (this.mDrawerItems != null && this.mDrawerItems.size() > position - this.mHeaderOffset && position - this.mHeaderOffset > -1) {
                return true;
            }
            return false;
        }
        if (this.mDrawerItems != null && this.mDrawerItems.size() > position && position > -1) {
            return true;
        }
        return false;
    }

    protected void resetStickyFooterSelection() {
        if (this.mStickyFooterView instanceof LinearLayout) {
            for (int i = 0; i < ((LinearLayout) this.mStickyFooterView).getChildCount(); i++) {
                if (Build.VERSION.SDK_INT >= 11) {
                    ((LinearLayout) this.mStickyFooterView).getChildAt(i).setActivated(false);
                }
                ((LinearLayout) this.mStickyFooterView).getChildAt(i).setSelected(false);
            }
        }
    }
}
