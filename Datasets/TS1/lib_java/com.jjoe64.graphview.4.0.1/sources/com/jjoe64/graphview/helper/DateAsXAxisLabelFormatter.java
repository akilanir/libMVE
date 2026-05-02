package com.jjoe64.graphview.helper;

import android.content.Context;
import com.jjoe64.graphview.DefaultLabelFormatter;
import java.text.DateFormat;
import java.util.Calendar;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/helper/DateAsXAxisLabelFormatter.class */
public class DateAsXAxisLabelFormatter extends DefaultLabelFormatter {
    protected final DateFormat mDateFormat;
    protected final Calendar mCalendar = Calendar.getInstance();

    public DateAsXAxisLabelFormatter(Context context) {
        this.mDateFormat = android.text.format.DateFormat.getDateFormat(context);
    }

    public DateAsXAxisLabelFormatter(Context context, DateFormat dateFormat) {
        this.mDateFormat = dateFormat;
    }

    @Override // com.jjoe64.graphview.DefaultLabelFormatter, com.jjoe64.graphview.LabelFormatter
    public String formatLabel(double value, boolean isValueX) {
        if (isValueX) {
            this.mCalendar.setTimeInMillis((long) value);
            return this.mDateFormat.format(Long.valueOf(this.mCalendar.getTimeInMillis()));
        }
        return super.formatLabel(value, isValueX);
    }
}
