package org.slf4j.spi;

import org.slf4j.IMarkerFactory;

/* loaded from: slf4j-android-1.6.1-RC1.jar:org/slf4j/spi/MarkerFactoryBinder.class */
public interface MarkerFactoryBinder {
    IMarkerFactory getMarkerFactory();

    String getMarkerFactoryClassStr();
}
