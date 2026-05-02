package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.pattern.Converter;
import ch.qos.logback.core.pattern.ConverterUtil;
import ch.qos.logback.core.pattern.PostCompileProcessor;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/EnsureExceptionHandling.class */
public class EnsureExceptionHandling implements PostCompileProcessor<ILoggingEvent> {
    public void process(Converter<ILoggingEvent> converter) {
        if (converter == null) {
            throw new IllegalArgumentException("cannot process empty chain");
        }
        if (chainHandlesThrowable(converter)) {
            return;
        }
        ConverterUtil.findTail(converter).setNext(new ExtendedThrowableProxyConverter());
    }

    public boolean chainHandlesThrowable(Converter converter) {
        Converter converter2 = converter;
        while (true) {
            Converter converter3 = converter2;
            if (converter3 == null) {
                return false;
            }
            if (converter3 instanceof ThrowableHandlingConverter) {
                return true;
            }
            converter2 = converter3.getNext();
        }
    }
}
