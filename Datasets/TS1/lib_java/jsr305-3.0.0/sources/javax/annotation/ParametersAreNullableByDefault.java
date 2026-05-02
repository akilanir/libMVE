package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifierDefault;

@TypeQualifierDefault({ElementType.PARAMETER})
@Nullable
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-3.0.0.jar:javax/annotation/ParametersAreNullableByDefault.class */
public @interface ParametersAreNullableByDefault {
}
