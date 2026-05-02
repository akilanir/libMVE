package freemarker.template.utility;

import freemarker.core.Environment;
import freemarker.core.FMParserConstants;
import freemarker.template.Version;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.StringTokenizer;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/StringUtil.class */
public class StringUtil {
    private static final char[] ESCAPES = createEscapes();
    private static final int NO_ESC = 0;
    private static final int ESC_HEXA = 1;
    private static final int ESC_BACKSLASH = 3;

    public static String HTMLEnc(String s) {
        return XMLEncNA(s);
    }

    public static String XMLEnc(String s) {
        return XMLOrXHTMLEnc(s, "&apos;");
    }

    public static String XHTMLEnc(String s) {
        return XMLOrXHTMLEnc(s, "&#39;");
    }

    private static String XMLOrXHTMLEnc(String s, String aposReplacement) {
        int ln = s.length();
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '<' || c == '>' || c == '&' || c == '\"' || c == '\'') {
                StringBuffer b = new StringBuffer(s.substring(0, i));
                switch (c) {
                    case FMParserConstants.END_ATTEMPT /* 34 */:
                        b.append("&quot;");
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        b.append("&amp;");
                        break;
                    case FMParserConstants.END_FUNCTION /* 39 */:
                        b.append(aposReplacement);
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        b.append("&lt;");
                        break;
                    case FMParserConstants.END_NOESCAPE /* 62 */:
                        b.append("&gt;");
                        break;
                }
                int i2 = i + 1;
                int next = i2;
                while (i2 < ln) {
                    char c2 = s.charAt(i2);
                    if (c2 == '<' || c2 == '>' || c2 == '&' || c2 == '\"' || c2 == '\'') {
                        b.append(s.substring(next, i2));
                        switch (c2) {
                            case FMParserConstants.END_ATTEMPT /* 34 */:
                                b.append("&quot;");
                                break;
                            case FMParserConstants.END_ASSIGN /* 38 */:
                                b.append("&amp;");
                                break;
                            case FMParserConstants.END_FUNCTION /* 39 */:
                                b.append(aposReplacement);
                                break;
                            case FMParserConstants.END_ESCAPE /* 60 */:
                                b.append("&lt;");
                                break;
                            case FMParserConstants.END_NOESCAPE /* 62 */:
                                b.append("&gt;");
                                break;
                        }
                        next = i2 + 1;
                    }
                    i2++;
                }
                if (next < ln) {
                    b.append(s.substring(next));
                }
                s = b.toString();
                return s;
            }
        }
        return s;
    }

    public static String XMLEncNA(String s) {
        int ln = s.length();
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '<' || c == '>' || c == '&' || c == '\"') {
                StringBuffer b = new StringBuffer(s.substring(0, i));
                switch (c) {
                    case FMParserConstants.END_ATTEMPT /* 34 */:
                        b.append("&quot;");
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        b.append("&amp;");
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        b.append("&lt;");
                        break;
                    case FMParserConstants.END_NOESCAPE /* 62 */:
                        b.append("&gt;");
                        break;
                }
                int i2 = i + 1;
                int next = i2;
                while (i2 < ln) {
                    char c2 = s.charAt(i2);
                    if (c2 == '<' || c2 == '>' || c2 == '&' || c2 == '\"') {
                        b.append(s.substring(next, i2));
                        switch (c2) {
                            case FMParserConstants.END_ATTEMPT /* 34 */:
                                b.append("&quot;");
                                break;
                            case FMParserConstants.END_ASSIGN /* 38 */:
                                b.append("&amp;");
                                break;
                            case FMParserConstants.END_ESCAPE /* 60 */:
                                b.append("&lt;");
                                break;
                            case FMParserConstants.END_NOESCAPE /* 62 */:
                                b.append("&gt;");
                                break;
                        }
                        next = i2 + 1;
                    }
                    i2++;
                }
                if (next < ln) {
                    b.append(s.substring(next));
                }
                s = b.toString();
                return s;
            }
        }
        return s;
    }

    public static String XMLEncQAttr(String s) {
        int ln = s.length();
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '<' || c == '&' || c == '\"') {
                StringBuffer b = new StringBuffer(s.substring(0, i));
                switch (c) {
                    case FMParserConstants.END_ATTEMPT /* 34 */:
                        b.append("&quot;");
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        b.append("&amp;");
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        b.append("&lt;");
                        break;
                }
                int i2 = i + 1;
                int next = i2;
                while (i2 < ln) {
                    char c2 = s.charAt(i2);
                    if (c2 == '<' || c2 == '&' || c2 == '\"') {
                        b.append(s.substring(next, i2));
                        switch (c2) {
                            case FMParserConstants.END_ATTEMPT /* 34 */:
                                b.append("&quot;");
                                break;
                            case FMParserConstants.END_ASSIGN /* 38 */:
                                b.append("&amp;");
                                break;
                            case FMParserConstants.END_ESCAPE /* 60 */:
                                b.append("&lt;");
                                break;
                        }
                        next = i2 + 1;
                    }
                    i2++;
                }
                if (next < ln) {
                    b.append(s.substring(next));
                }
                s = b.toString();
                return s;
            }
        }
        return s;
    }

    public static String XMLEncNQG(String s) {
        int ln = s.length();
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '<' || ((c == '>' && i > 1 && s.charAt(i - 1) == ']' && s.charAt(i - 2) == ']') || c == '&')) {
                StringBuffer b = new StringBuffer(s.substring(0, i));
                switch (c) {
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        b.append("&amp;");
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        b.append("&lt;");
                        break;
                    case FMParserConstants.END_NOESCAPE /* 62 */:
                        b.append("&gt;");
                        break;
                    default:
                        throw new RuntimeException("Bug: unexpected char");
                }
                int i2 = i + 1;
                int next = i2;
                while (i2 < ln) {
                    char c2 = s.charAt(i2);
                    if (c2 == '<' || ((c2 == '>' && i2 > 1 && s.charAt(i2 - 1) == ']' && s.charAt(i2 - 2) == ']') || c2 == '&')) {
                        b.append(s.substring(next, i2));
                        switch (c2) {
                            case FMParserConstants.END_ASSIGN /* 38 */:
                                b.append("&amp;");
                                break;
                            case FMParserConstants.END_ESCAPE /* 60 */:
                                b.append("&lt;");
                                break;
                            case FMParserConstants.END_NOESCAPE /* 62 */:
                                b.append("&gt;");
                                break;
                            default:
                                throw new RuntimeException("Bug: unexpected char");
                        }
                        next = i2 + 1;
                    }
                    i2++;
                }
                if (next < ln) {
                    b.append(s.substring(next));
                }
                s = b.toString();
                return s;
            }
        }
        return s;
    }

    public static String RTFEnc(String s) {
        int ln = s.length();
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '\\' || c == '{' || c == '}') {
                StringBuffer b = new StringBuffer(s.substring(0, i));
                switch (c) {
                    case FMParserConstants.DOUBLE_EQUALS /* 92 */:
                        b.append("\\\\");
                        break;
                    case FMParserConstants.DIGIT /* 123 */:
                        b.append("\\{");
                        break;
                    case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                        b.append("\\}");
                        break;
                }
                int i2 = i + 1;
                int next = i2;
                while (i2 < ln) {
                    char c2 = s.charAt(i2);
                    if (c2 == '\\' || c2 == '{' || c2 == '}') {
                        b.append(s.substring(next, i2));
                        switch (c2) {
                            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
                                b.append("\\\\");
                                break;
                            case FMParserConstants.DIGIT /* 123 */:
                                b.append("\\{");
                                break;
                            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                                b.append("\\}");
                                break;
                        }
                        next = i2 + 1;
                    }
                    i2++;
                }
                if (next < ln) {
                    b.append(s.substring(next));
                }
                s = b.toString();
                return s;
            }
        }
        return s;
    }

    public static String URLEnc(String s, String charset) throws UnsupportedEncodingException {
        int i;
        int i2;
        int i3;
        int i4;
        char c;
        int ln = s.length();
        int i5 = 0;
        while (i5 < ln && (((c = s.charAt(i5)) >= 'a' && c <= 'z') || ((c >= 'A' && c <= 'Z') || ((c >= '0' && c <= '9') || c == '_' || c == '-' || c == '.' || c == '!' || c == '~' || (c >= '\'' && c <= '*'))))) {
            i5++;
        }
        if (i5 == ln) {
            return s;
        }
        StringBuffer b = new StringBuffer(ln + (ln / 3) + 2);
        b.append(s.substring(0, i5));
        int encstart = i5;
        while (true) {
            i5++;
            if (i5 >= ln) {
                break;
            }
            char c2 = s.charAt(i5);
            if ((c2 >= 'a' && c2 <= 'z') || ((c2 >= 'A' && c2 <= 'Z') || ((c2 >= '0' && c2 <= '9') || c2 == '_' || c2 == '-' || c2 == '.' || c2 == '!' || c2 == '~' || (c2 >= '\'' && c2 <= '*')))) {
                if (encstart != -1) {
                    byte[] o = s.substring(encstart, i5).getBytes(charset);
                    for (byte bc : o) {
                        b.append('%');
                        int c1 = bc & 15;
                        int c22 = (bc >> 4) & 15;
                        b.append((char) (c22 < 10 ? c22 + 48 : (c22 - 10) + 65));
                        if (c1 < 10) {
                            i3 = c1;
                            i4 = 48;
                        } else {
                            i3 = c1 - 10;
                            i4 = 65;
                        }
                        b.append((char) (i3 + i4));
                    }
                    encstart = -1;
                }
                b.append(c2);
            } else if (encstart == -1) {
                encstart = i5;
            }
        }
        if (encstart != -1) {
            byte[] o2 = s.substring(encstart, i5).getBytes(charset);
            for (byte bc2 : o2) {
                b.append('%');
                int c12 = bc2 & 15;
                int c23 = (bc2 >> 4) & 15;
                b.append((char) (c23 < 10 ? c23 + 48 : (c23 - 10) + 65));
                if (c12 < 10) {
                    i = c12;
                    i2 = 48;
                } else {
                    i = c12 - 10;
                    i2 = 65;
                }
                b.append((char) (i + i2));
            }
        }
        return b.toString();
    }

    private static char[] createEscapes() {
        char[] escapes = new char[93];
        for (int i = 0; i < 32; i++) {
            escapes[i] = 1;
        }
        escapes[92] = '\\';
        escapes[39] = '\'';
        escapes[34] = '\"';
        escapes[60] = 'l';
        escapes[62] = 'g';
        escapes[38] = 'a';
        escapes[8] = 'b';
        escapes[9] = 't';
        escapes[10] = 'n';
        escapes[12] = 'f';
        escapes[13] = 'r';
        escapes[36] = '$';
        return escapes;
    }

    public static String FTLStringLiteralEnc(String s) {
        StringBuffer buf = null;
        int l = s.length();
        int el = ESCAPES.length;
        for (int i = 0; i < l; i++) {
            char c = s.charAt(i);
            if (c < el) {
                char escape = ESCAPES[c];
                switch (escape) {
                    case 0:
                        if (buf != null) {
                            buf.append(c);
                            break;
                        } else {
                            break;
                        }
                    case 1:
                        if (buf == null) {
                            buf = new StringBuffer(s.length() + 3);
                            buf.append(s.substring(0, i));
                        }
                        buf.append("\\x00");
                        int c2 = (c >> 4) & 15;
                        char c3 = (char) (c & 15);
                        buf.append((char) (c2 < 10 ? c2 + 48 : (c2 - 10) + 65));
                        buf.append((char) (c3 < '\n' ? c3 + '0' : (c3 - '\n') + 65));
                        break;
                    default:
                        if (buf == null) {
                            buf = new StringBuffer(s.length() + 2);
                            buf.append(s.substring(0, i));
                        }
                        buf.append('\\');
                        buf.append(escape);
                        break;
                }
            } else if (buf != null) {
                buf.append(c);
            }
        }
        return buf == null ? s : buf.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x0208  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0214 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String FTLStringLiteralDec(java.lang.String r6) throws freemarker.core.ParseException {
        /*
            Method dump skipped, instructions count: 614
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.template.utility.StringUtil.FTLStringLiteralDec(java.lang.String):java.lang.String");
    }

    public static Locale deduceLocale(String input) {
        Locale locale;
        if (input == null) {
            return null;
        }
        Locale.getDefault();
        if (input.length() > 0 && input.charAt(0) == '\"') {
            input = input.substring(1, input.length() - 1);
        }
        StringTokenizer st = new StringTokenizer(input, ",_ ");
        String lang = "";
        if (st.hasMoreTokens()) {
            lang = st.nextToken();
        }
        String country = st.hasMoreTokens() ? st.nextToken() : "";
        if (!st.hasMoreTokens()) {
            locale = new Locale(lang, country);
        } else {
            locale = new Locale(lang, country, st.nextToken());
        }
        return locale;
    }

    public static String capitalize(String s) {
        StringTokenizer st = new StringTokenizer(s, " \t\r\n", true);
        StringBuffer buf = new StringBuffer(s.length());
        while (st.hasMoreTokens()) {
            String tok = st.nextToken();
            buf.append(tok.substring(0, 1).toUpperCase());
            buf.append(tok.substring(1).toLowerCase());
        }
        return buf.toString();
    }

    public static boolean getYesNo(String s) {
        if (s.startsWith("\"")) {
            s = s.substring(1, s.length() - 1);
        }
        if (s.equalsIgnoreCase("n") || s.equalsIgnoreCase("no") || s.equalsIgnoreCase("f") || s.equalsIgnoreCase("false")) {
            return false;
        }
        if (s.equalsIgnoreCase("y") || s.equalsIgnoreCase("yes") || s.equalsIgnoreCase("t") || s.equalsIgnoreCase("true")) {
            return true;
        }
        throw new IllegalArgumentException(new StringBuffer().append("Illegal boolean value: ").append(s).toString());
    }

    public static String[] split(String s, char c) {
        int ln = s.length();
        int i = 0;
        int cnt = 1;
        while (true) {
            int i2 = s.indexOf(c, i);
            if (i2 == -1) {
                break;
            }
            cnt++;
            i = i2 + 1;
        }
        String[] res = new String[cnt];
        int i3 = 0;
        int i4 = 0;
        while (true) {
            int b = i4;
            if (b <= ln) {
                int e = s.indexOf(c, b);
                if (e == -1) {
                    e = ln;
                }
                int i5 = i3;
                i3++;
                res[i5] = s.substring(b, e);
                i4 = e + 1;
            } else {
                return res;
            }
        }
    }

    public static String[] split(String s, String sep, boolean caseInsensitive) {
        String splitString = caseInsensitive ? sep.toLowerCase() : sep;
        String input = caseInsensitive ? s.toLowerCase() : s;
        int ln = s.length();
        int sln = sep.length();
        if (sln == 0) {
            throw new IllegalArgumentException("The separator string has 0 length");
        }
        int i = 0;
        int cnt = 1;
        while (true) {
            int i2 = input.indexOf(splitString, i);
            if (i2 == -1) {
                break;
            }
            cnt++;
            i = i2 + sln;
        }
        String[] res = new String[cnt];
        int i3 = 0;
        int i4 = 0;
        while (true) {
            int b = i4;
            if (b <= ln) {
                int e = input.indexOf(splitString, b);
                if (e == -1) {
                    e = ln;
                }
                int i5 = i3;
                i3++;
                res[i5] = s.substring(b, e);
                i4 = e + sln;
            } else {
                return res;
            }
        }
    }

    public static String replace(String text, String oldSub, String newSub) {
        return replace(text, oldSub, newSub, false, false);
    }

    public static String replace(String text, String oldsub, String newsub, boolean caseInsensitive, boolean firstOnly) {
        int oln = oldsub.length();
        if (oln == 0) {
            int nln = newsub.length();
            if (nln == 0) {
                return text;
            }
            if (firstOnly) {
                return new StringBuffer().append(newsub).append(text).toString();
            }
            int tln = text.length();
            StringBuffer buf = new StringBuffer(tln + ((tln + 1) * nln));
            buf.append(newsub);
            for (int i = 0; i < tln; i++) {
                buf.append(text.charAt(i));
                buf.append(newsub);
            }
            return buf.toString();
        }
        String oldsub2 = caseInsensitive ? oldsub.toLowerCase() : oldsub;
        String input = caseInsensitive ? text.toLowerCase() : text;
        int e = input.indexOf(oldsub2);
        if (e == -1) {
            return text;
        }
        int b = 0;
        StringBuffer buf2 = new StringBuffer(text.length() + (Math.max(newsub.length() - oln, 0) * 3));
        do {
            buf2.append(text.substring(b, e));
            buf2.append(newsub);
            b = e + oln;
            e = input.indexOf(oldsub2, b);
            if (e == -1) {
                break;
            }
        } while (!firstOnly);
        buf2.append(text.substring(b));
        return buf2.toString();
    }

    public static String chomp(String s) {
        if (s.endsWith("\r\n")) {
            return s.substring(0, s.length() - 2);
        }
        if (s.endsWith("\r") || s.endsWith("\n")) {
            return s.substring(0, s.length() - 1);
        }
        return s;
    }

    public static String emptyToNull(String s) {
        if (s == null || s.length() == 0) {
            return null;
        }
        return s;
    }

    public static String jQuote(Object obj) {
        return jQuote(obj != null ? obj.toString() : null);
    }

    public static String jQuote(String s) {
        if (s == null) {
            return "null";
        }
        int ln = s.length();
        StringBuffer b = new StringBuffer(ln + 4);
        b.append('\"');
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '\"') {
                b.append("\\\"");
            } else if (c == '\\') {
                b.append("\\\\");
            } else if (c < ' ') {
                if (c == '\n') {
                    b.append("\\n");
                } else if (c == '\r') {
                    b.append("\\r");
                } else if (c == '\f') {
                    b.append("\\f");
                } else if (c == '\b') {
                    b.append("\\b");
                } else if (c == '\t') {
                    b.append("\\t");
                } else {
                    b.append("\\u00");
                    int x = c / 16;
                    b.append(toHexDigit(x));
                    int x2 = c & 15;
                    b.append(toHexDigit(x2));
                }
            } else {
                b.append(c);
            }
        }
        b.append('\"');
        return b.toString();
    }

    public static String jQuoteNoXSS(Object obj) {
        return jQuoteNoXSS(obj != null ? obj.toString() : null);
    }

    public static String jQuoteNoXSS(String s) {
        if (s == null) {
            return "null";
        }
        int ln = s.length();
        StringBuffer b = new StringBuffer(ln + 4);
        b.append('\"');
        for (int i = 0; i < ln; i++) {
            char c = s.charAt(i);
            if (c == '\"') {
                b.append("\\\"");
            } else if (c == '\\') {
                b.append("\\\\");
            } else if (c == '<') {
                b.append("\\u003C");
            } else if (c < ' ') {
                if (c == '\n') {
                    b.append("\\n");
                } else if (c == '\r') {
                    b.append("\\r");
                } else if (c == '\f') {
                    b.append("\\f");
                } else if (c == '\b') {
                    b.append("\\b");
                } else if (c == '\t') {
                    b.append("\\t");
                } else {
                    b.append("\\u00");
                    int x = c / 16;
                    b.append(toHexDigit(x));
                    int x2 = c & 15;
                    b.append(toHexDigit(x2));
                }
            } else {
                b.append(c);
            }
        }
        b.append('\"');
        return b.toString();
    }

    public static String javaStringEnc(String s) {
        int ln = s.length();
        int i = 0;
        while (i < ln) {
            char c = s.charAt(i);
            if (c != '\"' && c != '\\' && c >= ' ') {
                i++;
            } else {
                StringBuffer b = new StringBuffer(ln + 4);
                b.append(s.substring(0, i));
                while (true) {
                    if (c == '\"') {
                        b.append("\\\"");
                    } else if (c == '\\') {
                        b.append("\\\\");
                    } else if (c < ' ') {
                        if (c == '\n') {
                            b.append("\\n");
                        } else if (c == '\r') {
                            b.append("\\r");
                        } else if (c == '\f') {
                            b.append("\\f");
                        } else if (c == '\b') {
                            b.append("\\b");
                        } else if (c == '\t') {
                            b.append("\\t");
                        } else {
                            b.append("\\u00");
                            int x = c / 16;
                            b.append((char) (x < 10 ? x + 48 : (x - 10) + 97));
                            int x2 = c & 15;
                            b.append((char) (x2 < 10 ? x2 + 48 : (x2 - 10) + 97));
                        }
                    } else {
                        b.append(c);
                    }
                    i++;
                    if (i >= ln) {
                        return b.toString();
                    }
                    c = s.charAt(i);
                }
            }
        }
        return s;
    }

    public static String javaScriptStringEnc(String s) {
        return jsStringEnc(s, false);
    }

    public static String jsonStringEnc(String s) {
        return jsStringEnc(s, true);
    }

    /* JADX WARN: Removed duplicated region for block: B:125:0x0284  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String jsStringEnc(java.lang.String r5, boolean r6) {
        /*
            Method dump skipped, instructions count: 674
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.template.utility.StringUtil.jsStringEnc(java.lang.String, boolean):java.lang.String");
    }

    private static char toHexDigit(int d) {
        return (char) (d < 10 ? d + 48 : (d - 10) + 65);
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x013a, code lost:
    
        throw new java.text.ParseException(new java.lang.StringBuffer().append("Expecting \":\" here, but found ").append(jQuote(java.lang.String.valueOf(r8))).append(" at position ").append(r10).append(".").toString(), r10);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.Map parseNameValuePairList(java.lang.String r5, java.lang.String r6) throws java.text.ParseException {
        /*
            Method dump skipped, instructions count: 650
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.template.utility.StringUtil.parseNameValuePairList(java.lang.String, java.lang.String):java.util.Map");
    }

    public static boolean isXMLID(String name) {
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (i == 0 && (c == '-' || c == '.' || Character.isDigit(c))) {
                return false;
            }
            if (!Character.isLetterOrDigit(c) && c != ':' && c != '_' && c != '-' && c != '.') {
                return false;
            }
        }
        return true;
    }

    public static boolean matchesName(String qname, String nodeName, String nsURI, Environment env) {
        String defaultNS = env.getDefaultNS();
        if (defaultNS != null && defaultNS.equals(nsURI)) {
            return qname.equals(nodeName) || qname.equals(new StringBuffer().append("D:").append(nodeName).toString());
        }
        if ("".equals(nsURI)) {
            if (defaultNS != null) {
                return qname.equals(new StringBuffer().append("N:").append(nodeName).toString());
            }
            return qname.equals(nodeName) || qname.equals(new StringBuffer().append("N:").append(nodeName).toString());
        }
        String prefix = env.getPrefixForNamespace(nsURI);
        if (prefix == null) {
            return false;
        }
        return qname.equals(new StringBuffer().append(prefix).append(":").append(nodeName).toString());
    }

    public static String leftPad(String s, int minLength) {
        return leftPad(s, minLength, ' ');
    }

    public static String leftPad(String s, int minLength, char filling) {
        int ln = s.length();
        if (minLength <= ln) {
            return s;
        }
        StringBuffer res = new StringBuffer(minLength);
        int dif = minLength - ln;
        for (int i = 0; i < dif; i++) {
            res.append(filling);
        }
        res.append(s);
        return res.toString();
    }

    public static String leftPad(String s, int minLength, String filling) {
        int ln = s.length();
        if (minLength <= ln) {
            return s;
        }
        StringBuffer res = new StringBuffer(minLength);
        int dif = minLength - ln;
        int fln = filling.length();
        if (fln == 0) {
            throw new IllegalArgumentException("The \"filling\" argument can't be 0 length string.");
        }
        int cnt = dif / fln;
        for (int i = 0; i < cnt; i++) {
            res.append(filling);
        }
        int cnt2 = dif % fln;
        for (int i2 = 0; i2 < cnt2; i2++) {
            res.append(filling.charAt(i2));
        }
        res.append(s);
        return res.toString();
    }

    public static String rightPad(String s, int minLength) {
        return rightPad(s, minLength, ' ');
    }

    public static String rightPad(String s, int minLength, char filling) {
        int ln = s.length();
        if (minLength <= ln) {
            return s;
        }
        StringBuffer res = new StringBuffer(minLength);
        res.append(s);
        int dif = minLength - ln;
        for (int i = 0; i < dif; i++) {
            res.append(filling);
        }
        return res.toString();
    }

    public static String rightPad(String s, int minLength, String filling) {
        int ln = s.length();
        if (minLength <= ln) {
            return s;
        }
        StringBuffer res = new StringBuffer(minLength);
        res.append(s);
        int dif = minLength - ln;
        int fln = filling.length();
        if (fln == 0) {
            throw new IllegalArgumentException("The \"filling\" argument can't be 0 length string.");
        }
        int start = ln % fln;
        int end = fln - start <= dif ? fln : start + dif;
        for (int i = start; i < end; i++) {
            res.append(filling.charAt(i));
        }
        int dif2 = dif - (end - start);
        int cnt = dif2 / fln;
        for (int i2 = 0; i2 < cnt; i2++) {
            res.append(filling);
        }
        int cnt2 = dif2 % fln;
        for (int i3 = 0; i3 < cnt2; i3++) {
            res.append(filling.charAt(i3));
        }
        return res.toString();
    }

    public static int versionStringToInt(String version) {
        return new Version(version).intValue();
    }

    public static String tryToString(Object object) {
        if (object == null) {
            return null;
        }
        try {
            return object.toString();
        } catch (Throwable e) {
            try {
                return new StringBuffer().append("[toString() failed: ").append(e).append("]").toString();
            } catch (Throwable th) {
                return new StringBuffer().append("[toString() failed: ").append(e.getClass().getName()).append("]").toString();
            }
        }
    }
}
