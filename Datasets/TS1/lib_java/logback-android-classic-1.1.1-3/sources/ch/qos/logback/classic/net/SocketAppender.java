package ch.qos.logback.classic.net;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.net.AbstractSocketAppender;
import ch.qos.logback.core.spi.PreSerializationTransformer;
import java.net.InetAddress;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SocketAppender.class */
public class SocketAppender extends AbstractSocketAppender<ILoggingEvent> {
    private static final PreSerializationTransformer<ILoggingEvent> pst = new LoggingEventPreSerializationTransformer();
    private boolean includeCallerData;

    public SocketAppender() {
        this.includeCallerData = false;
    }

    @Deprecated
    public SocketAppender(String str, int i) {
        super(str, i);
        this.includeCallerData = false;
    }

    @Deprecated
    public SocketAppender(InetAddress inetAddress, int i) {
        super(inetAddress.getHostAddress(), i);
        this.includeCallerData = false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void postProcessEvent(ILoggingEvent iLoggingEvent) {
        if (this.includeCallerData) {
            iLoggingEvent.getCallerData();
        }
    }

    public void setIncludeCallerData(boolean z) {
        this.includeCallerData = z;
    }

    public PreSerializationTransformer<ILoggingEvent> getPST() {
        return pst;
    }
}
