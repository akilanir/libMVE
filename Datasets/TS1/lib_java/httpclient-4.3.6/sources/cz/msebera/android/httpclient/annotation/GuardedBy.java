package cz.msebera.android.httpclient.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD, ElementType.METHOD})
@Documented
@Retention(RetentionPolicy.CLASS)
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/annotation/GuardedBy.class */
public @interface GuardedBy {
    String value();
}
