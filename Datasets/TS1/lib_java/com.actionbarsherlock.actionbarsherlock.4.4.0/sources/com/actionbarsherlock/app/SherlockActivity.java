package com.actionbarsherlock.app;

import android.app.Activity;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.ActionBarSherlock;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.MenuInflater;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/app/SherlockActivity.class */
public abstract class SherlockActivity extends Activity implements ActionBarSherlock.OnCreatePanelMenuListener, ActionBarSherlock.OnPreparePanelListener, ActionBarSherlock.OnMenuItemSelectedListener, ActionBarSherlock.OnActionModeStartedListener, ActionBarSherlock.OnActionModeFinishedListener {
    private ActionBarSherlock mSherlock;

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

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        getSherlock().dispatchConfigurationChanged(newConfig);
    }

    @Override // android.app.Activity
    protected void onPostResume() {
        super.onPostResume();
        getSherlock().dispatchPostResume();
    }

    @Override // android.app.Activity
    protected void onPause() {
        getSherlock().dispatchPause();
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onStop() {
        getSherlock().dispatchStop();
        super.onStop();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        getSherlock().dispatchDestroy();
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onPostCreate(Bundle savedInstanceState) {
        getSherlock().dispatchPostCreate(savedInstanceState);
        super.onPostCreate(savedInstanceState);
    }

    @Override // android.app.Activity
    protected void onTitleChanged(CharSequence title, int color) {
        getSherlock().dispatchTitleChanged(title, color);
        super.onTitleChanged(title, color);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean onMenuOpened(int featureId, Menu menu) {
        if (getSherlock().dispatchMenuOpened(featureId, menu)) {
            return true;
        }
        return super.onMenuOpened(featureId, menu);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int featureId, Menu menu) {
        getSherlock().dispatchPanelClosed(featureId, menu);
        super.onPanelClosed(featureId, menu);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (getSherlock().dispatchKeyEvent(event)) {
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        getSherlock().dispatchSaveInstanceState(outState);
    }

    @Override // android.app.Activity
    protected void onRestoreInstanceState(Bundle savedInstanceState) {
        super.onRestoreInstanceState(savedInstanceState);
        getSherlock().dispatchRestoreInstanceState(savedInstanceState);
    }

    public MenuInflater getSupportMenuInflater() {
        return getSherlock().getMenuInflater();
    }

    @Override // android.app.Activity
    public void invalidateOptionsMenu() {
        getSherlock().dispatchInvalidateOptionsMenu();
    }

    public void supportInvalidateOptionsMenu() {
        invalidateOptionsMenu();
    }

    @Override // android.app.Activity
    public final boolean onCreateOptionsMenu(Menu menu) {
        return getSherlock().dispatchCreateOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public final boolean onPrepareOptionsMenu(Menu menu) {
        return getSherlock().dispatchPrepareOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public final boolean onOptionsItemSelected(MenuItem item) {
        return getSherlock().dispatchOptionsItemSelected(item);
    }

    @Override // android.app.Activity
    public void openOptionsMenu() {
        if (!getSherlock().dispatchOpenOptionsMenu()) {
            super.openOptionsMenu();
        }
    }

    @Override // android.app.Activity
    public void closeOptionsMenu() {
        if (!getSherlock().dispatchCloseOptionsMenu()) {
            super.closeOptionsMenu();
        }
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnCreatePanelMenuListener
    public boolean onCreatePanelMenu(int featureId, com.actionbarsherlock.view.Menu menu) {
        if (featureId == 0) {
            return onCreateOptionsMenu(menu);
        }
        return false;
    }

    public boolean onCreateOptionsMenu(com.actionbarsherlock.view.Menu menu) {
        return true;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnPreparePanelListener
    public boolean onPreparePanel(int featureId, View view, com.actionbarsherlock.view.Menu menu) {
        if (featureId == 0) {
            return onPrepareOptionsMenu(menu);
        }
        return false;
    }

    public boolean onPrepareOptionsMenu(com.actionbarsherlock.view.Menu menu) {
        return true;
    }

    @Override // com.actionbarsherlock.ActionBarSherlock.OnMenuItemSelectedListener
    public boolean onMenuItemSelected(int featureId, com.actionbarsherlock.view.MenuItem item) {
        if (featureId == 0) {
            return onOptionsItemSelected(item);
        }
        return false;
    }

    public boolean onOptionsItemSelected(com.actionbarsherlock.view.MenuItem item) {
        return false;
    }

    @Override // android.app.Activity
    public void addContentView(View view, ViewGroup.LayoutParams params) {
        getSherlock().addContentView(view, params);
    }

    @Override // android.app.Activity
    public void setContentView(int layoutResId) {
        getSherlock().setContentView(layoutResId);
    }

    @Override // android.app.Activity
    public void setContentView(View view, ViewGroup.LayoutParams params) {
        getSherlock().setContentView(view, params);
    }

    @Override // android.app.Activity
    public void setContentView(View view) {
        getSherlock().setContentView(view);
    }

    public void requestWindowFeature(long featureId) {
        getSherlock().requestFeature((int) featureId);
    }

    @Override // android.app.Activity
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
