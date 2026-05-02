package com.rey.material.app;

import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentManager;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatDelegate;
import android.support.v7.widget.ActionMenuView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.NavigationDrawerDrawable;
import com.rey.material.drawable.ToolbarRippleDrawable;
import com.rey.material.util.ViewUtil;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager.class */
public class ToolbarManager {
    private AppCompatDelegate mAppCompatDelegate;
    private Toolbar mToolbar;
    private int mRippleStyle;
    private Animator mAnimator;
    private ActionMenuView mMenuView;
    private ToolbarRippleDrawable.Builder mBuilder;
    private int mCurrentGroup;
    private boolean mGroupChanged;
    private boolean mMenuDataChanged;
    private ArrayList<WeakReference<OnToolbarGroupChangedListener>> mListeners;
    private ViewTreeObserver.OnGlobalLayoutListener mOnGlobalLayoutListener;
    private ArrayList<Animation> mAnimations;
    private Animation.AnimationListener mOutAnimationEndListener;
    private NavigationManager mNavigationManager;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$Animator.class */
    public interface Animator {
        Animation getOutAnimation(View view, int i);

        Animation getInAnimation(View view, int i);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$OnToolbarGroupChangedListener.class */
    public interface OnToolbarGroupChangedListener {
        void onToolbarGroupChanged(int i, int i2);
    }

    public ToolbarManager(AppCompatDelegate delegate, Toolbar toolbar, int defaultGroupId, int rippleStyle, int animIn, int animOut) {
        this(delegate, toolbar, defaultGroupId, rippleStyle, new SimpleAnimator(animIn, animOut));
    }

    public ToolbarManager(AppCompatDelegate delegate, Toolbar toolbar, int defaultGroupId, int rippleStyle, Animator animator) {
        this.mCurrentGroup = 0;
        this.mGroupChanged = false;
        this.mMenuDataChanged = true;
        this.mListeners = new ArrayList<>();
        this.mOnGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.rey.material.app.ToolbarManager.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                ToolbarManager.this.onGlobalLayout();
            }
        };
        this.mAnimations = new ArrayList<>();
        this.mOutAnimationEndListener = new Animation.AnimationListener() { // from class: com.rey.material.app.ToolbarManager.2
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                if (ToolbarManager.this.mAppCompatDelegate != null) {
                    ToolbarManager.this.mAppCompatDelegate.invalidateOptionsMenu();
                } else {
                    ToolbarManager.this.onPrepareMenu();
                }
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }
        };
        this.mAppCompatDelegate = delegate;
        this.mToolbar = toolbar;
        this.mCurrentGroup = defaultGroupId;
        this.mRippleStyle = rippleStyle;
        this.mAnimator = animator;
        this.mAppCompatDelegate.setSupportActionBar(toolbar);
    }

    public void registerOnToolbarGroupChangedListener(OnToolbarGroupChangedListener listener) {
        for (int i = this.mListeners.size() - 1; i >= 0; i--) {
            WeakReference<OnToolbarGroupChangedListener> ref = this.mListeners.get(i);
            if (ref.get() == null) {
                this.mListeners.remove(i);
            } else if (ref.get() == listener) {
                return;
            }
        }
        this.mListeners.add(new WeakReference<>(listener));
    }

    public void unregisterOnToolbarGroupChangedListener(OnToolbarGroupChangedListener listener) {
        for (int i = this.mListeners.size() - 1; i >= 0; i--) {
            WeakReference<OnToolbarGroupChangedListener> ref = this.mListeners.get(i);
            if (ref.get() == null || ref.get() == listener) {
                this.mListeners.remove(i);
            }
        }
    }

    private void dispatchOnToolbarGroupChanged(int oldGroupId, int groupId) {
        for (int i = this.mListeners.size() - 1; i >= 0; i--) {
            WeakReference<OnToolbarGroupChangedListener> ref = this.mListeners.get(i);
            if (ref.get() == null) {
                this.mListeners.remove(i);
            } else {
                ref.get().onToolbarGroupChanged(oldGroupId, groupId);
            }
        }
    }

    public int getCurrentGroup() {
        return this.mCurrentGroup;
    }

    public void setCurrentGroup(int groupId) {
        if (this.mCurrentGroup != groupId) {
            int oldGroupId = this.mCurrentGroup;
            this.mCurrentGroup = groupId;
            this.mGroupChanged = true;
            dispatchOnToolbarGroupChanged(oldGroupId, this.mCurrentGroup);
            animateOut();
        }
    }

    public void createMenu(int menuId) {
        this.mToolbar.inflateMenu(menuId);
        this.mMenuDataChanged = true;
        if (this.mAppCompatDelegate == null) {
            onPrepareMenu();
        }
    }

    public void onPrepareMenu() {
        if (this.mGroupChanged || this.mMenuDataChanged) {
            this.mToolbar.getViewTreeObserver().addOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
            Menu menu = this.mToolbar.getMenu();
            int count = menu.size();
            for (int i = 0; i < count; i++) {
                MenuItem item = menu.getItem(i);
                item.setVisible(item.getGroupId() == this.mCurrentGroup || item.getGroupId() == 0);
            }
            this.mMenuDataChanged = false;
        }
    }

    public void setNavigationManager(NavigationManager navigationManager) {
        this.mNavigationManager = navigationManager;
        notifyNavigationStateInvalidated();
    }

    public void notifyNavigationStateInvalidated() {
        if (this.mNavigationManager != null) {
            this.mNavigationManager.notifyStateInvalidated();
        }
    }

    public void notifyNavigationStateChanged() {
        if (this.mNavigationManager != null) {
            this.mNavigationManager.notifyStateChanged();
        }
    }

    public void notifyNavigationStateProgressChanged(boolean isBackState, float progress) {
        if (this.mNavigationManager != null) {
            this.mNavigationManager.notifyStateProgressChanged(isBackState, progress);
        }
    }

    public boolean isNavigationBackState() {
        return this.mNavigationManager != null && this.mNavigationManager.isBackState();
    }

    private ToolbarRippleDrawable getBackground() {
        if (this.mBuilder == null) {
            this.mBuilder = new ToolbarRippleDrawable.Builder(this.mToolbar.getContext(), this.mRippleStyle);
        }
        return this.mBuilder.build();
    }

    private ActionMenuView getMenuView() {
        if (this.mMenuView == null) {
            int i = 0;
            while (true) {
                if (i >= this.mToolbar.getChildCount()) {
                    break;
                }
                ActionMenuView childAt = this.mToolbar.getChildAt(i);
                if (!(childAt instanceof ActionMenuView)) {
                    i++;
                } else {
                    this.mMenuView = childAt;
                    break;
                }
            }
        }
        return this.mMenuView;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onGlobalLayout() {
        if (Build.VERSION.SDK_INT >= 16) {
            this.mToolbar.getViewTreeObserver().removeOnGlobalLayoutListener(this.mOnGlobalLayoutListener);
        } else {
            this.mToolbar.getViewTreeObserver().removeGlobalOnLayoutListener(this.mOnGlobalLayoutListener);
        }
        ActionMenuView menuView = getMenuView();
        int count = menuView == null ? 0 : menuView.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = menuView.getChildAt(i);
            if (this.mRippleStyle != 0 && (child.getBackground() == null || !(child.getBackground() instanceof ToolbarRippleDrawable))) {
                ViewUtil.setBackground(child, getBackground());
            }
        }
        if (this.mGroupChanged) {
            animateIn();
            this.mGroupChanged = false;
        }
    }

    private void animateOut() {
        ActionMenuView menuView = getMenuView();
        int count = menuView == null ? 0 : menuView.getChildCount();
        Animation slowestAnimation = null;
        this.mAnimations.clear();
        this.mAnimations.ensureCapacity(count);
        for (int i = 0; i < count; i++) {
            View child = menuView.getChildAt(i);
            Animation anim = this.mAnimator.getOutAnimation(child, i);
            this.mAnimations.add(anim);
            if (anim != null && (slowestAnimation == null || slowestAnimation.getStartOffset() + slowestAnimation.getDuration() < anim.getStartOffset() + anim.getDuration())) {
                slowestAnimation = anim;
            }
        }
        if (slowestAnimation == null) {
            this.mOutAnimationEndListener.onAnimationEnd(null);
        } else {
            slowestAnimation.setAnimationListener(this.mOutAnimationEndListener);
            for (int i2 = 0; i2 < count; i2++) {
                Animation anim2 = this.mAnimations.get(i2);
                if (anim2 != null) {
                    menuView.getChildAt(i2).startAnimation(anim2);
                }
            }
        }
        this.mAnimations.clear();
    }

    private void animateIn() {
        ActionMenuView menuView = getMenuView();
        int count = menuView == null ? 0 : menuView.getChildCount();
        for (int i = 0; i < count; i++) {
            View child = menuView.getChildAt(i);
            Animation anim = this.mAnimator.getInAnimation(child, i);
            if (anim != null) {
                child.startAnimation(anim);
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$SimpleAnimator.class */
    private static class SimpleAnimator implements Animator {
        private int mAnimationIn;
        private int mAnimationOut;

        public SimpleAnimator(int animIn, int animOut) {
            this.mAnimationIn = animIn;
            this.mAnimationOut = animOut;
        }

        @Override // com.rey.material.app.ToolbarManager.Animator
        public Animation getOutAnimation(View v, int position) {
            if (this.mAnimationOut == 0) {
                return null;
            }
            return AnimationUtils.loadAnimation(v.getContext(), this.mAnimationOut);
        }

        @Override // com.rey.material.app.ToolbarManager.Animator
        public Animation getInAnimation(View v, int position) {
            if (this.mAnimationIn == 0) {
                return null;
            }
            return AnimationUtils.loadAnimation(v.getContext(), this.mAnimationIn);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$NavigationManager.class */
    public static abstract class NavigationManager {
        protected NavigationDrawerDrawable mNavigationIcon;
        protected Toolbar mToolbar;

        public abstract boolean isBackState();

        public abstract void onNavigationClick();

        public NavigationManager(NavigationDrawerDrawable navigationIcon, Toolbar toolbar) {
            this.mToolbar = toolbar;
            this.mNavigationIcon = navigationIcon;
            this.mToolbar.setNavigationIcon(this.mNavigationIcon);
            this.mToolbar.setNavigationOnClickListener(new View.OnClickListener() { // from class: com.rey.material.app.ToolbarManager.NavigationManager.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    NavigationManager.this.onNavigationClick();
                }
            });
        }

        public void notifyStateInvalidated() {
            this.mNavigationIcon.switchIconState(isBackState() ? 1 : 0, false);
        }

        public void notifyStateChanged() {
            this.mNavigationIcon.switchIconState(isBackState() ? 1 : 0, true);
        }

        public void notifyStateProgressChanged(boolean isBackState, float progress) {
            this.mNavigationIcon.setIconState(isBackState ? 1 : 0, progress);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$BaseNavigationManager.class */
    public static class BaseNavigationManager extends NavigationManager {
        protected DrawerLayout mDrawerLayout;
        protected FragmentManager mFragmentManager;

        public BaseNavigationManager(int styleId, FragmentManager fragmentManager, Toolbar toolbar, DrawerLayout drawerLayout) {
            super(new NavigationDrawerDrawable.Builder(toolbar.getContext(), styleId).build(), toolbar);
            this.mDrawerLayout = drawerLayout;
            this.mFragmentManager = fragmentManager;
            if (this.mDrawerLayout != null) {
                this.mDrawerLayout.setDrawerListener(new DrawerLayout.DrawerListener() { // from class: com.rey.material.app.ToolbarManager.BaseNavigationManager.1
                    public void onDrawerSlide(View drawerView, float slideOffset) {
                        BaseNavigationManager.this.onDrawerSlide(drawerView, slideOffset);
                    }

                    public void onDrawerOpened(View drawerView) {
                        BaseNavigationManager.this.onDrawerOpened(drawerView);
                    }

                    public void onDrawerClosed(View drawerView) {
                        BaseNavigationManager.this.onDrawerClosed(drawerView);
                    }

                    public void onDrawerStateChanged(int newState) {
                        BaseNavigationManager.this.onDrawerStateChanged(newState);
                    }
                });
            }
            this.mFragmentManager.addOnBackStackChangedListener(new FragmentManager.OnBackStackChangedListener() { // from class: com.rey.material.app.ToolbarManager.BaseNavigationManager.2
                public void onBackStackChanged() {
                    BaseNavigationManager.this.onFragmentChanged();
                }
            });
        }

        @Override // com.rey.material.app.ToolbarManager.NavigationManager
        public boolean isBackState() {
            return this.mFragmentManager.getBackStackEntryCount() > 1 || (this.mDrawerLayout != null && this.mDrawerLayout.isDrawerOpen(8388611));
        }

        @Override // com.rey.material.app.ToolbarManager.NavigationManager
        public void onNavigationClick() {
        }

        protected boolean shouldSyncDrawerSlidingProgress() {
            if (this.mFragmentManager.getBackStackEntryCount() > 1) {
                return false;
            }
            return true;
        }

        protected void onFragmentChanged() {
            notifyStateChanged();
        }

        protected void onDrawerSlide(View drawerView, float slideOffset) {
            if (!shouldSyncDrawerSlidingProgress()) {
                notifyStateInvalidated();
            } else if (this.mDrawerLayout.isDrawerOpen(8388611)) {
                notifyStateProgressChanged(false, 1.0f - slideOffset);
            } else {
                notifyStateProgressChanged(true, slideOffset);
            }
        }

        protected void onDrawerOpened(View drawerView) {
        }

        protected void onDrawerClosed(View drawerView) {
        }

        protected void onDrawerStateChanged(int newState) {
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ToolbarManager$ThemableNavigationManager.class */
    public static class ThemableNavigationManager extends BaseNavigationManager implements ThemeManager.OnThemeChangedListener {
        private int mStyleId;
        private int mCurrentStyle;

        public ThemableNavigationManager(int styleId, FragmentManager fragmentManager, Toolbar toolbar, DrawerLayout drawerLayout) {
            super(ThemeManager.getInstance().getCurrentStyle(styleId), fragmentManager, toolbar, drawerLayout);
            this.mStyleId = styleId;
            this.mCurrentStyle = ThemeManager.getInstance().getCurrentStyle(styleId);
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
        }

        @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
        public void onThemeChanged(@Nullable ThemeManager.OnThemeChangedEvent event) {
            int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
            if (this.mCurrentStyle != style) {
                this.mCurrentStyle = style;
                NavigationDrawerDrawable drawable = new NavigationDrawerDrawable.Builder(this.mToolbar.getContext(), this.mCurrentStyle).build();
                drawable.switchIconState(this.mNavigationIcon.getIconState(), false);
                this.mNavigationIcon = drawable;
                this.mToolbar.setNavigationIcon(this.mNavigationIcon);
            }
        }
    }
}
