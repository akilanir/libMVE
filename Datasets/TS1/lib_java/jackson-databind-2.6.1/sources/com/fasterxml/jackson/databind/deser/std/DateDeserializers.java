package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.util.StdDateFormat;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers.class */
public class DateDeserializers {
    private static final HashSet<String> _classNames = new HashSet<>();

    static {
        Class<?>[] numberTypes = {Calendar.class, GregorianCalendar.class, Date.class, java.util.Date.class, Timestamp.class};
        for (Class<?> cls : numberTypes) {
            _classNames.add(cls.getName());
        }
    }

    public static JsonDeserializer<?> find(Class<?> rawType, String clsName) {
        if (_classNames.contains(clsName)) {
            if (rawType == Calendar.class) {
                return new CalendarDeserializer();
            }
            if (rawType == java.util.Date.class) {
                return DateDeserializer.instance;
            }
            if (rawType == Date.class) {
                return new SqlDateDeserializer();
            }
            if (rawType == Timestamp.class) {
                return new TimestampDeserializer();
            }
            if (rawType == GregorianCalendar.class) {
                return new CalendarDeserializer(GregorianCalendar.class);
            }
            return null;
        }
        return null;
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers$DateBasedDeserializer.class */
    protected static abstract class DateBasedDeserializer<T> extends StdScalarDeserializer<T> implements ContextualDeserializer {
        protected final DateFormat _customFormat;
        protected final String _formatString;

        /* renamed from: withDateFormat */
        protected abstract DateBasedDeserializer<T> withDateFormat2(DateFormat dateFormat, String str);

        protected DateBasedDeserializer(Class<?> clz) {
            super(clz);
            this._customFormat = null;
            this._formatString = null;
        }

        protected DateBasedDeserializer(DateBasedDeserializer<T> base, DateFormat format, String formatStr) {
            super(base._valueClass);
            this._customFormat = format;
            this._formatString = formatStr;
        }

        public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
            JsonFormat.Value format;
            DateFormat df;
            if (property != null && (format = ctxt.getAnnotationIntrospector().findFormat(property.getMember())) != null) {
                TimeZone tz = format.getTimeZone();
                if (format.hasPattern()) {
                    String pattern = format.getPattern();
                    Locale loc = format.hasLocale() ? format.getLocale() : ctxt.getLocale();
                    SimpleDateFormat df2 = new SimpleDateFormat(pattern, loc);
                    if (tz == null) {
                        tz = ctxt.getTimeZone();
                    }
                    df2.setTimeZone(tz);
                    return withDateFormat2(df2, pattern);
                }
                if (tz != null) {
                    DateFormat df3 = ctxt.getConfig().getDateFormat();
                    if (df3.getClass() == StdDateFormat.class) {
                        Locale loc2 = format.hasLocale() ? format.getLocale() : ctxt.getLocale();
                        StdDateFormat std = (StdDateFormat) df3;
                        df = std.withTimeZone(tz).withLocale(loc2);
                    } else {
                        df = (DateFormat) df3.clone();
                        df.setTimeZone(tz);
                    }
                    return withDateFormat2(df, this._formatString);
                }
            }
            return this;
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer
        protected java.util.Date _parseDate(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
            java.util.Date parse;
            if (this._customFormat != null) {
                JsonToken currentToken = jsonParser.getCurrentToken();
                if (currentToken == JsonToken.VALUE_STRING) {
                    String trim = jsonParser.getText().trim();
                    if (trim.length() == 0) {
                        return (java.util.Date) getEmptyValue(deserializationContext);
                    }
                    synchronized (this._customFormat) {
                        try {
                            parse = this._customFormat.parse(trim);
                        } catch (ParseException e) {
                            throw new IllegalArgumentException("Failed to parse Date value '" + trim + "' (format: \"" + this._formatString + "\"): " + e.getMessage());
                        }
                    }
                    return parse;
                }
                if (currentToken == JsonToken.START_ARRAY && deserializationContext.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
                    jsonParser.nextToken();
                    java.util.Date _parseDate = _parseDate(jsonParser, deserializationContext);
                    if (jsonParser.nextToken() != JsonToken.END_ARRAY) {
                        throw deserializationContext.wrongTokenException(jsonParser, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single 'java.util.Date' value but there was more than a single value in the array");
                    }
                    return _parseDate;
                }
            }
            return super._parseDate(jsonParser, deserializationContext);
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers$CalendarDeserializer.class */
    public static class CalendarDeserializer extends DateBasedDeserializer<Calendar> {
        protected final Class<? extends Calendar> _calendarClass;

        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer, com.fasterxml.jackson.databind.deser.ContextualDeserializer
        public /* bridge */ /* synthetic */ JsonDeserializer createContextual(DeserializationContext x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        public CalendarDeserializer() {
            super(Calendar.class);
            this._calendarClass = null;
        }

        public CalendarDeserializer(Class<? extends Calendar> cc) {
            super(cc);
            this._calendarClass = cc;
        }

        public CalendarDeserializer(CalendarDeserializer src, DateFormat df, String formatString) {
            super(src, df, formatString);
            this._calendarClass = src._calendarClass;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer
        /* renamed from: withDateFormat, reason: merged with bridge method [inline-methods] */
        public DateBasedDeserializer<Calendar> withDateFormat2(DateFormat df, String formatString) {
            return new CalendarDeserializer(this, df, formatString);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Calendar deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            java.util.Date d = _parseDate(jp, ctxt);
            if (d == null) {
                return null;
            }
            if (this._calendarClass == null) {
                return ctxt.constructCalendar(d);
            }
            try {
                Calendar c = this._calendarClass.newInstance();
                c.setTimeInMillis(d.getTime());
                TimeZone tz = ctxt.getTimeZone();
                if (tz != null) {
                    c.setTimeZone(tz);
                }
                return c;
            } catch (Exception e) {
                throw ctxt.instantiationException(this._calendarClass, e);
            }
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers$DateDeserializer.class */
    public static class DateDeserializer extends DateBasedDeserializer<java.util.Date> {
        public static final DateDeserializer instance = new DateDeserializer();

        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer, com.fasterxml.jackson.databind.deser.ContextualDeserializer
        public /* bridge */ /* synthetic */ JsonDeserializer createContextual(DeserializationContext x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        public DateDeserializer() {
            super(java.util.Date.class);
        }

        public DateDeserializer(DateDeserializer base, DateFormat df, String formatString) {
            super(base, df, formatString);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer
        /* renamed from: withDateFormat */
        public DateBasedDeserializer<java.util.Date> withDateFormat2(DateFormat df, String formatString) {
            return new DateDeserializer(this, df, formatString);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public java.util.Date deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            return _parseDate(jp, ctxt);
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers$SqlDateDeserializer.class */
    public static class SqlDateDeserializer extends DateBasedDeserializer<Date> {
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer, com.fasterxml.jackson.databind.deser.ContextualDeserializer
        public /* bridge */ /* synthetic */ JsonDeserializer createContextual(DeserializationContext x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        public SqlDateDeserializer() {
            super(Date.class);
        }

        public SqlDateDeserializer(SqlDateDeserializer src, DateFormat df, String formatString) {
            super(src, df, formatString);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer
        /* renamed from: withDateFormat */
        public DateBasedDeserializer<Date> withDateFormat2(DateFormat df, String formatString) {
            return new SqlDateDeserializer(this, df, formatString);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Date deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            java.util.Date d = _parseDate(jp, ctxt);
            if (d == null) {
                return null;
            }
            return new Date(d.getTime());
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/DateDeserializers$TimestampDeserializer.class */
    public static class TimestampDeserializer extends DateBasedDeserializer<Timestamp> {
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer, com.fasterxml.jackson.databind.deser.ContextualDeserializer
        public /* bridge */ /* synthetic */ JsonDeserializer createContextual(DeserializationContext x0, BeanProperty x1) throws JsonMappingException {
            return super.createContextual(x0, x1);
        }

        public TimestampDeserializer() {
            super(Timestamp.class);
        }

        public TimestampDeserializer(TimestampDeserializer src, DateFormat df, String formatString) {
            super(src, df, formatString);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateBasedDeserializer
        /* renamed from: withDateFormat */
        public DateBasedDeserializer<Timestamp> withDateFormat2(DateFormat df, String formatString) {
            return new TimestampDeserializer(this, df, formatString);
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Timestamp deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            return new Timestamp(_parseDate(jp, ctxt).getTime());
        }
    }
}
