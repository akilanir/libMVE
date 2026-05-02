package com.wdullaer.materialdatetimepicker;

import android.R;
import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/Utils.class */
public class Utils {
    public static final int PULSE_ANIMATOR_DURATION = 544;
    public static final int SELECTED_ALPHA = 255;
    public static final int SELECTED_ALPHA_THEME_DARK = 255;
    public static final int FULL_ALPHA = 255;

    public static boolean isJellybeanOrLater() {
        return Build.VERSION.SDK_INT >= 16;
    }

    @SuppressLint({"NewApi"})
    public static void tryAccessibilityAnnounce(View view, CharSequence text) {
        if (isJellybeanOrLater() && view != null && text != null) {
            view.announceForAccessibility(text);
        }
    }

    public static ObjectAnimator getPulseAnimator(View labelToAnimate, float decreaseRatio, float increaseRatio) {
        Keyframe k0 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe k1 = Keyframe.ofFloat(0.275f, decreaseRatio);
        Keyframe k2 = Keyframe.ofFloat(0.69f, increaseRatio);
        Keyframe k3 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder scaleX = PropertyValuesHolder.ofKeyframe("scaleX", k0, k1, k2, k3);
        PropertyValuesHolder scaleY = PropertyValuesHolder.ofKeyframe("scaleY", k0, k1, k2, k3);
        ObjectAnimator pulseAnimator = ObjectAnimator.ofPropertyValuesHolder(labelToAnimate, scaleX, scaleY);
        pulseAnimator.setDuration(544L);
        return pulseAnimator;
    }

    public static int dpToPx(float dp, Resources resources) {
        float px = TypedValue.applyDimension(1, dp, resources.getDisplayMetrics());
        return (int) px;
    }

    public static int darkenColor(int color) {
        float[] hsv = new float[3];
        Color.colorToHSV(color, hsv);
        hsv[2] = hsv[2] * 0.8f;
        return Color.HSVToColor(hsv);
    }

    public static int getAccentColorFromThemeIfAvailable(Context context) {
        TypedValue typedValue = new TypedValue();
        if (Build.VERSION.SDK_INT >= 21) {
            context.getTheme().resolveAttribute(R.attr.colorAccent, typedValue, true);
            return typedValue.data;
        }
        int colorAccentResId = context.getResources().getIdentifier("colorAccent", "attr", context.getPackageName());
        if (colorAccentResId == 0 || !context.getTheme().resolveAttribute(colorAccentResId, typedValue, true)) {
            return -1;
        }
        return typedValue.data;
    }
}
