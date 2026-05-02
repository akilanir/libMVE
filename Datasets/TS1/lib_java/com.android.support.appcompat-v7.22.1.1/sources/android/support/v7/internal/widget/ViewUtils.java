package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R;
import android.support.v7.internal.view.ContextThemeWrapper;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/internal/widget/ViewUtils.class */
public class ViewUtils {
    private static final String TAG = "ViewUtils";
    private static Method sComputeFitSystemWindowsMethod;

    static {
        if (Build.VERSION.SDK_INT >= 18) {
            try {
                sComputeFitSystemWindowsMethod = View.class.getDeclaredMethod("computeFitSystemWindows", Rect.class, Rect.class);
                if (!sComputeFitSystemWindowsMethod.isAccessible()) {
                    sComputeFitSystemWindowsMethod.setAccessible(true);
                }
            } catch (NoSuchMethodException e) {
                Log.d(TAG, "Could not find method computeFitSystemWindows. Oh well.");
            }
        }
    }

    private ViewUtils() {
    }

    public static boolean isLayoutRtl(View view) {
        return ViewCompat.getLayoutDirection(view) == 1;
    }

    public static int combineMeasuredStates(int curState, int newState) {
        return curState | newState;
    }

    public static void computeFitSystemWindows(View view, Rect inoutInsets, Rect outLocalInsets) {
        if (sComputeFitSystemWindowsMethod != null) {
            try {
                sComputeFitSystemWindowsMethod.invoke(view, inoutInsets, outLocalInsets);
            } catch (Exception e) {
                Log.d(TAG, "Could not invoke computeFitSystemWindows", e);
            }
        }
    }

    public static void makeOptionalFitsSystemWindows(View view) {
        if (Build.VERSION.SDK_INT >= 16) {
            try {
                Method method = view.getClass().getMethod("makeOptionalFitsSystemWindows", new Class[0]);
                if (!method.isAccessible()) {
                    method.setAccessible(true);
                }
                method.invoke(view, new Object[0]);
            } catch (IllegalAccessException e) {
                Log.d(TAG, "Could not invoke makeOptionalFitsSystemWindows", e);
            } catch (NoSuchMethodException e2) {
                Log.d(TAG, "Could not find method makeOptionalFitsSystemWindows. Oh well...");
            } catch (InvocationTargetException e3) {
                Log.d(TAG, "Could not invoke makeOptionalFitsSystemWindows", e3);
            }
        }
    }

    public static Context themifyContext(Context context, AttributeSet attrs, boolean useAndroidTheme, boolean useAppTheme) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.View, 0, 0);
        int themeId = 0;
        if (useAndroidTheme) {
            themeId = a.getResourceId(R.styleable.View_android_theme, 0);
        }
        if (useAppTheme && themeId == 0) {
            themeId = a.getResourceId(R.styleable.View_theme, 0);
            if (themeId != 0) {
                Log.i(TAG, "app:theme is now deprecated. Please move to using android:theme instead.");
            }
        }
        a.recycle();
        if (themeId != 0 && (!(context instanceof ContextThemeWrapper) || ((ContextThemeWrapper) context).getThemeResId() != themeId)) {
            context = new ContextThemeWrapper(context, themeId);
        }
        return context;
    }
}
