package com.fasterxml.jackson.core.io;

/* loaded from: jackson-core-2.6.1.jar:com/fasterxml/jackson/core/io/NumberOutput.class */
public final class NumberOutput {
    private static final char NC = 0;
    private static int MILLION = 1000000;
    private static int BILLION = 1000000000;
    private static long TEN_BILLION_L = 10000000000L;
    private static long THOUSAND_L = 1000;
    private static long MIN_INT_AS_LONG = -2147483648L;
    private static long MAX_INT_AS_LONG = 2147483647L;
    static final String SMALLEST_LONG = String.valueOf(Long.MIN_VALUE);
    static final char[] LEAD_3 = new char[4000];
    static final char[] FULL_3 = new char[4000];
    static final byte[] FULL_TRIPLETS_B;
    static final String[] sSmallIntStrs;
    static final String[] sSmallIntStrs2;

    static {
        int ix = 0;
        int i1 = 0;
        while (i1 < 10) {
            char f1 = (char) (48 + i1);
            char l1 = i1 == 0 ? (char) 0 : f1;
            int i2 = 0;
            while (i2 < 10) {
                char f2 = (char) (48 + i2);
                char l2 = (i1 == 0 && i2 == 0) ? (char) 0 : f2;
                for (int i3 = 0; i3 < 10; i3++) {
                    char f3 = (char) (48 + i3);
                    LEAD_3[ix] = l1;
                    LEAD_3[ix + 1] = l2;
                    LEAD_3[ix + 2] = f3;
                    FULL_3[ix] = f1;
                    FULL_3[ix + 1] = f2;
                    FULL_3[ix + 2] = f3;
                    ix += 4;
                }
                i2++;
            }
            i1++;
        }
        FULL_TRIPLETS_B = new byte[4000];
        for (int i = 0; i < 4000; i++) {
            FULL_TRIPLETS_B[i] = (byte) FULL_3[i];
        }
        sSmallIntStrs = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
        sSmallIntStrs2 = new String[]{"-1", "-2", "-3", "-4", "-5", "-6", "-7", "-8", "-9", "-10"};
    }

    public static int outputInt(int v, char[] b, int off) {
        int off2;
        int off3;
        if (v < 0) {
            if (v == Integer.MIN_VALUE) {
                return outputLong(v, b, off);
            }
            off++;
            b[off] = '-';
            v = -v;
        }
        if (v < MILLION) {
            if (v < 1000) {
                if (v < 10) {
                    int i = off;
                    off3 = off + 1;
                    b[i] = (char) (48 + v);
                } else {
                    off3 = leading3(v, b, off);
                }
            } else {
                int thousands = v / 1000;
                off3 = full3(v - (thousands * 1000), b, leading3(thousands, b, off));
            }
            return off3;
        }
        boolean hasBillions = v >= BILLION;
        if (hasBillions) {
            v -= BILLION;
            if (v >= BILLION) {
                v -= BILLION;
                int i2 = off;
                off++;
                b[i2] = '2';
            } else {
                int i3 = off;
                off++;
                b[i3] = '1';
            }
        }
        int newValue = v / 1000;
        int ones = v - (newValue * 1000);
        int newValue2 = newValue / 1000;
        int thousands2 = newValue - (newValue2 * 1000);
        if (hasBillions) {
            off2 = full3(newValue2, b, off);
        } else {
            off2 = leading3(newValue2, b, off);
        }
        return full3(ones, b, full3(thousands2, b, off2));
    }

    public static int outputInt(int v, byte[] b, int off) {
        int off2;
        int off3;
        if (v < 0) {
            if (v == Integer.MIN_VALUE) {
                return outputLong(v, b, off);
            }
            off++;
            b[off] = 45;
            v = -v;
        }
        if (v < MILLION) {
            if (v < 1000) {
                if (v < 10) {
                    int i = off;
                    off3 = off + 1;
                    b[i] = (byte) (48 + v);
                } else {
                    off3 = leading3(v, b, off);
                }
            } else {
                int thousands = v / 1000;
                off3 = full3(v - (thousands * 1000), b, leading3(thousands, b, off));
            }
            return off3;
        }
        boolean hasB = v >= BILLION;
        if (hasB) {
            v -= BILLION;
            if (v >= BILLION) {
                v -= BILLION;
                int i2 = off;
                off++;
                b[i2] = 50;
            } else {
                int i3 = off;
                off++;
                b[i3] = 49;
            }
        }
        int newValue = v / 1000;
        int ones = v - (newValue * 1000);
        int newValue2 = newValue / 1000;
        int thousands2 = newValue - (newValue2 * 1000);
        if (hasB) {
            off2 = full3(newValue2, b, off);
        } else {
            off2 = leading3(newValue2, b, off);
        }
        return full3(ones, b, full3(thousands2, b, off2));
    }

    public static int outputLong(long v, char[] b, int off) {
        if (v < 0) {
            if (v > MIN_INT_AS_LONG) {
                return outputInt((int) v, b, off);
            }
            if (v == Long.MIN_VALUE) {
                int len = SMALLEST_LONG.length();
                SMALLEST_LONG.getChars(0, len, b, off);
                return off + len;
            }
            off++;
            b[off] = '-';
            v = -v;
        } else if (v <= MAX_INT_AS_LONG) {
            return outputInt((int) v, b, off);
        }
        int origOffset = off;
        int off2 = off + calcLongStrLength(v);
        int ptr = off2;
        while (v > MAX_INT_AS_LONG) {
            ptr -= 3;
            long newValue = v / THOUSAND_L;
            int triplet = (int) (v - (newValue * THOUSAND_L));
            full3(triplet, b, ptr);
            v = newValue;
        }
        int i = (int) v;
        while (true) {
            int ivalue = i;
            if (ivalue >= 1000) {
                ptr -= 3;
                int newValue2 = ivalue / 1000;
                int triplet2 = ivalue - (newValue2 * 1000);
                full3(triplet2, b, ptr);
                i = newValue2;
            } else {
                leading3(ivalue, b, origOffset);
                return off2;
            }
        }
    }

    public static int outputLong(long v, byte[] b, int off) {
        if (v < 0) {
            if (v > MIN_INT_AS_LONG) {
                return outputInt((int) v, b, off);
            }
            if (v == Long.MIN_VALUE) {
                int len = SMALLEST_LONG.length();
                for (int i = 0; i < len; i++) {
                    int i2 = off;
                    off++;
                    b[i2] = (byte) SMALLEST_LONG.charAt(i);
                }
                return off;
            }
            off++;
            b[off] = 45;
            v = -v;
        } else if (v <= MAX_INT_AS_LONG) {
            return outputInt((int) v, b, off);
        }
        int origOff = off;
        int off2 = off + calcLongStrLength(v);
        int ptr = off2;
        while (v > MAX_INT_AS_LONG) {
            ptr -= 3;
            long newV = v / THOUSAND_L;
            int t = (int) (v - (newV * THOUSAND_L));
            full3(t, b, ptr);
            v = newV;
        }
        int i3 = (int) v;
        while (true) {
            int ivalue = i3;
            if (ivalue >= 1000) {
                ptr -= 3;
                int newV2 = ivalue / 1000;
                int t2 = ivalue - (newV2 * 1000);
                full3(t2, b, ptr);
                i3 = newV2;
            } else {
                leading3(ivalue, b, origOff);
                return off2;
            }
        }
    }

    public static String toString(int v) {
        if (v < sSmallIntStrs.length) {
            if (v >= 0) {
                return sSmallIntStrs[v];
            }
            int v2 = (-v) - 1;
            if (v2 < sSmallIntStrs2.length) {
                return sSmallIntStrs2[v2];
            }
        }
        return Integer.toString(v);
    }

    public static String toString(long v) {
        if (v <= 2147483647L && v >= -2147483648L) {
            return toString((int) v);
        }
        return Long.toString(v);
    }

    public static String toString(double v) {
        return Double.toString(v);
    }

    public static String toString(float v) {
        return Float.toString(v);
    }

    private static int leading3(int t, char[] b, int off) {
        int digitOffset = t << 2;
        int digitOffset2 = digitOffset + 1;
        char c = LEAD_3[digitOffset];
        if (c != 0) {
            off++;
            b[off] = c;
        }
        int digitOffset3 = digitOffset2 + 1;
        char c2 = LEAD_3[digitOffset2];
        if (c2 != 0) {
            int i = off;
            off++;
            b[i] = c2;
        }
        int i2 = off;
        int off2 = off + 1;
        b[i2] = LEAD_3[digitOffset3];
        return off2;
    }

    private static int leading3(int t, byte[] b, int off) {
        int digitOffset = t << 2;
        int digitOffset2 = digitOffset + 1;
        char c = LEAD_3[digitOffset];
        if (c != 0) {
            off++;
            b[off] = (byte) c;
        }
        int digitOffset3 = digitOffset2 + 1;
        char c2 = LEAD_3[digitOffset2];
        if (c2 != 0) {
            int i = off;
            off++;
            b[i] = (byte) c2;
        }
        int i2 = off;
        int off2 = off + 1;
        b[i2] = (byte) LEAD_3[digitOffset3];
        return off2;
    }

    private static int full3(int t, char[] b, int off) {
        int digitOffset = t << 2;
        int off2 = off + 1;
        int digitOffset2 = digitOffset + 1;
        b[off] = FULL_3[digitOffset];
        int off3 = off2 + 1;
        b[off2] = FULL_3[digitOffset2];
        int off4 = off3 + 1;
        b[off3] = FULL_3[digitOffset2 + 1];
        return off4;
    }

    private static int full3(int t, byte[] b, int off) {
        int digitOffset = t << 2;
        int off2 = off + 1;
        int digitOffset2 = digitOffset + 1;
        b[off] = FULL_TRIPLETS_B[digitOffset];
        int off3 = off2 + 1;
        b[off2] = FULL_TRIPLETS_B[digitOffset2];
        int off4 = off3 + 1;
        b[off3] = FULL_TRIPLETS_B[digitOffset2 + 1];
        return off4;
    }

    private static int calcLongStrLength(long v) {
        int len = 10;
        long j = TEN_BILLION_L;
        while (true) {
            long cmp = j;
            if (v < cmp || len == 19) {
                break;
            }
            len++;
            j = (cmp << 3) + (cmp << 1);
        }
        return len;
    }
}
