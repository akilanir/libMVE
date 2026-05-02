package com.wdullaer.materialdatetimepicker.time;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.Log;
import android.view.View;
import com.wdullaer.materialdatetimepicker.R;
import java.text.DateFormatSymbols;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/time/AmPmCirclesView.class */
public class AmPmCirclesView extends View {
    private static final String TAG = "AmPmCirclesView";
    private static final int SELECTED_ALPHA = 255;
    private static final int SELECTED_ALPHA_THEME_DARK = 255;
    private final Paint mPaint;
    private int mSelectedAlpha;
    private int mTouchedColor;
    private int mUnselectedColor;
    private int mAmPmTextColor;
    private int mAmPmSelectedTextColor;
    private int mSelectedColor;
    private float mCircleRadiusMultiplier;
    private float mAmPmCircleRadiusMultiplier;
    private String mAmText;
    private String mPmText;
    private boolean mIsInitialized;
    private static final int AM = 0;
    private static final int PM = 1;
    private boolean mDrawValuesReady;
    private int mAmPmCircleRadius;
    private int mAmXCenter;
    private int mPmXCenter;
    private int mAmPmYCenter;
    private int mAmOrPm;
    private int mAmOrPmPressed;

    public AmPmCirclesView(Context context) {
        super(context);
        this.mPaint = new Paint();
        this.mIsInitialized = false;
    }

    public void initialize(Context context, int amOrPm) {
        if (this.mIsInitialized) {
            Log.e(TAG, "AmPmCirclesView may only be initialized once.");
            return;
        }
        Resources res = context.getResources();
        this.mUnselectedColor = res.getColor(R.color.mdtp_white);
        this.mSelectedColor = res.getColor(R.color.mdtp_accent_color);
        this.mTouchedColor = res.getColor(R.color.mdtp_accent_color_dark);
        this.mAmPmTextColor = res.getColor(R.color.mdtp_ampm_text_color);
        this.mAmPmSelectedTextColor = res.getColor(R.color.mdtp_white);
        this.mSelectedAlpha = 255;
        String typefaceFamily = res.getString(R.string.mdtp_sans_serif);
        Typeface tf = Typeface.create(typefaceFamily, 0);
        this.mPaint.setTypeface(tf);
        this.mPaint.setAntiAlias(true);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_circle_radius_multiplier));
        this.mAmPmCircleRadiusMultiplier = Float.parseFloat(res.getString(R.string.mdtp_ampm_circle_radius_multiplier));
        String[] amPmTexts = new DateFormatSymbols().getAmPmStrings();
        this.mAmText = amPmTexts[0];
        this.mPmText = amPmTexts[1];
        setAmOrPm(amOrPm);
        this.mAmOrPmPressed = -1;
        this.mIsInitialized = true;
    }

    void setTheme(Context context, boolean themeDark) {
        Resources res = context.getResources();
        if (themeDark) {
            this.mUnselectedColor = res.getColor(R.color.mdtp_circle_background_dark_theme);
            this.mSelectedColor = res.getColor(R.color.mdtp_red);
            this.mAmPmTextColor = res.getColor(R.color.mdtp_white);
            this.mSelectedAlpha = 255;
            return;
        }
        this.mUnselectedColor = res.getColor(R.color.mdtp_white);
        this.mSelectedColor = res.getColor(R.color.mdtp_accent_color);
        this.mAmPmTextColor = res.getColor(R.color.mdtp_ampm_text_color);
        this.mSelectedAlpha = 255;
    }

    public void setAccentColor(int accentColor) {
        this.mSelectedColor = accentColor;
    }

    public void setAmOrPm(int amOrPm) {
        this.mAmOrPm = amOrPm;
    }

    public void setAmOrPmPressed(int amOrPmPressed) {
        this.mAmOrPmPressed = amOrPmPressed;
    }

    public int getIsTouchingAmOrPm(float xCoord, float yCoord) {
        if (!this.mDrawValuesReady) {
            return -1;
        }
        int squaredYDistance = (int) ((yCoord - this.mAmPmYCenter) * (yCoord - this.mAmPmYCenter));
        int distanceToAmCenter = (int) Math.sqrt(((xCoord - this.mAmXCenter) * (xCoord - this.mAmXCenter)) + squaredYDistance);
        if (distanceToAmCenter <= this.mAmPmCircleRadius) {
            return 0;
        }
        int distanceToPmCenter = (int) Math.sqrt(((xCoord - this.mPmXCenter) * (xCoord - this.mPmXCenter)) + squaredYDistance);
        if (distanceToPmCenter <= this.mAmPmCircleRadius) {
            return 1;
        }
        return -1;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        int viewWidth = getWidth();
        if (viewWidth == 0 || !this.mIsInitialized) {
            return;
        }
        if (!this.mDrawValuesReady) {
            int layoutXCenter = getWidth() / 2;
            int layoutYCenter = getHeight() / 2;
            int circleRadius = (int) (Math.min(layoutXCenter, layoutYCenter) * this.mCircleRadiusMultiplier);
            this.mAmPmCircleRadius = (int) (circleRadius * this.mAmPmCircleRadiusMultiplier);
            int layoutYCenter2 = (int) (layoutYCenter + (this.mAmPmCircleRadius * 0.75d));
            int textSize = (this.mAmPmCircleRadius * 3) / 4;
            this.mPaint.setTextSize(textSize);
            this.mAmPmYCenter = (layoutYCenter2 - (this.mAmPmCircleRadius / 2)) + circleRadius;
            this.mAmXCenter = (layoutXCenter - circleRadius) + this.mAmPmCircleRadius;
            this.mPmXCenter = (layoutXCenter + circleRadius) - this.mAmPmCircleRadius;
            this.mDrawValuesReady = true;
        }
        int amColor = this.mUnselectedColor;
        int amAlpha = 255;
        int amTextColor = this.mAmPmTextColor;
        int pmColor = this.mUnselectedColor;
        int pmAlpha = 255;
        int pmTextColor = this.mAmPmTextColor;
        if (this.mAmOrPm == 0) {
            amColor = this.mSelectedColor;
            amAlpha = this.mSelectedAlpha;
            amTextColor = this.mAmPmSelectedTextColor;
        } else if (this.mAmOrPm == 1) {
            pmColor = this.mSelectedColor;
            pmAlpha = this.mSelectedAlpha;
            pmTextColor = this.mAmPmSelectedTextColor;
        }
        if (this.mAmOrPmPressed == 0) {
            amColor = this.mTouchedColor;
            amAlpha = this.mSelectedAlpha;
        } else if (this.mAmOrPmPressed == 1) {
            pmColor = this.mTouchedColor;
            pmAlpha = this.mSelectedAlpha;
        }
        this.mPaint.setColor(amColor);
        this.mPaint.setAlpha(amAlpha);
        canvas.drawCircle(this.mAmXCenter, this.mAmPmYCenter, this.mAmPmCircleRadius, this.mPaint);
        this.mPaint.setColor(pmColor);
        this.mPaint.setAlpha(pmAlpha);
        canvas.drawCircle(this.mPmXCenter, this.mAmPmYCenter, this.mAmPmCircleRadius, this.mPaint);
        this.mPaint.setColor(amTextColor);
        int textYCenter = this.mAmPmYCenter - (((int) (this.mPaint.descent() + this.mPaint.ascent())) / 2);
        canvas.drawText(this.mAmText, this.mAmXCenter, textYCenter, this.mPaint);
        this.mPaint.setColor(pmTextColor);
        canvas.drawText(this.mPmText, this.mPmXCenter, textYCenter, this.mPaint);
    }
}
