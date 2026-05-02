package com.mongodb.util;

import java.util.TreeMap;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/OptionMap.class */
public class OptionMap extends TreeMap<String, String> {
    private static final long serialVersionUID = -4415279469780082174L;

    public int getInt(String name, int def) {
        return StringParseUtil.parseIfInt(get(name), def);
    }
}
