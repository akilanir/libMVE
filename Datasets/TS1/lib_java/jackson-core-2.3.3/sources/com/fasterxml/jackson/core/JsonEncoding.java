package com.fasterxml.jackson.core;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/JsonEncoding.class */
public enum JsonEncoding {
    UTF8("UTF-8", false, 8),
    UTF16_BE("UTF-16BE", true, 16),
    UTF16_LE("UTF-16LE", false, 16),
    UTF32_BE("UTF-32BE", true, 32),
    UTF32_LE("UTF-32LE", false, 32);

    protected final String _javaName;
    protected final boolean _bigEndian;
    protected final int _bits;

    JsonEncoding(String str, boolean z, int i) {
        this._javaName = str;
        this._bigEndian = z;
        this._bits = i;
    }

    public String getJavaName() {
        return this._javaName;
    }

    public boolean isBigEndian() {
        return this._bigEndian;
    }

    public int bits() {
        return this._bits;
    }
}
