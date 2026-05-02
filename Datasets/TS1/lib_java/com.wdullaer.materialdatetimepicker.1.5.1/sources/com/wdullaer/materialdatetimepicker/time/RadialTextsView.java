package com.wdullaer.materialdatetimepicker.time;

import android.animation.Keyframe;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.Log;
import android.view.View;
import com.wdullaer.materialdatetimepicker.R;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/time/RadialTextsView.class */
public class RadialTextsView extends View {
    private static final String TAG = "RadialTextsView";
    private final Paint mPaint;
    private final Paint mSelectedPaint;
    private boolean mDrawValuesReady;
    private boolean mIsInitialized;
    private int selection;
    private Typeface mTypefaceLight;
    private Typeface mTypefaceRegular;
    private String[] mTexts;
    private String[] mInnerTexts;
    private boolean mIs24HourMode;
    private boolean mHasInnerCircle;
    private float mCircleRadiusMultiplier;
    private float mAmPmCircleRadiusMultiplier;
    private float mNumbersRadiusMultiplier;
    private float mInnerNumbersRadiusMultiplier;
    private float mTextSizeMultiplier;
    private float mInnerTextSizeMultiplier;
    private int mXCenter;
    private int mYCenter;
    private float mCircleRadius;
    private boolean mTextGridValuesDirty;
    private float mTextSize;
    private float mInnerTextSize;
    private float[] mTextGridHeights;
    private float[] mTextGridWidths;
    private float[] mInnerTextGridHeights;
    private float[] mInnerTextGridWidths;
    private float mAnimationRadiusMultiplier;
    private float mTransitionMidRadiusMultiplier;
    private float mTransitionEndRadiusMultiplier;
    ObjectAnimator mDisappearAnimator;
    ObjectAnimator mReappearAnimator;
    private InvalidateUpdateListener mInvalidateUpdateListener;

    public RadialTextsView(Context context) {
        super(context);
        this.mPaint = new Paint();
        this.mSelectedPaint = new Paint();
        this.selection = -1;
        this.mIsInitialized = false;
    }

    public void initialize(Resources res, String[] texts, String[] innerTexts, boolean is24HourMode, boolean disappearsOut) {
        if (this.mIsInitialized) {
            Log.e(TAG, "This RadialTextsView may only be initialized once.");
            return;
        }
        int numbersTextColor = res.getColor(R.color.mdtp_numbers_text_color);
        this.mPaint.setColor(numbersTextColor);
        String typefaceFamily = res.getString(R.string.mdtp_radial_numbers_typeface);
        this.mTypefaceLight = Typeface.create(typefaceFamily, 0);
        String typefaceFamilyRegular = res.getString(R.string.mdtp_sans_serif);
        this.mTypefaceRegular = Typeface.create(typefaceFamilyRegular, 0);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        int selectedTextColor = res.getColor(R.color.mdtp_white);
        this.mSelectedPaint.setColor(selectedTextColor);
        this.mSelectedPaint.setAntiAlias(true);
        this.mSelectedPaint.setTextAlign(Paint.Align.CENTER);
        this.mTexts = texts;
        this.mInnerTexts = innerTexts;
        this.mIs24HourMode = is24HourMode;
        this.mHasInnerCircle = innerTexts != null;
        if (is24HourMode) {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier_24HourMode));
        } else {
            this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier));
            this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_ampm_circle_radius_multiplier));
        }
        this.mTextGridHeights = new float[7];
        this.mTextGridWidths = new float[7];
        if (this.mHasInnerCircle) {
            this.mNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_outer));
            this.mTextSizeMultiplier = Float.parseFloat(res.getString(R.string.mdtp_text_size_multiplier_outer));
            this.mInnerNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_inner));
            this.mInnerTextSizeMultiplier = Float.parseFloat(res.getString(R.string.mdtp_text_size_multiplier_inner));
            this.mInnerTextGridHeights = new float[7];
            this.mInnerTextGridWidths = new float[7];
        } else {
            this.mNumbersRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_numbers_radius_multiplier_normal));
            this.mTextSizeMultiplier = Float.parseFloat(res.getString(R.string.mdtp_text_size_multiplier_normal));
        }
        this.mAnimationRadiusMultiplier = 1.0f;
        this.mTransitionMidRadiusMultiplier = 1.0f + (0.05f * (disappearsOut ? -1 : 1));
        this.mTransitionEndRadiusMultiplier = 1.0f + (0.3f * (disappearsOut ? 1 : -1));
        this.mInvalidateUpdateListener = new InvalidateUpdateListener();
        this.mTextGridValuesDirty = true;
        this.mIsInitialized = true;
    }

    void setTheme(Context context, boolean themeDark) {
        int textColor;
        Resources res = context.getResources();
        if (themeDark) {
            textColor = res.getColor(R.color.mdtp_white);
        } else {
            textColor = res.getColor(R.color.mdtp_numbers_text_color);
        }
        this.mPaint.setColor(textColor);
    }

    protected void setSelection(int selection) {
        this.selection = selection;
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }

    public void setAnimationRadiusMultiplier(float animationRadiusMultiplier) {
        this.mAnimationRadiusMultiplier = animationRadiusMultiplier;
        this.mTextGridValuesDirty = true;
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
            this.mCircleRadius = Math.min(this.mXCenter, this.mYCenter) * this.mCircleRadiusMultiplier;
            if (!this.mIs24HourMode) {
                float amPmCircleRadius = this.mCircleRadius * this.mAmPmCircleRadiusMultiplier;
                this.mYCenter = (int) (this.mYCenter - (amPmCircleRadius * 0.75d));
            }
            this.mTextSize = this.mCircleRadius * this.mTextSizeMultiplier;
            if (this.mHasInnerCircle) {
                this.mInnerTextSize = this.mCircleRadius * this.mInnerTextSizeMultiplier;
            }
            renderAnimations();
            this.mTextGridValuesDirty = true;
            this.mDrawValuesReady = true;
        }
        if (this.mTextGridValuesDirty) {
            float numbersRadius = this.mCircleRadius * this.mNumbersRadiusMultiplier * this.mAnimationRadiusMultiplier;
            calculateGridSizes(numbersRadius, this.mXCenter, this.mYCenter, this.mTextSize, this.mTextGridHeights, this.mTextGridWidths);
            if (this.mHasInnerCircle) {
                float innerNumbersRadius = this.mCircleRadius * this.mInnerNumbersRadiusMultiplier * this.mAnimationRadiusMultiplier;
                calculateGridSizes(innerNumbersRadius, this.mXCenter, this.mYCenter, this.mInnerTextSize, this.mInnerTextGridHeights, this.mInnerTextGridWidths);
            }
            this.mTextGridValuesDirty = false;
        }
        drawTexts(canvas, this.mTextSize, this.mTypefaceLight, this.mTexts, this.mTextGridWidths, this.mTextGridHeights);
        if (this.mHasInnerCircle) {
            drawTexts(canvas, this.mInnerTextSize, this.mTypefaceRegular, this.mInnerTexts, this.mInnerTextGridWidths, this.mInnerTextGridHeights);
        }
    }

    private void calculateGridSizes(float numbersRadius, float xCenter, float yCenter, float textSize, float[] textGridHeights, float[] textGridWidths) {
        float offset2 = (numbersRadius * ((float) Math.sqrt(3.0d))) / 2.0f;
        float offset3 = numbersRadius / 2.0f;
        this.mPaint.setTextSize(textSize);
        this.mSelectedPaint.setTextSize(textSize);
        float yCenter2 = yCenter - ((this.mPaint.descent() + this.mPaint.ascent()) / 2.0f);
        textGridHeights[0] = yCenter2 - numbersRadius;
        textGridWidths[0] = xCenter - numbersRadius;
        textGridHeights[1] = yCenter2 - offset2;
        textGridWidths[1] = xCenter - offset2;
        textGridHeights[2] = yCenter2 - offset3;
        textGridWidths[2] = xCenter - offset3;
        textGridHeights[3] = yCenter2;
        textGridWidths[3] = xCenter;
        textGridHeights[4] = yCenter2 + offset3;
        textGridWidths[4] = xCenter + offset3;
        textGridHeights[5] = yCenter2 + offset2;
        textGridWidths[5] = xCenter + offset2;
        textGridHeights[6] = yCenter2 + numbersRadius;
        textGridWidths[6] = xCenter + numbersRadius;
    }

    private void drawTexts(Canvas canvas, float textSize, Typeface typeface, String[] texts, float[] textGridWidths, float[] textGridHeights) {
        this.mPaint.setTextSize(textSize);
        this.mPaint.setTypeface(typeface);
        canvas.drawText(texts[0], textGridWidths[3], textGridHeights[0], Integer.parseInt(texts[0]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[1], textGridWidths[4], textGridHeights[1], Integer.parseInt(texts[1]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[2], textGridWidths[5], textGridHeights[2], Integer.parseInt(texts[2]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[3], textGridWidths[6], textGridHeights[3], Integer.parseInt(texts[3]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[4], textGridWidths[5], textGridHeights[4], Integer.parseInt(texts[4]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[5], textGridWidths[4], textGridHeights[5], Integer.parseInt(texts[5]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[6], textGridWidths[3], textGridHeights[6], Integer.parseInt(texts[6]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[7], textGridWidths[2], textGridHeights[5], Integer.parseInt(texts[7]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[8], textGridWidths[1], textGridHeights[4], Integer.parseInt(texts[8]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[9], textGridWidths[0], textGridHeights[3], Integer.parseInt(texts[9]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[10], textGridWidths[1], textGridHeights[2], Integer.parseInt(texts[10]) == this.selection ? this.mSelectedPaint : this.mPaint);
        canvas.drawText(texts[11], textGridWidths[2], textGridHeights[1], Integer.parseInt(texts[11]) == this.selection ? this.mSelectedPaint : this.mPaint);
    }

    private void renderAnimations() {
        Keyframe kf0 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf1 = Keyframe.ofFloat(0.2f, this.mTransitionMidRadiusMultiplier);
        Keyframe kf2 = Keyframe.ofFloat(1.0f, this.mTransitionEndRadiusMultiplier);
        PropertyValuesHolder radiusDisappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf0, kf1, kf2);
        Keyframe kf02 = Keyframe.ofFloat(0.0f, 1.0f);
        Keyframe kf12 = Keyframe.ofFloat(1.0f, 0.0f);
        PropertyValuesHolder fadeOut = PropertyValuesHolder.ofKeyframe("alpha", kf02, kf12);
        this.mDisappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusDisappear, fadeOut).setDuration(500);
        this.mDisappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
        float totalDurationMultiplier = 1.0f + 0.25f;
        int totalDuration = (int) (500 * totalDurationMultiplier);
        float delayPoint = (0.25f * 500) / totalDuration;
        float midwayPoint = 1.0f - (0.2f * (1.0f - delayPoint));
        Keyframe kf03 = Keyframe.ofFloat(0.0f, this.mTransitionEndRadiusMultiplier);
        Keyframe kf13 = Keyframe.ofFloat(delayPoint, this.mTransitionEndRadiusMultiplier);
        Keyframe kf22 = Keyframe.ofFloat(midwayPoint, this.mTransitionMidRadiusMultiplier);
        Keyframe kf3 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder radiusReappear = PropertyValuesHolder.ofKeyframe("animationRadiusMultiplier", kf03, kf13, kf22, kf3);
        Keyframe kf04 = Keyframe.ofFloat(0.0f, 0.0f);
        Keyframe kf14 = Keyframe.ofFloat(delayPoint, 0.0f);
        Keyframe kf23 = Keyframe.ofFloat(1.0f, 1.0f);
        PropertyValuesHolder fadeIn = PropertyValuesHolder.ofKeyframe("alpha", kf04, kf14, kf23);
        this.mReappearAnimator = ObjectAnimator.ofPropertyValuesHolder(this, radiusReappear, fadeIn).setDuration(totalDuration);
        this.mReappearAnimator.addUpdateListener(this.mInvalidateUpdateListener);
    }

    public ObjectAnimator getDisappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady || this.mDisappearAnimator == null) {
            Log.e(TAG, "RadialTextView was not ready for animation.");
            return null;
        }
        return this.mDisappearAnimator;
    }

    public ObjectAnimator getReappearAnimator() {
        if (!this.mIsInitialized || !this.mDrawValuesReady || this.mReappearAnimator == null) {
            Log.e(TAG, "RadialTextView was not ready for animation.");
            return null;
        }
        return this.mReappearAnimator;
    }

    /* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/time/RadialTextsView$InvalidateUpdateListener.class */
    private class InvalidateUpdateListener implements ValueAnimator.AnimatorUpdateListener {
        private InvalidateUpdateListener() {
        }

        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
        public void onAnimationUpdate(ValueAnimator animation) {
            RadialTextsView.this.invalidate();
        }
    }
}
