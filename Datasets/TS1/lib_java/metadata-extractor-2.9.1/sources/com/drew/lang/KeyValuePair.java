package com.drew.lang;

import com.drew.lang.annotations.NotNull;

/* loaded from: metadata-extractor-2.9.1.jar:com/drew/lang/KeyValuePair.class */
public class KeyValuePair {
    private final String _key;
    private final String _value;

    public KeyValuePair(@NotNull String key, @NotNull String value) {
        this._key = key;
        this._value = value;
    }

    @NotNull
    public String getKey() {
        return this._key;
    }

    @NotNull
    public String getValue() {
        return this._value;
    }
}
