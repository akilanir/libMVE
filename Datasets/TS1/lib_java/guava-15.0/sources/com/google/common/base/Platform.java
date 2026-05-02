package com.google.common.base;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible(emulated = true)
/* loaded from: guava-15.0.jar:com/google/common/base/Platform.class */
final class Platform {
    private static final ThreadLocal<char[]> DEST_TL = new ThreadLocal<char[]>() { // from class: com.google.common.base.Platform.1
        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.lang.ThreadLocal
        public char[] initialValue() {
            return new char[1024];
        }
    };

    private Platform() {
    }

    static char[] charBufferFromThreadLocal() {
        return DEST_TL.get();
    }

    static long systemNanoTime() {
        return System.nanoTime();
    }

    static CharMatcher precomputeCharMatcher(CharMatcher matcher) {
        return matcher.precomputedInternal();
    }
}
