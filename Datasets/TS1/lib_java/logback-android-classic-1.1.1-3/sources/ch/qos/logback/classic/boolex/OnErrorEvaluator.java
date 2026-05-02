package ch.qos.logback.classic.boolex;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.boolex.EvaluationException;
import ch.qos.logback.core.boolex.EventEvaluatorBase;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/boolex/OnErrorEvaluator.class */
public class OnErrorEvaluator extends EventEvaluatorBase<ILoggingEvent> {
    public boolean evaluate(ILoggingEvent iLoggingEvent) throws NullPointerException, EvaluationException {
        return iLoggingEvent.getLevel().levelInt >= 40000;
    }
}
