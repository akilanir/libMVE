package com.fasterxml.jackson.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Locale;
import java.util.TimeZone;

@Target({ElementType.ANNOTATION_TYPE, ElementType.FIELD, ElementType.METHOD, ElementType.PARAMETER, ElementType.TYPE})
@JacksonAnnotation
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonFormat.class */
public @interface JsonFormat {
    public static final String DEFAULT_LOCALE = "##default";
    public static final String DEFAULT_TIMEZONE = "##default";

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonFormat$Feature.class */
    public enum Feature {
        ACCEPT_SINGLE_VALUE_AS_ARRAY,
        WRITE_DATE_TIMESTAMPS_AS_NANOSECONDS,
        WRITE_DATES_WITH_ZONE_ID,
        WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED,
        WRITE_SORTED_MAP_ENTRIES
    }

    String pattern() default "";

    Shape shape() default Shape.ANY;

    String locale() default "##default";

    String timezone() default "##default";

    Feature[] with() default {};

    Feature[] without() default {};

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonFormat$Shape.class */
    public enum Shape {
        ANY,
        SCALAR,
        ARRAY,
        OBJECT,
        NUMBER,
        NUMBER_FLOAT,
        NUMBER_INT,
        STRING,
        BOOLEAN;

        public boolean isNumeric() {
            return this == NUMBER || this == NUMBER_INT || this == NUMBER_FLOAT;
        }

        public boolean isStructured() {
            return this == OBJECT || this == ARRAY;
        }
    }

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonFormat$Features.class */
    public static class Features {
        private final int enabled;
        private final int disabled;
        private static final Features EMPTY = new Features(0, 0);

        private Features(int e, int d) {
            this.enabled = e;
            this.disabled = d;
        }

        public static Features empty() {
            return EMPTY;
        }

        public static Features construct(JsonFormat f) {
            return construct(f.with(), f.without());
        }

        public static Features construct(Feature[] enabled, Feature[] disabled) {
            int e = 0;
            for (Feature f : enabled) {
                e |= 1 << f.ordinal();
            }
            int d = 0;
            for (Feature f2 : disabled) {
                d |= 1 << f2.ordinal();
            }
            return new Features(e, d);
        }

        public Features with(Feature... features) {
            int e = this.enabled;
            for (Feature f : features) {
                e |= 1 << f.ordinal();
            }
            return e == this.enabled ? this : new Features(e, this.disabled);
        }

        public Features without(Feature... features) {
            int d = this.disabled;
            for (Feature f : features) {
                d |= 1 << f.ordinal();
            }
            return d == this.disabled ? this : new Features(this.enabled, d);
        }

        public Boolean get(Feature f) {
            int mask = 1 << f.ordinal();
            if ((this.disabled & mask) != 0) {
                return Boolean.FALSE;
            }
            if ((this.enabled & mask) != 0) {
                return Boolean.TRUE;
            }
            return null;
        }
    }

    /* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/JsonFormat$Value.class */
    public static class Value implements JacksonAnnotationValue<JsonFormat> {
        private final String pattern;
        private final Shape shape;
        private final Locale locale;
        private final String timezoneStr;
        private final Features features;
        private TimeZone _timezone;

        public Value() {
            this(JsonProperty.USE_DEFAULT_NAME, Shape.ANY, JsonProperty.USE_DEFAULT_NAME, JsonProperty.USE_DEFAULT_NAME, Features.empty());
        }

        public Value(JsonFormat ann) {
            this(ann.pattern(), ann.shape(), ann.locale(), ann.timezone(), Features.construct(ann));
        }

        public Value(String p, Shape sh, String localeStr, String tzStr, Features f) {
            this(p, sh, (localeStr == null || localeStr.length() == 0 || "##default".equals(localeStr)) ? null : new Locale(localeStr), (tzStr == null || tzStr.length() == 0 || "##default".equals(tzStr)) ? null : tzStr, null, f);
        }

        public Value(String p, Shape sh, Locale l, TimeZone tz, Features f) {
            this.pattern = p;
            this.shape = sh == null ? Shape.ANY : sh;
            this.locale = l;
            this._timezone = tz;
            this.timezoneStr = null;
            this.features = f == null ? Features.empty() : f;
        }

        public Value(String p, Shape sh, Locale l, String tzStr, TimeZone tz, Features f) {
            this.pattern = p;
            this.shape = sh == null ? Shape.ANY : sh;
            this.locale = l;
            this._timezone = tz;
            this.timezoneStr = tzStr;
            this.features = f == null ? Features.empty() : f;
        }

        @Deprecated
        public Value(String p, Shape sh, Locale l, TimeZone tz) {
            this(p, sh, l, tz, Features.empty());
        }

        @Deprecated
        public Value(String p, Shape sh, String localeStr, String tzStr) {
            this(p, sh, localeStr, tzStr, Features.empty());
        }

        @Deprecated
        public Value(String p, Shape sh, Locale l, String tzStr, TimeZone tz) {
            this(p, sh, l, tzStr, tz, Features.empty());
        }

        public static Value forPattern(String p) {
            return new Value(p, null, null, null, null, Features.empty());
        }

        public Value withPattern(String p) {
            return new Value(p, this.shape, this.locale, this.timezoneStr, this._timezone, this.features);
        }

        public Value withShape(Shape s) {
            return new Value(this.pattern, s, this.locale, this.timezoneStr, this._timezone, this.features);
        }

        public Value withLocale(Locale l) {
            return new Value(this.pattern, this.shape, l, this.timezoneStr, this._timezone, this.features);
        }

        public Value withTimeZone(TimeZone tz) {
            return new Value(this.pattern, this.shape, this.locale, null, tz, this.features);
        }

        public Value withFeature(Feature f) {
            Features newFeats = this.features.with(f);
            return newFeats == this.features ? this : new Value(this.pattern, this.shape, this.locale, this.timezoneStr, this._timezone, newFeats);
        }

        public Value withoutFeature(Feature f) {
            Features newFeats = this.features.without(f);
            return newFeats == this.features ? this : new Value(this.pattern, this.shape, this.locale, this.timezoneStr, this._timezone, newFeats);
        }

        @Override // com.fasterxml.jackson.annotation.JacksonAnnotationValue
        public Class<JsonFormat> valueFor() {
            return JsonFormat.class;
        }

        public String getPattern() {
            return this.pattern;
        }

        public Shape getShape() {
            return this.shape;
        }

        public Locale getLocale() {
            return this.locale;
        }

        public String timeZoneAsString() {
            if (this._timezone != null) {
                return this._timezone.getID();
            }
            return this.timezoneStr;
        }

        public TimeZone getTimeZone() {
            TimeZone tz = this._timezone;
            if (tz == null) {
                if (this.timezoneStr == null) {
                    return null;
                }
                tz = TimeZone.getTimeZone(this.timezoneStr);
                this._timezone = tz;
            }
            return tz;
        }

        public boolean hasShape() {
            return this.shape != Shape.ANY;
        }

        public boolean hasPattern() {
            return this.pattern != null && this.pattern.length() > 0;
        }

        public boolean hasLocale() {
            return this.locale != null;
        }

        public boolean hasTimeZone() {
            return (this._timezone == null && (this.timezoneStr == null || this.timezoneStr.isEmpty())) ? false : true;
        }

        public Boolean getFeature(Feature f) {
            return this.features.get(f);
        }
    }
}
