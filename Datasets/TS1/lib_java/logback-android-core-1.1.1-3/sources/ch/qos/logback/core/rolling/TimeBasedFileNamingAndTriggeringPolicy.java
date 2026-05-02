package ch.qos.logback.core.rolling;

import ch.qos.logback.core.rolling.helper.ArchiveRemover;
import ch.qos.logback.core.spi.ContextAware;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/rolling/TimeBasedFileNamingAndTriggeringPolicy.class */
public interface TimeBasedFileNamingAndTriggeringPolicy<E> extends TriggeringPolicy<E>, ContextAware {
    void setTimeBasedRollingPolicy(TimeBasedRollingPolicy<E> timeBasedRollingPolicy);

    String getElapsedPeriodsFileName();

    String getCurrentPeriodsFileNameWithoutCompressionSuffix();

    ArchiveRemover getArchiveRemover();

    long getCurrentTime();

    void setCurrentTime(long j);
}
