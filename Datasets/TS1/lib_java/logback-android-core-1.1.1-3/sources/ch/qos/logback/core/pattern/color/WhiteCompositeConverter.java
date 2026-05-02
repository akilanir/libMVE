package ch.qos.logback.core.pattern.color;

@Deprecated
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/color/WhiteCompositeConverter.class */
public class WhiteCompositeConverter<E> extends ForegroundCompositeConverterBase<E> {
    @Override // ch.qos.logback.core.pattern.color.ForegroundCompositeConverterBase
    protected String getForegroundColorCode(E e) {
        return ANSIConstants.WHITE_FG;
    }
}
