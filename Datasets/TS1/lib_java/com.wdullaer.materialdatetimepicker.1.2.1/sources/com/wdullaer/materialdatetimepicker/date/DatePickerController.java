package com.wdullaer.materialdatetimepicker.date;

import com.wdullaer.materialdatetimepicker.date.DatePickerDialog;
import com.wdullaer.materialdatetimepicker.date.MonthAdapter;
import java.util.Calendar;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/date/DatePickerController.class */
public interface DatePickerController {
    void onYearSelected(int i);

    void onDayOfMonthSelected(int i, int i2, int i3);

    void registerOnDateChangedListener(DatePickerDialog.OnDateChangedListener onDateChangedListener);

    void unregisterOnDateChangedListener(DatePickerDialog.OnDateChangedListener onDateChangedListener);

    MonthAdapter.CalendarDay getSelectedDay();

    int getFirstDayOfWeek();

    int getMinYear();

    int getMaxYear();

    Calendar getMinDate();

    Calendar getMaxDate();

    void tryVibrate();
}
