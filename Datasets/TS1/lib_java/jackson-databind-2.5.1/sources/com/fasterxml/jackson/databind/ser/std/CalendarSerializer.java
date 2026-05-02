package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Calendar;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/CalendarSerializer.class */
public class CalendarSerializer extends DateTimeSerializerBase<Calendar> {
    public static final CalendarSerializer instance = new CalendarSerializer();

    public CalendarSerializer() {
        this(null, null);
    }

    public CalendarSerializer(Boolean useTimestamp, DateFormat customFormat) {
        super(Calendar.class, useTimestamp, customFormat);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    /* renamed from: withFormat */
    public DateTimeSerializerBase<Calendar> withFormat2(Boolean timestamp, DateFormat customFormat) {
        return new CalendarSerializer(timestamp, customFormat);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    public long _timestamp(Calendar value) {
        if (value == null) {
            return 0L;
        }
        return value.getTimeInMillis();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Calendar value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        if (_asTimestamp(provider)) {
            jgen.writeNumber(_timestamp(value));
        } else {
            if (this._customFormat != null) {
                synchronized (this._customFormat) {
                    jgen.writeString(this._customFormat.format(value.getTime()));
                }
                return;
            }
            provider.defaultSerializeDateValue(value.getTime(), jgen);
        }
    }
}
