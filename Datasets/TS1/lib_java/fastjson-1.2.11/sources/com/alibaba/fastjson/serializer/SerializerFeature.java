package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/SerializerFeature.class */
public enum SerializerFeature {
    QuoteFieldNames,
    UseSingleQuotes,
    WriteMapNullValue,
    WriteEnumUsingToString,
    WriteEnumUsingName,
    UseISO8601DateFormat,
    WriteNullListAsEmpty,
    WriteNullStringAsEmpty,
    WriteNullNumberAsZero,
    WriteNullBooleanAsFalse,
    SkipTransientField,
    SortField,
    WriteTabAsSpecial,
    PrettyFormat,
    WriteClassName,
    DisableCircularReferenceDetect,
    WriteSlashAsSpecial,
    BrowserCompatible,
    WriteDateUseDateFormat,
    NotWriteRootClassName,
    DisableCheckSpecialChar,
    BeanToArray,
    WriteNonStringKeyAsString,
    NotWriteDefaultValue,
    BrowserSecure,
    IgnoreNonFieldGetter,
    WriteNonStringValueAsString,
    IgnoreErrorGetter;

    public final int mask = 1 << ordinal();
    public static final SerializerFeature[] EMPTY = new SerializerFeature[0];

    SerializerFeature() {
    }

    public final int getMask() {
        return this.mask;
    }

    public static boolean isEnabled(int features, SerializerFeature feature) {
        return (features & feature.mask) != 0;
    }

    public static boolean isEnabled(int features, int fieaturesB, SerializerFeature feature) {
        int mask = feature.mask;
        return ((features & mask) == 0 && (fieaturesB & mask) == 0) ? false : true;
    }

    public static int config(int features, SerializerFeature feature, boolean state) {
        int features2;
        if (state) {
            features2 = features | feature.mask;
        } else {
            features2 = features & (feature.mask ^ (-1));
        }
        return features2;
    }

    public static int of(SerializerFeature[] features) {
        if (features == null) {
            return 0;
        }
        int value = 0;
        for (SerializerFeature feature : features) {
            value |= feature.mask;
        }
        return value;
    }
}
