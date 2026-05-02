package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/HttpsClient.class */
public @interface HttpsClient {
    public static final String DEFAULT_PASSWD = "changeit";

    int trustStore() default -1;

    String trustStoreResName() default "";

    String trustStorePwd() default "changeit";

    int keyStore() default -1;

    String keyStoreResName() default "";

    String keyStorePwd() default "changeit";

    boolean allowAllHostnames() default true;
}
