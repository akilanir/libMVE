package com.wdullaer.materialdatetimepicker;

import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.annotation.SuppressLint;
import android.content.res.Resources;
import android.os.Build;
import android.util.TypedValue;
import android.view.View;
import com.wdullaer.materialdatetimepicker.date.DayPickerView;
import com.wdullaer.materialdatetimepicker.time.TimePickerDialog;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/Utils.class */
public class Utils {
    public static final int MONDAY_BEFORE_JULIAN_EPOCH = 2440585;
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

    public static int getDaysInMonth(int month, int year) {
        switch (month) {
            case 0:
            case TimePickerDialog.AMPM_INDEX /* 2 */:
            case BuildConfig.VERSION_CODE /* 4 */:
            case 6:
            case DayPickerView.DAYS_PER_WEEK /* 7 */:
            case 9:
            case 11:
                return 31;
            case 1:
                return year % 4 == 0 ? 29 : 28;
            case TimePickerDialog.ENABLE_PICKER_INDEX /* 3 */:
            case 5:
            case 8:
            case 10:
                return 30;
            default:
                throw new IllegalArgumentException("Invalid Month");
        }
    }

    public static int getJulianMondayFromWeeksSinceEpoch(int week) {
        return MONDAY_BEFORE_JULIAN_EPOCH + (week * 7);
    }

    public static int getWeeksSinceEpochFromJulianDay(int julianDay, int firstDayOfWeek) {
        int diff = 4 - firstDayOfWeek;
        if (diff < 0) {
            diff += 7;
        }
        int refDay = 2440588 - diff;
        return (julianDay - refDay) / 7;
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
}
