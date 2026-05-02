package com.rey.material.app;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.UiThread;
import android.util.AttributeSet;
import android.util.SparseArray;
import com.rey.material.R;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ThemeManager.class */
public class ThemeManager {
    private static volatile ThemeManager mInstance;
    private Context mContext;
    private SparseArray<int[]> mStyles = new SparseArray<>();
    private int mCurrentTheme;
    private int mThemeCount;
    private EventDispatcher mDispatcher;
    private static final String PREF = "theme.pref";
    private static final String KEY_THEME = "theme";
    public static final int THEME_UNDEFINED = Integer.MIN_VALUE;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ThemeManager$EventDispatcher.class */
    public interface EventDispatcher {
        void registerListener(OnThemeChangedListener onThemeChangedListener);

        void unregisterListener(OnThemeChangedListener onThemeChangedListener);

        void dispatchThemeChanged(int i);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ThemeManager$OnThemeChangedListener.class */
    public interface OnThemeChangedListener {
        void onThemeChanged(@Nullable OnThemeChangedEvent onThemeChangedEvent);
    }

    public static int getStyleId(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ThemableView, defStyleAttr, defStyleRes);
        int styleId = a.getResourceId(R.styleable.ThemableView_v_styleId, 0);
        a.recycle();
        return styleId;
    }

    public static void init(Context context, int totalTheme, int defaultTheme, @Nullable EventDispatcher dispatcher) {
        getInstance().setup(context, totalTheme, defaultTheme, dispatcher);
    }

    public static ThemeManager getInstance() {
        if (mInstance == null) {
            synchronized (ThemeManager.class) {
                if (mInstance == null) {
                    mInstance = new ThemeManager();
                }
            }
        }
        return mInstance;
    }

    protected void setup(Context context, int totalTheme, int defaultTheme, @Nullable EventDispatcher dispatcher) {
        this.mContext = context;
        this.mDispatcher = dispatcher != null ? dispatcher : new SimpleDispatcher();
        this.mThemeCount = totalTheme;
        SharedPreferences pref = getSharedPreferences(this.mContext);
        if (pref != null) {
            this.mCurrentTheme = pref.getInt(KEY_THEME, defaultTheme);
        } else {
            this.mCurrentTheme = defaultTheme;
        }
        if (this.mCurrentTheme >= this.mThemeCount) {
            setCurrentTheme(defaultTheme);
        }
    }

    private int[] loadStyleList(Context context, int resId) {
        if (context == null) {
            return null;
        }
        TypedArray array = context.getResources().obtainTypedArray(resId);
        int[] result = new int[array.length()];
        for (int i = 0; i < result.length; i++) {
            result[i] = array.getResourceId(i, 0);
        }
        array.recycle();
        return result;
    }

    private int[] getStyleList(int styleId) {
        if (this.mStyles == null) {
            return null;
        }
        int[] list = this.mStyles.get(styleId);
        if (list == null) {
            list = loadStyleList(this.mContext, styleId);
            this.mStyles.put(styleId, list);
        }
        return list;
    }

    private SharedPreferences getSharedPreferences(Context context) {
        if (context == null) {
            return null;
        }
        return context.getSharedPreferences(PREF, 0);
    }

    private void dispatchThemeChanged(int theme) {
        if (this.mDispatcher != null) {
            this.mDispatcher.dispatchThemeChanged(theme);
        }
    }

    public Context getContext() {
        return this.mContext;
    }

    @UiThread
    public int getCurrentTheme() {
        return this.mCurrentTheme;
    }

    public boolean setCurrentTheme(int theme) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread() && this.mCurrentTheme != theme) {
            this.mCurrentTheme = theme;
            SharedPreferences pref = getSharedPreferences(this.mContext);
            if (pref != null) {
                pref.edit().putInt(KEY_THEME, this.mCurrentTheme).apply();
            }
            dispatchThemeChanged(this.mCurrentTheme);
            return true;
        }
        return false;
    }

    public int getThemeCount() {
        return this.mThemeCount;
    }

    public int getCurrentStyle(int styleId) {
        return getStyle(styleId, this.mCurrentTheme);
    }

    public int getStyle(int styleId, int theme) {
        int[] styles = getStyleList(styleId);
        if (styles == null) {
            return 0;
        }
        return styles[theme];
    }

    public void registerOnThemeChangedListener(@NonNull OnThemeChangedListener listener) {
        if (this.mDispatcher != null) {
            this.mDispatcher.registerListener(listener);
        }
    }

    public void unregisterOnThemeChangedListener(@NonNull OnThemeChangedListener listener) {
        if (this.mDispatcher != null) {
            this.mDispatcher.unregisterListener(listener);
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ThemeManager$SimpleDispatcher.class */
    public static class SimpleDispatcher implements EventDispatcher {
        ArrayList<WeakReference<OnThemeChangedListener>> mListeners = new ArrayList<>();

        @Override // com.rey.material.app.ThemeManager.EventDispatcher
        public void registerListener(OnThemeChangedListener listener) {
            boolean exist = false;
            for (int i = this.mListeners.size() - 1; i >= 0; i--) {
                WeakReference<OnThemeChangedListener> ref = this.mListeners.get(i);
                if (ref.get() == null) {
                    this.mListeners.remove(i);
                } else if (ref.get() == listener) {
                    exist = true;
                }
            }
            if (!exist) {
                this.mListeners.add(new WeakReference<>(listener));
            }
        }

        @Override // com.rey.material.app.ThemeManager.EventDispatcher
        public void unregisterListener(OnThemeChangedListener listener) {
            for (int i = this.mListeners.size() - 1; i >= 0; i--) {
                WeakReference<OnThemeChangedListener> ref = this.mListeners.get(i);
                if (ref.get() == null || ref.get() == listener) {
                    this.mListeners.remove(i);
                }
            }
        }

        @Override // com.rey.material.app.ThemeManager.EventDispatcher
        public void dispatchThemeChanged(int theme) {
            OnThemeChangedEvent event = new OnThemeChangedEvent(theme);
            for (int i = this.mListeners.size() - 1; i >= 0; i--) {
                WeakReference<OnThemeChangedListener> ref = this.mListeners.get(i);
                if (ref.get() == null) {
                    this.mListeners.remove(i);
                } else {
                    ref.get().onThemeChanged(event);
                }
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/ThemeManager$OnThemeChangedEvent.class */
    public static class OnThemeChangedEvent {
        public final int theme;

        public OnThemeChangedEvent(int theme) {
            this.theme = theme;
        }
    }
}
