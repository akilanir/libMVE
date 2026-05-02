package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/DateSerializer.class */
public class DateSerializer extends DateTimeSerializerBase<Date> {
    public static final DateSerializer instance = new DateSerializer();

    public DateSerializer() {
        this(null, null);
    }

    public DateSerializer(Boolean useTimestamp, DateFormat customFormat) {
        super(Date.class, useTimestamp, customFormat);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    /* renamed from: withFormat, reason: merged with bridge method [inline-methods] */
    public DateTimeSerializerBase<Date> withFormat2(Boolean timestamp, DateFormat customFormat) {
        return new DateSerializer(timestamp, customFormat);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase
    public long _timestamp(Date value) {
        if (value == null) {
            return 0L;
        }
        return value.getTime();
    }

    @Override // com.fasterxml.jackson.databind.ser.std.DateTimeSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (_asTimestamp(provider)) {
            jgen.writeNumber(_timestamp(value));
        } else {
            if (this._customFormat != null) {
                synchronized (this._customFormat) {
                    jgen.writeString(this._customFormat.format(value));
                }
                return;
            }
            provider.defaultSerializeDateValue(value, jgen);
        }
    }
}
