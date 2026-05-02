package ch.qos.logback.classic.net;

import ch.qos.logback.classic.PatternLayout;
import ch.qos.logback.classic.pattern.SyslogStartConverter;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.classic.spi.IThrowableProxy;
import ch.qos.logback.classic.spi.StackTraceElementProxy;
import ch.qos.logback.classic.util.LevelToSyslogSeverity;
import ch.qos.logback.core.Layout;
import ch.qos.logback.core.net.SyslogAppenderBase;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SyslogAppender.class */
public class SyslogAppender extends SyslogAppenderBase<ILoggingEvent> {
    public static final String DEFAULT_SUFFIX_PATTERN = "[%thread] %logger %msg";
    public static final String DEFAULT_STACKTRACE_PATTERN = "\t";
    PatternLayout stackTraceLayout = new PatternLayout();
    String stackTracePattern = DEFAULT_STACKTRACE_PATTERN;
    boolean throwableExcluded = false;

    public void start() {
        super.start();
        setupStackTraceLayout();
    }

    String getPrefixPattern() {
        return "%syslogStart{" + getFacility() + "}%nopex{}";
    }

    public int getSeverityForEvent(Object obj) {
        return LevelToSyslogSeverity.convert((ILoggingEvent) obj);
    }

    protected void postProcess(Object obj, OutputStream outputStream) {
        if (this.throwableExcluded) {
            return;
        }
        ILoggingEvent iLoggingEvent = (ILoggingEvent) obj;
        IThrowableProxy throwableProxy = iLoggingEvent.getThrowableProxy();
        if (throwableProxy == null) {
            return;
        }
        String doLayout = this.stackTraceLayout.doLayout(iLoggingEvent);
        boolean z = true;
        while (throwableProxy != null) {
            StackTraceElementProxy[] stackTraceElementProxyArray = throwableProxy.getStackTraceElementProxyArray();
            try {
                handleThrowableFirstLine(outputStream, throwableProxy, doLayout, z);
                z = false;
                for (StackTraceElementProxy stackTraceElementProxy : stackTraceElementProxyArray) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(doLayout).append(stackTraceElementProxy);
                    outputStream.write(sb.toString().getBytes());
                    outputStream.flush();
                }
                throwableProxy = throwableProxy.getCause();
            } catch (IOException e) {
                return;
            }
        }
    }

    private void handleThrowableFirstLine(OutputStream outputStream, IThrowableProxy iThrowableProxy, String str, boolean z) throws IOException {
        StringBuilder append = new StringBuilder().append(str);
        if (!z) {
            append.append("Caused by: ");
        }
        append.append(iThrowableProxy.getClassName()).append(": ").append(iThrowableProxy.getMessage());
        outputStream.write(append.toString().getBytes());
        outputStream.flush();
    }

    boolean stackTraceHeaderLine(StringBuilder sb, boolean z) {
        return false;
    }

    public Layout<ILoggingEvent> buildLayout() {
        PatternLayout patternLayout = new PatternLayout();
        patternLayout.getInstanceConverterMap().put("syslogStart", SyslogStartConverter.class.getName());
        if (this.suffixPattern == null) {
            this.suffixPattern = DEFAULT_SUFFIX_PATTERN;
        }
        patternLayout.setPattern(getPrefixPattern() + this.suffixPattern);
        patternLayout.setContext(getContext());
        patternLayout.start();
        return patternLayout;
    }

    private void setupStackTraceLayout() {
        this.stackTraceLayout.getInstanceConverterMap().put("syslogStart", SyslogStartConverter.class.getName());
        this.stackTraceLayout.setPattern(getPrefixPattern() + this.stackTracePattern);
        this.stackTraceLayout.setContext(getContext());
        this.stackTraceLayout.start();
    }

    public boolean isThrowableExcluded() {
        return this.throwableExcluded;
    }

    public void setThrowableExcluded(boolean z) {
        this.throwableExcluded = z;
    }

    public String getStackTracePattern() {
        return this.stackTracePattern;
    }

    public void setStackTracePattern(String str) {
        this.stackTracePattern = str;
    }
}
