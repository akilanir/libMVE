package javax.annotation.meta;

import java.lang.annotation.Annotation;
import javax.annotation.Nonnull;

/* loaded from: jsr305-2.0.1.jar:javax/annotation/meta/TypeQualifierValidator.class */
public interface TypeQualifierValidator<A extends Annotation> {
    @Nonnull
    When forConstantValue(@Nonnull A a, Object obj);
}
