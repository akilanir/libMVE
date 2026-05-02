package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.View;
import com.rey.material.BuildConfig;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.CircularProgressDrawable;
import com.rey.material.drawable.LinearProgressDrawable;
import com.rey.material.util.ViewUtil;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/ProgressView.class */
public class ProgressView extends View implements ThemeManager.OnThemeChangedListener {
    protected int mStyleId;
    protected int mCurrentStyle;
    private boolean mAutostart;
    private boolean mCircular;
    private int mProgressId;
    public static final int MODE_DETERMINATE = 0;
    public static final int MODE_INDETERMINATE = 1;
    public static final int MODE_BUFFER = 2;
    public static final int MODE_QUERY = 3;
    private Drawable mProgressDrawable;

    public ProgressView(Context context) {
        super(context);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mAutostart = false;
        this.mCircular = true;
        init(context, null, 0, 0);
    }

    public ProgressView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mAutostart = false;
        this.mCircular = true;
        init(context, attrs, 0, 0);
    }

    public ProgressView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mAutostart = false;
        this.mCircular = true;
        init(context, attrs, defStyleAttr, 0);
    }

    @TargetApi(BuildConfig.VERSION_CODE)
    public ProgressView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCurrentStyle = ThemeManager.THEME_UNDEFINED;
        this.mAutostart = false;
        this.mCircular = true;
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        applyStyle(context, attrs, defStyleAttr, defStyleRes);
        if (!isInEditMode()) {
            this.mStyleId = ThemeManager.getStyleId(context, attrs, defStyleAttr, defStyleRes);
        }
    }

    public void applyStyle(int resId) {
        ViewUtil.applyStyle(this, resId);
        applyStyle(getContext(), null, 0, resId);
    }

    private boolean needCreateProgress(boolean circular) {
        if (this.mProgressDrawable == null) {
            return true;
        }
        return circular ? !(this.mProgressDrawable instanceof CircularProgressDrawable) : !(this.mProgressDrawable instanceof LinearProgressDrawable);
    }

    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ProgressView, defStyleAttr, defStyleRes);
        int progressId = 0;
        int progressMode = -1;
        float progress = -1.0f;
        float secondaryProgress = -1.0f;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.ProgressView_pv_autostart) {
                this.mAutostart = a.getBoolean(attr, false);
            } else if (attr == R.styleable.ProgressView_pv_circular) {
                this.mCircular = a.getBoolean(attr, true);
            } else if (attr == R.styleable.ProgressView_pv_progressStyle) {
                progressId = a.getResourceId(attr, 0);
            } else if (attr == R.styleable.ProgressView_pv_progressMode) {
                progressMode = a.getInteger(attr, 0);
            } else if (attr == R.styleable.ProgressView_pv_progress) {
                progress = a.getFloat(attr, 0.0f);
            } else if (attr == R.styleable.ProgressView_pv_secondaryProgress) {
                secondaryProgress = a.getFloat(attr, 0.0f);
            }
        }
        a.recycle();
        boolean needStart = false;
        if (needCreateProgress(this.mCircular)) {
            this.mProgressId = progressId;
            if (this.mProgressId == 0) {
                this.mProgressId = this.mCircular ? R.style.Material_Drawable_CircularProgress : R.style.Material_Drawable_LinearProgress;
            }
            needStart = this.mProgressDrawable != null && ((Animatable) this.mProgressDrawable).isRunning();
            this.mProgressDrawable = this.mCircular ? new CircularProgressDrawable.Builder(context, this.mProgressId).build() : new LinearProgressDrawable.Builder(context, this.mProgressId).build();
            ViewUtil.setBackground(this, this.mProgressDrawable);
        } else if (this.mProgressId != progressId) {
            this.mProgressId = progressId;
            if (this.mProgressDrawable instanceof CircularProgressDrawable) {
                ((CircularProgressDrawable) this.mProgressDrawable).applyStyle(context, this.mProgressId);
            } else {
                ((LinearProgressDrawable) this.mProgressDrawable).applyStyle(context, this.mProgressId);
            }
        }
        if (progressMode >= 0) {
            if (this.mProgressDrawable instanceof CircularProgressDrawable) {
                ((CircularProgressDrawable) this.mProgressDrawable).setProgressMode(progressMode);
            } else {
                ((LinearProgressDrawable) this.mProgressDrawable).setProgressMode(progressMode);
            }
        }
        if (progress >= 0.0f) {
            setProgress(progress);
        }
        if (secondaryProgress >= 0.0f) {
            setSecondaryProgress(secondaryProgress);
        }
        if (needStart) {
            start();
        }
    }

    @Override // com.rey.material.app.ThemeManager.OnThemeChangedListener
    public void onThemeChanged(ThemeManager.OnThemeChangedEvent event) {
        int style = ThemeManager.getInstance().getCurrentStyle(this.mStyleId);
        if (this.mCurrentStyle != style) {
            this.mCurrentStyle = style;
            applyStyle(this.mCurrentStyle);
        }
    }

    @Override // android.view.View
    protected void onVisibilityChanged(@NonNull View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (changedView == this && this.mAutostart) {
            if (visibility == 8 || visibility == 4) {
                stop();
            } else {
                start();
            }
        }
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (getVisibility() == 0 && this.mAutostart) {
            start();
        }
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().registerOnThemeChangedListener(this);
            onThemeChanged(null);
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        if (this.mAutostart) {
            stop();
        }
        super.onDetachedFromWindow();
        if (this.mStyleId != 0) {
            ThemeManager.getInstance().unregisterOnThemeChangedListener(this);
        }
    }

    public int getProgressMode() {
        if (this.mCircular) {
            return ((CircularProgressDrawable) this.mProgressDrawable).getProgressMode();
        }
        return ((LinearProgressDrawable) this.mProgressDrawable).getProgressMode();
    }

    public float getProgress() {
        if (this.mCircular) {
            return ((CircularProgressDrawable) this.mProgressDrawable).getProgress();
        }
        return ((LinearProgressDrawable) this.mProgressDrawable).getProgress();
    }

    public float getSecondaryProgress() {
        if (this.mCircular) {
            return ((CircularProgressDrawable) this.mProgressDrawable).getSecondaryProgress();
        }
        return ((LinearProgressDrawable) this.mProgressDrawable).getSecondaryProgress();
    }

    public void setProgress(float percent) {
        if (this.mCircular) {
            ((CircularProgressDrawable) this.mProgressDrawable).setProgress(percent);
        } else {
            ((LinearProgressDrawable) this.mProgressDrawable).setProgress(percent);
        }
    }

    public void setSecondaryProgress(float percent) {
        if (this.mCircular) {
            ((CircularProgressDrawable) this.mProgressDrawable).setSecondaryProgress(percent);
        } else {
            ((LinearProgressDrawable) this.mProgressDrawable).setSecondaryProgress(percent);
        }
    }

    public void start() {
        if (this.mProgressDrawable != null) {
            ((Animatable) this.mProgressDrawable).start();
        }
    }

    public void stop() {
        if (this.mProgressDrawable != null) {
            ((Animatable) this.mProgressDrawable).stop();
        }
    }
}
