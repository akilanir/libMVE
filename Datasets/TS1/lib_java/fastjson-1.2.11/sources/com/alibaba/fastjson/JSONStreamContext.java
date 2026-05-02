package com.alibaba.fastjson;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/JSONStreamContext.class */
class JSONStreamContext {
    static final int StartObject = 1001;
    static final int PropertyKey = 1002;
    static final int PropertyValue = 1003;
    static final int StartArray = 1004;
    static final int ArrayValue = 1005;
    protected final JSONStreamContext parent;
    protected int state;

    public JSONStreamContext(JSONStreamContext parent, int state) {
        this.parent = parent;
        this.state = state;
    }
}
