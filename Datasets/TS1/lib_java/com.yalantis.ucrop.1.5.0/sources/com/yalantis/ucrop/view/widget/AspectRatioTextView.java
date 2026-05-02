package com.yalantis.ucrop.view.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.TextView;
import com.yalantis.ucrop.R;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/widget/AspectRatioTextView.class */
public class AspectRatioTextView extends TextView {
    private final Rect mCanvasClipBounds;
    private Paint mDotPaint;
    private int mDotSize;
    private float mAspectRatio;
    private String mAspectRatioTitle;
    private float mAspectRatioX;
    private float mAspectRatioY;

    public AspectRatioTextView(Context context) {
        this(context, null);
    }

    public AspectRatioTextView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public AspectRatioTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCanvasClipBounds = new Rect();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ucrop_AspectRatioTextView);
        init(a);
    }

    @TargetApi(21)
    public AspectRatioTextView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCanvasClipBounds = new Rect();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ucrop_AspectRatioTextView);
        init(a);
    }

    public void setActiveColor(@ColorInt int activeColor) {
        applyActiveColor(activeColor);
        invalidate();
    }

    public float getAspectRatio(boolean toggleRatio) {
        if (toggleRatio) {
            toggleAspectRatio();
            setTitle();
        }
        return this.mAspectRatio;
    }

    @Override // android.widget.TextView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (isSelected()) {
            canvas.getClipBounds(this.mCanvasClipBounds);
            canvas.drawCircle((this.mCanvasClipBounds.right - this.mCanvasClipBounds.left) / 2.0f, this.mCanvasClipBounds.bottom - this.mDotSize, this.mDotSize / 2, this.mDotPaint);
        }
    }

    private void init(@NonNull TypedArray a) {
        setGravity(1);
        this.mAspectRatioTitle = a.getString(R.styleable.ucrop_AspectRatioTextView_ucrop_artv_ratio_title);
        this.mAspectRatioX = a.getFloat(R.styleable.ucrop_AspectRatioTextView_ucrop_artv_ratio_x, 0.0f);
        this.mAspectRatioY = a.getFloat(R.styleable.ucrop_AspectRatioTextView_ucrop_artv_ratio_y, 0.0f);
        if (this.mAspectRatioX == 0.0f || this.mAspectRatioY == 0.0f) {
            this.mAspectRatio = 0.0f;
        } else {
            this.mAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
        }
        this.mDotSize = getContext().getResources().getDimensionPixelSize(R.dimen.ucrop_size_dot_scale_text_view);
        this.mDotPaint = new Paint(1);
        this.mDotPaint.setStyle(Paint.Style.FILL);
        setTitle();
        int activeColor = getResources().getColor(R.color.ucrop_color_widget_active);
        applyActiveColor(activeColor);
        a.recycle();
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [int[], int[][]] */
    private void applyActiveColor(@ColorInt int activeColor) {
        if (this.mDotPaint != null) {
            this.mDotPaint.setColor(activeColor);
        }
        ColorStateList textViewColorStateList = new ColorStateList(new int[]{new int[]{android.R.attr.state_selected}, new int[]{0}}, new int[]{activeColor, ContextCompat.getColor(getContext(), R.color.ucrop_color_widget)});
        setTextColor(textViewColorStateList);
    }

    private void toggleAspectRatio() {
        if (this.mAspectRatio != 0.0f) {
            float tempRatioW = this.mAspectRatioX;
            this.mAspectRatioX = this.mAspectRatioY;
            this.mAspectRatioY = tempRatioW;
            this.mAspectRatio = this.mAspectRatioX / this.mAspectRatioY;
        }
    }

    private void setTitle() {
        if (!TextUtils.isEmpty(this.mAspectRatioTitle)) {
            setText(this.mAspectRatioTitle);
        } else {
            setText(String.format("%d:%d", Integer.valueOf((int) this.mAspectRatioX), Integer.valueOf((int) this.mAspectRatioY)));
        }
    }
}
