package android.support.v7.widget;

import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.graphics.drawable.DrawableWrapper;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatDelegate;
import android.support.v7.graphics.drawable.DrawerArrowDrawable;

/* loaded from: com.android.support.appcompat-v7.23.3.0.jar:android/support/v7/widget/DrawableUtils.class */
public class DrawableUtils {
    private static final String TAG = "DrawableUtils";
    public static final Rect INSETS_NONE = new Rect();
    private static Class<?> sInsetsClazz;
    private static final String VECTOR_DRAWABLE_CLAZZ_NAME = "android.graphics.drawable.VectorDrawable";

    static {
        if (Build.VERSION.SDK_INT >= 18) {
            try {
                sInsetsClazz = Class.forName("android.graphics.Insets");
            } catch (ClassNotFoundException e) {
            }
        }
    }

    private DrawableUtils() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00e4 A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x00f1 A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00fe A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x010b A[Catch: Exception -> 0x0120, TryCatch #0 {Exception -> 0x0120, blocks: (B:4:0x0006, B:6:0x0027, B:9:0x0046, B:10:0x005c, B:11:0x0088, B:14:0x0098, B:17:0x00a8, B:20:0x00b8, B:24:0x00c7, B:25:0x00e4, B:26:0x00f1, B:27:0x00fe, B:28:0x010b, B:29:0x0115), top: B:37:0x0006 }] */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0115 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.graphics.Rect getOpticalBounds(android.graphics.drawable.Drawable r4) {
        /*
            Method dump skipped, instructions count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.DrawableUtils.getOpticalBounds(android.graphics.drawable.Drawable):android.graphics.Rect");
    }

    static void fixDrawable(@NonNull Drawable drawable) {
        if (Build.VERSION.SDK_INT == 21 && VECTOR_DRAWABLE_CLAZZ_NAME.equals(drawable.getClass().getName())) {
            fixVectorDrawableTinting(drawable);
        }
    }

    public static boolean canSafelyMutateDrawable(@NonNull Drawable drawable) {
        if (drawable instanceof LayerDrawable) {
            return Build.VERSION.SDK_INT >= 16;
        }
        if (drawable instanceof InsetDrawable) {
            return Build.VERSION.SDK_INT >= 14;
        }
        if (drawable instanceof StateListDrawable) {
            return Build.VERSION.SDK_INT >= 8;
        }
        if (drawable instanceof GradientDrawable) {
            return Build.VERSION.SDK_INT >= 14;
        }
        if (!(drawable instanceof DrawableContainer)) {
            if (drawable instanceof DrawableWrapper) {
                return canSafelyMutateDrawable(((DrawableWrapper) drawable).getWrappedDrawable());
            }
            if (drawable instanceof android.support.v7.graphics.drawable.DrawableWrapper) {
                return canSafelyMutateDrawable(((android.support.v7.graphics.drawable.DrawableWrapper) drawable).getWrappedDrawable());
            }
            if (drawable instanceof ScaleDrawable) {
                return canSafelyMutateDrawable(((ScaleDrawable) drawable).getDrawable());
            }
            return true;
        }
        Drawable.ConstantState state = drawable.getConstantState();
        if (state instanceof DrawableContainer.DrawableContainerState) {
            DrawableContainer.DrawableContainerState containerState = (DrawableContainer.DrawableContainerState) state;
            Drawable[] arr$ = containerState.getChildren();
            for (Drawable child : arr$) {
                if (!canSafelyMutateDrawable(child)) {
                    return false;
                }
            }
            return true;
        }
        return true;
    }

    private static void fixVectorDrawableTinting(Drawable drawable) {
        int[] originalState = drawable.getState();
        if (originalState == null || originalState.length == 0) {
            drawable.setState(ThemeUtils.CHECKED_STATE_SET);
        } else {
            drawable.setState(ThemeUtils.EMPTY_STATE_SET);
        }
        drawable.setState(originalState);
    }

    static PorterDuff.Mode parseTintMode(int value, PorterDuff.Mode defaultMode) {
        switch (value) {
            case DrawerArrowDrawable.ARROW_DIRECTION_END /* 3 */:
                return PorterDuff.Mode.SRC_OVER;
            case 4:
            case 6:
            case 7:
            case ActionBar.DISPLAY_SHOW_TITLE /* 8 */:
            case AppCompatDelegate.FEATURE_ACTION_MODE_OVERLAY /* 10 */:
            case 11:
            case 12:
            case 13:
            default:
                return defaultMode;
            case 5:
                return PorterDuff.Mode.SRC_IN;
            case 9:
                return PorterDuff.Mode.SRC_ATOP;
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
            case ActionBar.DISPLAY_SHOW_CUSTOM /* 16 */:
                return Build.VERSION.SDK_INT >= 11 ? PorterDuff.Mode.valueOf("ADD") : defaultMode;
        }
    }
}
