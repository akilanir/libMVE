package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifierDefault;

@TypeQualifierDefault({ElementType.PARAMETER})
@Nonnull
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-2.0.1.jar:javax/annotation/ParametersAreNonnullByDefault.class */
public @interface ParametersAreNonnullByDefault {
}
