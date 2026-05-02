package com.actionbarsherlock.internal.app;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTransaction;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.SpinnerAdapter;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorListenerAdapter;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineFrameLayout;
import com.actionbarsherlock.internal.view.menu.MenuBuilder;
import com.actionbarsherlock.internal.view.menu.MenuPopupHelper;
import com.actionbarsherlock.internal.view.menu.SubMenuBuilder;
import com.actionbarsherlock.internal.widget.ActionBarContainer;
import com.actionbarsherlock.internal.widget.ActionBarContextView;
import com.actionbarsherlock.internal.widget.ActionBarView;
import com.actionbarsherlock.internal.widget.ScrollingTabContainerView;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/app/ActionBarImpl.class */
public class ActionBarImpl extends ActionBar {
    private Context mContext;
    private Context mThemedContext;
    private Activity mActivity;
    private ActionBarContainer mContainerView;
    private ActionBarView mActionView;
    private ActionBarContextView mContextView;
    private ActionBarContainer mSplitView;
    private NineFrameLayout mContentView;
    private ScrollingTabContainerView mTabScrollView;
    private TabImpl mSelectedTab;
    ActionModeImpl mActionMode;
    ActionMode mDeferredDestroyActionMode;
    ActionMode.Callback mDeferredModeDestroyCallback;
    private boolean mLastMenuVisibility;
    private static final int CONTEXT_DISPLAY_NORMAL = 0;
    private static final int CONTEXT_DISPLAY_SPLIT = 1;
    private static final int INVALID_POSITION = -1;
    private int mContextDisplayMode;
    private boolean mHasEmbeddedTabs;
    Runnable mTabSelector;
    private Animator mCurrentShowAnim;
    private Animator mCurrentModeAnim;
    private boolean mShowHideAnimationEnabled;
    boolean mWasHiddenBeforeMode;
    private ArrayList<TabImpl> mTabs = new ArrayList<>();
    private int mSavedTabPosition = -1;
    private ArrayList<ActionBar.OnMenuVisibilityListener> mMenuVisibilityListeners = new ArrayList<>();
    final Handler mHandler = new Handler();
    final Animator.AnimatorListener mHideListener = new AnimatorListenerAdapter() { // from class: com.actionbarsherlock.internal.app.ActionBarImpl.1
        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorListenerAdapter, com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            if (ActionBarImpl.this.mContentView != null) {
                ActionBarImpl.this.mContentView.setTranslationY(0.0f);
                ActionBarImpl.this.mContainerView.setTranslationY(0.0f);
            }
            if (ActionBarImpl.this.mSplitView != null && ActionBarImpl.this.mContextDisplayMode == 1) {
                ActionBarImpl.this.mSplitView.setVisibility(8);
            }
            ActionBarImpl.this.mContainerView.setVisibility(8);
            ActionBarImpl.this.mContainerView.setTransitioning(false);
            ActionBarImpl.this.mCurrentShowAnim = null;
            ActionBarImpl.this.completeDeferredDestroyActionMode();
        }
    };
    final Animator.AnimatorListener mShowListener = new AnimatorListenerAdapter() { // from class: com.actionbarsherlock.internal.app.ActionBarImpl.2
        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorListenerAdapter, com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            ActionBarImpl.this.mCurrentShowAnim = null;
            ActionBarImpl.this.mContainerView.requestLayout();
        }
    };

    public ActionBarImpl(Activity activity, int features) {
        this.mActivity = activity;
        Window window = activity.getWindow();
        View decor = window.getDecorView();
        init(decor);
        if ((features & 512) == 0) {
            this.mContentView = (NineFrameLayout) decor.findViewById(R.id.content);
        }
    }

    public ActionBarImpl(Dialog dialog) {
        init(dialog.getWindow().getDecorView());
    }

    private void init(View decor) {
        this.mContext = decor.getContext();
        this.mActionView = (ActionBarView) decor.findViewById(com.actionbarsherlock.R.id.abs__action_bar);
        this.mContextView = (ActionBarContextView) decor.findViewById(com.actionbarsherlock.R.id.abs__action_context_bar);
        this.mContainerView = (ActionBarContainer) decor.findViewById(com.actionbarsherlock.R.id.abs__action_bar_container);
        this.mSplitView = (ActionBarContainer) decor.findViewById(com.actionbarsherlock.R.id.abs__split_action_bar);
        if (this.mActionView == null || this.mContextView == null || this.mContainerView == null) {
            throw new IllegalStateException(getClass().getSimpleName() + " can only be used with a compatible window decor layout");
        }
        this.mActionView.setContextView(this.mContextView);
        this.mContextDisplayMode = this.mActionView.isSplitActionBar() ? 1 : 0;
        boolean homeButtonEnabled = this.mContext.getApplicationInfo().targetSdkVersion < 14;
        setHomeButtonEnabled(homeButtonEnabled | ((this.mActionView.getDisplayOptions() & 4) != 0));
        setHasEmbeddedTabs(ResourcesCompat.getResources_getBoolean(this.mContext, com.actionbarsherlock.R.bool.abs__action_bar_embed_tabs));
    }

    public void onConfigurationChanged(Configuration newConfig) {
        setHasEmbeddedTabs(ResourcesCompat.getResources_getBoolean(this.mContext, com.actionbarsherlock.R.bool.abs__action_bar_embed_tabs));
        if (Build.VERSION.SDK_INT < 8) {
            this.mActionView.onConfigurationChanged(newConfig);
            if (this.mContextView != null) {
                this.mContextView.onConfigurationChanged(newConfig);
            }
        }
    }

    private void setHasEmbeddedTabs(boolean hasEmbeddedTabs) {
        this.mHasEmbeddedTabs = hasEmbeddedTabs;
        if (!this.mHasEmbeddedTabs) {
            this.mActionView.setEmbeddedTabView(null);
            this.mContainerView.setTabContainer(this.mTabScrollView);
        } else {
            this.mContainerView.setTabContainer(null);
            this.mActionView.setEmbeddedTabView(this.mTabScrollView);
        }
        boolean isInTabMode = getNavigationMode() == 2;
        if (this.mTabScrollView != null) {
            this.mTabScrollView.setVisibility(isInTabMode ? 0 : 8);
        }
        this.mActionView.setCollapsable(!this.mHasEmbeddedTabs && isInTabMode);
    }

    private void ensureTabsExist() {
        if (this.mTabScrollView != null) {
            return;
        }
        ScrollingTabContainerView tabScroller = new ScrollingTabContainerView(this.mContext);
        if (this.mHasEmbeddedTabs) {
            tabScroller.setVisibility(0);
            this.mActionView.setEmbeddedTabView(tabScroller);
        } else {
            tabScroller.setVisibility(getNavigationMode() == 2 ? 0 : 8);
            this.mContainerView.setTabContainer(tabScroller);
        }
        this.mTabScrollView = tabScroller;
    }

    void completeDeferredDestroyActionMode() {
        if (this.mDeferredModeDestroyCallback != null) {
            this.mDeferredModeDestroyCallback.onDestroyActionMode(this.mDeferredDestroyActionMode);
            this.mDeferredDestroyActionMode = null;
            this.mDeferredModeDestroyCallback = null;
        }
    }

    public void setShowHideAnimationEnabled(boolean enabled) {
        this.mShowHideAnimationEnabled = enabled;
        if (!enabled && this.mCurrentShowAnim != null) {
            this.mCurrentShowAnim.end();
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener listener) {
        this.mMenuVisibilityListeners.add(listener);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener listener) {
        this.mMenuVisibilityListeners.remove(listener);
    }

    public void dispatchMenuVisibilityChanged(boolean isVisible) {
        if (isVisible == this.mLastMenuVisibility) {
            return;
        }
        this.mLastMenuVisibility = isVisible;
        int count = this.mMenuVisibilityListeners.size();
        for (int i = 0; i < count; i++) {
            this.mMenuVisibilityListeners.get(i).onMenuVisibilityChanged(isVisible);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(int resId) {
        setCustomView(LayoutInflater.from(getThemedContext()).inflate(resId, (ViewGroup) this.mActionView, false));
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayUseLogoEnabled(boolean useLogo) {
        setDisplayOptions(useLogo ? 1 : 0, 1);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowHomeEnabled(boolean showHome) {
        setDisplayOptions(showHome ? 2 : 0, 2);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayHomeAsUpEnabled(boolean showHomeAsUp) {
        setDisplayOptions(showHomeAsUp ? 4 : 0, 4);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowTitleEnabled(boolean showTitle) {
        setDisplayOptions(showTitle ? 8 : 0, 8);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowCustomEnabled(boolean showCustom) {
        setDisplayOptions(showCustom ? 16 : 0, 16);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setHomeButtonEnabled(boolean enable) {
        this.mActionView.setHomeButtonEnabled(enable);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setTitle(int resId) {
        setTitle(this.mContext.getString(resId));
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSubtitle(int resId) {
        setSubtitle(this.mContext.getString(resId));
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSelectedNavigationItem(int position) {
        switch (this.mActionView.getNavigationMode()) {
            case 1:
                this.mActionView.setDropdownSelectedPosition(position);
                return;
            case 2:
                selectTab(this.mTabs.get(position));
                return;
            default:
                throw new IllegalStateException("setSelectedNavigationItem not valid for current navigation mode");
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeAllTabs() {
        cleanupTabs();
    }

    private void cleanupTabs() {
        if (this.mSelectedTab != null) {
            selectTab(null);
        }
        this.mTabs.clear();
        if (this.mTabScrollView != null) {
            this.mTabScrollView.removeAllTabs();
        }
        this.mSavedTabPosition = -1;
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setTitle(CharSequence title) {
        this.mActionView.setTitle(title);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSubtitle(CharSequence subtitle) {
        this.mActionView.setSubtitle(subtitle);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayOptions(int options) {
        this.mActionView.setDisplayOptions(options);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayOptions(int options, int mask) {
        int current = this.mActionView.getDisplayOptions();
        this.mActionView.setDisplayOptions((options & mask) | (current & (mask ^ (-1))));
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setBackgroundDrawable(Drawable d) {
        this.mContainerView.setPrimaryBackground(d);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setStackedBackgroundDrawable(Drawable d) {
        this.mContainerView.setStackedBackground(d);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSplitBackgroundDrawable(Drawable d) {
        if (this.mSplitView != null) {
            this.mSplitView.setSplitBackground(d);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public View getCustomView() {
        return this.mActionView.getCustomNavigationView();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public CharSequence getTitle() {
        return this.mActionView.getTitle();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public CharSequence getSubtitle() {
        return this.mActionView.getSubtitle();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getNavigationMode() {
        return this.mActionView.getNavigationMode();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getDisplayOptions() {
        return this.mActionView.getDisplayOptions();
    }

    public ActionMode startActionMode(ActionMode.Callback callback) {
        boolean wasHidden = false;
        if (this.mActionMode != null) {
            wasHidden = this.mWasHiddenBeforeMode;
            this.mActionMode.finish();
        }
        this.mContextView.killMode();
        ActionModeImpl mode = new ActionModeImpl(callback);
        if (mode.dispatchOnCreate()) {
            this.mWasHiddenBeforeMode = !isShowing() || wasHidden;
            mode.invalidate();
            this.mContextView.initForMode(mode);
            animateToMode(true);
            if (this.mSplitView != null && this.mContextDisplayMode == 1) {
                this.mSplitView.setVisibility(0);
            }
            this.mContextView.sendAccessibilityEvent(32);
            this.mActionMode = mode;
            return mode;
        }
        return null;
    }

    private void configureTab(ActionBar.Tab tab, int position) {
        TabImpl tabi = (TabImpl) tab;
        ActionBar.TabListener callback = tabi.getCallback();
        if (callback == null) {
            throw new IllegalStateException("Action Bar Tab must have a Callback");
        }
        tabi.setPosition(position);
        this.mTabs.add(position, tabi);
        int count = this.mTabs.size();
        for (int i = position + 1; i < count; i++) {
            this.mTabs.get(i).setPosition(i);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab) {
        addTab(tab, this.mTabs.isEmpty());
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, int position) {
        addTab(tab, position, this.mTabs.isEmpty());
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, boolean setSelected) {
        ensureTabsExist();
        this.mTabScrollView.addTab(tab, setSelected);
        configureTab(tab, this.mTabs.size());
        if (setSelected) {
            selectTab(tab);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, int position, boolean setSelected) {
        ensureTabsExist();
        this.mTabScrollView.addTab(tab, position, setSelected);
        configureTab(tab, position);
        if (setSelected) {
            selectTab(tab);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab newTab() {
        return new TabImpl();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeTab(ActionBar.Tab tab) {
        removeTabAt(tab.getPosition());
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeTabAt(int position) {
        if (this.mTabScrollView == null) {
            return;
        }
        int selectedTabPosition = this.mSelectedTab != null ? this.mSelectedTab.getPosition() : this.mSavedTabPosition;
        this.mTabScrollView.removeTabAt(position);
        TabImpl removedTab = this.mTabs.remove(position);
        if (removedTab != null) {
            removedTab.setPosition(-1);
        }
        int newTabCount = this.mTabs.size();
        for (int i = position; i < newTabCount; i++) {
            this.mTabs.get(i).setPosition(i);
        }
        if (selectedTabPosition == position) {
            selectTab(this.mTabs.isEmpty() ? null : this.mTabs.get(Math.max(0, position - 1)));
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void selectTab(ActionBar.Tab tab) {
        if (getNavigationMode() != 2) {
            this.mSavedTabPosition = tab != null ? tab.getPosition() : -1;
            return;
        }
        FragmentTransaction trans = null;
        if (this.mActivity instanceof FragmentActivity) {
            trans = this.mActivity.getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
        }
        if (this.mSelectedTab == tab) {
            if (this.mSelectedTab != null) {
                this.mSelectedTab.getCallback().onTabReselected(this.mSelectedTab, trans);
                this.mTabScrollView.animateToTab(tab.getPosition());
            }
        } else {
            this.mTabScrollView.setTabSelected(tab != null ? tab.getPosition() : -1);
            if (this.mSelectedTab != null) {
                this.mSelectedTab.getCallback().onTabUnselected(this.mSelectedTab, trans);
            }
            this.mSelectedTab = (TabImpl) tab;
            if (this.mSelectedTab != null) {
                this.mSelectedTab.getCallback().onTabSelected(this.mSelectedTab, trans);
            }
        }
        if (trans != null && !trans.isEmpty()) {
            trans.commit();
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab getSelectedTab() {
        return this.mSelectedTab;
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getHeight() {
        return this.mContainerView.getHeight();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void show() {
        show(true);
    }

    void show(boolean markHiddenBeforeMode) {
        if (this.mCurrentShowAnim != null) {
            this.mCurrentShowAnim.end();
        }
        if (this.mContainerView.getVisibility() == 0) {
            if (markHiddenBeforeMode) {
                this.mWasHiddenBeforeMode = false;
                return;
            }
            return;
        }
        this.mContainerView.setVisibility(0);
        if (this.mShowHideAnimationEnabled) {
            this.mContainerView.setAlpha(0.0f);
            AnimatorSet anim = new AnimatorSet();
            AnimatorSet.Builder b = anim.play(ObjectAnimator.ofFloat(this.mContainerView, "alpha", 1.0f));
            if (this.mContentView != null) {
                b.with(ObjectAnimator.ofFloat(this.mContentView, "translationY", -this.mContainerView.getHeight(), 0.0f));
                this.mContainerView.setTranslationY(-this.mContainerView.getHeight());
                b.with(ObjectAnimator.ofFloat(this.mContainerView, "translationY", 0.0f));
            }
            if (this.mSplitView != null && this.mContextDisplayMode == 1) {
                this.mSplitView.setAlpha(0.0f);
                this.mSplitView.setVisibility(0);
                b.with(ObjectAnimator.ofFloat(this.mSplitView, "alpha", 1.0f));
            }
            anim.addListener(this.mShowListener);
            this.mCurrentShowAnim = anim;
            anim.start();
            return;
        }
        this.mContainerView.setAlpha(1.0f);
        this.mContainerView.setTranslationY(0.0f);
        this.mShowListener.onAnimationEnd(null);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void hide() {
        if (this.mCurrentShowAnim != null) {
            this.mCurrentShowAnim.end();
        }
        if (this.mContainerView.getVisibility() == 8) {
            return;
        }
        if (this.mShowHideAnimationEnabled) {
            this.mContainerView.setAlpha(1.0f);
            this.mContainerView.setTransitioning(true);
            AnimatorSet anim = new AnimatorSet();
            AnimatorSet.Builder b = anim.play(ObjectAnimator.ofFloat(this.mContainerView, "alpha", 0.0f));
            if (this.mContentView != null) {
                b.with(ObjectAnimator.ofFloat(this.mContentView, "translationY", 0.0f, -this.mContainerView.getHeight()));
                b.with(ObjectAnimator.ofFloat(this.mContainerView, "translationY", -this.mContainerView.getHeight()));
            }
            if (this.mSplitView != null && this.mSplitView.getVisibility() == 0) {
                this.mSplitView.setAlpha(1.0f);
                b.with(ObjectAnimator.ofFloat(this.mSplitView, "alpha", 0.0f));
            }
            anim.addListener(this.mHideListener);
            this.mCurrentShowAnim = anim;
            anim.start();
            return;
        }
        this.mHideListener.onAnimationEnd(null);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public boolean isShowing() {
        return this.mContainerView.getVisibility() == 0;
    }

    void animateToMode(boolean toActionMode) {
        if (toActionMode) {
            show(false);
        }
        if (this.mCurrentModeAnim != null) {
            this.mCurrentModeAnim.end();
        }
        this.mActionView.animateToVisibility(toActionMode ? 8 : 0);
        this.mContextView.animateToVisibility(toActionMode ? 0 : 8);
        if (this.mTabScrollView != null && !this.mActionView.hasEmbeddedTabs() && this.mActionView.isCollapsed()) {
            this.mTabScrollView.animateToVisibility(toActionMode ? 8 : 0);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public Context getThemedContext() {
        if (this.mThemedContext == null) {
            TypedValue outValue = new TypedValue();
            Resources.Theme currentTheme = this.mContext.getTheme();
            currentTheme.resolveAttribute(com.actionbarsherlock.R.attr.actionBarWidgetTheme, outValue, true);
            int targetThemeRes = outValue.resourceId;
            if (targetThemeRes != 0) {
                this.mThemedContext = new ContextThemeWrapper(this.mContext, targetThemeRes);
            } else {
                this.mThemedContext = this.mContext;
            }
        }
        return this.mThemedContext;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/app/ActionBarImpl$ActionModeImpl.class */
    public class ActionModeImpl extends ActionMode implements MenuBuilder.Callback {
        private ActionMode.Callback mCallback;
        private MenuBuilder mMenu;
        private WeakReference<View> mCustomView;

        public ActionModeImpl(ActionMode.Callback callback) {
            this.mCallback = callback;
            this.mMenu = new MenuBuilder(ActionBarImpl.this.getThemedContext()).setDefaultShowAsAction(1);
            this.mMenu.setCallback(this);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public MenuInflater getMenuInflater() {
            return new MenuInflater(ActionBarImpl.this.getThemedContext());
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public Menu getMenu() {
            return this.mMenu;
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void finish() {
            if (ActionBarImpl.this.mActionMode != this) {
                return;
            }
            if (ActionBarImpl.this.mWasHiddenBeforeMode) {
                ActionBarImpl.this.mDeferredDestroyActionMode = this;
                ActionBarImpl.this.mDeferredModeDestroyCallback = this.mCallback;
            } else {
                this.mCallback.onDestroyActionMode(this);
            }
            this.mCallback = null;
            ActionBarImpl.this.animateToMode(false);
            ActionBarImpl.this.mContextView.closeMode();
            ActionBarImpl.this.mActionView.sendAccessibilityEvent(32);
            ActionBarImpl.this.mActionMode = null;
            if (ActionBarImpl.this.mWasHiddenBeforeMode) {
                ActionBarImpl.this.hide();
            }
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void invalidate() {
            this.mMenu.stopDispatchingItemsChanged();
            try {
                this.mCallback.onPrepareActionMode(this, this.mMenu);
            } finally {
                this.mMenu.startDispatchingItemsChanged();
            }
        }

        public boolean dispatchOnCreate() {
            this.mMenu.stopDispatchingItemsChanged();
            try {
                return this.mCallback.onCreateActionMode(this, this.mMenu);
            } finally {
                this.mMenu.startDispatchingItemsChanged();
            }
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setCustomView(View view) {
            ActionBarImpl.this.mContextView.setCustomView(view);
            this.mCustomView = new WeakReference<>(view);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setSubtitle(CharSequence subtitle) {
            ActionBarImpl.this.mContextView.setSubtitle(subtitle);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setTitle(CharSequence title) {
            ActionBarImpl.this.mContextView.setTitle(title);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setTitle(int resId) {
            setTitle(ActionBarImpl.this.mContext.getResources().getString(resId));
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setSubtitle(int resId) {
            setSubtitle(ActionBarImpl.this.mContext.getResources().getString(resId));
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public CharSequence getTitle() {
            return ActionBarImpl.this.mContextView.getTitle();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public CharSequence getSubtitle() {
            return ActionBarImpl.this.mContextView.getSubtitle();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public View getCustomView() {
            if (this.mCustomView != null) {
                return this.mCustomView.get();
            }
            return null;
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
        public boolean onMenuItemSelected(MenuBuilder menu, MenuItem item) {
            if (this.mCallback != null) {
                return this.mCallback.onActionItemClicked(this, item);
            }
            return false;
        }

        public void onCloseMenu(MenuBuilder menu, boolean allMenusAreClosing) {
        }

        public boolean onSubMenuSelected(SubMenuBuilder subMenu) {
            if (this.mCallback == null) {
                return false;
            }
            if (!subMenu.hasVisibleItems()) {
                return true;
            }
            new MenuPopupHelper(ActionBarImpl.this.getThemedContext(), subMenu).show();
            return true;
        }

        public void onCloseSubMenu(SubMenuBuilder menu) {
        }

        @Override // com.actionbarsherlock.internal.view.menu.MenuBuilder.Callback
        public void onMenuModeChange(MenuBuilder menu) {
            if (this.mCallback == null) {
                return;
            }
            invalidate();
            ActionBarImpl.this.mContextView.showOverflowMenu();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/app/ActionBarImpl$TabImpl.class */
    public class TabImpl extends ActionBar.Tab {
        private ActionBar.TabListener mCallback;
        private Object mTag;
        private Drawable mIcon;
        private CharSequence mText;
        private CharSequence mContentDesc;
        private int mPosition = -1;
        private View mCustomView;

        public TabImpl() {
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public Object getTag() {
            return this.mTag;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setTag(Object tag) {
            this.mTag = tag;
            return this;
        }

        public ActionBar.TabListener getCallback() {
            return this.mCallback;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setTabListener(ActionBar.TabListener callback) {
            this.mCallback = callback;
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public View getCustomView() {
            return this.mCustomView;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setCustomView(View view) {
            this.mCustomView = view;
            if (this.mPosition >= 0) {
                ActionBarImpl.this.mTabScrollView.updateTab(this.mPosition);
            }
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setCustomView(int layoutResId) {
            return setCustomView(LayoutInflater.from(ActionBarImpl.this.getThemedContext()).inflate(layoutResId, (ViewGroup) null));
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public Drawable getIcon() {
            return this.mIcon;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public int getPosition() {
            return this.mPosition;
        }

        public void setPosition(int position) {
            this.mPosition = position;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public CharSequence getText() {
            return this.mText;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setIcon(Drawable icon) {
            this.mIcon = icon;
            if (this.mPosition >= 0) {
                ActionBarImpl.this.mTabScrollView.updateTab(this.mPosition);
            }
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setIcon(int resId) {
            return setIcon(ActionBarImpl.this.mContext.getResources().getDrawable(resId));
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setText(CharSequence text) {
            this.mText = text;
            if (this.mPosition >= 0) {
                ActionBarImpl.this.mTabScrollView.updateTab(this.mPosition);
            }
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setText(int resId) {
            return setText(ActionBarImpl.this.mContext.getResources().getText(resId));
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public void select() {
            ActionBarImpl.this.selectTab(this);
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setContentDescription(int resId) {
            return setContentDescription(ActionBarImpl.this.mContext.getResources().getText(resId));
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setContentDescription(CharSequence contentDesc) {
            this.mContentDesc = contentDesc;
            if (this.mPosition >= 0) {
                ActionBarImpl.this.mTabScrollView.updateTab(this.mPosition);
            }
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public CharSequence getContentDescription() {
            return this.mContentDesc;
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(View view) {
        this.mActionView.setCustomNavigationView(view);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(View view, ActionBar.LayoutParams layoutParams) {
        view.setLayoutParams(layoutParams);
        this.mActionView.setCustomNavigationView(view);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setListNavigationCallbacks(SpinnerAdapter adapter, ActionBar.OnNavigationListener callback) {
        this.mActionView.setDropdownAdapter(adapter);
        this.mActionView.setCallback(callback);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getSelectedNavigationIndex() {
        switch (this.mActionView.getNavigationMode()) {
            case 1:
                return this.mActionView.getDropdownSelectedPosition();
            case 2:
                if (this.mSelectedTab != null) {
                    return this.mSelectedTab.getPosition();
                }
                return -1;
            default:
                return -1;
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getNavigationItemCount() {
        switch (this.mActionView.getNavigationMode()) {
            case 1:
                SpinnerAdapter adapter = this.mActionView.getDropdownAdapter();
                if (adapter != null) {
                    return adapter.getCount();
                }
                return 0;
            case 2:
                return this.mTabs.size();
            default:
                return 0;
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getTabCount() {
        return this.mTabs.size();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setNavigationMode(int mode) {
        int oldMode = this.mActionView.getNavigationMode();
        switch (oldMode) {
            case 2:
                this.mSavedTabPosition = getSelectedNavigationIndex();
                selectTab(null);
                this.mTabScrollView.setVisibility(8);
                break;
        }
        this.mActionView.setNavigationMode(mode);
        switch (mode) {
            case 2:
                ensureTabsExist();
                this.mTabScrollView.setVisibility(0);
                if (this.mSavedTabPosition != -1) {
                    setSelectedNavigationItem(this.mSavedTabPosition);
                    this.mSavedTabPosition = -1;
                    break;
                }
                break;
        }
        this.mActionView.setCollapsable(mode == 2 && !this.mHasEmbeddedTabs);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab getTabAt(int index) {
        return this.mTabs.get(index);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setIcon(int resId) {
        this.mActionView.setIcon(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setIcon(Drawable icon) {
        this.mActionView.setIcon(icon);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setLogo(int resId) {
        this.mActionView.setLogo(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setLogo(Drawable logo) {
        this.mActionView.setLogo(logo);
    }
}
