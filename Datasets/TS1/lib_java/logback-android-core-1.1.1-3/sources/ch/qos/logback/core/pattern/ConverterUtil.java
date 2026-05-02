package ch.qos.logback.core.pattern;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.spi.ContextAware;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/ConverterUtil.class */
public class ConverterUtil {
    public static <E> void startConverters(Converter<E> converter) {
        Converter<E> converter2 = converter;
        while (true) {
            Converter<E> converter3 = converter2;
            if (converter3 == null) {
                return;
            }
            if (converter3 instanceof CompositeConverter) {
                CompositeConverter compositeConverter = (CompositeConverter) converter3;
                startConverters(compositeConverter.childConverter);
                compositeConverter.start();
            } else if (converter3 instanceof DynamicConverter) {
                ((DynamicConverter) converter3).start();
            }
            converter2 = converter3.getNext();
        }
    }

    public static <E> Converter<E> findTail(Converter<E> converter) {
        Converter<E> converter2;
        Converter<E> converter3 = converter;
        while (true) {
            converter2 = converter3;
            if (converter2 == null) {
                break;
            }
            Converter<E> next = converter2.getNext();
            if (next == null) {
                break;
            }
            converter3 = next;
        }
        return converter2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <E> void setContextForConverters(Context context, Converter<E> converter) {
        Converter<E> converter2 = converter;
        while (true) {
            Converter converter3 = converter2;
            if (converter3 == 0) {
                return;
            }
            if (converter3 instanceof ContextAware) {
                ((ContextAware) converter3).setContext(context);
            }
            converter2 = converter3.getNext();
        }
    }
}
