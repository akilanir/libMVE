package com.wutka.dtd;

import java.io.IOException;
import java.io.Reader;
import java.util.Hashtable;
import java.util.Stack;

/* loaded from: stax-1.2.0.jar:com/wutka/dtd/Scanner.class */
class Scanner {
    protected StreamInfo in;
    protected Stack inputStreams;
    protected Token nextToken;
    protected int nextChar;
    protected boolean atEOF;
    protected boolean trace;
    protected char[] expandBuffer;
    protected int expandPos;
    protected Hashtable entityExpansion;
    protected EntityExpansion expander;
    public static final TokenType LTQUES = new TokenType(0, "LTQUES");
    public static final TokenType IDENTIFIER = new TokenType(1, "IDENTIFIER");
    public static final TokenType EQUAL = new TokenType(2, "EQUAL");
    public static final TokenType LPAREN = new TokenType(3, "LPAREN");
    public static final TokenType RPAREN = new TokenType(4, "RPAREN");
    public static final TokenType COMMA = new TokenType(5, "COMMA");
    public static final TokenType STRING = new TokenType(6, "STRING");
    public static final TokenType QUESGT = new TokenType(7, "QUESGT");
    public static final TokenType LTBANG = new TokenType(8, "LTBANG");
    public static final TokenType GT = new TokenType(9, "GT");
    public static final TokenType PIPE = new TokenType(10, "PIPE");
    public static final TokenType QUES = new TokenType(11, "QUES");
    public static final TokenType PLUS = new TokenType(12, "PLUS");
    public static final TokenType ASTERISK = new TokenType(13, "ASTERISK");
    public static final TokenType LT = new TokenType(14, "LT");
    public static final TokenType EOF = new TokenType(15, "EOF");
    public static final TokenType COMMENT = new TokenType(16, "COMMENT");
    public static final TokenType PERCENT = new TokenType(17, "PERCENT");
    public static final TokenType CONDITIONAL = new TokenType(18, "CONDITIONAL");
    public static final TokenType ENDCONDITIONAL = new TokenType(19, "ENDCONDITIONAL");
    public static final TokenType NMTOKEN = new TokenType(20, "NMTOKEN");
    public static char[][] letterRanges = {new char[]{'A', 'Z'}, new char[]{'a', 'z'}, new char[]{192, 214}, new char[]{216, 246}, new char[]{248, 255}, new char[]{256, 305}, new char[]{308, 318}, new char[]{321, 328}, new char[]{330, 382}, new char[]{384, 451}, new char[]{461, 496}, new char[]{500, 501}, new char[]{506, 535}, new char[]{592, 680}, new char[]{699, 705}, new char[]{902, 902}, new char[]{904, 906}, new char[]{908, 908}, new char[]{910, 929}, new char[]{931, 974}, new char[]{976, 982}, new char[]{986, 986}, new char[]{988, 988}, new char[]{990, 990}, new char[]{992, 992}, new char[]{994, 1011}, new char[]{1025, 1036}, new char[]{1038, 1103}, new char[]{1105, 1116}, new char[]{1118, 1153}, new char[]{1168, 1220}, new char[]{1223, 1224}, new char[]{1227, 1228}, new char[]{1232, 1259}, new char[]{1262, 1269}, new char[]{1272, 1273}, new char[]{1329, 1366}, new char[]{1369, 1369}, new char[]{1377, 1414}, new char[]{1488, 1514}, new char[]{1520, 1522}, new char[]{1569, 1594}, new char[]{1601, 1610}, new char[]{1649, 1719}, new char[]{1722, 1726}, new char[]{1728, 1742}, new char[]{1744, 1747}, new char[]{1749, 1749}, new char[]{1765, 1766}, new char[]{2309, 2361}, new char[]{2365, 2365}, new char[]{2392, 2401}, new char[]{2437, 2444}, new char[]{2447, 2448}, new char[]{2451, 2472}, new char[]{2474, 2480}, new char[]{2482, 2482}, new char[]{2486, 2489}, new char[]{2524, 2525}, new char[]{2527, 2529}, new char[]{2544, 2545}, new char[]{2565, 2570}, new char[]{2575, 2576}, new char[]{2579, 2600}, new char[]{2602, 2608}, new char[]{2610, 2611}, new char[]{2613, 2614}, new char[]{2616, 2617}, new char[]{2649, 2652}, new char[]{2654, 2654}, new char[]{2674, 2676}, new char[]{2693, 2699}, new char[]{2701, 2701}, new char[]{2703, 2705}, new char[]{2707, 2728}, new char[]{2730, 2736}, new char[]{2738, 2739}, new char[]{2741, 2745}, new char[]{2749, 2749}, new char[]{2784, 2784}, new char[]{2821, 2828}, new char[]{2831, 2832}, new char[]{2835, 2856}, new char[]{2858, 2864}, new char[]{2866, 2867}, new char[]{2870, 2873}, new char[]{2877, 2877}, new char[]{2908, 2909}, new char[]{2911, 2913}, new char[]{2949, 2954}, new char[]{2958, 2960}, new char[]{2962, 2965}, new char[]{2969, 2970}, new char[]{2972, 2972}, new char[]{2974, 2975}, new char[]{2979, 2980}, new char[]{2984, 2986}, new char[]{2990, 2997}, new char[]{2999, 3001}, new char[]{3077, 3084}, new char[]{3086, 3088}, new char[]{3090, 3112}, new char[]{3114, 3123}, new char[]{3125, 3129}, new char[]{3168, 3169}, new char[]{3205, 3212}, new char[]{3214, 3216}, new char[]{3218, 3240}, new char[]{3242, 3251}, new char[]{3253, 3257}, new char[]{3294, 3294}, new char[]{3296, 3297}, new char[]{3333, 3340}, new char[]{3342, 3344}, new char[]{3346, 3368}, new char[]{3370, 3385}, new char[]{3424, 3425}, new char[]{3585, 3630}, new char[]{3632, 3632}, new char[]{3634, 3635}, new char[]{3648, 3653}, new char[]{3713, 3714}, new char[]{3716, 3716}, new char[]{3719, 3720}, new char[]{3722, 3722}, new char[]{3725, 3725}, new char[]{3732, 3735}, new char[]{3737, 3743}, new char[]{3745, 3747}, new char[]{3749, 3749}, new char[]{3751, 3751}, new char[]{3754, 3755}, new char[]{3757, 3758}, new char[]{3760, 3760}, new char[]{3762, 3763}, new char[]{3773, 3773}, new char[]{3776, 3780}, new char[]{3904, 3911}, new char[]{3913, 3945}, new char[]{4256, 4293}, new char[]{4304, 4342}, new char[]{4352, 4352}, new char[]{4354, 4355}, new char[]{4357, 4359}, new char[]{4361, 4361}, new char[]{4363, 4364}, new char[]{4366, 4370}, new char[]{4412, 4412}, new char[]{4414, 4414}, new char[]{4416, 4416}, new char[]{4428, 4428}, new char[]{4430, 4430}, new char[]{4432, 4432}, new char[]{4436, 4437}, new char[]{4441, 4441}, new char[]{4447, 4449}, new char[]{4451, 4451}, new char[]{4453, 4453}, new char[]{4455, 4455}, new char[]{4457, 4457}, new char[]{4461, 4462}, new char[]{4466, 4467}, new char[]{4469, 4469}, new char[]{4510, 4510}, new char[]{4520, 4520}, new char[]{4523, 4523}, new char[]{4526, 4527}, new char[]{4535, 4536}, new char[]{4538, 4538}, new char[]{4540, 4546}, new char[]{4587, 4587}, new char[]{4592, 4592}, new char[]{4601, 4601}, new char[]{7680, 7835}, new char[]{7840, 7929}, new char[]{7936, 7957}, new char[]{7960, 7965}, new char[]{7968, 8005}, new char[]{8008, 8013}, new char[]{8016, 8023}, new char[]{8025, 8025}, new char[]{8027, 8027}, new char[]{8029, 8029}, new char[]{8031, 8061}, new char[]{8064, 8116}, new char[]{8118, 8124}, new char[]{8126, 8126}, new char[]{8130, 8132}, new char[]{8134, 8140}, new char[]{8144, 8147}, new char[]{8150, 8155}, new char[]{8160, 8172}, new char[]{8178, 8180}, new char[]{8182, 8188}, new char[]{8486, 8486}, new char[]{8490, 8491}, new char[]{8494, 8494}, new char[]{8576, 8578}, new char[]{12353, 12436}, new char[]{12449, 12538}, new char[]{12549, 12588}, new char[]{44032, 55203}};

    /* loaded from: stax-1.2.0.jar:com/wutka/dtd/Scanner$StreamInfo.class */
    protected class StreamInfo {
        String id;
        Reader in;
        int lineNumber = 1;
        int column = 1;
        private final Scanner this$0;

        StreamInfo(Scanner scanner, String id, Reader in) {
            this.this$0 = scanner;
            this.id = id;
            this.in = in;
        }
    }

    public Scanner(Reader inReader, EntityExpansion anExpander) {
        this(inReader, false, anExpander);
    }

    public Scanner(Reader inReader, boolean doTrace, EntityExpansion anExpander) {
        this.in = new StreamInfo(this, "", inReader);
        this.atEOF = false;
        this.trace = doTrace;
        this.expandBuffer = null;
        this.entityExpansion = new Hashtable();
        this.expander = anExpander;
    }

    public Token peek() throws IOException {
        if (this.nextToken == null) {
            this.nextToken = readNextToken();
        }
        return this.nextToken;
    }

    public Token get() throws IOException {
        if (this.nextToken == null) {
            this.nextToken = readNextToken();
        }
        Token retval = this.nextToken;
        this.nextToken = null;
        return retval;
    }

    protected int readNextChar() throws IOException {
        int ch = this.in.in.read();
        if (ch < 0 && this.inputStreams != null && !this.inputStreams.empty()) {
            this.in.in.close();
            this.in = (StreamInfo) this.inputStreams.pop();
            return readNextChar();
        }
        return ch;
    }

    protected int peekChar() throws IOException {
        if (this.expandBuffer != null) {
            return this.expandBuffer[this.expandPos];
        }
        if (this.nextChar == 0) {
            this.nextChar = readNextChar();
            this.in.column++;
            if (this.nextChar == 10) {
                this.in.lineNumber++;
                this.in.column = 1;
            }
        }
        return this.nextChar;
    }

    protected int read() throws IOException {
        if (this.expandBuffer != null) {
            char[] cArr = this.expandBuffer;
            int i = this.expandPos;
            this.expandPos = i + 1;
            char c = cArr[i];
            if (this.expandPos >= this.expandBuffer.length) {
                this.expandPos = -1;
                this.expandBuffer = null;
            }
            if (this.trace) {
                System.out.print(c);
            }
            return c;
        }
        if (this.nextChar == 0) {
            peekChar();
        }
        int retval = this.nextChar;
        this.nextChar = 0;
        if (this.trace) {
            System.out.print((char) retval);
        }
        return retval;
    }

    public String getUntil(char stopChar) throws IOException {
        StringBuffer out = new StringBuffer();
        while (true) {
            int ch = read();
            if (ch >= 0) {
                if (ch == stopChar) {
                    return out.toString();
                }
                out.append((char) ch);
            } else {
                return out.toString();
            }
        }
    }

    public void skipUntil(char stopChar) throws IOException {
        int ch;
        do {
            ch = read();
            if (ch < 0) {
                return;
            }
        } while (ch != stopChar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x01a7, code lost:
    
        r0 = new java.lang.StringBuffer();
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x01b6, code lost:
    
        if (peekChar() == r0) goto L210;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x01b9, code lost:
    
        r0 = read();
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x01c1, code lost:
    
        if (r0 != 92) goto L211;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x01c4, code lost:
    
        r0.append((char) read());
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x01d2, code lost:
    
        if (r0 >= 0) goto L62;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x01d8, code lost:
    
        r0.append((char) r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x01e2, code lost:
    
        read();
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01f5, code lost:
    
        return new com.wutka.dtd.Token(com.wutka.dtd.Scanner.STRING, r0.toString());
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected com.wutka.dtd.Token readNextToken() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1268
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wutka.dtd.Scanner.readNextToken():com.wutka.dtd.Token");
    }

    public void skipConditional() throws IOException {
        int ch = 0;
        int nestingDepth = 0;
        while (true) {
            if (ch != 93) {
                ch = read();
            }
            if (ch == 93) {
                ch = read();
                if (ch == 93) {
                    ch = read();
                    if (ch == 62) {
                        if (nestingDepth != 0) {
                            nestingDepth--;
                        } else {
                            return;
                        }
                    }
                }
            }
            if (ch == 60) {
                ch = read();
                if (ch == 33) {
                    ch = read();
                    if (ch == 91) {
                        nestingDepth++;
                    }
                }
            }
        }
    }

    public String getUriId() {
        return this.in.id;
    }

    public int getLineNumber() {
        return this.in.lineNumber;
    }

    public int getColumn() {
        return this.in.column;
    }

    public boolean isIdentifierChar(char ch) {
        if (isLetter(ch) || ch == '_' || ch == ':') {
            return true;
        }
        return false;
    }

    public boolean isNameChar(char ch) {
        if (isLetter(ch) || isDigit(ch) || ch == '-' || ch == '_' || ch == '.' || ch == ':' || isCombiningChar(ch) || isExtender(ch)) {
            return true;
        }
        return false;
    }

    public boolean isLetter(char ch) {
        return isBaseChar(ch) || isIdeographic(ch);
    }

    public boolean isBaseChar(char ch) {
        for (int i = 0; i < letterRanges.length && ch >= letterRanges[i][0]; i++) {
            if (ch >= letterRanges[i][0] && ch <= letterRanges[i][1]) {
                return true;
            }
        }
        return false;
    }

    public boolean isIdeographic(char ch) {
        if (ch < 19968) {
            return false;
        }
        if ((ch < 19968 || ch > 40869) && ch != 12295) {
            return ch >= 12321 && ch <= 12329;
        }
        return true;
    }

    public boolean isDigit(char ch) {
        if (ch >= '0' && ch <= '9') {
            return true;
        }
        if (ch < 1632) {
            return false;
        }
        if (ch >= 1632 && ch <= 1641) {
            return true;
        }
        if (ch < 1776) {
            return false;
        }
        if (ch >= 1776 && ch <= 1785) {
            return true;
        }
        if (ch < 2406) {
            return false;
        }
        if (ch >= 2406 && ch <= 2415) {
            return true;
        }
        if (ch < 2534) {
            return false;
        }
        if (ch >= 2534 && ch <= 2543) {
            return true;
        }
        if (ch < 2662) {
            return false;
        }
        if (ch >= 2662 && ch <= 2671) {
            return true;
        }
        if (ch < 2790) {
            return false;
        }
        if (ch >= 2790 && ch <= 2799) {
            return true;
        }
        if (ch < 2918) {
            return false;
        }
        if (ch >= 2918 && ch <= 2927) {
            return true;
        }
        if (ch < 3047) {
            return false;
        }
        if (ch >= 3047 && ch <= 3055) {
            return true;
        }
        if (ch < 3174) {
            return false;
        }
        if (ch >= 3174 && ch <= 3183) {
            return true;
        }
        if (ch < 3302) {
            return false;
        }
        if (ch >= 3302 && ch <= 3311) {
            return true;
        }
        if (ch < 3430) {
            return false;
        }
        if (ch >= 3430 && ch <= 3439) {
            return true;
        }
        if (ch < 3664) {
            return false;
        }
        if (ch >= 3664 && ch <= 3673) {
            return true;
        }
        if (ch < 3792) {
            return false;
        }
        if (ch < 3792 || ch > 3801) {
            return ch >= 3872 && ch >= 3872 && ch <= 3881;
        }
        return true;
    }

    public boolean isCombiningChar(char ch) {
        if (ch < 768) {
            return false;
        }
        if (ch >= 768 && ch <= 837) {
            return true;
        }
        if (ch >= 864 && ch <= 865) {
            return true;
        }
        if (ch >= 1155 && ch <= 1158) {
            return true;
        }
        if (ch >= 1425 && ch <= 1441) {
            return true;
        }
        if (ch >= 1443 && ch <= 1465) {
            return true;
        }
        if ((ch >= 1467 && ch <= 1469) || ch == 1471) {
            return true;
        }
        if ((ch >= 1473 && ch <= 1474) || ch == 1476) {
            return true;
        }
        if ((ch >= 1611 && ch <= 1618) || ch == 1648) {
            return true;
        }
        if (ch >= 1750 && ch <= 1756) {
            return true;
        }
        if (ch >= 1757 && ch <= 1759) {
            return true;
        }
        if (ch >= 1760 && ch <= 1764) {
            return true;
        }
        if (ch >= 1767 && ch <= 1768) {
            return true;
        }
        if (ch >= 1770 && ch <= 1773) {
            return true;
        }
        if ((ch >= 2305 && ch <= 2307) || ch == 2364) {
            return true;
        }
        if ((ch >= 2366 && ch <= 2380) || ch == 2381) {
            return true;
        }
        if (ch >= 2385 && ch <= 2388) {
            return true;
        }
        if (ch >= 2402 && ch <= 2403) {
            return true;
        }
        if ((ch >= 2433 && ch <= 2435) || ch == 2492 || ch == 2494 || ch == 2495) {
            return true;
        }
        if (ch >= 2496 && ch <= 2500) {
            return true;
        }
        if (ch >= 2503 && ch <= 2504) {
            return true;
        }
        if ((ch >= 2507 && ch <= 2509) || ch == 2519) {
            return true;
        }
        if ((ch >= 2530 && ch <= 2531) || ch == 2562 || ch == 2620 || ch == 2622 || ch == 2623) {
            return true;
        }
        if (ch >= 2624 && ch <= 2626) {
            return true;
        }
        if (ch >= 2631 && ch <= 2632) {
            return true;
        }
        if (ch >= 2635 && ch <= 2637) {
            return true;
        }
        if (ch >= 2672 && ch <= 2673) {
            return true;
        }
        if ((ch >= 2689 && ch <= 2691) || ch == 2748) {
            return true;
        }
        if (ch >= 2750 && ch <= 2757) {
            return true;
        }
        if (ch >= 2759 && ch <= 2761) {
            return true;
        }
        if (ch >= 2763 && ch <= 2765) {
            return true;
        }
        if ((ch >= 2817 && ch <= 2819) || ch == 2876) {
            return true;
        }
        if (ch >= 2878 && ch <= 2883) {
            return true;
        }
        if (ch >= 2887 && ch <= 2888) {
            return true;
        }
        if (ch >= 2891 && ch <= 2893) {
            return true;
        }
        if (ch >= 2902 && ch <= 2903) {
            return true;
        }
        if (ch >= 2946 && ch <= 2947) {
            return true;
        }
        if (ch >= 3006 && ch <= 3010) {
            return true;
        }
        if (ch >= 3014 && ch <= 3016) {
            return true;
        }
        if ((ch >= 3018 && ch <= 3021) || ch == 3031) {
            return true;
        }
        if (ch >= 3073 && ch <= 3075) {
            return true;
        }
        if (ch >= 3134 && ch <= 3140) {
            return true;
        }
        if (ch >= 3142 && ch <= 3144) {
            return true;
        }
        if (ch >= 3146 && ch <= 3149) {
            return true;
        }
        if (ch >= 3157 && ch <= 3158) {
            return true;
        }
        if (ch >= 3202 && ch <= 3203) {
            return true;
        }
        if (ch >= 3262 && ch <= 3268) {
            return true;
        }
        if (ch >= 3270 && ch <= 3272) {
            return true;
        }
        if (ch >= 3274 && ch <= 3277) {
            return true;
        }
        if (ch >= 3285 && ch <= 3286) {
            return true;
        }
        if (ch >= 3330 && ch <= 3331) {
            return true;
        }
        if (ch >= 3390 && ch <= 3395) {
            return true;
        }
        if (ch >= 3398 && ch <= 3400) {
            return true;
        }
        if ((ch >= 3402 && ch <= 3405) || ch == 3415 || ch == 3633) {
            return true;
        }
        if (ch >= 3636 && ch <= 3642) {
            return true;
        }
        if ((ch >= 3655 && ch <= 3662) || ch == 3761) {
            return true;
        }
        if (ch >= 3764 && ch <= 3769) {
            return true;
        }
        if (ch >= 3771 && ch <= 3772) {
            return true;
        }
        if (ch >= 3784 && ch <= 3789) {
            return true;
        }
        if ((ch >= 3864 && ch <= 3865) || ch == 3893 || ch == 3895 || ch == 3897 || ch == 3902 || ch == 3903) {
            return true;
        }
        if (ch >= 3953 && ch <= 3972) {
            return true;
        }
        if (ch >= 3974 && ch <= 3979) {
            return true;
        }
        if ((ch >= 3984 && ch <= 3989) || ch == 3991) {
            return true;
        }
        if (ch >= 3993 && ch <= 4013) {
            return true;
        }
        if ((ch >= 4017 && ch <= 4023) || ch == 4025) {
            return true;
        }
        if ((ch < 8400 || ch > 8412) && ch != 8417) {
            return (ch >= 12330 && ch <= 12335) || ch == 12441 || ch == 12442;
        }
        return true;
    }

    public boolean isExtender(char ch) {
        if (ch < 183) {
            return false;
        }
        if (ch == 183 || ch == 720 || ch == 721 || ch == 903 || ch == 1600 || ch == 3654) {
            return true;
        }
        if (ch >= 12337 && ch <= 12341) {
            return true;
        }
        if (ch >= 12445 && ch <= 12446) {
            return true;
        }
        if (ch >= 12540 && ch <= 12542) {
            return true;
        }
        return false;
    }

    public boolean expandEntity(String entityName) throws IOException {
        Reader entityIn;
        String entity = (String) this.entityExpansion.get(entityName);
        if (entity != null) {
            expand(entity.toCharArray());
            return true;
        }
        DTDEntity realEntity = this.expander.expandEntity(entityName.substring(1, entityName.length() - 1));
        if (realEntity != null && (entityIn = realEntity.getReader()) != null) {
            if (this.inputStreams == null) {
                this.inputStreams = new Stack();
            }
            this.inputStreams.push(this.in);
            this.in = new StreamInfo(this, realEntity.getExternalId(), entityIn);
            return true;
        }
        return false;
    }

    public void expand(char[] expandChars) {
        if (this.expandBuffer != null) {
            int oldCharsLeft = this.expandBuffer.length - this.expandPos;
            char[] newExp = new char[oldCharsLeft + expandChars.length];
            System.arraycopy(expandChars, 0, newExp, 0, expandChars.length);
            System.arraycopy(this.expandBuffer, this.expandPos, newExp, expandChars.length, oldCharsLeft);
            this.expandPos = 0;
            this.expandBuffer = newExp;
            if (this.expandBuffer.length == 0) {
                this.expandBuffer = null;
                this.expandPos = -1;
                return;
            }
            return;
        }
        this.expandBuffer = expandChars;
        this.expandPos = 0;
        if (this.expandBuffer.length == 0) {
            this.expandBuffer = null;
            this.expandPos = -1;
        }
    }

    public void addEntity(String entityName, String entityValue) {
        this.entityExpansion.put(new StringBuffer().append("%").append(entityName).append(";").toString(), entityValue);
    }
}
