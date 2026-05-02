package ch.qos.logback.classic.spi;

import ch.qos.logback.classic.LoggerContext;
import java.io.Serializable;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/LoggerRemoteView.class */
public class LoggerRemoteView implements Serializable {
    private static final long serialVersionUID = 5028223666108713696L;
    final LoggerContextVO loggerContextView;
    final String name;
    static final /* synthetic */ boolean $assertionsDisabled;

    public LoggerRemoteView(String str, LoggerContext loggerContext) {
        this.name = str;
        if (!$assertionsDisabled && loggerContext.getLoggerContextRemoteView() == null) {
            throw new AssertionError();
        }
        this.loggerContextView = loggerContext.getLoggerContextRemoteView();
    }

    public LoggerContextVO getLoggerContextView() {
        return this.loggerContextView;
    }

    public String getName() {
        return this.name;
    }

    static {
        $assertionsDisabled = !LoggerRemoteView.class.desiredAssertionStatus();
    }
}
