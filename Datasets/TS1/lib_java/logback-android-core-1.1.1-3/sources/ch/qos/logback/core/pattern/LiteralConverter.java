package ch.qos.logback.core.pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/LiteralConverter.class */
public final class LiteralConverter<E> extends Converter<E> {
    String literal;

    public LiteralConverter(String str) {
        this.literal = str;
    }

    @Override // ch.qos.logback.core.pattern.Converter
    public String convert(E e) {
        return this.literal;
    }
}
