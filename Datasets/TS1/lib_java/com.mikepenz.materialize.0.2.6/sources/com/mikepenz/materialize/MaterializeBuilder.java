package com.mikepenz.materialize;

import android.R;
import android.app.Activity;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.mikepenz.materialize.util.UIUtils;
import com.mikepenz.materialize.view.IScrimInsetsLayout;
import com.mikepenz.materialize.view.ScrimInsetsFrameLayout;

/* loaded from: com.mikepenz.materialize.0.2.6.jar:com/mikepenz/materialize/MaterializeBuilder.class */
public class MaterializeBuilder {
    protected Activity mActivity;
    protected ViewGroup mRootView;
    protected ViewGroup mContentRoot;
    protected IScrimInsetsLayout mScrimInsetsLayout;
    protected int mStatusBarColor = 0;
    protected int mStatusBarColorRes = -1;
    protected boolean mTranslucentActionBarCompatibility = false;
    protected boolean mTranslucentStatusBar = true;
    protected boolean mTranslucentStatusBarProgrammatically = true;
    protected boolean mTintStatusBar = true;
    protected boolean mTranslucentNavigationBar = false;
    protected boolean mTranslucentNavigationBarProgrammatically = false;
    protected boolean mTintNavigationBar = false;
    protected boolean mFullscreen = false;
    protected boolean mSystemUIHidden = false;
    protected ViewGroup mContainer = null;
    protected ViewGroup.LayoutParams mContainerLayoutParams = null;

    public MaterializeBuilder() {
    }

    public MaterializeBuilder(Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
    }

    public MaterializeBuilder withActivity(Activity activity) {
        this.mRootView = (ViewGroup) activity.findViewById(R.id.content);
        this.mActivity = activity;
        return this;
    }

    public MaterializeBuilder withRootView(ViewGroup rootView) {
        this.mRootView = rootView;
        withTranslucentStatusBar(false);
        return this;
    }

    public MaterializeBuilder withRootView(int rootViewRes) {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity first to use this call");
        }
        return withRootView((ViewGroup) this.mActivity.findViewById(rootViewRes));
    }

    public MaterializeBuilder withStatusBarColor(int statusBarColor) {
        this.mStatusBarColor = statusBarColor;
        return this;
    }

    public MaterializeBuilder withStatusBarColorRes(int statusBarColorRes) {
        this.mStatusBarColorRes = statusBarColorRes;
        return this;
    }

    public MaterializeBuilder withTranslucentActionBarCompatibility(boolean translucentActionBarCompatibility) {
        this.mTranslucentActionBarCompatibility = translucentActionBarCompatibility;
        return this;
    }

    public MaterializeBuilder withTranslucentStatusBar(boolean translucentStatusBar) {
        this.mTranslucentStatusBar = translucentStatusBar;
        if (!translucentStatusBar) {
            this.mTranslucentStatusBarProgrammatically = false;
        }
        return this;
    }

    public MaterializeBuilder withTranslucentStatusBarProgrammatically(boolean translucentStatusBarProgrammatically) {
        this.mTranslucentStatusBarProgrammatically = translucentStatusBarProgrammatically;
        if (translucentStatusBarProgrammatically) {
            this.mTranslucentStatusBar = true;
        }
        return this;
    }

    public MaterializeBuilder withTintedStatusBar(boolean tintedStatusBar) {
        this.mTintStatusBar = tintedStatusBar;
        return this;
    }

    public MaterializeBuilder withTranslucentNavigationBar(boolean translucentNavigationBar) {
        this.mTranslucentNavigationBar = translucentNavigationBar;
        if (!translucentNavigationBar) {
            this.mTranslucentNavigationBarProgrammatically = false;
        }
        return this;
    }

    public MaterializeBuilder withTranslucentNavigationBarProgrammatically(boolean translucentNavigationBarProgrammatically) {
        this.mTranslucentNavigationBarProgrammatically = translucentNavigationBarProgrammatically;
        if (translucentNavigationBarProgrammatically) {
            this.mTranslucentNavigationBar = true;
        }
        return this;
    }

    public MaterializeBuilder withTintedNavigationBar(boolean tintedNavigationBar) {
        this.mTintNavigationBar = tintedNavigationBar;
        if (tintedNavigationBar) {
            withTranslucentNavigationBarProgrammatically(true);
        }
        return this;
    }

    public MaterializeBuilder withFullscreen(boolean fullscreen) {
        this.mFullscreen = fullscreen;
        if (fullscreen) {
            withTranslucentStatusBar(false);
            withTranslucentNavigationBarProgrammatically(true);
            withTintedStatusBar(false);
            withTintedNavigationBar(false);
        }
        return this;
    }

    public MaterializeBuilder withSystemUIHidden(boolean systemUIHidden) {
        this.mSystemUIHidden = systemUIHidden;
        if (systemUIHidden) {
            withFullscreen(systemUIHidden);
        }
        return this;
    }

    public MaterializeBuilder withContainer(ViewGroup container) {
        this.mContainer = container;
        return this;
    }

    public MaterializeBuilder withContainerLayoutParams(ViewGroup.LayoutParams layoutParams) {
        this.mContainerLayoutParams = layoutParams;
        return this;
    }

    public MaterializeBuilder withContainer(ViewGroup container, ViewGroup.LayoutParams layoutParams) {
        this.mContainer = container;
        this.mContainerLayoutParams = layoutParams;
        return this;
    }

    public Materialize build() {
        if (this.mActivity == null) {
            throw new RuntimeException("please pass an activity");
        }
        this.mScrimInsetsLayout = (ScrimInsetsFrameLayout) this.mActivity.getLayoutInflater().inflate(R.layout.materialize, this.mRootView, false);
        if (this.mRootView == null || this.mRootView.getChildCount() == 0) {
            throw new RuntimeException("You have to set your layout for this activity with setContentView() first. Or you build the drawer on your own with .buildView()");
        }
        View originalContentView = this.mRootView.getChildAt(0);
        boolean alreadyInflated = originalContentView.getId() == R.id.materialize_root;
        if (this.mStatusBarColor == 0 && this.mStatusBarColorRes != -1) {
            this.mStatusBarColor = this.mActivity.getResources().getColor(this.mStatusBarColorRes);
        } else if (this.mStatusBarColor == 0) {
            this.mStatusBarColor = UIUtils.getThemeColorFromAttrOrRes(this.mActivity, R.attr.colorPrimaryDark, R.color.materialize_primary_dark);
        }
        this.mScrimInsetsLayout.setInsetForeground(this.mStatusBarColor);
        this.mScrimInsetsLayout.setTintStatusBar(this.mTintStatusBar);
        this.mScrimInsetsLayout.setTintNavigationBar(this.mTintNavigationBar);
        this.mScrimInsetsLayout.setSystemUIVisible((this.mFullscreen || this.mSystemUIHidden) ? false : true);
        if (!alreadyInflated && this.mTranslucentStatusBar) {
            if (Build.VERSION.SDK_INT >= 19 && Build.VERSION.SDK_INT < 21) {
                UIUtils.setTranslucentStatusFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 19 && this.mTranslucentStatusBarProgrammatically) {
                this.mActivity.getWindow().getDecorView().setSystemUiVisibility(1280);
            }
            if (Build.VERSION.SDK_INT >= 21) {
                UIUtils.setTranslucentStatusFlag(this.mActivity, false);
                if (this.mTranslucentStatusBarProgrammatically) {
                    this.mActivity.getWindow().setStatusBarColor(0);
                }
            }
            this.mScrimInsetsLayout.getView().setPadding(0, UIUtils.getStatusBarHeight(this.mActivity), 0, 0);
        }
        if (!alreadyInflated && this.mTranslucentNavigationBar) {
            if (Build.VERSION.SDK_INT >= 19 && Build.VERSION.SDK_INT < 21) {
                UIUtils.setTranslucentNavigationFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 19 && this.mTranslucentNavigationBarProgrammatically) {
                this.mActivity.getWindow().getDecorView().setSystemUiVisibility(1280);
                UIUtils.setTranslucentNavigationFlag(this.mActivity, true);
            }
            if (Build.VERSION.SDK_INT >= 21 && this.mTranslucentNavigationBarProgrammatically) {
                this.mActivity.getWindow().setNavigationBarColor(0);
            }
        }
        if (this.mSystemUIHidden && Build.VERSION.SDK_INT >= 11) {
            View decorView = this.mActivity.getWindow().getDecorView();
            decorView.setSystemUiVisibility(5894);
        }
        if (!alreadyInflated) {
            this.mRootView.removeView(originalContentView);
        } else {
            this.mRootView.removeAllViews();
        }
        FrameLayout.LayoutParams layoutParamsContentView = new FrameLayout.LayoutParams(-1, -1);
        if (!this.mFullscreen && this.mTranslucentNavigationBar && Build.VERSION.SDK_INT >= 19) {
            layoutParamsContentView.bottomMargin = UIUtils.getNavigationBarHeight(this.mActivity);
        }
        this.mScrimInsetsLayout.getView().addView(originalContentView, layoutParamsContentView);
        this.mContentRoot = this.mScrimInsetsLayout.getView();
        if (this.mContainer != null) {
            this.mContentRoot = this.mContainer;
            this.mContentRoot.addView(this.mScrimInsetsLayout.getView(), new ViewGroup.LayoutParams(-1, -1));
        }
        this.mContentRoot.setId(R.id.materialize_root);
        if (this.mContainerLayoutParams == null) {
            this.mContainerLayoutParams = new ViewGroup.LayoutParams(-1, -1);
        }
        this.mRootView.addView(this.mContentRoot, this.mContainerLayoutParams);
        this.mActivity = null;
        return new Materialize(this);
    }
}
