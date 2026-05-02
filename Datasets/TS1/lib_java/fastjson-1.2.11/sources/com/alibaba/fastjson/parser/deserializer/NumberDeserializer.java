package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.util.TypeUtils;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/NumberDeserializer.class */
public class NumberDeserializer implements ObjectDeserializer {
    public static final NumberDeserializer instance = new NumberDeserializer();

    /* JADX WARN: Type inference failed for: r0v33, types: [T, java.math.BigDecimal] */
    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 2) {
            if (type == Double.TYPE || type == Double.class) {
                String numberString = jSONLexer.numberString();
                jSONLexer.nextToken(16);
                return (T) Double.valueOf(Double.parseDouble(numberString));
            }
            long longValue = jSONLexer.longValue();
            jSONLexer.nextToken(16);
            if (type == Short.TYPE || type == Short.class) {
                return (T) Short.valueOf((short) longValue);
            }
            if (type == Byte.TYPE || type == Byte.class) {
                return (T) Byte.valueOf((byte) longValue);
            }
            if (longValue >= -2147483648L && longValue <= 2147483647L) {
                return (T) Integer.valueOf((int) longValue);
            }
            return (T) Long.valueOf(longValue);
        }
        if (jSONLexer.token() == 3) {
            if (type == Double.TYPE || type == Double.class) {
                String numberString2 = jSONLexer.numberString();
                jSONLexer.nextToken(16);
                return (T) Double.valueOf(Double.parseDouble(numberString2));
            }
            ?? r0 = (T) jSONLexer.decimalValue();
            jSONLexer.nextToken(16);
            if (type == Short.TYPE || type == Short.class) {
                return (T) Short.valueOf(r0.shortValue());
            }
            if (type == Byte.TYPE || type == Byte.class) {
                return (T) Byte.valueOf(r0.byteValue());
            }
            return r0;
        }
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        if (type == Double.TYPE || type == Double.class) {
            return (T) TypeUtils.castToDouble(parse);
        }
        if (type == Short.TYPE || type == Short.class) {
            return (T) TypeUtils.castToShort(parse);
        }
        if (type == Byte.TYPE || type == Byte.class) {
            return (T) TypeUtils.castToByte(parse);
        }
        return (T) TypeUtils.castToBigDecimal(parse);
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
