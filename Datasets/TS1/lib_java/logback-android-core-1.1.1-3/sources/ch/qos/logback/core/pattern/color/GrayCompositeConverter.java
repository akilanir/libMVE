package ch.qos.logback.core.pattern.color;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/color/GrayCompositeConverter.class */
public class GrayCompositeConverter<E> extends ForegroundCompositeConverterBase<E> {
    @Override // ch.qos.logback.core.pattern.color.ForegroundCompositeConverterBase
    protected String getForegroundColorCode(E e) {
        return "1;30";
    }
}
