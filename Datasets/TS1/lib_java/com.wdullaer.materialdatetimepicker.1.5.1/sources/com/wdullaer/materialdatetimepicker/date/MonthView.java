package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.ExploreByTouchHelper;
import android.text.format.DateFormat;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import com.wdullaer.materialdatetimepicker.R;
import com.wdullaer.materialdatetimepicker.TypefaceHelper;
import com.wdullaer.materialdatetimepicker.date.MonthAdapter;
import java.security.InvalidParameterException;
import java.util.Calendar;
import java.util.Formatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/MonthView.class */
public abstract class MonthView extends View {
    private static final String TAG = "MonthView";
    public static final String VIEW_PARAMS_HEIGHT = "height";
    public static final String VIEW_PARAMS_MONTH = "month";
    public static final String VIEW_PARAMS_YEAR = "year";
    public static final String VIEW_PARAMS_SELECTED_DAY = "selected_day";
    public static final String VIEW_PARAMS_WEEK_START = "week_start";
    public static final String VIEW_PARAMS_NUM_DAYS = "num_days";
    public static final String VIEW_PARAMS_FOCUS_MONTH = "focus_month";
    public static final String VIEW_PARAMS_SHOW_WK_NUM = "show_wk_num";
    protected static final int DEFAULT_SELECTED_DAY = -1;
    protected static final int DEFAULT_WEEK_START = 1;
    protected static final int DEFAULT_NUM_DAYS = 7;
    protected static final int DEFAULT_SHOW_WK_NUM = 0;
    protected static final int DEFAULT_FOCUS_MONTH = -1;
    protected static final int DEFAULT_NUM_ROWS = 6;
    protected static final int MAX_NUM_ROWS = 6;
    private static final int SELECTED_CIRCLE_ALPHA = 255;
    protected static int MINI_DAY_NUMBER_TEXT_SIZE;
    protected static int MONTH_LABEL_TEXT_SIZE;
    protected static int MONTH_DAY_LABEL_TEXT_SIZE;
    protected static int MONTH_HEADER_SIZE;
    protected static int DAY_SELECTED_CIRCLE_SIZE;
    protected DatePickerController mController;
    protected int mEdgePadding;
    private String mDayOfWeekTypeface;
    private String mMonthTitleTypeface;
    protected Paint mMonthNumPaint;
    protected Paint mMonthTitlePaint;
    protected Paint mSelectedCirclePaint;
    protected Paint mMonthDayLabelPaint;
    private final Formatter mFormatter;
    private final StringBuilder mStringBuilder;
    protected int mFirstJulianDay;
    protected int mFirstMonth;
    protected int mLastMonth;
    protected int mMonth;
    protected int mYear;
    protected int mWidth;
    protected int mRowHeight;
    protected boolean mHasToday;
    protected int mSelectedDay;
    protected int mToday;
    protected int mWeekStart;
    protected int mNumDays;
    protected int mNumCells;
    protected int mSelectedLeft;
    protected int mSelectedRight;
    private final Calendar mCalendar;
    protected final Calendar mDayLabelCalendar;
    private final MonthViewTouchHelper mTouchHelper;
    protected int mNumRows;
    protected OnDayClickListener mOnDayClickListener;
    private boolean mLockAccessibilityDelegate;
    protected int mDayTextColor;
    protected int mSelectedDayTextColor;
    protected int mMonthDayTextColor;
    protected int mTodayNumberColor;
    protected int mHighlightedDayTextColor;
    protected int mDisabledDayTextColor;
    protected int mMonthTitleColor;
    private int mDayOfWeekStart;
    protected static int DEFAULT_HEIGHT = 32;
    protected static int MIN_HEIGHT = 10;
    protected static int DAY_SEPARATOR_WIDTH = 1;
    protected static float mScale = 0.0f;

    /* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/MonthView$OnDayClickListener.class */
    public interface OnDayClickListener {
        void onDayClick(MonthView monthView, MonthAdapter.CalendarDay calendarDay);
    }

    public abstract void drawMonthDay(Canvas canvas, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9);

    public MonthView(Context context) {
        this(context, null, null);
    }

    public MonthView(Context context, AttributeSet attr, DatePickerController controller) {
        super(context, attr);
        this.mEdgePadding = 0;
        this.mFirstJulianDay = -1;
        this.mFirstMonth = -1;
        this.mLastMonth = -1;
        this.mRowHeight = DEFAULT_HEIGHT;
        this.mHasToday = false;
        this.mSelectedDay = -1;
        this.mToday = -1;
        this.mWeekStart = 1;
        this.mNumDays = 7;
        this.mNumCells = this.mNumDays;
        this.mSelectedLeft = -1;
        this.mSelectedRight = -1;
        this.mNumRows = 6;
        this.mDayOfWeekStart = 0;
        this.mController = controller;
        Resources res = context.getResources();
        this.mDayLabelCalendar = Calendar.getInstance();
        this.mCalendar = Calendar.getInstance();
        this.mDayOfWeekTypeface = res.getString(R.string.mdtp_day_of_week_label_typeface);
        this.mMonthTitleTypeface = res.getString(R.string.mdtp_sans_serif);
        boolean darkTheme = this.mController != null && this.mController.isThemeDark();
        if (darkTheme) {
            this.mDayTextColor = res.getColor(R.color.mdtp_date_picker_text_normal_dark_theme);
            this.mMonthDayTextColor = res.getColor(R.color.mdtp_date_picker_month_day_dark_theme);
            this.mDisabledDayTextColor = res.getColor(R.color.mdtp_date_picker_text_disabled_dark_theme);
            this.mHighlightedDayTextColor = res.getColor(R.color.mdtp_date_picker_text_highlighted_dark_theme);
        } else {
            this.mDayTextColor = res.getColor(R.color.mdtp_date_picker_text_normal);
            this.mMonthDayTextColor = res.getColor(R.color.mdtp_date_picker_month_day);
            this.mDisabledDayTextColor = res.getColor(R.color.mdtp_date_picker_text_disabled);
            this.mHighlightedDayTextColor = res.getColor(R.color.mdtp_date_picker_text_highlighted);
        }
        this.mSelectedDayTextColor = res.getColor(R.color.mdtp_white);
        this.mTodayNumberColor = res.getColor(R.color.mdtp_accent_color);
        this.mMonthTitleColor = res.getColor(R.color.mdtp_white);
        this.mStringBuilder = new StringBuilder(50);
        this.mFormatter = new Formatter(this.mStringBuilder, Locale.getDefault());
        MINI_DAY_NUMBER_TEXT_SIZE = res.getDimensionPixelSize(R.dimen.mdtp_day_number_size);
        MONTH_LABEL_TEXT_SIZE = res.getDimensionPixelSize(R.dimen.mdtp_month_label_size);
        MONTH_DAY_LABEL_TEXT_SIZE = res.getDimensionPixelSize(R.dimen.mdtp_month_day_label_text_size);
        MONTH_HEADER_SIZE = res.getDimensionPixelOffset(R.dimen.mdtp_month_list_item_header_height);
        DAY_SELECTED_CIRCLE_SIZE = res.getDimensionPixelSize(R.dimen.mdtp_day_number_select_circle_radius);
        this.mRowHeight = (res.getDimensionPixelOffset(R.dimen.mdtp_date_picker_view_animator_height) - getMonthHeaderSize()) / 6;
        this.mTouchHelper = getMonthViewTouchHelper();
        ViewCompat.setAccessibilityDelegate(this, this.mTouchHelper);
        ViewCompat.setImportantForAccessibility(this, 1);
        this.mLockAccessibilityDelegate = true;
        initView();
    }

    public void setDatePickerController(DatePickerController controller) {
        this.mController = controller;
    }

    protected MonthViewTouchHelper getMonthViewTouchHelper() {
        return new MonthViewTouchHelper(this);
    }

    @Override // android.view.View
    public void setAccessibilityDelegate(View.AccessibilityDelegate delegate) {
        if (!this.mLockAccessibilityDelegate) {
            super.setAccessibilityDelegate(delegate);
        }
    }

    public void setOnDayClickListener(OnDayClickListener listener) {
        this.mOnDayClickListener = listener;
    }

    @Override // android.view.View
    public boolean dispatchHoverEvent(@NonNull MotionEvent event) {
        if (this.mTouchHelper.dispatchHoverEvent(event)) {
            return true;
        }
        return super.dispatchHoverEvent(event);
    }

    @Override // android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        switch (event.getAction()) {
            case 1:
                int day = getDayFromLocation(event.getX(), event.getY());
                if (day >= 0) {
                    onDayClick(day);
                    break;
                }
                break;
        }
        return true;
    }

    protected void initView() {
        this.mMonthTitlePaint = new Paint();
        this.mMonthTitlePaint.setFakeBoldText(true);
        this.mMonthTitlePaint.setAntiAlias(true);
        this.mMonthTitlePaint.setTextSize(MONTH_LABEL_TEXT_SIZE);
        this.mMonthTitlePaint.setTypeface(Typeface.create(this.mMonthTitleTypeface, 1));
        this.mMonthTitlePaint.setColor(this.mDayTextColor);
        this.mMonthTitlePaint.setTextAlign(Paint.Align.CENTER);
        this.mMonthTitlePaint.setStyle(Paint.Style.FILL);
        this.mSelectedCirclePaint = new Paint();
        this.mSelectedCirclePaint.setFakeBoldText(true);
        this.mSelectedCirclePaint.setAntiAlias(true);
        this.mSelectedCirclePaint.setColor(this.mTodayNumberColor);
        this.mSelectedCirclePaint.setTextAlign(Paint.Align.CENTER);
        this.mSelectedCirclePaint.setStyle(Paint.Style.FILL);
        this.mSelectedCirclePaint.setAlpha(255);
        this.mMonthDayLabelPaint = new Paint();
        this.mMonthDayLabelPaint.setAntiAlias(true);
        this.mMonthDayLabelPaint.setTextSize(MONTH_DAY_LABEL_TEXT_SIZE);
        this.mMonthDayLabelPaint.setColor(this.mMonthDayTextColor);
        this.mMonthDayLabelPaint.setTypeface(TypefaceHelper.get(getContext(), "Roboto-Medium"));
        this.mMonthDayLabelPaint.setStyle(Paint.Style.FILL);
        this.mMonthDayLabelPaint.setTextAlign(Paint.Align.CENTER);
        this.mMonthDayLabelPaint.setFakeBoldText(true);
        this.mMonthNumPaint = new Paint();
        this.mMonthNumPaint.setAntiAlias(true);
        this.mMonthNumPaint.setTextSize(MINI_DAY_NUMBER_TEXT_SIZE);
        this.mMonthNumPaint.setStyle(Paint.Style.FILL);
        this.mMonthNumPaint.setTextAlign(Paint.Align.CENTER);
        this.mMonthNumPaint.setFakeBoldText(false);
    }

    public void setAccentColor(int color) {
        this.mTodayNumberColor = color;
        this.mSelectedCirclePaint.setColor(color);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        drawMonthTitle(canvas);
        drawMonthDayLabels(canvas);
        drawMonthNums(canvas);
    }

    public void setMonthParams(HashMap<String, Integer> params) {
        if (!params.containsKey(VIEW_PARAMS_MONTH) && !params.containsKey(VIEW_PARAMS_YEAR)) {
            throw new InvalidParameterException("You must specify month and year for this view");
        }
        setTag(params);
        if (params.containsKey(VIEW_PARAMS_HEIGHT)) {
            this.mRowHeight = params.get(VIEW_PARAMS_HEIGHT).intValue();
            if (this.mRowHeight < MIN_HEIGHT) {
                this.mRowHeight = MIN_HEIGHT;
            }
        }
        if (params.containsKey(VIEW_PARAMS_SELECTED_DAY)) {
            this.mSelectedDay = params.get(VIEW_PARAMS_SELECTED_DAY).intValue();
        }
        this.mMonth = params.get(VIEW_PARAMS_MONTH).intValue();
        this.mYear = params.get(VIEW_PARAMS_YEAR).intValue();
        Calendar today = Calendar.getInstance();
        this.mHasToday = false;
        this.mToday = -1;
        this.mCalendar.set(2, this.mMonth);
        this.mCalendar.set(1, this.mYear);
        this.mCalendar.set(5, 1);
        this.mDayOfWeekStart = this.mCalendar.get(7);
        if (params.containsKey(VIEW_PARAMS_WEEK_START)) {
            this.mWeekStart = params.get(VIEW_PARAMS_WEEK_START).intValue();
        } else {
            this.mWeekStart = this.mCalendar.getFirstDayOfWeek();
        }
        this.mNumCells = this.mCalendar.getActualMaximum(5);
        for (int i = 0; i < this.mNumCells; i++) {
            int day = i + 1;
            if (sameDay(day, today)) {
                this.mHasToday = true;
                this.mToday = day;
            }
        }
        this.mNumRows = calculateNumRows();
        this.mTouchHelper.invalidateRoot();
    }

    public void setSelectedDay(int day) {
        this.mSelectedDay = day;
    }

    public void reuse() {
        this.mNumRows = 6;
        requestLayout();
    }

    private int calculateNumRows() {
        int offset = findDayOffset();
        int dividend = (offset + this.mNumCells) / this.mNumDays;
        int remainder = (offset + this.mNumCells) % this.mNumDays;
        return dividend + (remainder > 0 ? 1 : 0);
    }

    private boolean sameDay(int day, Calendar today) {
        return this.mYear == today.get(1) && this.mMonth == today.get(2) && day == today.get(5);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(View.MeasureSpec.getSize(widthMeasureSpec), (this.mRowHeight * this.mNumRows) + getMonthHeaderSize() + 5);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        this.mWidth = w;
        this.mTouchHelper.invalidateRoot();
    }

    public int getMonth() {
        return this.mMonth;
    }

    public int getYear() {
        return this.mYear;
    }

    protected int getMonthHeaderSize() {
        return MONTH_HEADER_SIZE;
    }

    private String getMonthAndYearString() {
        this.mStringBuilder.setLength(0);
        long millis = this.mCalendar.getTimeInMillis();
        return DateUtils.formatDateRange(getContext(), this.mFormatter, millis, millis, 52, null).toString();
    }

    protected void drawMonthTitle(Canvas canvas) {
        int x = (this.mWidth + (2 * this.mEdgePadding)) / 2;
        int y = (getMonthHeaderSize() - MONTH_DAY_LABEL_TEXT_SIZE) / 2;
        canvas.drawText(getMonthAndYearString(), x, y, this.mMonthTitlePaint);
    }

    protected void drawMonthDayLabels(Canvas canvas) {
        int y = getMonthHeaderSize() - (MONTH_DAY_LABEL_TEXT_SIZE / 2);
        int dayWidthHalf = (this.mWidth - (this.mEdgePadding * 2)) / (this.mNumDays * 2);
        for (int i = 0; i < this.mNumDays; i++) {
            int x = (((2 * i) + 1) * dayWidthHalf) + this.mEdgePadding;
            int calendarDay = (i + this.mWeekStart) % this.mNumDays;
            this.mDayLabelCalendar.set(7, calendarDay);
            Locale locale = Locale.getDefault();
            String localWeekDisplayName = this.mDayLabelCalendar.getDisplayName(7, 1, locale);
            String weekString = localWeekDisplayName.toUpperCase(locale).substring(0, 1);
            if (locale.equals(Locale.CHINA) || locale.equals(Locale.CHINESE) || locale.equals(Locale.SIMPLIFIED_CHINESE) || locale.equals(Locale.TRADITIONAL_CHINESE)) {
                int len = localWeekDisplayName.length();
                weekString = localWeekDisplayName.substring(len - 1, len);
            }
            if (locale.getLanguage().equals("he") || locale.getLanguage().equals("iw")) {
                if (this.mDayLabelCalendar.get(7) != 7) {
                    int len2 = localWeekDisplayName.length();
                    weekString = localWeekDisplayName.substring(len2 - 2, len2 - 1);
                } else {
                    weekString = localWeekDisplayName.toUpperCase(locale).substring(0, 1);
                }
            }
            canvas.drawText(weekString, x, y, this.mMonthDayLabelPaint);
        }
    }

    protected void drawMonthNums(Canvas canvas) {
        int y = (((this.mRowHeight + MINI_DAY_NUMBER_TEXT_SIZE) / 2) - DAY_SEPARATOR_WIDTH) + getMonthHeaderSize();
        float dayWidthHalf = (this.mWidth - (this.mEdgePadding * 2)) / (this.mNumDays * 2.0f);
        int j = findDayOffset();
        for (int dayNumber = 1; dayNumber <= this.mNumCells; dayNumber++) {
            int x = (int) ((((2 * j) + 1) * dayWidthHalf) + this.mEdgePadding);
            int yRelativeToDay = ((this.mRowHeight + MINI_DAY_NUMBER_TEXT_SIZE) / 2) - DAY_SEPARATOR_WIDTH;
            int startX = (int) (x - dayWidthHalf);
            int stopX = (int) (x + dayWidthHalf);
            int startY = y - yRelativeToDay;
            int stopY = startY + this.mRowHeight;
            drawMonthDay(canvas, this.mYear, this.mMonth, dayNumber, x, y, startX, stopX, startY, stopY);
            j++;
            if (j == this.mNumDays) {
                j = 0;
                y += this.mRowHeight;
            }
        }
    }

    protected int findDayOffset() {
        return (this.mDayOfWeekStart < this.mWeekStart ? this.mDayOfWeekStart + this.mNumDays : this.mDayOfWeekStart) - this.mWeekStart;
    }

    public int getDayFromLocation(float x, float y) {
        int day = getInternalDayFromLocation(x, y);
        if (day < 1 || day > this.mNumCells) {
            return -1;
        }
        return day;
    }

    protected int getInternalDayFromLocation(float x, float y) {
        int dayStart = this.mEdgePadding;
        if (x < dayStart || x > this.mWidth - this.mEdgePadding) {
            return -1;
        }
        int row = ((int) (y - getMonthHeaderSize())) / this.mRowHeight;
        int column = (int) (((x - dayStart) * this.mNumDays) / ((this.mWidth - dayStart) - this.mEdgePadding));
        int day = (column - findDayOffset()) + 1;
        return day + (row * this.mNumDays);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDayClick(int day) {
        if (isOutOfRange(this.mYear, this.mMonth, day)) {
            return;
        }
        if (this.mOnDayClickListener != null) {
            this.mOnDayClickListener.onDayClick(this, new MonthAdapter.CalendarDay(this.mYear, this.mMonth, day));
        }
        this.mTouchHelper.sendEventForVirtualView(day, 1);
    }

    protected boolean isOutOfRange(int year, int month, int day) {
        if (this.mController.getSelectableDays() != null) {
            return !isSelectable(year, month, day);
        }
        if (isBeforeMin(year, month, day) || isAfterMax(year, month, day)) {
            return true;
        }
        return false;
    }

    private boolean isSelectable(int year, int month, int day) {
        Calendar[] selectableDays = this.mController.getSelectableDays();
        for (Calendar c : selectableDays) {
            if (year >= c.get(1)) {
                if (year <= c.get(1)) {
                    if (month >= c.get(2)) {
                        if (month > c.get(2)) {
                            continue;
                        } else if (day >= c.get(5)) {
                            if (day <= c.get(5)) {
                                return true;
                            }
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                }
            } else {
                return false;
            }
        }
        return false;
    }

    private boolean isBeforeMin(int year, int month, int day) {
        Calendar minDate;
        if (this.mController == null || (minDate = this.mController.getMinDate()) == null) {
            return false;
        }
        if (year < minDate.get(1)) {
            return true;
        }
        if (year > minDate.get(1)) {
            return false;
        }
        if (month < minDate.get(2)) {
            return true;
        }
        if (month <= minDate.get(2) && day < minDate.get(5)) {
            return true;
        }
        return false;
    }

    private boolean isAfterMax(int year, int month, int day) {
        Calendar maxDate;
        if (this.mController == null || (maxDate = this.mController.getMaxDate()) == null) {
            return false;
        }
        if (year > maxDate.get(1)) {
            return true;
        }
        if (year < maxDate.get(1)) {
            return false;
        }
        if (month > maxDate.get(2)) {
            return true;
        }
        if (month >= maxDate.get(2) && day > maxDate.get(5)) {
            return true;
        }
        return false;
    }

    protected boolean isHighlighted(int year, int month, int day) {
        Calendar[] highlightedDays = this.mController.getHighlightedDays();
        if (highlightedDays == null) {
            return false;
        }
        for (Calendar c : highlightedDays) {
            if (year >= c.get(1)) {
                if (year <= c.get(1)) {
                    if (month >= c.get(2)) {
                        if (month > c.get(2)) {
                            continue;
                        } else if (day >= c.get(5)) {
                            if (day <= c.get(5)) {
                                return true;
                            }
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                }
            } else {
                return false;
            }
        }
        return false;
    }

    public MonthAdapter.CalendarDay getAccessibilityFocus() {
        int day = this.mTouchHelper.getFocusedVirtualView();
        if (day >= 0) {
            return new MonthAdapter.CalendarDay(this.mYear, this.mMonth, day);
        }
        return null;
    }

    public void clearAccessibilityFocus() {
        this.mTouchHelper.clearFocusedVirtualView();
    }

    public boolean restoreAccessibilityFocus(MonthAdapter.CalendarDay day) {
        if (day.year != this.mYear || day.month != this.mMonth || day.day > this.mNumCells) {
            return false;
        }
        this.mTouchHelper.setFocusedVirtualView(day.day);
        return true;
    }

    /* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper.class */
    protected class MonthViewTouchHelper extends ExploreByTouchHelper {
        private static final String DATE_FORMAT = "dd MMMM yyyy";
        private final Rect mTempRect;
        private final Calendar mTempCalendar;

        public MonthViewTouchHelper(View host) {
            super(host);
            this.mTempRect = new Rect();
            this.mTempCalendar = Calendar.getInstance();
        }

        public void setFocusedVirtualView(int virtualViewId) {
            getAccessibilityNodeProvider(MonthView.this).performAction(virtualViewId, 64, (Bundle) null);
        }

        public void clearFocusedVirtualView() {
            int focusedVirtualView = getFocusedVirtualView();
            if (focusedVirtualView != Integer.MIN_VALUE) {
                getAccessibilityNodeProvider(MonthView.this).performAction(focusedVirtualView, 128, (Bundle) null);
            }
        }

        protected int getVirtualViewAt(float x, float y) {
            int day = MonthView.this.getDayFromLocation(x, y);
            if (day >= 0) {
                return day;
            }
            return Integer.MIN_VALUE;
        }

        protected void getVisibleVirtualViews(List<Integer> virtualViewIds) {
            for (int day = 1; day <= MonthView.this.mNumCells; day++) {
                virtualViewIds.add(Integer.valueOf(day));
            }
        }

        protected void onPopulateEventForVirtualView(int virtualViewId, AccessibilityEvent event) {
            event.setContentDescription(getItemDescription(virtualViewId));
        }

        protected void onPopulateNodeForVirtualView(int virtualViewId, AccessibilityNodeInfoCompat node) {
            getItemBounds(virtualViewId, this.mTempRect);
            node.setContentDescription(getItemDescription(virtualViewId));
            node.setBoundsInParent(this.mTempRect);
            node.addAction(16);
            if (virtualViewId == MonthView.this.mSelectedDay) {
                node.setSelected(true);
            }
        }

        protected boolean onPerformActionForVirtualView(int virtualViewId, int action, Bundle arguments) {
            switch (action) {
                case 16:
                    MonthView.this.onDayClick(virtualViewId);
                    return true;
                default:
                    return false;
            }
        }

        protected void getItemBounds(int day, Rect rect) {
            int offsetX = MonthView.this.mEdgePadding;
            int offsetY = MonthView.this.getMonthHeaderSize();
            int cellHeight = MonthView.this.mRowHeight;
            int cellWidth = (MonthView.this.mWidth - (2 * MonthView.this.mEdgePadding)) / MonthView.this.mNumDays;
            int index = (day - 1) + MonthView.this.findDayOffset();
            int row = index / MonthView.this.mNumDays;
            int column = index % MonthView.this.mNumDays;
            int x = offsetX + (column * cellWidth);
            int y = offsetY + (row * cellHeight);
            rect.set(x, y, x + cellWidth, y + cellHeight);
        }

        protected CharSequence getItemDescription(int day) {
            this.mTempCalendar.set(MonthView.this.mYear, MonthView.this.mMonth, day);
            CharSequence date = DateFormat.format(DATE_FORMAT, this.mTempCalendar.getTimeInMillis());
            return day == MonthView.this.mSelectedDay ? MonthView.this.getContext().getString(R.string.mdtp_item_is_selected, date) : date;
        }
    }
}
