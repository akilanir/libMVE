package korex.mail.internet;

import com.sun.mail.util.PropUtil;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ParameterList.class */
public class ParameterList {
    private Map list;
    private Set multisegmentNames;
    private Map slist;
    private String lastName;
    private static final boolean encodeParameters = PropUtil.getBooleanSystemProperty("mail.mime.encodeparameters", true);
    private static final boolean decodeParameters = PropUtil.getBooleanSystemProperty("mail.mime.decodeparameters", true);
    private static final boolean decodeParametersStrict = PropUtil.getBooleanSystemProperty("mail.mime.decodeparameters.strict", false);
    private static final boolean applehack = PropUtil.getBooleanSystemProperty("mail.mime.applefilenames", false);
    private static final boolean windowshack = PropUtil.getBooleanSystemProperty("mail.mime.windowsfilenames", false);
    private static final boolean parametersStrict = PropUtil.getBooleanSystemProperty("mail.mime.parameters.strict", true);
    private static final char[] hex = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ParameterList$Value.class */
    private static class Value {
        String value;
        String charset;
        String encodedValue;

        private Value() {
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ParameterList$MultiValue.class */
    private static class MultiValue extends ArrayList {
        String value;

        private MultiValue() {
        }
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ParameterList$ParamEnum.class */
    private static class ParamEnum implements Enumeration {
        private Iterator it;

        ParamEnum(Iterator it) {
            this.it = it;
        }

        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            return this.it.hasNext();
        }

        @Override // java.util.Enumeration
        public Object nextElement() {
            return this.it.next();
        }
    }

    public ParameterList() {
        this.list = new LinkedHashMap();
        this.lastName = null;
        if (decodeParameters) {
            this.multisegmentNames = new HashSet();
            this.slist = new HashMap();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:57:0x0227, code lost:
    
        if (korex.mail.internet.ParameterList.decodeParameters == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x022a, code lost:
    
        combineMultisegmentNames(false);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x022f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:?, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public ParameterList(java.lang.String r6) throws korex.mail.internet.ParseException {
        /*
            Method dump skipped, instructions count: 560
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.ParameterList.<init>(java.lang.String):void");
    }

    public void combineSegments() {
        if (decodeParameters && this.multisegmentNames.size() > 0) {
            try {
                combineMultisegmentNames(true);
            } catch (ParseException e) {
            }
        }
    }

    private void putEncodedName(String name, String value) throws ParseException {
        Object v;
        int star = name.indexOf(42);
        if (star < 0) {
            this.list.put(name, value);
            return;
        }
        if (star == name.length() - 1) {
            String name2 = name.substring(0, star);
            Value v2 = extractCharset(value);
            try {
                v2.value = decodeBytes(v2.value, v2.charset);
            } catch (UnsupportedEncodingException ex) {
                if (decodeParametersStrict) {
                    throw new ParseException(ex.toString());
                }
            }
            this.list.put(name2, v2);
            return;
        }
        String rname = name.substring(0, star);
        this.multisegmentNames.add(rname);
        this.list.put(rname, "");
        if (name.endsWith("*")) {
            if (name.endsWith("*0*")) {
                v = extractCharset(value);
            } else {
                v = new Value();
                ((Value) v).encodedValue = value;
                ((Value) v).value = value;
            }
            name = name.substring(0, name.length() - 1);
        } else {
            v = value;
        }
        this.slist.put(name, v);
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0101 A[Catch: UnsupportedEncodingException -> 0x0127, all -> 0x01ec, TryCatch #1 {UnsupportedEncodingException -> 0x0127, blocks: (B:29:0x00ed, B:32:0x00f9, B:37:0x010b, B:38:0x011a, B:34:0x0101), top: B:96:0x00ed, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x010b A[Catch: UnsupportedEncodingException -> 0x0127, all -> 0x01ec, TryCatch #1 {UnsupportedEncodingException -> 0x0127, blocks: (B:29:0x00ed, B:32:0x00f9, B:37:0x010b, B:38:0x011a, B:34:0x0101), top: B:96:0x00ed, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x011a A[Catch: UnsupportedEncodingException -> 0x0127, all -> 0x01ec, TryCatch #1 {UnsupportedEncodingException -> 0x0127, blocks: (B:29:0x00ed, B:32:0x00f9, B:37:0x010b, B:38:0x011a, B:34:0x0101), top: B:96:0x00ed, outer: #4 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void combineMultisegmentNames(boolean r5) throws korex.mail.internet.ParseException {
        /*
            Method dump skipped, instructions count: 644
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.mail.internet.ParameterList.combineMultisegmentNames(boolean):void");
    }

    public int size() {
        return this.list.size();
    }

    public String get(String name) {
        String value;
        Object v = this.list.get(name.trim().toLowerCase(Locale.ENGLISH));
        if (v instanceof MultiValue) {
            value = ((MultiValue) v).value;
        } else if (v instanceof Value) {
            value = ((Value) v).value;
        } else {
            value = (String) v;
        }
        return value;
    }

    public void set(String name, String value) {
        String name2 = name.trim().toLowerCase(Locale.ENGLISH);
        if (decodeParameters) {
            try {
                putEncodedName(name2, value);
                return;
            } catch (ParseException e) {
                this.list.put(name2, value);
                return;
            }
        }
        this.list.put(name2, value);
    }

    public void set(String name, String value, String charset) {
        if (encodeParameters) {
            Value ev = encodeValue(value, charset);
            if (ev != null) {
                this.list.put(name.trim().toLowerCase(Locale.ENGLISH), ev);
                return;
            } else {
                set(name, value);
                return;
            }
        }
        set(name, value);
    }

    public void remove(String name) {
        this.list.remove(name.trim().toLowerCase(Locale.ENGLISH));
    }

    public Enumeration getNames() {
        return new ParamEnum(this.list.keySet().iterator());
    }

    public String toString() {
        return toString(0);
    }

    public String toString(int used) {
        ToStringBuffer sb = new ToStringBuffer(used);
        for (String name : this.list.keySet()) {
            Object v = this.list.get(name);
            if (v instanceof MultiValue) {
                MultiValue vv = (MultiValue) v;
                String ns = name + "*";
                for (int i = 0; i < vv.size(); i++) {
                    Object va = vv.get(i);
                    if (va instanceof Value) {
                        sb.addNV(ns + i + "*", ((Value) va).encodedValue);
                    } else {
                        sb.addNV(ns + i, (String) va);
                    }
                }
            } else if (v instanceof Value) {
                sb.addNV(name + "*", ((Value) v).encodedValue);
            } else {
                sb.addNV(name, (String) v);
            }
        }
        return sb.toString();
    }

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/ParameterList$ToStringBuffer.class */
    private static class ToStringBuffer {
        private int used;
        private StringBuffer sb = new StringBuffer();

        public ToStringBuffer(int used) {
            this.used = used;
        }

        public void addNV(String name, String value) {
            String value2 = ParameterList.quote(value);
            this.sb.append("; ");
            this.used += 2;
            int len = name.length() + value2.length() + 1;
            if (this.used + len > 76) {
                this.sb.append("\r\n\t");
                this.used = 8;
            }
            this.sb.append(name).append('=');
            this.used += name.length() + 1;
            if (this.used + value2.length() > 76) {
                String s = MimeUtility.fold(this.used, value2);
                this.sb.append(s);
                int lastlf = s.lastIndexOf(10);
                if (lastlf >= 0) {
                    this.used += (s.length() - lastlf) - 1;
                    return;
                } else {
                    this.used += s.length();
                    return;
                }
            }
            this.sb.append(value2);
            this.used += value2.length();
        }

        public String toString() {
            return this.sb.toString();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String quote(String value) {
        return MimeUtility.quote(value, HeaderTokenizer.MIME);
    }

    private static Value encodeValue(String value, String charset) {
        if (MimeUtility.checkAscii(value) == 1) {
            return null;
        }
        try {
            byte[] b = value.getBytes(MimeUtility.javaCharset(charset));
            StringBuffer sb = new StringBuffer(b.length + charset.length() + 2);
            sb.append(charset).append("''");
            for (byte b2 : b) {
                char c = (char) (b2 & 255);
                if (c <= ' ' || c >= 127 || c == '*' || c == '\'' || c == '%' || HeaderTokenizer.MIME.indexOf(c) >= 0) {
                    sb.append('%').append(hex[c >> 4]).append(hex[c & 15]);
                } else {
                    sb.append(c);
                }
            }
            Value v = new Value();
            v.charset = charset;
            v.value = value;
            v.encodedValue = sb.toString();
            return v;
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    private static Value extractCharset(String value) throws ParseException {
        int i;
        Value v = new Value();
        v.encodedValue = value;
        v.value = value;
        try {
            i = value.indexOf(39);
        } catch (NumberFormatException nex) {
            if (decodeParametersStrict) {
                throw new ParseException(nex.toString());
            }
        } catch (StringIndexOutOfBoundsException ex) {
            if (decodeParametersStrict) {
                throw new ParseException(ex.toString());
            }
        }
        if (i < 0) {
            if (decodeParametersStrict) {
                throw new ParseException("Missing charset in encoded value: " + value);
            }
            return v;
        }
        String charset = value.substring(0, i);
        int li = value.indexOf(39, i + 1);
        if (li < 0) {
            if (decodeParametersStrict) {
                throw new ParseException("Missing language in encoded value: " + value);
            }
            return v;
        }
        v.value = value.substring(li + 1);
        v.charset = charset;
        return v;
    }

    private static String decodeBytes(String value, String charset) throws ParseException, UnsupportedEncodingException {
        byte[] b = new byte[value.length()];
        int i = 0;
        int bi = 0;
        while (i < value.length()) {
            char c = value.charAt(i);
            if (c == '%') {
                try {
                    String hex2 = value.substring(i + 1, i + 3);
                    c = (char) Integer.parseInt(hex2, 16);
                    i += 2;
                } catch (NumberFormatException ex) {
                    if (decodeParametersStrict) {
                        throw new ParseException(ex.toString());
                    }
                } catch (StringIndexOutOfBoundsException ex2) {
                    if (decodeParametersStrict) {
                        throw new ParseException(ex2.toString());
                    }
                }
            }
            int i2 = bi;
            bi++;
            b[i2] = (byte) c;
            i++;
        }
        if (charset != null) {
            charset = MimeUtility.javaCharset(charset);
        }
        if (charset == null || charset.length() == 0) {
            charset = MimeUtility.getDefaultJavaCharset();
        }
        return new String(b, 0, bi, charset);
    }

    private static void decodeBytes(String value, OutputStream os) throws ParseException, IOException {
        int i = 0;
        while (i < value.length()) {
            char c = value.charAt(i);
            if (c == '%') {
                try {
                    String hex2 = value.substring(i + 1, i + 3);
                    c = (char) Integer.parseInt(hex2, 16);
                    i += 2;
                } catch (NumberFormatException ex) {
                    if (decodeParametersStrict) {
                        throw new ParseException(ex.toString());
                    }
                } catch (StringIndexOutOfBoundsException ex2) {
                    if (decodeParametersStrict) {
                        throw new ParseException(ex2.toString());
                    }
                }
            }
            os.write((byte) c);
            i++;
        }
    }
}
