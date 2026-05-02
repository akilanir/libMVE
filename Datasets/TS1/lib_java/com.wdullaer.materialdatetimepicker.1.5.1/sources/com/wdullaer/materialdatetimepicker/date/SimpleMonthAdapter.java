package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/SimpleMonthAdapter.class */
public class SimpleMonthAdapter extends MonthAdapter {
    public SimpleMonthAdapter(Context context, DatePickerController controller) {
        super(context, controller);
    }

    @Override // com.wdullaer.materialdatetimepicker.date.MonthAdapter
    public MonthView createMonthView(Context context) {
        MonthView monthView = new SimpleMonthView(context, null, this.mController);
        return monthView;
    }
}
