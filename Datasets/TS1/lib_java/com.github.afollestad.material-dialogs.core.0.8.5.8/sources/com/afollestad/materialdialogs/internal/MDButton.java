package com.afollestad.materialdialogs.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v7.text.AllCapsTransformationMethod;
import android.util.AttributeSet;
import android.widget.TextView;
import com.afollestad.materialdialogs.GravityEnum;
import com.afollestad.materialdialogs.R;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: com.github.afollestad.material-dialogs.core.0.8.5.8.jar:com/afollestad/materialdialogs/internal/MDButton.class */
public class MDButton extends TextView {
    private boolean mStacked;
    private GravityEnum mStackedGravity;
    private int mStackedEndPadding;
    private Drawable mStackedBackground;
    private Drawable mDefaultBackground;

    public MDButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mStacked = false;
        init(context, attrs, 0, 0);
    }

    public MDButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mStacked = false;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(21)
    public MDButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mStacked = false;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    private void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mStackedEndPadding = context.getResources().getDimensionPixelSize(R.dimen.md_dialog_frame_margin);
        this.mStackedGravity = GravityEnum.END;
    }

    void setStacked(boolean stacked, boolean force) {
        if (this.mStacked != stacked || force) {
            setGravity(stacked ? 16 | this.mStackedGravity.getGravityInt() : 17);
            if (Build.VERSION.SDK_INT >= 17) {
                setTextAlignment(stacked ? this.mStackedGravity.getTextAlignment() : 4);
            }
            DialogUtils.setBackgroundCompat(this, stacked ? this.mStackedBackground : this.mDefaultBackground);
            if (stacked) {
                setPadding(this.mStackedEndPadding, getPaddingTop(), this.mStackedEndPadding, getPaddingBottom());
            }
            this.mStacked = stacked;
        }
    }

    public void setStackedGravity(GravityEnum gravity) {
        this.mStackedGravity = gravity;
    }

    public void setStackedSelector(Drawable d) {
        this.mStackedBackground = d;
        if (this.mStacked) {
            setStacked(true, true);
        }
    }

    public void setDefaultSelector(Drawable d) {
        this.mDefaultBackground = d;
        if (!this.mStacked) {
            setStacked(false, true);
        }
    }

    public void setAllCapsCompat(boolean allCaps) {
        if (Build.VERSION.SDK_INT >= 14) {
            setAllCaps(allCaps);
        } else if (allCaps) {
            setTransformationMethod(new AllCapsTransformationMethod(getContext()));
        } else {
            setTransformationMethod(null);
        }
    }
}
