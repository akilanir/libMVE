package javax.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifier;
import javax.annotation.meta.TypeQualifierValidator;
import javax.annotation.meta.When;

@TypeQualifier
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jsr305-3.0.0.jar:javax/annotation/Nonnull.class */
public @interface Nonnull {
    When when() default When.ALWAYS;

    /* loaded from: jsr305-3.0.0.jar:javax/annotation/Nonnull$Checker.class */
    public static class Checker implements TypeQualifierValidator<Nonnull> {
        @Override // javax.annotation.meta.TypeQualifierValidator
        public When forConstantValue(Nonnull qualifierqualifierArgument, Object value) {
            if (value == null) {
                return When.NEVER;
            }
            return When.ALWAYS;
        }
    }
}
