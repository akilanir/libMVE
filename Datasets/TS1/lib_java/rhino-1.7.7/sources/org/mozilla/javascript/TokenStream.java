package org.mozilla.javascript;

import java.io.IOException;
import java.io.Reader;
import org.mozilla.javascript.Token;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/TokenStream.class */
class TokenStream {
    private static final int EOF_CHAR = -1;
    private static final char BYTE_ORDER_MARK = 65279;
    private boolean dirtyLine;
    String regExpFlags;
    private double number;
    private boolean isOctal;
    private boolean isHex;
    private int quoteChar;
    private int stringBufferTop;
    private int ungetCursor;
    int lineno;
    private String sourceString;
    private Reader sourceReader;
    private char[] sourceBuffer;
    private int sourceEnd;
    int sourceCursor;
    int cursor;
    int tokenBeg;
    int tokenEnd;
    Token.CommentType commentType;
    private boolean xmlIsAttribute;
    private boolean xmlIsTagContent;
    private int xmlOpenTagsCount;
    private Parser parser;
    static final /* synthetic */ boolean $assertionsDisabled;
    private String string = "";
    private char[] stringBuffer = new char[128];
    private ObjToIntMap allStrings = new ObjToIntMap(50);
    private final int[] ungetBuffer = new int[3];
    private boolean hitEOF = false;
    private int lineStart = 0;
    private int lineEndChar = -1;
    private String commentPrefix = "";
    private int commentCursor = -1;

    static {
        $assertionsDisabled = !TokenStream.class.desiredAssertionStatus();
    }

    TokenStream(Parser parser, Reader sourceReader, String sourceString, int lineno) {
        this.parser = parser;
        this.lineno = lineno;
        if (sourceReader != null) {
            if (sourceString != null) {
                Kit.codeBug();
            }
            this.sourceReader = sourceReader;
            this.sourceBuffer = new char[512];
            this.sourceEnd = 0;
        } else {
            if (sourceString == null) {
                Kit.codeBug();
            }
            this.sourceString = sourceString;
            this.sourceEnd = sourceString.length();
        }
        this.cursor = 0;
        this.sourceCursor = 0;
    }

    String tokenToString(int token) {
        return "";
    }

    static boolean isKeyword(String s) {
        return 0 != stringToKeyword(s);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.processFallThroughCases(SwitchRegionMaker.java:105)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:181:0x07e0 A[PHI: r65 r67
      0x07e0: PHI (r65v1 'id' int) = 
      (r65v0 'id' int)
      (r65v3 'id' int)
      (r65v0 'id' int)
      (r65v4 'id' int)
      (r65v5 'id' int)
      (r65v0 'id' int)
      (r65v6 'id' int)
      (r65v7 'id' int)
      (r65v8 'id' int)
      (r65v0 'id' int)
      (r65v9 'id' int)
      (r65v10 'id' int)
      (r65v11 'id' int)
      (r65v12 'id' int)
      (r65v13 'id' int)
      (r65v0 'id' int)
      (r65v14 'id' int)
      (r65v15 'id' int)
      (r65v16 'id' int)
      (r65v17 'id' int)
      (r65v18 'id' int)
      (r65v19 'id' int)
      (r65v0 'id' int)
      (r65v20 'id' int)
      (r65v21 'id' int)
      (r65v22 'id' int)
      (r65v23 'id' int)
      (r65v24 'id' int)
      (r65v25 'id' int)
      (r65v26 'id' int)
      (r65v27 'id' int)
      (r65v0 'id' int)
      (r65v28 'id' int)
      (r65v29 'id' int)
      (r65v30 'id' int)
      (r65v0 'id' int)
      (r65v31 'id' int)
      (r65v32 'id' int)
      (r65v33 'id' int)
      (r65v0 'id' int)
      (r65v34 'id' int)
      (r65v35 'id' int)
      (r65v0 'id' int)
      (r65v36 'id' int)
      (r65v37 'id' int)
      (r65v38 'id' int)
      (r65v39 'id' int)
      (r65v0 'id' int)
      (r65v40 'id' int)
      (r65v41 'id' int)
      (r65v42 'id' int)
      (r65v0 'id' int)
      (r65v43 'id' int)
      (r65v44 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v47 'id' int)
      (r65v48 'id' int)
      (r65v49 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v54 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
      (r65v0 'id' int)
     binds: [B:3:0x0101, B:180:0x07d5, B:178:0x07c7, B:179:0x07ca, B:176:0x07b8, B:172:0x079b, B:173:0x079e, B:170:0x078c, B:167:0x077a, B:158:0x06ff, B:163:0x075d, B:162:0x0752, B:161:0x0746, B:160:0x073b, B:159:0x0730, B:149:0x067b, B:155:0x06eb, B:154:0x06e0, B:153:0x06d5, B:152:0x06ca, B:151:0x06bf, B:150:0x06b4, B:131:0x0570, B:146:0x0667, B:145:0x065c, B:144:0x0651, B:143:0x0646, B:142:0x063b, B:141:0x0630, B:140:0x0625, B:139:0x061a, B:137:0x060d, B:138:0x0610, B:135:0x05fe, B:132:0x05e4, B:104:0x0443, B:128:0x055c, B:127:0x0551, B:126:0x0546, B:124:0x0538, B:125:0x053b, B:122:0x0529, B:118:0x050c, B:119:0x050f, B:116:0x04fc, B:113:0x04e2, B:112:0x04d7, B:110:0x04c9, B:111:0x04cc, B:108:0x04ba, B:105:0x04a0, B:53:0x02a0, B:101:0x042f, B:100:0x0424, B:94:0x0404, B:96:0x040f, B:98:0x041a, B:89:0x03eb, B:91:0x03f6, B:85:0x03c9, B:84:0x03be, B:83:0x03b3, B:77:0x0393, B:79:0x039e, B:81:0x03a9, B:72:0x037a, B:74:0x0385, B:63:0x0343, B:65:0x034e, B:67:0x0359, B:58:0x032a, B:60:0x0335, B:54:0x0308, B:20:0x0195, B:47:0x0282, B:49:0x028d, B:42:0x0265, B:44:0x0270, B:37:0x0248, B:39:0x0253, B:32:0x022a, B:34:0x0235, B:27:0x020d, B:29:0x0218, B:22:0x01f0, B:24:0x01fb, B:15:0x017a, B:17:0x0185, B:12:0x016c, B:7:0x0153] A[DONT_GENERATE, DONT_INLINE]
      0x07e0: PHI (r67v1 'X' java.lang.String) = 
      (r67v0 'X' java.lang.String)
      (r67v2 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v3 'X' java.lang.String)
      (r67v4 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v5 'X' java.lang.String)
      (r67v6 'X' java.lang.String)
      (r67v7 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v8 'X' java.lang.String)
      (r67v9 'X' java.lang.String)
      (r67v10 'X' java.lang.String)
      (r67v11 'X' java.lang.String)
      (r67v12 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v13 'X' java.lang.String)
      (r67v14 'X' java.lang.String)
      (r67v15 'X' java.lang.String)
      (r67v16 'X' java.lang.String)
      (r67v17 'X' java.lang.String)
      (r67v18 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v19 'X' java.lang.String)
      (r67v20 'X' java.lang.String)
      (r67v21 'X' java.lang.String)
      (r67v22 'X' java.lang.String)
      (r67v23 'X' java.lang.String)
      (r67v24 'X' java.lang.String)
      (r67v25 'X' java.lang.String)
      (r67v26 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v27 'X' java.lang.String)
      (r67v28 'X' java.lang.String)
      (r67v29 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v30 'X' java.lang.String)
      (r67v31 'X' java.lang.String)
      (r67v32 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v33 'X' java.lang.String)
      (r67v34 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v35 'X' java.lang.String)
      (r67v36 'X' java.lang.String)
      (r67v37 'X' java.lang.String)
      (r67v38 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v39 'X' java.lang.String)
      (r67v40 'X' java.lang.String)
      (r67v41 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v42 'X' java.lang.String)
      (r67v43 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v44 'X' java.lang.String)
      (r67v45 'X' java.lang.String)
      (r67v46 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v47 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
      (r67v0 'X' java.lang.String)
     binds: [B:3:0x0101, B:180:0x07d5, B:178:0x07c7, B:179:0x07ca, B:176:0x07b8, B:172:0x079b, B:173:0x079e, B:170:0x078c, B:167:0x077a, B:158:0x06ff, B:163:0x075d, B:162:0x0752, B:161:0x0746, B:160:0x073b, B:159:0x0730, B:149:0x067b, B:155:0x06eb, B:154:0x06e0, B:153:0x06d5, B:152:0x06ca, B:151:0x06bf, B:150:0x06b4, B:131:0x0570, B:146:0x0667, B:145:0x065c, B:144:0x0651, B:143:0x0646, B:142:0x063b, B:141:0x0630, B:140:0x0625, B:139:0x061a, B:137:0x060d, B:138:0x0610, B:135:0x05fe, B:132:0x05e4, B:104:0x0443, B:128:0x055c, B:127:0x0551, B:126:0x0546, B:124:0x0538, B:125:0x053b, B:122:0x0529, B:118:0x050c, B:119:0x050f, B:116:0x04fc, B:113:0x04e2, B:112:0x04d7, B:110:0x04c9, B:111:0x04cc, B:108:0x04ba, B:105:0x04a0, B:53:0x02a0, B:101:0x042f, B:100:0x0424, B:94:0x0404, B:96:0x040f, B:98:0x041a, B:89:0x03eb, B:91:0x03f6, B:85:0x03c9, B:84:0x03be, B:83:0x03b3, B:77:0x0393, B:79:0x039e, B:81:0x03a9, B:72:0x037a, B:74:0x0385, B:63:0x0343, B:65:0x034e, B:67:0x0359, B:58:0x032a, B:60:0x0335, B:54:0x0308, B:20:0x0195, B:47:0x0282, B:49:0x028d, B:42:0x0265, B:44:0x0270, B:37:0x0248, B:39:0x0253, B:32:0x022a, B:34:0x0235, B:27:0x020d, B:29:0x0218, B:22:0x01f0, B:24:0x01fb, B:15:0x017a, B:17:0x0185, B:12:0x016c, B:7:0x0153] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:183:0x07e5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static int stringToKeyword(java.lang.String r3) {
        /*
            Method dump skipped, instructions count: 2055
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.TokenStream.stringToKeyword(java.lang.String):int");
    }

    final String getSourceString() {
        return this.sourceString;
    }

    final int getLineno() {
        return this.lineno;
    }

    final String getString() {
        return this.string;
    }

    final char getQuoteChar() {
        return (char) this.quoteChar;
    }

    final double getNumber() {
        return this.number;
    }

    final boolean isNumberOctal() {
        return this.isOctal;
    }

    final boolean isNumberHex() {
        return this.isHex;
    }

    final boolean eof() {
        return this.hitEOF;
    }

    final int getToken() throws IOException {
        int c;
        boolean identifierStart;
        double dval;
        int c2;
        int c3;
        do {
            c = getChar();
            if (c == -1) {
                this.tokenBeg = this.cursor - 1;
                this.tokenEnd = this.cursor;
                return 0;
            }
            if (c == 10) {
                this.dirtyLine = false;
                this.tokenBeg = this.cursor - 1;
                this.tokenEnd = this.cursor;
                return 1;
            }
        } while (isJSSpace(c));
        if (c != 45) {
            this.dirtyLine = true;
        }
        this.tokenBeg = this.cursor - 1;
        this.tokenEnd = this.cursor;
        if (c == 64) {
            return 147;
        }
        boolean isUnicodeEscapeStart = false;
        if (c == 92) {
            c = getChar();
            if (c == 117) {
                identifierStart = true;
                isUnicodeEscapeStart = true;
                this.stringBufferTop = 0;
            } else {
                identifierStart = false;
                ungetChar(c);
                c = 92;
            }
        } else {
            identifierStart = Character.isJavaIdentifierStart((char) c);
            if (identifierStart) {
                this.stringBufferTop = 0;
                addToString(c);
            }
        }
        if (identifierStart) {
            boolean containsEscape = isUnicodeEscapeStart;
            while (true) {
                if (isUnicodeEscapeStart) {
                    int escapeVal = 0;
                    for (int i = 0; i != 4; i++) {
                        escapeVal = Kit.xDigitToInt(getChar(), escapeVal);
                        if (escapeVal < 0) {
                            break;
                        }
                    }
                    if (escapeVal < 0) {
                        this.parser.addError("msg.invalid.escape");
                        return -1;
                    }
                    addToString(escapeVal);
                    isUnicodeEscapeStart = false;
                } else {
                    c3 = getChar();
                    if (c3 == 92) {
                        if (getChar() == 117) {
                            isUnicodeEscapeStart = true;
                            containsEscape = true;
                        } else {
                            this.parser.addError("msg.illegal.character");
                            return -1;
                        }
                    } else {
                        if (c3 == -1 || c3 == BYTE_ORDER_MARK || !Character.isJavaIdentifierPart((char) c3)) {
                            break;
                        }
                        addToString(c3);
                    }
                }
            }
            ungetChar(c3);
            String str = getStringFromBuffer();
            if (!containsEscape) {
                int result = stringToKeyword(str);
                if (result != 0) {
                    if ((result == 153 || result == 72) && this.parser.compilerEnv.getLanguageVersion() < 170) {
                        this.string = result == 153 ? "let" : "yield";
                        result = 39;
                    }
                    this.string = (String) this.allStrings.intern(str);
                    if (result != 127) {
                        return result;
                    }
                    if (!this.parser.compilerEnv.isReservedKeywordAsIdentifier()) {
                        return result;
                    }
                }
            } else if (isKeyword(str)) {
                str = convertLastCharToHex(str);
            }
            this.string = (String) this.allStrings.intern(str);
            return 39;
        }
        if (isDigit(c) || (c == 46 && isDigit(peekChar()))) {
            this.isOctal = false;
            this.stringBufferTop = 0;
            int base = 10;
            this.isOctal = false;
            this.isHex = false;
            if (c == 48) {
                c = getChar();
                if (c == 120 || c == 88) {
                    base = 16;
                    this.isHex = true;
                    c = getChar();
                } else if (isDigit(c)) {
                    base = 8;
                    this.isOctal = true;
                } else {
                    addToString(48);
                }
            }
            if (base == 16) {
                while (0 <= Kit.xDigitToInt(c, 0)) {
                    addToString(c);
                    c = getChar();
                }
            } else {
                while (48 <= c && c <= 57) {
                    if (base == 8 && c >= 56) {
                        this.parser.addWarning("msg.bad.octal.literal", c == 56 ? "8" : "9");
                        base = 10;
                    }
                    addToString(c);
                    c = getChar();
                }
            }
            boolean isInteger = true;
            if (base == 10 && (c == 46 || c == 101 || c == 69)) {
                isInteger = false;
                if (c == 46) {
                    do {
                        addToString(c);
                        c = getChar();
                    } while (isDigit(c));
                }
                if (c == 101 || c == 69) {
                    addToString(c);
                    c = getChar();
                    if (c == 43 || c == 45) {
                        addToString(c);
                        c = getChar();
                    }
                    if (!isDigit(c)) {
                        this.parser.addError("msg.missing.exponent");
                        return -1;
                    }
                    do {
                        addToString(c);
                        c = getChar();
                    } while (isDigit(c));
                }
            }
            ungetChar(c);
            String numString = getStringFromBuffer();
            this.string = numString;
            if (base == 10 && !isInteger) {
                try {
                    dval = Double.parseDouble(numString);
                } catch (NumberFormatException e) {
                    this.parser.addError("msg.caught.nfe");
                    return -1;
                }
            } else {
                dval = ScriptRuntime.stringToNumber(numString, 0, base);
            }
            this.number = dval;
            return 40;
        }
        if (c == 34 || c == 39) {
            this.quoteChar = c;
            this.stringBufferTop = 0;
            int c4 = getChar(false);
            while (c4 != this.quoteChar) {
                if (c4 == 10 || c4 == -1) {
                    ungetChar(c4);
                    this.tokenEnd = this.cursor;
                    this.parser.addError("msg.unterminated.string.lit");
                    return -1;
                }
                if (c4 == 92) {
                    c4 = getChar();
                    switch (c4) {
                        case 10:
                            c4 = getChar();
                            continue;
                        case 98:
                            c4 = 8;
                            break;
                        case 102:
                            c4 = 12;
                            break;
                        case 110:
                            c4 = 10;
                            break;
                        case 114:
                            c4 = 13;
                            break;
                        case 116:
                            c4 = 9;
                            break;
                        case 117:
                            int escapeStart = this.stringBufferTop;
                            addToString(117);
                            int escapeVal2 = 0;
                            for (int i2 = 0; i2 != 4; i2++) {
                                c4 = getChar();
                                escapeVal2 = Kit.xDigitToInt(c4, escapeVal2);
                                if (escapeVal2 < 0) {
                                    break;
                                }
                                addToString(c4);
                            }
                            this.stringBufferTop = escapeStart;
                            c4 = escapeVal2;
                            break;
                        case 118:
                            c4 = 11;
                            break;
                        case 120:
                            c4 = getChar();
                            int escapeVal3 = Kit.xDigitToInt(c4, 0);
                            if (escapeVal3 < 0) {
                                addToString(120);
                            } else {
                                c4 = getChar();
                                int escapeVal4 = Kit.xDigitToInt(c4, escapeVal3);
                                if (escapeVal4 < 0) {
                                    addToString(120);
                                    addToString(c4);
                                } else {
                                    c4 = escapeVal4;
                                    break;
                                }
                            }
                        default:
                            if (48 <= c4 && c4 < 56) {
                                int val = c4 - 48;
                                int c5 = getChar();
                                if (48 <= c5 && c5 < 56) {
                                    val = ((8 * val) + c5) - 48;
                                    c5 = getChar();
                                    if (48 <= c5 && c5 < 56 && val <= 31) {
                                        val = ((8 * val) + c5) - 48;
                                        c5 = getChar();
                                    }
                                }
                                ungetChar(c5);
                                c4 = val;
                                break;
                            }
                            break;
                    }
                }
                addToString(c4);
                c4 = getChar(false);
            }
            this.string = (String) this.allStrings.intern(getStringFromBuffer());
            return 41;
        }
        switch (c) {
            case 33:
                if (matchChar(61)) {
                    if (matchChar(61)) {
                        return 47;
                    }
                    return 13;
                }
                return 26;
            case 34:
            case 35:
            case 36:
            case 39:
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 53:
            case 54:
            case 55:
            case 56:
            case 57:
            case 64:
            case 65:
            case 66:
            case 67:
            case 68:
            case 69:
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 80:
            case 81:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 90:
            case 92:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
            case 100:
            case 101:
            case 102:
            case 103:
            case 104:
            case 105:
            case 106:
            case 107:
            case 108:
            case 109:
            case 110:
            case 111:
            case 112:
            case 113:
            case 114:
            case 115:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 122:
            default:
                this.parser.addError("msg.illegal.character");
                return -1;
            case 37:
                if (matchChar(61)) {
                    return 101;
                }
                return 25;
            case 38:
                if (matchChar(38)) {
                    return 105;
                }
                if (matchChar(61)) {
                    return 93;
                }
                return 11;
            case 40:
                return 87;
            case 41:
                return 88;
            case 42:
                if (matchChar(61)) {
                    return 99;
                }
                return 23;
            case 43:
                if (matchChar(61)) {
                    return 97;
                }
                if (matchChar(43)) {
                    return 106;
                }
                return 21;
            case 44:
                return 89;
            case 45:
                if (matchChar(61)) {
                    c2 = 98;
                } else if (matchChar(45)) {
                    if (!this.dirtyLine && matchChar(62)) {
                        markCommentStart("--");
                        skipLine();
                        this.commentType = Token.CommentType.HTML;
                        return 161;
                    }
                    c2 = 107;
                } else {
                    c2 = 22;
                }
                this.dirtyLine = true;
                return c2;
            case 46:
                if (matchChar(46)) {
                    return 143;
                }
                if (matchChar(40)) {
                    return 146;
                }
                return 108;
            case 47:
                markCommentStart();
                if (matchChar(47)) {
                    this.tokenBeg = this.cursor - 2;
                    skipLine();
                    this.commentType = Token.CommentType.LINE;
                    return 161;
                }
                if (matchChar(42)) {
                    boolean lookForSlash = false;
                    this.tokenBeg = this.cursor - 2;
                    if (matchChar(42)) {
                        lookForSlash = true;
                        this.commentType = Token.CommentType.JSDOC;
                    } else {
                        this.commentType = Token.CommentType.BLOCK_COMMENT;
                    }
                    while (true) {
                        int c6 = getChar();
                        if (c6 == -1) {
                            this.tokenEnd = this.cursor - 1;
                            this.parser.addError("msg.unterminated.comment");
                            return 161;
                        }
                        if (c6 == 42) {
                            lookForSlash = true;
                        } else if (c6 == 47) {
                            if (lookForSlash) {
                                this.tokenEnd = this.cursor;
                                return 161;
                            }
                        } else {
                            lookForSlash = false;
                            this.tokenEnd = this.cursor;
                        }
                    }
                } else {
                    if (matchChar(61)) {
                        return 100;
                    }
                    return 24;
                }
            case 58:
                if (matchChar(58)) {
                    return 144;
                }
                return 103;
            case 59:
                return 82;
            case 60:
                if (matchChar(33)) {
                    if (matchChar(45)) {
                        if (matchChar(45)) {
                            this.tokenBeg = this.cursor - 4;
                            skipLine();
                            this.commentType = Token.CommentType.HTML;
                            return 161;
                        }
                        ungetCharIgnoreLineEnd(45);
                    }
                    ungetCharIgnoreLineEnd(33);
                }
                if (matchChar(60)) {
                    if (matchChar(61)) {
                        return 94;
                    }
                    return 18;
                }
                if (matchChar(61)) {
                    return 15;
                }
                return 14;
            case 61:
                if (matchChar(61)) {
                    if (matchChar(61)) {
                        return 46;
                    }
                    return 12;
                }
                return 90;
            case 62:
                if (matchChar(62)) {
                    if (matchChar(62)) {
                        if (matchChar(61)) {
                            return 96;
                        }
                        return 20;
                    }
                    if (matchChar(61)) {
                        return 95;
                    }
                    return 19;
                }
                if (matchChar(61)) {
                    return 17;
                }
                return 16;
            case 63:
                return 102;
            case 91:
                return 83;
            case 93:
                return 84;
            case 94:
                if (matchChar(61)) {
                    return 92;
                }
                return 10;
            case 123:
                return 85;
            case 124:
                if (matchChar(124)) {
                    return 104;
                }
                if (matchChar(61)) {
                    return 91;
                }
                return 9;
            case 125:
                return 86;
            case 126:
                return 27;
        }
    }

    private static boolean isAlpha(int c) {
        return c <= 90 ? 65 <= c : 97 <= c && c <= 122;
    }

    static boolean isDigit(int c) {
        return 48 <= c && c <= 57;
    }

    static boolean isJSSpace(int c) {
        return c <= 127 ? c == 32 || c == 9 || c == 12 || c == 11 : c == 160 || c == BYTE_ORDER_MARK || Character.getType((char) c) == 12;
    }

    private static boolean isJSFormatChar(int c) {
        return c > 127 && Character.getType((char) c) == 16;
    }

    void readRegExp(int startToken) throws IOException {
        int c;
        int start = this.tokenBeg;
        this.stringBufferTop = 0;
        if (startToken == 100) {
            addToString(61);
        } else if (startToken != 24) {
            Kit.codeBug();
        }
        boolean inCharSet = false;
        while (true) {
            int i = getChar();
            c = i;
            if (i != 47 || inCharSet) {
                if (c == 10 || c == -1) {
                    break;
                }
                if (c == 92) {
                    addToString(c);
                    c = getChar();
                } else if (c == 91) {
                    inCharSet = true;
                } else if (c == 93) {
                    inCharSet = false;
                }
                addToString(c);
            } else {
                int reEnd = this.stringBufferTop;
                while (true) {
                    if (matchChar(103)) {
                        addToString(103);
                    } else if (matchChar(105)) {
                        addToString(105);
                    } else if (matchChar(109)) {
                        addToString(109);
                    } else if (!matchChar(121)) {
                        break;
                    } else {
                        addToString(121);
                    }
                }
                this.tokenEnd = start + this.stringBufferTop + 2;
                if (isAlpha(peekChar())) {
                    this.parser.reportError("msg.invalid.re.flag");
                }
                this.string = new String(this.stringBuffer, 0, reEnd);
                this.regExpFlags = new String(this.stringBuffer, reEnd, this.stringBufferTop - reEnd);
                return;
            }
        }
        ungetChar(c);
        this.tokenEnd = this.cursor - 1;
        this.string = new String(this.stringBuffer, 0, this.stringBufferTop);
        this.parser.reportError("msg.unterminated.re.lit");
    }

    String readAndClearRegExpFlags() {
        String flags = this.regExpFlags;
        this.regExpFlags = null;
        return flags;
    }

    boolean isXMLAttribute() {
        return this.xmlIsAttribute;
    }

    int getFirstXMLToken() throws IOException {
        this.xmlOpenTagsCount = 0;
        this.xmlIsAttribute = false;
        this.xmlIsTagContent = false;
        if (!canUngetChar()) {
            return -1;
        }
        ungetChar(60);
        return getNextXMLToken();
    }

    /* JADX WARN: Code restructure failed: missing block: B:58:0x0225, code lost:
    
        r4.stringBufferTop = 0;
        r4.string = null;
        r4.parser.addError("msg.XML.bad.form");
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0239, code lost:
    
        return -1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    int getNextXMLToken() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 731
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.TokenStream.getNextXMLToken():int");
    }

    private boolean readQuotedString(int quote) throws IOException {
        int i = getChar();
        while (true) {
            int c = i;
            if (c != -1) {
                addToString(c);
                if (c == quote) {
                    return true;
                }
                i = getChar();
            } else {
                this.stringBufferTop = 0;
                this.string = null;
                this.parser.addError("msg.XML.bad.form");
                return false;
            }
        }
    }

    private boolean readXmlComment() throws IOException {
        int c = getChar();
        while (c != -1) {
            addToString(c);
            if (c == 45 && peekChar() == 45) {
                c = getChar();
                addToString(c);
                if (peekChar() == 62) {
                    int c2 = getChar();
                    addToString(c2);
                    return true;
                }
            } else {
                c = getChar();
            }
        }
        this.stringBufferTop = 0;
        this.string = null;
        this.parser.addError("msg.XML.bad.form");
        return false;
    }

    private boolean readCDATA() throws IOException {
        int c = getChar();
        while (c != -1) {
            addToString(c);
            if (c == 93 && peekChar() == 93) {
                c = getChar();
                addToString(c);
                if (peekChar() == 62) {
                    int c2 = getChar();
                    addToString(c2);
                    return true;
                }
            } else {
                c = getChar();
            }
        }
        this.stringBufferTop = 0;
        this.string = null;
        this.parser.addError("msg.XML.bad.form");
        return false;
    }

    private boolean readEntity() throws IOException {
        int declTags = 1;
        int i = getChar();
        while (true) {
            int c = i;
            if (c != -1) {
                addToString(c);
                switch (c) {
                    case 60:
                        declTags++;
                        break;
                    case 62:
                        declTags--;
                        if (declTags != 0) {
                            break;
                        } else {
                            return true;
                        }
                }
                i = getChar();
            } else {
                this.stringBufferTop = 0;
                this.string = null;
                this.parser.addError("msg.XML.bad.form");
                return false;
            }
        }
    }

    private boolean readPI() throws IOException {
        int i = getChar();
        while (true) {
            int c = i;
            if (c != -1) {
                addToString(c);
                if (c != 63 || peekChar() != 62) {
                    i = getChar();
                } else {
                    addToString(getChar());
                    return true;
                }
            } else {
                this.stringBufferTop = 0;
                this.string = null;
                this.parser.addError("msg.XML.bad.form");
                return false;
            }
        }
    }

    private String getStringFromBuffer() {
        this.tokenEnd = this.cursor;
        return new String(this.stringBuffer, 0, this.stringBufferTop);
    }

    private void addToString(int c) {
        int N = this.stringBufferTop;
        if (N == this.stringBuffer.length) {
            char[] tmp = new char[this.stringBuffer.length * 2];
            System.arraycopy(this.stringBuffer, 0, tmp, 0, N);
            this.stringBuffer = tmp;
        }
        this.stringBuffer[N] = (char) c;
        this.stringBufferTop = N + 1;
    }

    private boolean canUngetChar() {
        return this.ungetCursor == 0 || this.ungetBuffer[this.ungetCursor - 1] != 10;
    }

    private void ungetChar(int c) {
        if (this.ungetCursor != 0 && this.ungetBuffer[this.ungetCursor - 1] == 10) {
            Kit.codeBug();
        }
        int[] iArr = this.ungetBuffer;
        int i = this.ungetCursor;
        this.ungetCursor = i + 1;
        iArr[i] = c;
        this.cursor--;
    }

    private boolean matchChar(int test) throws IOException {
        int c = getCharIgnoreLineEnd();
        if (c == test) {
            this.tokenEnd = this.cursor;
            return true;
        }
        ungetCharIgnoreLineEnd(c);
        return false;
    }

    private int peekChar() throws IOException {
        int c = getChar();
        ungetChar(c);
        return c;
    }

    private int getChar() throws IOException {
        return getChar(true);
    }

    private int getChar(boolean skipFormattingChars) throws IOException {
        int c;
        if (this.ungetCursor != 0) {
            this.cursor++;
            int[] iArr = this.ungetBuffer;
            int i = this.ungetCursor - 1;
            this.ungetCursor = i;
            return iArr[i];
        }
        while (true) {
            if (this.sourceString != null) {
                if (this.sourceCursor == this.sourceEnd) {
                    this.hitEOF = true;
                    return -1;
                }
                this.cursor++;
                String str = this.sourceString;
                int i2 = this.sourceCursor;
                this.sourceCursor = i2 + 1;
                c = str.charAt(i2);
            } else {
                if (this.sourceCursor == this.sourceEnd && !fillSourceBuffer()) {
                    this.hitEOF = true;
                    return -1;
                }
                this.cursor++;
                char[] cArr = this.sourceBuffer;
                int i3 = this.sourceCursor;
                this.sourceCursor = i3 + 1;
                c = cArr[i3];
            }
            if (this.lineEndChar >= 0) {
                if (this.lineEndChar == 13 && c == 10) {
                    this.lineEndChar = 10;
                } else {
                    this.lineEndChar = -1;
                    this.lineStart = this.sourceCursor - 1;
                    this.lineno++;
                }
            }
            if (c <= 127) {
                if (c == 10 || c == 13) {
                    this.lineEndChar = c;
                    c = 10;
                }
            } else {
                if (c == BYTE_ORDER_MARK) {
                    return c;
                }
                if (!skipFormattingChars || !isJSFormatChar(c)) {
                    break;
                }
            }
        }
        if (ScriptRuntime.isJSLineTerminator(c)) {
            this.lineEndChar = c;
            c = 10;
        }
        return c;
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x00ce, code lost:
    
        return r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private int getCharIgnoreLineEnd() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 207
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.TokenStream.getCharIgnoreLineEnd():int");
    }

    private void ungetCharIgnoreLineEnd(int c) {
        int[] iArr = this.ungetBuffer;
        int i = this.ungetCursor;
        this.ungetCursor = i + 1;
        iArr[i] = c;
        this.cursor--;
    }

    private void skipLine() throws IOException {
        int c;
        do {
            c = getChar();
            if (c == -1) {
                break;
            }
        } while (c != 10);
        ungetChar(c);
        this.tokenEnd = this.cursor;
    }

    final int getOffset() {
        int n = this.sourceCursor - this.lineStart;
        if (this.lineEndChar >= 0) {
            n--;
        }
        return n;
    }

    private final int charAt(int index) {
        if (index < 0) {
            return -1;
        }
        if (this.sourceString != null) {
            if (index >= this.sourceEnd) {
                return -1;
            }
            return this.sourceString.charAt(index);
        }
        if (index >= this.sourceEnd) {
            int oldSourceCursor = this.sourceCursor;
            try {
                if (!fillSourceBuffer()) {
                    return -1;
                }
                index -= oldSourceCursor - this.sourceCursor;
            } catch (IOException e) {
                return -1;
            }
        }
        return this.sourceBuffer[index];
    }

    private final String substring(int beginIndex, int endIndex) {
        if (this.sourceString != null) {
            return this.sourceString.substring(beginIndex, endIndex);
        }
        int count = endIndex - beginIndex;
        return new String(this.sourceBuffer, beginIndex, count);
    }

    final String getLine() {
        int lineEnd;
        int lineEnd2 = this.sourceCursor;
        if (this.lineEndChar >= 0) {
            lineEnd = lineEnd2 - 1;
            if (this.lineEndChar == 10 && charAt(lineEnd - 1) == 13) {
                lineEnd--;
            }
        } else {
            int lineLength = lineEnd2 - this.lineStart;
            while (true) {
                int c = charAt(this.lineStart + lineLength);
                if (c == -1 || ScriptRuntime.isJSLineTerminator(c)) {
                    break;
                }
                lineLength++;
            }
            lineEnd = this.lineStart + lineLength;
        }
        return substring(this.lineStart, lineEnd);
    }

    final String getLine(int position, int[] linep) {
        if (!$assertionsDisabled && (position < 0 || position > this.cursor)) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && linep.length != 2) {
            throw new AssertionError();
        }
        int delta = (this.cursor + this.ungetCursor) - position;
        int cur = this.sourceCursor;
        if (delta > cur) {
            return null;
        }
        int end = 0;
        int lines = 0;
        while (delta > 0) {
            if (!$assertionsDisabled && cur <= 0) {
                throw new AssertionError();
            }
            int c = charAt(cur - 1);
            if (ScriptRuntime.isJSLineTerminator(c)) {
                if (c == 10 && charAt(cur - 2) == 13) {
                    delta--;
                    cur--;
                }
                lines++;
                end = cur - 1;
            }
            delta--;
            cur--;
        }
        int start = 0;
        int offset = 0;
        while (true) {
            if (cur <= 0) {
                break;
            }
            if (!ScriptRuntime.isJSLineTerminator(charAt(cur - 1))) {
                cur--;
                offset++;
            } else {
                start = cur;
                break;
            }
        }
        linep[0] = (this.lineno - lines) + (this.lineEndChar >= 0 ? 1 : 0);
        linep[1] = offset;
        if (lines == 0) {
            return getLine();
        }
        return substring(start, end);
    }

    private boolean fillSourceBuffer() throws IOException {
        if (this.sourceString != null) {
            Kit.codeBug();
        }
        if (this.sourceEnd == this.sourceBuffer.length) {
            if (this.lineStart != 0 && !isMarkingComment()) {
                System.arraycopy(this.sourceBuffer, this.lineStart, this.sourceBuffer, 0, this.sourceEnd - this.lineStart);
                this.sourceEnd -= this.lineStart;
                this.sourceCursor -= this.lineStart;
                this.lineStart = 0;
            } else {
                char[] tmp = new char[this.sourceBuffer.length * 2];
                System.arraycopy(this.sourceBuffer, 0, tmp, 0, this.sourceEnd);
                this.sourceBuffer = tmp;
            }
        }
        int n = this.sourceReader.read(this.sourceBuffer, this.sourceEnd, this.sourceBuffer.length - this.sourceEnd);
        if (n < 0) {
            return false;
        }
        this.sourceEnd += n;
        return true;
    }

    public int getCursor() {
        return this.cursor;
    }

    public int getTokenBeg() {
        return this.tokenBeg;
    }

    public int getTokenEnd() {
        return this.tokenEnd;
    }

    public int getTokenLength() {
        return this.tokenEnd - this.tokenBeg;
    }

    public Token.CommentType getCommentType() {
        return this.commentType;
    }

    private void markCommentStart() {
        markCommentStart("");
    }

    private void markCommentStart(String prefix) {
        if (this.parser.compilerEnv.isRecordingComments() && this.sourceReader != null) {
            this.commentPrefix = prefix;
            this.commentCursor = this.sourceCursor - 1;
        }
    }

    private boolean isMarkingComment() {
        return this.commentCursor != -1;
    }

    final String getAndResetCurrentComment() {
        if (this.sourceString != null) {
            if (isMarkingComment()) {
                Kit.codeBug();
            }
            return this.sourceString.substring(this.tokenBeg, this.tokenEnd);
        }
        if (!isMarkingComment()) {
            Kit.codeBug();
        }
        StringBuilder comment = new StringBuilder(this.commentPrefix);
        comment.append(this.sourceBuffer, this.commentCursor, getTokenLength() - this.commentPrefix.length());
        this.commentCursor = -1;
        return comment.toString();
    }

    private String convertLastCharToHex(String str) {
        int lastIndex = str.length() - 1;
        StringBuffer buf = new StringBuffer(str.substring(0, lastIndex));
        buf.append("\\u");
        String hexCode = Integer.toHexString(str.charAt(lastIndex));
        for (int i = 0; i < 4 - hexCode.length(); i++) {
            buf.append('0');
        }
        buf.append(hexCode);
        return buf.toString();
    }
}
