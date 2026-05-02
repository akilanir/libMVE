package com.fasterxml.jackson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;

@Target({ElementType.ANNOTATION_TYPE, ElementType.TYPE})
@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonAutoDetect.class */
public @interface JsonAutoDetect {
    Visibility getterVisibility() default Visibility.DEFAULT;

    Visibility isGetterVisibility() default Visibility.DEFAULT;

    Visibility setterVisibility() default Visibility.DEFAULT;

    Visibility creatorVisibility() default Visibility.DEFAULT;

    Visibility fieldVisibility() default Visibility.DEFAULT;

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonAutoDetect$Visibility.class */
    public enum Visibility {
        ANY,
        NON_PRIVATE,
        PROTECTED_AND_PUBLIC,
        PUBLIC_ONLY,
        NONE,
        DEFAULT;

        public boolean isVisible(Member m) {
            switch (this) {
                case ANY:
                    return true;
                case NONE:
                    return false;
                case NON_PRIVATE:
                    return !Modifier.isPrivate(m.getModifiers());
                case PROTECTED_AND_PUBLIC:
                    if (Modifier.isProtected(m.getModifiers())) {
                        return true;
                    }
                    break;
                case PUBLIC_ONLY:
                    break;
                default:
                    return false;
            }
            return Modifier.isPublic(m.getModifiers());
        }
    }
}
