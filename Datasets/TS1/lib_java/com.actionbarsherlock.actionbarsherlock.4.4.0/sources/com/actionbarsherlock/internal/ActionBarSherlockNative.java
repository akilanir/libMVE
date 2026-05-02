package com.actionbarsherlock.internal;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.app.ActionBarWrapper;
import com.actionbarsherlock.internal.view.menu.MenuItemWrapper;
import com.actionbarsherlock.internal.view.menu.MenuWrapper;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.MenuInflater;

@ActionBarSherlock.Implementation(api = 14)
/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ActionBarSherlockNative.class */
public class ActionBarSherlockNative extends ActionBarSherlock {
    private ActionBarWrapper mActionBar;
    private ActionModeWrapper mActionMode;
    private MenuWrapper mMenu;

    public ActionBarSherlockNative(Activity activity, int flags) {
        super(activity, flags);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public ActionBar getActionBar() {
        initActionBar();
        return this.mActionBar;
    }

    private void initActionBar() {
        if (this.mActionBar != null || this.mActivity.getActionBar() == null) {
            return;
        }
        this.mActionBar = new ActionBarWrapper(this.mActivity);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void dispatchInvalidateOptionsMenu() {
        this.mActivity.getWindow().invalidatePanelMenu(0);
        if (this.mMenu != null) {
            this.mMenu.invalidate();
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchCreateOptionsMenu(Menu menu) {
        if (this.mMenu == null || menu != this.mMenu.unwrap()) {
            this.mMenu = new MenuWrapper(menu);
        }
        boolean result = callbackCreateOptionsMenu(this.mMenu);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean result = callbackPrepareOptionsMenu(this.mMenu);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean dispatchOptionsItemSelected(MenuItem item) {
        com.actionbarsherlock.view.MenuItem wrapped;
        if (this.mMenu == null) {
            if (item.getItemId() != 16908332) {
                throw new IllegalStateException("Non-home action item clicked before onCreateOptionsMenu with ID " + item.getItemId());
            }
            wrapped = new MenuItemWrapper(item);
        } else {
            wrapped = this.mMenu.findItem(item);
        }
        boolean result = callbackOptionsItemSelected(wrapped);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean hasFeature(int feature) {
        boolean result = this.mActivity.getWindow().hasFeature(feature);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public boolean requestFeature(int featureId) {
        boolean result = this.mActivity.getWindow().requestFeature(featureId);
        return result;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setUiOptions(int uiOptions) {
        this.mActivity.getWindow().setUiOptions(uiOptions);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setUiOptions(int uiOptions, int mask) {
        this.mActivity.getWindow().setUiOptions(uiOptions, mask);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setContentView(int layoutResId) {
        this.mActivity.getWindow().setContentView(layoutResId);
        initActionBar();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setContentView(View view, ViewGroup.LayoutParams params) {
        this.mActivity.getWindow().setContentView(view, params);
        initActionBar();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        this.mActivity.getWindow().addContentView(view, params);
        initActionBar();
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setTitle(CharSequence title) {
        this.mActivity.getWindow().setTitle(title);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarVisibility(boolean visible) {
        this.mActivity.setProgressBarVisibility(visible);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarIndeterminateVisibility(boolean visible) {
        this.mActivity.setProgressBarIndeterminateVisibility(visible);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgressBarIndeterminate(boolean indeterminate) {
        this.mActivity.setProgressBarIndeterminate(indeterminate);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setProgress(int progress) {
        this.mActivity.setProgress(progress);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public void setSecondaryProgress(int secondaryProgress) {
        this.mActivity.setSecondaryProgress(secondaryProgress);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    protected Context getThemedContext() {
        Context context = this.mActivity;
        TypedValue outValue = new TypedValue();
        this.mActivity.getTheme().resolveAttribute(R.attr.actionBarWidgetTheme, outValue, true);
        if (outValue.resourceId != 0) {
            context = new ContextThemeWrapper(context, outValue.resourceId);
        }
        return context;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock
    public ActionMode startActionMode(ActionMode.Callback callback) {
        if (this.mActionMode != null) {
            this.mActionMode.finish();
        }
        ActionModeCallbackWrapper wrapped = null;
        if (callback != null) {
            wrapped = new ActionModeCallbackWrapper(callback);
        }
        if (this.mActivity.startActionMode(wrapped) == null) {
            this.mActionMode = null;
        }
        if ((this.mActivity instanceof ActionBarSherlock.OnActionModeStartedListener) && this.mActionMode != null) {
            ((ActionBarSherlock.OnActionModeStartedListener) this.mActivity).onActionModeStarted(this.mActionMode);
        }
        return this.mActionMode;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ActionBarSherlockNative$ActionModeCallbackWrapper.class */
    private class ActionModeCallbackWrapper implements ActionMode.Callback {
        private final ActionMode.Callback mCallback;

        public ActionModeCallbackWrapper(ActionMode.Callback callback) {
            this.mCallback = callback;
        }

        @Override // android.view.ActionMode.Callback
        public boolean onCreateActionMode(android.view.ActionMode mode, Menu menu) {
            ActionBarSherlockNative.this.mActionMode = ActionBarSherlockNative.this.new ActionModeWrapper(mode);
            return this.mCallback.onCreateActionMode(ActionBarSherlockNative.this.mActionMode, ActionBarSherlockNative.this.mActionMode.getMenu());
        }

        @Override // android.view.ActionMode.Callback
        public boolean onPrepareActionMode(android.view.ActionMode mode, Menu menu) {
            return this.mCallback.onPrepareActionMode(ActionBarSherlockNative.this.mActionMode, ActionBarSherlockNative.this.mActionMode.getMenu());
        }

        @Override // android.view.ActionMode.Callback
        public boolean onActionItemClicked(android.view.ActionMode mode, MenuItem item) {
            return this.mCallback.onActionItemClicked(ActionBarSherlockNative.this.mActionMode, ActionBarSherlockNative.this.mActionMode.getMenu().findItem(item));
        }

        @Override // android.view.ActionMode.Callback
        public void onDestroyActionMode(android.view.ActionMode mode) {
            this.mCallback.onDestroyActionMode(ActionBarSherlockNative.this.mActionMode);
            if (ActionBarSherlockNative.this.mActivity instanceof ActionBarSherlock.OnActionModeFinishedListener) {
                ((ActionBarSherlock.OnActionModeFinishedListener) ActionBarSherlockNative.this.mActivity).onActionModeFinished(ActionBarSherlockNative.this.mActionMode);
            }
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/ActionBarSherlockNative$ActionModeWrapper.class */
    private class ActionModeWrapper extends com.actionbarsherlock.view.ActionMode {
        private final android.view.ActionMode mActionMode;
        private MenuWrapper mMenu = null;

        ActionModeWrapper(android.view.ActionMode actionMode) {
            this.mActionMode = actionMode;
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setTitle(CharSequence title) {
            this.mActionMode.setTitle(title);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setTitle(int resId) {
            this.mActionMode.setTitle(resId);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setSubtitle(CharSequence subtitle) {
            this.mActionMode.setSubtitle(subtitle);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setSubtitle(int resId) {
            this.mActionMode.setSubtitle(resId);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setCustomView(View view) {
            this.mActionMode.setCustomView(view);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void invalidate() {
            this.mActionMode.invalidate();
            if (this.mMenu != null) {
                this.mMenu.invalidate();
            }
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void finish() {
            this.mActionMode.finish();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public MenuWrapper getMenu() {
            if (this.mMenu == null) {
                this.mMenu = new MenuWrapper(this.mActionMode.getMenu());
            }
            return this.mMenu;
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public CharSequence getTitle() {
            return this.mActionMode.getTitle();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public CharSequence getSubtitle() {
            return this.mActionMode.getSubtitle();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public View getCustomView() {
            return this.mActionMode.getCustomView();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public MenuInflater getMenuInflater() {
            return ActionBarSherlockNative.this.getMenuInflater();
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public void setTag(Object tag) {
            this.mActionMode.setTag(tag);
        }

        @Override // com.actionbarsherlock.view.ActionMode
        public Object getTag() {
            return this.mActionMode.getTag();
        }
    }
}
