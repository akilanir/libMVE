package com.actionbarsherlock;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.internal.ActionBarSherlockCompat;
import com.actionbarsherlock.internal.ActionBarSherlockNative;
import com.actionbarsherlock.view.ActionMode;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock.class */
public abstract class ActionBarSherlock {
    protected static final String TAG = "ActionBarSherlock";
    public static final boolean DEBUG = false;
    private static final Class<?>[] CONSTRUCTOR_ARGS = {Activity.class, Integer.TYPE};
    private static final HashMap<Implementation, Class<? extends ActionBarSherlock>> IMPLEMENTATIONS = new HashMap<>();
    public static final int FLAG_DELEGATE = 1;
    protected final Activity mActivity;
    protected final boolean mIsDelegate;
    protected MenuInflater mMenuInflater;

    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$Implementation.class */
    public @interface Implementation {
        public static final int DEFAULT_API = -1;
        public static final int DEFAULT_DPI = -1;

        int api() default -1;

        int dpi() default -1;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnActionModeFinishedListener.class */
    public interface OnActionModeFinishedListener {
        void onActionModeFinished(ActionMode actionMode);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnActionModeStartedListener.class */
    public interface OnActionModeStartedListener {
        void onActionModeStarted(ActionMode actionMode);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnCreateOptionsMenuListener.class */
    public interface OnCreateOptionsMenuListener {
        boolean onCreateOptionsMenu(Menu menu);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnCreatePanelMenuListener.class */
    public interface OnCreatePanelMenuListener {
        boolean onCreatePanelMenu(int i, Menu menu);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnMenuItemSelectedListener.class */
    public interface OnMenuItemSelectedListener {
        boolean onMenuItemSelected(int i, MenuItem menuItem);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnOptionsItemSelectedListener.class */
    public interface OnOptionsItemSelectedListener {
        boolean onOptionsItemSelected(MenuItem menuItem);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnPrepareOptionsMenuListener.class */
    public interface OnPrepareOptionsMenuListener {
        boolean onPrepareOptionsMenu(Menu menu);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/ActionBarSherlock$OnPreparePanelListener.class */
    public interface OnPreparePanelListener {
        boolean onPreparePanel(int i, View view, Menu menu);
    }

    public abstract ActionBar getActionBar();

    public abstract void dispatchInvalidateOptionsMenu();

    public abstract boolean dispatchCreateOptionsMenu(android.view.Menu menu);

    public abstract boolean dispatchPrepareOptionsMenu(android.view.Menu menu);

    public abstract boolean dispatchOptionsItemSelected(android.view.MenuItem menuItem);

    public abstract boolean hasFeature(int i);

    public abstract boolean requestFeature(int i);

    public abstract void setUiOptions(int i);

    public abstract void setUiOptions(int i, int i2);

    public abstract void setContentView(int i);

    public abstract void setContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void addContentView(View view, ViewGroup.LayoutParams layoutParams);

    public abstract void setTitle(CharSequence charSequence);

    public abstract void setProgressBarVisibility(boolean z);

    public abstract void setProgressBarIndeterminateVisibility(boolean z);

    public abstract void setProgressBarIndeterminate(boolean z);

    public abstract void setProgress(int i);

    public abstract void setSecondaryProgress(int i);

    protected abstract Context getThemedContext();

    public abstract ActionMode startActionMode(ActionMode.Callback callback);

    static {
        registerImplementation(ActionBarSherlockCompat.class);
        registerImplementation(ActionBarSherlockNative.class);
    }

    public static void registerImplementation(Class<? extends ActionBarSherlock> implementationClass) {
        if (!implementationClass.isAnnotationPresent(Implementation.class)) {
            throw new IllegalArgumentException("Class " + implementationClass.getSimpleName() + " is not annotated with @Implementation");
        }
        if (IMPLEMENTATIONS.containsValue(implementationClass)) {
            return;
        }
        Implementation impl = (Implementation) implementationClass.getAnnotation(Implementation.class);
        IMPLEMENTATIONS.put(impl, implementationClass);
    }

    public static boolean unregisterImplementation(Class<? extends ActionBarSherlock> implementationClass) {
        return IMPLEMENTATIONS.values().remove(implementationClass);
    }

    public static ActionBarSherlock wrap(Activity activity) {
        return wrap(activity, 0);
    }

    public static ActionBarSherlock wrap(Activity activity, int flags) {
        HashMap<Implementation, Class<? extends ActionBarSherlock>> impls = new HashMap<>(IMPLEMENTATIONS);
        boolean hasQualfier = false;
        Iterator i$ = impls.keySet().iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            Implementation key = i$.next();
            if (key.dpi() == 213) {
                hasQualfier = true;
                break;
            }
        }
        if (hasQualfier) {
            boolean isTvDpi = activity.getResources().getDisplayMetrics().densityDpi == 213;
            Iterator<Implementation> keys = impls.keySet().iterator();
            while (keys.hasNext()) {
                int keyDpi = keys.next().dpi();
                if ((isTvDpi && keyDpi != 213) || (!isTvDpi && keyDpi == 213)) {
                    keys.remove();
                }
            }
        }
        boolean hasQualfier2 = false;
        Iterator i$2 = impls.keySet().iterator();
        while (true) {
            if (!i$2.hasNext()) {
                break;
            }
            Implementation key2 = i$2.next();
            if (key2.api() != -1) {
                hasQualfier2 = true;
                break;
            }
        }
        if (hasQualfier2) {
            int runtimeApi = Build.VERSION.SDK_INT;
            int bestApi = 0;
            Iterator<Implementation> keys2 = impls.keySet().iterator();
            while (keys2.hasNext()) {
                int keyApi = keys2.next().api();
                if (keyApi > runtimeApi) {
                    keys2.remove();
                } else if (keyApi > bestApi) {
                    bestApi = keyApi;
                }
            }
            Iterator<Implementation> keys3 = impls.keySet().iterator();
            while (keys3.hasNext()) {
                if (keys3.next().api() != bestApi) {
                    keys3.remove();
                }
            }
        }
        if (impls.size() > 1) {
            throw new IllegalStateException("More than one implementation matches configuration.");
        }
        if (impls.isEmpty()) {
            throw new IllegalStateException("No implementations match configuration.");
        }
        Class<? extends ActionBarSherlock> impl = impls.values().iterator().next();
        try {
            Constructor<? extends ActionBarSherlock> ctor = impl.getConstructor(CONSTRUCTOR_ARGS);
            return (ActionBarSherlock) ctor.newInstance(activity, Integer.valueOf(flags));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (IllegalArgumentException e2) {
            throw new RuntimeException(e2);
        } catch (InstantiationException e3) {
            throw new RuntimeException(e3);
        } catch (NoSuchMethodException e4) {
            throw new RuntimeException(e4);
        } catch (InvocationTargetException e5) {
            throw new RuntimeException(e5);
        }
    }

    protected ActionBarSherlock(Activity activity, int flags) {
        this.mActivity = activity;
        this.mIsDelegate = (flags & 1) != 0;
    }

    public void dispatchConfigurationChanged(Configuration newConfig) {
    }

    public void dispatchPostResume() {
    }

    public void dispatchPause() {
    }

    public void dispatchStop() {
    }

    public boolean dispatchOpenOptionsMenu() {
        return false;
    }

    public boolean dispatchCloseOptionsMenu() {
        return false;
    }

    public void dispatchPostCreate(Bundle savedInstanceState) {
    }

    public void dispatchTitleChanged(CharSequence title, int color) {
    }

    public boolean dispatchKeyEvent(KeyEvent event) {
        return false;
    }

    public boolean dispatchMenuOpened(int featureId, android.view.Menu menu) {
        return false;
    }

    public void dispatchPanelClosed(int featureId, android.view.Menu menu) {
    }

    public void dispatchDestroy() {
    }

    public void dispatchSaveInstanceState(Bundle outState) {
    }

    public void dispatchRestoreInstanceState(Bundle savedInstanceState) {
    }

    protected final boolean callbackCreateOptionsMenu(Menu menu) {
        boolean result = true;
        if (this.mActivity instanceof OnCreatePanelMenuListener) {
            OnCreatePanelMenuListener listener = (OnCreatePanelMenuListener) this.mActivity;
            result = listener.onCreatePanelMenu(0, menu);
        } else if (this.mActivity instanceof OnCreateOptionsMenuListener) {
            OnCreateOptionsMenuListener listener2 = (OnCreateOptionsMenuListener) this.mActivity;
            result = listener2.onCreateOptionsMenu(menu);
        }
        return result;
    }

    protected final boolean callbackPrepareOptionsMenu(Menu menu) {
        boolean result = true;
        if (this.mActivity instanceof OnPreparePanelListener) {
            OnPreparePanelListener listener = (OnPreparePanelListener) this.mActivity;
            result = listener.onPreparePanel(0, null, menu);
        } else if (this.mActivity instanceof OnPrepareOptionsMenuListener) {
            OnPrepareOptionsMenuListener listener2 = (OnPrepareOptionsMenuListener) this.mActivity;
            result = listener2.onPrepareOptionsMenu(menu);
        }
        return result;
    }

    protected final boolean callbackOptionsItemSelected(MenuItem item) {
        boolean result = false;
        if (this.mActivity instanceof OnMenuItemSelectedListener) {
            OnMenuItemSelectedListener listener = (OnMenuItemSelectedListener) this.mActivity;
            result = listener.onMenuItemSelected(0, item);
        } else if (this.mActivity instanceof OnOptionsItemSelectedListener) {
            OnOptionsItemSelectedListener listener2 = (OnOptionsItemSelectedListener) this.mActivity;
            result = listener2.onOptionsItemSelected(item);
        }
        return result;
    }

    public void setContentView(View view) {
        setContentView(view, new ViewGroup.LayoutParams(-1, -1));
    }

    public void setTitle(int resId) {
        setTitle(this.mActivity.getString(resId));
    }

    public MenuInflater getMenuInflater() {
        if (this.mMenuInflater == null) {
            if (getActionBar() != null) {
                this.mMenuInflater = new MenuInflater(getThemedContext(), this.mActivity);
            } else {
                this.mMenuInflater = new MenuInflater(this.mActivity);
            }
        }
        return this.mMenuInflater;
    }

    public void ensureActionBar() {
    }
}
