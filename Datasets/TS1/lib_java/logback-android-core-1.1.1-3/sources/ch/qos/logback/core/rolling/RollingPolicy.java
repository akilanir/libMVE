package ch.qos.logback.core.rolling;

import ch.qos.logback.core.FileAppender;
import ch.qos.logback.core.rolling.helper.CompressionMode;
import ch.qos.logback.core.spi.LifeCycle;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/RollingPolicy.class */
public interface RollingPolicy extends LifeCycle {
    void rollover() throws RolloverFailure;

    String getActiveFileName();

    CompressionMode getCompressionMode();

    void setParent(FileAppender fileAppender);
}
