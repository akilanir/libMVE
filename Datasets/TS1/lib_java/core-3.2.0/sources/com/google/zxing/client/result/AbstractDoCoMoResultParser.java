package com.google.zxing.client.result;

/* loaded from: core-3.2.0.jar:com/google/zxing/client/result/AbstractDoCoMoResultParser.class */
abstract class AbstractDoCoMoResultParser extends ResultParser {
    AbstractDoCoMoResultParser() {
    }

    static String[] matchDoCoMoPrefixedField(String prefix, String rawText, boolean trim) {
        return matchPrefixedField(prefix, rawText, ';', trim);
    }

    static String matchSingleDoCoMoPrefixedField(String prefix, String rawText, boolean trim) {
        return matchSinglePrefixedField(prefix, rawText, ';', trim);
    }
}
