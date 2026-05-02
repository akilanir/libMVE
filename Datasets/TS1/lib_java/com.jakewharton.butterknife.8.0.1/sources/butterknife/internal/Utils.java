package butterknife.internal;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.AttrRes;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.util.TypedValue;
import java.lang.reflect.Array;
import java.util.List;

/* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/internal/Utils.class */
public final class Utils {
    private static final boolean HAS_SUPPORT_V4 = hasSupportV4();

    private static boolean hasSupportV4() {
        try {
            Class.forName("android.support.v4.graphics.drawable.DrawableCompat");
            return true;
        } catch (ClassNotFoundException e) {
            return false;
        } catch (VerifyError e2) {
            return false;
        }
    }

    public static Drawable getTintedDrawable(Resources res, Resources.Theme theme, @DrawableRes int id, @AttrRes int tintAttrId) {
        if (HAS_SUPPORT_V4) {
            return SupportV4.getTintedDrawable(res, theme, id, tintAttrId);
        }
        throw new RuntimeException("Android support-v4 library is required for @BindDrawable with tint.");
    }

    public static int getColor(Resources res, Resources.Theme theme, @ColorRes int id) {
        if (Build.VERSION.SDK_INT < 23) {
            return res.getColor(id);
        }
        return res.getColor(id, theme);
    }

    public static ColorStateList getColorStateList(Resources res, Resources.Theme theme, @ColorRes int id) {
        if (Build.VERSION.SDK_INT < 23) {
            return res.getColorStateList(id);
        }
        return res.getColorStateList(id, theme);
    }

    public static Drawable getDrawable(Resources res, Resources.Theme theme, @DrawableRes int id) {
        if (Build.VERSION.SDK_INT < 21) {
            return res.getDrawable(id);
        }
        return res.getDrawable(id, theme);
    }

    @SafeVarargs
    public static <T> T[] arrayOf(T... tArr) {
        return (T[]) filterNull(tArr);
    }

    @SafeVarargs
    public static <T> List<T> listOf(T... views) {
        return new ImmutableList(filterNull(views));
    }

    private static <T> T[] filterNull(T[] tArr) {
        int i = 0;
        int length = tArr.length;
        for (T t : tArr) {
            if (t != null) {
                int i2 = i;
                i++;
                tArr[i2] = t;
            }
        }
        if (i == length) {
            return tArr;
        }
        T[] tArr2 = (T[]) ((Object[]) Array.newInstance(tArr.getClass().getComponentType(), i));
        System.arraycopy(tArr, 0, tArr2, 0, i);
        return tArr2;
    }

    /* loaded from: com.jakewharton.butterknife.8.0.1.jar:butterknife/internal/Utils$SupportV4.class */
    static class SupportV4 {
        private static final TypedValue OUT_VALUE = new TypedValue();

        SupportV4() {
        }

        static Drawable getTintedDrawable(Resources res, Resources.Theme theme, @DrawableRes int id, @AttrRes int tintAttributeId) {
            boolean attributeFound = theme.resolveAttribute(tintAttributeId, OUT_VALUE, true);
            if (!attributeFound) {
                throw new Resources.NotFoundException("Required tint color attribute with name " + res.getResourceEntryName(tintAttributeId) + " and attribute ID " + tintAttributeId + " was not found.");
            }
            Drawable drawable = DrawableCompat.wrap(Utils.getDrawable(res, theme, id).mutate());
            int color = Utils.getColor(res, theme, OUT_VALUE.resourceId);
            DrawableCompat.setTint(drawable, color);
            return drawable;
        }
    }

    private Utils() {
        throw new AssertionError("No instances.");
    }
}
