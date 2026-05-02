package org.slf4j.impl;

import org.slf4j.helpers.NOPMDCAdapter;
import org.slf4j.spi.MDCAdapter;

/* loaded from: slf4j-simple-1.6.1.jar:org/slf4j/impl/StaticMDCBinder.class */
public class StaticMDCBinder {
    public static final StaticMDCBinder SINGLETON = new StaticMDCBinder();
    static Class class$org$slf4j$helpers$NOPMDCAdapter;

    private StaticMDCBinder() {
    }

    public MDCAdapter getMDCA() {
        return new NOPMDCAdapter();
    }

    public String getMDCAdapterClassStr() {
        Class cls;
        if (class$org$slf4j$helpers$NOPMDCAdapter == null) {
            cls = class$("org.slf4j.helpers.NOPMDCAdapter");
            class$org$slf4j$helpers$NOPMDCAdapter = cls;
        } else {
            cls = class$org$slf4j$helpers$NOPMDCAdapter;
        }
        return cls.getName();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
