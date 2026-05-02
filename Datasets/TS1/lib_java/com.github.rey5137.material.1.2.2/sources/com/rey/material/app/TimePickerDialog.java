package com.rey.material.app;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.format.DateUtils;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import com.rey.material.R;
import com.rey.material.app.Dialog;
import com.rey.material.util.ThemeUtil;
import com.rey.material.widget.CircleCheckedTextView;
import com.rey.material.widget.TimePicker;
import java.text.DateFormat;
import java.util.Calendar;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/TimePickerDialog.class */
public class TimePickerDialog extends Dialog {
    private TimePickerLayout mTimePickerLayout;
    private float mCornerRadius;

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/TimePickerDialog$OnTimeChangedListener.class */
    public interface OnTimeChangedListener {
        void onTimeChanged(int i, int i2, int i3, int i4);
    }

    public TimePickerDialog(Context context) {
        super(context, R.style.Material_App_Dialog_TimePicker_Light);
    }

    public TimePickerDialog(Context context, int style) {
        super(context, style);
    }

    @Override // com.rey.material.app.Dialog
    protected void onCreate() {
        this.mTimePickerLayout = new TimePickerLayout(getContext());
        contentView(this.mTimePickerLayout);
    }

    @Override // com.rey.material.app.Dialog
    public Dialog applyStyle(int resId) {
        super.applyStyle(resId);
        if (resId == 0) {
            return this;
        }
        this.mTimePickerLayout.applyStyle(resId);
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

    public TimePickerDialog hour(int hour) {
        this.mTimePickerLayout.setHour(hour);
        return this;
    }

    public TimePickerDialog minute(int minute) {
        this.mTimePickerLayout.setMinute(minute);
        return this;
    }

    public TimePickerDialog onTimeChangedListener(OnTimeChangedListener listener) {
        this.mTimePickerLayout.setOnTimeChangedListener(listener);
        return this;
    }

    public int getHour() {
        return this.mTimePickerLayout.getHour();
    }

    public int getMinute() {
        return this.mTimePickerLayout.getMinute();
    }

    public String getFormattedTime(DateFormat formatter) {
        return this.mTimePickerLayout.getFormattedTime(formatter);
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/TimePickerDialog$TimePickerLayout.class */
    private class TimePickerLayout extends FrameLayout implements View.OnClickListener, TimePicker.OnTimeChangedListener {
        private int mHeaderHeight;
        private int mTextTimeColor;
        private int mTextTimeSize;
        private boolean mIsLeadingZero;
        private boolean mIsAm;
        private int mCheckBoxSize;
        private int mHeaderRealWidth;
        private int mHeaderRealHeight;
        private CircleCheckedTextView mAmView;
        private CircleCheckedTextView mPmView;
        private TimePicker mTimePicker;
        private Paint mPaint;
        private Path mHeaderBackground;
        private RectF mRect;
        private static final String TIME_DIVIDER = ":";
        private static final String BASE_TEXT = "0";
        private static final String FORMAT = "%02d";
        private static final String FORMAT_NO_LEADING_ZERO = "%d";
        private boolean mLocationDirty;
        private float mBaseY;
        private float mHourX;
        private float mDividerX;
        private float mMinuteX;
        private float mMiddayX;
        private float mHourWidth;
        private float mMinuteWidth;
        private float mBaseHeight;
        private String mHour;
        private String mMinute;
        private String mMidday;
        private OnTimeChangedListener mOnTimeChangedListener;

        public TimePickerLayout(Context context) {
            super(context);
            this.mTextTimeColor = -16777216;
            this.mIsLeadingZero = false;
            this.mIsAm = true;
            this.mLocationDirty = true;
            this.mPaint = new Paint(1);
            this.mPaint.setTextAlign(Paint.Align.LEFT);
            this.mHeaderBackground = new Path();
            this.mRect = new RectF();
            this.mAmView = new CircleCheckedTextView(context);
            this.mPmView = new CircleCheckedTextView(context);
            this.mTimePicker = new TimePicker(context);
            this.mTimePicker.setPadding(TimePickerDialog.this.mContentPadding, TimePickerDialog.this.mContentPadding, TimePickerDialog.this.mContentPadding, TimePickerDialog.this.mContentPadding);
            this.mTimePicker.setOnTimeChangedListener(this);
            this.mAmView.setGravity(17);
            this.mPmView.setGravity(17);
            if (Build.VERSION.SDK_INT >= 17) {
                this.mAmView.setTextAlignment(4);
                this.mPmView.setTextAlignment(4);
            }
            this.mAmView.setCheckedImmediately(this.mIsAm);
            this.mPmView.setCheckedImmediately(!this.mIsAm);
            this.mAmView.setOnClickListener(this);
            this.mPmView.setOnClickListener(this);
            addView(this.mTimePicker);
            addView(this.mAmView);
            addView(this.mPmView);
            setWillNotDraw(false);
            this.mCheckBoxSize = ThemeUtil.dpToPx(context, 48);
            this.mHeaderHeight = ThemeUtil.dpToPx(context, 120);
            this.mTextTimeSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_headline_material);
        }

        /* JADX WARN: Type inference failed for: r0v16, types: [int[], int[][]] */
        public void applyStyle(int resId) {
            this.mTimePicker.applyStyle(resId);
            Context context = getContext();
            TypedArray a = context.obtainStyledAttributes(resId, R.styleable.TimePickerDialog);
            String am = null;
            String pm = null;
            int count = a.getIndexCount();
            for (int i = 0; i < count; i++) {
                int attr = a.getIndex(i);
                if (attr == R.styleable.TimePickerDialog_tp_headerHeight) {
                    this.mHeaderHeight = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.TimePickerDialog_tp_textTimeColor) {
                    this.mTextTimeColor = a.getColor(attr, 0);
                } else if (attr == R.styleable.TimePickerDialog_tp_textTimeSize) {
                    this.mTextTimeSize = a.getDimensionPixelSize(attr, 0);
                } else if (attr == R.styleable.TimePickerDialog_tp_leadingZero) {
                    this.mIsLeadingZero = a.getBoolean(attr, false);
                } else if (attr == R.styleable.TimePickerDialog_tp_am) {
                    am = a.getString(attr);
                } else if (attr == R.styleable.TimePickerDialog_tp_pm) {
                    pm = a.getString(attr);
                }
            }
            a.recycle();
            if (am == null) {
                am = DateUtils.getAMPMString(0).toUpperCase();
            }
            if (pm == null) {
                pm = DateUtils.getAMPMString(1).toUpperCase();
            }
            ?? r0 = {new int[]{-16842912}, new int[]{android.R.attr.state_checked}};
            int[] colors = {this.mTimePicker.getTextColor(), this.mTimePicker.getTextHighlightColor()};
            this.mAmView.setBackgroundColor(this.mTimePicker.getSelectionColor());
            this.mAmView.setAnimDuration(this.mTimePicker.getAnimDuration());
            this.mAmView.setInterpolator(this.mTimePicker.getInInterpolator(), this.mTimePicker.getOutInterpolator());
            this.mAmView.setTypeface(this.mTimePicker.getTypeface());
            this.mAmView.setTextSize(0, this.mTimePicker.getTextSize());
            this.mAmView.setTextColor(new ColorStateList(r0, colors));
            this.mAmView.setText(am);
            this.mPmView.setBackgroundColor(this.mTimePicker.getSelectionColor());
            this.mPmView.setAnimDuration(this.mTimePicker.getAnimDuration());
            this.mPmView.setInterpolator(this.mTimePicker.getInInterpolator(), this.mTimePicker.getOutInterpolator());
            this.mPmView.setTypeface(this.mTimePicker.getTypeface());
            this.mPmView.setTextSize(0, this.mTimePicker.getTextSize());
            this.mPmView.setTextColor(new ColorStateList(r0, colors));
            this.mPmView.setText(pm);
            this.mPaint.setTypeface(this.mTimePicker.getTypeface());
            String str = this.mIsLeadingZero ? FORMAT : FORMAT_NO_LEADING_ZERO;
            Object[] objArr = new Object[1];
            objArr[0] = Integer.valueOf((this.mTimePicker.is24Hour() || this.mTimePicker.getHour() != 0) ? this.mTimePicker.getHour() : 12);
            this.mHour = String.format(str, objArr);
            this.mMinute = String.format(FORMAT, Integer.valueOf(this.mTimePicker.getMinute()));
            if (!this.mTimePicker.is24Hour()) {
                this.mMidday = this.mIsAm ? this.mAmView.getText().toString() : this.mPmView.getText().toString();
            }
            this.mLocationDirty = true;
            invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderRealHeight);
        }

        public void setHour(int hour) {
            if (!this.mTimePicker.is24Hour()) {
                if (hour > 11 && hour < 24) {
                    setAm(false, false);
                } else {
                    setAm(true, false);
                }
            }
            this.mTimePicker.setHour(hour);
        }

        public int getHour() {
            return (this.mTimePicker.is24Hour() || this.mIsAm) ? this.mTimePicker.getHour() : this.mTimePicker.getHour() + 12;
        }

        public void setMinute(int minute) {
            this.mTimePicker.setMinute(minute);
        }

        public int getMinute() {
            return this.mTimePicker.getMinute();
        }

        private void setAm(boolean am, boolean animation) {
            if (!this.mTimePicker.is24Hour() && this.mIsAm != am) {
                int oldHour = getHour();
                this.mIsAm = am;
                if (animation) {
                    this.mAmView.setChecked(this.mIsAm);
                    this.mPmView.setChecked(!this.mIsAm);
                } else {
                    this.mAmView.setCheckedImmediately(this.mIsAm);
                    this.mPmView.setCheckedImmediately(!this.mIsAm);
                }
                this.mMidday = this.mIsAm ? this.mAmView.getText().toString() : this.mPmView.getText().toString();
                invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderRealHeight);
                if (this.mOnTimeChangedListener != null) {
                    this.mOnTimeChangedListener.onTimeChanged(oldHour, getMinute(), getHour(), getMinute());
                }
            }
        }

        public String getFormattedTime(DateFormat formatter) {
            Calendar cal = Calendar.getInstance();
            cal.set(11, getHour());
            cal.set(12, getMinute());
            cal.set(13, 0);
            cal.set(14, 0);
            return formatter.format(cal.getTime());
        }

        public void setOnTimeChangedListener(OnTimeChangedListener listener) {
            this.mOnTimeChangedListener = listener;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            setAm(v == this.mAmView, true);
        }

        @Override // com.rey.material.widget.TimePicker.OnTimeChangedListener
        public void onModeChanged(int mode) {
            invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderRealHeight);
        }

        @Override // com.rey.material.widget.TimePicker.OnTimeChangedListener
        public void onHourChanged(int oldValue, int newValue) {
            int oldHour = (this.mTimePicker.is24Hour() || this.mIsAm) ? oldValue : oldValue + 12;
            String str = this.mIsLeadingZero ? FORMAT : FORMAT_NO_LEADING_ZERO;
            Object[] objArr = new Object[1];
            objArr[0] = Integer.valueOf((this.mTimePicker.is24Hour() || newValue != 0) ? newValue : 12);
            this.mHour = String.format(str, objArr);
            this.mLocationDirty = true;
            invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderRealHeight);
            if (this.mOnTimeChangedListener != null) {
                this.mOnTimeChangedListener.onTimeChanged(oldHour, getMinute(), getHour(), getMinute());
            }
        }

        @Override // com.rey.material.widget.TimePicker.OnTimeChangedListener
        public void onMinuteChanged(int oldValue, int newValue) {
            this.mMinute = String.format(FORMAT, Integer.valueOf(newValue));
            this.mLocationDirty = true;
            invalidate(0, 0, this.mHeaderRealWidth, this.mHeaderRealHeight);
            if (this.mOnTimeChangedListener != null) {
                this.mOnTimeChangedListener.onTimeChanged(getHour(), oldValue, getHour(), newValue);
            }
        }

        @Override // android.widget.FrameLayout, android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
            View.MeasureSpec.getMode(widthMeasureSpec);
            int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
            int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            int checkboxSize = this.mTimePicker.is24Hour() ? 0 : this.mCheckBoxSize;
            if (isPortrait) {
                if (heightMode == Integer.MIN_VALUE) {
                    heightSize = Math.min(heightSize, checkboxSize + widthSize + this.mHeaderHeight);
                }
                if (checkboxSize > 0) {
                    int spec = View.MeasureSpec.makeMeasureSpec(this.mCheckBoxSize, 1073741824);
                    this.mAmView.setVisibility(0);
                    this.mPmView.setVisibility(0);
                    this.mAmView.measure(spec, spec);
                    this.mPmView.measure(spec, spec);
                } else {
                    this.mAmView.setVisibility(8);
                    this.mPmView.setVisibility(8);
                }
                int spec2 = View.MeasureSpec.makeMeasureSpec(widthSize, 1073741824);
                this.mTimePicker.measure(spec2, spec2);
                setMeasuredDimension(widthSize, heightSize);
                return;
            }
            int halfWidth = widthSize / 2;
            if (heightMode == Integer.MIN_VALUE) {
                heightSize = Math.min(heightSize, Math.max(checkboxSize > 0 ? checkboxSize + this.mHeaderHeight + TimePickerDialog.this.mContentPadding : this.mHeaderHeight, halfWidth));
            }
            if (checkboxSize > 0) {
                int spec3 = View.MeasureSpec.makeMeasureSpec(checkboxSize, 1073741824);
                this.mAmView.setVisibility(0);
                this.mPmView.setVisibility(0);
                this.mAmView.measure(spec3, spec3);
                this.mPmView.measure(spec3, spec3);
            } else {
                this.mAmView.setVisibility(8);
                this.mPmView.setVisibility(8);
            }
            int spec4 = View.MeasureSpec.makeMeasureSpec(Math.min(halfWidth, heightSize), 1073741824);
            this.mTimePicker.measure(spec4, spec4);
            setMeasuredDimension(widthSize, heightSize);
        }

        @Override // android.view.View
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            this.mLocationDirty = true;
            int checkboxSize = this.mTimePicker.is24Hour() ? 0 : this.mCheckBoxSize;
            if (isPortrait) {
                this.mHeaderRealWidth = w;
                this.mHeaderRealHeight = (h - checkboxSize) - w;
                this.mHeaderBackground.reset();
                if (TimePickerDialog.this.mCornerRadius == 0.0f) {
                    this.mHeaderBackground.addRect(0.0f, 0.0f, this.mHeaderRealWidth, this.mHeaderRealHeight, Path.Direction.CW);
                    return;
                }
                this.mHeaderBackground.moveTo(0.0f, this.mHeaderRealHeight);
                this.mHeaderBackground.lineTo(0.0f, TimePickerDialog.this.mCornerRadius);
                this.mRect.set(0.0f, 0.0f, TimePickerDialog.this.mCornerRadius * 2.0f, TimePickerDialog.this.mCornerRadius * 2.0f);
                this.mHeaderBackground.arcTo(this.mRect, 180.0f, 90.0f, false);
                this.mHeaderBackground.lineTo(this.mHeaderRealWidth - TimePickerDialog.this.mCornerRadius, 0.0f);
                this.mRect.set(this.mHeaderRealWidth - (TimePickerDialog.this.mCornerRadius * 2.0f), 0.0f, this.mHeaderRealWidth, TimePickerDialog.this.mCornerRadius * 2.0f);
                this.mHeaderBackground.arcTo(this.mRect, 270.0f, 90.0f, false);
                this.mHeaderBackground.lineTo(this.mHeaderRealWidth, this.mHeaderRealHeight);
                this.mHeaderBackground.close();
                return;
            }
            this.mHeaderRealWidth = w / 2;
            this.mHeaderRealHeight = checkboxSize > 0 ? (h - checkboxSize) - TimePickerDialog.this.mContentPadding : h;
            this.mHeaderBackground.reset();
            if (TimePickerDialog.this.mCornerRadius == 0.0f) {
                this.mHeaderBackground.addRect(0.0f, 0.0f, this.mHeaderRealWidth, this.mHeaderRealHeight, Path.Direction.CW);
                return;
            }
            this.mHeaderBackground.moveTo(0.0f, this.mHeaderRealHeight);
            this.mHeaderBackground.lineTo(0.0f, TimePickerDialog.this.mCornerRadius);
            this.mRect.set(0.0f, 0.0f, TimePickerDialog.this.mCornerRadius * 2.0f, TimePickerDialog.this.mCornerRadius * 2.0f);
            this.mHeaderBackground.arcTo(this.mRect, 180.0f, 90.0f, false);
            this.mHeaderBackground.lineTo(this.mHeaderRealWidth, 0.0f);
            this.mHeaderBackground.lineTo(this.mHeaderRealWidth, this.mHeaderRealHeight);
            this.mHeaderBackground.close();
        }

        @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
        protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
            int childRight = right - left;
            int childBottom = bottom - top;
            boolean isPortrait = getContext().getResources().getConfiguration().orientation == 1;
            int checkboxSize = this.mTimePicker.is24Hour() ? 0 : this.mCheckBoxSize;
            if (isPortrait) {
                int paddingHorizontal = TimePickerDialog.this.mContentPadding + TimePickerDialog.this.mActionPadding;
                int paddingVertical = TimePickerDialog.this.mContentPadding - TimePickerDialog.this.mActionPadding;
                if (checkboxSize > 0) {
                    this.mAmView.layout(0 + paddingHorizontal, (childBottom - paddingVertical) - checkboxSize, 0 + paddingHorizontal + checkboxSize, childBottom - paddingVertical);
                    this.mPmView.layout((childRight - paddingHorizontal) - checkboxSize, (childBottom - paddingVertical) - checkboxSize, childRight - paddingHorizontal, childBottom - paddingVertical);
                }
                int childTop = 0 + this.mHeaderRealHeight;
                this.mTimePicker.layout(0, childTop, childRight, childBottom - checkboxSize);
                return;
            }
            int paddingHorizontal2 = ((childRight / 2) - this.mTimePicker.getMeasuredWidth()) / 2;
            int paddingVertical2 = (childBottom - this.mTimePicker.getMeasuredHeight()) / 2;
            this.mTimePicker.layout((childRight - paddingHorizontal2) - this.mTimePicker.getMeasuredWidth(), 0 + paddingVertical2, childRight - paddingHorizontal2, 0 + paddingVertical2 + this.mTimePicker.getMeasuredHeight());
            if (checkboxSize > 0) {
                int childRight2 = childRight / 2;
                int paddingHorizontal3 = TimePickerDialog.this.mContentPadding + TimePickerDialog.this.mActionPadding;
                int paddingVertical3 = TimePickerDialog.this.mContentPadding - TimePickerDialog.this.mActionPadding;
                this.mAmView.layout(0 + paddingHorizontal3, (childBottom - paddingVertical3) - checkboxSize, 0 + paddingHorizontal3 + checkboxSize, childBottom - paddingVertical3);
                this.mPmView.layout((childRight2 - paddingHorizontal3) - checkboxSize, (childBottom - paddingVertical3) - checkboxSize, childRight2 - paddingHorizontal3, childBottom - paddingVertical3);
            }
        }

        private void measureTimeText() {
            if (!this.mLocationDirty) {
                return;
            }
            this.mPaint.setTextSize(this.mTextTimeSize);
            Rect bounds = new Rect();
            this.mPaint.getTextBounds(BASE_TEXT, 0, BASE_TEXT.length(), bounds);
            this.mBaseHeight = bounds.height();
            this.mBaseY = (this.mHeaderRealHeight + this.mBaseHeight) / 2.0f;
            float dividerWidth = this.mPaint.measureText(TIME_DIVIDER, 0, TIME_DIVIDER.length());
            this.mHourWidth = this.mPaint.measureText(this.mHour, 0, this.mHour.length());
            this.mMinuteWidth = this.mPaint.measureText(this.mMinute, 0, this.mMinute.length());
            this.mDividerX = (this.mHeaderRealWidth - dividerWidth) / 2.0f;
            this.mHourX = this.mDividerX - this.mHourWidth;
            this.mMinuteX = this.mDividerX + dividerWidth;
            this.mMiddayX = this.mMinuteX + this.mMinuteWidth;
            this.mLocationDirty = false;
        }

        @Override // android.view.View
        public void draw(Canvas canvas) {
            super.draw(canvas);
            this.mPaint.setStyle(Paint.Style.FILL);
            this.mPaint.setColor(this.mTimePicker.getSelectionColor());
            canvas.drawPath(this.mHeaderBackground, this.mPaint);
            measureTimeText();
            this.mPaint.setTextSize(this.mTextTimeSize);
            this.mPaint.setColor(this.mTimePicker.getMode() == 0 ? this.mTimePicker.getTextHighlightColor() : this.mTextTimeColor);
            canvas.drawText(this.mHour, this.mHourX, this.mBaseY, this.mPaint);
            this.mPaint.setColor(this.mTextTimeColor);
            canvas.drawText(TIME_DIVIDER, this.mDividerX, this.mBaseY, this.mPaint);
            this.mPaint.setColor(this.mTimePicker.getMode() == 1 ? this.mTimePicker.getTextHighlightColor() : this.mTextTimeColor);
            canvas.drawText(this.mMinute, this.mMinuteX, this.mBaseY, this.mPaint);
            if (!this.mTimePicker.is24Hour()) {
                this.mPaint.setTextSize(this.mTimePicker.getTextSize());
                this.mPaint.setColor(this.mTextTimeColor);
                canvas.drawText(this.mMidday, this.mMiddayX, this.mBaseY, this.mPaint);
            }
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
                    return isTouched(this.mHourX, this.mBaseY - this.mBaseHeight, this.mHourX + this.mHourWidth, this.mBaseY, event.getX(), event.getY()) ? this.mTimePicker.getMode() == 1 : isTouched(this.mMinuteX, this.mBaseY - this.mBaseHeight, this.mMinuteX + this.mMinuteWidth, this.mBaseY, event.getX(), event.getY()) && this.mTimePicker.getMode() == 0;
                case 1:
                    if (isTouched(this.mHourX, this.mBaseY - this.mBaseHeight, this.mHourX + this.mHourWidth, this.mBaseY, event.getX(), event.getY())) {
                        this.mTimePicker.setMode(0, true);
                    }
                    if (isTouched(this.mMinuteX, this.mBaseY - this.mBaseHeight, this.mMinuteX + this.mMinuteWidth, this.mBaseY, event.getX(), event.getY())) {
                        this.mTimePicker.setMode(1, true);
                        return false;
                    }
                    return false;
                default:
                    return false;
            }
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/TimePickerDialog$Builder.class */
    public static class Builder extends Dialog.Builder implements OnTimeChangedListener {
        protected int mHour;
        protected int mMinute;
        public static final Parcelable.Creator<Builder> CREATOR = new Parcelable.Creator<Builder>() { // from class: com.rey.material.app.TimePickerDialog.Builder.1
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
            super(R.style.Material_App_Dialog_TimePicker_Light);
            Calendar cal = Calendar.getInstance();
            this.mHour = cal.get(11);
            this.mMinute = cal.get(12);
        }

        public Builder(int hourOfDay, int minute) {
            this(R.style.Material_App_Dialog_TimePicker_Light, hourOfDay, minute);
        }

        public Builder(int styleId, int hourOfDay, int minute) {
            super(styleId);
            hour(hourOfDay);
            minute(minute);
        }

        public Builder hour(int hour) {
            this.mHour = Math.min(Math.max(hour, 0), 24);
            return this;
        }

        public Builder minute(int minute) {
            this.mMinute = minute;
            return this;
        }

        public int getHour() {
            return this.mHour;
        }

        public int getMinute() {
            return this.mMinute;
        }

        @Override // com.rey.material.app.Dialog.Builder
        public Dialog.Builder contentView(int layoutId) {
            return this;
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected Dialog onBuild(Context context, int styleId) {
            TimePickerDialog dialog = new TimePickerDialog(context, styleId);
            dialog.hour(this.mHour).minute(this.mMinute).onTimeChangedListener(this);
            return dialog;
        }

        @Override // com.rey.material.app.TimePickerDialog.OnTimeChangedListener
        public void onTimeChanged(int oldHour, int oldMinute, int newHour, int newMinute) {
            hour(newHour).minute(newMinute);
        }

        protected Builder(Parcel in) {
            super(in);
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onWriteToParcel(Parcel dest, int flags) {
            dest.writeInt(this.mHour);
            dest.writeInt(this.mMinute);
        }

        @Override // com.rey.material.app.Dialog.Builder
        protected void onReadFromParcel(Parcel in) {
            this.mHour = in.readInt();
            this.mMinute = in.readInt();
        }
    }
}
