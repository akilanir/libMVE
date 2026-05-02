package com.google.common.primitives;

import com.google.common.base.Preconditions;
import javax.annotation.CheckForNull;

/* loaded from: guava-15.0.jar:com/google/common/primitives/AndroidInteger.class */
final class AndroidInteger {
    @CheckForNull
    static Integer tryParse(String string) {
        return tryParse(string, 10);
    }

    @CheckForNull
    static Integer tryParse(String string, int radix) {
        Preconditions.checkNotNull(string);
        Preconditions.checkArgument(radix >= 2, "Invalid radix %s, min radix is %s", Integer.valueOf(radix), 2);
        Preconditions.checkArgument(radix <= 36, "Invalid radix %s, max radix is %s", Integer.valueOf(radix), 36);
        int length = string.length();
        int i = 0;
        if (length == 0) {
            return null;
        }
        boolean negative = string.charAt(0) == '-';
        if (negative) {
            i = 0 + 1;
            if (i == length) {
                return null;
            }
        }
        return tryParse(string, i, radix, negative);
    }

    @CheckForNull
    private static Integer tryParse(String string, int offset, int radix, boolean negative) {
        int next;
        int max = Integer.MIN_VALUE / radix;
        int result = 0;
        int length = string.length();
        while (offset < length) {
            int i = offset;
            offset++;
            int digit = Character.digit(string.charAt(i), radix);
            if (digit == -1 || max > result || (next = (result * radix) - digit) > result) {
                return null;
            }
            result = next;
        }
        if (!negative) {
            result = -result;
            if (result < 0) {
                return null;
            }
        }
        if (result > Integer.MAX_VALUE || result < Integer.MIN_VALUE) {
            return null;
        }
        return Integer.valueOf(result);
    }

    private AndroidInteger() {
    }
}
