package korex.activation;

import java.util.Enumeration;
import java.util.Hashtable;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/MimeTypeParameterList.class */
public class MimeTypeParameterList {
    private Hashtable parameters = new Hashtable();
    private static final String TSPECIALS = "()<>@,;:/[]?=\\\"";

    public MimeTypeParameterList() {
    }

    public MimeTypeParameterList(String parameterList) throws MimeTypeParseException {
        parse(parameterList);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0079, code lost:
    
        throw new korex.activation.MimeTypeParseException("Couldn't find the '=' that separates a parameter name from its value.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x016f, code lost:
    
        if (r8 >= r0) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x017b, code lost:
    
        throw new korex.activation.MimeTypeParseException("More characters encountered in input than expected.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x017c, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void parse(java.lang.String r6) throws korex.activation.MimeTypeParseException {
        /*
            Method dump skipped, instructions count: 381
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: korex.activation.MimeTypeParameterList.parse(java.lang.String):void");
    }

    public int size() {
        return this.parameters.size();
    }

    public boolean isEmpty() {
        return this.parameters.isEmpty();
    }

    public String get(String name) {
        return (String) this.parameters.get(name.trim().toLowerCase());
    }

    public void set(String name, String value) {
        this.parameters.put(name.trim().toLowerCase(), value);
    }

    public void remove(String name) {
        this.parameters.remove(name.trim().toLowerCase());
    }

    public Enumeration getNames() {
        return this.parameters.keys();
    }

    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.ensureCapacity(this.parameters.size() * 16);
        Enumeration keys = this.parameters.keys();
        while (keys.hasMoreElements()) {
            String key = (String) keys.nextElement();
            buffer.append("; ");
            buffer.append(key);
            buffer.append('=');
            buffer.append(quote((String) this.parameters.get(key)));
        }
        return buffer.toString();
    }

    private static boolean isTokenChar(char c) {
        return c > ' ' && c < 127 && TSPECIALS.indexOf(c) < 0;
    }

    private static int skipWhiteSpace(String rawdata, int i) {
        int length = rawdata.length();
        while (i < length && Character.isWhitespace(rawdata.charAt(i))) {
            i++;
        }
        return i;
    }

    private static String quote(String value) {
        boolean needsQuotes = false;
        int length = value.length();
        for (int i = 0; i < length && !needsQuotes; i++) {
            needsQuotes = !isTokenChar(value.charAt(i));
        }
        if (needsQuotes) {
            StringBuffer buffer = new StringBuffer();
            buffer.ensureCapacity((int) (length * 1.5d));
            buffer.append('\"');
            for (int i2 = 0; i2 < length; i2++) {
                char c = value.charAt(i2);
                if (c == '\\' || c == '\"') {
                    buffer.append('\\');
                }
                buffer.append(c);
            }
            buffer.append('\"');
            return buffer.toString();
        }
        return value;
    }

    private static String unquote(String value) {
        int valueLength = value.length();
        StringBuffer buffer = new StringBuffer();
        buffer.ensureCapacity(valueLength);
        boolean escaped = false;
        for (int i = 0; i < valueLength; i++) {
            char currentChar = value.charAt(i);
            if (!escaped && currentChar != '\\') {
                buffer.append(currentChar);
            } else if (escaped) {
                buffer.append(currentChar);
                escaped = false;
            } else {
                escaped = true;
            }
        }
        return buffer.toString();
    }
}
