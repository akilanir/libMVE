package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/EnumDeserializer.class */
public class EnumDeserializer implements ObjectDeserializer {
    private final Class<?> enumClass;
    protected final Enum[] values;

    public EnumDeserializer(Class<?> enumClass) {
        this.enumClass = enumClass;
        this.values = (Enum[]) enumClass.getEnumConstants();
    }

    public Enum<?> valueOf(int ordinal) {
        return this.values[ordinal];
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        try {
            JSONLexer jSONLexer = defaultJSONParser.lexer;
            int i = jSONLexer.token();
            if (i == 2) {
                int intValue = jSONLexer.intValue();
                jSONLexer.nextToken(16);
                if (intValue < 0 || intValue > this.values.length) {
                    throw new JSONException("parse enum " + this.enumClass.getName() + " error, value : " + intValue);
                }
                return (T) this.values[intValue];
            }
            if (i == 4) {
                String stringVal = jSONLexer.stringVal();
                jSONLexer.nextToken(16);
                if (stringVal.length() == 0) {
                    return null;
                }
                return (T) Enum.valueOf(this.enumClass, stringVal);
            }
            if (i == 8) {
                jSONLexer.nextToken(16);
                return null;
            }
            throw new JSONException("parse enum " + this.enumClass.getName() + " error, value : " + defaultJSONParser.parse());
        } catch (JSONException e) {
            throw e;
        } catch (Exception e2) {
            throw new JSONException(e2.getMessage(), e2);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
