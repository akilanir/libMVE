package com.alibaba.fastjson.parser;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/Feature.class */
public enum Feature {
    AutoCloseSource,
    AllowComment,
    AllowUnQuotedFieldNames,
    AllowSingleQuotes,
    InternFieldNames,
    AllowISO8601DateFormat,
    AllowArbitraryCommas,
    UseBigDecimal,
    IgnoreNotMatch,
    SortFeidFastMatch,
    DisableASM,
    DisableCircularReferenceDetect,
    InitStringFieldAsEmpty,
    SupportArrayToBean,
    OrderedField,
    DisableSpecialKeyDetect,
    UseObjectArray;

    public final int mask = 1 << ordinal();

    Feature() {
    }

    public final int getMask() {
        return this.mask;
    }

    public static boolean isEnabled(int features, Feature feature) {
        return (features & feature.mask) != 0;
    }

    public static int config(int features, Feature feature, boolean state) {
        int features2;
        if (state) {
            features2 = features | feature.mask;
        } else {
            features2 = features & (feature.mask ^ (-1));
        }
        return features2;
    }

    public static int of(Feature[] features) {
        if (features == null) {
            return 0;
        }
        int value = 0;
        for (Feature feature : features) {
            value |= feature.mask;
        }
        return value;
    }
}
