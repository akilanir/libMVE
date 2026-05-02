package ch.qos.logback.classic.net.server;

import ch.qos.logback.classic.net.LoggingEventPreSerializationTransformer;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.net.server.AbstractServerSocketAppender;
import ch.qos.logback.core.spi.PreSerializationTransformer;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/server/ServerSocketAppender.class */
public class ServerSocketAppender extends AbstractServerSocketAppender<ILoggingEvent> {
    private static final PreSerializationTransformer<ILoggingEvent> pst = new LoggingEventPreSerializationTransformer();
    private boolean includeCallerData;

    /* JADX INFO: Access modifiers changed from: protected */
    public void postProcessEvent(ILoggingEvent iLoggingEvent) {
        if (isIncludeCallerData()) {
            iLoggingEvent.getCallerData();
        }
    }

    protected PreSerializationTransformer<ILoggingEvent> getPST() {
        return pst;
    }

    public boolean isIncludeCallerData() {
        return this.includeCallerData;
    }

    public void setIncludeCallerData(boolean z) {
        this.includeCallerData = z;
    }
}
