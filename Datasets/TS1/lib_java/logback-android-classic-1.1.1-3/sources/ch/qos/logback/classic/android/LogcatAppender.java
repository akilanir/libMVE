package ch.qos.logback.classic.android;

import android.util.Log;
import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.PatternLayout;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.AppenderBase;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/android/LogcatAppender.class */
public class LogcatAppender extends AppenderBase<ILoggingEvent> {
    private static final int MAX_TAG_LENGTH = 23;
    private PatternLayoutEncoder encoder = null;
    private PatternLayoutEncoder tagEncoder = null;
    private boolean checkLoggable = false;

    public void start() {
        if (this.encoder == null || this.encoder.getLayout() == null) {
            addError("No layout set for the appender named [" + this.name + "].");
            return;
        }
        if (this.tagEncoder != null) {
            PatternLayout layout = this.tagEncoder.getLayout();
            if (layout == null) {
                addError("No tag layout set for the appender named [" + this.name + "].");
                return;
            } else if (layout instanceof PatternLayout) {
                String pattern = this.tagEncoder.getPattern();
                if (!pattern.contains("%nopex")) {
                    this.tagEncoder.stop();
                    this.tagEncoder.setPattern(pattern + "%nopex");
                    this.tagEncoder.start();
                }
                layout.setPostCompileProcessor(null);
            }
        }
        super.start();
    }

    public void append(ILoggingEvent iLoggingEvent) {
        if (isStarted()) {
            String tag = getTag(iLoggingEvent);
            switch (iLoggingEvent.getLevel().levelInt) {
                case Level.ALL_INT /* -2147483648 */:
                case Level.TRACE_INT /* 5000 */:
                    if (!this.checkLoggable || Log.isLoggable(tag, 2)) {
                        Log.v(tag, this.encoder.getLayout().doLayout(iLoggingEvent));
                        break;
                    }
                    break;
                case Level.DEBUG_INT /* 10000 */:
                    if (!this.checkLoggable || Log.isLoggable(tag, 3)) {
                        Log.d(tag, this.encoder.getLayout().doLayout(iLoggingEvent));
                        break;
                    }
                    break;
                case Level.INFO_INT /* 20000 */:
                    if (!this.checkLoggable || Log.isLoggable(tag, 4)) {
                        Log.i(tag, this.encoder.getLayout().doLayout(iLoggingEvent));
                        break;
                    }
                    break;
                case Level.WARN_INT /* 30000 */:
                    if (!this.checkLoggable || Log.isLoggable(tag, 5)) {
                        Log.w(tag, this.encoder.getLayout().doLayout(iLoggingEvent));
                        break;
                    }
                    break;
                case Level.ERROR_INT /* 40000 */:
                    if (!this.checkLoggable || Log.isLoggable(tag, 6)) {
                        Log.e(tag, this.encoder.getLayout().doLayout(iLoggingEvent));
                        break;
                    }
                    break;
            }
        }
    }

    public PatternLayoutEncoder getEncoder() {
        return this.encoder;
    }

    public void setEncoder(PatternLayoutEncoder patternLayoutEncoder) {
        this.encoder = patternLayoutEncoder;
    }

    public PatternLayoutEncoder getTagEncoder() {
        return this.tagEncoder;
    }

    public void setTagEncoder(PatternLayoutEncoder patternLayoutEncoder) {
        this.tagEncoder = patternLayoutEncoder;
    }

    public void setCheckLoggable(boolean z) {
        this.checkLoggable = z;
    }

    public boolean getCheckLoggable() {
        return this.checkLoggable;
    }

    protected String getTag(ILoggingEvent iLoggingEvent) {
        String doLayout = this.tagEncoder != null ? this.tagEncoder.getLayout().doLayout(iLoggingEvent) : iLoggingEvent.getLoggerName();
        if (this.checkLoggable && doLayout.length() > MAX_TAG_LENGTH) {
            doLayout = doLayout.substring(0, 22) + "*";
        }
        return doLayout;
    }
}
