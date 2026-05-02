package com.fasterxml.jackson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.ANNOTATION_TYPE, ElementType.METHOD, ElementType.FIELD, ElementType.TYPE, ElementType.PARAMETER})
@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonInclude.class */
public @interface JsonInclude {

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonInclude$Include.class */
    public enum Include {
        ALWAYS,
        NON_NULL,
        NON_ABSENT,
        NON_EMPTY,
        NON_DEFAULT,
        USE_DEFAULTS
    }

    Include value() default Include.ALWAYS;

    Include content() default Include.ALWAYS;

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonInclude$Value.class */
    public static class Value implements JacksonAnnotationValue<JsonInclude> {
        protected static final Value EMPTY = new Value(Include.USE_DEFAULTS, Include.USE_DEFAULTS);
        protected final Include valueInclusion;
        protected final Include contentInclusion;

        public Value(JsonInclude src) {
            this(src.value(), src.content());
        }

        protected Value(Include vi, Include ci) {
            this.valueInclusion = vi == null ? Include.USE_DEFAULTS : vi;
            this.contentInclusion = ci == null ? Include.USE_DEFAULTS : ci;
        }

        public Value withOverrides(Value overrides) {
            if (overrides == null) {
                return this;
            }
            return withValueInclusion(overrides.valueInclusion).withContentInclusion(overrides.contentInclusion);
        }

        public static Value empty() {
            return EMPTY;
        }

        public static Value construct(Include valueIncl, Include contentIncl) {
            if (valueIncl == Include.USE_DEFAULTS && contentIncl == Include.USE_DEFAULTS) {
                return EMPTY;
            }
            return new Value(valueIncl, contentIncl);
        }

        public static Value from(JsonInclude src) {
            if (src == null) {
                return null;
            }
            return new Value(src);
        }

        public Value withValueInclusion(Include incl) {
            return incl == this.valueInclusion ? this : new Value(incl, this.contentInclusion);
        }

        public Value withContentInclusion(Include incl) {
            return incl == this.contentInclusion ? this : new Value(this.valueInclusion, incl);
        }

        @Override // com.fasterxml.jackson.annotation.JacksonAnnotationValue
        public Class<JsonInclude> valueFor() {
            return JsonInclude.class;
        }

        public Include getValueInclusion() {
            return this.valueInclusion;
        }

        public Include getContentInclusion() {
            return this.contentInclusion;
        }
    }
}
