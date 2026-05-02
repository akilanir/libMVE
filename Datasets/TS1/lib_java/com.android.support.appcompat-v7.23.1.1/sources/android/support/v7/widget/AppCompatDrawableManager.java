package android.support.v7.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.ColorUtils;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v4.util.LruCache;
import android.support.v7.appcompat.R;
import android.util.Log;
import android.util.SparseArray;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/AppCompatDrawableManager.class */
public final class AppCompatDrawableManager {
    private static final String TAG = "TintManager";
    private static final boolean DEBUG = false;
    private static AppCompatDrawableManager INSTANCE;
    private WeakHashMap<Context, SparseArray<ColorStateList>> mTintLists;
    private ArrayList<InflateDelegate> mDelegates;
    private static final PorterDuff.Mode DEFAULT_MODE = PorterDuff.Mode.SRC_IN;
    private static final ColorFilterLruCache COLOR_FILTER_CACHE = new ColorFilterLruCache(6);
    private static final int[] COLORFILTER_TINT_COLOR_CONTROL_NORMAL = {R.drawable.abc_textfield_search_default_mtrl_alpha, R.drawable.abc_textfield_default_mtrl_alpha, R.drawable.abc_ab_share_pack_mtrl_alpha};
    private static final int[] TINT_COLOR_CONTROL_NORMAL = {R.drawable.abc_ic_ab_back_mtrl_am_alpha, R.drawable.abc_ic_go_search_api_mtrl_alpha, R.drawable.abc_ic_search_api_mtrl_alpha, R.drawable.abc_ic_commit_search_api_mtrl_alpha, R.drawable.abc_ic_clear_mtrl_alpha, R.drawable.abc_ic_menu_share_mtrl_alpha, R.drawable.abc_ic_menu_copy_mtrl_am_alpha, R.drawable.abc_ic_menu_cut_mtrl_alpha, R.drawable.abc_ic_menu_selectall_mtrl_alpha, R.drawable.abc_ic_menu_paste_mtrl_am_alpha, R.drawable.abc_ic_menu_moreoverflow_mtrl_alpha, R.drawable.abc_ic_voice_search_api_mtrl_alpha};
    private static final int[] COLORFILTER_COLOR_CONTROL_ACTIVATED = {R.drawable.abc_textfield_activated_mtrl_alpha, R.drawable.abc_textfield_search_activated_mtrl_alpha, R.drawable.abc_cab_background_top_mtrl_alpha, R.drawable.abc_text_cursor_material};
    private static final int[] COLORFILTER_COLOR_BACKGROUND_MULTIPLY = {R.drawable.abc_popup_background_mtrl_mult, R.drawable.abc_cab_background_internal_bg, R.drawable.abc_menu_hardkey_panel_mtrl_mult};
    private static final int[] TINT_COLOR_CONTROL_STATE_LIST = {R.drawable.abc_edit_text_material, R.drawable.abc_tab_indicator_material, R.drawable.abc_textfield_search_material, R.drawable.abc_spinner_mtrl_am_alpha, R.drawable.abc_spinner_textfield_background_material, R.drawable.abc_ratingbar_full_material, R.drawable.abc_switch_track_mtrl_alpha, R.drawable.abc_switch_thumb_material, R.drawable.abc_btn_default_mtrl_shape, R.drawable.abc_btn_borderless_material};
    private static final int[] TINT_CHECKABLE_BUTTON_LIST = {R.drawable.abc_btn_check_material, R.drawable.abc_btn_radio_material};

    /* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/AppCompatDrawableManager$InflateDelegate.class */
    public interface InflateDelegate {
        @Nullable
        Drawable onInflateDrawable(@NonNull Context context, @DrawableRes int i);
    }

    public static AppCompatDrawableManager get() {
        if (INSTANCE == null) {
            INSTANCE = new AppCompatDrawableManager();
        }
        return INSTANCE;
    }

    public Drawable getDrawable(@NonNull Context context, @DrawableRes int resId) {
        return getDrawable(context, resId, false);
    }

    public Drawable getDrawable(@NonNull Context context, @DrawableRes int resId, boolean failIfNotKnown) {
        if (this.mDelegates != null) {
            int count = this.mDelegates.size();
            for (int i = 0; i < count; i++) {
                InflateDelegate delegate = this.mDelegates.get(i);
                Drawable result = delegate.onInflateDrawable(context, resId);
                if (result != null) {
                    return result;
                }
            }
        }
        Drawable drawable = ContextCompat.getDrawable(context, resId);
        if (drawable != null) {
            if (Build.VERSION.SDK_INT >= 8) {
                drawable = drawable.mutate();
            }
            ColorStateList tintList = getTintList(context, resId);
            if (tintList != null) {
                drawable = DrawableCompat.wrap(drawable);
                DrawableCompat.setTintList(drawable, tintList);
                PorterDuff.Mode tintMode = getTintMode(resId);
                if (tintMode != null) {
                    DrawableCompat.setTintMode(drawable, tintMode);
                }
            } else {
                if (resId == R.drawable.abc_cab_background_top_material) {
                    return new LayerDrawable(new Drawable[]{getDrawable(context, R.drawable.abc_cab_background_internal_bg), getDrawable(context, R.drawable.abc_cab_background_top_mtrl_alpha)});
                }
                if (resId == R.drawable.abc_seekbar_track_material) {
                    LayerDrawable ld = (LayerDrawable) drawable;
                    setPorterDuffColorFilter(ld.findDrawableByLayerId(android.R.id.background), ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal), DEFAULT_MODE);
                    setPorterDuffColorFilter(ld.findDrawableByLayerId(android.R.id.secondaryProgress), ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal), DEFAULT_MODE);
                    setPorterDuffColorFilter(ld.findDrawableByLayerId(android.R.id.progress), ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated), DEFAULT_MODE);
                } else {
                    boolean tinted = tintDrawableUsingColorFilter(context, resId, drawable);
                    if (!tinted && failIfNotKnown) {
                        drawable = null;
                    }
                }
            }
        }
        return drawable;
    }

    public final boolean tintDrawableUsingColorFilter(@NonNull Context context, @DrawableRes int resId, @NonNull Drawable drawable) {
        PorterDuff.Mode tintMode = DEFAULT_MODE;
        boolean colorAttrSet = false;
        int colorAttr = 0;
        int alpha = -1;
        if (arrayContains(COLORFILTER_TINT_COLOR_CONTROL_NORMAL, resId)) {
            colorAttr = R.attr.colorControlNormal;
            colorAttrSet = true;
        } else if (arrayContains(COLORFILTER_COLOR_CONTROL_ACTIVATED, resId)) {
            colorAttr = R.attr.colorControlActivated;
            colorAttrSet = true;
        } else if (arrayContains(COLORFILTER_COLOR_BACKGROUND_MULTIPLY, resId)) {
            colorAttr = 16842801;
            colorAttrSet = true;
            tintMode = PorterDuff.Mode.MULTIPLY;
        } else if (resId == R.drawable.abc_list_divider_mtrl_alpha) {
            colorAttr = 16842800;
            colorAttrSet = true;
            alpha = Math.round(40.8f);
        }
        if (colorAttrSet) {
            int color = ThemeUtils.getThemeAttrColor(context, colorAttr);
            drawable.setColorFilter(getPorterDuffColorFilter(color, tintMode));
            if (alpha != -1) {
                drawable.setAlpha(alpha);
                return true;
            }
            return true;
        }
        return false;
    }

    public void addDelegate(@NonNull InflateDelegate delegate) {
        if (this.mDelegates == null) {
            this.mDelegates = new ArrayList<>();
        }
        if (!this.mDelegates.contains(delegate)) {
            this.mDelegates.add(delegate);
        }
    }

    public void removeDelegate(@NonNull InflateDelegate delegate) {
        if (this.mDelegates != null) {
            this.mDelegates.remove(delegate);
        }
    }

    private static boolean arrayContains(int[] array, int value) {
        for (int id : array) {
            if (id == value) {
                return true;
            }
        }
        return false;
    }

    final PorterDuff.Mode getTintMode(int resId) {
        PorterDuff.Mode mode = null;
        if (resId == R.drawable.abc_switch_thumb_material) {
            mode = PorterDuff.Mode.MULTIPLY;
        }
        return mode;
    }

    public final ColorStateList getTintList(@NonNull Context context, @DrawableRes int resId) {
        ColorStateList tint = getTintListFromCache(context, resId);
        if (tint == null) {
            if (resId == R.drawable.abc_edit_text_material) {
                tint = createEditTextColorStateList(context);
            } else if (resId == R.drawable.abc_switch_track_mtrl_alpha) {
                tint = createSwitchTrackColorStateList(context);
            } else if (resId == R.drawable.abc_switch_thumb_material) {
                tint = createSwitchThumbColorStateList(context);
            } else if (resId == R.drawable.abc_btn_default_mtrl_shape || resId == R.drawable.abc_btn_borderless_material) {
                tint = createDefaultButtonColorStateList(context);
            } else if (resId == R.drawable.abc_btn_colored_material) {
                tint = createColoredButtonColorStateList(context);
            } else if (resId == R.drawable.abc_spinner_mtrl_am_alpha || resId == R.drawable.abc_spinner_textfield_background_material) {
                tint = createSpinnerColorStateList(context);
            } else if (arrayContains(TINT_COLOR_CONTROL_NORMAL, resId)) {
                tint = ThemeUtils.getThemeAttrColorStateList(context, R.attr.colorControlNormal);
            } else if (arrayContains(TINT_COLOR_CONTROL_STATE_LIST, resId)) {
                tint = createDefaultColorStateList(context);
            } else if (arrayContains(TINT_CHECKABLE_BUTTON_LIST, resId)) {
                tint = createCheckableButtonColorStateList(context);
            } else if (resId == R.drawable.abc_seekbar_thumb_material) {
                tint = createSeekbarThumbColorStateList(context);
            }
            if (tint != null) {
                addTintListToCache(context, resId, tint);
            }
        }
        return tint;
    }

    private ColorStateList getTintListFromCache(@NonNull Context context, @DrawableRes int resId) {
        SparseArray<ColorStateList> tints;
        if (this.mTintLists == null || (tints = this.mTintLists.get(context)) == null) {
            return null;
        }
        return tints.get(resId);
    }

    private void addTintListToCache(@NonNull Context context, @DrawableRes int resId, @NonNull ColorStateList tintList) {
        if (this.mTintLists == null) {
            this.mTintLists = new WeakHashMap<>();
        }
        SparseArray<ColorStateList> themeTints = this.mTintLists.get(context);
        if (themeTints == null) {
            themeTints = new SparseArray<>();
            this.mTintLists.put(context, themeTints);
        }
        themeTints.append(resId, tintList);
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [int[], int[][]] */
    private ColorStateList createDefaultColorStateList(Context context) {
        int colorControlNormal = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal);
        int colorControlActivated = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
        ?? r0 = new int[7];
        int[] colors = new int[7];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorControlNormal);
        int i = 0 + 1;
        r0[i] = ThemeUtils.FOCUSED_STATE_SET;
        colors[i] = colorControlActivated;
        int i2 = i + 1;
        r0[i2] = ThemeUtils.ACTIVATED_STATE_SET;
        colors[i2] = colorControlActivated;
        int i3 = i2 + 1;
        r0[i3] = ThemeUtils.PRESSED_STATE_SET;
        colors[i3] = colorControlActivated;
        int i4 = i3 + 1;
        r0[i4] = ThemeUtils.CHECKED_STATE_SET;
        colors[i4] = colorControlActivated;
        int i5 = i4 + 1;
        r0[i5] = ThemeUtils.SELECTED_STATE_SET;
        colors[i5] = colorControlActivated;
        int i6 = i5 + 1;
        r0[i6] = ThemeUtils.EMPTY_STATE_SET;
        colors[i6] = colorControlNormal;
        int i7 = i6 + 1;
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createCheckableButtonColorStateList(Context context) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorControlNormal);
        int i = 0 + 1;
        r0[i] = ThemeUtils.CHECKED_STATE_SET;
        colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
        int i2 = i + 1;
        r0[i2] = ThemeUtils.EMPTY_STATE_SET;
        colors[i2] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal);
        int i3 = i2 + 1;
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createSwitchTrackColorStateList(Context context) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getThemeAttrColor(context, android.R.attr.colorForeground, 0.1f);
        int i = 0 + 1;
        r0[i] = ThemeUtils.CHECKED_STATE_SET;
        colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated, 0.3f);
        int i2 = i + 1;
        r0[i2] = ThemeUtils.EMPTY_STATE_SET;
        colors[i2] = ThemeUtils.getThemeAttrColor(context, android.R.attr.colorForeground, 0.3f);
        int i3 = i2 + 1;
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createSwitchThumbColorStateList(Context context) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        ColorStateList themeAttrColorStateList = ThemeUtils.getThemeAttrColorStateList(context, R.attr.colorSwitchThumbNormal);
        if (themeAttrColorStateList != null && themeAttrColorStateList.isStateful()) {
            r0[0] = ThemeUtils.DISABLED_STATE_SET;
            colors[0] = themeAttrColorStateList.getColorForState(r0[0], 0);
            int i = 0 + 1;
            r0[i] = ThemeUtils.CHECKED_STATE_SET;
            colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
            int i2 = i + 1;
            r0[i2] = ThemeUtils.EMPTY_STATE_SET;
            colors[i2] = themeAttrColorStateList.getDefaultColor();
            int i3 = i2 + 1;
        } else {
            r0[0] = ThemeUtils.DISABLED_STATE_SET;
            colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorSwitchThumbNormal);
            int i4 = 0 + 1;
            r0[i4] = ThemeUtils.CHECKED_STATE_SET;
            colors[i4] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
            int i5 = i4 + 1;
            r0[i5] = ThemeUtils.EMPTY_STATE_SET;
            colors[i5] = ThemeUtils.getThemeAttrColor(context, R.attr.colorSwitchThumbNormal);
            int i6 = i5 + 1;
        }
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createEditTextColorStateList(Context context) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorControlNormal);
        int i = 0 + 1;
        r0[i] = ThemeUtils.NOT_PRESSED_OR_FOCUSED_STATE_SET;
        colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal);
        int i2 = i + 1;
        r0[i2] = ThemeUtils.EMPTY_STATE_SET;
        colors[i2] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
        int i3 = i2 + 1;
        return new ColorStateList(r0, colors);
    }

    private ColorStateList createDefaultButtonColorStateList(Context context) {
        return createButtonColorStateList(context, R.attr.colorButtonNormal);
    }

    private ColorStateList createColoredButtonColorStateList(Context context) {
        return createButtonColorStateList(context, R.attr.colorAccent);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createButtonColorStateList(Context context, int baseColorAttr) {
        ?? r0 = new int[4];
        int[] colors = new int[4];
        int baseColor = ThemeUtils.getThemeAttrColor(context, baseColorAttr);
        int colorControlHighlight = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlHighlight);
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorButtonNormal);
        int i = 0 + 1;
        r0[i] = ThemeUtils.PRESSED_STATE_SET;
        colors[i] = ColorUtils.compositeColors(colorControlHighlight, baseColor);
        int i2 = i + 1;
        r0[i2] = ThemeUtils.FOCUSED_STATE_SET;
        colors[i2] = ColorUtils.compositeColors(colorControlHighlight, baseColor);
        int i3 = i2 + 1;
        r0[i3] = ThemeUtils.EMPTY_STATE_SET;
        colors[i3] = baseColor;
        int i4 = i3 + 1;
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createSpinnerColorStateList(Context context) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorControlNormal);
        int i = 0 + 1;
        r0[i] = ThemeUtils.NOT_PRESSED_OR_FOCUSED_STATE_SET;
        colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlNormal);
        int i2 = i + 1;
        r0[i2] = ThemeUtils.EMPTY_STATE_SET;
        colors[i2] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
        int i3 = i2 + 1;
        return new ColorStateList(r0, colors);
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createSeekbarThumbColorStateList(Context context) {
        ?? r0 = new int[2];
        int[] colors = new int[2];
        r0[0] = ThemeUtils.DISABLED_STATE_SET;
        colors[0] = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.colorControlActivated);
        int i = 0 + 1;
        r0[i] = ThemeUtils.EMPTY_STATE_SET;
        colors[i] = ThemeUtils.getThemeAttrColor(context, R.attr.colorControlActivated);
        int i2 = i + 1;
        return new ColorStateList(r0, colors);
    }

    /* loaded from: com.android.support.appcompat-v7.23.1.1.jar:android/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache.class */
    private static class ColorFilterLruCache extends LruCache<Integer, PorterDuffColorFilter> {
        public ColorFilterLruCache(int maxSize) {
            super(maxSize);
        }

        PorterDuffColorFilter get(int color, PorterDuff.Mode mode) {
            return (PorterDuffColorFilter) get(Integer.valueOf(generateCacheKey(color, mode)));
        }

        PorterDuffColorFilter put(int color, PorterDuff.Mode mode, PorterDuffColorFilter filter) {
            return (PorterDuffColorFilter) put(Integer.valueOf(generateCacheKey(color, mode)), filter);
        }

        private static int generateCacheKey(int color, PorterDuff.Mode mode) {
            int hashCode = (31 * 1) + color;
            return (31 * hashCode) + mode.hashCode();
        }
    }

    public static void tintDrawable(Drawable drawable, TintInfo tint, int[] state) {
        if (shouldMutateBackground(drawable) && drawable.mutate() != drawable) {
            Log.d(TAG, "Mutated drawable is not the same instance as the input.");
            return;
        }
        if (tint.mHasTintList || tint.mHasTintMode) {
            drawable.setColorFilter(createTintFilter(tint.mHasTintList ? tint.mTintList : null, tint.mHasTintMode ? tint.mTintMode : DEFAULT_MODE, state));
        } else {
            drawable.clearColorFilter();
        }
        if (Build.VERSION.SDK_INT <= 10) {
            drawable.invalidateSelf();
        }
    }

    private static boolean shouldMutateBackground(Drawable drawable) {
        if (Build.VERSION.SDK_INT >= 16) {
            return true;
        }
        if (drawable instanceof LayerDrawable) {
            return Build.VERSION.SDK_INT >= 16;
        }
        if (drawable instanceof InsetDrawable) {
            return Build.VERSION.SDK_INT >= 14;
        }
        if (drawable instanceof DrawableContainer) {
            Drawable.ConstantState state = drawable.getConstantState();
            if (state instanceof DrawableContainer.DrawableContainerState) {
                DrawableContainer.DrawableContainerState containerState = (DrawableContainer.DrawableContainerState) state;
                Drawable[] arr$ = containerState.getChildren();
                for (Drawable child : arr$) {
                    if (!shouldMutateBackground(child)) {
                        return false;
                    }
                }
                return true;
            }
            return true;
        }
        return true;
    }

    private static PorterDuffColorFilter createTintFilter(ColorStateList tint, PorterDuff.Mode tintMode, int[] state) {
        if (tint == null || tintMode == null) {
            return null;
        }
        int color = tint.getColorForState(state, 0);
        return getPorterDuffColorFilter(color, tintMode);
    }

    private static PorterDuffColorFilter getPorterDuffColorFilter(int color, PorterDuff.Mode mode) {
        PorterDuffColorFilter filter = COLOR_FILTER_CACHE.get(color, mode);
        if (filter == null) {
            filter = new PorterDuffColorFilter(color, mode);
            COLOR_FILTER_CACHE.put(color, mode, filter);
        }
        return filter;
    }

    private static void setPorterDuffColorFilter(Drawable d, int color, PorterDuff.Mode mode) {
        d.setColorFilter(getPorterDuffColorFilter(color, mode == null ? DEFAULT_MODE : mode));
    }
}
