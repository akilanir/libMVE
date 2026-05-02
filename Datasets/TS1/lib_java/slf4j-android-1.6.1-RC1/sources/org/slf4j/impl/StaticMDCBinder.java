package org.slf4j.impl;

import org.slf4j.helpers.NOPMDCAdapter;
import org.slf4j.spi.MDCAdapter;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/impl/StaticMDCBinder.class */
public class StaticMDCBinder {
    public static final StaticMDCBinder SINGLETON = new StaticMDCBinder();

    private StaticMDCBinder() {
    }

    public MDCAdapter getMDCA() {
        return new NOPMDCAdapter();
    }

    public String getMDCAdapterClassStr() {
        return NOPMDCAdapter.class.getName();
    }
}
