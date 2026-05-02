package com.squareup.okhttp.internal.spdy;

import okio.ByteString;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/spdy/Header.class */
public final class Header {
    public static final ByteString RESPONSE_STATUS = ByteString.encodeUtf8(":status");
    public static final ByteString TARGET_METHOD = ByteString.encodeUtf8(":method");
    public static final ByteString TARGET_PATH = ByteString.encodeUtf8(":path");
    public static final ByteString TARGET_SCHEME = ByteString.encodeUtf8(":scheme");
    public static final ByteString TARGET_AUTHORITY = ByteString.encodeUtf8(":authority");
    public static final ByteString TARGET_HOST = ByteString.encodeUtf8(":host");
    public static final ByteString VERSION = ByteString.encodeUtf8(":version");
    public final ByteString name;
    public final ByteString value;
    final int hpackSize;

    public Header(String name, String value) {
        this(ByteString.encodeUtf8(name), ByteString.encodeUtf8(value));
    }

    public Header(ByteString name, String value) {
        this(name, ByteString.encodeUtf8(value));
    }

    public Header(ByteString name, ByteString value) {
        this.name = name;
        this.value = value;
        this.hpackSize = 32 + name.size() + value.size();
    }

    public boolean equals(Object other) {
        if (other instanceof Header) {
            Header that = (Header) other;
            return this.name.equals(that.name) && this.value.equals(that.value);
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + this.name.hashCode();
        return (31 * result) + this.value.hashCode();
    }

    public String toString() {
        return String.format("%s: %s", this.name.utf8(), this.value.utf8());
    }
}
