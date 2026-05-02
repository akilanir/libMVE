package ch.qos.logback.core.pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/IdentityCompositeConverter.class */
public class IdentityCompositeConverter<E> extends CompositeConverter<E> {
    @Override // ch.qos.logback.core.pattern.CompositeConverter
    protected String transform(E e, String str) {
        return str;
    }
}
