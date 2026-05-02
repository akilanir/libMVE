package com.google.common.hash;

import com.google.common.annotations.Beta;

@Beta
@Deprecated
/* loaded from: guava-15.0.jar:com/google/common/hash/HashCodes.class */
public final class HashCodes {
    private HashCodes() {
    }

    @Deprecated
    public static HashCode fromInt(int hash) {
        return HashCode.fromInt(hash);
    }

    @Deprecated
    public static HashCode fromLong(long hash) {
        return HashCode.fromLong(hash);
    }

    @Deprecated
    public static HashCode fromBytes(byte[] bytes) {
        return HashCode.fromBytes(bytes);
    }
}
