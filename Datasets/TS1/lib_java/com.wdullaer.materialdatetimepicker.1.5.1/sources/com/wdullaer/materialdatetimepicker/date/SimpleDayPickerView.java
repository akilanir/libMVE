package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;
import android.util.AttributeSet;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/SimpleDayPickerView.class */
public class SimpleDayPickerView extends DayPickerView {
    public SimpleDayPickerView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public SimpleDayPickerView(Context context, DatePickerController controller) {
        super(context, controller);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.DayPickerView
    public MonthAdapter createMonthAdapter(Context context, DatePickerController controller) {
        return new SimpleMonthAdapter(context, controller);
    }
}
