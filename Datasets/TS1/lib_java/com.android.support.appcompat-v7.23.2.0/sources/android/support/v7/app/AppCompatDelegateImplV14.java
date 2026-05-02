package android.support.v7.app;

import android.app.UiModeManager;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v7.app.AppCompatDelegateImplBase;
import android.support.v7.view.SupportActionModeWrapper;
import android.util.Log;
import android.view.ActionMode;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/app/AppCompatDelegateImplV14.class */
class AppCompatDelegateImplV14 extends AppCompatDelegateImplV11 {
    private static final String KEY_LOCAL_NIGHT_MODE = "appcompat:local_night_mode";
    private static TwilightManager sTwilightManager;
    private int mLocalNightMode;
    private boolean mApplyDayNightCalled;
    private boolean mHandleNativeActionModes;

    AppCompatDelegateImplV14(Context context, Window window, AppCompatCallback callback) {
        super(context, window, callback);
        this.mLocalNightMode = -100;
        this.mHandleNativeActionModes = true;
    }

    @Override // android.support.v7.app.AppCompatDelegateImplV7, android.support.v7.app.AppCompatDelegate
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null && this.mLocalNightMode == -100) {
            this.mLocalNightMode = savedInstanceState.getInt(KEY_LOCAL_NIGHT_MODE, -100);
        }
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase
    Window.Callback wrapWindowCallback(Window.Callback callback) {
        return new AppCompatWindowCallbackV14(callback);
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase, android.support.v7.app.AppCompatDelegate
    public void setHandleNativeActionModesEnabled(boolean enabled) {
        this.mHandleNativeActionModes = enabled;
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase, android.support.v7.app.AppCompatDelegate
    public boolean isHandleNativeActionModesEnabled() {
        return this.mHandleNativeActionModes;
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase, android.support.v7.app.AppCompatDelegate
    public boolean applyDayNight() {
        this.mApplyDayNightCalled = true;
        return updateConfigurationForNightMode(getNightModeToApply());
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase, android.support.v7.app.AppCompatDelegate
    public void setLocalNightMode(int mode) {
        switch (mode) {
            case -1:
            case 0:
            case 1:
            case 2:
                if (this.mLocalNightMode != mode) {
                    this.mLocalNightMode = mode;
                    if (this.mApplyDayNightCalled) {
                        applyDayNight();
                        break;
                    }
                }
                break;
            default:
                Log.d("AppCompatDelegate", "setLocalNightMode() called with an unknown mode");
                break;
        }
    }

    private int mapNightModeToYesNo(int mode) {
        switch (mode) {
            case -1:
                UiModeManager uiModeManager = (UiModeManager) this.mContext.getSystemService("uimode");
                switch (uiModeManager.getNightMode()) {
                    case 0:
                        return 0;
                    case 1:
                    default:
                        return 1;
                    case 2:
                        return 2;
                }
            case 0:
                return getTwilightManager().isNight() ? 2 : 1;
            case 1:
            default:
                return 1;
            case 2:
                return 2;
        }
    }

    @Override // android.support.v7.app.AppCompatDelegateImplBase, android.support.v7.app.AppCompatDelegate
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.mLocalNightMode != -100) {
            outState.putInt(KEY_LOCAL_NIGHT_MODE, this.mLocalNightMode);
        }
    }

    private int getNightModeToApply() {
        return mapNightModeToYesNo(this.mLocalNightMode == -100 ? getDefaultNightMode() : this.mLocalNightMode);
    }

    private boolean updateConfigurationForNightMode(int mode) {
        Resources res = this.mContext.getResources();
        Configuration conf = res.getConfiguration();
        int currentNightMode = conf.uiMode & 48;
        int newNightMode = 0;
        switch (mode) {
            case 1:
                newNightMode = 16;
                break;
            case 2:
                newNightMode = 32;
                break;
        }
        if (currentNightMode != newNightMode) {
            conf.uiMode = (conf.uiMode & (-49)) | newNightMode;
            res.updateConfiguration(conf, res.getDisplayMetrics());
            return true;
        }
        return false;
    }

    private TwilightManager getTwilightManager() {
        if (sTwilightManager == null) {
            sTwilightManager = new TwilightManager(this.mContext.getApplicationContext());
        }
        return sTwilightManager;
    }

    /* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/app/AppCompatDelegateImplV14$AppCompatWindowCallbackV14.class */
    class AppCompatWindowCallbackV14 extends AppCompatDelegateImplBase.AppCompatWindowCallbackBase {
        AppCompatWindowCallbackV14(Window.Callback callback) {
            super(AppCompatDelegateImplV14.this, callback);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            if (AppCompatDelegateImplV14.this.isHandleNativeActionModesEnabled()) {
                return startAsSupportActionMode(callback);
            }
            return super.onWindowStartingActionMode(callback);
        }

        final ActionMode startAsSupportActionMode(ActionMode.Callback callback) {
            SupportActionModeWrapper.CallbackWrapper callbackWrapper = new SupportActionModeWrapper.CallbackWrapper(AppCompatDelegateImplV14.this.mContext, callback);
            android.support.v7.view.ActionMode supportActionMode = AppCompatDelegateImplV14.this.startSupportActionMode(callbackWrapper);
            if (supportActionMode != null) {
                return callbackWrapper.getActionModeWrapper(supportActionMode);
            }
            return null;
        }
    }
}
