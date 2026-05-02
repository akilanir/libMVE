package org.androidannotations.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.CLASS)
/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/WakeLock.class */
public @interface WakeLock {
    public static final String DEFAULT_TAG = "NO_TAG";

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/WakeLock$Flag.class */
    public enum Flag {
        ACQUIRE_CAUSES_WAKEUP,
        ON_AFTER_RELEASE
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/annotations/WakeLock$Level.class */
    public enum Level {
        FULL_WAKE_LOCK,
        PARTIAL_WAKE_LOCK,
        SCREEN_BRIGHT_WAKE_LOCK,
        SCREEN_DIM_WAKE_LOCK
    }

    String tag() default "NO_TAG";

    Level level() default Level.PARTIAL_WAKE_LOCK;

    Flag[] flags() default {};
}
