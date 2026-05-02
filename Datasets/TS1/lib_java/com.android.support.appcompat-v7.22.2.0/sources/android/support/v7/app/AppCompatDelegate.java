package android.support.v7.app;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.view.ActionMode;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.MenuInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.22.2.0.jar:android/support/v7/app/AppCompatDelegate.class */
public abstract class AppCompatDelegate {
    static final String TAG = "AppCompatDelegate";

    public abstract ActionBar getSupportActionBar();

    public abstract void setSupportActionBar(Toolbar toolbar);

    public abstract MenuInflater getMenuInflater();

    public abstract void onCreate(Bundle bundle);

    public abstract void onPostCreate(Bundle bundle);

    public abstract void onConfigurationChanged(Configuration configuration);

    public abstract void onStop();

    public abstract void onPostResume();

    public abstract void setContentView(View view);

    public abstract void setContentView(int i);

    public abstract void setContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void addContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void setTitle(CharSequence charSequence);

    public abstract void invalidateOptionsMenu();

    public abstract void onDestroy();

    public abstract ActionBarDrawerToggle.Delegate getDrawerToggleDelegate();

    public abstract boolean requestWindowFeature(int i);

    public abstract ActionMode startSupportActionMode(ActionMode.Callback callback);

    public abstract void installViewFactory();

    public abstract View createView(View view, String str, @NonNull Context context, @NonNull AttributeSet attributeSet);

    public abstract void setHandleNativeActionModesEnabled(boolean z);

    public abstract boolean isHandleNativeActionModesEnabled();

    public static AppCompatDelegate create(Activity activity, AppCompatCallback callback) {
        return create(activity, activity.getWindow(), callback);
    }

    public static AppCompatDelegate create(Dialog dialog, AppCompatCallback callback) {
        return create(dialog.getContext(), dialog.getWindow(), callback);
    }

    private static AppCompatDelegate create(Context context, Window window, AppCompatCallback callback) {
        int sdk = Build.VERSION.SDK_INT;
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
}
