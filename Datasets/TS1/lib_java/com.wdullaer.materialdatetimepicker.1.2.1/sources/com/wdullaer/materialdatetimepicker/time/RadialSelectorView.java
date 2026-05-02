package com.wdullaer.materialdatetimepicker.time;

import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.Log;
import android.view.View;
import com.wdullaer.materialdatetimepicker.R;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/time/RadialSelectorView.class */
public class RadialSelectorView extends View {
    private static final String TAG = "RadialSelectorView";
    private static final int SELECTED_ALPHA = 255;
    private static final int SELECTED_ALPHA_THEME_DARK = 255;
    private static final int FULL_ALPHA = 255;
    private final Paint mPaint;
    private boolean mIsInitialized;
    private boolean mDrawValuesReady;
    private float mCircleRadiusMultiplier;
    private float mAmPmCircleRadiusMultiplier;
    private float mInnerNumbersRadiusMultiplier;
    private float mOuterNumbersRadiusMultiplier;
    private float mNumbersRadiusMultiplier;
    private float mSelectionRadiusMultiplier;
    private float mAnimationRadiusMultiplier;
    private boolean mIs24HourMode;
    private boolean mHasInnerCircle;
    private int mSelectionAlpha;
    private int mXCenter;
    private int mYCenter;
    private int mCircleRadius;
    private float mTransitionMidRadiusMultiplier;
    private float mTransitionEndRadiusMultiplier;
    private int mLineLength;
    private int mSelectionRadius;
    private InvalidateUpdateListener mInvalidateUpdateListener;
    private int mSelectionDegrees;
    private double mSelectionRadians;
    private boolean mForceDrawDot;

    public RadialSelectorView(Context context) {
        super(context);
        this.mPaint = new Paint();
        this.mIsInitialized = false;
    }

    public void initialize(Context context, boolean is24HourMode, boolean hasInnerCircle, boolean disappearsOut, int selectionDegrees, boolean isInnerCircle) {
        if (this.mIsInitialized) {
            Log.e(TAG, "This RadialSelectorView may only be initialized once.");
            return;
        }
        Resources res = context.getResources();
        int accentColor = res.getColor(R.color.mdtp_accent_color);
        this.mPaint.setColor(accentColor);
        this.mPaint.setAntiAlias(true);
        this.mSelectionAlpha = 255;
        this.mIs24HourMode = is24HourMode;
        if (is24HourMode) {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier_24HourMode));
        } else {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier));
            this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_ampm_circle_radius_multiplier));
        }
        this.mHasInnerCircle = hasInnerCircle;
        if (hasInnerCircle) {
            this.mInnerNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_inner));
            this.mOuterNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_outer));
        } else {
            this.mNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_normal));
        }
        this.mSelectionRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_selection_radius_multiplier));
        this.mAnimationRadiusMultiplier = 1.0f;
        this.mTransitionMidRadiusMultiplier = 1.0f + (0.05f * (disappearsOut ? -1 : 1));
        this.mTransitionEndRadiusMultiplier = 1.0f + (0.3f * (disappearsOut ? 1 : -1));
        this.mInvalidateUpdateListener = new InvalidateUpdateListener();
        setSelection(selectionDegrees, isInnerCircle, false);
        this.mIsInitialized = true;
    }

    void setTheme(Context context, boolean themeDark) {
        int color;
        Resources res = context.getResources();
        if (themeDark) {
            color = res.getColor(R.color.mdtp_red);
            this.mSelectionAlpha = 255;
        } else {
            color = res.getColor(R.color.mdtp_accent_color);
            this.mSelectionAlpha = 255;
        }
        this.mPaint.setColor(color);
    }

    public void setSelection(int selectionDegrees, boolean isInnerCircle, boolean forceDrawDot) {
        this.mSelectionDegrees = selectionDegrees;
        this.mSelectionRadians = (selectionDegrees * 3.141592653589793d) / 180.0d;
        this.mForceDrawDot = forceDrawDot;
        if (this.mHasInnerCircle) {
            if (isInnerCircle) {
                this.mNumbersRadiusMultiplier = this.mInnerNumbersRadiusMultiplier;
            } else {
                this.mNumbersRadiusMultiplier = this.mOuterNumbersRadiusMultiplier;
            }
        }
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    public void setAnimationRadiusMultiplier(float animationRadiusMultiplier) {
        this.mAnimationRadiusMultiplier = animationRadiusMultiplier;
    }

    public int getDegreesFromCoords(float pointX, float pointY, boolean forceLegal, Boolean[] isInnerCircle) {
        if (!this.mDrawValuesReady) {
            return -1;
        }
        double hypotenuse = Math.sqrt(((pointY - this.mYCenter) * (pointY - this.mYCenter)) + ((pointX - this.mXCenter) * (pointX - this.mXCenter)));
        if (this.mHasInnerCircle) {
            if (forceLegal) {
                int innerNumberRadius = (int) (this.mCircleRadius * this.mInnerNumbersRadiusMultiplier);
                int distanceToInnerNumber = (int) Math.abs(hypotenuse - innerNumberRadius);
                int outerNumberRadius = (int) (this.mCircleRadius * this.mOuterNumbersRadiusMultiplier);
                int distanceToOuterNumber = (int) Math.abs(hypotenuse - outerNumberRadius);
                isInnerCircle[0] = Boolean.valueOf(distanceToInnerNumber <= distanceToOuterNumber);
            } else {
                int minAllowedHypotenuseForInnerNumber = ((int) (this.mCircleRadius * this.mInnerNumbersRadiusMultiplier)) - this.mSelectionRadius;
                int maxAllowedHypotenuseForOuterNumber = ((int) (this.mCircleRadius * this.mOuterNumbersRadiusMultiplier)) + this.mSelectionRadius;
                int halfwayHypotenusePoint = (int) (this.mCircleRadius * ((this.mOuterNumbersRadiusMultiplier + this.mInnerNumbersRadiusMultiplier) / 2.0f));
                if (hypotenuse >= minAllowedHypotenuseForInnerNumber && hypotenuse <= halfwayHypotenusePoint) {
                    isInnerCircle[0] = true;
                } else if (hypotenuse <= maxAllowedHypotenuseForOuterNumber && hypotenuse >= halfwayHypotenusePoint) {
                    isInnerCircle[0] = false;
                } else {
                    return -1;
                }
            }
        } else if (!forceLegal) {
            int distanceToNumber = (int) Math.abs(hypotenuse - this.mLineLength);
            int maxAllowedDistance = (int) (this.mCircleRadius * (1.0f - this.mNumbersRadiusMultiplier));
            if (distanceToNumber > maxAllowedDistance) {
                return -1;
            }
        }
        float opposite = Math.abs(pointY - this.mYCenter);
        double radians = Math.asin(opposite / hypotenuse);
        int degrees = (int) ((radians * 180.0d) / 3.141592653589793d);
        boolean rightSide = pointX > ((float) this.mXCenter);
        boolean topSide = pointY < ((float) this.mYCenter);
        if (rightSide && topSide) {
            degrees = 90 - degrees;
        } else if (rightSide && !topSide) {
            degrees = 90 + degrees;
        } else if (!rightSide && !topSide) {
            degrees = 270 - degrees;
        } else if (!rightSide && topSide) {
            degrees = 270 + degrees;
        }
        return degrees;
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
            this.mSelectionRadius = (int) (this.mCircleRadius * this.mSelectionRadiusMultiplier);
            this.mDrawValuesReady = true;
        }
        this.mLineLength = (int) (this.mCircleRadius * this.mNumbersRadiusMultiplier * this.mAnimationRadiusMultiplier);
        int pointX = this.mXCenter + ((int) (this.mLineLength * Math.sin(this.mSelectionRadians)));
        int pointY = this.mYCenter - ((int) (this.mLineLength * Math.cos(this.mSelectionRadians)));
        this.mPaint.setAlpha(this.mSelectionAlpha);
        canvas.drawCircle(pointX, pointY, this.mSelectionRadius, this.mPaint);
        if (this.mForceDrawDot | (this.mSelectionDegrees % 30 != 0)) {
            this.mPaint.setAlpha(255);
            canvas.drawCircle(pointX, pointY, (this.mSelectionRadius * 2) / 7, this.mPaint);
        } else {
            int lineLength = this.mLineLength - this.mSelectionRadius;
            pointX = this.mXCenter + ((int) (lineLength * Math.sin(this.mSelectionRadians)));
            pointY = this.mYCenter - ((int) (lineLength * Math.cos(this.mSelectionRadians)));
        }
        this.mPaint.setAlpha(255);
        this.mPaint.setStrokeWidth(1.0f);
        canvas.drawLine(this.mXCenter, this.mYCenter, pointX, pointY, this.mPaint);
    }

    public ObjectAnimator getDisappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady) {
            Log.e(TAG, "RadialSelectorView was not ready for animation.");
            return null;
        }
        Keyframe kf0 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf1 = Keyframe.ofFloat(0.2f, this.mTransitionMidRadiusMultiplier);
        Keyframe kf2 = Keyframe.ofFloat(1.0f, this.mTransitionEndRadiusMultiplier);
        PropertyValuesHolder radiusDisappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf0, kf1, kf2);
        Keyframe kf02 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf12 = Keyframe.ofFloat(1.0f, 0.0f);
        PropertyValuesHolder fadeOut = PropertyValuesHolder.ofKeyframe("alpha", kf02, kf12);
        ObjectAnimator disappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusDisappear, fadeOut).setDuration(500);
        disappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
        return disappearAnimator;
    }

    public ObjectAnimator getReappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady) {
            Log.e(TAG, "RadialSelectorView was not ready for animation.");
            return null;
        }
        float totalDurationMultiplier = 1.0f + 0.25f;
        int totalDuration = (int) (500 * totalDurationMultiplier);
        float delayPoint = (0.25f * 500) / totalDuration;
        float midwayPoint = 1.0f - (0.2f * (1.0f - delayPoint));
        Keyframe kf0 = Keyframe.ofFloat(0.0f, this.mTransitionEndRadiusMultiplier);
        Keyframe kf1 = Keyframe.ofFloat(delayPoint, this.mTransitionEndRadiusMultiplier);
        Keyframe kf2 = Keyframe.ofFloat(midwayPoint, this.mTransitionMidRadiusMultiplier);
        Keyframe kf3 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder radiusReappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf0, kf1, kf2, kf3);
        Keyframe kf02 = Keyframe.ofFloat(0.0f, 0.0f);
        Keyframe kf12 = Keyframe.ofFloat(delayPoint, 0.0f);
        Keyframe kf22 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder fadeIn = PropertyValuesHolder.ofKeyframe("alpha", kf02, kf12, kf22);
        ObjectAnimator reappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusReappear, fadeIn).setDuration(totalDuration);
        reappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
        return reappearAnimator;
    }

    /* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/time/RadialSelectorView$InvalidateUpdateListener.class */
    private class InvalidateUpdateListener implements ValueAnimator.AnimatorUpdateListener {
        private InvalidateUpdateListener() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimator animation) {
            RadialSelectorView.this.invalidate();
        }
    }
}
