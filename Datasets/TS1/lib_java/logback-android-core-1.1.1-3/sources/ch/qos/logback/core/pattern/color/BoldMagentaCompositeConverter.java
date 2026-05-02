package ch.qos.logback.core.pattern.color;

@Deprecated
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/color/BoldMagentaCompositeConverter.class */
public class BoldMagentaCompositeConverter<E> extends ForegroundCompositeConverterBase<E> {
    @Override // ch.qos.logback.core.pattern.color.ForegroundCompositeConverterBase
    protected String getForegroundColorCode(E e) {
        return "1;35";
    }
}
