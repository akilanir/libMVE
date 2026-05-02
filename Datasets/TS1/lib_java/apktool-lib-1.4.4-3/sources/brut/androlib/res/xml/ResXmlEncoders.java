package brut.androlib.res.xml;

import java.lang.Character;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: apktool-lib-1.4.4-3.jar:brut/androlib/res/xml/ResXmlEncoders.class */
public final class ResXmlEncoders {
    public static String escapeXmlChars(String str) {
        return str.replace("&", "&amp;").replace("<", "&lt;");
    }

    public static String encodeAsResXmlAttr(String str) {
        if (str.isEmpty()) {
            return str;
        }
        char[] charArray = str.toCharArray();
        StringBuilder sb = new StringBuilder(str.length() + 10);
        switch (charArray[0]) {
            case '#':
            case '?':
            case '@':
                sb.append('\\');
                break;
        }
        for (char c : charArray) {
            switch (c) {
                case '\n':
                    sb.append("\\n");
                    continue;
                case '\"':
                    sb.append("&quot;");
                    continue;
                case '\\':
                    sb.append('\\');
                    break;
                default:
                    if (!isPrintableChar(c)) {
                        sb.append(String.format("\\u%04x", Integer.valueOf(c)));
                    }
                    break;
            }
            sb.append(c);
        }
        return sb.toString();
    }

    public static String encodeAsXmlValue(String str) {
        if (str.isEmpty()) {
            return str;
        }
        char[] charArray = str.toCharArray();
        StringBuilder sb = new StringBuilder(str.length() + 10);
        switch (charArray[0]) {
            case '#':
            case '?':
            case '@':
                sb.append('\\');
                break;
        }
        boolean z = false;
        int i = 0;
        boolean z2 = false;
        boolean z3 = true;
        for (char c : charArray) {
            if (z) {
                if (c == '>') {
                    z = false;
                    i = sb.length() + 1;
                    z2 = false;
                }
            } else if (c == ' ') {
                if (z3) {
                    z2 = true;
                }
                z3 = true;
            } else {
                z3 = false;
                switch (c) {
                    case '\n':
                    case '\'':
                        z2 = true;
                        break;
                    case '\"':
                        sb.append('\\');
                        break;
                    case '<':
                        z = true;
                        if (z2) {
                            sb.insert(i, '\"').append('\"');
                            break;
                        }
                        break;
                    case '\\':
                        sb.append('\\');
                        break;
                    default:
                        if (!isPrintableChar(c)) {
                            sb.append(String.format("\\u%04x", Integer.valueOf(c)));
                            break;
                        }
                        break;
                }
            }
            sb.append(c);
        }
        if (z2 || z3) {
            sb.insert(i, '\"').append('\"');
        }
        return sb.toString();
    }

    public static boolean hasMultipleNonPositionalSubstitutions(String str) {
        return findNonPositionalSubstitutions(str, 2).size() > 1;
    }

    public static String enumerateNonPositionalSubstitutions(String str) {
        List<Integer> findNonPositionalSubstitutions = findNonPositionalSubstitutions(str, -1);
        if (findNonPositionalSubstitutions.size() < 2) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        int i = 0;
        int i2 = 0;
        Iterator<Integer> it = findNonPositionalSubstitutions.iterator();
        while (it.hasNext()) {
            Integer valueOf = Integer.valueOf(it.next().intValue() + 1);
            i2++;
            sb.append(str.substring(i, valueOf.intValue())).append(i2).append('$');
            i = valueOf.intValue();
        }
        sb.append(str.substring(i));
        return sb.toString();
    }

    private static List<Integer> findNonPositionalSubstitutions(String str, int i) {
        char charAt;
        int i2 = 0;
        int i3 = 0;
        int length = str.length();
        ArrayList arrayList = new ArrayList();
        while (true) {
            int indexOf = str.indexOf(37, i2);
            int i4 = indexOf + 1;
            if (i4 == 0 || i4 == length) {
                break;
            }
            i2 = i4 + 1;
            char charAt2 = str.charAt(i4);
            if (charAt2 != '%') {
                if (charAt2 >= '0' && charAt2 <= '9' && i2 < length) {
                    do {
                        int i5 = i2;
                        i2++;
                        charAt = str.charAt(i5);
                        if (charAt < '0' || charAt > '9') {
                            break;
                        }
                    } while (i2 < length);
                    if (charAt == '$') {
                        continue;
                    }
                }
                arrayList.add(Integer.valueOf(indexOf));
                if (i != -1) {
                    i3++;
                    if (i3 >= i) {
                        break;
                    }
                } else {
                    continue;
                }
            }
        }
        return arrayList;
    }

    private static boolean isPrintableChar(char c) {
        Character.UnicodeBlock of = Character.UnicodeBlock.of(c);
        return (Character.isISOControl(c) || c == 65535 || of == null || of == Character.UnicodeBlock.SPECIALS) ? false : true;
    }
}
