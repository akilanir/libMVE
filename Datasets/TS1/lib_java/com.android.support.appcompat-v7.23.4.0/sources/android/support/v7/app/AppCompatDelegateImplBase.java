package android.support.v7.app;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.appcompat.R;
import android.support.v7.view.ActionMode;
import android.support.v7.view.SupportMenuInflater;
import android.support.v7.view.WindowCallbackWrapper;
import android.support.v7.view.menu.MenuBuilder;
import android.support.v7.widget.TintTypedArray;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.23.4.0.jar:android/support/v7/app/AppCompatDelegateImplBase.class */
abstract class AppCompatDelegateImplBase extends AppCompatDelegate {
    final Context mContext;
    final Window mWindow;
    final Window.Callback mOriginalWindowCallback;
    final Window.Callback mAppCompatWindowCallback;
    final AppCompatCallback mAppCompatCallback;
    ActionBar mActionBar;
    MenuInflater mMenuInflater;
    boolean mHasActionBar;
    boolean mOverlayActionBar;
    boolean mOverlayActionMode;
    boolean mIsFloating;
    boolean mWindowNoTitle;
    boolean mThemeRead;
    private CharSequence mTitle;
    private boolean mIsDestroyed;

    abstract void initWindowDecorActionBar();

    abstract void onPanelClosed(int i, Menu menu);

    abstract boolean onMenuOpened(int i, Menu menu);

    abstract boolean dispatchKeyEvent(KeyEvent keyEvent);

    abstract boolean onKeyShortcut(int i, KeyEvent keyEvent);

    abstract ActionMode startSupportActionModeFromWindow(ActionMode.Callback callback);

    abstract void onTitleChanged(CharSequence charSequence);

    AppCompatDelegateImplBase(Context context, Window window, AppCompatCallback callback) {
        this.mContext = context;
        this.mWindow = window;
        this.mAppCompatCallback = callback;
        this.mOriginalWindowCallback = this.mWindow.getCallback();
        if (this.mOriginalWindowCallback instanceof AppCompatWindowCallbackBase) {
            throw new IllegalStateException("AppCompat has already installed itself into the Window");
        }
        this.mAppCompatWindowCallback = wrapWindowCallback(this.mOriginalWindowCallback);
        this.mWindow.setCallback(this.mAppCompatWindowCallback);
    }

    Window.Callback wrapWindowCallback(Window.Callback callback) {
        return new AppCompatWindowCallbackBase(callback);
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public ActionBar getSupportActionBar() {
        initWindowDecorActionBar();
        return this.mActionBar;
    }

    final ActionBar peekSupportActionBar() {
        return this.mActionBar;
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public MenuInflater getMenuInflater() {
        if (this.mMenuInflater == null) {
            initWindowDecorActionBar();
            this.mMenuInflater = new SupportMenuInflater(this.mActionBar != null ? this.mActionBar.getThemedContext() : this.mContext);
        }
        return this.mMenuInflater;
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public void setLocalNightMode(int mode) {
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public final ActionBarDrawerToggle.Delegate getDrawerToggleDelegate() {
        return new ActionBarDrawableToggleImpl();
    }

    final Context getActionBarThemedContext() {
        Context context = null;
        ActionBar ab = getSupportActionBar();
        if (ab != null) {
            context = ab.getThemedContext();
        }
        if (context == null) {
            context = this.mContext;
        }
        return context;
    }

    /* loaded from: com.android.support.appcompat-v7.23.4.0.jar:android/support/v7/app/AppCompatDelegateImplBase$ActionBarDrawableToggleImpl.class */
    private class ActionBarDrawableToggleImpl implements ActionBarDrawerToggle.Delegate {
        private ActionBarDrawableToggleImpl() {
        }

        @Override // android.support.v7.app.ActionBarDrawerToggle.Delegate
        public Drawable getThemeUpIndicator() {
            TintTypedArray a = TintTypedArray.obtainStyledAttributes(getActionBarThemedContext(), null, new int[]{R.attr.homeAsUpIndicator});
            Drawable result = a.getDrawable(0);
            a.recycle();
            return result;
        }

        @Override // android.support.v7.app.ActionBarDrawerToggle.Delegate
        public Context getActionBarThemedContext() {
            return AppCompatDelegateImplBase.this.getActionBarThemedContext();
        }

        @Override // android.support.v7.app.ActionBarDrawerToggle.Delegate
        public boolean isNavigationVisible() {
            ActionBar ab = AppCompatDelegateImplBase.this.getSupportActionBar();
            return (ab == null || (ab.getDisplayOptions() & 4) == 0) ? false : true;
        }

        @Override // android.support.v7.app.ActionBarDrawerToggle.Delegate
        public void setActionBarUpIndicator(Drawable upDrawable, int contentDescRes) {
            ActionBar ab = AppCompatDelegateImplBase.this.getSupportActionBar();
            if (ab != null) {
                ab.setHomeAsUpIndicator(upDrawable);
                ab.setHomeActionContentDescription(contentDescRes);
            }
        }

        @Override // android.support.v7.app.ActionBarDrawerToggle.Delegate
        public void setActionBarDescription(int contentDescRes) {
            ActionBar ab = AppCompatDelegateImplBase.this.getSupportActionBar();
            if (ab != null) {
                ab.setHomeActionContentDescription(contentDescRes);
            }
        }
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public void onDestroy() {
        this.mIsDestroyed = true;
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public void setHandleNativeActionModesEnabled(boolean enabled) {
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public boolean isHandleNativeActionModesEnabled() {
        return false;
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public boolean applyDayNight() {
        return false;
    }

    final boolean isDestroyed() {
        return this.mIsDestroyed;
    }

    final Window.Callback getWindowCallback() {
        return this.mWindow.getCallback();
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public final void setTitle(CharSequence title) {
        this.mTitle = title;
        onTitleChanged(title);
    }

    @Override // android.support.v7.app.AppCompatDelegate
    public void onSaveInstanceState(Bundle outState) {
    }

    final CharSequence getTitle() {
        if (this.mOriginalWindowCallback instanceof Activity) {
            return ((Activity) this.mOriginalWindowCallback).getTitle();
        }
        return this.mTitle;
    }

    /* loaded from: com.android.support.appcompat-v7.23.4.0.jar:android/support/v7/app/AppCompatDelegateImplBase$AppCompatWindowCallbackBase.class */
    class AppCompatWindowCallbackBase extends WindowCallbackWrapper {
        AppCompatWindowCallbackBase(Window.Callback callback) {
            super(callback);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public boolean dispatchKeyEvent(KeyEvent event) {
            return AppCompatDelegateImplBase.this.dispatchKeyEvent(event) || super.dispatchKeyEvent(event);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return super.dispatchKeyShortcutEvent(event) || AppCompatDelegateImplBase.this.onKeyShortcut(event.getKeyCode(), event);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public boolean onCreatePanelMenu(int featureId, Menu menu) {
            if (featureId == 0 && !(menu instanceof MenuBuilder)) {
                return false;
            }
            return super.onCreatePanelMenu(featureId, menu);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public void onContentChanged() {
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public boolean onPreparePanel(int featureId, View view, Menu menu) {
            MenuBuilder mb = menu instanceof MenuBuilder ? (MenuBuilder) menu : null;
            if (featureId == 0 && mb == null) {
                return false;
            }
            if (mb != null) {
                mb.setOverrideVisibleItems(true);
            }
            boolean handled = super.onPreparePanel(featureId, view, menu);
            if (mb != null) {
                mb.setOverrideVisibleItems(false);
            }
            return handled;
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public boolean onMenuOpened(int featureId, Menu menu) {
            super.onMenuOpened(featureId, menu);
            AppCompatDelegateImplBase.this.onMenuOpened(featureId, menu);
            return true;
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public void onPanelClosed(int featureId, Menu menu) {
            super.onPanelClosed(featureId, menu);
            AppCompatDelegateImplBase.this.onPanelClosed(featureId, menu);
        }
    }
}
