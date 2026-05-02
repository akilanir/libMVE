package android.support.v7.app;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.support.v4.app.TaskStackBuilder;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.view.ActionMode;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.android.support.appcompat-v7.21.0.3.jar:android/support/v7/app/ActionBarActivity.class */
public class ActionBarActivity extends FragmentActivity implements ActionBar.Callback, TaskStackBuilder.SupportParentable, ActionBarDrawerToggle.DelegateProvider, ActionBarDrawerToggle.TmpDelegateProvider {
    private ActionBarActivityDelegate mDelegate;

    public ActionBar getSupportActionBar() {
        return getDelegate().getSupportActionBar();
    }

    public void setSupportActionBar(@Nullable Toolbar toolbar) {
        getDelegate().setSupportActionBar(toolbar);
    }

    public MenuInflater getMenuInflater() {
        return getDelegate().getMenuInflater();
    }

    public void setContentView(int layoutResID) {
        getDelegate().setContentView(layoutResID);
    }

    public void setContentView(View view) {
        getDelegate().setContentView(view);
    }

    public void setContentView(View view, ViewGroup.LayoutParams params) {
        getDelegate().setContentView(view, params);
    }

    public void addContentView(View view, ViewGroup.LayoutParams params) {
        getDelegate().addContentView(view, params);
    }

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getDelegate().onCreate(savedInstanceState);
    }

    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        getDelegate().onConfigurationChanged(newConfig);
    }

    protected void onStop() {
        super.onStop();
        getDelegate().onStop();
    }

    protected void onPostResume() {
        super.onPostResume();
        getDelegate().onPostResume();
    }

    public View onCreatePanelView(int featureId) {
        if (featureId == 0) {
            return getDelegate().onCreatePanelView(featureId);
        }
        return super.onCreatePanelView(featureId);
    }

    public final boolean onMenuItemSelected(int featureId, MenuItem item) {
        if (super.onMenuItemSelected(featureId, item)) {
            return true;
        }
        ActionBar ab = getSupportActionBar();
        if (item.getItemId() == 16908332 && ab != null && (ab.getDisplayOptions() & 4) != 0) {
            return onSupportNavigateUp();
        }
        return false;
    }

    protected void onDestroy() {
        super.onDestroy();
        getDelegate().destroy();
    }

    protected void onTitleChanged(CharSequence title, int color) {
        super.onTitleChanged(title, color);
        getDelegate().onTitleChanged(title);
    }

    public boolean supportRequestWindowFeature(int featureId) {
        return getDelegate().supportRequestWindowFeature(featureId);
    }

    public void supportInvalidateOptionsMenu() {
        getDelegate().supportInvalidateOptionsMenu();
    }

    public void invalidateOptionsMenu() {
        getDelegate().supportInvalidateOptionsMenu();
    }

    public void onSupportActionModeStarted(ActionMode mode) {
    }

    public void onSupportActionModeFinished(ActionMode mode) {
    }

    public ActionMode startSupportActionMode(ActionMode.Callback callback) {
        return getDelegate().startSupportActionMode(callback);
    }

    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        return getDelegate().onCreatePanelMenu(featureId, menu);
    }

    public boolean onPreparePanel(int featureId, View view, Menu menu) {
        return getDelegate().onPreparePanel(featureId, view, menu);
    }

    public void onPanelClosed(int featureId, Menu menu) {
        getDelegate().onPanelClosed(featureId, menu);
    }

    public boolean onMenuOpened(int featureId, Menu menu) {
        return getDelegate().onMenuOpened(featureId, menu);
    }

    protected boolean onPrepareOptionsPanel(View view, Menu menu) {
        return getDelegate().onPrepareOptionsPanel(view, menu);
    }

    void superSetContentView(int resId) {
        super.setContentView(resId);
    }

    void superSetContentView(View v) {
        super.setContentView(v);
    }

    void superSetContentView(View v, ViewGroup.LayoutParams lp) {
        super.setContentView(v, lp);
    }

    void superAddContentView(View v, ViewGroup.LayoutParams lp) {
        super.addContentView(v, lp);
    }

    boolean superOnCreatePanelMenu(int featureId, Menu frameworkMenu) {
        return super.onCreatePanelMenu(featureId, frameworkMenu);
    }

    boolean superOnPreparePanel(int featureId, View view, Menu menu) {
        return super.onPreparePanel(featureId, view, menu);
    }

    boolean superOnPrepareOptionsPanel(View view, Menu menu) {
        return super.onPrepareOptionsPanel(view, menu);
    }

    void superOnPanelClosed(int featureId, Menu menu) {
        super.onPanelClosed(featureId, menu);
    }

    boolean superOnMenuOpened(int featureId, Menu menu) {
        return super.onMenuOpened(featureId, menu);
    }

    public void onBackPressed() {
        if (!getDelegate().onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void setSupportProgressBarVisibility(boolean visible) {
        getDelegate().setSupportProgressBarVisibility(visible);
    }

    public void setSupportProgressBarIndeterminateVisibility(boolean visible) {
        getDelegate().setSupportProgressBarIndeterminateVisibility(visible);
    }

    public void setSupportProgressBarIndeterminate(boolean indeterminate) {
        getDelegate().setSupportProgressBarIndeterminate(indeterminate);
    }

    public void setSupportProgress(int progress) {
        getDelegate().setSupportProgress(progress);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void onCreateSupportNavigateUpTaskStack(TaskStackBuilder builder) {
        builder.addParentStack(this);
    }

    public void onPrepareSupportNavigateUpTaskStack(TaskStackBuilder builder) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean onSupportNavigateUp() {
        Intent upIntent = getSupportParentActivityIntent();
        if (upIntent != null) {
            if (supportShouldUpRecreateTask(upIntent)) {
                TaskStackBuilder b = TaskStackBuilder.create(this);
                onCreateSupportNavigateUpTaskStack(b);
                onPrepareSupportNavigateUpTaskStack(b);
                b.startActivities();
                try {
                    ActivityCompat.finishAffinity(this);
                    return true;
                } catch (IllegalStateException e) {
                    finish();
                    return true;
                }
            }
            supportNavigateUpTo(upIntent);
            return true;
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Intent getSupportParentActivityIntent() {
        return NavUtils.getParentActivityIntent(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean supportShouldUpRecreateTask(Intent targetIntent) {
        return NavUtils.shouldUpRecreateTask(this, targetIntent);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void supportNavigateUpTo(Intent upIntent) {
        NavUtils.navigateUpTo(this, upIntent);
    }

    public final ActionBarDrawerToggle.Delegate getDrawerToggleDelegate() {
        return getDelegate().getDrawerToggleDelegate();
    }

    @Override // android.support.v7.app.ActionBarDrawerToggle.TmpDelegateProvider
    @Nullable
    public ActionBarDrawerToggle.Delegate getV7DrawerToggleDelegate() {
        return getDelegate().getV7DrawerToggleDelegate();
    }

    public boolean onKeyShortcut(int keyCode, KeyEvent event) {
        return getDelegate().onKeyShortcut(keyCode, event);
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (super.onKeyDown(keyCode, event)) {
            return true;
        }
        return getDelegate().onKeyDown(keyCode, event);
    }

    public final void onContentChanged() {
        getDelegate().onContentChanged();
    }

    public void onSupportContentChanged() {
    }

    public View onCreateView(String name, @NonNull Context context, @NonNull AttributeSet attrs) {
        View result = super.onCreateView(name, context, attrs);
        if (result != null) {
            return result;
        }
        return getDelegate().createView(name, context, attrs);
    }

    private ActionBarActivityDelegate getDelegate() {
        if (this.mDelegate == null) {
            this.mDelegate = ActionBarActivityDelegate.createDelegate(this);
        }
        return this.mDelegate;
    }
}
