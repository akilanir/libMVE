package com.wdullaer.materialdatetimepicker.date;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.AbsListView;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.wdullaer.materialdatetimepicker.Utils;
import com.wdullaer.materialdatetimepicker.date.DatePickerDialog;
import com.wdullaer.materialdatetimepicker.date.MonthAdapter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DayPickerView.class */
public abstract class DayPickerView extends ListView implements AbsListView.OnScrollListener, DatePickerDialog.OnDateChangedListener {
    private static final String TAG = "MonthFragment";
    protected static final int SCROLL_HYST_WEEKS = 2;
    protected static final int GOTO_SCROLL_DURATION = 250;
    protected static final int SCROLL_CHANGE_DELAY = 40;
    public static final int DAYS_PER_WEEK = 7;
    protected int mNumWeeks;
    protected boolean mShowWeekNumber;
    protected int mDaysPerWeek;
    protected float mFriction;
    protected Context mContext;
    protected Handler mHandler;
    protected MonthAdapter.CalendarDay mSelectedDay;
    protected MonthAdapter mAdapter;
    protected MonthAdapter.CalendarDay mTempDay;
    protected int mFirstDayOfWeek;
    protected CharSequence mPrevMonthName;
    protected int mCurrentMonthDisplayed;
    protected long mPreviousScrollPosition;
    protected int mPreviousScrollState;
    protected int mCurrentScrollState;
    private DatePickerController mController;
    private boolean mPerformingScroll;
    protected ScrollStateRunnable mScrollStateChangedRunnable;
    public static int LIST_TOP_OFFSET = -1;
    private static SimpleDateFormat YEAR_FORMAT = new SimpleDateFormat("yyyy", Locale.getDefault());

    public abstract MonthAdapter createMonthAdapter(Context context, DatePickerController datePickerController);

    public DayPickerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mNumWeeks = 6;
        this.mShowWeekNumber = false;
        this.mDaysPerWeek = 7;
        this.mFriction = 1.0f;
        this.mSelectedDay = new MonthAdapter.CalendarDay();
        this.mTempDay = new MonthAdapter.CalendarDay();
        this.mPreviousScrollState = 0;
        this.mCurrentScrollState = 0;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context);
    }

    public DayPickerView(Context context, DatePickerController controller) {
        super(context);
        this.mNumWeeks = 6;
        this.mShowWeekNumber = false;
        this.mDaysPerWeek = 7;
        this.mFriction = 1.0f;
        this.mSelectedDay = new MonthAdapter.CalendarDay();
        this.mTempDay = new MonthAdapter.CalendarDay();
        this.mPreviousScrollState = 0;
        this.mCurrentScrollState = 0;
        this.mScrollStateChangedRunnable = new ScrollStateRunnable();
        init(context);
        setController(controller);
    }

    public void setController(DatePickerController controller) {
        this.mController = controller;
        this.mController.registerOnDateChangedListener(this);
        refreshAdapter();
        onDateChanged();
    }

    public void init(Context context) {
        this.mHandler = new Handler();
        setLayoutParams(new AbsListView.LayoutParams(-1, -1));
        setDrawSelectorOnTop(false);
        this.mContext = context;
        setUpListView();
    }

    public void onChange() {
        refreshAdapter();
    }

    protected void refreshAdapter() {
        if (this.mAdapter == null) {
            this.mAdapter = createMonthAdapter(getContext(), this.mController);
        } else {
            this.mAdapter.setSelectedDay(this.mSelectedDay);
        }
        setAdapter((ListAdapter) this.mAdapter);
    }

    protected void setUpListView() {
        setCacheColorHint(0);
        setDivider(null);
        setItemsCanFocus(true);
        setFastScrollEnabled(false);
        setVerticalScrollBarEnabled(false);
        setOnScrollListener(this);
        setFadingEdgeLength(0);
        setFriction(ViewConfiguration.getScrollFriction() * this.mFriction);
    }

    public boolean goTo(MonthAdapter.CalendarDay day, boolean animate, boolean setSelected, boolean forceScroll) {
        View child;
        int selectedPosition;
        int top;
        if (setSelected) {
            this.mSelectedDay.set(day);
        }
        this.mTempDay.set(day);
        int position = ((day.year - this.mController.getMinYear()) * 12) + day.month;
        int i = 0;
        do {
            int i2 = i;
            i++;
            child = getChildAt(i2);
            if (child == null) {
                break;
            }
            top = child.getTop();
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "child at " + (i - 1) + " has top " + top);
            }
        } while (top < 0);
        if (child != null) {
            selectedPosition = getPositionForView(child);
        } else {
            selectedPosition = 0;
        }
        if (setSelected) {
            this.mAdapter.setSelectedDay(this.mSelectedDay);
        }
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "GoTo position " + position);
        }
        if (position != selectedPosition || forceScroll) {
            setMonthDisplayed(this.mTempDay);
            this.mPreviousScrollState = 2;
            if (animate) {
                smoothScrollToPositionFromTop(position, LIST_TOP_OFFSET, GOTO_SCROLL_DURATION);
                return true;
            }
            postSetSelection(position);
            return false;
        }
        if (setSelected) {
            setMonthDisplayed(this.mSelectedDay);
            return false;
        }
        return false;
    }

    public void postSetSelection(final int position) {
        clearFocus();
        post(new Runnable() { // from class: com.wdullaer.materialdatetimepicker.date.DayPickerView.1
            @Override // java.lang.Runnable
            public void run() {
                DayPickerView.this.setSelection(position);
            }
        });
        onScrollStateChanged(this, 0);
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
        MonthView child = (MonthView) view.getChildAt(0);
        if (child == null) {
            return;
        }
        long currScroll = (view.getFirstVisiblePosition() * child.getHeight()) - child.getBottom();
        this.mPreviousScrollPosition = currScroll;
        this.mPreviousScrollState = this.mCurrentScrollState;
    }

    protected void setMonthDisplayed(MonthAdapter.CalendarDay date) {
        this.mCurrentMonthDisplayed = date.month;
        invalidateViews();
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        this.mScrollStateChangedRunnable.doScrollStateChange(view, scrollState);
    }

    /* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable.class */
    protected class ScrollStateRunnable implements Runnable {
        private int mNewState;

        protected ScrollStateRunnable() {
        }

        public void doScrollStateChange(AbsListView view, int scrollState) {
            DayPickerView.this.mHandler.removeCallbacks(this);
            this.mNewState = scrollState;
            DayPickerView.this.mHandler.postDelayed(this, 40L);
        }

        @Override // java.lang.Runnable
        public void run() {
            View child;
            DayPickerView.this.mCurrentScrollState = this.mNewState;
            if (Log.isLoggable(DayPickerView.TAG, 3)) {
                Log.d(DayPickerView.TAG, "new scroll state: " + this.mNewState + " old state: " + DayPickerView.this.mPreviousScrollState);
            }
            if (this.mNewState == 0 && DayPickerView.this.mPreviousScrollState != 0 && DayPickerView.this.mPreviousScrollState != 1) {
                DayPickerView.this.mPreviousScrollState = this.mNewState;
                int i = 0;
                View childAt = DayPickerView.this.getChildAt(0);
                while (true) {
                    child = childAt;
                    if (child == null || child.getBottom() > 0) {
                        break;
                    }
                    i++;
                    childAt = DayPickerView.this.getChildAt(i);
                }
                if (child == null) {
                    return;
                }
                int firstPosition = DayPickerView.this.getFirstVisiblePosition();
                int lastPosition = DayPickerView.this.getLastVisiblePosition();
                boolean scroll = (firstPosition == 0 || lastPosition == DayPickerView.this.getCount() - 1) ? false : true;
                int top = child.getTop();
                int bottom = child.getBottom();
                int midpoint = DayPickerView.this.getHeight() / 2;
                if (scroll && top < DayPickerView.LIST_TOP_OFFSET) {
                    if (bottom > midpoint) {
                        DayPickerView.this.smoothScrollBy(top, DayPickerView.GOTO_SCROLL_DURATION);
                        return;
                    } else {
                        DayPickerView.this.smoothScrollBy(bottom, DayPickerView.GOTO_SCROLL_DURATION);
                        return;
                    }
                }
                return;
            }
            DayPickerView.this.mPreviousScrollState = this.mNewState;
        }
    }

    public int getMostVisiblePosition() {
        View child;
        int firstPosition = getFirstVisiblePosition();
        int height = getHeight();
        int maxDisplayedHeight = 0;
        int mostVisibleIndex = 0;
        int bottom = 0;
        for (int i = 0; bottom < height && (child = getChildAt(i)) != null; i++) {
            bottom = child.getBottom();
            int displayedHeight = Math.min(bottom, height) - Math.max(0, child.getTop());
            if (displayedHeight > maxDisplayedHeight) {
                mostVisibleIndex = i;
                maxDisplayedHeight = displayedHeight;
            }
        }
        return firstPosition + mostVisibleIndex;
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerDialog.OnDateChangedListener
    public void onDateChanged() {
        goTo(this.mController.getSelectedDay(), false, true, true);
    }

    private MonthAdapter.CalendarDay findAccessibilityFocus() {
        MonthAdapter.CalendarDay focus;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if ((child instanceof MonthView) && (focus = ((MonthView) child).getAccessibilityFocus()) != null) {
                if (Build.VERSION.SDK_INT == 17) {
                    ((MonthView) child).clearAccessibilityFocus();
                }
                return focus;
            }
        }
        return null;
    }

    private boolean restoreAccessibilityFocus(MonthAdapter.CalendarDay day) {
        if (day == null) {
            return false;
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if ((child instanceof MonthView) && ((MonthView) child).restoreAccessibilityFocus(day)) {
                return true;
            }
        }
        return false;
    }

    @Override // android.widget.ListView, android.widget.AbsListView
    protected void layoutChildren() {
        MonthAdapter.CalendarDay focusedDay = findAccessibilityFocus();
        super.layoutChildren();
        if (this.mPerformingScroll) {
            this.mPerformingScroll = false;
        } else {
            restoreAccessibilityFocus(focusedDay);
        }
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setItemCount(-1);
    }

    private static String getMonthAndYearString(MonthAdapter.CalendarDay day) {
        Calendar cal = Calendar.getInstance();
        cal.set(day.year, day.month, day.day);
        StringBuffer sbuf = new StringBuffer();
        sbuf.append(cal.getDisplayName(2, 2, Locale.getDefault()));
        sbuf.append(" ");
        sbuf.append(YEAR_FORMAT.format(cal.getTime()));
        return sbuf.toString();
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.addAction(4096);
        info.addAction(8192);
    }

    @Override // android.view.View
    @SuppressLint({"NewApi"})
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        View firstVisibleView;
        if (action != 4096 && action != 8192) {
            return super.performAccessibilityAction(action, arguments);
        }
        int firstVisiblePosition = getFirstVisiblePosition();
        int month = firstVisiblePosition % 12;
        int year = (firstVisiblePosition / 12) + this.mController.getMinYear();
        MonthAdapter.CalendarDay day = new MonthAdapter.CalendarDay(year, month, 1);
        if (action == 4096) {
            day.month++;
            if (day.month == 12) {
                day.month = 0;
                day.year++;
            }
        } else if (action == 8192 && (firstVisibleView = getChildAt(0)) != null && firstVisibleView.getTop() >= -1) {
            day.month--;
            if (day.month == -1) {
                day.month = 11;
                day.year--;
            }
        }
        Utils.tryAccessibilityAnnounce(this, getMonthAndYearString(day));
        goTo(day, true, false, true);
        this.mPerformingScroll = true;
        return true;
    }
}
