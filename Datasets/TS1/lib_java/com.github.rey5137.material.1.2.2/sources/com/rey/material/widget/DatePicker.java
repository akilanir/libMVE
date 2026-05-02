package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Handler;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import com.rey.material.R;
import com.rey.material.app.ThemeManager;
import com.rey.material.drawable.BlankDrawable;
import com.rey.material.util.ThemeUtil;
import com.rey.material.util.TypefaceUtil;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/DatePicker.class */
public class DatePicker extends ListView implements AbsListView.OnScrollListener {
    private Typeface mTypeface;
    private int mTextSize;
    private int mTextColor;
    private int mTextLabelColor;
    private int mTextHighlightColor;
    private int mTextDisableColor;
    private int mSelectionColor;
    private int mAnimDuration;
    private Interpolator mInInterpolator;
    private Interpolator mOutInterpolator;
    private Paint mPaint;
    private float mDayBaseWidth;
    private float mDayBaseHeight;
    private float mDayHeight;
    private float mDayWidth;
    private int mDayPadding;
    private float mSelectionRadius;
    private int mMonthRealWidth;
    private int mMonthRealHeight;
    private Calendar mCalendar;
    private int mFirstDayOfWeek;
    private String[] mLabels;
    private static String[] mDayTexts;
    private MonthAdapter mAdapter;
    private OnDateChangedListener mOnDateChangedListener;
    protected static final int SCROLL_DURATION = 250;
    protected static final int SCROLL_CHANGE_DELAY = 40;
    protected static final int LIST_TOP_OFFSET = -1;
    protected Handler mHandler;
    protected int mCurrentScrollState;
    protected long mPreviousScrollPosition;
    protected int mPreviousScrollState;
    protected float mFriction;
    protected ScrollStateRunnable mScrollStateChangedRunnable;
    private int mPaddingLeft;
    private int mPaddingTop;
    private int mPaddingRight;
    private int mPaddingBottom;
    private static final String DAY_FORMAT = "%2d";
    private static final String YEAR_FORMAT = "%4d";

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/DatePicker$OnDateChangedListener.class */
    public interface OnDateChangedListener {
        void onDateChanged(int i, int i2, int i3, int i4, int i5, int i6);
    }

    public DatePicker(Context context) {
        super(context);
        this.mHandler = new Handler();
        this.mCurrentScrollState = 0;
        this.mPreviousScrollState = 0;
        this.mFriction = 1.0f;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context, null, 0, 0);
    }

    public DatePicker(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mHandler = new Handler();
        this.mCurrentScrollState = 0;
        this.mPreviousScrollState = 0;
        this.mFriction = 1.0f;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context, attrs, 0, 0);
    }

    public DatePicker(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mHandler = new Handler();
        this.mCurrentScrollState = 0;
        this.mPreviousScrollState = 0;
        this.mFriction = 1.0f;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context, attrs, defStyleAttr, 0);
    }

    public DatePicker(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mHandler = new Handler();
        this.mCurrentScrollState = 0;
        this.mPreviousScrollState = 0;
        this.mFriction = 1.0f;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.ListView
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        this.mTypeface = Typeface.DEFAULT;
        this.mTextSize = -1;
        this.mTextColor = -16777216;
        this.mTextLabelColor = -9013642;
        this.mTextHighlightColor = -1;
        this.mAnimDuration = -1;
        this.mLabels = new String[7];
        this.mFriction = 1.0f;
        setWillNotDraw(false);
        setSelector(BlankDrawable.getInstance());
        setCacheColorHint(0);
        setDivider(null);
        setItemsCanFocus(true);
        setFastScrollEnabled(false);
        setVerticalScrollBarEnabled(false);
        setOnScrollListener(this);
        setFadingEdgeLength(0);
        setFrictionIfSupported(ViewConfiguration.getScrollFriction() * this.mFriction);
        this.mPaint = new Paint(1);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setTextAlign(Paint.Align.CENTER);
        this.mDayPadding = ThemeUtil.dpToPx(context, 4);
        this.mSelectionColor = ThemeUtil.colorPrimary(context, -16777216);
        this.mCalendar = Calendar.getInstance();
        this.mFirstDayOfWeek = this.mCalendar.getFirstDayOfWeek();
        int index = this.mCalendar.get(7) - 1;
        DateFormat format = new SimpleDateFormat(Build.VERSION.SDK_INT >= 18 ? "EEEEE" : "E");
        for (int i = 0; i < 7; i++) {
            this.mLabels[index] = format.format(this.mCalendar.getTime());
            index = (index + 1) % 7;
            this.mCalendar.add(5, 1);
        }
        this.mAdapter = new MonthAdapter();
        setAdapter(this.mAdapter);
        super.init(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.rey.material.widget.ListView
    protected void applyStyle(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.applyStyle(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.DatePicker, defStyleAttr, defStyleRes);
        String familyName = null;
        int style = -1;
        int padding = -1;
        int paddingLeft = -1;
        int paddingRight = -1;
        int paddingTop = -1;
        int paddingBottom = -1;
        boolean paddingDefined = false;
        int count = a.getIndexCount();
        for (int i = 0; i < count; i++) {
            int attr = a.getIndex(i);
            if (attr == R.styleable.DatePicker_dp_dayTextSize) {
                this.mTextSize = a.getDimensionPixelSize(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_textColor) {
                this.mTextColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_textHighlightColor) {
                this.mTextHighlightColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_textLabelColor) {
                this.mTextLabelColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_textDisableColor) {
                this.mTextDisableColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_selectionColor) {
                this.mSelectionColor = a.getColor(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_animDuration) {
                this.mAnimDuration = a.getInteger(attr, 0);
            } else if (attr == R.styleable.DatePicker_dp_inInterpolator) {
                this.mInInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.DatePicker_dp_outInterpolator) {
                this.mOutInterpolator = AnimationUtils.loadInterpolator(context, a.getResourceId(attr, 0));
            } else if (attr == R.styleable.DatePicker_dp_fontFamily) {
                familyName = a.getString(attr);
            } else if (attr == R.styleable.DatePicker_dp_textStyle) {
                style = a.getInteger(attr, 0);
            } else if (attr == R.styleable.DatePicker_android_padding) {
                padding = a.getDimensionPixelSize(attr, 0);
                paddingDefined = true;
            } else if (attr == R.styleable.DatePicker_android_paddingLeft) {
                paddingLeft = a.getDimensionPixelSize(attr, 0);
                paddingDefined = true;
            } else if (attr == R.styleable.DatePicker_android_paddingTop) {
                paddingTop = a.getDimensionPixelSize(attr, 0);
                paddingDefined = true;
            } else if (attr == R.styleable.DatePicker_android_paddingRight) {
                paddingRight = a.getDimensionPixelSize(attr, 0);
                paddingDefined = true;
            } else if (attr == R.styleable.DatePicker_android_paddingBottom) {
                paddingBottom = a.getDimensionPixelSize(attr, 0);
                paddingDefined = true;
            }
        }
        if (this.mTextSize < 0) {
            this.mTextSize = context.getResources().getDimensionPixelOffset(R.dimen.abc_text_size_caption_material);
        }
        if (this.mAnimDuration < 0) {
            this.mAnimDuration = context.getResources().getInteger(android.R.integer.config_mediumAnimTime);
        }
        if (this.mInInterpolator == null) {
            this.mInInterpolator = new DecelerateInterpolator();
        }
        if (this.mOutInterpolator == null) {
            this.mOutInterpolator = new DecelerateInterpolator();
        }
        if (familyName != null || style >= 0) {
            this.mTypeface = TypefaceUtil.load(context, familyName, style);
        }
        a.recycle();
        if (paddingDefined) {
            if (padding >= 0) {
                setContentPadding(padding, padding, padding, padding);
            }
            if (paddingLeft >= 0) {
                this.mPaddingLeft = paddingLeft;
            }
            if (paddingTop >= 0) {
                this.mPaddingTop = paddingTop;
            }
            if (paddingRight >= 0) {
                this.mPaddingRight = paddingRight;
            }
            if (paddingBottom >= 0) {
                this.mPaddingBottom = paddingBottom;
            }
        }
        requestLayout();
        this.mAdapter.notifyDataSetInvalidated();
    }

    @TargetApi(11)
    private void setFrictionIfSupported(float friction) {
        if (Build.VERSION.SDK_INT >= 11) {
            setFriction(friction);
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        MonthView child = (MonthView) view.getChildAt(0);
        if (child == null) {
            return;
        }
        this.mPreviousScrollPosition = (getFirstVisiblePosition() * child.getHeight()) - child.getBottom();
        this.mPreviousScrollState = this.mCurrentScrollState;
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView absListView, int scroll) {
        this.mScrollStateChangedRunnable.doScrollStateChange(absListView, scroll);
    }

    private void measureBaseSize() {
        this.mPaint.setTextSize(this.mTextSize);
        this.mPaint.setTypeface(this.mTypeface);
        this.mDayBaseWidth = this.mPaint.measureText("88", 0, 2) + (this.mDayPadding * 2);
        Rect bounds = new Rect();
        this.mPaint.getTextBounds("88", 0, 2, bounds);
        this.mDayBaseHeight = bounds.height();
    }

    private void measureMonthView(int widthMeasureSpec, int heightMeasureSpec) {
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int widthSize = View.MeasureSpec.getSize(widthMeasureSpec);
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        measureBaseSize();
        int size = Math.round(Math.max(this.mDayBaseWidth, this.mDayBaseHeight));
        int width = (size * 7) + this.mPaddingLeft + this.mPaddingRight;
        int height = Math.round((size * 7) + this.mDayBaseHeight + (this.mDayPadding * 2) + this.mPaddingTop + this.mPaddingBottom);
        switch (widthMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                width = Math.min(width, widthSize);
                break;
            case 1073741824:
                width = widthSize;
                break;
        }
        switch (heightMode) {
            case ThemeManager.THEME_UNDEFINED /* -2147483648 */:
                height = Math.min(height, heightSize);
                break;
            case 1073741824:
                height = heightSize;
                break;
        }
        this.mMonthRealWidth = width;
        this.mMonthRealHeight = height;
    }

    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        measureMonthView(widthMeasureSpec, heightMeasureSpec);
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.mDayWidth = ((w - this.mPaddingLeft) - this.mPaddingRight) / 7.0f;
        this.mDayHeight = ((((h - this.mDayBaseHeight) - (this.mDayPadding * 2)) - this.mPaddingTop) - this.mPaddingBottom) / 7.0f;
        this.mSelectionRadius = Math.min(this.mDayWidth, this.mDayHeight) / 2.0f;
    }

    public void setPadding(int left, int top, int right, int bottom) {
        super.setPadding(0, 0, 0, 0);
    }

    public void setContentPadding(int left, int top, int right, int bottom) {
        this.mPaddingLeft = left;
        this.mPaddingTop = top;
        this.mPaddingRight = right;
        this.mPaddingBottom = bottom;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getDayText(int day) {
        if (mDayTexts == null) {
            synchronized (DatePicker.class) {
                if (mDayTexts == null) {
                    mDayTexts = new String[31];
                }
            }
        }
        if (mDayTexts[day - 1] == null) {
            mDayTexts[day - 1] = String.format(DAY_FORMAT, Integer.valueOf(day));
        }
        return mDayTexts[day - 1];
    }

    public void setDateRange(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear) {
        this.mAdapter.setDateRange(minDay, minMonth, minYear, maxDay, maxMonth, maxYear);
    }

    public void goTo(int month, int year) {
        int position = this.mAdapter.positionOfMonth(month, year);
        postSetSelectionFromTop(position, 0);
    }

    public void postSetSelectionFromTop(final int position, final int offset) {
        post(new Runnable() { // from class: com.rey.material.widget.DatePicker.1
            @Override // java.lang.Runnable
            public void run() {
                DatePicker.this.setSelectionFromTop(position, offset);
                DatePicker.this.requestLayout();
            }
        });
    }

    public void setDate(int day, int month, int year) {
        if (this.mAdapter.getYear() == year && this.mAdapter.getMonth() == month && this.mAdapter.getDay() == day) {
            return;
        }
        this.mAdapter.setDate(day, month, year, false);
        goTo(month, year);
    }

    public void setOnDateChangedListener(OnDateChangedListener listener) {
        this.mOnDateChangedListener = listener;
    }

    public int getDay() {
        return this.mAdapter.getDay();
    }

    public int getMonth() {
        return this.mAdapter.getMonth();
    }

    public int getYear() {
        return this.mAdapter.getYear();
    }

    public String getFormattedDate(DateFormat formatter) {
        this.mCalendar.set(1, this.mAdapter.getYear());
        this.mCalendar.set(2, this.mAdapter.getMonth());
        this.mCalendar.set(5, this.mAdapter.getDay());
        return formatter.format(this.mCalendar.getTime());
    }

    public int getSelectionColor() {
        return this.mSelectionColor;
    }

    public int getTextSize() {
        return this.mTextSize;
    }

    public Typeface getTypeface() {
        return this.mTypeface;
    }

    public int getTextColor() {
        return this.mTextColor;
    }

    public int getTextLabelColor() {
        return this.mTextLabelColor;
    }

    public int getTextHighlightColor() {
        return this.mTextHighlightColor;
    }

    public int getTextDisableColor() {
        return this.mTextDisableColor;
    }

    public Calendar getCalendar() {
        return this.mCalendar;
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/DatePicker$ScrollStateRunnable.class */
    private class ScrollStateRunnable implements Runnable {
        private int mNewState;

        private ScrollStateRunnable() {
        }

        public void doScrollStateChange(AbsListView view, int scrollState) {
            DatePicker.this.mHandler.removeCallbacks(this);
            this.mNewState = scrollState;
            DatePicker.this.mHandler.postDelayed(this, 40L);
        }

        @Override // java.lang.Runnable
        public void run() {
            View child;
            DatePicker.this.mCurrentScrollState = this.mNewState;
            if (this.mNewState == 0 && DatePicker.this.mPreviousScrollState != 0 && DatePicker.this.mPreviousScrollState != 1) {
                DatePicker.this.mPreviousScrollState = this.mNewState;
                int i = 0;
                View childAt = DatePicker.this.getChildAt(0);
                while (true) {
                    child = childAt;
                    if (child == null || child.getBottom() > 0) {
                        break;
                    }
                    i++;
                    childAt = DatePicker.this.getChildAt(i);
                }
                if (child == null) {
                    return;
                }
                int firstPosition = DatePicker.this.getFirstVisiblePosition();
                int lastPosition = DatePicker.this.getLastVisiblePosition();
                boolean scroll = (firstPosition == 0 || lastPosition == DatePicker.this.getCount() - 1) ? false : true;
                int top = child.getTop();
                int bottom = child.getBottom();
                int midpoint = DatePicker.this.getHeight() / 2;
                if (scroll && top < -1) {
                    if (bottom > midpoint) {
                        DatePicker.this.smoothScrollBy(top, DatePicker.SCROLL_DURATION);
                        return;
                    } else {
                        DatePicker.this.smoothScrollBy(bottom, DatePicker.SCROLL_DURATION);
                        return;
                    }
                }
                return;
            }
            DatePicker.this.mPreviousScrollState = this.mNewState;
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/DatePicker$MonthView.class */
    private class MonthView extends View {
        private long mStartTime;
        private float mAnimProgress;
        private boolean mRunning;
        private int mTouchedDay;
        private int mMonth;
        private int mYear;
        private int mMaxDay;
        private int mFirstDayCol;
        private int mMinAvailDay;
        private int mMaxAvailDay;
        private int mToday;
        private int mSelectedDay;
        private int mPreviousSelectedDay;
        private String mMonthText;
        private final Runnable mUpdater;

        public MonthView(Context context) {
            super(context);
            this.mTouchedDay = -1;
            this.mMinAvailDay = -1;
            this.mMaxAvailDay = -1;
            this.mToday = -1;
            this.mSelectedDay = -1;
            this.mPreviousSelectedDay = -1;
            this.mUpdater = new Runnable() { // from class: com.rey.material.widget.DatePicker.MonthView.1
                @Override // java.lang.Runnable
                public void run() {
                    MonthView.this.update();
                }
            };
            setWillNotDraw(false);
        }

        public void setMonth(int month, int year) {
            if (this.mMonth != month || this.mYear != year) {
                this.mMonth = month;
                this.mYear = year;
                calculateMonthView();
                invalidate();
            }
        }

        public void setSelectedDay(int day, boolean animation) {
            if (this.mSelectedDay != day) {
                this.mPreviousSelectedDay = this.mSelectedDay;
                this.mSelectedDay = day;
                if (animation) {
                    startAnimation();
                } else {
                    invalidate();
                }
            }
        }

        public void setToday(int day) {
            if (this.mToday != day) {
                this.mToday = day;
                invalidate();
            }
        }

        public void setAvailableDay(int min, int max) {
            if (this.mMinAvailDay != min || this.mMaxAvailDay != max) {
                this.mMinAvailDay = min;
                this.mMaxAvailDay = max;
                invalidate();
            }
        }

        private void calculateMonthView() {
            DatePicker.this.mCalendar.set(5, 1);
            DatePicker.this.mCalendar.set(2, this.mMonth);
            DatePicker.this.mCalendar.set(1, this.mYear);
            this.mMaxDay = DatePicker.this.mCalendar.getActualMaximum(5);
            int dayOfWeek = DatePicker.this.mCalendar.get(7);
            this.mFirstDayCol = dayOfWeek < DatePicker.this.mFirstDayOfWeek ? (dayOfWeek + 7) - DatePicker.this.mFirstDayOfWeek : dayOfWeek - DatePicker.this.mFirstDayOfWeek;
            this.mMonthText = DatePicker.this.mCalendar.getDisplayName(2, 2, Locale.getDefault()) + " " + String.format(DatePicker.YEAR_FORMAT, Integer.valueOf(this.mYear));
        }

        @Override // android.view.View
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            setMeasuredDimension(DatePicker.this.mMonthRealWidth, DatePicker.this.mMonthRealHeight);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            DatePicker.this.mPaint.setTextSize(DatePicker.this.mTextSize);
            DatePicker.this.mPaint.setTypeface(DatePicker.this.mTypeface);
            float x = (3.5f * DatePicker.this.mDayWidth) + getPaddingLeft();
            float y = (DatePicker.this.mDayPadding * 2) + DatePicker.this.mDayBaseHeight + getPaddingTop();
            DatePicker.this.mPaint.setFakeBoldText(true);
            DatePicker.this.mPaint.setColor(DatePicker.this.mTextColor);
            canvas.drawText(this.mMonthText, x, y, DatePicker.this.mPaint);
            float paddingLeft = getPaddingLeft();
            float paddingTop = (DatePicker.this.mDayPadding * 2) + DatePicker.this.mDayBaseHeight + getPaddingTop();
            if (this.mSelectedDay > 0) {
                int col = ((this.mFirstDayCol + this.mSelectedDay) - 1) % 7;
                int row = (((this.mFirstDayCol + this.mSelectedDay) - 1) / 7) + 1;
                float x2 = ((col + 0.5f) * DatePicker.this.mDayWidth) + paddingLeft;
                float y2 = ((row + 0.5f) * DatePicker.this.mDayHeight) + paddingTop;
                float radius = this.mRunning ? DatePicker.this.mInInterpolator.getInterpolation(this.mAnimProgress) * DatePicker.this.mSelectionRadius : DatePicker.this.mSelectionRadius;
                DatePicker.this.mPaint.setColor(DatePicker.this.mSelectionColor);
                canvas.drawCircle(x2, y2, radius, DatePicker.this.mPaint);
            }
            if (this.mRunning && this.mPreviousSelectedDay > 0) {
                int col2 = ((this.mFirstDayCol + this.mPreviousSelectedDay) - 1) % 7;
                int row2 = (((this.mFirstDayCol + this.mPreviousSelectedDay) - 1) / 7) + 1;
                float x3 = ((col2 + 0.5f) * DatePicker.this.mDayWidth) + paddingLeft;
                float y3 = ((row2 + 0.5f) * DatePicker.this.mDayHeight) + paddingTop;
                float radius2 = (1.0f - DatePicker.this.mOutInterpolator.getInterpolation(this.mAnimProgress)) * DatePicker.this.mSelectionRadius;
                DatePicker.this.mPaint.setColor(DatePicker.this.mSelectionColor);
                canvas.drawCircle(x3, y3, radius2, DatePicker.this.mPaint);
            }
            DatePicker.this.mPaint.setFakeBoldText(false);
            DatePicker.this.mPaint.setColor(DatePicker.this.mTextLabelColor);
            float paddingTop2 = paddingTop + ((DatePicker.this.mDayHeight + DatePicker.this.mDayBaseHeight) / 2.0f);
            for (int i = 0; i < 7; i++) {
                float x4 = ((i + 0.5f) * DatePicker.this.mDayWidth) + paddingLeft;
                int index = ((i + DatePicker.this.mFirstDayOfWeek) - 1) % 7;
                canvas.drawText(DatePicker.this.mLabels[index], x4, paddingTop2, DatePicker.this.mPaint);
            }
            int col3 = this.mFirstDayCol;
            int row3 = 1;
            int maxDay = this.mMaxAvailDay > 0 ? Math.min(this.mMaxAvailDay, this.mMaxDay) : this.mMaxDay;
            for (int day = 1; day <= this.mMaxDay; day++) {
                if (day == this.mSelectedDay) {
                    DatePicker.this.mPaint.setColor(DatePicker.this.mTextHighlightColor);
                } else if (day < this.mMinAvailDay || day > maxDay) {
                    DatePicker.this.mPaint.setColor(DatePicker.this.mTextDisableColor);
                } else if (day == this.mToday) {
                    DatePicker.this.mPaint.setColor(DatePicker.this.mSelectionColor);
                } else {
                    DatePicker.this.mPaint.setColor(DatePicker.this.mTextColor);
                }
                float x5 = ((col3 + 0.5f) * DatePicker.this.mDayWidth) + paddingLeft;
                float y4 = (row3 * DatePicker.this.mDayHeight) + paddingTop2;
                canvas.drawText(DatePicker.this.getDayText(day), x5, y4, DatePicker.this.mPaint);
                col3++;
                if (col3 == 7) {
                    col3 = 0;
                    row3++;
                }
            }
        }

        private int getTouchedDay(float x, float y) {
            float paddingTop = (DatePicker.this.mDayPadding * 2) + DatePicker.this.mDayBaseHeight + getPaddingTop() + DatePicker.this.mDayHeight;
            if (x >= getPaddingLeft() && x <= getWidth() - getPaddingRight() && y >= paddingTop && y <= getHeight() - getPaddingBottom()) {
                int col = (int) Math.floor((x - getPaddingLeft()) / DatePicker.this.mDayWidth);
                int row = (int) Math.floor((y - paddingTop) / DatePicker.this.mDayHeight);
                int maxDay = this.mMaxAvailDay > 0 ? Math.min(this.mMaxAvailDay, this.mMaxDay) : this.mMaxDay;
                int day = (((row * 7) + col) - this.mFirstDayCol) + 1;
                if (day < 0 || day < this.mMinAvailDay || day > maxDay) {
                    return -1;
                }
                return day;
            }
            return -1;
        }

        @Override // android.view.View
        public boolean onTouchEvent(MotionEvent event) {
            switch (event.getAction()) {
                case 0:
                    this.mTouchedDay = getTouchedDay(event.getX(), event.getY());
                    break;
                case 1:
                    if (getTouchedDay(event.getX(), event.getY()) == this.mTouchedDay && this.mTouchedDay > 0) {
                        DatePicker.this.mAdapter.setDate(this.mTouchedDay, this.mMonth, this.mYear, true);
                        this.mTouchedDay = -1;
                        break;
                    }
                    break;
                case 3:
                    this.mTouchedDay = -1;
                    break;
            }
            return true;
        }

        private void resetAnimation() {
            this.mStartTime = SystemClock.uptimeMillis();
            this.mAnimProgress = 0.0f;
        }

        private void startAnimation() {
            if (getHandler() != null) {
                resetAnimation();
                this.mRunning = true;
                getHandler().postAtTime(this.mUpdater, SystemClock.uptimeMillis() + 16);
            }
            invalidate();
        }

        private void stopAnimation() {
            this.mRunning = false;
            this.mAnimProgress = 1.0f;
            if (getHandler() != null) {
                getHandler().removeCallbacks(this.mUpdater);
            }
            invalidate();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void update() {
            long curTime = SystemClock.uptimeMillis();
            this.mAnimProgress = Math.min(1.0f, (curTime - this.mStartTime) / DatePicker.this.mAnimDuration);
            if (this.mAnimProgress == 1.0f) {
                stopAnimation();
            }
            if (this.mRunning) {
                if (getHandler() != null) {
                    getHandler().postAtTime(this.mUpdater, SystemClock.uptimeMillis() + 16);
                } else {
                    stopAnimation();
                }
            }
            invalidate();
        }
    }

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/DatePicker$MonthAdapter.class */
    private class MonthAdapter extends BaseAdapter {
        private int mDay;
        private int mMonth;
        private int mYear;
        private int mMinDay;
        private int mMinMonth;
        private int mMinYear;
        private int mMaxDay;
        private int mMaxMonth;
        private int mMaxYear;
        private int mToday;
        private int mTodayMonth;
        private int mTodayYear;
        private int mMinMonthValue;
        private int mMaxMonthValue;

        private MonthAdapter() {
            this.mDay = -1;
            this.mMonth = -1;
            this.mYear = -1;
            this.mMinDay = -1;
            this.mMinMonth = -1;
            this.mMinYear = -1;
            this.mMaxDay = -1;
            this.mMaxMonth = -1;
            this.mMaxYear = -1;
        }

        public void setDateRange(int minDay, int minMonth, int minYear, int maxDay, int maxMonth, int maxYear) {
            int minMonthValue = (minDay < 0 || minMonth < 0 || minYear < 0) ? 0 : (minYear * 12) + minMonth;
            int maxMonthValue = (maxDay < 0 || maxMonth < 0 || maxYear < 0) ? 2147483646 : (maxYear * 12) + maxMonth;
            if (minDay != this.mMinDay || this.mMinMonthValue != minMonthValue || maxDay != this.mMaxDay || this.mMaxMonthValue != maxMonthValue) {
                this.mMinDay = minDay;
                this.mMinMonth = minMonth;
                this.mMinYear = minYear;
                this.mMaxDay = maxDay;
                this.mMaxMonth = maxMonth;
                this.mMaxYear = maxYear;
                this.mMinMonthValue = minMonthValue;
                this.mMaxMonthValue = maxMonthValue;
                notifyDataSetChanged();
            }
        }

        public void setDate(int day, int month, int year, boolean animation) {
            if (this.mMonth != month || this.mYear != year) {
                MonthView v = (MonthView) DatePicker.this.getChildAt(positionOfMonth(this.mMonth, this.mYear) - DatePicker.this.getFirstVisiblePosition());
                if (v != null) {
                    v.setSelectedDay(-1, false);
                }
                int oldDay = this.mDay;
                int oldMonth = this.mMonth;
                int oldYear = this.mYear;
                this.mDay = day;
                this.mMonth = month;
                this.mYear = year;
                MonthView v2 = (MonthView) DatePicker.this.getChildAt(positionOfMonth(this.mMonth, this.mYear) - DatePicker.this.getFirstVisiblePosition());
                if (v2 != null) {
                    v2.setSelectedDay(this.mDay, animation);
                }
                if (DatePicker.this.mOnDateChangedListener != null) {
                    DatePicker.this.mOnDateChangedListener.onDateChanged(oldDay, oldMonth, oldYear, this.mDay, this.mMonth, this.mYear);
                    return;
                }
                return;
            }
            if (day != this.mDay) {
                int oldDay2 = this.mDay;
                this.mDay = day;
                MonthView v3 = (MonthView) DatePicker.this.getChildAt(positionOfMonth(this.mMonth, this.mYear) - DatePicker.this.getFirstVisiblePosition());
                if (v3 != null) {
                    v3.setSelectedDay(this.mDay, animation);
                }
                if (DatePicker.this.mOnDateChangedListener != null) {
                    DatePicker.this.mOnDateChangedListener.onDateChanged(oldDay2, this.mMonth, this.mYear, this.mDay, this.mMonth, this.mYear);
                }
            }
        }

        public int positionOfMonth(int month, int year) {
            return ((year * 12) + month) - this.mMinMonthValue;
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

        private void calToday() {
            DatePicker.this.mCalendar.setTimeInMillis(System.currentTimeMillis());
            this.mToday = DatePicker.this.mCalendar.get(5);
            this.mTodayMonth = DatePicker.this.mCalendar.get(2);
            this.mTodayYear = DatePicker.this.mCalendar.get(1);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return (this.mMaxMonthValue - this.mMinMonthValue) + 1;
        }

        @Override // android.widget.Adapter
        public Object getItem(int position) {
            return Integer.valueOf(position + this.mMinMonthValue);
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return 0L;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            MonthView v = (MonthView) convertView;
            if (v == null) {
                v = DatePicker.this.new MonthView(parent.getContext());
                v.setPadding(DatePicker.this.mPaddingLeft, DatePicker.this.mPaddingTop, DatePicker.this.mPaddingRight, DatePicker.this.mPaddingBottom);
            }
            calToday();
            int monthValue = ((Integer) getItem(position)).intValue();
            int year = monthValue / 12;
            int month = monthValue % 12;
            int minDay = (month == this.mMinMonth && year == this.mMinYear) ? this.mMinDay : -1;
            int maxDay = (month == this.mMaxMonth && year == this.mMaxYear) ? this.mMaxDay : -1;
            int today = (this.mTodayMonth == month && this.mTodayYear == year) ? this.mToday : -1;
            int day = (month == this.mMonth && year == this.mYear) ? this.mDay : -1;
            v.setMonth(month, year);
            v.setToday(today);
            v.setAvailableDay(minDay, maxDay);
            v.setSelectedDay(day, false);
            return v;
        }
    }
}
