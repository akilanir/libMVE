package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;

@GwtCompatible
/* loaded from: guava-18.0.jar:com/google/common/collect/CollectPreconditions.class */
final class CollectPreconditions {
    CollectPreconditions() {
    }

    static void checkEntryNotNull(Object key, Object value) {
        if (key == null) {
            String valueOf = String.valueOf(String.valueOf(value));
            throw new NullPointerException(new StringBuilder(24 + valueOf.length()).append("null key in entry: null=").append(valueOf).toString());
        }
        if (value == null) {
            String valueOf2 = String.valueOf(String.valueOf(key));
            throw new NullPointerException(new StringBuilder(26 + valueOf2.length()).append("null value in entry: ").append(valueOf2).append("=null").toString());
        }
    }

    static int checkNonnegative(int value, String name) {
        if (value < 0) {
            String valueOf = String.valueOf(String.valueOf(name));
            throw new IllegalArgumentException(new StringBuilder(40 + valueOf.length()).append(valueOf).append(" cannot be negative but was: ").append(value).toString());
        }
        return value;
    }

    static void checkRemove(boolean canRemove) {
        Preconditions.checkState(canRemove, "no calls to next() since the last call to remove()");
    }
}
