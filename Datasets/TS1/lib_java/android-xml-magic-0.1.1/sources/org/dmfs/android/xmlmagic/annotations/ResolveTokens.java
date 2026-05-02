package org.dmfs.android.xmlmagic.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/annotations/ResolveTokens.class */
public @interface ResolveTokens {
    boolean value() default true;
}
