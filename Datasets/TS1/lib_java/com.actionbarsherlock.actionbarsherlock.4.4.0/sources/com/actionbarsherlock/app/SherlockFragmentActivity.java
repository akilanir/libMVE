package com.actionbarsherlock.app;

import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.Watson;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.MenuInflater;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/app/SherlockFragmentActivity.class */
public class SherlockFragmentActivity extends Watson implements ActionBarSherlock.OnActionModeStartedListener, ActionBarSherlock.OnActionModeFinishedListener {
    private static final String TAG = "SherlockFragmentActivity";
    private ActionBarSherlock mSherlock;
    private boolean mIgnoreNativeCreate = false;
    private boolean mIgnoreNativePrepare = false;
    private boolean mIgnoreNativeSelected = false;

    /* JADX WARN: Multi-variable type inference failed */
    protected final ActionBarSherlock getSherlock() {
        if (this.mSherlock == null) {
            this.mSherlock = ActionBarSherlock.wrap(this, 1);
        }
        return this.mSherlock;
    }

    public ActionBar getSupportActionBar() {
        return getSherlock().getActionBar();
    }

    public ActionMode startActionMode(ActionMode.Callback callback) {
        return getSherlock().startActionMode(callback);
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnActionModeStartedListener
    public void onActionModeStarted(ActionMode mode) {
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnActionModeFinishedListener
    public void onActionModeFinished(ActionMode mode) {
    }

    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        getSherlock().dispatchConfigurationChanged(newConfig);
    }

    protected void onPostResume() {
        super.onPostResume();
        getSherlock().dispatchPostResume();
    }

    protected void onPause() {
        getSherlock().dispatchPause();
        super.onPause();
    }

    protected void onStop() {
        getSherlock().dispatchStop();
        super.onStop();
    }

    protected void onDestroy() {
        getSherlock().dispatchDestroy();
        super.onDestroy();
    }

    protected void onPostCreate(Bundle savedInstanceState) {
        getSherlock().dispatchPostCreate(savedInstanceState);
        super.onPostCreate(savedInstanceState);
    }

    protected void onTitleChanged(CharSequence title, int color) {
        getSherlock().dispatchTitleChanged(title, color);
        super.onTitleChanged(title, color);
    }

    public final boolean onMenuOpened(int featureId, Menu menu) {
        if (getSherlock().dispatchMenuOpened(featureId, menu)) {
            return true;
        }
        return super.onMenuOpened(featureId, menu);
    }

    public void onPanelClosed(int featureId, Menu menu) {
        getSherlock().dispatchPanelClosed(featureId, menu);
        super.onPanelClosed(featureId, menu);
    }

    public boolean dispatchKeyEvent(KeyEvent event) {
        if (getSherlock().dispatchKeyEvent(event)) {
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        getSherlock().dispatchSaveInstanceState(outState);
    }

    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        getSherlock().dispatchRestoreInstanceState(savedInstanceState);
    }

    @Override // android.support.v4.app.Watson
    public MenuInflater getSupportMenuInflater() {
        return getSherlock().getMenuInflater();
    }

    public void invalidateOptionsMenu() {
        getSherlock().dispatchInvalidateOptionsMenu();
    }

    public void supportInvalidateOptionsMenu() {
        invalidateOptionsMenu();
    }

    public final boolean onCreatePanelMenu(int featureId, Menu menu) {
        if (featureId == 0 && !this.mIgnoreNativeCreate) {
            this.mIgnoreNativeCreate = true;
            boolean result = getSherlock().dispatchCreateOptionsMenu(menu);
            this.mIgnoreNativeCreate = false;
            return result;
        }
        return super.onCreatePanelMenu(featureId, menu);
    }

    public final boolean onCreateOptionsMenu(Menu menu) {
        return true;
    }

    public final boolean onPreparePanel(int featureId, View view, Menu menu) {
        if (featureId == 0 && !this.mIgnoreNativePrepare) {
            this.mIgnoreNativePrepare = true;
            boolean result = getSherlock().dispatchPrepareOptionsMenu(menu);
            this.mIgnoreNativePrepare = false;
            return result;
        }
        return super.onPreparePanel(featureId, view, menu);
    }

    public final boolean onPrepareOptionsMenu(Menu menu) {
        return true;
    }

    public final boolean onMenuItemSelected(int featureId, MenuItem item) {
        if (featureId == 0 && !this.mIgnoreNativeSelected) {
            this.mIgnoreNativeSelected = true;
            boolean result = getSherlock().dispatchOptionsItemSelected(item);
            this.mIgnoreNativeSelected = false;
            return result;
        }
        return super.onMenuItemSelected(featureId, item);
    }

    public final boolean onOptionsItemSelected(MenuItem item) {
        return false;
    }

    public void openOptionsMenu() {
        if (!getSherlock().dispatchOpenOptionsMenu()) {
            super.openOptionsMenu();
        }
    }

    public void closeOptionsMenu() {
        if (!getSherlock().dispatchCloseOptionsMenu()) {
            super.closeOptionsMenu();
        }
    }

    @Override // android.support.v4.app.Watson
    public boolean onCreateOptionsMenu(com.actionbarsherlock.view.Menu menu) {
        return true;
    }

    @Override // android.support.v4.app.Watson
    public boolean onPrepareOptionsMenu(com.actionbarsherlock.view.Menu menu) {
        return true;
    }

    @Override // android.support.v4.app.Watson
    public boolean onOptionsItemSelected(com.actionbarsherlock.view.MenuItem item) {
        return false;
    }

    public void addContentView(View view, ViewGroup.LayoutParams params) {
        getSherlock().addContentView(view, params);
    }

    public void setContentView(int layoutResId) {
        getSherlock().setContentView(layoutResId);
    }

    public void setContentView(View view, ViewGroup.LayoutParams params) {
        getSherlock().setContentView(view, params);
    }

    public void setContentView(View view) {
        getSherlock().setContentView(view);
    }

    public void requestWindowFeature(long featureId) {
        getSherlock().requestFeature((int) featureId);
    }

    public View findViewById(int id) {
        getSherlock().ensureActionBar();
        return super.findViewById(id);
    }

    public void setSupportProgress(int progress) {
        getSherlock().setProgress(progress);
    }

    public void setSupportProgressBarIndeterminate(boolean indeterminate) {
        getSherlock().setProgressBarIndeterminate(indeterminate);
    }

    public void setSupportProgressBarIndeterminateVisibility(boolean visible) {
        getSherlock().setProgressBarIndeterminateVisibility(visible);
    }

    public void setSupportProgressBarVisibility(boolean visible) {
        getSherlock().setProgressBarVisibility(visible);
    }

    public void setSupportSecondaryProgress(int secondaryProgress) {
        getSherlock().setSecondaryProgress(secondaryProgress);
    }
}
