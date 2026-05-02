package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.spi.StackTraceElementProxy;
import ch.qos.logback.classic.spi.ThrowableProxyUtil;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/ExtendedThrowableProxyConverter.class */
public class ExtendedThrowableProxyConverter extends ThrowableProxyConverter {
    @Override // ch.qos.logback.classic.pattern.ThrowableProxyConverter
    protected void extraData(StringBuilder sb, StackTraceElementProxy stackTraceElementProxy) {
        ThrowableProxyUtil.subjoinPackagingData(sb, stackTraceElementProxy);
    }

    protected void prepareLoggingEvent(ILoggingEvent iLoggingEvent) {
    }
}
