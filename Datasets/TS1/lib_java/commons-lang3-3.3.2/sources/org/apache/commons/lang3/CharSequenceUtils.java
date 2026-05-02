package org.apache.commons.lang3;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/CharSequenceUtils.class */
public class CharSequenceUtils {
    public static CharSequence subSequence(CharSequence cs, int start) {
        if (cs == null) {
            return null;
        }
        return cs.subSequence(start, cs.length());
    }

    static int indexOf(CharSequence cs, int searchChar, int start) {
        if (cs instanceof String) {
            return ((String) cs).indexOf(searchChar, start);
        }
        int sz = cs.length();
        if (start < 0) {
            start = 0;
        }
        for (int i = start; i < sz; i++) {
            if (cs.charAt(i) == searchChar) {
                return i;
            }
        }
        return -1;
    }

    static int indexOf(CharSequence cs, CharSequence searchChar, int start) {
        return cs.toString().indexOf(searchChar.toString(), start);
    }

    static int lastIndexOf(CharSequence cs, int searchChar, int start) {
        if (cs instanceof String) {
            return ((String) cs).lastIndexOf(searchChar, start);
        }
        int sz = cs.length();
        if (start < 0) {
            return -1;
        }
        if (start >= sz) {
            start = sz - 1;
        }
        for (int i = start; i >= 0; i--) {
            if (cs.charAt(i) == searchChar) {
                return i;
            }
        }
        return -1;
    }

    static int lastIndexOf(CharSequence cs, CharSequence searchChar, int start) {
        return cs.toString().lastIndexOf(searchChar.toString(), start);
    }

    static char[] toCharArray(CharSequence cs) {
        if (cs instanceof String) {
            return ((String) cs).toCharArray();
        }
        int sz = cs.length();
        char[] array = new char[cs.length()];
        for (int i = 0; i < sz; i++) {
            array[i] = cs.charAt(i);
        }
        return array;
    }

    static boolean regionMatches(CharSequence cs, boolean ignoreCase, int thisStart, CharSequence substring, int start, int length) {
        if ((cs instanceof String) && (substring instanceof String)) {
            return ((String) cs).regionMatches(ignoreCase, thisStart, (String) substring, start, length);
        }
        int index1 = thisStart;
        int index2 = start;
        int tmpLen = length;
        while (true) {
            int i = tmpLen;
            tmpLen--;
            if (i > 0) {
                int i2 = index1;
                index1++;
                char c1 = cs.charAt(i2);
                int i3 = index2;
                index2++;
                char c2 = substring.charAt(i3);
                if (c1 != c2) {
                    if (!ignoreCase) {
                        return false;
                    }
                    if (Character.toUpperCase(c1) != Character.toUpperCase(c2) && Character.toLowerCase(c1) != Character.toLowerCase(c2)) {
                        return false;
                    }
                }
            } else {
                return true;
            }
        }
    }
}
