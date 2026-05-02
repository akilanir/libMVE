package com.alibaba.fastjson.parser;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.asm.Opcodes;
import com.alibaba.fastjson.util.IOUtils;
import java.io.Closeable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Collection;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/JSONLexerBase.class */
public abstract class JSONLexerBase implements JSONLexer, Closeable {
    protected int token;
    protected int pos;
    protected int features;
    protected char ch;
    protected int bp;
    protected int eofPos;
    protected char[] sbuf;
    protected int sp;
    protected int np;
    protected boolean hasSpecial;
    protected Calendar calendar = null;
    protected TimeZone timeZone = JSON.defaultTimeZone;
    protected Locale locale = JSON.defaultLocale;
    public int matchStat = 0;
    protected String stringDefaultValue;
    protected static final long MULTMIN_RADIX_TEN = -922337203685477580L;
    protected static final int INT_MULTMIN_RADIX_TEN = -214748364;
    private static final ThreadLocal<char[]> SBUF_LOCAL = new ThreadLocal<>();
    protected static final char[] typeFieldName = ("\"" + JSON.DEFAULT_TYPE_KEY + "\":\"").toCharArray();
    protected static final int[] digits = new int[103];

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public abstract String numberString();

    public abstract boolean isEOF();

    public abstract char charAt(int i);

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public abstract char next();

    protected abstract void arrayCopy(int i, char[] cArr, int i2, int i3);

    protected abstract void copyTo(int i, int i2, char[] cArr);

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public abstract byte[] bytesValue();

    public abstract int indexOf(char c, int i);

    public abstract String addSymbol(int i, int i2, int i3, SymbolTable symbolTable);

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public abstract String stringVal();

    public abstract String subString(int i, int i2);

    protected abstract char[] sub_chars(int i, int i2);

    protected abstract boolean charArrayCompare(char[] cArr);

    protected void lexError(String key, Object... args) {
        this.token = 1;
    }

    static {
        for (int i = 48; i <= 57; i++) {
            digits[i] = i - 48;
        }
        for (int i2 = 97; i2 <= 102; i2++) {
            digits[i2] = (i2 - 97) + 10;
        }
        for (int i3 = 65; i3 <= 70; i3++) {
            digits[i3] = (i3 - 65) + 10;
        }
    }

    public JSONLexerBase(int features) {
        this.stringDefaultValue = null;
        this.features = features;
        if ((features & Feature.InitStringFieldAsEmpty.mask) != 0) {
            this.stringDefaultValue = "";
        }
        this.sbuf = SBUF_LOCAL.get();
        if (this.sbuf == null) {
            this.sbuf = new char[512];
        }
    }

    public final int matchStat() {
        return this.matchStat;
    }

    public void setToken(int token) {
        this.token = token;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void nextToken() {
        this.sp = 0;
        while (true) {
            this.pos = this.bp;
            if (this.ch == '/') {
                skipComment();
            } else {
                if (this.ch == '\"') {
                    scanString();
                    return;
                }
                if (this.ch == ',') {
                    next();
                    this.token = 16;
                    return;
                }
                if (this.ch >= '0' && this.ch <= '9') {
                    scanNumber();
                    return;
                }
                if (this.ch == '-') {
                    scanNumber();
                    return;
                }
                switch (this.ch) {
                    case JSONToken.NULL /* 8 */:
                    case '\t':
                    case '\n':
                    case JSONToken.LBRACE /* 12 */:
                    case JSONToken.RBRACE /* 13 */:
                    case Opcodes.ACC_SUPER /* 32 */:
                        next();
                        break;
                    case '\'':
                        if (!isEnabled(Feature.AllowSingleQuotes)) {
                            throw new JSONException("Feature.AllowSingleQuotes is false");
                        }
                        scanStringSingleQuote();
                        return;
                    case '(':
                        next();
                        this.token = 10;
                        return;
                    case ')':
                        next();
                        this.token = 11;
                        return;
                    case Opcodes.ASTORE /* 58 */:
                        next();
                        this.token = 17;
                        return;
                    case 'N':
                    case 'S':
                    case 'T':
                    case 'u':
                        scanIdent();
                        return;
                    case '[':
                        next();
                        this.token = 14;
                        return;
                    case ']':
                        next();
                        this.token = 15;
                        return;
                    case 'f':
                        scanFalse();
                        return;
                    case 'n':
                        scanNullOrNew();
                        return;
                    case 't':
                        scanTrue();
                        return;
                    case '{':
                        next();
                        this.token = 12;
                        return;
                    case '}':
                        next();
                        this.token = 13;
                        return;
                    default:
                        if (isEOF()) {
                            if (this.token == 20) {
                                throw new JSONException("EOF error");
                            }
                            this.token = 20;
                            int i = this.eofPos;
                            this.bp = i;
                            this.pos = i;
                            return;
                        }
                        if (this.ch <= 31 || this.ch == 127) {
                            next();
                            break;
                        } else {
                            lexError("illegal.char", String.valueOf((int) this.ch));
                            next();
                            return;
                        }
                }
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01df A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0221 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01f4  */
    @Override // com.alibaba.fastjson.parser.JSONLexer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void nextToken(int r4) {
        /*
            Method dump skipped, instructions count: 561
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.parser.JSONLexerBase.nextToken(int):void");
    }

    public final void nextIdent() {
        while (isWhitespace(this.ch)) {
            next();
        }
        if (this.ch == '_' || Character.isLetter(this.ch)) {
            scanIdent();
        } else {
            nextToken();
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void nextTokenWithColon() {
        nextTokenWithChar(':');
    }

    public final void nextTokenWithChar(char expect) {
        this.sp = 0;
        while (this.ch != expect) {
            if (this.ch == ' ' || this.ch == '\n' || this.ch == '\r' || this.ch == '\t' || this.ch == '\f' || this.ch == '\b') {
                next();
            } else {
                throw new JSONException("not match " + expect + " - " + this.ch);
            }
        }
        next();
        nextToken();
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final int token() {
        return this.token;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final String tokenName() {
        return JSONToken.name(this.token);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final int pos() {
        return this.pos;
    }

    public final String stringDefaultValue() {
        return this.stringDefaultValue;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final Number integerValue() throws NumberFormatException {
        long limit;
        long result = 0;
        boolean negative = false;
        if (this.np == -1) {
            this.np = 0;
        }
        int i = this.np;
        int max = this.np + this.sp;
        char type = ' ';
        switch (charAt(max - 1)) {
            case 'B':
                max--;
                type = 'B';
                break;
            case 'L':
                max--;
                type = 'L';
                break;
            case 'S':
                max--;
                type = 'S';
                break;
        }
        if (charAt(this.np) == '-') {
            negative = true;
            limit = Long.MIN_VALUE;
            i++;
        } else {
            limit = -9223372036854775807L;
        }
        if (i < max) {
            int i2 = i;
            i++;
            result = -(charAt(i2) - '0');
        }
        while (i < max) {
            int i3 = i;
            i++;
            int digit = charAt(i3) - '0';
            if (result < MULTMIN_RADIX_TEN) {
                return new BigInteger(numberString());
            }
            long result2 = result * 10;
            if (result2 < limit + digit) {
                return new BigInteger(numberString());
            }
            result = result2 - digit;
        }
        if (negative) {
            if (i <= this.np + 1) {
                throw new NumberFormatException(numberString());
            }
            if (result >= -2147483648L && type != 'L') {
                if (type == 'S') {
                    return Short.valueOf((short) result);
                }
                if (type == 'B') {
                    return Byte.valueOf((byte) result);
                }
                return Integer.valueOf((int) result);
            }
            return Long.valueOf(result);
        }
        long result3 = -result;
        if (result3 <= 2147483647L && type != 'L') {
            if (type == 'S') {
                return Short.valueOf((short) result3);
            }
            if (type == 'B') {
                return Byte.valueOf((byte) result3);
            }
            return Integer.valueOf((int) result3);
        }
        return Long.valueOf(result3);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void nextTokenWithColon(int expect) {
        nextTokenWithChar(':');
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public float floatValue() {
        return Float.parseFloat(numberString());
    }

    public double doubleValue() {
        return Double.parseDouble(numberString());
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public void config(Feature feature, boolean state) {
        this.features = Feature.config(this.features, feature, state);
        if ((this.features & Feature.InitStringFieldAsEmpty.mask) != 0) {
            this.stringDefaultValue = "";
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final boolean isEnabled(Feature feature) {
        return isEnabled(feature.mask);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final boolean isEnabled(int feature) {
        return (this.features & feature) != 0;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final char getCurrent() {
        return this.ch;
    }

    protected void skipComment() {
        next();
        if (this.ch == '/') {
            do {
                next();
            } while (this.ch != '\n');
            next();
        } else {
            if (this.ch == '*') {
                next();
                while (this.ch != 26) {
                    if (this.ch == '*') {
                        next();
                        if (this.ch == '/') {
                            next();
                            return;
                        }
                    } else {
                        next();
                    }
                }
                return;
            }
            throw new JSONException("invalid comment");
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final String scanSymbol(SymbolTable symbolTable) {
        skipWhitespace();
        if (this.ch == '\"') {
            return scanSymbol(symbolTable, '\"');
        }
        if (this.ch == '\'') {
            if (!isEnabled(Feature.AllowSingleQuotes)) {
                throw new JSONException("syntax error");
            }
            return scanSymbol(symbolTable, '\'');
        }
        if (this.ch == '}') {
            next();
            this.token = 13;
            return null;
        }
        if (this.ch == ',') {
            next();
            this.token = 16;
            return null;
        }
        if (this.ch == 26) {
            this.token = 20;
            return null;
        }
        if (!isEnabled(Feature.AllowUnQuotedFieldNames)) {
            throw new JSONException("syntax error");
        }
        return scanSymbolUnQuoted(symbolTable);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final String scanSymbol(SymbolTable symbolTable, char quote) {
        String value;
        int offset;
        int hash = 0;
        this.np = this.bp;
        this.sp = 0;
        boolean hasSpecial = false;
        while (true) {
            char chLocal = next();
            if (chLocal != quote) {
                if (chLocal == 26) {
                    throw new JSONException("unclosed.str");
                }
                if (chLocal == '\\') {
                    if (!hasSpecial) {
                        hasSpecial = true;
                        if (this.sp >= this.sbuf.length) {
                            int newCapcity = this.sbuf.length * 2;
                            if (this.sp > newCapcity) {
                                newCapcity = this.sp;
                            }
                            char[] newsbuf = new char[newCapcity];
                            System.arraycopy(this.sbuf, 0, newsbuf, 0, this.sbuf.length);
                            this.sbuf = newsbuf;
                        }
                        arrayCopy(this.np + 1, this.sbuf, 0, this.sp);
                    }
                    char chLocal2 = next();
                    switch (chLocal2) {
                        case '\"':
                            hash = (31 * hash) + 34;
                            putChar('\"');
                            break;
                        case '#':
                        case '$':
                        case '%':
                        case '&':
                        case '(':
                        case ')':
                        case '*':
                        case '+':
                        case ',':
                        case '-':
                        case '.':
                        case Opcodes.FSTORE /* 56 */:
                        case Opcodes.DSTORE /* 57 */:
                        case Opcodes.ASTORE /* 58 */:
                        case ';':
                        case '<':
                        case '=':
                        case '>':
                        case '?':
                        case '@':
                        case 'A':
                        case 'B':
                        case 'C':
                        case 'D':
                        case 'E':
                        case 'G':
                        case 'H':
                        case 'I':
                        case 'J':
                        case 'K':
                        case 'L':
                        case 'M':
                        case 'N':
                        case 'O':
                        case 'P':
                        case 'Q':
                        case 'R':
                        case 'S':
                        case 'T':
                        case 'U':
                        case 'V':
                        case Opcodes.POP /* 87 */:
                        case 'X':
                        case Opcodes.DUP /* 89 */:
                        case 'Z':
                        case '[':
                        case ']':
                        case '^':
                        case '_':
                        case Opcodes.IADD /* 96 */:
                        case 'a':
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
                        case 's':
                        case 'w':
                        default:
                            this.ch = chLocal2;
                            throw new JSONException("unclosed.str.lit");
                        case '\'':
                            hash = (31 * hash) + 39;
                            putChar('\'');
                            break;
                        case '/':
                            hash = (31 * hash) + 47;
                            putChar('/');
                            break;
                        case '0':
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 0);
                            break;
                        case Opcodes.V1_5 /* 49 */:
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 1);
                            break;
                        case '2':
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 2);
                            break;
                        case '3':
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 3);
                            break;
                        case '4':
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 4);
                            break;
                        case '5':
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 5);
                            break;
                        case Opcodes.ISTORE /* 54 */:
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 6);
                            break;
                        case Opcodes.LSTORE /* 55 */:
                            hash = (31 * hash) + chLocal2;
                            putChar((char) 7);
                            break;
                        case 'F':
                        case 'f':
                            hash = (31 * hash) + 12;
                            putChar('\f');
                            break;
                        case '\\':
                            hash = (31 * hash) + 92;
                            putChar('\\');
                            break;
                        case 'b':
                            hash = (31 * hash) + 8;
                            putChar('\b');
                            break;
                        case 'n':
                            hash = (31 * hash) + 10;
                            putChar('\n');
                            break;
                        case 'r':
                            hash = (31 * hash) + 13;
                            putChar('\r');
                            break;
                        case 't':
                            hash = (31 * hash) + 9;
                            putChar('\t');
                            break;
                        case 'u':
                            char c1 = next();
                            char c2 = next();
                            char c3 = next();
                            char c4 = next();
                            int val = Integer.parseInt(new String(new char[]{c1, c2, c3, c4}), 16);
                            hash = (31 * hash) + val;
                            putChar((char) val);
                            break;
                        case 'v':
                            hash = (31 * hash) + 11;
                            putChar((char) 11);
                            break;
                        case 'x':
                            char x1 = next();
                            this.ch = x1;
                            char x2 = next();
                            this.ch = x2;
                            int x_val = (digits[x1] * 16) + digits[x2];
                            char x_char = (char) x_val;
                            hash = (31 * hash) + x_char;
                            putChar(x_char);
                            break;
                    }
                } else {
                    hash = (31 * hash) + chLocal;
                    if (!hasSpecial) {
                        this.sp++;
                    } else if (this.sp == this.sbuf.length) {
                        putChar(chLocal);
                    } else {
                        char[] cArr = this.sbuf;
                        int i = this.sp;
                        this.sp = i + 1;
                        cArr[i] = chLocal;
                    }
                }
            } else {
                this.token = 4;
                if (!hasSpecial) {
                    if (this.np == -1) {
                        offset = 0;
                    } else {
                        offset = this.np + 1;
                    }
                    value = addSymbol(offset, this.sp, hash, symbolTable);
                } else {
                    value = symbolTable.addSymbol(this.sbuf, 0, this.sp, hash);
                }
                this.sp = 0;
                next();
                return value;
            }
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void resetStringPosition() {
        this.sp = 0;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public String info() {
        return "";
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final String scanSymbolUnQuoted(SymbolTable symbolTable) {
        boolean[] firstIdentifierFlags = IOUtils.firstIdentifierFlags;
        char first = this.ch;
        boolean firstFlag = this.ch >= firstIdentifierFlags.length || firstIdentifierFlags[first];
        if (!firstFlag) {
            throw new JSONException("illegal identifier : " + this.ch + info());
        }
        boolean[] identifierFlags = IOUtils.identifierFlags;
        int hash = first;
        this.np = this.bp;
        this.sp = 1;
        while (true) {
            char chLocal = next();
            if (chLocal < identifierFlags.length && !identifierFlags[chLocal]) {
                break;
            }
            hash = (31 * hash) + chLocal;
            this.sp++;
        }
        this.ch = charAt(this.bp);
        this.token = 18;
        if (this.sp == 4 && hash == 3392903 && charAt(this.np) == 'n' && charAt(this.np + 1) == 'u' && charAt(this.np + 2) == 'l' && charAt(this.np + 3) == 'l') {
            return null;
        }
        return addSymbol(this.np, this.sp, hash, symbolTable);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void scanString() {
        this.np = this.bp;
        this.hasSpecial = false;
        while (true) {
            char ch = next();
            if (ch != '\"') {
                if (ch == 26) {
                    if (!isEOF()) {
                        putChar((char) 26);
                    } else {
                        throw new JSONException("unclosed string : " + ch);
                    }
                } else if (ch == '\\') {
                    if (!this.hasSpecial) {
                        this.hasSpecial = true;
                        if (this.sp >= this.sbuf.length) {
                            int newCapcity = this.sbuf.length * 2;
                            if (this.sp > newCapcity) {
                                newCapcity = this.sp;
                            }
                            char[] newsbuf = new char[newCapcity];
                            System.arraycopy(this.sbuf, 0, newsbuf, 0, this.sbuf.length);
                            this.sbuf = newsbuf;
                        }
                        copyTo(this.np + 1, this.sp, this.sbuf);
                    }
                    char ch2 = next();
                    switch (ch2) {
                        case '\"':
                            putChar('\"');
                            break;
                        case '#':
                        case '$':
                        case '%':
                        case '&':
                        case '(':
                        case ')':
                        case '*':
                        case '+':
                        case ',':
                        case '-':
                        case '.':
                        case Opcodes.FSTORE /* 56 */:
                        case Opcodes.DSTORE /* 57 */:
                        case Opcodes.ASTORE /* 58 */:
                        case ';':
                        case '<':
                        case '=':
                        case '>':
                        case '?':
                        case '@':
                        case 'A':
                        case 'B':
                        case 'C':
                        case 'D':
                        case 'E':
                        case 'G':
                        case 'H':
                        case 'I':
                        case 'J':
                        case 'K':
                        case 'L':
                        case 'M':
                        case 'N':
                        case 'O':
                        case 'P':
                        case 'Q':
                        case 'R':
                        case 'S':
                        case 'T':
                        case 'U':
                        case 'V':
                        case Opcodes.POP /* 87 */:
                        case 'X':
                        case Opcodes.DUP /* 89 */:
                        case 'Z':
                        case '[':
                        case ']':
                        case '^':
                        case '_':
                        case Opcodes.IADD /* 96 */:
                        case 'a':
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
                        case 's':
                        case 'w':
                        default:
                            this.ch = ch2;
                            throw new JSONException("unclosed string : " + ch2);
                        case '\'':
                            putChar('\'');
                            break;
                        case '/':
                            putChar('/');
                            break;
                        case '0':
                            putChar((char) 0);
                            break;
                        case Opcodes.V1_5 /* 49 */:
                            putChar((char) 1);
                            break;
                        case '2':
                            putChar((char) 2);
                            break;
                        case '3':
                            putChar((char) 3);
                            break;
                        case '4':
                            putChar((char) 4);
                            break;
                        case '5':
                            putChar((char) 5);
                            break;
                        case Opcodes.ISTORE /* 54 */:
                            putChar((char) 6);
                            break;
                        case Opcodes.LSTORE /* 55 */:
                            putChar((char) 7);
                            break;
                        case 'F':
                        case 'f':
                            putChar('\f');
                            break;
                        case '\\':
                            putChar('\\');
                            break;
                        case 'b':
                            putChar('\b');
                            break;
                        case 'n':
                            putChar('\n');
                            break;
                        case 'r':
                            putChar('\r');
                            break;
                        case 't':
                            putChar('\t');
                            break;
                        case 'u':
                            char u1 = next();
                            char u2 = next();
                            char u3 = next();
                            char u4 = next();
                            int val = Integer.parseInt(new String(new char[]{u1, u2, u3, u4}), 16);
                            putChar((char) val);
                            break;
                        case 'v':
                            putChar((char) 11);
                            break;
                        case 'x':
                            char x1 = next();
                            char x2 = next();
                            int x_val = (digits[x1] * 16) + digits[x2];
                            char x_char = (char) x_val;
                            putChar(x_char);
                            break;
                    }
                } else if (!this.hasSpecial) {
                    this.sp++;
                } else if (this.sp == this.sbuf.length) {
                    putChar(ch);
                } else {
                    char[] cArr = this.sbuf;
                    int i = this.sp;
                    this.sp = i + 1;
                    cArr[i] = ch;
                }
            } else {
                this.token = 4;
                this.ch = next();
                return;
            }
        }
    }

    public Calendar getCalendar() {
        return this.calendar;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public TimeZone getTimeZone() {
        return this.timeZone;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public Locale getLocale() {
        return this.locale;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public void setLocale(Locale locale) {
        this.locale = locale;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final int intValue() {
        int limit;
        if (this.np == -1) {
            this.np = 0;
        }
        int result = 0;
        boolean negative = false;
        int i = this.np;
        int max = this.np + this.sp;
        if (charAt(this.np) == '-') {
            negative = true;
            limit = Integer.MIN_VALUE;
            i++;
        } else {
            limit = -2147483647;
        }
        if (i < max) {
            int i2 = i;
            i++;
            result = -(charAt(i2) - '0');
        }
        while (i < max) {
            int i3 = i;
            i++;
            char chLocal = charAt(i3);
            if (chLocal == 'L' || chLocal == 'S' || chLocal == 'B') {
                break;
            }
            int digit = chLocal - '0';
            if (result < -214748364) {
                throw new NumberFormatException(numberString());
            }
            int result2 = result * 10;
            if (result2 < limit + digit) {
                throw new NumberFormatException(numberString());
            }
            result = result2 - digit;
        }
        if (negative) {
            if (i > this.np + 1) {
                return result;
            }
            throw new NumberFormatException(numberString());
        }
        return -result;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.sbuf.length <= 8192) {
            SBUF_LOCAL.set(this.sbuf);
        }
        this.sbuf = null;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final boolean isRef() {
        return this.sp == 4 && charAt(this.np + 1) == '$' && charAt(this.np + 2) == 'r' && charAt(this.np + 3) == 'e' && charAt(this.np + 4) == 'f';
    }

    public final int scanType(String type) {
        this.matchStat = 0;
        if (!charArrayCompare(typeFieldName)) {
            return -2;
        }
        int bpLocal = this.bp + typeFieldName.length;
        int typeLength = type.length();
        for (int i = 0; i < typeLength; i++) {
            if (type.charAt(i) != charAt(bpLocal + i)) {
                return -1;
            }
        }
        int bpLocal2 = bpLocal + typeLength;
        if (charAt(bpLocal2) != '\"') {
            return -1;
        }
        int bpLocal3 = bpLocal2 + 1;
        this.ch = charAt(bpLocal3);
        if (this.ch == ',') {
            int bpLocal4 = bpLocal3 + 1;
            this.ch = charAt(bpLocal4);
            this.bp = bpLocal4;
            this.token = 16;
            return 3;
        }
        if (this.ch == '}') {
            bpLocal3++;
            this.ch = charAt(bpLocal3);
            if (this.ch == ',') {
                this.token = 16;
                bpLocal3++;
                this.ch = charAt(bpLocal3);
            } else if (this.ch == ']') {
                this.token = 15;
                bpLocal3++;
                this.ch = charAt(bpLocal3);
            } else if (this.ch == '}') {
                this.token = 13;
                bpLocal3++;
                this.ch = charAt(bpLocal3);
            } else if (this.ch == 26) {
                this.token = 20;
            } else {
                return -1;
            }
            this.matchStat = 4;
        }
        this.bp = bpLocal3;
        return this.matchStat;
    }

    public final boolean matchField(char[] fieldName) {
        if (!charArrayCompare(fieldName)) {
            return false;
        }
        this.bp += fieldName.length;
        this.ch = charAt(this.bp);
        if (this.ch == '{') {
            next();
            this.token = 12;
            return true;
        }
        if (this.ch == '[') {
            next();
            this.token = 14;
            return true;
        }
        if (this.ch == 'S' && charAt(this.bp + 1) == 'e' && charAt(this.bp + 2) == 't' && charAt(this.bp + 3) == '[') {
            this.bp += 3;
            this.ch = charAt(this.bp);
            this.token = 21;
            return true;
        }
        nextToken();
        return true;
    }

    public String scanFieldString(char[] fieldName) {
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return stringDefaultValue();
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        if (charAt(this.bp + offset) != '\"') {
            this.matchStat = -1;
            return stringDefaultValue();
        }
        int startIndex = this.bp + fieldName.length + 1;
        int endIndex = indexOf('\"', startIndex);
        if (endIndex == -1) {
            throw new JSONException("unclosed str");
        }
        int startIndex2 = this.bp + fieldName.length + 1;
        String stringVal = subString(startIndex2, endIndex - startIndex2);
        if (stringVal.indexOf(92) != -1) {
            while (true) {
                int slashCount = 0;
                for (int i = endIndex - 1; i >= 0 && charAt(i) == '\\'; i--) {
                    slashCount++;
                }
                if (slashCount % 2 == 0) {
                    break;
                }
                endIndex = indexOf('\"', endIndex + 1);
            }
            int chars_len = endIndex - ((this.bp + fieldName.length) + 1);
            char[] chars = sub_chars(this.bp + fieldName.length + 1, chars_len);
            stringVal = readString(chars, chars_len);
        }
        int offset3 = offset2 + (endIndex - ((this.bp + fieldName.length) + 1)) + 1;
        int offset4 = offset3 + 1;
        char chLocal = charAt(this.bp + offset3);
        String strVal = stringVal;
        if (chLocal == ',') {
            this.bp += offset4;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            return strVal;
        }
        if (chLocal == '}') {
            int offset5 = offset4 + 1;
            char chLocal2 = charAt(this.bp + offset4);
            if (chLocal2 == ',') {
                this.token = 16;
                this.bp += offset5;
                this.ch = charAt(this.bp);
            } else if (chLocal2 == ']') {
                this.token = 15;
                this.bp += offset5;
                this.ch = charAt(this.bp);
            } else if (chLocal2 == '}') {
                this.token = 13;
                this.bp += offset5;
                this.ch = charAt(this.bp);
            } else if (chLocal2 == 26) {
                this.token = 20;
                this.bp += offset5 - 1;
                this.ch = (char) 26;
            } else {
                this.matchStat = -1;
                return stringDefaultValue();
            }
            this.matchStat = 4;
            return strVal;
        }
        this.matchStat = -1;
        return stringDefaultValue();
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public String scanString(char expectNextChar) {
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal = charAt(this.bp + 0);
        if (chLocal == 'n') {
            if (charAt(this.bp + offset) == 'u' && charAt(this.bp + offset + 1) == 'l' && charAt(this.bp + offset + 2) == 'l') {
                int offset2 = offset + 3;
                int offset3 = offset2 + 1;
                if (charAt(this.bp + offset2) == expectNextChar) {
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                    this.matchStat = 3;
                    return null;
                }
                this.matchStat = -1;
                return null;
            }
            this.matchStat = -1;
            return null;
        }
        if (chLocal != '\"') {
            this.matchStat = -1;
            return stringDefaultValue();
        }
        int startIndex = this.bp + 1;
        int endIndex = indexOf('\"', startIndex);
        if (endIndex == -1) {
            throw new JSONException("unclosed str");
        }
        String stringVal = subString(this.bp + 1, endIndex - startIndex);
        if (stringVal.indexOf(92) != -1) {
            while (true) {
                int slashCount = 0;
                for (int i = endIndex - 1; i >= 0 && charAt(i) == '\\'; i--) {
                    slashCount++;
                }
                if (slashCount % 2 == 0) {
                    break;
                }
                endIndex = indexOf('\"', endIndex + 1);
            }
            int chars_len = endIndex - startIndex;
            char[] chars = sub_chars(this.bp + 1, chars_len);
            stringVal = readString(chars, chars_len);
        }
        int offset4 = offset + (endIndex - (this.bp + 1)) + 1;
        int offset5 = offset4 + 1;
        char chLocal2 = charAt(this.bp + offset4);
        String strVal = stringVal;
        if (chLocal2 == expectNextChar) {
            this.bp += offset5;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            return strVal;
        }
        this.matchStat = -1;
        return strVal;
    }

    public String scanFieldSymbol(char[] fieldName, SymbolTable symbolTable) {
        char chLocal;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return null;
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        if (charAt(this.bp + offset) != '\"') {
            this.matchStat = -1;
            return null;
        }
        int hash = 0;
        do {
            int i = offset2;
            offset2++;
            chLocal = charAt(this.bp + i);
            if (chLocal == '\"') {
                int start = this.bp + fieldName.length + 1;
                int len = ((this.bp + offset2) - start) - 1;
                String strVal = addSymbol(start, len, hash, symbolTable);
                int offset3 = offset2 + 1;
                char chLocal2 = charAt(this.bp + offset2);
                if (chLocal2 == ',') {
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                    this.matchStat = 3;
                    return strVal;
                }
                if (chLocal2 == '}') {
                    int offset4 = offset3 + 1;
                    char chLocal3 = charAt(this.bp + offset3);
                    if (chLocal3 == ',') {
                        this.token = 16;
                        this.bp += offset4;
                        this.ch = charAt(this.bp);
                    } else if (chLocal3 == ']') {
                        this.token = 15;
                        this.bp += offset4;
                        this.ch = charAt(this.bp);
                    } else if (chLocal3 == '}') {
                        this.token = 13;
                        this.bp += offset4;
                        this.ch = charAt(this.bp);
                    } else if (chLocal3 == 26) {
                        this.token = 20;
                        this.bp += offset4 - 1;
                        this.ch = (char) 26;
                    } else {
                        this.matchStat = -1;
                        return null;
                    }
                    this.matchStat = 4;
                    return strVal;
                }
                this.matchStat = -1;
                return null;
            }
            hash = (31 * hash) + chLocal;
        } while (chLocal != '\\');
        this.matchStat = -1;
        return null;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public Enum<?> scanEnum(Class<?> enumClass, SymbolTable symbolTable, char serperator) {
        String name = scanSymbolWithSeperator(symbolTable, serperator);
        if (name == null) {
            return null;
        }
        return Enum.valueOf(enumClass, name);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public String scanSymbolWithSeperator(SymbolTable symbolTable, char serperator) {
        char chLocal;
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal2 = charAt(this.bp + 0);
        if (chLocal2 == 'n') {
            if (charAt(this.bp + offset) == 'u' && charAt(this.bp + offset + 1) == 'l' && charAt(this.bp + offset + 2) == 'l') {
                int offset2 = offset + 3;
                int offset3 = offset2 + 1;
                if (charAt(this.bp + offset2) == serperator) {
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                    this.matchStat = 3;
                    return null;
                }
                this.matchStat = -1;
                return null;
            }
            this.matchStat = -1;
            return null;
        }
        if (chLocal2 != '\"') {
            this.matchStat = -1;
            return null;
        }
        int hash = 0;
        do {
            int i = offset;
            offset++;
            chLocal = charAt(this.bp + i);
            if (chLocal == '\"') {
                int start = this.bp + 0 + 1;
                int len = ((this.bp + offset) - start) - 1;
                String strVal = addSymbol(start, len, hash, symbolTable);
                int offset4 = offset + 1;
                char charAt = charAt(this.bp + offset);
                while (true) {
                    char chLocal3 = charAt;
                    if (chLocal3 == serperator) {
                        this.bp += offset4;
                        this.ch = charAt(this.bp);
                        this.matchStat = 3;
                        return strVal;
                    }
                    if (isWhitespace(chLocal3)) {
                        int i2 = offset4;
                        offset4++;
                        charAt = charAt(this.bp + i2);
                    } else {
                        this.matchStat = -1;
                        return strVal;
                    }
                }
            } else {
                hash = (31 * hash) + chLocal;
            }
        } while (chLocal != '\\');
        this.matchStat = -1;
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:51:0x01bf, code lost:
    
        if (r10 != ']') goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x01c8, code lost:
    
        if (r8.size() != 0) goto L55;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x01cb, code lost:
    
        r2 = r9;
        r9 = r9 + 1;
        r10 = charAt(r5.bp + r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x01e7, code lost:
    
        throw new com.alibaba.fastjson.JSONException("illega str");
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.Collection<java.lang.String> scanFieldStringArray(char[] r6, java.lang.Class<?> r7) {
        /*
            Method dump skipped, instructions count: 783
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.parser.JSONLexerBase.scanFieldStringArray(char[], java.lang.Class):java.util.Collection");
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public void scanStringArray(Collection<String> list, char seperator) {
        int offset;
        char chLocal;
        int offset2;
        char chLocal2;
        this.matchStat = 0;
        int offset3 = 0 + 1;
        char chLocal3 = charAt(this.bp + 0);
        if (chLocal3 == 'n' && charAt(this.bp + offset3) == 'u' && charAt(this.bp + offset3 + 1) == 'l' && charAt(this.bp + offset3 + 2) == 'l' && charAt(this.bp + offset3 + 3) == seperator) {
            this.bp += 5;
            this.ch = charAt(this.bp);
            this.matchStat = 5;
            return;
        }
        if (chLocal3 != '[') {
            this.matchStat = -1;
            return;
        }
        int offset4 = offset3 + 1;
        char charAt = charAt(this.bp + offset3);
        while (true) {
            char chLocal4 = charAt;
            if (chLocal4 == 'n' && charAt(this.bp + offset4) == 'u' && charAt(this.bp + offset4 + 1) == 'l' && charAt(this.bp + offset4 + 2) == 'l') {
                int offset5 = offset4 + 3;
                offset = offset5 + 1;
                chLocal = charAt(this.bp + offset5);
                list.add(null);
            } else {
                if (chLocal4 == ']' && list.size() == 0) {
                    int i = offset4;
                    offset2 = offset4 + 1;
                    chLocal2 = charAt(this.bp + i);
                    break;
                }
                if (chLocal4 != '\"') {
                    this.matchStat = -1;
                    return;
                }
                int startIndex = this.bp + offset4;
                int endIndex = indexOf('\"', startIndex);
                if (endIndex == -1) {
                    throw new JSONException("unclosed str");
                }
                String stringVal = subString(this.bp + offset4, endIndex - startIndex);
                if (stringVal.indexOf(92) != -1) {
                    while (true) {
                        int slashCount = 0;
                        for (int i2 = endIndex - 1; i2 >= 0 && charAt(i2) == '\\'; i2--) {
                            slashCount++;
                        }
                        if (slashCount % 2 == 0) {
                            break;
                        } else {
                            endIndex = indexOf('\"', endIndex + 1);
                        }
                    }
                    int chars_len = endIndex - startIndex;
                    char[] chars = sub_chars(this.bp + offset4, chars_len);
                    stringVal = readString(chars, chars_len);
                }
                int offset6 = offset4 + (endIndex - (this.bp + offset4)) + 1;
                offset = offset6 + 1;
                chLocal = charAt(this.bp + offset6);
                list.add(stringVal);
            }
            if (chLocal == ',') {
                int i3 = offset;
                offset4 = offset + 1;
                charAt = charAt(this.bp + i3);
            } else if (chLocal == ']') {
                int i4 = offset;
                offset2 = offset + 1;
                chLocal2 = charAt(this.bp + i4);
            } else {
                this.matchStat = -1;
                return;
            }
        }
        if (chLocal2 == seperator) {
            this.bp += offset2;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            return;
        }
        this.matchStat = -1;
    }

    public int scanFieldInt(char[] fieldName) {
        int value;
        char chLocal;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return 0;
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        char chLocal2 = charAt(this.bp + offset);
        boolean negative = chLocal2 == '-';
        if (negative) {
            offset2++;
            chLocal2 = charAt(this.bp + offset2);
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            int i = chLocal2 - '0';
            while (true) {
                value = i;
                int i2 = offset2;
                offset2++;
                chLocal = charAt(this.bp + i2);
                if (chLocal < '0' || chLocal > '9') {
                    break;
                }
                i = (value * 10) + (chLocal - '0');
            }
            if (chLocal == '.') {
                this.matchStat = -1;
                return 0;
            }
            if ((value < 0 || offset2 > 14 + fieldName.length) && (value != Integer.MIN_VALUE || offset2 != 17 || !negative)) {
                this.matchStat = -1;
                return 0;
            }
            if (chLocal == ',') {
                this.bp += offset2;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return negative ? -value : value;
            }
            if (chLocal == '}') {
                int offset3 = offset2 + 1;
                char chLocal3 = charAt(this.bp + offset2);
                if (chLocal3 == ',') {
                    this.token = 16;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == ']') {
                    this.token = 15;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == '}') {
                    this.token = 13;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == 26) {
                    this.token = 20;
                    this.bp += offset3 - 1;
                    this.ch = (char) 26;
                } else {
                    this.matchStat = -1;
                    return 0;
                }
                this.matchStat = 4;
                return negative ? -value : value;
            }
            this.matchStat = -1;
            return 0;
        }
        this.matchStat = -1;
        return 0;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public boolean scanBoolean(char expectNext) {
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal = charAt(this.bp + 0);
        boolean value = false;
        if (chLocal == 't') {
            if (charAt(this.bp + offset) == 'r' && charAt(this.bp + offset + 1) == 'u' && charAt(this.bp + offset + 2) == 'e') {
                int offset2 = offset + 3;
                offset = offset2 + 1;
                chLocal = charAt(this.bp + offset2);
                value = true;
            } else {
                this.matchStat = -1;
                return false;
            }
        } else if (chLocal == 'f') {
            if (charAt(this.bp + offset) == 'a' && charAt(this.bp + offset + 1) == 'l' && charAt(this.bp + offset + 2) == 's' && charAt(this.bp + offset + 3) == 'e') {
                int offset3 = offset + 4;
                offset = offset3 + 1;
                chLocal = charAt(this.bp + offset3);
                value = false;
            } else {
                this.matchStat = -1;
                return false;
            }
        } else if (chLocal == '1') {
            offset++;
            chLocal = charAt(this.bp + offset);
            value = true;
        } else if (chLocal == '0') {
            offset++;
            chLocal = charAt(this.bp + offset);
            value = false;
        }
        while (chLocal != expectNext) {
            if (isWhitespace(chLocal)) {
                int i = offset;
                offset++;
                chLocal = charAt(this.bp + i);
            } else {
                this.matchStat = -1;
                return value;
            }
        }
        this.bp += offset;
        this.ch = charAt(this.bp);
        this.matchStat = 3;
        return value;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public int scanInt(char expectNext) {
        int value;
        char chLocal;
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal2 = charAt(this.bp + 0);
        boolean negative = chLocal2 == '-';
        if (negative) {
            offset++;
            chLocal2 = charAt(this.bp + offset);
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            int i = chLocal2 - '0';
            while (true) {
                value = i;
                int i2 = offset;
                offset++;
                chLocal = charAt(this.bp + i2);
                if (chLocal < '0' || chLocal > '9') {
                    break;
                }
                i = (value * 10) + (chLocal - '0');
            }
            if (chLocal == '.') {
                this.matchStat = -1;
                return 0;
            }
            if (value < 0) {
                this.matchStat = -1;
                return 0;
            }
            while (chLocal != expectNext) {
                if (isWhitespace(chLocal)) {
                    int i3 = offset;
                    offset++;
                    chLocal = charAt(this.bp + i3);
                } else {
                    this.matchStat = -1;
                    return negative ? -value : value;
                }
            }
            this.bp += offset;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            this.token = 16;
            return negative ? -value : value;
        }
        this.matchStat = -1;
        return 0;
    }

    public boolean scanFieldBoolean(char[] fieldName) {
        int offset;
        boolean value;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return false;
        }
        int offset2 = fieldName.length;
        int offset3 = offset2 + 1;
        char chLocal = charAt(this.bp + offset2);
        if (chLocal == 't') {
            int offset4 = offset3 + 1;
            if (charAt(this.bp + offset3) != 'r') {
                this.matchStat = -1;
                return false;
            }
            int offset5 = offset4 + 1;
            if (charAt(this.bp + offset4) != 'u') {
                this.matchStat = -1;
                return false;
            }
            offset = offset5 + 1;
            if (charAt(this.bp + offset5) != 'e') {
                this.matchStat = -1;
                return false;
            }
            value = true;
        } else if (chLocal == 'f') {
            int offset6 = offset3 + 1;
            if (charAt(this.bp + offset3) != 'a') {
                this.matchStat = -1;
                return false;
            }
            int offset7 = offset6 + 1;
            if (charAt(this.bp + offset6) != 'l') {
                this.matchStat = -1;
                return false;
            }
            int offset8 = offset7 + 1;
            if (charAt(this.bp + offset7) != 's') {
                this.matchStat = -1;
                return false;
            }
            offset = offset8 + 1;
            if (charAt(this.bp + offset8) != 'e') {
                this.matchStat = -1;
                return false;
            }
            value = false;
        } else {
            this.matchStat = -1;
            return false;
        }
        int i = offset;
        int offset9 = offset + 1;
        char chLocal2 = charAt(this.bp + i);
        if (chLocal2 == ',') {
            this.bp += offset9;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            this.token = 16;
            return value;
        }
        if (chLocal2 == '}') {
            int offset10 = offset9 + 1;
            char chLocal3 = charAt(this.bp + offset9);
            if (chLocal3 == ',') {
                this.token = 16;
                this.bp += offset10;
                this.ch = charAt(this.bp);
            } else if (chLocal3 == ']') {
                this.token = 15;
                this.bp += offset10;
                this.ch = charAt(this.bp);
            } else if (chLocal3 == '}') {
                this.token = 13;
                this.bp += offset10;
                this.ch = charAt(this.bp);
            } else if (chLocal3 == 26) {
                this.token = 20;
                this.bp += offset10 - 1;
                this.ch = (char) 26;
            } else {
                this.matchStat = -1;
                return false;
            }
            this.matchStat = 4;
            return value;
        }
        this.matchStat = -1;
        return false;
    }

    public long scanFieldLong(char[] fieldName) {
        long value;
        char chLocal;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return 0L;
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        char chLocal2 = charAt(this.bp + offset);
        boolean negative = false;
        if (chLocal2 == '-') {
            offset2++;
            chLocal2 = charAt(this.bp + offset2);
            negative = true;
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            long j = chLocal2 - '0';
            while (true) {
                value = j;
                int i = offset2;
                offset2++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0' || chLocal > '9') {
                    break;
                }
                j = (value * 10) + (chLocal - '0');
            }
            if (chLocal == '.') {
                this.matchStat = -1;
                return 0L;
            }
            if (value < 0 || offset2 > 21) {
                this.matchStat = -1;
                return 0L;
            }
            if (chLocal == ',') {
                this.bp += offset2;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return negative ? -value : value;
            }
            if (chLocal == '}') {
                int offset3 = offset2 + 1;
                char chLocal3 = charAt(this.bp + offset2);
                if (chLocal3 == ',') {
                    this.token = 16;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == ']') {
                    this.token = 15;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == '}') {
                    this.token = 13;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal3 == 26) {
                    this.token = 20;
                    this.bp += offset3 - 1;
                    this.ch = (char) 26;
                } else {
                    this.matchStat = -1;
                    return 0L;
                }
                this.matchStat = 4;
                return negative ? -value : value;
            }
            this.matchStat = -1;
            return 0L;
        }
        this.matchStat = -1;
        return 0L;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public long scanLong(char expectNextChar) {
        long value;
        char chLocal;
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal2 = charAt(this.bp + 0);
        boolean negative = chLocal2 == '-';
        if (negative) {
            offset++;
            chLocal2 = charAt(this.bp + offset);
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            long j = chLocal2 - '0';
            while (true) {
                value = j;
                int i = offset;
                offset++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0' || chLocal > '9') {
                    break;
                }
                j = (value * 10) + (chLocal - '0');
            }
            if (chLocal == '.') {
                this.matchStat = -1;
                return 0L;
            }
            if (value < 0) {
                this.matchStat = -1;
                return 0L;
            }
            while (chLocal != expectNextChar) {
                if (isWhitespace(chLocal)) {
                    int i2 = offset;
                    offset++;
                    chLocal = charAt(this.bp + i2);
                } else {
                    this.matchStat = -1;
                    return value;
                }
            }
            this.bp += offset;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            this.token = 16;
            return negative ? -value : value;
        }
        this.matchStat = -1;
        return 0L;
    }

    public final float scanFieldFloat(char[] fieldName) {
        char chLocal;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return 0.0f;
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        char chLocal2 = charAt(this.bp + offset);
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            do {
                int i = offset2;
                offset2++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0') {
                    break;
                }
            } while (chLocal <= '9');
            if (chLocal == '.') {
                offset2++;
                char chLocal3 = charAt(this.bp + offset2);
                if (chLocal3 >= '0' && chLocal3 <= '9') {
                    do {
                        int i2 = offset2;
                        offset2++;
                        chLocal = charAt(this.bp + i2);
                        if (chLocal < '0') {
                            break;
                        }
                    } while (chLocal <= '9');
                } else {
                    this.matchStat = -1;
                    return 0.0f;
                }
            }
            int start = this.bp + fieldName.length;
            int count = ((this.bp + offset2) - start) - 1;
            String text = subString(start, count);
            float value = Float.parseFloat(text);
            if (chLocal == ',') {
                this.bp += offset2;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return value;
            }
            if (chLocal == '}') {
                int i3 = offset2;
                int offset3 = offset2 + 1;
                char chLocal4 = charAt(this.bp + i3);
                if (chLocal4 == ',') {
                    this.token = 16;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == ']') {
                    this.token = 15;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == '}') {
                    this.token = 13;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == 26) {
                    this.bp += offset3 - 1;
                    this.token = 20;
                    this.ch = (char) 26;
                } else {
                    this.matchStat = -1;
                    return 0.0f;
                }
                this.matchStat = 4;
                return value;
            }
            this.matchStat = -1;
            return 0.0f;
        }
        this.matchStat = -1;
        return 0.0f;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final float scanFloat(char seperator) {
        char chLocal;
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal2 = charAt(this.bp + 0);
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            do {
                int i = offset;
                offset++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0') {
                    break;
                }
            } while (chLocal <= '9');
            if (chLocal == '.') {
                offset++;
                char chLocal3 = charAt(this.bp + offset);
                if (chLocal3 >= '0' && chLocal3 <= '9') {
                    do {
                        int i2 = offset;
                        offset++;
                        chLocal = charAt(this.bp + i2);
                        if (chLocal < '0') {
                            break;
                        }
                    } while (chLocal <= '9');
                } else {
                    this.matchStat = -1;
                    return 0.0f;
                }
            }
            int start = this.bp;
            int count = ((this.bp + offset) - start) - 1;
            String text = subString(start, count);
            float value = Float.parseFloat(text);
            if (chLocal == seperator) {
                this.bp += offset;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return value;
            }
            this.matchStat = -1;
            return value;
        }
        this.matchStat = -1;
        return 0.0f;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final double scanDouble(char seperator) {
        char chLocal;
        this.matchStat = 0;
        int offset = 0 + 1;
        char chLocal2 = charAt(this.bp + 0);
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            do {
                int i = offset;
                offset++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0') {
                    break;
                }
            } while (chLocal <= '9');
            if (chLocal == '.') {
                offset++;
                char chLocal3 = charAt(this.bp + offset);
                if (chLocal3 >= '0' && chLocal3 <= '9') {
                    do {
                        int i2 = offset;
                        offset++;
                        chLocal = charAt(this.bp + i2);
                        if (chLocal < '0') {
                            break;
                        }
                    } while (chLocal <= '9');
                } else {
                    this.matchStat = -1;
                    return 0.0d;
                }
            }
            int start = this.bp;
            int count = ((this.bp + offset) - start) - 1;
            String text = subString(start, count);
            double value = Double.parseDouble(text);
            if (chLocal == seperator) {
                this.bp += offset;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return value;
            }
            this.matchStat = -1;
            return value;
        }
        this.matchStat = -1;
        return 0.0d;
    }

    public final double scanFieldDouble(char[] fieldName) {
        char chLocal;
        this.matchStat = 0;
        if (!charArrayCompare(fieldName)) {
            this.matchStat = -2;
            return 0.0d;
        }
        int offset = fieldName.length;
        int offset2 = offset + 1;
        char chLocal2 = charAt(this.bp + offset);
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            do {
                int i = offset2;
                offset2++;
                chLocal = charAt(this.bp + i);
                if (chLocal < '0') {
                    break;
                }
            } while (chLocal <= '9');
            if (chLocal == '.') {
                offset2++;
                char chLocal3 = charAt(this.bp + offset2);
                if (chLocal3 >= '0' && chLocal3 <= '9') {
                    do {
                        int i2 = offset2;
                        offset2++;
                        chLocal = charAt(this.bp + i2);
                        if (chLocal < '0') {
                            break;
                        }
                    } while (chLocal <= '9');
                } else {
                    this.matchStat = -1;
                    return 0.0d;
                }
            }
            if (chLocal == 'e' || chLocal == 'E') {
                int i3 = offset2;
                offset2++;
                chLocal = charAt(this.bp + i3);
                if (chLocal == '+' || chLocal == '-') {
                    offset2++;
                    chLocal = charAt(this.bp + offset2);
                }
                while (chLocal >= '0' && chLocal <= '9') {
                    int i4 = offset2;
                    offset2++;
                    chLocal = charAt(this.bp + i4);
                }
            }
            int start = this.bp + fieldName.length;
            int count = ((this.bp + offset2) - start) - 1;
            String text = subString(start, count);
            double value = Double.parseDouble(text);
            if (chLocal == ',') {
                this.bp += offset2;
                this.ch = charAt(this.bp);
                this.matchStat = 3;
                this.token = 16;
                return value;
            }
            if (chLocal == '}') {
                int i5 = offset2;
                int offset3 = offset2 + 1;
                char chLocal4 = charAt(this.bp + i5);
                if (chLocal4 == ',') {
                    this.token = 16;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == ']') {
                    this.token = 15;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == '}') {
                    this.token = 13;
                    this.bp += offset3;
                    this.ch = charAt(this.bp);
                } else if (chLocal4 == 26) {
                    this.token = 20;
                    this.bp += offset3 - 1;
                    this.ch = (char) 26;
                } else {
                    this.matchStat = -1;
                    return 0.0d;
                }
                this.matchStat = 4;
                return value;
            }
            this.matchStat = -1;
            return 0.0d;
        }
        this.matchStat = -1;
        return 0.0d;
    }

    public final void scanTrue() {
        if (this.ch != 't') {
            throw new JSONException("error parse true");
        }
        next();
        if (this.ch != 'r') {
            throw new JSONException("error parse true");
        }
        next();
        if (this.ch != 'u') {
            throw new JSONException("error parse true");
        }
        next();
        if (this.ch != 'e') {
            throw new JSONException("error parse true");
        }
        next();
        if (this.ch == ' ' || this.ch == ',' || this.ch == '}' || this.ch == ']' || this.ch == '\n' || this.ch == '\r' || this.ch == '\t' || this.ch == 26 || this.ch == '\f' || this.ch == '\b' || this.ch == ':') {
            this.token = 6;
            return;
        }
        throw new JSONException("scan true error");
    }

    public final void scanNullOrNew() {
        if (this.ch != 'n') {
            throw new JSONException("error parse null or new");
        }
        next();
        if (this.ch == 'u') {
            next();
            if (this.ch != 'l') {
                throw new JSONException("error parse null");
            }
            next();
            if (this.ch != 'l') {
                throw new JSONException("error parse null");
            }
            next();
            if (this.ch == ' ' || this.ch == ',' || this.ch == '}' || this.ch == ']' || this.ch == '\n' || this.ch == '\r' || this.ch == '\t' || this.ch == 26 || this.ch == '\f' || this.ch == '\b') {
                this.token = 8;
                return;
            }
            throw new JSONException("scan null error");
        }
        if (this.ch != 'e') {
            throw new JSONException("error parse new");
        }
        next();
        if (this.ch != 'w') {
            throw new JSONException("error parse new");
        }
        next();
        if (this.ch == ' ' || this.ch == ',' || this.ch == '}' || this.ch == ']' || this.ch == '\n' || this.ch == '\r' || this.ch == '\t' || this.ch == 26 || this.ch == '\f' || this.ch == '\b') {
            this.token = 9;
            return;
        }
        throw new JSONException("scan new error");
    }

    public final void scanFalse() {
        if (this.ch != 'f') {
            throw new JSONException("error parse false");
        }
        next();
        if (this.ch != 'a') {
            throw new JSONException("error parse false");
        }
        next();
        if (this.ch != 'l') {
            throw new JSONException("error parse false");
        }
        next();
        if (this.ch != 's') {
            throw new JSONException("error parse false");
        }
        next();
        if (this.ch != 'e') {
            throw new JSONException("error parse false");
        }
        next();
        if (this.ch == ' ' || this.ch == ',' || this.ch == '}' || this.ch == ']' || this.ch == '\n' || this.ch == '\r' || this.ch == '\t' || this.ch == 26 || this.ch == '\f' || this.ch == '\b' || this.ch == ':') {
            this.token = 7;
            return;
        }
        throw new JSONException("scan false error");
    }

    public final void scanIdent() {
        this.np = this.bp - 1;
        this.hasSpecial = false;
        do {
            this.sp++;
            next();
        } while (Character.isLetterOrDigit(this.ch));
        String ident = stringVal();
        if ("null".equalsIgnoreCase(ident)) {
            this.token = 8;
            return;
        }
        if ("new".equals(ident)) {
            this.token = 9;
            return;
        }
        if ("true".equals(ident)) {
            this.token = 6;
            return;
        }
        if ("false".equals(ident)) {
            this.token = 7;
            return;
        }
        if ("undefined".equals(ident)) {
            this.token = 23;
            return;
        }
        if ("Set".equals(ident)) {
            this.token = 21;
        } else if ("TreeSet".equals(ident)) {
            this.token = 22;
        } else {
            this.token = 18;
        }
    }

    public static String readString(char[] chars, int chars_len) {
        char[] sbuf = new char[chars_len];
        int len = 0;
        int i = 0;
        while (i < chars_len) {
            char ch = chars[i];
            if (ch != '\\') {
                int i2 = len;
                len++;
                sbuf[i2] = ch;
            } else {
                i++;
                switch (chars[i]) {
                    case '\"':
                        int i3 = len;
                        len++;
                        sbuf[i3] = '\"';
                        break;
                    case '#':
                    case '$':
                    case '%':
                    case '&':
                    case '(':
                    case ')':
                    case '*':
                    case '+':
                    case ',':
                    case '-':
                    case '.':
                    case Opcodes.FSTORE /* 56 */:
                    case Opcodes.DSTORE /* 57 */:
                    case Opcodes.ASTORE /* 58 */:
                    case ';':
                    case '<':
                    case '=':
                    case '>':
                    case '?':
                    case '@':
                    case 'A':
                    case 'B':
                    case 'C':
                    case 'D':
                    case 'E':
                    case 'G':
                    case 'H':
                    case 'I':
                    case 'J':
                    case 'K':
                    case 'L':
                    case 'M':
                    case 'N':
                    case 'O':
                    case 'P':
                    case 'Q':
                    case 'R':
                    case 'S':
                    case 'T':
                    case 'U':
                    case 'V':
                    case Opcodes.POP /* 87 */:
                    case 'X':
                    case Opcodes.DUP /* 89 */:
                    case 'Z':
                    case '[':
                    case ']':
                    case '^':
                    case '_':
                    case Opcodes.IADD /* 96 */:
                    case 'a':
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
                    case 's':
                    case 'w':
                    default:
                        throw new JSONException("unclosed.str.lit");
                    case '\'':
                        int i4 = len;
                        len++;
                        sbuf[i4] = '\'';
                        break;
                    case '/':
                        int i5 = len;
                        len++;
                        sbuf[i5] = '/';
                        break;
                    case '0':
                        int i6 = len;
                        len++;
                        sbuf[i6] = 0;
                        break;
                    case Opcodes.V1_5 /* 49 */:
                        int i7 = len;
                        len++;
                        sbuf[i7] = 1;
                        break;
                    case '2':
                        int i8 = len;
                        len++;
                        sbuf[i8] = 2;
                        break;
                    case '3':
                        int i9 = len;
                        len++;
                        sbuf[i9] = 3;
                        break;
                    case '4':
                        int i10 = len;
                        len++;
                        sbuf[i10] = 4;
                        break;
                    case '5':
                        int i11 = len;
                        len++;
                        sbuf[i11] = 5;
                        break;
                    case Opcodes.ISTORE /* 54 */:
                        int i12 = len;
                        len++;
                        sbuf[i12] = 6;
                        break;
                    case Opcodes.LSTORE /* 55 */:
                        int i13 = len;
                        len++;
                        sbuf[i13] = 7;
                        break;
                    case 'F':
                    case 'f':
                        int i14 = len;
                        len++;
                        sbuf[i14] = '\f';
                        break;
                    case '\\':
                        int i15 = len;
                        len++;
                        sbuf[i15] = '\\';
                        break;
                    case 'b':
                        int i16 = len;
                        len++;
                        sbuf[i16] = '\b';
                        break;
                    case 'n':
                        int i17 = len;
                        len++;
                        sbuf[i17] = '\n';
                        break;
                    case 'r':
                        int i18 = len;
                        len++;
                        sbuf[i18] = '\r';
                        break;
                    case 't':
                        int i19 = len;
                        len++;
                        sbuf[i19] = '\t';
                        break;
                    case 'u':
                        int i20 = len;
                        len++;
                        int i21 = i + 1;
                        int i22 = i21 + 1;
                        int i23 = i22 + 1;
                        i = i23 + 1;
                        sbuf[i20] = (char) Integer.parseInt(new String(new char[]{chars[i21], chars[i22], chars[i23], chars[i]}), 16);
                        break;
                    case 'v':
                        int i24 = len;
                        len++;
                        sbuf[i24] = 11;
                        break;
                    case 'x':
                        int i25 = len;
                        len++;
                        int i26 = i + 1;
                        int i27 = digits[chars[i26]] * 16;
                        i = i26 + 1;
                        sbuf[i25] = (char) (i27 + digits[chars[i]]);
                        break;
                }
            }
            i++;
        }
        return new String(sbuf, 0, len);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final boolean isBlankInput() {
        int i = 0;
        while (true) {
            char chLocal = charAt(i);
            if (chLocal != 26) {
                if (isWhitespace(chLocal)) {
                    i++;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void skipWhitespace() {
        while (this.ch <= '/') {
            if (this.ch == ' ' || this.ch == '\r' || this.ch == '\n' || this.ch == '\t' || this.ch == '\f' || this.ch == '\b') {
                next();
            } else if (this.ch == '/') {
                skipComment();
            } else {
                return;
            }
        }
    }

    private void scanStringSingleQuote() {
        this.np = this.bp;
        this.hasSpecial = false;
        while (true) {
            char chLocal = next();
            if (chLocal != '\'') {
                if (chLocal == 26) {
                    if (!isEOF()) {
                        putChar((char) 26);
                    } else {
                        throw new JSONException("unclosed single-quote string");
                    }
                } else if (chLocal == '\\') {
                    if (!this.hasSpecial) {
                        this.hasSpecial = true;
                        if (this.sp > this.sbuf.length) {
                            char[] newsbuf = new char[this.sp * 2];
                            System.arraycopy(this.sbuf, 0, newsbuf, 0, this.sbuf.length);
                            this.sbuf = newsbuf;
                        }
                        copyTo(this.np + 1, this.sp, this.sbuf);
                    }
                    char chLocal2 = next();
                    switch (chLocal2) {
                        case '\"':
                            putChar('\"');
                            break;
                        case '#':
                        case '$':
                        case '%':
                        case '&':
                        case '(':
                        case ')':
                        case '*':
                        case '+':
                        case ',':
                        case '-':
                        case '.':
                        case Opcodes.FSTORE /* 56 */:
                        case Opcodes.DSTORE /* 57 */:
                        case Opcodes.ASTORE /* 58 */:
                        case ';':
                        case '<':
                        case '=':
                        case '>':
                        case '?':
                        case '@':
                        case 'A':
                        case 'B':
                        case 'C':
                        case 'D':
                        case 'E':
                        case 'G':
                        case 'H':
                        case 'I':
                        case 'J':
                        case 'K':
                        case 'L':
                        case 'M':
                        case 'N':
                        case 'O':
                        case 'P':
                        case 'Q':
                        case 'R':
                        case 'S':
                        case 'T':
                        case 'U':
                        case 'V':
                        case Opcodes.POP /* 87 */:
                        case 'X':
                        case Opcodes.DUP /* 89 */:
                        case 'Z':
                        case '[':
                        case ']':
                        case '^':
                        case '_':
                        case Opcodes.IADD /* 96 */:
                        case 'a':
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
                        case 's':
                        case 'w':
                        default:
                            this.ch = chLocal2;
                            throw new JSONException("unclosed single-quote string");
                        case '\'':
                            putChar('\'');
                            break;
                        case '/':
                            putChar('/');
                            break;
                        case '0':
                            putChar((char) 0);
                            break;
                        case Opcodes.V1_5 /* 49 */:
                            putChar((char) 1);
                            break;
                        case '2':
                            putChar((char) 2);
                            break;
                        case '3':
                            putChar((char) 3);
                            break;
                        case '4':
                            putChar((char) 4);
                            break;
                        case '5':
                            putChar((char) 5);
                            break;
                        case Opcodes.ISTORE /* 54 */:
                            putChar((char) 6);
                            break;
                        case Opcodes.LSTORE /* 55 */:
                            putChar((char) 7);
                            break;
                        case 'F':
                        case 'f':
                            putChar('\f');
                            break;
                        case '\\':
                            putChar('\\');
                            break;
                        case 'b':
                            putChar('\b');
                            break;
                        case 'n':
                            putChar('\n');
                            break;
                        case 'r':
                            putChar('\r');
                            break;
                        case 't':
                            putChar('\t');
                            break;
                        case 'u':
                            putChar((char) Integer.parseInt(new String(new char[]{next(), next(), next(), next()}), 16));
                            break;
                        case 'v':
                            putChar((char) 11);
                            break;
                        case 'x':
                            putChar((char) ((digits[next()] * 16) + digits[next()]));
                            break;
                    }
                } else if (!this.hasSpecial) {
                    this.sp++;
                } else if (this.sp == this.sbuf.length) {
                    putChar(chLocal);
                } else {
                    char[] cArr = this.sbuf;
                    int i = this.sp;
                    this.sp = i + 1;
                    cArr[i] = chLocal;
                }
            } else {
                this.token = 4;
                next();
                return;
            }
        }
    }

    protected final void putChar(char ch) {
        if (this.sp == this.sbuf.length) {
            char[] newsbuf = new char[this.sbuf.length * 2];
            System.arraycopy(this.sbuf, 0, newsbuf, 0, this.sbuf.length);
            this.sbuf = newsbuf;
        }
        char[] cArr = this.sbuf;
        int i = this.sp;
        this.sp = i + 1;
        cArr[i] = ch;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final void scanNumber() {
        this.np = this.bp;
        if (this.ch == '-') {
            this.sp++;
            next();
        }
        while (this.ch >= '0' && this.ch <= '9') {
            this.sp++;
            next();
        }
        boolean isDouble = false;
        if (this.ch == '.') {
            this.sp++;
            next();
            isDouble = true;
            while (this.ch >= '0' && this.ch <= '9') {
                this.sp++;
                next();
            }
        }
        if (this.ch == 'L' || this.ch == 'S' || this.ch == 'B') {
            this.sp++;
            next();
        } else if (this.ch == 'F' || this.ch == 'D') {
            this.sp++;
            next();
            isDouble = true;
        } else if (this.ch == 'e' || this.ch == 'E') {
            this.sp++;
            next();
            if (this.ch == '+' || this.ch == '-') {
                this.sp++;
                next();
            }
            while (this.ch >= '0' && this.ch <= '9') {
                this.sp++;
                next();
            }
            if (this.ch == 'D' || this.ch == 'F') {
                this.sp++;
                next();
            }
            isDouble = true;
        }
        if (isDouble) {
            this.token = 3;
        } else {
            this.token = 2;
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final long longValue() throws NumberFormatException {
        long limit;
        long result = 0;
        boolean negative = false;
        if (this.np == -1) {
            this.np = 0;
        }
        int i = this.np;
        int max = this.np + this.sp;
        if (charAt(this.np) == '-') {
            negative = true;
            limit = Long.MIN_VALUE;
            i++;
        } else {
            limit = -9223372036854775807L;
        }
        if (i < max) {
            int i2 = i;
            i++;
            result = -(charAt(i2) - '0');
        }
        while (i < max) {
            int i3 = i;
            i++;
            char chLocal = charAt(i3);
            if (chLocal == 'L' || chLocal == 'S' || chLocal == 'B') {
                break;
            }
            int digit = chLocal - '0';
            if (result < MULTMIN_RADIX_TEN) {
                throw new NumberFormatException(numberString());
            }
            long result2 = result * 10;
            if (result2 < limit + digit) {
                throw new NumberFormatException(numberString());
            }
            result = result2 - digit;
        }
        if (negative) {
            if (i > this.np + 1) {
                return result;
            }
            throw new NumberFormatException(numberString());
        }
        return -result;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final Number decimalValue(boolean decimal) {
        char chLocal = charAt((this.np + this.sp) - 1);
        try {
            if (chLocal == 'F') {
                return Float.valueOf(Float.parseFloat(numberString()));
            }
            if (chLocal == 'D') {
                return Double.valueOf(Double.parseDouble(numberString()));
            }
            if (decimal) {
                return decimalValue();
            }
            return Double.valueOf(doubleValue());
        } catch (NumberFormatException ex) {
            throw new JSONException(ex.getMessage() + ", " + info());
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexer
    public final BigDecimal decimalValue() {
        return new BigDecimal(numberString());
    }

    public static boolean isWhitespace(char ch) {
        return ch <= ' ' && (ch == ' ' || ch == '\n' || ch == '\r' || ch == '\t' || ch == '\f' || ch == '\b');
    }
}
