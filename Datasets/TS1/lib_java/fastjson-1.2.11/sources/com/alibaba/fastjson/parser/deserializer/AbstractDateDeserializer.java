package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.JSONScanner;
import com.alibaba.fastjson.util.TypeUtils;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer.class */
public abstract class AbstractDateDeserializer implements ObjectDeserializer {
    protected abstract <T> T cast(DefaultJSONParser defaultJSONParser, Type type, Object obj, Object obj2);

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Object parse;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 2) {
            parse = Long.valueOf(jSONLexer.longValue());
            jSONLexer.nextToken(16);
        } else if (jSONLexer.token() == 4) {
            String stringVal = jSONLexer.stringVal();
            parse = stringVal;
            jSONLexer.nextToken(16);
            if (jSONLexer.isEnabled(Feature.AllowISO8601DateFormat)) {
                JSONScanner jSONScanner = new JSONScanner(stringVal);
                if (jSONScanner.scanISO8601DateIfMatch()) {
                    parse = jSONScanner.getCalendar().getTime();
                }
                jSONScanner.close();
            }
        } else if (jSONLexer.token() == 8) {
            jSONLexer.nextToken();
            parse = null;
        } else if (jSONLexer.token() == 12) {
            jSONLexer.nextToken();
            if (jSONLexer.token() == 4) {
                if (JSON.DEFAULT_TYPE_KEY.equals(jSONLexer.stringVal())) {
                    jSONLexer.nextToken();
                    defaultJSONParser.accept(17);
                    Class<?> loadClass = TypeUtils.loadClass(jSONLexer.stringVal(), defaultJSONParser.getConfig().getDefaultClassLoader());
                    if (loadClass != null) {
                        type = loadClass;
                    }
                    defaultJSONParser.accept(4);
                    defaultJSONParser.accept(16);
                }
                jSONLexer.nextTokenWithColon(2);
                if (jSONLexer.token() == 2) {
                    long longValue = jSONLexer.longValue();
                    jSONLexer.nextToken();
                    parse = Long.valueOf(longValue);
                    defaultJSONParser.accept(13);
                } else {
                    throw new JSONException("syntax error : " + jSONLexer.tokenName());
                }
            } else {
                throw new JSONException("syntax error");
            }
        } else if (defaultJSONParser.getResolveStatus() == 2) {
            defaultJSONParser.setResolveStatus(0);
            defaultJSONParser.accept(16);
            if (jSONLexer.token() == 4) {
                if (!"val".equals(jSONLexer.stringVal())) {
                    throw new JSONException("syntax error");
                }
                jSONLexer.nextToken();
                defaultJSONParser.accept(17);
                parse = defaultJSONParser.parse();
                defaultJSONParser.accept(13);
            } else {
                throw new JSONException("syntax error");
            }
        } else {
            parse = defaultJSONParser.parse();
        }
        return (T) cast(defaultJSONParser, type, obj, parse);
    }
}
