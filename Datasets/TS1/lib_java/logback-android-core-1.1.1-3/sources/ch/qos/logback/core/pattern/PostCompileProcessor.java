package ch.qos.logback.core.pattern;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/PostCompileProcessor.class */
public interface PostCompileProcessor<E> {
    void process(Converter<E> converter);
}
