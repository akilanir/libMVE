package com.wdullaer.materialdatetimepicker.time;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.Log;
import android.view.View;
import com.wdullaer.materialdatetimepicker.R;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/time/CircleView.class */
public class CircleView extends View {
    private static final String TAG = "CircleView";
    private final Paint mPaint;
    private boolean mIs24HourMode;
    private int mCircleColor;
    private int mDotColor;
    private float mCircleRadiusMultiplier;
    private float mAmPmCircleRadiusMultiplier;
    private boolean mIsInitialized;
    private boolean mDrawValuesReady;
    private int mXCenter;
    private int mYCenter;
    private int mCircleRadius;

    public CircleView(Context context) {
        super(context);
        this.mPaint = new Paint();
        Resources res = context.getResources();
        this.mCircleColor = res.getColor(R.color.mdtp_circle_color);
        this.mDotColor = res.getColor(R.color.mdtp_numbers_text_color);
        this.mPaint.setAntiAlias(true);
        this.mIsInitialized = false;
    }

    public void initialize(Context context, boolean is24HourMode) {
        if (this.mIsInitialized) {
            Log.e(TAG, "CircleView may only be initialized once.");
            return;
        }
        Resources res = context.getResources();
        this.mIs24HourMode = is24HourMode;
        if (is24HourMode) {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier_24HourMode));
        } else {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier));
            this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_ampm_circle_radius_multiplier));
        }
        this.mIsInitialized = true;
    }

    void setTheme(Context context, boolean dark) {
        Resources res = context.getResources();
        if (dark) {
            this.mCircleColor = res.getColor(R.color.mdtp_dark_gray);
            this.mDotColor = res.getColor(R.color.mdtp_white);
        } else {
            this.mCircleColor = res.getColor(R.color.mdtp_circle_color);
            this.mDotColor = res.getColor(R.color.mdtp_numbers_text_color);
        }
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int viewWidth = getWidth();
        if (viewWidth == 0 || !this.mIsInitialized) {
            return;
        }
        if (!this.mDrawValuesReady) {
            this.mXCenter = getWidth() / 2;
            this.mYCenter = getHeight() / 2;
            this.mCircleRadius = (int) (Math.min(this.mXCenter, this.mYCenter) * this.mCircleRadiusMultiplier);
            if (!this.mIs24HourMode) {
                int amPmCircleRadius = (int) (this.mCircleRadius * this.mAmPmCircleRadiusMultiplier);
                this.mYCenter = (int) (this.mYCenter - (amPmCircleRadius * 0.75d));
            }
            this.mDrawValuesReady = true;
        }
        this.mPaint.setColor(this.mCircleColor);
        canvas.drawCircle(this.mXCenter, this.mYCenter, this.mCircleRadius, this.mPaint);
        this.mPaint.setColor(this.mDotColor);
        canvas.drawCircle(this.mXCenter, this.mYCenter, 4.0f, this.mPaint);
    }
}
