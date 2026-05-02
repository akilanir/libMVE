package nl.qbusict.cupboard.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/annotation/CompositeIndex.class */
public @interface CompositeIndex {
    public static final boolean DEFAULT_ASCENDING = true;
    public static final int DEFAULT_ORDER = 0;
    public static final String DEFAULT_INDEX_NAME = "";

    boolean ascending() default true;

    int order() default 0;

    String indexName();
}
