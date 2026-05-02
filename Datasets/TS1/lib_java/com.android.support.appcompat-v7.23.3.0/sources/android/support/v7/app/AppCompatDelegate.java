package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.IdRes;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.view.ActionMode;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: com.android.support.appcompat-v7.23.3.0.jar:android/support/v7/app/AppCompatDelegate.class */
public abstract class AppCompatDelegate {
    static final String TAG = "AppCompatDelegate";
    public static final int MODE_NIGHT_NO = 1;
    public static final int MODE_NIGHT_YES = 2;
    public static final int MODE_NIGHT_AUTO = 0;
    public static final int MODE_NIGHT_FOLLOW_SYSTEM = -1;
    static final int MODE_NIGHT_UNSPECIFIED = -100;
    private static int sDefaultNightMode = -1;
    public static final int FEATURE_SUPPORT_ACTION_BAR = 108;
    public static final int FEATURE_SUPPORT_ACTION_BAR_OVERLAY = 109;
    public static final int FEATURE_ACTION_MODE_OVERLAY = 10;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: com.android.support.appcompat-v7.23.3.0.jar:android/support/v7/app/AppCompatDelegate$NightMode.class */
    public @interface NightMode {
    }

    @Nullable
    public abstract ActionBar getSupportActionBar();

    public abstract void setSupportActionBar(@Nullable Toolbar toolbar);

    public abstract MenuInflater getMenuInflater();

    public abstract void onCreate(Bundle bundle);

    public abstract void onPostCreate(Bundle bundle);

    public abstract void onConfigurationChanged(Configuration configuration);

    public abstract void onStop();

    public abstract void onPostResume();

    @Nullable
    public abstract View findViewById(@IdRes int i);

    public abstract void setContentView(View view);

    public abstract void setContentView(@LayoutRes int i);

    public abstract void setContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void addContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void setTitle(@Nullable CharSequence charSequence);

    public abstract void invalidateOptionsMenu();

    public abstract void onDestroy();

    @Nullable
    public abstract ActionBarDrawerToggle.Delegate getDrawerToggleDelegate();

    public abstract boolean requestWindowFeature(int i);

    public abstract boolean hasWindowFeature(int i);

    @Nullable
    public abstract ActionMode startSupportActionMode(@NonNull ActionMode.Callback callback);

    public abstract void installViewFactory();

    public abstract View createView(@Nullable View view, String str, @NonNull Context context, @NonNull AttributeSet attributeSet);

    public abstract void setHandleNativeActionModesEnabled(boolean z);

    public abstract boolean isHandleNativeActionModesEnabled();

    public abstract void onSaveInstanceState(Bundle bundle);

    public abstract boolean applyDayNight();

    public abstract void setLocalNightMode(int i);

    public static AppCompatDelegate create(Activity activity, AppCompatCallback callback) {
        return create(activity, activity.getWindow(), callback);
    }

    public static AppCompatDelegate create(Dialog dialog, AppCompatCallback callback) {
        return create(dialog.getContext(), dialog.getWindow(), callback);
    }

    private static AppCompatDelegate create(Context context, Window window, AppCompatCallback callback) {
        int sdk = Build.VERSION.SDK_INT;
        if (sdk >= 23) {
            return new AppCompatDelegateImplV23(context, window, callback);
        }
        if (sdk >= 14) {
            return new AppCompatDelegateImplV14(context, window, callback);
        }
        if (sdk >= 11) {
            return new AppCompatDelegateImplV11(context, window, callback);
        }
        return new AppCompatDelegateImplV7(context, window, callback);
    }

    AppCompatDelegate() {
    }

    public static void setDefaultNightMode(int mode) {
        switch (mode) {
            case -1:
            case 0:
            case 1:
            case 2:
                sDefaultNightMode = mode;
                break;
            default:
                Log.d(TAG, "setDefaultNightMode() called with an unknown mode");
                break;
        }
    }

    public static int getDefaultNightMode() {
        return sDefaultNightMode;
    }
}
