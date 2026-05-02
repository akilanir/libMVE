package com.mongodb.util;

import com.mongodb.Bytes;
import org.bson.BSONCallback;

/* compiled from: JSON.java */
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/JSONParser.class */
class JSONParser {
    String s;
    int pos;
    BSONCallback _callback;

    public JSONParser(String s) {
        this(s, null);
    }

    public JSONParser(String s, BSONCallback callback) {
        this.pos = 0;
        this.s = s;
        this._callback = callback == null ? new JSONCallback() : callback;
    }

    public Object parse() {
        return parse(null);
    }

    protected Object parse(String name) {
        Object value;
        char current = get();
        switch (current) {
            case '\"':
            case '\'':
                value = parseString(true);
                break;
            case '#':
            case '$':
            case '%':
            case '&':
            case '(':
            case ')':
            case '*':
            case ',':
            case '.':
            case '/':
            case ':':
            case ';':
            case '<':
            case '=':
            case '>':
            case '?':
            case Bytes.QUERYOPTION_EXHAUST /* 64 */:
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '\\':
            case ']':
            case '^':
            case '_':
            case '`':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
            default:
                throw new JSONParseException(this.s, this.pos);
            case '+':
            case '-':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                value = parseNumber();
                break;
            case 'N':
                read('N');
                read('a');
                read('N');
                value = Double.valueOf(Double.NaN);
                break;
            case '[':
                value = parseArray(name);
                break;
            case 'f':
                read('f');
                read('a');
                read('l');
                read('s');
                read('e');
                value = false;
                break;
            case 'n':
                read('n');
                read('u');
                read('l');
                read('l');
                value = null;
                break;
            case 't':
                read('t');
                read('r');
                read('u');
                read('e');
                value = true;
                break;
            case '{':
                value = parseObject(name);
                break;
        }
        return value;
    }

    public Object parseObject() {
        return parseObject(null);
    }

    protected Object parseObject(String name) {
        if (name != null) {
            this._callback.objectStart(name);
        } else {
            this._callback.objectStart();
        }
        read('{');
        get();
        while (get() != '}') {
            String key = parseString(false);
            read(':');
            Object value = parse(key);
            doCallback(key, value);
            if (get() != ',') {
                break;
            }
            read(',');
        }
        read('}');
        return this._callback.objectDone();
    }

    protected void doCallback(String name, Object value) {
        if (value == null) {
            this._callback.gotNull(name);
            return;
        }
        if (value instanceof String) {
            this._callback.gotString(name, (String) value);
            return;
        }
        if (value instanceof Boolean) {
            this._callback.gotBoolean(name, ((Boolean) value).booleanValue());
            return;
        }
        if (value instanceof Integer) {
            this._callback.gotInt(name, ((Integer) value).intValue());
        } else if (value instanceof Long) {
            this._callback.gotLong(name, ((Long) value).longValue());
        } else if (value instanceof Double) {
            this._callback.gotDouble(name, ((Double) value).doubleValue());
        }
    }

    public void read(char ch) {
        if (!check(ch)) {
            throw new JSONParseException(this.s, this.pos);
        }
        this.pos++;
    }

    public char read() {
        if (this.pos >= this.s.length()) {
            throw new IllegalStateException("string done");
        }
        String str = this.s;
        int i = this.pos;
        this.pos = i + 1;
        return str.charAt(i);
    }

    public void readHex() {
        if (this.pos < this.s.length() && ((this.s.charAt(this.pos) >= '0' && this.s.charAt(this.pos) <= '9') || ((this.s.charAt(this.pos) >= 'A' && this.s.charAt(this.pos) <= 'F') || (this.s.charAt(this.pos) >= 'a' && this.s.charAt(this.pos) <= 'f')))) {
            this.pos++;
            return;
        }
        throw new JSONParseException(this.s, this.pos);
    }

    public boolean check(char ch) {
        return get() == ch;
    }

    public void skipWS() {
        while (this.pos < this.s.length() && Character.isWhitespace(this.s.charAt(this.pos))) {
            this.pos++;
        }
    }

    public char get() {
        skipWS();
        if (this.pos < this.s.length()) {
            return this.s.charAt(this.pos);
        }
        return (char) 65535;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x01bb  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0197 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0087 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String parseString(boolean r7) {
        /*
            Method dump skipped, instructions count: 454
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mongodb.util.JSONParser.parseString(boolean):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x00da A[Catch: NumberFormatException -> 0x011f, TryCatch #0 {NumberFormatException -> 0x011f, blocks: (B:17:0x00da, B:19:0x00ea, B:21:0x0107, B:23:0x0113), top: B:30:0x00d7 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00ea A[Catch: NumberFormatException -> 0x011f, TRY_ENTER, TryCatch #0 {NumberFormatException -> 0x011f, blocks: (B:17:0x00da, B:19:0x00ea, B:21:0x0107, B:23:0x0113), top: B:30:0x00d7 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Number parseNumber() {
        /*
            r6 = this;
            r0 = r6
            char r0 = r0.get()
            r7 = r0
            r0 = r6
            int r0 = r0.pos
            r8 = r0
            r0 = 0
            r9 = r0
            r0 = r6
            r1 = 45
            boolean r0 = r0.check(r1)
            if (r0 != 0) goto L1e
            r0 = r6
            r1 = 43
            boolean r0 = r0.check(r1)
            if (r0 == 0) goto L28
        L1e:
            r0 = r6
            r1 = r0
            int r1 = r1.pos
            r2 = 1
            int r1 = r1 + r2
            r0.pos = r1
        L28:
            r0 = r6
            int r0 = r0.pos
            r1 = r6
            java.lang.String r1 = r1.s
            int r1 = r1.length()
            if (r0 >= r1) goto Ld6
            r0 = r6
            java.lang.String r0 = r0.s
            r1 = r6
            int r1 = r1.pos
            char r0 = r0.charAt(r1)
            switch(r0) {
                case 46: goto Lc1;
                case 48: goto Lb4;
                case 49: goto Lb4;
                case 50: goto Lb4;
                case 51: goto Lb4;
                case 52: goto Lb4;
                case 53: goto Lb4;
                case 54: goto Lb4;
                case 55: goto Lb4;
                case 56: goto Lb4;
                case 57: goto Lb4;
                case 69: goto Lca;
                case 101: goto Lca;
                default: goto Ld3;
            }
        Lb4:
            r0 = r6
            r1 = r0
            int r1 = r1.pos
            r2 = 1
            int r1 = r1 + r2
            r0.pos = r1
            goto L28
        Lc1:
            r0 = 1
            r9 = r0
            r0 = r6
            r0.parseFraction()
            goto L28
        Lca:
            r0 = 1
            r9 = r0
            r0 = r6
            r0.parseExponent()
            goto L28
        Ld3:
            goto Ld6
        Ld6:
            r0 = r9
            if (r0 == 0) goto Lea
            r0 = r6
            java.lang.String r0 = r0.s     // Catch: java.lang.NumberFormatException -> L11f
            r1 = r8
            r2 = r6
            int r2 = r2.pos     // Catch: java.lang.NumberFormatException -> L11f
            java.lang.String r0 = r0.substring(r1, r2)     // Catch: java.lang.NumberFormatException -> L11f
            java.lang.Double r0 = java.lang.Double.valueOf(r0)     // Catch: java.lang.NumberFormatException -> L11f
            return r0
        Lea:
            r0 = r6
            java.lang.String r0 = r0.s     // Catch: java.lang.NumberFormatException -> L11f
            r1 = r8
            r2 = r6
            int r2 = r2.pos     // Catch: java.lang.NumberFormatException -> L11f
            java.lang.String r0 = r0.substring(r1, r2)     // Catch: java.lang.NumberFormatException -> L11f
            java.lang.Long r0 = java.lang.Long.valueOf(r0)     // Catch: java.lang.NumberFormatException -> L11f
            r10 = r0
            r0 = r10
            long r0 = r0.longValue()     // Catch: java.lang.NumberFormatException -> L11f
            r1 = 2147483647(0x7fffffff, double:1.060997895E-314)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 > 0) goto L11c
            r0 = r10
            long r0 = r0.longValue()     // Catch: java.lang.NumberFormatException -> L11f
            r1 = -2147483648(0xffffffff80000000, double:NaN)
            int r0 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r0 < 0) goto L11c
            r0 = r10
            int r0 = r0.intValue()     // Catch: java.lang.NumberFormatException -> L11f
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)     // Catch: java.lang.NumberFormatException -> L11f
            return r0
        L11c:
            r0 = r10
            return r0
        L11f:
            r10 = move-exception
            com.mongodb.util.JSONParseException r0 = new com.mongodb.util.JSONParseException
            r1 = r0
            r2 = r6
            java.lang.String r2 = r2.s
            r3 = r8
            r4 = r10
            r1.<init>(r2, r3, r4)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.mongodb.util.JSONParser.parseNumber():java.lang.Number");
    }

    public void parseFraction() {
        this.pos++;
        while (this.pos < this.s.length()) {
            switch (this.s.charAt(this.pos)) {
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    this.pos++;
                    break;
                case 'E':
                case 'e':
                    parseExponent();
                    break;
                default:
                    return;
            }
        }
    }

    public void parseExponent() {
        this.pos++;
        if (check('-') || check('+')) {
            this.pos++;
        }
        while (this.pos < this.s.length()) {
            switch (this.s.charAt(this.pos)) {
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    this.pos++;
                default:
                    return;
            }
        }
    }

    public Object parseArray() {
        return parseArray(null);
    }

    protected Object parseArray(String name) {
        if (name != null) {
            this._callback.arrayStart(name);
        } else {
            this._callback.arrayStart();
        }
        read('[');
        int i = 0;
        char current = get();
        while (true) {
            if (current == ']') {
                break;
            }
            int i2 = i;
            i++;
            String elemName = String.valueOf(i2);
            Object elem = parse(elemName);
            doCallback(elemName, elem);
            char c = get();
            current = c;
            if (c == ',') {
                read(',');
            } else if (current != ']') {
                throw new JSONParseException(this.s, this.pos);
            }
        }
        read(']');
        return this._callback.arrayDone();
    }
}
