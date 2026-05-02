package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/SerialContext.class */
public class SerialContext {
    public final SerialContext parent;
    public final Object object;
    public final Object fieldName;
    public final int features;

    public SerialContext(SerialContext parent, Object object, Object fieldName, int features, int fieldFeatures) {
        this.parent = parent;
        this.object = object;
        this.fieldName = fieldName;
        this.features = features;
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
