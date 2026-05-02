package ch.qos.logback.core.pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/CompositeConverter.class */
public abstract class CompositeConverter<E> extends DynamicConverter<E> {
    Converter<E> childConverter;

    @Override // ch.qos.logback.core.pattern.Converter
    public String convert(E e) {
        StringBuilder sb = new StringBuilder();
        Converter<E> converter = this.childConverter;
        while (true) {
            Converter<E> converter2 = converter;
            if (converter2 == null) {
                return transform(e, sb.toString());
            }
            converter2.write(sb, e);
            converter = converter2.next;
        }
    }

    protected abstract String transform(E e, String str);

    public Converter<E> getChildConverter() {
        return this.childConverter;
    }

    public void setChildConverter(Converter<E> converter) {
        this.childConverter = converter;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CompositeConverter<");
        if (this.formattingInfo != null) {
            sb.append(this.formattingInfo);
        }
        if (this.childConverter != null) {
            sb.append(", children: ").append(this.childConverter);
        }
        sb.append(">");
        return sb.toString();
    }
}
