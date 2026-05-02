package ch.qos.logback.classic.net;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.net.AbstractSSLSocketAppender;
import ch.qos.logback.core.spi.PreSerializationTransformer;
import java.net.InetAddress;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SSLSocketAppender.class */
public class SSLSocketAppender extends AbstractSSLSocketAppender<ILoggingEvent> {
    private final PreSerializationTransformer<ILoggingEvent> pst;
    private boolean includeCallerData;

    public SSLSocketAppender() {
        this.pst = new LoggingEventPreSerializationTransformer();
    }

    @Deprecated
    public SSLSocketAppender(String str, int i) {
        super(str, i);
        this.pst = new LoggingEventPreSerializationTransformer();
    }

    @Deprecated
    public SSLSocketAppender(InetAddress inetAddress, int i) {
        super(inetAddress.getHostAddress(), i);
        this.pst = new LoggingEventPreSerializationTransformer();
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
        return this.pst;
    }
}
