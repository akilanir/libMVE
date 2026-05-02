package ch.qos.logback.core.sift;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/DefaultDiscriminator.class */
public class DefaultDiscriminator<E> extends AbstractDiscriminator<E> {
    public static final String DEFAULT = "default";

    @Override // ch.qos.logback.core.sift.Discriminator
    public String getDiscriminatingValue(E e) {
        return "default";
    }

    @Override // ch.qos.logback.core.sift.Discriminator
    public String getKey() {
        return "default";
    }
}
