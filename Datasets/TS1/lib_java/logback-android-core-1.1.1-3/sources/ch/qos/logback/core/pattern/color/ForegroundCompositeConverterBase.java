package ch.qos.logback.core.pattern.color;

import ch.qos.logback.core.pattern.CompositeConverter;

@Deprecated
/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/color/ForegroundCompositeConverterBase.class */
public abstract class ForegroundCompositeConverterBase<E> extends CompositeConverter<E> {
    private static final String SET_DEFAULT_COLOR = "\u001b[0;39m";

    @Override // ch.qos.logback.core.pattern.CompositeConverter
    protected String transform(E e, String str) {
        return ANSIConstants.ESC_START + getForegroundColorCode(e) + ANSIConstants.ESC_END + str + SET_DEFAULT_COLOR;
    }

    protected abstract String getForegroundColorCode(E e);
}
