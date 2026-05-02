package ch.qos.logback.core.pattern.color;

@Deprecated
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/color/BlackCompositeConverter.class */
public class BlackCompositeConverter<E> extends ForegroundCompositeConverterBase<E> {
    @Override // ch.qos.logback.core.pattern.color.ForegroundCompositeConverterBase
    protected String getForegroundColorCode(E e) {
        return ANSIConstants.BLACK_FG;
    }
}
