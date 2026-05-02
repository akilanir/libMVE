package org.slf4j.impl;

import org.slf4j.IMarkerFactory;
import org.slf4j.helpers.BasicMarkerFactory;
import org.slf4j.spi.MarkerFactoryBinder;

/* loaded from: slf4j-simple-1.6.1.jar:org/slf4j/impl/StaticMarkerBinder.class */
public class StaticMarkerBinder implements MarkerFactoryBinder {
    public static final StaticMarkerBinder SINGLETON = new StaticMarkerBinder();
    final IMarkerFactory markerFactory = new BasicMarkerFactory();
    static Class class$org$slf4j$helpers$BasicMarkerFactory;

    private StaticMarkerBinder() {
    }

    public IMarkerFactory getMarkerFactory() {
        return this.markerFactory;
    }

    public String getMarkerFactoryClassStr() {
        Class cls;
        if (class$org$slf4j$helpers$BasicMarkerFactory == null) {
            cls = class$("org.slf4j.helpers.BasicMarkerFactory");
            class$org$slf4j$helpers$BasicMarkerFactory = cls;
        } else {
            cls = class$org$slf4j$helpers$BasicMarkerFactory;
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
