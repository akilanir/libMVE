package org.slf4j.impl;

import org.slf4j.IMarkerFactory;
import org.slf4j.helpers.BasicMarkerFactory;
import org.slf4j.spi.MarkerFactoryBinder;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/impl/StaticMarkerBinder.class */
public class StaticMarkerBinder implements MarkerFactoryBinder {
    public static final StaticMarkerBinder SINGLETON = new StaticMarkerBinder();
    private final IMarkerFactory markerFactory = new BasicMarkerFactory();

    private StaticMarkerBinder() {
    }

    @Override // org.slf4j.spi.MarkerFactoryBinder
    public IMarkerFactory getMarkerFactory() {
        return this.markerFactory;
    }

    @Override // org.slf4j.spi.MarkerFactoryBinder
    public String getMarkerFactoryClassStr() {
        return BasicMarkerFactory.class.getName();
    }
}
