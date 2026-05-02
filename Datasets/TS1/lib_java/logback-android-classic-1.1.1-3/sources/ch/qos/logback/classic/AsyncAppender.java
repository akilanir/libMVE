package ch.qos.logback.classic;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.AsyncAppenderBase;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/AsyncAppender.class */
public class AsyncAppender extends AsyncAppenderBase<ILoggingEvent> {
    boolean includeCallerData = false;

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isDiscardable(ILoggingEvent iLoggingEvent) {
        return iLoggingEvent.getLevel().toInt() <= 20000;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void preprocess(ILoggingEvent iLoggingEvent) {
        iLoggingEvent.prepareForDeferredProcessing();
        if (this.includeCallerData) {
            iLoggingEvent.getCallerData();
        }
    }

    public boolean isIncludeCallerData() {
        return this.includeCallerData;
    }

    public void setIncludeCallerData(boolean z) {
        this.includeCallerData = z;
    }
}
