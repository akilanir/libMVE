package com.alibaba.fastjson;

import java.io.IOException;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/JSONStreamAware.class */
public interface JSONStreamAware {
    void writeJSONString(Appendable appendable) throws IOException;
}
