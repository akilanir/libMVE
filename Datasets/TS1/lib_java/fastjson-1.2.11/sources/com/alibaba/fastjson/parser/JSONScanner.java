package com.alibaba.fastjson.parser;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.util.ASMUtils;
import com.alibaba.fastjson.util.IOUtils;
import java.util.Calendar;
import java.util.TimeZone;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/JSONScanner.class */
public final class JSONScanner extends JSONLexerBase {
    private final String text;
    private final int len;
    public static final int ISO8601_LEN_0 = "0000-00-00".length();
    public static final int ISO8601_LEN_1 = "0000-00-00T00:00:00".length();
    public static final int ISO8601_LEN_2 = "0000-00-00T00:00:00.000".length();

    public JSONScanner(String input) {
        this(input, JSON.DEFAULT_PARSER_FEATURE);
    }

    public JSONScanner(String input, int features) {
        super(features);
        this.text = input;
        this.len = this.text.length();
        this.bp = -1;
        next();
        if (this.ch == 65279) {
            next();
        }
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final char charAt(int index) {
        if (index >= this.len) {
            return (char) 26;
        }
        return this.text.charAt(index);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public final char next() {
        int index = this.bp + 1;
        this.bp = index;
        char charAt = index >= this.len ? (char) 26 : this.text.charAt(index);
        this.ch = charAt;
        return charAt;
    }

    public JSONScanner(char[] input, int inputLength) {
        this(input, inputLength, JSON.DEFAULT_PARSER_FEATURE);
    }

    public JSONScanner(char[] input, int inputLength, int features) {
        this(new String(input, 0, inputLength), features);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    protected final void copyTo(int offset, int count, char[] dest) {
        this.text.getChars(offset, offset + count, dest, 0);
    }

    static boolean charArrayCompare(String src, int offset, char[] dest) {
        int destLen = dest.length;
        if (destLen + offset > src.length()) {
            return false;
        }
        for (int i = 0; i < destLen; i++) {
            if (dest[i] != src.charAt(offset + i)) {
                return false;
            }
        }
        return true;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final boolean charArrayCompare(char[] chars) {
        return charArrayCompare(this.text, this.bp, chars);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final int indexOf(char ch, int startIndex) {
        return this.text.indexOf(ch, startIndex);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final String addSymbol(int offset, int len, int hash, SymbolTable symbolTable) {
        return symbolTable.addSymbol(this.text, offset, len, hash);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public byte[] bytesValue() {
        return IOUtils.decodeBase64(this.text, this.np + 1, this.sp);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public final String stringVal() {
        if (!this.hasSpecial) {
            return subString(this.np + 1, this.sp);
        }
        return new String(this.sbuf, 0, this.sp);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final String subString(int offset, int count) {
        if (ASMUtils.IS_ANDROID) {
            if (count < this.sbuf.length) {
                this.text.getChars(offset, offset + count, this.sbuf, 0);
                return new String(this.sbuf, 0, count);
            }
            char[] chars = new char[count];
            this.text.getChars(offset, offset + count, chars, 0);
            return new String(chars);
        }
        return this.text.substring(offset, offset + count);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public final char[] sub_chars(int offset, int count) {
        if (ASMUtils.IS_ANDROID && count < this.sbuf.length) {
            this.text.getChars(offset, offset + count, this.sbuf, 0);
            return this.sbuf;
        }
        char[] chars = new char[count];
        this.text.getChars(offset, offset + count, chars, 0);
        return chars;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public final String numberString() {
        char chLocal = charAt((this.np + this.sp) - 1);
        int sp = this.sp;
        if (chLocal == 'L' || chLocal == 'S' || chLocal == 'B' || chLocal == 'F' || chLocal == 'D') {
            sp--;
        }
        return subString(this.np, sp);
    }

    public boolean scanISO8601DateIfMatch() {
        return scanISO8601DateIfMatch(true);
    }

    public boolean scanISO8601DateIfMatch(boolean strict) {
        int hour;
        int minute;
        int seconds;
        int millis;
        char S0;
        char t1;
        char S2;
        int rest = this.len - this.bp;
        if (!strict && rest > 13) {
            char c0 = charAt(this.bp);
            char c1 = charAt(this.bp + 1);
            char c2 = charAt(this.bp + 2);
            char c3 = charAt(this.bp + 3);
            char c4 = charAt(this.bp + 4);
            char c5 = charAt(this.bp + 5);
            char c_r0 = charAt((this.bp + rest) - 1);
            char c_r1 = charAt((this.bp + rest) - 2);
            if (c0 == '/' && c1 == 'D' && c2 == 'a' && c3 == 't' && c4 == 'e' && c5 == '(' && c_r0 == '/' && c_r1 == ')') {
                int plusIndex = -1;
                for (int i = 6; i < rest; i++) {
                    char c = charAt(this.bp + i);
                    if (c == '+') {
                        plusIndex = i;
                    } else if (c < '0' || c > '9') {
                        break;
                    }
                }
                if (plusIndex == -1) {
                    return false;
                }
                int offset = this.bp + 6;
                String numberText = subString(offset, plusIndex - offset);
                long millis2 = Long.parseLong(numberText);
                this.calendar = Calendar.getInstance(this.timeZone, this.locale);
                this.calendar.setTimeInMillis(millis2);
                this.token = 5;
                return true;
            }
        }
        if (rest == 8 || rest == 14 || rest == 17) {
            if (strict) {
                return false;
            }
            char y0 = charAt(this.bp);
            char y1 = charAt(this.bp + 1);
            char y2 = charAt(this.bp + 2);
            char y3 = charAt(this.bp + 3);
            char M0 = charAt(this.bp + 4);
            char M1 = charAt(this.bp + 5);
            char d0 = charAt(this.bp + 6);
            char d1 = charAt(this.bp + 7);
            if (!checkDate(y0, y1, y2, y3, M0, M1, d0, d1)) {
                return false;
            }
            setCalendar(y0, y1, y2, y3, M0, M1, d0, d1);
            if (rest != 8) {
                char h0 = charAt(this.bp + 8);
                char h1 = charAt(this.bp + 9);
                char m0 = charAt(this.bp + 10);
                char m1 = charAt(this.bp + 11);
                char s0 = charAt(this.bp + 12);
                char s1 = charAt(this.bp + 13);
                if (!checkTime(h0, h1, m0, m1, s0, s1)) {
                    return false;
                }
                if (rest == 17) {
                    char S02 = charAt(this.bp + 14);
                    char S1 = charAt(this.bp + 15);
                    char S22 = charAt(this.bp + 16);
                    if (S02 < '0' || S02 > '9' || S1 < '0' || S1 > '9' || S22 < '0' || S22 > '9') {
                        return false;
                    }
                    millis = ((S02 - '0') * 100) + ((S1 - '0') * 10) + (S22 - '0');
                } else {
                    millis = 0;
                }
                hour = ((h0 - '0') * 10) + (h1 - '0');
                minute = ((m0 - '0') * 10) + (m1 - '0');
                seconds = ((s0 - '0') * 10) + (s1 - '0');
            } else {
                hour = 0;
                minute = 0;
                seconds = 0;
                millis = 0;
            }
            this.calendar.set(11, hour);
            this.calendar.set(12, minute);
            this.calendar.set(13, seconds);
            this.calendar.set(14, millis);
            this.token = 5;
            return true;
        }
        if (rest < ISO8601_LEN_0 || charAt(this.bp + 4) != '-' || charAt(this.bp + 7) != '-') {
            return false;
        }
        char y02 = charAt(this.bp);
        char y12 = charAt(this.bp + 1);
        char y22 = charAt(this.bp + 2);
        char y32 = charAt(this.bp + 3);
        char M02 = charAt(this.bp + 5);
        char M12 = charAt(this.bp + 6);
        char d02 = charAt(this.bp + 8);
        char d12 = charAt(this.bp + 9);
        if (!checkDate(y02, y12, y22, y32, M02, M12, d02, d12)) {
            return false;
        }
        setCalendar(y02, y12, y22, y32, M02, M12, d02, d12);
        char t = charAt(this.bp + 10);
        if (t == 'T' || (t == ' ' && !strict)) {
            if (rest < ISO8601_LEN_1 || charAt(this.bp + 13) != ':' || charAt(this.bp + 16) != ':') {
                return false;
            }
            char h02 = charAt(this.bp + 11);
            char h12 = charAt(this.bp + 12);
            char m02 = charAt(this.bp + 14);
            char m12 = charAt(this.bp + 15);
            char s02 = charAt(this.bp + 17);
            char s12 = charAt(this.bp + 18);
            if (!checkTime(h02, h12, m02, m12, s02, s12)) {
                return false;
            }
            setTime(h02, h12, m02, m12, s02, s12);
            char dot = charAt(this.bp + 19);
            if (dot == '.') {
                if (rest < ISO8601_LEN_2 || (S0 = charAt(this.bp + 20)) < '0' || S0 > '9') {
                    return false;
                }
                int millis3 = S0 - '0';
                int millisLen = 1;
                char S12 = charAt(this.bp + 21);
                if (S12 >= '0' && S12 <= '9') {
                    millis3 = (millis3 * 10) + (S12 - '0');
                    millisLen = 2;
                }
                if (millisLen == 2 && (S2 = charAt(this.bp + 22)) >= '0' && S2 <= '9') {
                    millis3 = (millis3 * 10) + (S2 - '0');
                    millisLen = 3;
                }
                this.calendar.set(14, millis3);
                int timzeZoneLength = 0;
                char timeZoneFlag = charAt(this.bp + 20 + millisLen);
                if (timeZoneFlag == '+' || timeZoneFlag == '-') {
                    char t0 = charAt(this.bp + 20 + millisLen + 1);
                    if (t0 < '0' || t0 > '1' || (t1 = charAt(this.bp + 20 + millisLen + 2)) < '0' || t1 > '9') {
                        return false;
                    }
                    char t2 = charAt(this.bp + 20 + millisLen + 3);
                    if (t2 == ':') {
                        char t3 = charAt(this.bp + 20 + millisLen + 4);
                        if (t3 != '0') {
                            return false;
                        }
                        char t4 = charAt(this.bp + 20 + millisLen + 5);
                        if (t4 != '0') {
                            return false;
                        }
                        timzeZoneLength = 6;
                    } else if (t2 == '0') {
                        char t32 = charAt(this.bp + 20 + millisLen + 4);
                        if (t32 != '0') {
                            return false;
                        }
                        timzeZoneLength = 5;
                    } else {
                        timzeZoneLength = 3;
                    }
                    setTimeZone(timeZoneFlag, t0, t1);
                } else if (timeZoneFlag == 'Z') {
                    timzeZoneLength = 1;
                    if (this.calendar.getTimeZone().getRawOffset() != 0) {
                        String[] timeZoneIDs = TimeZone.getAvailableIDs(0);
                        if (timeZoneIDs.length > 0) {
                            TimeZone timeZone = TimeZone.getTimeZone(timeZoneIDs[0]);
                            this.calendar.setTimeZone(timeZone);
                        }
                    }
                }
                char end = charAt(this.bp + 20 + millisLen + timzeZoneLength);
                if (end != 26 && end != '\"') {
                    return false;
                }
                int i2 = this.bp + 20 + millisLen + timzeZoneLength;
                this.bp = i2;
                this.ch = charAt(i2);
                this.token = 5;
                return true;
            }
            this.calendar.set(14, 0);
            int i3 = this.bp + 19;
            this.bp = i3;
            this.ch = charAt(i3);
            this.token = 5;
            if (dot == 'Z' && this.calendar.getTimeZone().getRawOffset() != 0) {
                String[] timeZoneIDs2 = TimeZone.getAvailableIDs(0);
                if (timeZoneIDs2.length > 0) {
                    TimeZone timeZone2 = TimeZone.getTimeZone(timeZoneIDs2[0]);
                    this.calendar.setTimeZone(timeZone2);
                    return true;
                }
                return true;
            }
            return true;
        }
        if (t == '\"' || t == 26) {
            this.calendar.set(11, 0);
            this.calendar.set(12, 0);
            this.calendar.set(13, 0);
            this.calendar.set(14, 0);
            int i4 = this.bp + 10;
            this.bp = i4;
            this.ch = charAt(i4);
            this.token = 5;
            return true;
        }
        if ((t != '+' && t != '-') || this.len != 16 || charAt(this.bp + 13) != ':' || charAt(this.bp + 14) != '0' || charAt(this.bp + 15) != '0') {
            return false;
        }
        setTime('0', '0', '0', '0', '0', '0');
        this.calendar.set(14, 0);
        setTimeZone(t, charAt(this.bp + 11), charAt(this.bp + 12));
        return true;
    }

    protected void setTime(char h0, char h1, char m0, char m1, char s0, char s1) {
        int hour = ((h0 - '0') * 10) + (h1 - '0');
        int minute = ((m0 - '0') * 10) + (m1 - '0');
        int seconds = ((s0 - '0') * 10) + (s1 - '0');
        this.calendar.set(11, hour);
        this.calendar.set(12, minute);
        this.calendar.set(13, seconds);
    }

    protected void setTimeZone(char timeZoneFlag, char t0, char t1) {
        int timeZoneOffset = (((t0 - '0') * 10) + (t1 - '0')) * 3600 * 1000;
        if (timeZoneFlag == '-') {
            timeZoneOffset = -timeZoneOffset;
        }
        if (this.calendar.getTimeZone().getRawOffset() != timeZoneOffset) {
            String[] timeZoneIDs = TimeZone.getAvailableIDs(timeZoneOffset);
            if (timeZoneIDs.length > 0) {
                TimeZone timeZone = TimeZone.getTimeZone(timeZoneIDs[0]);
                this.calendar.setTimeZone(timeZone);
            }
        }
    }

    private boolean checkTime(char h0, char h1, char m0, char m1, char s0, char s1) {
        if (h0 == '0') {
            if (h1 < '0' || h1 > '9') {
                return false;
            }
        } else if (h0 == '1') {
            if (h1 < '0' || h1 > '9') {
                return false;
            }
        } else if (h0 != '2' || h1 < '0' || h1 > '4') {
            return false;
        }
        if (m0 >= '0' && m0 <= '5') {
            if (m1 < '0' || m1 > '9') {
                return false;
            }
        } else if (m0 != '6' || m1 != '0') {
            return false;
        }
        if (s0 >= '0' && s0 <= '5') {
            if (s1 < '0' || s1 > '9') {
                return false;
            }
            return true;
        }
        if (s0 != '6' || s1 != '0') {
            return false;
        }
        return true;
    }

    private void setCalendar(char y0, char y1, char y2, char y3, char M0, char M1, char d0, char d1) {
        this.calendar = Calendar.getInstance(this.timeZone, this.locale);
        int year = ((y0 - '0') * 1000) + ((y1 - '0') * 100) + ((y2 - '0') * 10) + (y3 - '0');
        int month = (((M0 - '0') * 10) + (M1 - '0')) - 1;
        int day = ((d0 - '0') * 10) + (d1 - '0');
        this.calendar.set(1, year);
        this.calendar.set(2, month);
        this.calendar.set(5, day);
    }

    static boolean checkDate(char y0, char y1, char y2, char y3, char M0, char M1, int d0, int d1) {
        if ((y0 != '1' && y0 != '2') || y1 < '0' || y1 > '9' || y2 < '0' || y2 > '9' || y3 < '0' || y3 > '9') {
            return false;
        }
        if (M0 == '0') {
            if (M1 < '1' || M1 > '9') {
                return false;
            }
        } else if (M0 == '1') {
            if (M1 != '0' && M1 != '1' && M1 != '2') {
                return false;
            }
        } else {
            return false;
        }
        if (d0 == 48) {
            if (d1 < 49 || d1 > 57) {
                return false;
            }
            return true;
        }
        if (d0 == 49 || d0 == 50) {
            if (d1 < 48 || d1 > 57) {
                return false;
            }
            return true;
        }
        if (d0 == 51) {
            if (d1 != 48 && d1 != 49) {
                return false;
            }
            return true;
        }
        return false;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public boolean isEOF() {
        return this.bp == this.len || (this.ch == 26 && this.bp + 1 == this.len);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public int scanFieldInt(char[] fieldName) {
        int value;
        char ch;
        this.matchStat = 0;
        int startPos = this.bp;
        char startChar = this.ch;
        if (!charArrayCompare(this.text, this.bp, fieldName)) {
            this.matchStat = -2;
            return 0;
        }
        int index = this.bp + fieldName.length;
        int index2 = index + 1;
        char ch2 = charAt(index);
        boolean negative = false;
        if (ch2 == '-') {
            index2++;
            ch2 = charAt(index2);
            negative = true;
        }
        if (ch2 >= '0' && ch2 <= '9') {
            int i = ch2 - '0';
            while (true) {
                value = i;
                int i2 = index2;
                index2++;
                ch = charAt(i2);
                if (ch < '0' || ch > '9') {
                    break;
                }
                i = (value * 10) + (ch - '0');
            }
            if (ch == '.') {
                this.matchStat = -1;
                return 0;
            }
            if (value < 0) {
                this.matchStat = -1;
                return 0;
            }
            if (ch == ',' || ch == '}') {
                this.bp = index2 - 1;
            }
            if (ch == ',') {
                int i3 = this.bp + 1;
                this.bp = i3;
                this.ch = charAt(i3);
                this.matchStat = 3;
                this.token = 16;
                return negative ? -value : value;
            }
            if (ch == '}') {
                int i4 = this.bp + 1;
                this.bp = i4;
                char ch3 = charAt(i4);
                if (ch3 == ',') {
                    this.token = 16;
                    int i5 = this.bp + 1;
                    this.bp = i5;
                    this.ch = charAt(i5);
                } else if (ch3 == ']') {
                    this.token = 15;
                    int i6 = this.bp + 1;
                    this.bp = i6;
                    this.ch = charAt(i6);
                } else if (ch3 == '}') {
                    this.token = 13;
                    int i7 = this.bp + 1;
                    this.bp = i7;
                    this.ch = charAt(i7);
                } else if (ch3 == 26) {
                    this.token = 20;
                } else {
                    this.bp = startPos;
                    this.ch = startChar;
                    this.matchStat = -1;
                    return 0;
                }
                this.matchStat = 4;
            }
            return negative ? -value : value;
        }
        this.matchStat = -1;
        return 0;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public String scanFieldString(char[] fieldName) {
        this.matchStat = 0;
        int startPos = this.bp;
        char startChar = this.ch;
        if (!charArrayCompare(this.text, this.bp, fieldName)) {
            this.matchStat = -2;
            return stringDefaultValue();
        }
        int index = this.bp + fieldName.length;
        int index2 = index + 1;
        if (charAt(index) != '\"') {
            this.matchStat = -1;
            return stringDefaultValue();
        }
        int endIndex = indexOf('\"', index2);
        if (endIndex == -1) {
            throw new JSONException("unclosed str");
        }
        String stringVal = subString(index2, endIndex - index2);
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
        char ch = charAt(endIndex + 1);
        if (ch == ',' || ch == '}') {
            this.bp = endIndex + 1;
            this.ch = ch;
            String strVal = stringVal;
            if (ch == ',') {
                int i2 = this.bp + 1;
                this.bp = i2;
                this.ch = charAt(i2);
                this.matchStat = 3;
                return strVal;
            }
            if (ch == '}') {
                int i3 = this.bp + 1;
                this.bp = i3;
                char ch2 = charAt(i3);
                if (ch2 == ',') {
                    this.token = 16;
                    int i4 = this.bp + 1;
                    this.bp = i4;
                    this.ch = charAt(i4);
                } else if (ch2 == ']') {
                    this.token = 15;
                    int i5 = this.bp + 1;
                    this.bp = i5;
                    this.ch = charAt(i5);
                } else if (ch2 == '}') {
                    this.token = 13;
                    int i6 = this.bp + 1;
                    this.bp = i6;
                    this.ch = charAt(i6);
                } else if (ch2 == 26) {
                    this.token = 20;
                } else {
                    this.bp = startPos;
                    this.ch = startChar;
                    this.matchStat = -1;
                    return stringDefaultValue();
                }
                this.matchStat = 4;
                return strVal;
            }
            this.matchStat = -1;
            return stringDefaultValue();
        }
        this.matchStat = -1;
        return stringDefaultValue();
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public String scanFieldSymbol(char[] fieldName, SymbolTable symbolTable) {
        char ch;
        this.matchStat = 0;
        if (!charArrayCompare(this.text, this.bp, fieldName)) {
            this.matchStat = -2;
            return null;
        }
        int index = this.bp + fieldName.length;
        int index2 = index + 1;
        if (charAt(index) != '\"') {
            this.matchStat = -1;
            return null;
        }
        int hash = 0;
        do {
            int i = index2;
            index2++;
            ch = charAt(i);
            if (ch == '\"') {
                this.bp = index2;
                char ch2 = charAt(this.bp);
                this.ch = ch2;
                String strVal = symbolTable.addSymbol(this.text, index2, (index2 - index2) - 1, hash);
                if (ch2 == ',') {
                    int i2 = this.bp + 1;
                    this.bp = i2;
                    this.ch = charAt(i2);
                    this.matchStat = 3;
                    return strVal;
                }
                if (ch2 == '}') {
                    int i3 = this.bp + 1;
                    this.bp = i3;
                    char ch3 = charAt(i3);
                    if (ch3 == ',') {
                        this.token = 16;
                        int i4 = this.bp + 1;
                        this.bp = i4;
                        this.ch = charAt(i4);
                    } else if (ch3 == ']') {
                        this.token = 15;
                        int i5 = this.bp + 1;
                        this.bp = i5;
                        this.ch = charAt(i5);
                    } else if (ch3 == '}') {
                        this.token = 13;
                        int i6 = this.bp + 1;
                        this.bp = i6;
                        this.ch = charAt(i6);
                    } else if (ch3 == 26) {
                        this.token = 20;
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
            hash = (31 * hash) + ch;
        } while (ch != '\\');
        this.matchStat = -1;
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x0167, code lost:
    
        if (r11 != ']') goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0170, code lost:
    
        if (r9.size() != 0) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0173, code lost:
    
        r1 = r10;
        r10 = r10 + 1;
        r11 = charAt(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x0181, code lost:
    
        r6.matchStat = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0187, code lost:
    
        return null;
     */
    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.Collection<java.lang.String> scanFieldStringArray(char[] r7, java.lang.Class<?> r8) {
        /*
            Method dump skipped, instructions count: 742
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.parser.JSONScanner.scanFieldStringArray(char[], java.lang.Class):java.util.Collection");
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public long scanFieldLong(char[] fieldName) {
        long value;
        char ch;
        this.matchStat = 0;
        int startPos = this.bp;
        char startChar = this.ch;
        if (!charArrayCompare(this.text, this.bp, fieldName)) {
            this.matchStat = -2;
            return 0L;
        }
        int index = this.bp + fieldName.length;
        int index2 = index + 1;
        char ch2 = charAt(index);
        boolean negative = false;
        if (ch2 == '-') {
            index2++;
            ch2 = charAt(index2);
            negative = true;
        }
        if (ch2 >= '0' && ch2 <= '9') {
            long j = ch2 - '0';
            while (true) {
                value = j;
                int i = index2;
                index2++;
                ch = charAt(i);
                if (ch < '0' || ch > '9') {
                    break;
                }
                j = (value * 10) + (ch - '0');
            }
            if (ch == '.') {
                this.matchStat = -1;
                return 0L;
            }
            if (ch == ',' || ch == '}') {
                this.bp = index2 - 1;
            }
            if (value < 0) {
                this.bp = startPos;
                this.ch = startChar;
                this.matchStat = -1;
                return 0L;
            }
            if (ch == ',') {
                int i2 = this.bp + 1;
                this.bp = i2;
                this.ch = charAt(i2);
                this.matchStat = 3;
                this.token = 16;
                return negative ? -value : value;
            }
            if (ch == '}') {
                int i3 = this.bp + 1;
                this.bp = i3;
                char ch3 = charAt(i3);
                if (ch3 == ',') {
                    this.token = 16;
                    int i4 = this.bp + 1;
                    this.bp = i4;
                    this.ch = charAt(i4);
                } else if (ch3 == ']') {
                    this.token = 15;
                    int i5 = this.bp + 1;
                    this.bp = i5;
                    this.ch = charAt(i5);
                } else if (ch3 == '}') {
                    this.token = 13;
                    int i6 = this.bp + 1;
                    this.bp = i6;
                    this.ch = charAt(i6);
                } else if (ch3 == 26) {
                    this.token = 20;
                } else {
                    this.bp = startPos;
                    this.ch = startChar;
                    this.matchStat = -1;
                    return 0L;
                }
                this.matchStat = 4;
                return negative ? -value : value;
            }
            this.matchStat = -1;
            return 0L;
        }
        this.bp = startPos;
        this.ch = startChar;
        this.matchStat = -1;
        return 0L;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    public boolean scanFieldBoolean(char[] fieldName) {
        char ch;
        boolean value;
        this.matchStat = 0;
        if (!charArrayCompare(this.text, this.bp, fieldName)) {
            this.matchStat = -2;
            return false;
        }
        int index = this.bp + fieldName.length;
        int index2 = index + 1;
        char ch2 = charAt(index);
        if (ch2 == 't') {
            int index3 = index2 + 1;
            if (charAt(index2) != 'r') {
                this.matchStat = -1;
                return false;
            }
            int index4 = index3 + 1;
            if (charAt(index3) != 'u') {
                this.matchStat = -1;
                return false;
            }
            int index5 = index4 + 1;
            if (charAt(index4) != 'e') {
                this.matchStat = -1;
                return false;
            }
            this.bp = index5;
            ch = charAt(this.bp);
            value = true;
        } else if (ch2 == 'f') {
            int index6 = index2 + 1;
            if (charAt(index2) != 'a') {
                this.matchStat = -1;
                return false;
            }
            int index7 = index6 + 1;
            if (charAt(index6) != 'l') {
                this.matchStat = -1;
                return false;
            }
            int index8 = index7 + 1;
            if (charAt(index7) != 's') {
                this.matchStat = -1;
                return false;
            }
            int index9 = index8 + 1;
            if (charAt(index8) != 'e') {
                this.matchStat = -1;
                return false;
            }
            this.bp = index9;
            ch = charAt(this.bp);
            value = false;
        } else {
            this.matchStat = -1;
            return false;
        }
        if (ch == ',') {
            int i = this.bp + 1;
            this.bp = i;
            this.ch = charAt(i);
            this.matchStat = 3;
            this.token = 16;
        } else if (ch == '}') {
            int i2 = this.bp + 1;
            this.bp = i2;
            char ch3 = charAt(i2);
            if (ch3 == ',') {
                this.token = 16;
                int i3 = this.bp + 1;
                this.bp = i3;
                this.ch = charAt(i3);
            } else if (ch3 == ']') {
                this.token = 15;
                int i4 = this.bp + 1;
                this.bp = i4;
                this.ch = charAt(i4);
            } else if (ch3 == '}') {
                this.token = 13;
                int i5 = this.bp + 1;
                this.bp = i5;
                this.ch = charAt(i5);
            } else if (ch3 == 26) {
                this.token = 20;
            } else {
                this.matchStat = -1;
                return false;
            }
            this.matchStat = 4;
        } else {
            this.matchStat = -1;
            return false;
        }
        return value;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public final int scanInt(char expectNext) {
        int value;
        char chLocal;
        this.matchStat = 0;
        int offset = this.bp;
        int offset2 = offset + 1;
        char chLocal2 = charAt(offset);
        boolean negative = chLocal2 == '-';
        if (negative) {
            offset2++;
            chLocal2 = charAt(offset2);
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            int i = chLocal2 - '0';
            while (true) {
                value = i;
                int i2 = offset2;
                offset2++;
                chLocal = charAt(i2);
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
                    int i3 = offset2;
                    offset2++;
                    chLocal = charAt(i3);
                } else {
                    this.matchStat = -1;
                    return negative ? -value : value;
                }
            }
            this.bp = offset2;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            this.token = 16;
            return negative ? -value : value;
        }
        this.matchStat = -1;
        return 0;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public long scanLong(char expectNextChar) {
        long value;
        char chLocal;
        this.matchStat = 0;
        int offset = this.bp;
        int offset2 = offset + 1;
        char chLocal2 = charAt(offset);
        boolean negative = chLocal2 == '-';
        if (negative) {
            offset2++;
            chLocal2 = charAt(offset2);
        }
        if (chLocal2 >= '0' && chLocal2 <= '9') {
            long j = chLocal2 - '0';
            while (true) {
                value = j;
                int i = offset2;
                offset2++;
                chLocal = charAt(i);
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
                    int i2 = offset2;
                    offset2++;
                    chLocal = charAt(i2);
                } else {
                    this.matchStat = -1;
                    return value;
                }
            }
            this.bp = offset2;
            this.ch = charAt(this.bp);
            this.matchStat = 3;
            this.token = 16;
            return negative ? -value : value;
        }
        this.matchStat = -1;
        return 0L;
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase
    protected final void arrayCopy(int srcPos, char[] dest, int destPos, int length) {
        this.text.getChars(srcPos, srcPos + length, dest, destPos);
    }

    @Override // com.alibaba.fastjson.parser.JSONLexerBase, com.alibaba.fastjson.parser.JSONLexer
    public String info() {
        return "pos " + this.bp + ", json : " + (this.text.length() < 65536 ? this.text : this.text.substring(0, 65536));
    }
}
