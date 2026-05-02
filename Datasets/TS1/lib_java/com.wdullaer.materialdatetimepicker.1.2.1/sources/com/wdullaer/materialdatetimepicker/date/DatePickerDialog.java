package com.wdullaer.materialdatetimepicker.date;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.DialogFragment;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.text.format.DateUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.wdullaer.materialdatetimepicker.HapticFeedbackController;
import com.wdullaer.materialdatetimepicker.R;
import com.wdullaer.materialdatetimepicker.TypefaceHelper;
import com.wdullaer.materialdatetimepicker.Utils;
import com.wdullaer.materialdatetimepicker.date.MonthAdapter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DatePickerDialog.class */
public class DatePickerDialog extends DialogFragment implements View.OnClickListener, DatePickerController {
    private static final String TAG = "DatePickerDialog";
    private static final int UNINITIALIZED = -1;
    private static final int MONTH_AND_DAY_VIEW = 0;
    private static final int YEAR_VIEW = 1;
    private static final String KEY_SELECTED_YEAR = "year";
    private static final String KEY_SELECTED_MONTH = "month";
    private static final String KEY_SELECTED_DAY = "day";
    private static final String KEY_LIST_POSITION = "list_position";
    private static final String KEY_WEEK_START = "week_start";
    private static final String KEY_YEAR_START = "year_start";
    private static final String KEY_YEAR_END = "year_end";
    private static final String KEY_CURRENT_VIEW = "current_view";
    private static final String KEY_LIST_POSITION_OFFSET = "list_position_offset";
    private static final int DEFAULT_START_YEAR = 1900;
    private static final int DEFAULT_END_YEAR = 2100;
    private static final int ANIMATION_DURATION = 300;
    private static final int ANIMATION_DELAY = 500;
    private static SimpleDateFormat YEAR_FORMAT = new SimpleDateFormat("yyyy", Locale.getDefault());
    private static SimpleDateFormat DAY_FORMAT = new SimpleDateFormat("dd", Locale.getDefault());
    private OnDateSetListener mCallBack;
    private AccessibleDateAnimator mAnimator;
    private TextView mDayOfWeekView;
    private LinearLayout mMonthAndDayView;
    private TextView mSelectedMonthTextView;
    private TextView mSelectedDayTextView;
    private TextView mYearView;
    private DayPickerView mDayPickerView;
    private YearPickerView mYearPickerView;
    private Calendar mMinDate;
    private Calendar mMaxDate;
    private HapticFeedbackController mHapticFeedbackController;
    private String mDayPickerDescription;
    private String mSelectDay;
    private String mYearPickerDescription;
    private String mSelectYear;
    private final Calendar mCalendar = Calendar.getInstance();
    private HashSet<OnDateChangedListener> mListeners = new HashSet<>();
    private int mCurrentView = UNINITIALIZED;
    private int mWeekStart = this.mCalendar.getFirstDayOfWeek();
    private int mMinYear = DEFAULT_START_YEAR;
    private int mMaxYear = DEFAULT_END_YEAR;
    private boolean mDelayAnimation = true;

    /* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateChangedListener.class */
    public interface OnDateChangedListener {
        void onDateChanged();
    }

    /* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DatePickerDialog$OnDateSetListener.class */
    public interface OnDateSetListener {
        void onDateSet(DatePickerDialog datePickerDialog, int i, int i2, int i3);
    }

    public static DatePickerDialog newInstance(OnDateSetListener callBack, int year, int monthOfYear, int dayOfMonth) {
        DatePickerDialog ret = new DatePickerDialog();
        ret.initialize(callBack, year, monthOfYear, dayOfMonth);
        return ret;
    }

    public void initialize(OnDateSetListener callBack, int year, int monthOfYear, int dayOfMonth) {
        this.mCallBack = callBack;
        this.mCalendar.set(1, year);
        this.mCalendar.set(2, monthOfYear);
        this.mCalendar.set(5, dayOfMonth);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Activity activity = getActivity();
        activity.getWindow().setSoftInputMode(3);
        if (savedInstanceState != null) {
            this.mCalendar.set(1, savedInstanceState.getInt("year"));
            this.mCalendar.set(2, savedInstanceState.getInt("month"));
            this.mCalendar.set(5, savedInstanceState.getInt(KEY_SELECTED_DAY));
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("year", this.mCalendar.get(1));
        outState.putInt("month", this.mCalendar.get(2));
        outState.putInt(KEY_SELECTED_DAY, this.mCalendar.get(5));
        outState.putInt("week_start", this.mWeekStart);
        outState.putInt(KEY_YEAR_START, this.mMinYear);
        outState.putInt(KEY_YEAR_END, this.mMaxYear);
        outState.putInt(KEY_CURRENT_VIEW, this.mCurrentView);
        int listPosition = UNINITIALIZED;
        if (this.mCurrentView == 0) {
            listPosition = this.mDayPickerView.getMostVisiblePosition();
        } else if (this.mCurrentView == 1) {
            listPosition = this.mYearPickerView.getFirstVisiblePosition();
            outState.putInt(KEY_LIST_POSITION_OFFSET, this.mYearPickerView.getFirstPositionOffset());
        }
        outState.putInt(KEY_LIST_POSITION, listPosition);
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        Log.d(TAG, "onCreateView: ");
        getDialog().getWindow().requestFeature(1);
        View view = inflater.inflate(R.layout.mdtp_date_picker_dialog, (ViewGroup) null);
        this.mDayOfWeekView = (TextView) view.findViewById(R.id.date_picker_header);
        this.mMonthAndDayView = (LinearLayout) view.findViewById(R.id.date_picker_month_and_day);
        this.mMonthAndDayView.setOnClickListener(this);
        this.mSelectedMonthTextView = (TextView) view.findViewById(R.id.date_picker_month);
        this.mSelectedDayTextView = (TextView) view.findViewById(R.id.date_picker_day);
        this.mYearView = (TextView) view.findViewById(R.id.date_picker_year);
        this.mYearView.setOnClickListener(this);
        int listPosition = UNINITIALIZED;
        int listPositionOffset = 0;
        int currentView = 0;
        if (savedInstanceState != null) {
            this.mWeekStart = savedInstanceState.getInt("week_start");
            this.mMinYear = savedInstanceState.getInt(KEY_YEAR_START);
            this.mMaxYear = savedInstanceState.getInt(KEY_YEAR_END);
            currentView = savedInstanceState.getInt(KEY_CURRENT_VIEW);
            listPosition = savedInstanceState.getInt(KEY_LIST_POSITION);
            listPositionOffset = savedInstanceState.getInt(KEY_LIST_POSITION_OFFSET);
        }
        Activity activity = getActivity();
        this.mDayPickerView = new SimpleDayPickerView(activity, this);
        this.mYearPickerView = new YearPickerView(activity, this);
        Resources res = getResources();
        this.mDayPickerDescription = res.getString(R.string.mdtp_day_picker_description);
        this.mSelectDay = res.getString(R.string.mdtp_select_day);
        this.mYearPickerDescription = res.getString(R.string.mdtp_year_picker_description);
        this.mSelectYear = res.getString(R.string.mdtp_select_year);
        this.mAnimator = (AccessibleDateAnimator) view.findViewById(R.id.animator);
        this.mAnimator.addView(this.mDayPickerView);
        this.mAnimator.addView(this.mYearPickerView);
        this.mAnimator.setDateMillis(this.mCalendar.getTimeInMillis());
        Animation animation = new AlphaAnimation(0.0f, 1.0f);
        animation.setDuration(300L);
        this.mAnimator.setInAnimation(animation);
        Animation animation2 = new AlphaAnimation(1.0f, 0.0f);
        animation2.setDuration(300L);
        this.mAnimator.setOutAnimation(animation2);
        Button okButton = (Button) view.findViewById(R.id.ok);
        okButton.setOnClickListener(new View.OnClickListener() { // from class: com.wdullaer.materialdatetimepicker.date.DatePickerDialog.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                DatePickerDialog.this.tryVibrate();
                if (DatePickerDialog.this.mCallBack != null) {
                    DatePickerDialog.this.mCallBack.onDateSet(DatePickerDialog.this, DatePickerDialog.this.mCalendar.get(1), DatePickerDialog.this.mCalendar.get(2), DatePickerDialog.this.mCalendar.get(5));
                }
                DatePickerDialog.this.dismiss();
            }
        });
        okButton.setTypeface(TypefaceHelper.get(activity, "Roboto-Medium"));
        Button cancelButton = (Button) view.findViewById(R.id.cancel);
        cancelButton.setOnClickListener(new View.OnClickListener() { // from class: com.wdullaer.materialdatetimepicker.date.DatePickerDialog.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                DatePickerDialog.this.tryVibrate();
                DatePickerDialog.this.dismiss();
            }
        });
        cancelButton.setTypeface(TypefaceHelper.get(activity, "Roboto-Medium"));
        cancelButton.setVisibility(isCancelable() ? 0 : 8);
        updateDisplay(false);
        setCurrentView(currentView);
        if (listPosition != UNINITIALIZED) {
            if (currentView == 0) {
                this.mDayPickerView.postSetSelection(listPosition);
            } else if (currentView == 1) {
                this.mYearPickerView.postSetSelectionFromTop(listPosition, listPositionOffset);
            }
        }
        this.mHapticFeedbackController = new HapticFeedbackController(activity);
        return view;
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.mHapticFeedbackController.start();
    }

    @Override // android.app.Fragment
    public void onPause() {
        super.onPause();
        this.mHapticFeedbackController.stop();
    }

    private void setCurrentView(int viewIndex) {
        long millis = this.mCalendar.getTimeInMillis();
        switch (viewIndex) {
            case 0:
                ObjectAnimator pulseAnimator = Utils.getPulseAnimator(this.mMonthAndDayView, 0.9f, 1.05f);
                if (this.mDelayAnimation) {
                    pulseAnimator.setStartDelay(500L);
                    this.mDelayAnimation = false;
                }
                this.mDayPickerView.onDateChanged();
                if (this.mCurrentView != viewIndex) {
                    this.mMonthAndDayView.setSelected(true);
                    this.mYearView.setSelected(false);
                    this.mAnimator.setDisplayedChild(0);
                    this.mCurrentView = viewIndex;
                }
                pulseAnimator.start();
                String dayString = DateUtils.formatDateTime(getActivity(), millis, 16);
                this.mAnimator.setContentDescription(this.mDayPickerDescription + ": " + dayString);
                Utils.tryAccessibilityAnnounce(this.mAnimator, this.mSelectDay);
                break;
            case 1:
                ObjectAnimator pulseAnimator2 = Utils.getPulseAnimator(this.mYearView, 0.85f, 1.1f);
                if (this.mDelayAnimation) {
                    pulseAnimator2.setStartDelay(500L);
                    this.mDelayAnimation = false;
                }
                this.mYearPickerView.onDateChanged();
                if (this.mCurrentView != viewIndex) {
                    this.mMonthAndDayView.setSelected(false);
                    this.mYearView.setSelected(true);
                    this.mAnimator.setDisplayedChild(1);
                    this.mCurrentView = viewIndex;
                }
                pulseAnimator2.start();
                CharSequence yearString = YEAR_FORMAT.format(Long.valueOf(millis));
                this.mAnimator.setContentDescription(this.mYearPickerDescription + ": " + ((Object) yearString));
                Utils.tryAccessibilityAnnounce(this.mAnimator, this.mSelectYear);
                break;
        }
    }

    private void updateDisplay(boolean announce) {
        if (this.mDayOfWeekView != null) {
            this.mDayOfWeekView.setText(this.mCalendar.getDisplayName(7, 2, Locale.getDefault()).toUpperCase(Locale.getDefault()));
        }
        this.mSelectedMonthTextView.setText(this.mCalendar.getDisplayName(2, 1, Locale.getDefault()).toUpperCase(Locale.getDefault()));
        this.mSelectedDayTextView.setText(DAY_FORMAT.format(this.mCalendar.getTime()));
        this.mYearView.setText(YEAR_FORMAT.format(this.mCalendar.getTime()));
        long millis = this.mCalendar.getTimeInMillis();
        this.mAnimator.setDateMillis(millis);
        String monthAndDayText = DateUtils.formatDateTime(getActivity(), millis, 24);
        this.mMonthAndDayView.setContentDescription(monthAndDayText);
        if (announce) {
            String fullDateText = DateUtils.formatDateTime(getActivity(), millis, 20);
            Utils.tryAccessibilityAnnounce(this.mAnimator, fullDateText);
        }
    }

    public void setFirstDayOfWeek(int startOfWeek) {
        if (startOfWeek < 1 || startOfWeek > 7) {
            throw new IllegalArgumentException("Value must be between Calendar.SUNDAY and Calendar.SATURDAY");
        }
        this.mWeekStart = startOfWeek;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    public void setYearRange(int startYear, int endYear) {
        if (endYear <= startYear) {
            throw new IllegalArgumentException("Year end must be larger than year start");
        }
        this.mMinYear = startYear;
        this.mMaxYear = endYear;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    public void setMinDate(Calendar calendar) {
        this.mMinDate = calendar;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public Calendar getMinDate() {
        return this.mMinDate;
    }

    public void setMaxDate(Calendar calendar) {
        this.mMaxDate = calendar;
        if (this.mDayPickerView != null) {
            this.mDayPickerView.onChange();
        }
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public Calendar getMaxDate() {
        return this.mMaxDate;
    }

    public void setOnDateSetListener(OnDateSetListener listener) {
        this.mCallBack = listener;
    }

    private void adjustDayInMonthIfNeeded(int month, int year) {
        int day = this.mCalendar.get(5);
        int daysInMonth = Utils.getDaysInMonth(month, year);
        if (day > daysInMonth) {
            this.mCalendar.set(5, daysInMonth);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        tryVibrate();
        if (v.getId() == R.id.date_picker_year) {
            setCurrentView(1);
        } else if (v.getId() == R.id.date_picker_month_and_day) {
            setCurrentView(0);
        }
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public void onYearSelected(int year) {
        adjustDayInMonthIfNeeded(this.mCalendar.get(2), year);
        this.mCalendar.set(1, year);
        updatePickers();
        setCurrentView(0);
        updateDisplay(true);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public void onDayOfMonthSelected(int year, int month, int day) {
        this.mCalendar.set(1, year);
        this.mCalendar.set(2, month);
        this.mCalendar.set(5, day);
        updatePickers();
        updateDisplay(true);
    }

    private void updatePickers() {
        Iterator<OnDateChangedListener> iterator = this.mListeners.iterator();
        while (iterator.hasNext()) {
            iterator.next().onDateChanged();
        }
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public MonthAdapter.CalendarDay getSelectedDay() {
        return new MonthAdapter.CalendarDay(this.mCalendar);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public int getMinYear() {
        return this.mMinYear;
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public int getMaxYear() {
        return this.mMaxYear;
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public int getFirstDayOfWeek() {
        return this.mWeekStart;
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public void registerOnDateChangedListener(OnDateChangedListener listener) {
        this.mListeners.add(listener);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public void unregisterOnDateChangedListener(OnDateChangedListener listener) {
        this.mListeners.remove(listener);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DatePickerController
    public void tryVibrate() {
        this.mHapticFeedbackController.tryVibrate();
    }
}
