package ch.qos.logback.classic.net;

import ch.qos.logback.classic.ClassicConstants;
import ch.qos.logback.classic.PatternLayout;
import ch.qos.logback.classic.boolex.OnErrorEvaluator;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.Layout;
import ch.qos.logback.core.boolex.EventEvaluator;
import ch.qos.logback.core.helpers.CyclicBuffer;
import ch.qos.logback.core.net.SMTPAppenderBase;
import org.slf4j.Marker;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/net/SMTPAppender.class */
public class SMTPAppender extends SMTPAppenderBase<ILoggingEvent> {
    static final String DEFAULT_SUBJECT_PATTERN = "%logger{20} - %m";
    private boolean includeCallerData = false;

    public SMTPAppender() {
    }

    public void start() {
        if (this.eventEvaluator == null) {
            OnErrorEvaluator onErrorEvaluator = new OnErrorEvaluator();
            onErrorEvaluator.setContext(getContext());
            onErrorEvaluator.setName("onError");
            onErrorEvaluator.start();
            this.eventEvaluator = onErrorEvaluator;
        }
        super.start();
    }

    public SMTPAppender(EventEvaluator<ILoggingEvent> eventEvaluator) {
        this.eventEvaluator = eventEvaluator;
    }

    protected void subAppend(CyclicBuffer<ILoggingEvent> cyclicBuffer, ILoggingEvent iLoggingEvent) {
        if (this.includeCallerData) {
            iLoggingEvent.getCallerData();
        }
        iLoggingEvent.prepareForDeferredProcessing();
        cyclicBuffer.add(iLoggingEvent);
    }

    protected void fillBuffer(CyclicBuffer<ILoggingEvent> cyclicBuffer, StringBuffer stringBuffer) {
        int length = cyclicBuffer.length();
        for (int i = 0; i < length; i++) {
            stringBuffer.append(this.layout.doLayout((ILoggingEvent) cyclicBuffer.get()));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean eventMarksEndOfLife(ILoggingEvent iLoggingEvent) {
        Marker marker = iLoggingEvent.getMarker();
        if (marker == null) {
            return false;
        }
        return marker.contains(ClassicConstants.FINALIZE_SESSION_MARKER);
    }

    protected Layout<ILoggingEvent> makeSubjectLayout(String str) {
        if (str == null) {
            str = DEFAULT_SUBJECT_PATTERN;
        }
        PatternLayout patternLayout = new PatternLayout();
        patternLayout.setContext(getContext());
        patternLayout.setPattern(str);
        patternLayout.setPostCompileProcessor(null);
        patternLayout.start();
        return patternLayout;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: makeNewToPatternLayout, reason: merged with bridge method [inline-methods] */
    public PatternLayout m8makeNewToPatternLayout(String str) {
        PatternLayout patternLayout = new PatternLayout();
        patternLayout.setPattern(str + "%nopex");
        return patternLayout;
    }

    public boolean isIncludeCallerData() {
        return this.includeCallerData;
    }

    public void setIncludeCallerData(boolean z) {
        this.includeCallerData = z;
    }

    protected /* bridge */ /* synthetic */ void subAppend(CyclicBuffer cyclicBuffer, Object obj) {
        subAppend((CyclicBuffer<ILoggingEvent>) cyclicBuffer, (ILoggingEvent) obj);
    }
}
