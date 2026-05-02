package com.googlecode.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/annotations/HttpsClient.class */
public @interface HttpsClient {
    public static final String DEFAULT_PASSWD = "changeit";

    int trustStore() default -1;

    String trustStorePwd() default "changeit";

    int keyStore() default -1;

    String keyStorePwd() default "changeit";

    boolean allowAllHostnames() default true;
}
