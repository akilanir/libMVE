package com.actionbarsherlock.internal.app;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.widget.SpinnerAdapter;
import com.actionbarsherlock.app.ActionBar;
import java.util.HashSet;
import java.util.Set;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/app/ActionBarWrapper.class */
public class ActionBarWrapper extends ActionBar implements ActionBar.OnNavigationListener, ActionBar.OnMenuVisibilityListener {
    private final Activity mActivity;
    private final android.app.ActionBar mActionBar;
    private ActionBar.OnNavigationListener mNavigationListener;
    private Set<ActionBar.OnMenuVisibilityListener> mMenuVisibilityListeners = new HashSet(1);
    private FragmentTransaction mFragmentTransaction;

    public ActionBarWrapper(Activity activity) {
        this.mActivity = activity;
        this.mActionBar = activity.getActionBar();
        if (this.mActionBar != null) {
            this.mActionBar.addOnMenuVisibilityListener(this);
            int displayOptions = this.mActionBar.getDisplayOptions();
            this.mActionBar.setHomeButtonEnabled((displayOptions & 4) != 0);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setHomeButtonEnabled(boolean enabled) {
        this.mActionBar.setHomeButtonEnabled(enabled);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public Context getThemedContext() {
        return this.mActionBar.getThemedContext();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(View view) {
        this.mActionBar.setCustomView(view);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(View view, ActionBar.LayoutParams layoutParams) {
        ActionBar.LayoutParams lp = new ActionBar.LayoutParams(layoutParams);
        lp.gravity = layoutParams.gravity;
        lp.bottomMargin = layoutParams.bottomMargin;
        lp.topMargin = layoutParams.topMargin;
        lp.leftMargin = layoutParams.leftMargin;
        lp.rightMargin = layoutParams.rightMargin;
        this.mActionBar.setCustomView(view, lp);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setCustomView(int resId) {
        this.mActionBar.setCustomView(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setIcon(int resId) {
        this.mActionBar.setIcon(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setIcon(Drawable icon) {
        this.mActionBar.setIcon(icon);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setLogo(int resId) {
        this.mActionBar.setLogo(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setLogo(Drawable logo) {
        this.mActionBar.setLogo(logo);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setListNavigationCallbacks(SpinnerAdapter adapter, ActionBar.OnNavigationListener callback) {
        this.mNavigationListener = callback;
        this.mActionBar.setListNavigationCallbacks(adapter, callback != null ? this : null);
    }

    @Override // android.app.ActionBar.OnNavigationListener
    public boolean onNavigationItemSelected(int itemPosition, long itemId) {
        return this.mNavigationListener.onNavigationItemSelected(itemPosition, itemId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSelectedNavigationItem(int position) {
        this.mActionBar.setSelectedNavigationItem(position);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getSelectedNavigationIndex() {
        return this.mActionBar.getSelectedNavigationIndex();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getNavigationItemCount() {
        return this.mActionBar.getNavigationItemCount();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setTitle(CharSequence title) {
        this.mActionBar.setTitle(title);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setTitle(int resId) {
        this.mActionBar.setTitle(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSubtitle(CharSequence subtitle) {
        this.mActionBar.setSubtitle(subtitle);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSubtitle(int resId) {
        this.mActionBar.setSubtitle(resId);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayOptions(int options) {
        this.mActionBar.setDisplayOptions(options);
        this.mActionBar.setHomeButtonEnabled((options & 4) != 0);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayOptions(int options, int mask) {
        this.mActionBar.setDisplayOptions(options, mask);
        if ((mask & 4) != 0) {
            this.mActionBar.setHomeButtonEnabled((options & 4) != 0);
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayUseLogoEnabled(boolean useLogo) {
        this.mActionBar.setDisplayUseLogoEnabled(useLogo);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowHomeEnabled(boolean showHome) {
        this.mActionBar.setDisplayShowHomeEnabled(showHome);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayHomeAsUpEnabled(boolean showHomeAsUp) {
        this.mActionBar.setDisplayHomeAsUpEnabled(showHomeAsUp);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowTitleEnabled(boolean showTitle) {
        this.mActionBar.setDisplayShowTitleEnabled(showTitle);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setDisplayShowCustomEnabled(boolean showCustom) {
        this.mActionBar.setDisplayShowCustomEnabled(showCustom);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setBackgroundDrawable(Drawable d) {
        this.mActionBar.setBackgroundDrawable(d);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setStackedBackgroundDrawable(Drawable d) {
        this.mActionBar.setStackedBackgroundDrawable(d);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setSplitBackgroundDrawable(Drawable d) {
        this.mActionBar.setSplitBackgroundDrawable(d);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public View getCustomView() {
        return this.mActionBar.getCustomView();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public CharSequence getTitle() {
        return this.mActionBar.getTitle();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public CharSequence getSubtitle() {
        return this.mActionBar.getSubtitle();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getNavigationMode() {
        return this.mActionBar.getNavigationMode();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void setNavigationMode(int mode) {
        this.mActionBar.setNavigationMode(mode);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getDisplayOptions() {
        return this.mActionBar.getDisplayOptions();
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/app/ActionBarWrapper$TabWrapper.class */
    public class TabWrapper extends ActionBar.Tab implements ActionBar.TabListener {
        final ActionBar.Tab mNativeTab;
        private Object mTag;
        private ActionBar.TabListener mListener;

        public TabWrapper(ActionBar.Tab nativeTab) {
            this.mNativeTab = nativeTab;
            this.mNativeTab.setTag(this);
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public int getPosition() {
            return this.mNativeTab.getPosition();
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public Drawable getIcon() {
            return this.mNativeTab.getIcon();
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public CharSequence getText() {
            return this.mNativeTab.getText();
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setIcon(Drawable icon) {
            this.mNativeTab.setIcon(icon);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setIcon(int resId) {
            this.mNativeTab.setIcon(resId);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setText(CharSequence text) {
            this.mNativeTab.setText(text);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setText(int resId) {
            this.mNativeTab.setText(resId);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setCustomView(View view) {
            this.mNativeTab.setCustomView(view);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setCustomView(int layoutResId) {
            this.mNativeTab.setCustomView(layoutResId);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public View getCustomView() {
            return this.mNativeTab.getCustomView();
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setTag(Object obj) {
            this.mTag = obj;
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public Object getTag() {
            return this.mTag;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setTabListener(ActionBar.TabListener listener) {
            this.mNativeTab.setTabListener(listener != null ? this : null);
            this.mListener = listener;
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public void select() {
            this.mNativeTab.select();
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setContentDescription(int resId) {
            this.mNativeTab.setContentDescription(resId);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public ActionBar.Tab setContentDescription(CharSequence contentDesc) {
            this.mNativeTab.setContentDescription(contentDesc);
            return this;
        }

        @Override // com.actionbarsherlock.app.ActionBar.Tab
        public CharSequence getContentDescription() {
            return this.mNativeTab.getContentDescription();
        }

        @Override // android.app.ActionBar.TabListener
        public void onTabReselected(ActionBar.Tab tab, android.app.FragmentTransaction ft) {
            if (this.mListener != null) {
                FragmentTransaction trans = null;
                if (ActionBarWrapper.this.mActivity instanceof FragmentActivity) {
                    trans = ActionBarWrapper.this.mActivity.getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
                }
                this.mListener.onTabReselected(this, trans);
                if (trans != null && !trans.isEmpty()) {
                    trans.commit();
                }
            }
        }

        @Override // android.app.ActionBar.TabListener
        public void onTabSelected(ActionBar.Tab tab, android.app.FragmentTransaction ft) {
            if (this.mListener != null) {
                if (ActionBarWrapper.this.mFragmentTransaction == null && (ActionBarWrapper.this.mActivity instanceof FragmentActivity)) {
                    ActionBarWrapper.this.mFragmentTransaction = ActionBarWrapper.this.mActivity.getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
                }
                this.mListener.onTabSelected(this, ActionBarWrapper.this.mFragmentTransaction);
                if (ActionBarWrapper.this.mFragmentTransaction != null) {
                    if (!ActionBarWrapper.this.mFragmentTransaction.isEmpty()) {
                        ActionBarWrapper.this.mFragmentTransaction.commit();
                    }
                    ActionBarWrapper.this.mFragmentTransaction = null;
                }
            }
        }

        @Override // android.app.ActionBar.TabListener
        public void onTabUnselected(ActionBar.Tab tab, android.app.FragmentTransaction ft) {
            if (this.mListener != null) {
                FragmentTransaction trans = null;
                if (ActionBarWrapper.this.mActivity instanceof FragmentActivity) {
                    trans = ActionBarWrapper.this.mActivity.getSupportFragmentManager().beginTransaction().disallowAddToBackStack();
                    ActionBarWrapper.this.mFragmentTransaction = trans;
                }
                this.mListener.onTabUnselected(this, trans);
            }
        }
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab newTab() {
        return new TabWrapper(this.mActionBar.newTab());
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab) {
        this.mActionBar.addTab(((TabWrapper) tab).mNativeTab);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, boolean setSelected) {
        this.mActionBar.addTab(((TabWrapper) tab).mNativeTab, setSelected);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, int position) {
        this.mActionBar.addTab(((TabWrapper) tab).mNativeTab, position);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addTab(ActionBar.Tab tab, int position, boolean setSelected) {
        this.mActionBar.addTab(((TabWrapper) tab).mNativeTab, position, setSelected);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeTab(ActionBar.Tab tab) {
        this.mActionBar.removeTab(((TabWrapper) tab).mNativeTab);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeTabAt(int position) {
        this.mActionBar.removeTabAt(position);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeAllTabs() {
        this.mActionBar.removeAllTabs();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void selectTab(ActionBar.Tab tab) {
        this.mActionBar.selectTab(((TabWrapper) tab).mNativeTab);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab getSelectedTab() {
        ActionBar.Tab selected = this.mActionBar.getSelectedTab();
        if (selected != null) {
            return (ActionBar.Tab) selected.getTag();
        }
        return null;
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public ActionBar.Tab getTabAt(int index) {
        ActionBar.Tab selected = this.mActionBar.getTabAt(index);
        if (selected != null) {
            return (ActionBar.Tab) selected.getTag();
        }
        return null;
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getTabCount() {
        return this.mActionBar.getTabCount();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public int getHeight() {
        return this.mActionBar.getHeight();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void show() {
        this.mActionBar.show();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void hide() {
        this.mActionBar.hide();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public boolean isShowing() {
        return this.mActionBar.isShowing();
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void addOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener listener) {
        this.mMenuVisibilityListeners.add(listener);
    }

    @Override // com.actionbarsherlock.app.ActionBar
    public void removeOnMenuVisibilityListener(ActionBar.OnMenuVisibilityListener listener) {
        this.mMenuVisibilityListeners.remove(listener);
    }

    @Override // android.app.ActionBar.OnMenuVisibilityListener
    public void onMenuVisibilityChanged(boolean isVisible) {
        for (ActionBar.OnMenuVisibilityListener listener : this.mMenuVisibilityListeners) {
            listener.onMenuVisibilityChanged(isVisible);
        }
    }
}
