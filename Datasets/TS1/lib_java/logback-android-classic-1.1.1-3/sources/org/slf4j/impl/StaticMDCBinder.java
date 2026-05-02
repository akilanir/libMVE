package org.slf4j.impl;

import ch.qos.logback.classic.util.LogbackMDCAdapter;
import org.slf4j.spi.MDCAdapter;

/* loaded from: logback-android-classic-1.1.1-3.jar:org/slf4j/impl/StaticMDCBinder.class */
public class StaticMDCBinder {
    public static final StaticMDCBinder SINGLETON = new StaticMDCBinder();

    private StaticMDCBinder() {
    }

    public MDCAdapter getMDCA() {
        return new LogbackMDCAdapter();
    }

    public String getMDCAdapterClassStr() {
        return LogbackMDCAdapter.class.getName();
    }
}
