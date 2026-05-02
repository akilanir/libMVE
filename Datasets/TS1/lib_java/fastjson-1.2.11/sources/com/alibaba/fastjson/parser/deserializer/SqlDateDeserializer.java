package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONScanner;
import java.lang.reflect.Type;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/SqlDateDeserializer.class */
public class SqlDateDeserializer extends AbstractDateDeserializer implements ObjectDeserializer {
    public static final SqlDateDeserializer instance = new SqlDateDeserializer();
    public static final SqlDateDeserializer instance_timestamp = new SqlDateDeserializer(true);
    private boolean timestamp;

    public SqlDateDeserializer() {
        this.timestamp = false;
    }

    public SqlDateDeserializer(boolean timestmap) {
        this.timestamp = false;
        this.timestamp = true;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.AbstractDateDeserializer
    protected <T> T cast(DefaultJSONParser defaultJSONParser, Type type, Object obj, Object obj2) {
        long parseLong;
        Date date;
        if (this.timestamp) {
            return (T) castTimestamp(defaultJSONParser, type, obj, obj2);
        }
        if (obj2 == null) {
            return null;
        }
        if (obj2 instanceof java.util.Date) {
            date = new Date(((java.util.Date) obj2).getTime());
        } else if (obj2 instanceof Number) {
            date = new Date(((Number) obj2).longValue());
        } else {
            if (obj2 instanceof String) {
                String str = (String) obj2;
                if (str.length() == 0) {
                    return null;
                }
                JSONScanner jSONScanner = new JSONScanner(str);
                try {
                    if (jSONScanner.scanISO8601DateIfMatch()) {
                        parseLong = jSONScanner.getCalendar().getTimeInMillis();
                    } else {
                        try {
                            T t = (T) new Date(defaultJSONParser.getDateFormat().parse(str).getTime());
                            jSONScanner.close();
                            return t;
                        } catch (ParseException e) {
                            parseLong = Long.parseLong(str);
                        }
                    }
                    return (T) new Date(parseLong);
                } finally {
                    jSONScanner.close();
                }
            }
            throw new JSONException("parse error : " + obj2);
        }
        return (T) date;
    }

    protected <T> T castTimestamp(DefaultJSONParser defaultJSONParser, Type type, Object obj, Object obj2) {
        long parseLong;
        if (obj2 == null) {
            return null;
        }
        if (obj2 instanceof java.util.Date) {
            return (T) new Timestamp(((java.util.Date) obj2).getTime());
        }
        if (obj2 instanceof Number) {
            return (T) new Timestamp(((Number) obj2).longValue());
        }
        if (obj2 instanceof String) {
            String str = (String) obj2;
            if (str.length() == 0) {
                return null;
            }
            JSONScanner jSONScanner = new JSONScanner(str);
            try {
                if (jSONScanner.scanISO8601DateIfMatch()) {
                    parseLong = jSONScanner.getCalendar().getTimeInMillis();
                } else {
                    try {
                        T t = (T) new Timestamp(defaultJSONParser.getDateFormat().parse(str).getTime());
                        jSONScanner.close();
                        return t;
                    } catch (ParseException e) {
                        parseLong = Long.parseLong(str);
                    }
                }
                return (T) new Timestamp(parseLong);
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
