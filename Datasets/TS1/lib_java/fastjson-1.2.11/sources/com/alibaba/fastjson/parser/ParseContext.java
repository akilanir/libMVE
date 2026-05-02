package com.alibaba.fastjson.parser;

import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/ParseContext.class */
public class ParseContext {
    public Object object;
    public final ParseContext parent;
    public final Object fieldName;
    public Type type;

    public ParseContext(ParseContext parent, Object object, Object fieldName) {
        this.parent = parent;
        this.object = object;
        this.fieldName = fieldName;
    }

    public String toString() {
        if (this.parent == null) {
            return "$";
        }
        if (this.fieldName instanceof Integer) {
            return this.parent.toString() + "[" + this.fieldName + "]";
        }
        return this.parent.toString() + "." + this.fieldName;
    }
}
