package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.widget.TextView;
import com.wdullaer.materialdatetimepicker.R;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator.class */
public class TextViewWithCircularIndicator extends TextView {
    private static final int SELECTED_CIRCLE_ALPHA = 255;
    Paint mCirclePaint;
    private final int mRadius;
    private int mCircleColor;
    private final String mItemIsSelectedText;
    private boolean mDrawCircle;

    public TextViewWithCircularIndicator(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCirclePaint = new Paint();
        Resources res = context.getResources();
        this.mCircleColor = res.getColor(R.color.mdtp_accent_color);
        this.mRadius = res.getDimensionPixelOffset(R.dimen.mdtp_month_select_circle_radius);
        this.mItemIsSelectedText = context.getResources().getString(R.string.mdtp_item_is_selected);
        init();
    }

    private void init() {
        this.mCirclePaint.setFakeBoldText(true);
        this.mCirclePaint.setAntiAlias(true);
        this.mCirclePaint.setColor(this.mCircleColor);
        this.mCirclePaint.setTextAlign(Paint.Align.CENTER);
        this.mCirclePaint.setStyle(Paint.Style.FILL);
        this.mCirclePaint.setAlpha(255);
    }

    public void setAccentColor(int color) {
        this.mCircleColor = color;
        this.mCirclePaint.setColor(this.mCircleColor);
        setTextColor(createTextColor(color));
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [int[], int[][]] */
    private ColorStateList createTextColor(int accentColor) {
        int[] colors = {accentColor, -1, -16777216};
        return new ColorStateList(new int[]{new int[]{android.R.attr.state_pressed}, new int[]{android.R.attr.state_selected}, new int[0]}, colors);
    }

    public void drawIndicator(boolean drawCircle) {
        this.mDrawCircle = drawCircle;
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(@NonNull Canvas canvas) {
        if (this.mDrawCircle) {
            int width = getWidth();
            int height = getHeight();
            int radius = Math.min(width, height) / 2;
            canvas.drawCircle(width / 2, height / 2, radius, this.mCirclePaint);
        }
        setSelected(this.mDrawCircle);
        super.onDraw(canvas);
    }

    @Override // android.view.View
    public CharSequence getContentDescription() {
        CharSequence itemText = getText();
        return this.mDrawCircle ? String.format(this.mItemIsSelectedText, itemText) : itemText;
    }
}
