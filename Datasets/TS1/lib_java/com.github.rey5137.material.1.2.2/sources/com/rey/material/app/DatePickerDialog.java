package com.rey.material.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.FrameLayout;
import com.rey.material.R;
import com.rey.material.app.Dialog;
import com.rey.material.util.ThemeUtil;
import com.rey.material.widget.DatePicker;
import com.rey.material.widget.YearPicker;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DatePickerDialog.class */
public class DatePickerDialog extends Dialog {
    private DatePickerLayout mDatePickerLayout;
    private float mCornerRadius;
    private OnDateChangedListener mOnDateChangedListener;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DatePickerDialog$OnDateChangedListener.class */
    public interface OnDateChangedListener {
        void onDateChanged(int i, int i2, int i3, int i4, int i5, int i6);
    }

    public DatePickerDialog(Context context) {
        super(context, R.style.Material_App_Dialog_DatePicker_Light);
    }

    public DatePickerDialog(Context context, int style) {
        super(context, style);
    }

    @Override // com.rey.material.app.Dialog
    protected void onCreate() {
        this.mDatePickerLayout = new DatePickerLayout(getContext());
        contentView(this.mDatePickerLayout);
    }

    @Override // com.rey.material.app.Dialog
    public Dialog applyStyle(int resId) {
        super.applyStyle(resId);
        if (resId == 0) {
            return this;
        }
        this.mDatePickerLayout.applyStyle(resId);
        layoutParams(-1, -1);
        return this;
    }

    @Override // com.rey.material.app.Dialog
    public Dialog layoutParams(int width, int height) {
        return super.layoutParams(-1, -1);
    }

    @Override // com.rey.material.app.Dialog
    public Dialog cornerRadius(float radius) {
        this.mCornerRadius = radius;
        return super.cornerRadius(radius);
    }

    public DatePickerDialog dateRange(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear) {
        this.mDatePickerLayout.setDateRange(minDay, minMonth, minYear, maxDay, maxMonth, maxYear);
        return this;
    }

    public DatePickerDialog dateRange(long minTime, long maxTime) {
        this.mDatePickerLayout.setDateRange(minTime, maxTime);
        return this;
    }

    public DatePickerDialog date(int day, int month, int year) {
        this.mDatePickerLayout.setDate(day, month, year);
        return this;
    }

    public DatePickerDialog date(long time) {
        this.mDatePickerLayout.setDate(time);
        return this;
    }

    public DatePickerDialog onDateChangedListener(OnDateChangedListener listener) {
        this.mOnDateChangedListener = listener;
        return this;
    }

    public int getDay() {
        return this.mDatePickerLayout.getDay();
    }

    public int getMonth() {
        return this.mDatePickerLayout.getMonth();
    }

    public int getYear() {
        return this.mDatePickerLayout.getYear();
    }

    public long getDate() {
        Calendar cal = getCalendar();
        cal.set(14, 0);
        cal.set(13, 0);
        cal.set(12, 0);
        cal.set(10, 0);
        cal.set(5, getDay());
        cal.set(2, getMonth());
        cal.set(1, getYear());
        return cal.getTimeInMillis();
    }

    public Calendar getCalendar() {
        return this.mDatePickerLayout.getCalendar();
    }

    public String getFormattedDate(DateFormat formatter) {
        return this.mDatePickerLayout.getFormattedDate(formatter);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DatePickerDialog$DatePickerLayout.class */
    private class DatePickerLayout extends FrameLayout implements DatePicker.OnDateChangedListener, YearPicker.OnYearChangedListener {
        private YearPicker mYearPicker;
        private DatePicker mDatePicker;
        private int mHeaderPrimaryHeight;
        private int mHeaderPrimaryColor;
        private int mHeaderSecondaryHeight;
        private int mHeaderSecondaryColor;
        private int mHeaderPrimaryTextSize;
        private int mHeaderSecondaryTextSize;
        private int mTextHeaderColor;
        private Paint mPaint;
        private int mHeaderPrimaryRealHeight;
        private int mHeaderRealWidth;
        private RectF mRect;
        private Path mHeaderSecondaryBackground;
        private int mPadding;
        private boolean mDaySelectMode;
        private boolean mMonthFirst;
        private boolean mLocationDirty;
        private String mWeekDay;
        private String mMonth;
        private String mDay;
        private String mYear;
        private float mBaseX;
        private float mWeekDayY;
        private float mMonthY;
        private float mDayY;
        private float mYearY;
        private float mFirstWidth;
        private float mCenterY;
        private float mSecondWidth;
        private static final String BASE_TEXT = "0";
        private static final String DAY_FORMAT = "%2d";
        private static final String YEAR_FORMAT = "%4d";

        public DatePickerLayout(Context context) {
            super(context);
            this.mTextHeaderColor = -16777216;
            this.mDaySelectMode = true;
            this.mMonthFirst = true;
            this.mLocationDirty = true;
            this.mPaint = new Paint(1);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mPaint.setTextAlign(Paint.Align.CENTER);
            this.mRect = new RectF();
            this.mHeaderSecondaryBackground = new Path();
            this.mPadding = ThemeUtil.dpToPx(context, 8);
            this.mYearPicker = new YearPicker(context);
            this.mDatePicker = new DatePicker(context);
            this.mYearPicker.setPadding(this.mPadding, this.mPadding, this.mPadding, this.mPadding);
            this.mYearPicker.setOnYearChangedListener(this);
            this.mDatePicker.setContentPadding(this.mPadding, this.mPadding, this.mPadding, this.mPadding);
            this.mDatePicker.setOnDateChangedListener(this);
            addView(this.mDatePicker);
            addView(this.mYearPicker);
            this.mYearPicker.setVisibility(this.mDaySelectMode ? 8 : 0);
            this.mDatePicker.setVisibility(this.mDaySelectMode ? 0 : 8);
            this.mMonthFirst = isMonthFirst();
            setWillNotDraw(false);
            this.mHeaderPrimaryHeight = ThemeUtil.dpToPx(context, 144);
            this.mHeaderSecondaryHeight = ThemeUtil.dpToPx(context, 32);
            this.mHeaderPrimaryTextSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_display_2_material);
            this.mHeaderSecondaryTextSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_headline_material);
        }

        private boolean isMonthFirst() {
            SimpleDateFormat format = (SimpleDateFormat) SimpleDateFormat.getDateInstance(0);
            String pattern = format.toLocalizedPattern();
            return pattern.indexOf("M") < pattern.indexOf("d");
        }

        public void setDateSelectMode(boolean enable) {
            if (this.mDaySelectMode != enable) {
                this.mDaySelectMode = enable;
                if (this.mDaySelectMode) {
                    this.mDatePicker.goTo(this.mDatePicker.getMonth(), this.mDatePicker.getYear());
                    animOut(this.mYearPicker);
                    animIn(this.mDatePicker);
                } else {
                    this.mYearPicker.goTo(this.mYearPicker.getYear());
                    animOut(this.mDatePicker);
                    animIn(this.mYearPicker);
                }
                invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderPrimaryRealHeight + this.mHeaderSecondaryHeight);
            }
        }

        private void animOut(final View v) {
            Animation anim = new AlphaAnimation(1.0f, 0.0f);
            anim.setDuration(getContext().getResources().getInteger(android.R.integer.config_mediumAnimTime));
            anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.app.DatePickerDialog.DatePickerLayout.1
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    v.setVisibility(8);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }
            });
            v.startAnimation(anim);
        }

        private void animIn(final View v) {
            Animation anim = new AlphaAnimation(0.0f, 1.0f);
            anim.setDuration(getContext().getResources().getInteger(android.R.integer.config_mediumAnimTime));
            anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.rey.material.app.DatePickerDialog.DatePickerLayout.2
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    v.setVisibility(0);
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }
            });
            v.startAnimation(anim);
        }

        public void applyStyle(int resId) {
            this.mYearPicker.applyStyle(resId);
            this.mDatePicker.applyStyle(resId);
            this.mHeaderPrimaryColor = this.mDatePicker.getSelectionColor();
            this.mHeaderSecondaryColor = this.mHeaderPrimaryColor;
            Context context = getContext();
            TypedArray a = context.obtainStyledAttributes(resId, R.styleable.DatePickerDialog);
            int count = a.getIndexCount();
            for (int i = 0; i < count; i++) {
                int attr = a.getIndex(i);
                if (attr == R.styleable.DatePickerDialog_dp_headerPrimaryHeight) {
                    this.mHeaderPrimaryHeight = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_headerSecondaryHeight) {
                    this.mHeaderSecondaryHeight = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_headerPrimaryColor) {
                    this.mHeaderPrimaryColor = a.getColor(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_headerSecondaryColor) {
                    this.mHeaderSecondaryColor = a.getColor(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_headerPrimaryTextSize) {
                    this.mHeaderPrimaryTextSize = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_headerSecondaryTextSize) {
                    this.mHeaderSecondaryTextSize = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.DatePickerDialog_dp_textHeaderColor) {
                    this.mTextHeaderColor = a.getColor(attr, 0);
                }
            }
            a.recycle();
            this.mPaint.setTypeface(this.mDatePicker.getTypeface());
        }

        public void setDateRange(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear) {
            this.mDatePicker.setDateRange(minDay, minMonth, minYear, maxDay, maxMonth, maxYear);
            this.mYearPicker.setYearRange(minYear, maxYear);
        }

        public void setDateRange(long minTime, long maxTime) {
            Calendar cal = this.mDatePicker.getCalendar();
            cal.setTimeInMillis(minTime);
            int minDay = cal.get(5);
            int minMonth = cal.get(2);
            int minYear = cal.get(1);
            cal.setTimeInMillis(maxTime);
            int maxDay = cal.get(5);
            int maxMonth = cal.get(2);
            int maxYear = cal.get(1);
            setDateRange(minDay, minMonth, minYear, maxDay, maxMonth, maxYear);
        }

        public void setDate(int day, int month, int year) {
            this.mDatePicker.setDate(day, month, year);
        }

        public void setDate(long time) {
            Calendar cal = this.mDatePicker.getCalendar();
            cal.setTimeInMillis(time);
            int day = cal.get(5);
            int month = cal.get(2);
            int year = cal.get(1);
            this.mDatePicker.setDate(day, month, year);
        }

        public int getDay() {
            return this.mDatePicker.getDay();
        }

        public int getMonth() {
            return this.mDatePicker.getMonth();
        }

        public int getYear() {
            return this.mDatePicker.getYear();
        }

        public String getFormattedDate(DateFormat formatter) {
            return this.mDatePicker.getFormattedDate(formatter);
        }

        public Calendar getCalendar() {
            return this.mDatePicker.getCalendar();
        }

        @Override // com.rey.material.widget.YearPicker.OnYearChangedListener
        public void onYearChanged(int oldYear, int newYear) {
            if (!this.mDaySelectMode) {
                this.mDatePicker.setDate(this.mDatePicker.getDay(), this.mDatePicker.getMonth(), newYear);
            }
        }

        @Override // com.rey.material.widget.DatePicker.OnDateChangedListener
        public void onDateChanged(int oldDay, int oldMonth, int oldYear, int newDay, int newMonth, int newYear) {
            if (this.mDaySelectMode) {
                this.mYearPicker.setYear(newYear);
            }
            if (newDay < 0 || newMonth < 0 || newYear < 0) {
                this.mWeekDay = null;
                this.mMonth = null;
                this.mDay = null;
                this.mYear = null;
            } else {
                Calendar cal = this.mDatePicker.getCalendar();
                cal.set(1, newYear);
                cal.set(2, newMonth);
                cal.set(5, newDay);
                this.mWeekDay = cal.getDisplayName(7, 2, Locale.getDefault());
                this.mMonth = cal.getDisplayName(2, 1, Locale.getDefault());
                this.mDay = String.format(DAY_FORMAT, Integer.valueOf(newDay));
                this.mYear = String.format(YEAR_FORMAT, Integer.valueOf(newYear));
                if (oldMonth != newMonth || oldYear != newYear) {
                    this.mDatePicker.goTo(newMonth, newYear);
                }
            }
            this.mLocationDirty = true;
            invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderPrimaryRealHeight + this.mHeaderSecondaryHeight);
            if (DatePickerDialog.this.mOnDateChangedListener != null) {
                DatePickerDialog.this.mOnDateChangedListener.onDateChanged(oldDay, oldMonth, oldYear, newDay, newMonth, newYear);
            }
        }

        @Override // android.widget.FrameLayout, android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            View.MeasureSpec.getMode(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            if (isPortrait) {
                if (heightMode == Integer.MIN_VALUE) {
                    int ws = View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824);
                    int hs = View.MeasureSpec.makeMeasureSpec(0, 0);
                    this.mDatePicker.measure(ws, hs);
                    this.mYearPicker.measure(ws, ws);
                } else {
                    int height = Math.max((heightSize - this.mHeaderSecondaryHeight) - this.mHeaderPrimaryHeight, this.mDatePicker.getMeasuredHeight());
                    int ws2 = View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824);
                    this.mDatePicker.measure(ws2, View.MeasureSpec.makeMeasureSpec(height, 1073741824));
                    this.mYearPicker.measure(ws2, View.MeasureSpec.makeMeasureSpec(0, 0));
                    if (this.mYearPicker.getMeasuredHeight() != height) {
                        this.mYearPicker.measure(ws2, View.MeasureSpec.makeMeasureSpec(Math.min(this.mYearPicker.getMeasuredHeight(), height), 1073741824));
                    }
                }
                setMeasuredDimension(widthSize, heightSize);
                return;
            }
            if (heightMode == Integer.MIN_VALUE) {
                int ws3 = View.MeasureSpec.makeMeasureSpec(widthSize / 2, 1073741824);
                int hs2 = View.MeasureSpec.makeMeasureSpec(0, 0);
                this.mDatePicker.measure(ws3, hs2);
                this.mYearPicker.measure(ws3, ws3);
            } else {
                int height2 = Math.max(heightSize, this.mDatePicker.getMeasuredHeight());
                int ws4 = View.MeasureSpec.makeMeasureSpec(widthSize / 2, 1073741824);
                this.mDatePicker.measure(ws4, View.MeasureSpec.makeMeasureSpec(height2, 1073741824));
                this.mYearPicker.measure(ws4, View.MeasureSpec.makeMeasureSpec(0, 0));
                if (this.mYearPicker.getMeasuredHeight() != height2) {
                    this.mYearPicker.measure(ws4, View.MeasureSpec.makeMeasureSpec(Math.min(this.mYearPicker.getMeasuredHeight(), height2), 1073741824));
                }
            }
            setMeasuredDimension(widthSize, heightSize);
        }

        @Override // android.view.View
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            if (isPortrait) {
                this.mHeaderRealWidth = w;
                this.mHeaderPrimaryRealHeight = (h - this.mHeaderSecondaryHeight) - this.mDatePicker.getMeasuredHeight();
                this.mHeaderSecondaryBackground.reset();
                if (DatePickerDialog.this.mCornerRadius == 0.0f) {
                    this.mHeaderSecondaryBackground.addRect(0.0f, 0.0f, this.mHeaderRealWidth, this.mHeaderSecondaryHeight, Path.Direction.CW);
                    return;
                }
                this.mHeaderSecondaryBackground.moveTo(0.0f, this.mHeaderSecondaryHeight);
                this.mHeaderSecondaryBackground.lineTo(0.0f, DatePickerDialog.this.mCornerRadius);
                this.mRect.set(0.0f, 0.0f, DatePickerDialog.this.mCornerRadius * 2.0f, DatePickerDialog.this.mCornerRadius * 2.0f);
                this.mHeaderSecondaryBackground.arcTo(this.mRect, 180.0f, 90.0f, false);
                this.mHeaderSecondaryBackground.lineTo(this.mHeaderRealWidth - DatePickerDialog.this.mCornerRadius, 0.0f);
                this.mRect.set(this.mHeaderRealWidth - (DatePickerDialog.this.mCornerRadius * 2.0f), 0.0f, this.mHeaderRealWidth, DatePickerDialog.this.mCornerRadius * 2.0f);
                this.mHeaderSecondaryBackground.arcTo(this.mRect, 270.0f, 90.0f, false);
                this.mHeaderSecondaryBackground.lineTo(this.mHeaderRealWidth, this.mHeaderSecondaryHeight);
                this.mHeaderSecondaryBackground.close();
                return;
            }
            this.mHeaderRealWidth = w - this.mDatePicker.getMeasuredWidth();
            this.mHeaderPrimaryRealHeight = h - this.mHeaderSecondaryHeight;
            this.mHeaderSecondaryBackground.reset();
            if (DatePickerDialog.this.mCornerRadius == 0.0f) {
                this.mHeaderSecondaryBackground.addRect(0.0f, 0.0f, this.mHeaderRealWidth, this.mHeaderSecondaryHeight, Path.Direction.CW);
                return;
            }
            this.mHeaderSecondaryBackground.moveTo(0.0f, this.mHeaderSecondaryHeight);
            this.mHeaderSecondaryBackground.lineTo(0.0f, DatePickerDialog.this.mCornerRadius);
            this.mRect.set(0.0f, 0.0f, DatePickerDialog.this.mCornerRadius * 2.0f, DatePickerDialog.this.mCornerRadius * 2.0f);
            this.mHeaderSecondaryBackground.arcTo(this.mRect, 180.0f, 90.0f, false);
            this.mHeaderSecondaryBackground.lineTo(this.mHeaderRealWidth, 0.0f);
            this.mHeaderSecondaryBackground.lineTo(this.mHeaderRealWidth, this.mHeaderSecondaryHeight);
            this.mHeaderSecondaryBackground.close();
        }

        @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int childLeft = 0;
            int childTop = 0;
            int childRight = right - left;
            int childBottom = bottom - top;
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            if (isPortrait) {
                childTop = 0 + this.mHeaderPrimaryRealHeight + this.mHeaderSecondaryHeight;
            } else {
                childLeft = 0 + this.mHeaderRealWidth;
            }
            this.mDatePicker.layout(childLeft, childTop, childRight, childBottom);
            int childTop2 = ((childBottom + childTop) - this.mYearPicker.getMeasuredHeight()) / 2;
            this.mYearPicker.layout(childLeft, childTop2, childRight, childTop2 + this.mYearPicker.getMeasuredHeight());
        }

        private void measureHeaderText() {
            if (!this.mLocationDirty) {
                return;
            }
            if (this.mWeekDay == null) {
                this.mLocationDirty = false;
                return;
            }
            this.mBaseX = this.mHeaderRealWidth / 2.0f;
            Rect bounds = new Rect();
            this.mPaint.setTextSize(this.mDatePicker.getTextSize());
            this.mPaint.getTextBounds(BASE_TEXT, 0, BASE_TEXT.length(), bounds);
            int height = bounds.height();
            this.mWeekDayY = (this.mHeaderSecondaryHeight + height) / 2.0f;
            this.mPaint.setTextSize(this.mHeaderPrimaryTextSize);
            this.mPaint.getTextBounds(BASE_TEXT, 0, BASE_TEXT.length(), bounds);
            int primaryTextHeight = bounds.height();
            if (this.mMonthFirst) {
                this.mFirstWidth = this.mPaint.measureText(this.mDay, 0, this.mDay.length());
            } else {
                this.mFirstWidth = this.mPaint.measureText(this.mMonth, 0, this.mMonth.length());
            }
            this.mPaint.setTextSize(this.mHeaderSecondaryTextSize);
            this.mPaint.getTextBounds(BASE_TEXT, 0, BASE_TEXT.length(), bounds);
            int secondaryTextHeight = bounds.height();
            if (this.mMonthFirst) {
                this.mFirstWidth = Math.max(this.mFirstWidth, this.mPaint.measureText(this.mMonth, 0, this.mMonth.length()));
            } else {
                this.mFirstWidth = Math.max(this.mFirstWidth, this.mPaint.measureText(this.mDay, 0, this.mDay.length()));
            }
            this.mSecondWidth = this.mPaint.measureText(this.mYear, 0, this.mYear.length());
            this.mCenterY = this.mHeaderSecondaryHeight + ((this.mHeaderPrimaryRealHeight + primaryTextHeight) / 2.0f);
            float y = (((this.mHeaderPrimaryRealHeight - primaryTextHeight) / 2.0f) + secondaryTextHeight) / 2.0f;
            float aboveY = this.mHeaderSecondaryHeight + y;
            float belowY = this.mCenterY + y;
            if (this.mMonthFirst) {
                this.mDayY = this.mCenterY;
                this.mMonthY = aboveY;
            } else {
                this.mMonthY = this.mCenterY;
                this.mDayY = aboveY;
            }
            this.mYearY = belowY;
            this.mLocationDirty = false;
        }

        @Override // android.view.View
        public void draw(Canvas canvas) {
            super.draw(canvas);
            this.mPaint.setColor(this.mHeaderSecondaryColor);
            canvas.drawPath(this.mHeaderSecondaryBackground, this.mPaint);
            this.mPaint.setColor(this.mHeaderPrimaryColor);
            canvas.drawRect(0.0f, this.mHeaderSecondaryHeight, this.mHeaderRealWidth, this.mHeaderPrimaryRealHeight + this.mHeaderSecondaryHeight, this.mPaint);
            measureHeaderText();
            if (this.mWeekDay == null) {
                return;
            }
            this.mPaint.setTextSize(this.mDatePicker.getTextSize());
            this.mPaint.setColor(this.mDatePicker.getTextHighlightColor());
            canvas.drawText(this.mWeekDay, 0, this.mWeekDay.length(), this.mBaseX, this.mWeekDayY, this.mPaint);
            this.mPaint.setColor(this.mDaySelectMode ? this.mDatePicker.getTextHighlightColor() : this.mTextHeaderColor);
            this.mPaint.setTextSize(this.mHeaderPrimaryTextSize);
            if (this.mMonthFirst) {
                canvas.drawText(this.mDay, 0, this.mDay.length(), this.mBaseX, this.mDayY, this.mPaint);
            } else {
                canvas.drawText(this.mMonth, 0, this.mMonth.length(), this.mBaseX, this.mMonthY, this.mPaint);
            }
            this.mPaint.setTextSize(this.mHeaderSecondaryTextSize);
            if (this.mMonthFirst) {
                canvas.drawText(this.mMonth, 0, this.mMonth.length(), this.mBaseX, this.mMonthY, this.mPaint);
            } else {
                canvas.drawText(this.mDay, 0, this.mDay.length(), this.mBaseX, this.mDayY, this.mPaint);
            }
            this.mPaint.setColor(this.mDaySelectMode ? this.mTextHeaderColor : this.mDatePicker.getTextHighlightColor());
            canvas.drawText(this.mYear, 0, this.mYear.length(), this.mBaseX, this.mYearY, this.mPaint);
        }

        private boolean isTouched(float left, float top, float right, float bottom, float x, float y) {
            return x >= left && x <= right && y >= top && y <= bottom;
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            boolean handled = super.onTouchEvent(event);
            if (handled) {
                return handled;
            }
            switch (event.getAction()) {
                case 0:
                    if (isTouched(this.mBaseX - (this.mFirstWidth / 2.0f), this.mHeaderSecondaryHeight, this.mBaseX + (this.mFirstWidth / 2.0f), this.mCenterY, event.getX(), event.getY())) {
                        return !this.mDaySelectMode;
                    }
                    if (isTouched(this.mBaseX - (this.mSecondWidth / 2.0f), this.mCenterY, this.mBaseX + (this.mSecondWidth / 2.0f), this.mHeaderSecondaryHeight + this.mHeaderPrimaryRealHeight, event.getX(), event.getY())) {
                        return this.mDaySelectMode;
                    }
                    return false;
                case 1:
                    if (isTouched(this.mBaseX - (this.mFirstWidth / 2.0f), this.mHeaderSecondaryHeight, this.mBaseX + (this.mFirstWidth / 2.0f), this.mCenterY, event.getX(), event.getY())) {
                        setDateSelectMode(true);
                        return true;
                    }
                    if (isTouched(this.mBaseX - (this.mSecondWidth / 2.0f), this.mCenterY, this.mBaseX + (this.mSecondWidth / 2.0f), this.mHeaderSecondaryHeight + this.mHeaderPrimaryRealHeight, event.getX(), event.getY())) {
                        setDateSelectMode(false);
                        return true;
                    }
                    return false;
                default:
                    return false;
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DatePickerDialog$Builder.class */
    public static class Builder extends Dialog.Builder implements OnDateChangedListener {
        protected int mMinDay;
        protected int mMinMonth;
        protected int mMinYear;
        protected int mMaxDay;
        protected int mMaxMonth;
        protected int mMaxYear;
        protected int mDay;
        protected int mMonth;
        protected int mYear;
        private Calendar mCalendar;
        public static final Parcelable.Creator<Builder> CREATOR = new Parcelable.Creator<Builder>() { // from class: com.rey.material.app.DatePickerDialog.Builder.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder createFromParcel(Parcel in) {
                return new Builder(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public Builder[] newArray(int size) {
                return new Builder[size];
            }
        };

        public Builder() {
            this(R.style.Material_App_Dialog_DatePicker_Light);
        }

        public Builder(int styleId) {
            super(styleId);
            Calendar cal = Calendar.getInstance();
            this.mDay = cal.get(5);
            this.mMonth = cal.get(2);
            this.mYear = cal.get(1);
            this.mMinDay = this.mDay;
            this.mMinMonth = this.mMonth;
            this.mMinYear = this.mYear - 12;
            this.mMaxDay = this.mDay;
            this.mMaxMonth = this.mMonth;
            this.mMaxYear = this.mYear + 12;
        }

        public Builder(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear, int day, int month, int year) {
            this(R.style.Material_App_Dialog_DatePicker_Light, minDay, minMonth, minYear, maxDay, maxMonth, maxYear, day, month, year);
        }

        public Builder(int styleId, int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear, int day, int month, int year) {
            super(styleId);
            this.mMinDay = minDay;
            this.mMinMonth = minMonth;
            this.mMinYear = minYear;
            this.mMaxDay = maxDay;
            this.mMaxMonth = maxMonth;
            this.mMaxYear = maxYear;
            this.mDay = day;
            this.mMonth = month;
            this.mYear = year;
        }

        public Builder dateRange(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear) {
            this.mMinDay = minDay;
            this.mMinMonth = minMonth;
            this.mMinYear = minYear;
            this.mMaxDay = maxDay;
            this.mMaxMonth = maxMonth;
            this.mMaxYear = maxYear;
            return this;
        }

        public Builder dateRange(long minTime, long maxTime) {
            if (this.mCalendar == null) {
                this.mCalendar = Calendar.getInstance();
            }
            this.mCalendar.setTimeInMillis(minTime);
            int minDay = this.mCalendar.get(5);
            int minMonth = this.mCalendar.get(2);
            int minYear = this.mCalendar.get(1);
            this.mCalendar.setTimeInMillis(maxTime);
            int maxDay = this.mCalendar.get(5);
            int maxMonth = this.mCalendar.get(2);
            int maxYear = this.mCalendar.get(1);
            return dateRange(minDay, minMonth, minYear, maxDay, maxMonth, maxYear);
        }

        public Builder date(int day, int month, int year) {
            this.mDay = day;
            this.mMonth = month;
            this.mYear = year;
            return this;
        }

        public Builder date(long time) {
            if (this.mCalendar == null) {
                this.mCalendar = Calendar.getInstance();
            }
            this.mCalendar.setTimeInMillis(time);
            int day = this.mCalendar.get(5);
            int month = this.mCalendar.get(2);
            int year = this.mCalendar.get(1);
            return date(day, month, year);
        }

        public int getDay() {
            return this.mDay;
        }

        public int getMonth() {
            return this.mMonth;
        }

        public int getYear() {
            return this.mYear;
        }

        @Override // com.rey.material.app.Dialog.Builder
        public Dialog.Builder contentView(int layoutId) {
            return this;
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected Dialog onBuild(Context context, int styleId) {
            DatePickerDialog dialog = new DatePickerDialog(context, styleId);
            dialog.dateRange(this.mMinDay, this.mMinMonth, this.mMinYear, this.mMaxDay, this.mMaxMonth, this.mMaxYear).date(this.mDay, this.mMonth, this.mYear).onDateChangedListener(this);
            return dialog;
        }

        @Override // com.rey.material.app.DatePickerDialog.OnDateChangedListener
        public void onDateChanged(int oldDay, int oldMonth, int oldYear, int newDay, int newMonth, int newYear) {
            date(newDay, newMonth, newYear);
        }

        protected Builder(Parcel in) {
            super(in);
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onReadFromParcel(Parcel in) {
            this.mMinDay = in.readInt();
            this.mMinMonth = in.readInt();
            this.mMinYear = in.readInt();
            this.mMaxDay = in.readInt();
            this.mMaxMonth = in.readInt();
            this.mMaxYear = in.readInt();
            this.mDay = in.readInt();
            this.mMonth = in.readInt();
            this.mYear = in.readInt();
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onWriteToParcel(Parcel dest, int flags) {
            dest.writeInt(this.mMinDay);
            dest.writeInt(this.mMinMonth);
            dest.writeInt(this.mMinYear);
            dest.writeInt(this.mMaxDay);
            dest.writeInt(this.mMaxMonth);
            dest.writeInt(this.mMaxYear);
            dest.writeInt(this.mDay);
            dest.writeInt(this.mMonth);
            dest.writeInt(this.mYear);
        }
    }
}
