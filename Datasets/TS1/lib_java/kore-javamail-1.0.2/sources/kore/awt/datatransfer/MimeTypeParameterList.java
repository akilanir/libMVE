package kore.awt.datatransfer;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;

/* loaded from: kore-javamail-1.0.2.jar:kore/awt/datatransfer/MimeTypeParameterList.class */
class MimeTypeParameterList implements Cloneable {
    private Hashtable parameters = new Hashtable();
    private static final String TSPECIALS = "()<>@,;:\\\"/[]?=";

    public MimeTypeParameterList() {
    }

    public MimeTypeParameterList(String rawdata) throws MimeTypeParseException {
        parse(rawdata);
    }

    public int hashCode() {
        int code = 47721858;
        Enumeration enum_ = getNames();
        while (enum_.hasMoreElements()) {
            String paramName = (String) enum_.nextElement();
            code = code + paramName.hashCode() + get(paramName).hashCode();
        }
        return code;
    }

    public boolean equals(Object thatObject) {
        if (!(thatObject instanceof MimeTypeParameterList)) {
            return false;
        }
        MimeTypeParameterList that = (MimeTypeParameterList) thatObject;
        if (size() != that.size()) {
            return false;
        }
        Set<Map.Entry> entries = this.parameters.entrySet();
        for (Map.Entry entry : entries) {
            String name = (String) entry.getKey();
            String thisValue = (String) entry.getValue();
            String thatValue = (String) that.parameters.get(name);
            if (thisValue == null || thatValue == null) {
                if (thisValue != thatValue) {
                    return false;
                }
            } else if (!thisValue.equals(thatValue)) {
                return false;
            }
        }
        return true;
    }

    protected void parse(String rawdata) throws MimeTypeParseException {
        String value;
        int length = rawdata.length();
        if (length > 0) {
            int currentIndex = skipWhiteSpace(rawdata, 0);
            if (currentIndex < length) {
                char currentChar = rawdata.charAt(currentIndex);
                while (currentIndex < length && currentChar == ';') {
                    int currentIndex2 = skipWhiteSpace(rawdata, currentIndex + 1);
                    if (currentIndex2 < length) {
                        char charAt = rawdata.charAt(currentIndex2);
                        while (true) {
                            char currentChar2 = charAt;
                            if (currentIndex2 >= length || !isTokenChar(currentChar2)) {
                                break;
                            }
                            currentIndex2++;
                            charAt = rawdata.charAt(currentIndex2);
                        }
                        String name = rawdata.substring(currentIndex2, currentIndex2).toLowerCase();
                        int currentIndex3 = skipWhiteSpace(rawdata, currentIndex2);
                        if (currentIndex3 < length && rawdata.charAt(currentIndex3) == '=') {
                            int currentIndex4 = skipWhiteSpace(rawdata, currentIndex3 + 1);
                            if (currentIndex4 < length) {
                                currentChar = rawdata.charAt(currentIndex4);
                                if (currentChar == '\"') {
                                    int currentIndex5 = currentIndex4 + 1;
                                    if (currentIndex5 < length) {
                                        boolean foundit = false;
                                        while (currentIndex5 < length && !foundit) {
                                            currentChar = rawdata.charAt(currentIndex5);
                                            if (currentChar == '\\') {
                                                currentIndex5 += 2;
                                            } else if (currentChar == '\"') {
                                                foundit = true;
                                            } else {
                                                currentIndex5++;
                                            }
                                        }
                                        if (currentChar == '\"') {
                                            value = unquote(rawdata.substring(currentIndex5, currentIndex5));
                                            currentIndex4 = currentIndex5 + 1;
                                        } else {
                                            throw new MimeTypeParseException("Encountered unterminated quoted parameter value.");
                                        }
                                    } else {
                                        throw new MimeTypeParseException("Encountered unterminated quoted parameter value.");
                                    }
                                } else if (isTokenChar(currentChar)) {
                                    boolean foundit2 = false;
                                    while (currentIndex4 < length && !foundit2) {
                                        currentChar = rawdata.charAt(currentIndex4);
                                        if (isTokenChar(currentChar)) {
                                            currentIndex4++;
                                        } else {
                                            foundit2 = true;
                                        }
                                    }
                                    value = rawdata.substring(currentIndex4, currentIndex4);
                                } else {
                                    throw new MimeTypeParseException("Unexpected character encountered at index " + currentIndex4);
                                }
                                this.parameters.put(name, value);
                                currentIndex = skipWhiteSpace(rawdata, currentIndex4);
                                if (currentIndex < length) {
                                    currentChar = rawdata.charAt(currentIndex);
                                }
                            } else {
                                throw new MimeTypeParseException("Couldn't find a value for parameter named " + name);
                            }
                        } else {
                            throw new MimeTypeParseException("Couldn't find the '=' that separates a parameter name from its value.");
                        }
                    } else {
                        throw new MimeTypeParseException("Couldn't find parameter name");
                    }
                }
                if (currentIndex < length) {
                    throw new MimeTypeParseException("More characters encountered in input than expected.");
                }
            }
        }
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
        StringBuilder buffer = new StringBuilder(this.parameters.size() * 16);
        Enumeration keys = this.parameters.keys();
        while (keys.hasMoreElements()) {
            buffer.append("; ");
            String key = (String) keys.nextElement();
            buffer.append(key);
            buffer.append('=');
            buffer.append(quote((String) this.parameters.get(key)));
        }
        return buffer.toString();
    }

    public Object clone() {
        MimeTypeParameterList newObj = null;
        try {
            newObj = (MimeTypeParameterList) super.clone();
        } catch (CloneNotSupportedException e) {
        }
        newObj.parameters = (Hashtable) this.parameters.clone();
        return newObj;
    }

    private static boolean isTokenChar(char c) {
        return c > ' ' && c < 127 && TSPECIALS.indexOf(c) < 0;
    }

    private static int skipWhiteSpace(String rawdata, int i) {
        int length = rawdata.length();
        if (i < length) {
            char charAt = rawdata.charAt(i);
            while (true) {
                char c = charAt;
                if (i >= length || !Character.isWhitespace(c)) {
                    break;
                }
                i++;
                charAt = rawdata.charAt(i);
            }
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
            StringBuilder buffer = new StringBuilder((int) (length * 1.5d));
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
        StringBuilder buffer = new StringBuilder(valueLength);
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
