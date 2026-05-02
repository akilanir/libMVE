package ch.qos.logback.classic.pattern.color;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.pattern.color.ForegroundCompositeConverterBase;

@Deprecated
/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/color/HighlightingCompositeConverter.class */
public class HighlightingCompositeConverter extends ForegroundCompositeConverterBase<ILoggingEvent> {
    /* JADX INFO: Access modifiers changed from: protected */
    public String getForegroundColorCode(ILoggingEvent iLoggingEvent) {
        switch (iLoggingEvent.getLevel().toInt()) {
            case Level.INFO_INT /* 20000 */:
                return "34";
            case Level.WARN_INT /* 30000 */:
                return "31";
            case Level.ERROR_INT /* 40000 */:
                return "1;31";
            default:
                return "39";
        }
    }
}
