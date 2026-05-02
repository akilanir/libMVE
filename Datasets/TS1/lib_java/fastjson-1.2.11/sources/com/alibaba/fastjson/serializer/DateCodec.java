package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONScanner;
import com.alibaba.fastjson.parser.deserializer.AbstractDateDeserializer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.IOUtils;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/DateCodec.class */
public class DateCodec extends AbstractDateDeserializer implements ObjectSerializer, ObjectDeserializer {
    public static final DateCodec instance = new DateCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        Date date;
        char[] buf;
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull();
            return;
        }
        if (object instanceof Date) {
            date = (Date) object;
        } else {
            date = TypeUtils.castToDate(object);
        }
        if (out.isEnabled(SerializerFeature.WriteDateUseDateFormat)) {
            DateFormat format = serializer.getDateFormat();
            if (format == null) {
                format = new SimpleDateFormat(JSON.DEFFAULT_DATE_FORMAT, serializer.locale);
                format.setTimeZone(serializer.timeZone);
            }
            String text = format.format(date);
            out.writeString(text);
            return;
        }
        if (out.isEnabled(SerializerFeature.WriteClassName) && object.getClass() != fieldType) {
            if (object.getClass() == Date.class) {
                out.write("new Date(");
                out.writeLong(((Date) object).getTime());
                out.write(41);
                return;
            } else {
                out.write(123);
                out.writeFieldName(JSON.DEFAULT_TYPE_KEY);
                serializer.write(object.getClass().getName());
                out.writeFieldValue(',', "val", ((Date) object).getTime());
                out.write(125);
                return;
            }
        }
        long time = date.getTime();
        if (out.isEnabled(SerializerFeature.UseISO8601DateFormat)) {
            char quote = out.isEnabled(SerializerFeature.UseSingleQuotes) ? '\'' : '\"';
            out.write(quote);
            Calendar calendar = Calendar.getInstance(serializer.timeZone, serializer.locale);
            calendar.setTimeInMillis(time);
            int year = calendar.get(1);
            int month = calendar.get(2) + 1;
            int day = calendar.get(5);
            int hour = calendar.get(11);
            int minute = calendar.get(12);
            int second = calendar.get(13);
            int millis = calendar.get(14);
            if (millis != 0) {
                buf = "0000-00-00T00:00:00.000".toCharArray();
                IOUtils.getChars(millis, 23, buf);
                IOUtils.getChars(second, 19, buf);
                IOUtils.getChars(minute, 16, buf);
                IOUtils.getChars(hour, 13, buf);
                IOUtils.getChars(day, 10, buf);
                IOUtils.getChars(month, 7, buf);
                IOUtils.getChars(year, 4, buf);
            } else if (second == 0 && minute == 0 && hour == 0) {
                buf = "0000-00-00".toCharArray();
                IOUtils.getChars(day, 10, buf);
                IOUtils.getChars(month, 7, buf);
                IOUtils.getChars(year, 4, buf);
            } else {
                buf = "0000-00-00T00:00:00".toCharArray();
                IOUtils.getChars(second, 19, buf);
                IOUtils.getChars(minute, 16, buf);
                IOUtils.getChars(hour, 13, buf);
                IOUtils.getChars(day, 10, buf);
                IOUtils.getChars(month, 7, buf);
                IOUtils.getChars(year, 4, buf);
            }
            out.write(buf);
            int timeZone = calendar.getTimeZone().getRawOffset() / 3600000;
            if (timeZone == 0) {
                out.write(90);
            } else {
                if (timeZone > 0) {
                    out.append('+').append((CharSequence) String.format("%02d", Integer.valueOf(timeZone)));
                } else {
                    out.append('-').append((CharSequence) String.format("%02d", Integer.valueOf(-timeZone)));
                }
                out.append((CharSequence) ":00");
            }
            out.write(quote);
            return;
        }
        out.writeLong(time);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v35, types: [T, java.util.Calendar] */
    @Override // com.alibaba.fastjson.parser.deserializer.AbstractDateDeserializer
    protected <T> T cast(DefaultJSONParser defaultJSONParser, Type type, Object obj, Object obj2) {
        if (obj2 == 0) {
            return null;
        }
        if (obj2 instanceof Date) {
            return obj2;
        }
        if (obj2 instanceof Number) {
            return (T) new Date(((Number) obj2).longValue());
        }
        if (obj2 instanceof String) {
            String str = (String) obj2;
            if (str.length() == 0) {
                return null;
            }
            JSONScanner jSONScanner = new JSONScanner(str);
            try {
                if (jSONScanner.scanISO8601DateIfMatch(false)) {
                    ?? r0 = (T) jSONScanner.getCalendar();
                    if (type == Calendar.class) {
                        return r0;
                    }
                    T t = (T) r0.getTime();
                    jSONScanner.close();
                    return t;
                }
                jSONScanner.close();
                if (str.length() == defaultJSONParser.getDateFomartPattern().length()) {
                    try {
                        return (T) defaultJSONParser.getDateFormat().parse(str);
                    } catch (ParseException e) {
                    }
                }
                if (str.startsWith("/Date(") && str.endsWith(")/")) {
                    str = str.substring(6, str.length() - 2);
                }
                return (T) new Date(Long.parseLong(str));
            } finally {
                jSONScanner.close();
            }
        }
        throw new JSONException("parse error");
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
