package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.util.AttributeSet;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/SimpleMonthView.class */
public class SimpleMonthView extends MonthView {
    public SimpleMonthView(Context context, AttributeSet attr, DatePickerController controller) {
        super(context, attr, controller);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.MonthView
    public void drawMonthDay(Canvas canvas, int year, int month, int day, int x, int y, int startX, int stopX, int startY, int stopY) {
        if (this.mSelectedDay == day) {
            canvas.drawCircle(x, y - (MINI_DAY_NUMBER_TEXT_SIZE / 3), DAY_SELECTED_CIRCLE_SIZE, this.mSelectedCirclePaint);
        }
        if (isHighlighted(year, month, day)) {
            this.mMonthNumPaint.setTypeface(Typeface.create(Typeface.DEFAULT, 1));
        } else {
            this.mMonthNumPaint.setTypeface(Typeface.create(Typeface.DEFAULT, 0));
        }
        if (isOutOfRange(year, month, day)) {
            this.mMonthNumPaint.setColor(this.mDisabledDayTextColor);
        } else if (this.mSelectedDay == day) {
            this.mMonthNumPaint.setTypeface(Typeface.create(Typeface.DEFAULT, 1));
            this.mMonthNumPaint.setColor(this.mSelectedDayTextColor);
        } else if (this.mHasToday && this.mToday == day) {
            this.mMonthNumPaint.setColor(this.mTodayNumberColor);
        } else {
            this.mMonthNumPaint.setColor(isHighlighted(year, month, day) ? this.mHighlightedDayTextColor : this.mDayTextColor);
        }
        canvas.drawText(String.format("%d", Integer.valueOf(day)), x, y, this.mMonthNumPaint);
    }
}
