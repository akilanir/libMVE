package ch.qos.logback.core.spi;

import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/PropertyContainer.class */
public interface PropertyContainer {
    String getProperty(String str);

    Map<String, String> getCopyOfPropertyMap();
}
