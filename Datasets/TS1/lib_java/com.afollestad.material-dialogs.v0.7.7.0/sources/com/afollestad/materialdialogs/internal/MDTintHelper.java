package com.afollestad.materialdialogs.internal;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v4.content.ContextCompat;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.support.v7.widget.AppCompatEditText;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.SeekBar;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/internal/MDTintHelper.class */
public class MDTintHelper {
    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    public static void setTint(RadioButton radioButton, int color) {
        ColorStateList sl = new ColorStateList(new int[]{new int[]{-16842912}, new int[]{R.attr.state_checked}}, new int[]{DialogUtils.resolveColor(radioButton.getContext(), com.afollestad.materialdialogs.R.attr.colorControlNormal), color});
        if (Build.VERSION.SDK_INT >= 21) {
            radioButton.setButtonTintList(sl);
            return;
        }
        Drawable d = DrawableCompat.wrap(ContextCompat.getDrawable(radioButton.getContext(), com.afollestad.materialdialogs.R.drawable.abc_btn_radio_material));
        DrawableCompat.setTintList(d, sl);
        radioButton.setButtonDrawable(d);
    }

    public static void setTint(SeekBar seekBar, int color) {
        ColorStateList s1 = ColorStateList.valueOf(color);
        if (Build.VERSION.SDK_INT >= 21) {
            seekBar.setThumbTintList(s1);
            seekBar.setProgressTintList(s1);
            return;
        }
        if (Build.VERSION.SDK_INT > 10) {
            Drawable progressDrawable = DrawableCompat.wrap(seekBar.getProgressDrawable());
            seekBar.setProgressDrawable(progressDrawable);
            DrawableCompat.setTintList(progressDrawable, s1);
            if (Build.VERSION.SDK_INT >= 16) {
                Drawable thumbDrawable = DrawableCompat.wrap(seekBar.getThumb());
                DrawableCompat.setTintList(thumbDrawable, s1);
                seekBar.setThumb(thumbDrawable);
                return;
            }
            return;
        }
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        if (Build.VERSION.SDK_INT <= 10) {
            mode = PorterDuff.Mode.MULTIPLY;
        }
        if (seekBar.getIndeterminateDrawable() != null) {
            seekBar.getIndeterminateDrawable().setColorFilter(color, mode);
        }
        if (seekBar.getProgressDrawable() != null) {
            seekBar.getProgressDrawable().setColorFilter(color, mode);
        }
    }

    public static void setTint(ProgressBar progressBar, int color) {
        setTint(progressBar, color, false);
    }

    public static void setTint(ProgressBar progressBar, int color, boolean skipIndeterminate) {
        ColorStateList sl = ColorStateList.valueOf(color);
        if (Build.VERSION.SDK_INT >= 21) {
            progressBar.setProgressTintList(sl);
            progressBar.setSecondaryProgressTintList(sl);
            if (!skipIndeterminate) {
                progressBar.setIndeterminateTintList(sl);
                return;
            }
            return;
        }
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        if (Build.VERSION.SDK_INT <= 10) {
            mode = PorterDuff.Mode.MULTIPLY;
        }
        if (!skipIndeterminate && progressBar.getIndeterminateDrawable() != null) {
            progressBar.getIndeterminateDrawable().setColorFilter(color, mode);
        }
        if (progressBar.getProgressDrawable() != null) {
            progressBar.getProgressDrawable().setColorFilter(color, mode);
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private static ColorStateList createEditTextColorStateList(Context context, int color) {
        ?? r0 = new int[3];
        int[] colors = new int[3];
        r0[0] = new int[]{-16842910};
        colors[0] = DialogUtils.resolveColor(context, com.afollestad.materialdialogs.R.attr.colorControlNormal);
        int i = 0 + 1;
        r0[i] = new int[]{-16842919, -16842908};
        colors[i] = DialogUtils.resolveColor(context, com.afollestad.materialdialogs.R.attr.colorControlNormal);
        int i2 = i + 1;
        r0[i2] = new int[0];
        colors[i2] = color;
        return new ColorStateList(r0, colors);
    }

    public static void setTint(EditText editText, int color) {
        ColorStateList editTextColorStateList = createEditTextColorStateList(editText.getContext(), color);
        if (editText instanceof AppCompatEditText) {
            ((AppCompatEditText) editText).setSupportBackgroundTintList(editTextColorStateList);
        } else if (Build.VERSION.SDK_INT >= 21) {
            editText.setBackgroundTintList(editTextColorStateList);
        }
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    public static void setTint(CheckBox box, int color) {
        ColorStateList sl = new ColorStateList(new int[]{new int[]{-16842912}, new int[]{R.attr.state_checked}}, new int[]{DialogUtils.resolveColor(box.getContext(), com.afollestad.materialdialogs.R.attr.colorControlNormal), color});
        if (Build.VERSION.SDK_INT >= 21) {
            box.setButtonTintList(sl);
            return;
        }
        Drawable drawable = DrawableCompat.wrap(ContextCompat.getDrawable(box.getContext(), com.afollestad.materialdialogs.R.drawable.abc_btn_check_material));
        DrawableCompat.setTintList(drawable, sl);
        box.setButtonDrawable(drawable);
    }
}
