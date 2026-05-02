package org.slf4j.impl;

import org.slf4j.IMarkerFactory;
import org.slf4j.helpers.BasicMarkerFactory;
import org.slf4j.spi.MarkerFactoryBinder;

/* loaded from: logback-android-classic-1.1.1-3.jar:org/slf4j/impl/StaticMarkerBinder.class */
public class StaticMarkerBinder implements MarkerFactoryBinder {
    public static final StaticMarkerBinder SINGLETON = new StaticMarkerBinder();
    final IMarkerFactory markerFactory = new BasicMarkerFactory();

    private StaticMarkerBinder() {
    }

    public IMarkerFactory getMarkerFactory() {
        return this.markerFactory;
    }

    public String getMarkerFactoryClassStr() {
        return BasicMarkerFactory.class.getName();
    }
}
