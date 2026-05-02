package com.wdullaer.materialdatetimepicker.time;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import com.wdullaer.materialdatetimepicker.R;
import java.util.Calendar;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/time/RadialPickerLayout.class */
public class RadialPickerLayout extends FrameLayout implements View.OnTouchListener {
    private static final String TAG = "RadialPickerLayout";
    private final int TOUCH_SLOP;
    private final int TAP_TIMEOUT;
    private static final int VISIBLE_DEGREES_STEP_SIZE = 30;
    private static final int HOUR_VALUE_TO_DEGREES_STEP_SIZE = 30;
    private static final int MINUTE_VALUE_TO_DEGREES_STEP_SIZE = 6;
    private static final int HOUR_INDEX = 0;
    private static final int MINUTE_INDEX = 1;
    private static final int AMPM_INDEX = 2;
    private static final int ENABLE_PICKER_INDEX = 3;
    private static final int AM = 0;
    private static final int PM = 1;
    private int mLastValueSelected;
    private TimePickerDialog mTimePickerDialog;
    private OnValueSelectedListener mListener;
    private boolean mTimeInitialized;
    private int mCurrentHoursOfDay;
    private int mCurrentMinutes;
    private boolean mIs24HourMode;
    private boolean mHideAmPm;
    private int mCurrentItemShowing;
    private CircleView mCircleView;
    private AmPmCirclesView mAmPmCirclesView;
    private RadialTextsView mHourRadialTextsView;
    private RadialTextsView mMinuteRadialTextsView;
    private RadialSelectorView mHourRadialSelectorView;
    private RadialSelectorView mMinuteRadialSelectorView;
    private View mGrayBox;
    private int[] mSnapPrefer30sMap;
    private boolean mInputEnabled;
    private int mIsTouchingAmOrPm;
    private boolean mDoingMove;
    private boolean mDoingTouch;
    private int mDownDegrees;
    private float mDownX;
    private float mDownY;
    private AccessibilityManager mAccessibilityManager;
    private AnimatorSet mTransition;
    private Handler mHandler;

    /* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/time/RadialPickerLayout$OnValueSelectedListener.class */
    public interface OnValueSelectedListener {
        void onValueSelected(int i, int i2, boolean z);
    }

    public RadialPickerLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mIsTouchingAmOrPm = -1;
        this.mHandler = new Handler();
        setOnTouchListener(this);
        ViewConfiguration vc = ViewConfiguration.get(context);
        this.TOUCH_SLOP = vc.getScaledTouchSlop();
        this.TAP_TIMEOUT = ViewConfiguration.getTapTimeout();
        this.mDoingMove = false;
        this.mCircleView = new CircleView(context);
        addView(this.mCircleView);
        this.mAmPmCirclesView = new AmPmCirclesView(context);
        addView(this.mAmPmCirclesView);
        this.mHourRadialSelectorView = new RadialSelectorView(context);
        addView(this.mHourRadialSelectorView);
        this.mMinuteRadialSelectorView = new RadialSelectorView(context);
        addView(this.mMinuteRadialSelectorView);
        this.mHourRadialTextsView = new RadialTextsView(context);
        addView(this.mHourRadialTextsView);
        this.mMinuteRadialTextsView = new RadialTextsView(context);
        addView(this.mMinuteRadialTextsView);
        preparePrefer30sMap();
        this.mLastValueSelected = -1;
        this.mInputEnabled = true;
        this.mGrayBox = new View(context);
        this.mGrayBox.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.mGrayBox.setBackgroundColor(getResources().getColor(R.color.mdtp_transparent_black));
        this.mGrayBox.setVisibility(4);
        addView(this.mGrayBox);
        this.mAccessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
        this.mTimeInitialized = false;
    }

    public void setOnValueSelectedListener(OnValueSelectedListener listener) {
        this.mListener = listener;
    }

    public void initialize(Context context, TimePickerDialog timePickerDialog, int initialHoursOfDay, int initialMinutes, boolean is24HourMode) {
        if (this.mTimeInitialized) {
            Log.e(TAG, "Time has already been initialized.");
            return;
        }
        this.mTimePickerDialog = timePickerDialog;
        this.mIs24HourMode = is24HourMode;
        this.mHideAmPm = this.mAccessibilityManager.isTouchExplorationEnabled() || this.mIs24HourMode;
        this.mCircleView.initialize(context, this.mHideAmPm);
        this.mCircleView.invalidate();
        if (!this.mHideAmPm) {
            this.mAmPmCirclesView.initialize(context, initialHoursOfDay < 12 ? 0 : 1);
            this.mAmPmCirclesView.invalidate();
        }
        Resources res = context.getResources();
        int[] hours = {12, 1, 2, 3, 4, 5, MINUTE_VALUE_TO_DEGREES_STEP_SIZE, 7, 8, 9, 10, 11};
        int[] hours_24 = {0, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
        int[] minutes = {0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55};
        String[] hoursTexts = new String[12];
        String[] innerHoursTexts = new String[12];
        String[] minutesTexts = new String[12];
        for (int i = 0; i < 12; i++) {
            hoursTexts[i] = is24HourMode ? String.format("%02d", Integer.valueOf(hours_24[i])) : String.format("%d", Integer.valueOf(hours[i]));
            innerHoursTexts[i] = String.format("%d", Integer.valueOf(hours[i]));
            minutesTexts[i] = String.format("%02d", Integer.valueOf(minutes[i]));
        }
        this.mHourRadialTextsView.initialize(res, hoursTexts, is24HourMode ? innerHoursTexts : null, this.mHideAmPm, true);
        this.mHourRadialTextsView.setSelection(is24HourMode ? initialHoursOfDay : hours[initialHoursOfDay % 12]);
        this.mHourRadialTextsView.invalidate();
        this.mMinuteRadialTextsView.initialize(res, minutesTexts, null, this.mHideAmPm, false);
        this.mMinuteRadialTextsView.setSelection(initialMinutes);
        this.mMinuteRadialTextsView.invalidate();
        setValueForItem(0, initialHoursOfDay);
        setValueForItem(1, initialMinutes);
        int hourDegrees = (initialHoursOfDay % 12) * 30;
        this.mHourRadialSelectorView.initialize(context, this.mHideAmPm, is24HourMode, true, hourDegrees, isHourInnerCircle(initialHoursOfDay));
        int minuteDegrees = initialMinutes * MINUTE_VALUE_TO_DEGREES_STEP_SIZE;
        this.mMinuteRadialSelectorView.initialize(context, this.mHideAmPm, false, false, minuteDegrees, false);
        this.mTimeInitialized = true;
    }

    void setTheme(Context context, boolean themeDark) {
        this.mCircleView.setTheme(context, themeDark);
        this.mAmPmCirclesView.setTheme(context, themeDark);
        this.mHourRadialTextsView.setTheme(context, themeDark);
        this.mMinuteRadialTextsView.setTheme(context, themeDark);
        this.mHourRadialSelectorView.setTheme(context, themeDark);
        this.mMinuteRadialSelectorView.setTheme(context, themeDark);
    }

    public void setAccentColor(int accentColor) {
        this.mHourRadialSelectorView.setAccentColor(accentColor);
        this.mMinuteRadialSelectorView.setAccentColor(accentColor);
        this.mAmPmCirclesView.setAccentColor(accentColor);
        this.mCircleView.setAccentColor(accentColor);
    }

    public void setTime(int hours, int minutes) {
        setItem(0, hours);
        setItem(1, minutes);
    }

    private void setItem(int index, int value) {
        if (index == 0) {
            setValueForItem(0, value);
            int hourDegrees = (value % 12) * 30;
            this.mHourRadialSelectorView.setSelection(hourDegrees, isHourInnerCircle(value), false);
            this.mHourRadialSelectorView.invalidate();
            this.mHourRadialTextsView.setSelection(value);
            this.mHourRadialTextsView.invalidate();
            return;
        }
        if (index == 1) {
            setValueForItem(1, value);
            int minuteDegrees = value * MINUTE_VALUE_TO_DEGREES_STEP_SIZE;
            this.mMinuteRadialSelectorView.setSelection(minuteDegrees, false, false);
            this.mMinuteRadialSelectorView.invalidate();
            this.mMinuteRadialTextsView.setSelection(value);
            this.mHourRadialTextsView.invalidate();
        }
    }

    private boolean isHourInnerCircle(int hourOfDay) {
        return this.mIs24HourMode && hourOfDay <= 12 && hourOfDay != 0;
    }

    public int getHours() {
        return this.mCurrentHoursOfDay;
    }

    public int getMinutes() {
        return this.mCurrentMinutes;
    }

    private int getCurrentlyShowingValue() {
        int currentIndex = getCurrentItemShowing();
        if (currentIndex == 0) {
            return this.mCurrentHoursOfDay;
        }
        if (currentIndex == 1) {
            return this.mCurrentMinutes;
        }
        return -1;
    }

    public int getIsCurrentlyAmOrPm() {
        if (this.mCurrentHoursOfDay < 12) {
            return 0;
        }
        if (this.mCurrentHoursOfDay < 24) {
            return 1;
        }
        return -1;
    }

    private void setValueForItem(int index, int value) {
        if (index == 0) {
            this.mCurrentHoursOfDay = value;
            return;
        }
        if (index == 1) {
            this.mCurrentMinutes = value;
            return;
        }
        if (index == 2) {
            if (value == 0) {
                this.mCurrentHoursOfDay %= 12;
            } else if (value == 1) {
                this.mCurrentHoursOfDay = (this.mCurrentHoursOfDay % 12) + 12;
            }
        }
    }

    public void setAmOrPm(int amOrPm) {
        this.mAmPmCirclesView.setAmOrPm(amOrPm);
        this.mAmPmCirclesView.invalidate();
        setValueForItem(2, amOrPm);
    }

    private void preparePrefer30sMap() {
        this.mSnapPrefer30sMap = new int[361];
        int snappedOutputDegrees = 0;
        int count = 1;
        int expectedCount = 8;
        for (int degrees = 0; degrees < 361; degrees++) {
            this.mSnapPrefer30sMap[degrees] = snappedOutputDegrees;
            if (count == expectedCount) {
                snappedOutputDegrees += MINUTE_VALUE_TO_DEGREES_STEP_SIZE;
                if (snappedOutputDegrees == 360) {
                    expectedCount = 7;
                } else if (snappedOutputDegrees % 30 == 0) {
                    expectedCount = 14;
                } else {
                    expectedCount = 4;
                }
                count = 1;
            } else {
                count++;
            }
        }
    }

    private int snapPrefer30s(int degrees) {
        if (this.mSnapPrefer30sMap == null) {
            return -1;
        }
        return this.mSnapPrefer30sMap[degrees];
    }

    private static int snapOnly30s(int degrees, int forceHigherOrLower) {
        int degrees2;
        int floor = (degrees / 30) * 30;
        int ceiling = floor + 30;
        if (forceHigherOrLower == 1) {
            degrees2 = ceiling;
        } else if (forceHigherOrLower == -1) {
            if (degrees == floor) {
                floor -= 30;
            }
            degrees2 = floor;
        } else if (degrees - floor < ceiling - degrees) {
            degrees2 = floor;
        } else {
            degrees2 = ceiling;
        }
        return degrees2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int reselectSelector(int degrees, boolean isInnerCircle, boolean forceToVisibleValue, boolean forceDrawDot) {
        int degrees2;
        RadialSelectorView radialSelectorView;
        int stepSize;
        if (degrees == -1) {
            return -1;
        }
        int currentShowing = getCurrentItemShowing();
        boolean allowFineGrained = !forceToVisibleValue && currentShowing == 1;
        if (allowFineGrained) {
            degrees2 = snapPrefer30s(degrees);
        } else {
            degrees2 = snapOnly30s(degrees, 0);
        }
        if (currentShowing == 0) {
            radialSelectorView = this.mHourRadialSelectorView;
            stepSize = 30;
        } else {
            radialSelectorView = this.mMinuteRadialSelectorView;
            stepSize = MINUTE_VALUE_TO_DEGREES_STEP_SIZE;
        }
        radialSelectorView.setSelection(degrees2, isInnerCircle, forceDrawDot);
        radialSelectorView.invalidate();
        if (currentShowing == 0) {
            if (this.mIs24HourMode) {
                if (degrees2 == 0 && isInnerCircle) {
                    degrees2 = 360;
                } else if (degrees2 == 360 && !isInnerCircle) {
                    degrees2 = 0;
                }
            } else if (degrees2 == 0) {
                degrees2 = 360;
            }
        } else if (degrees2 == 360 && currentShowing == 1) {
            degrees2 = 0;
        }
        int value = degrees2 / stepSize;
        if (currentShowing == 0 && this.mIs24HourMode && !isInnerCircle && degrees2 != 0) {
            value += 12;
        }
        if (getCurrentItemShowing() == 0) {
            this.mHourRadialTextsView.setSelection(value);
            this.mHourRadialTextsView.invalidate();
        } else if (getCurrentItemShowing() == 1) {
            this.mMinuteRadialTextsView.setSelection(value);
            this.mMinuteRadialTextsView.invalidate();
        }
        return value;
    }

    private int getDegreesFromCoords(float pointX, float pointY, boolean forceLegal, Boolean[] isInnerCircle) {
        int currentItem = getCurrentItemShowing();
        if (currentItem == 0) {
            return this.mHourRadialSelectorView.getDegreesFromCoords(pointX, pointY, forceLegal, isInnerCircle);
        }
        if (currentItem == 1) {
            return this.mMinuteRadialSelectorView.getDegreesFromCoords(pointX, pointY, forceLegal, isInnerCircle);
        }
        return -1;
    }

    public int getCurrentItemShowing() {
        if (this.mCurrentItemShowing != 0 && this.mCurrentItemShowing != 1) {
            Log.e(TAG, "Current item showing was unfortunately set to " + this.mCurrentItemShowing);
            return -1;
        }
        return this.mCurrentItemShowing;
    }

    public void setCurrentItemShowing(int index, boolean animate) {
        if (index != 0 && index != 1) {
            Log.e(TAG, "TimePicker does not support view at index " + index);
            return;
        }
        int lastIndex = getCurrentItemShowing();
        this.mCurrentItemShowing = index;
        if (animate && index != lastIndex) {
            ObjectAnimator[] anims = new ObjectAnimator[4];
            if (index == 1) {
                anims[0] = this.mHourRadialTextsView.getDisappearAnimator();
                anims[1] = this.mHourRadialSelectorView.getDisappearAnimator();
                anims[2] = this.mMinuteRadialTextsView.getReappearAnimator();
                anims[3] = this.mMinuteRadialSelectorView.getReappearAnimator();
            } else if (index == 0) {
                anims[0] = this.mHourRadialTextsView.getReappearAnimator();
                anims[1] = this.mHourRadialSelectorView.getReappearAnimator();
                anims[2] = this.mMinuteRadialTextsView.getDisappearAnimator();
                anims[3] = this.mMinuteRadialSelectorView.getDisappearAnimator();
            }
            if (this.mTransition != null && this.mTransition.isRunning()) {
                this.mTransition.end();
            }
            this.mTransition = new AnimatorSet();
            this.mTransition.playTogether(anims);
            this.mTransition.start();
            return;
        }
        int hourAlpha = index == 0 ? 255 : 0;
        int minuteAlpha = index == 1 ? 255 : 0;
        this.mHourRadialTextsView.setAlpha(hourAlpha);
        this.mHourRadialSelectorView.setAlpha(hourAlpha);
        this.mMinuteRadialTextsView.setAlpha(minuteAlpha);
        this.mMinuteRadialSelectorView.setAlpha(minuteAlpha);
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View v, MotionEvent event) {
        int degrees;
        int value;
        float eventX = event.getX();
        float eventY = event.getY();
        final Boolean[] isInnerCircle = {false};
        switch (event.getAction()) {
            case 0:
                if (this.mInputEnabled) {
                    this.mDownX = eventX;
                    this.mDownY = eventY;
                    this.mLastValueSelected = -1;
                    this.mDoingMove = false;
                    this.mDoingTouch = true;
                    if (!this.mHideAmPm) {
                        this.mIsTouchingAmOrPm = this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY);
                    } else {
                        this.mIsTouchingAmOrPm = -1;
                    }
                    if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                        this.mTimePickerDialog.tryVibrate();
                        this.mDownDegrees = -1;
                        this.mHandler.postDelayed(new Runnable() { // from class: com.wdullaer.materialdatetimepicker.time.RadialPickerLayout.1
                            @Override // java.lang.Runnable
                            public void run() {
                                RadialPickerLayout.this.mAmPmCirclesView.setAmOrPmPressed(RadialPickerLayout.this.mIsTouchingAmOrPm);
                                RadialPickerLayout.this.mAmPmCirclesView.invalidate();
                            }
                        }, this.TAP_TIMEOUT);
                        break;
                    } else {
                        boolean forceLegal = this.mAccessibilityManager.isTouchExplorationEnabled();
                        this.mDownDegrees = getDegreesFromCoords(eventX, eventY, forceLegal, isInnerCircle);
                        if (this.mDownDegrees != -1) {
                            this.mTimePickerDialog.tryVibrate();
                            this.mHandler.postDelayed(new Runnable() { // from class: com.wdullaer.materialdatetimepicker.time.RadialPickerLayout.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    RadialPickerLayout.this.mDoingMove = true;
                                    int value2 = RadialPickerLayout.this.reselectSelector(RadialPickerLayout.this.mDownDegrees, isInnerCircle[0].booleanValue(), false, true);
                                    RadialPickerLayout.this.mLastValueSelected = value2;
                                    RadialPickerLayout.this.mListener.onValueSelected(RadialPickerLayout.this.getCurrentItemShowing(), value2, false);
                                }
                            }, this.TAP_TIMEOUT);
                            break;
                        }
                    }
                }
                break;
            case 1:
                if (!this.mInputEnabled) {
                    Log.d(TAG, "Input was disabled, but received ACTION_UP.");
                    this.mListener.onValueSelected(3, 1, false);
                    break;
                } else {
                    this.mHandler.removeCallbacksAndMessages(null);
                    this.mDoingTouch = false;
                    if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                        int isTouchingAmOrPm = this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY);
                        this.mAmPmCirclesView.setAmOrPmPressed(-1);
                        this.mAmPmCirclesView.invalidate();
                        if (isTouchingAmOrPm == this.mIsTouchingAmOrPm) {
                            this.mAmPmCirclesView.setAmOrPm(isTouchingAmOrPm);
                            if (getIsCurrentlyAmOrPm() != isTouchingAmOrPm) {
                                this.mListener.onValueSelected(2, this.mIsTouchingAmOrPm, false);
                                setValueForItem(2, isTouchingAmOrPm);
                            }
                        }
                        this.mIsTouchingAmOrPm = -1;
                        break;
                    } else {
                        if (this.mDownDegrees != -1 && (degrees = getDegreesFromCoords(eventX, eventY, this.mDoingMove, isInnerCircle)) != -1) {
                            int value2 = reselectSelector(degrees, isInnerCircle[0].booleanValue(), !this.mDoingMove, false);
                            if (getCurrentItemShowing() == 0 && !this.mIs24HourMode) {
                                int amOrPm = getIsCurrentlyAmOrPm();
                                if (amOrPm == 0 && value2 == 12) {
                                    value2 = 0;
                                } else if (amOrPm == 1 && value2 != 12) {
                                    value2 += 12;
                                }
                            }
                            setValueForItem(getCurrentItemShowing(), value2);
                            this.mListener.onValueSelected(getCurrentItemShowing(), value2, true);
                        }
                        this.mDoingMove = false;
                        break;
                    }
                }
                break;
            case 2:
                if (!this.mInputEnabled) {
                    Log.e(TAG, "Input was disabled, but received ACTION_MOVE.");
                    break;
                } else {
                    float dY = Math.abs(eventY - this.mDownY);
                    float dX = Math.abs(eventX - this.mDownX);
                    if (this.mDoingMove || dX > this.TOUCH_SLOP || dY > this.TOUCH_SLOP) {
                        if (this.mIsTouchingAmOrPm == 0 || this.mIsTouchingAmOrPm == 1) {
                            this.mHandler.removeCallbacksAndMessages(null);
                            if (this.mAmPmCirclesView.getIsTouchingAmOrPm(eventX, eventY) != this.mIsTouchingAmOrPm) {
                                this.mAmPmCirclesView.setAmOrPmPressed(-1);
                                this.mAmPmCirclesView.invalidate();
                                this.mIsTouchingAmOrPm = -1;
                                break;
                            }
                        } else if (this.mDownDegrees != -1) {
                            this.mDoingMove = true;
                            this.mHandler.removeCallbacksAndMessages(null);
                            int degrees2 = getDegreesFromCoords(eventX, eventY, true, isInnerCircle);
                            if (degrees2 != -1 && (value = reselectSelector(degrees2, isInnerCircle[0].booleanValue(), false, true)) != this.mLastValueSelected) {
                                this.mTimePickerDialog.tryVibrate();
                                this.mLastValueSelected = value;
                                this.mListener.onValueSelected(getCurrentItemShowing(), value, false);
                                break;
                            }
                        }
                    }
                }
                break;
        }
        return true;
    }

    public boolean trySettingInputEnabled(boolean inputEnabled) {
        if (this.mDoingTouch && !inputEnabled) {
            return false;
        }
        this.mInputEnabled = inputEnabled;
        this.mGrayBox.setVisibility(inputEnabled ? 4 : 0);
        return true;
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(@NonNull AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        if (Build.VERSION.SDK_INT >= 21) {
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
        } else {
            info.addAction(4096);
            info.addAction(8192);
        }
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        if (event.getEventType() == 32) {
            event.getText().clear();
            Calendar time = Calendar.getInstance();
            time.set(10, getHours());
            time.set(12, getMinutes());
            long millis = time.getTimeInMillis();
            int flags = 1;
            if (this.mIs24HourMode) {
                flags = 1 | 128;
            }
            String timeString = DateUtils.formatDateTime(getContext(), millis, flags);
            event.getText().add(timeString);
            return true;
        }
        return super.dispatchPopulateAccessibilityEvent(event);
    }

    @Override // android.view.View
    @SuppressLint({"NewApi"})
    public boolean performAccessibilityAction(int action, Bundle arguments) {
        int maxValue;
        if (super.performAccessibilityAction(action, arguments)) {
            return true;
        }
        int changeMultiplier = 0;
        if (action == 4096) {
            changeMultiplier = 1;
        } else if (action == 8192) {
            changeMultiplier = -1;
        }
        if (changeMultiplier != 0) {
            int value = getCurrentlyShowingValue();
            int stepSize = 0;
            int currentItemShowing = getCurrentItemShowing();
            if (currentItemShowing == 0) {
                stepSize = 30;
                value %= 12;
            } else if (currentItemShowing == 1) {
                stepSize = MINUTE_VALUE_TO_DEGREES_STEP_SIZE;
            }
            int degrees = value * stepSize;
            int value2 = snapOnly30s(degrees, changeMultiplier) / stepSize;
            int minValue = 0;
            if (currentItemShowing == 0) {
                if (this.mIs24HourMode) {
                    maxValue = 23;
                } else {
                    maxValue = 12;
                    minValue = 1;
                }
            } else {
                maxValue = 55;
            }
            if (value2 > maxValue) {
                value2 = minValue;
            } else if (value2 < minValue) {
                value2 = maxValue;
            }
            setItem(currentItemShowing, value2);
            this.mListener.onValueSelected(currentItemShowing, value2, false);
            return true;
        }
        return false;
    }
}
