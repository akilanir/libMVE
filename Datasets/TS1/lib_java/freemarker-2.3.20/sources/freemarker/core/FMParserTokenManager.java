package freemarker.core;

import freemarker.debug.DebugModel;
import freemarker.template.Configuration;
import freemarker.template.Template;
import java.io.IOException;
import java.io.PrintStream;
import java.util.StringTokenizer;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/FMParserTokenManager.class */
class FMParserTokenManager implements FMParserConstants {
    String noparseTag;
    private FMParser parser;
    private int hashLiteralNesting;
    private int parenthesisNesting;
    private int bracketNesting;
    private boolean inFTLHeader;
    boolean strictEscapeSyntax;
    boolean onlyTextOutput;
    boolean squBracTagSyntax;
    boolean autodetectTagSyntax;
    boolean directiveSyntaxEstablished;
    boolean inInvocation;
    int incompatibleImprovements;
    public PrintStream debugStream;
    static final long[] jjbitVec0 = {-2, -1, -1, -1};
    static final long[] jjbitVec2 = {0, 0, -1, -1};
    static final long[] jjbitVec3 = {2301339413881290750L, -16384, 4294967295L, 432345564227567616L};
    static final long[] jjbitVec4 = {0, 0, 0, -36028797027352577L};
    static final long[] jjbitVec5 = {0, -1, -1, -1};
    static final long[] jjbitVec6 = {-1, -1, 65535, 0};
    static final long[] jjbitVec7 = {-1, -1, 0, 0};
    static final long[] jjbitVec8 = {70368744177663L, 0, 0, 0};
    static final int[] jjnextStates = {10, 12, 4, 5, 3, 4, 5, 557, 566, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 336, 337, 345, 346, 357, 358, 369, 370, 381, 382, 391, 392, 402, 403, 413, 414, 426, 427, 436, 437, 449, 450, 463, 464, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 501, 502, 503, 515, 516, 521, 527, 528, 530, 12, 21, 24, 31, 36, 44, 51, 56, 63, 70, 76, 84, 91, 100, FMParserConstants.OR, FMParserConstants.CLOSE_BRACE, FMParserConstants.LETTER, FMParserConstants.NATURAL_GTE, 134, 139, 147, 157, 166, 175, 182, 190, 199, 206, 214, 215, 223, 228, 233, 242, 251, 258, 268, 276, 287, 294, 304, 5, 6, 14, 15, 149, 150, 159, 160, 168, 169, 177, 178, 179, 184, 185, 186, 192, 193, 194, 201, 202, 203, 208, 209, 210, 216, 217, 218, 220, 221, 222, 225, 226, 227, 230, 231, 232, 235, 236, 244, 245, 246, 260, 261, 262, 278, 279, 280, 296, 297, 332, 333, 339, 340, 348, 349, 360, 361, 372, 373, 384, 385, 394, 395, 405, 406, 416, 417, 429, 430, 439, 440, 452, 453, 466, 467, 493, 494, 505, 506, 560, 561, 564, 565, 561, 563, 564, 565, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 545, 502, 546, 516, 549, 552, 528, 553, 523, 524, 559, 564, 565, 42, 43, 44, 62, 65, 68, 72, 73, 39, 40, 13, 14, 16, 6, 7, 9, 51, 53, 55, 58, 20, 23, 8, 10, 15, 17, 21, 22, 24, 25, 39, 40, 41, 59, 62, 65, 69, 70, 48, 50, 52, 55, 3, 5, 38, 39, 40, 58, 61, 64, 68, 69, 35, 36, 8, 9, 11, 1, 2, 4, 47, 49, 51, 54, 15, 18, 16, 17, 19, 20, 44, 45, 46, 64, 67, 70, 74, 75, 41, 42, 53, 55, 57, 60};
    public static final String[] jjstrLiteralImages = {"", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "${", "#{", null, null, null, null, null, null, null, null, null, null, "false", "true", null, null, ".", "..", "?", "??", "=", "==", "!=", null, null, null, null, "+", "-", "*", "**", "...", "/", "%", null, null, "!", ",", ";", ":", "[", "]", "(", ")", "{", "}", "in", "as", "using", null, null, null, null, ">", null, ">", ">=", null, null, null, null, null, null};
    public static final String[] lexStateNames = {"DEFAULT", "NODIRECTIVE", "FM_EXPRESSION", "IN_PAREN", "NAMED_PARAMETER_EXPRESSION", "EXPRESSION_COMMENT", "NO_SPACE_EXPRESSION", "NO_PARSE"};
    public static final int[] jjnewLexState = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 2, -1, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2, 2, -1, -1, -1, -1};
    static final long[] jjtoToken = {-63, -864691128455265793L, 63};
    static final long[] jjtoSkip = {0, 65024, 0};
    protected SimpleCharStream input_stream;
    private final int[] jjrounds;
    private final int[] jjstateSet;
    StringBuffer image;
    int jjimageLen;
    int lengthOfMatch;
    protected char curChar;
    int curLexState;
    int defaultLexState;
    int jjnewStateCnt;
    int jjround;
    int jjmatchedPos;
    int jjmatchedKind;

    void setParser(FMParser parser) {
        this.parser = parser;
    }

    Template getTemplate() {
        if (this.parser != null) {
            return this.parser.getTemplate();
        }
        return null;
    }

    private void strictSyntaxCheck(Token tok, int newLexState) {
        if (this.onlyTextOutput) {
            tok.kind = 69;
            return;
        }
        char firstChar = tok.image.charAt(0);
        if (this.autodetectTagSyntax && !this.directiveSyntaxEstablished) {
            this.squBracTagSyntax = firstChar == '[';
        }
        if ((firstChar == '[' && !this.squBracTagSyntax) || (firstChar == '<' && this.squBracTagSyntax)) {
            tok.kind = 69;
            return;
        }
        if (!this.strictEscapeSyntax) {
            SwitchTo(newLexState);
            return;
        }
        if (!this.squBracTagSyntax && !tok.image.startsWith("<#") && !tok.image.startsWith("</#")) {
            tok.kind = 69;
        } else {
            this.directiveSyntaxEstablished = true;
            SwitchTo(newLexState);
        }
    }

    private void unifiedCall(Token tok) {
        char firstChar = tok.image.charAt(0);
        if (this.autodetectTagSyntax && !this.directiveSyntaxEstablished) {
            this.squBracTagSyntax = firstChar == '[';
        }
        if (this.squBracTagSyntax && firstChar == '<') {
            tok.kind = 69;
        } else if (!this.squBracTagSyntax && firstChar == '[') {
            tok.kind = 69;
        } else {
            this.directiveSyntaxEstablished = true;
            SwitchTo(6);
        }
    }

    private void unifiedCallEnd(Token tok) {
        char firstChar = tok.image.charAt(0);
        if (this.squBracTagSyntax && firstChar == '<') {
            tok.kind = 69;
        } else if (!this.squBracTagSyntax && firstChar == '[') {
            tok.kind = 69;
        }
    }

    private void closeBracket(Token tok) {
        if (this.bracketNesting > 0) {
            this.bracketNesting--;
            return;
        }
        tok.kind = FMParserConstants.DIRECTIVE_END;
        if (this.inFTLHeader) {
            eatNewline();
            this.inFTLHeader = false;
        }
        SwitchTo(0);
    }

    private void eatNewline() {
        char c;
        int charsRead = 0;
        do {
            try {
                c = this.input_stream.readChar();
                charsRead++;
                if (!Character.isWhitespace(c)) {
                    this.input_stream.backup(charsRead);
                    return;
                } else if (c == '\r') {
                    char next = this.input_stream.readChar();
                    int i = charsRead + 1;
                    if (next != '\n') {
                        this.input_stream.backup(1);
                        return;
                    }
                    return;
                }
            } catch (IOException e) {
                this.input_stream.backup(charsRead);
                return;
            }
        } while (c != '\n');
    }

    private void ftlHeader(Token matchedToken) {
        if (!this.directiveSyntaxEstablished) {
            this.squBracTagSyntax = matchedToken.image.charAt(0) == '[';
            this.directiveSyntaxEstablished = true;
            this.autodetectTagSyntax = false;
        }
        String img = matchedToken.image;
        char firstChar = img.charAt(0);
        char lastChar = img.charAt(img.length() - 1);
        if ((firstChar == '[' && !this.squBracTagSyntax) || (firstChar == '<' && this.squBracTagSyntax)) {
            matchedToken.kind = 69;
        }
        if (matchedToken.kind != 69) {
            if (lastChar != '>' && lastChar != ']') {
                SwitchTo(2);
                this.inFTLHeader = true;
            } else {
                eatNewline();
            }
        }
    }

    public void setDebugStream(PrintStream ds) {
        this.debugStream = ds;
    }

    private final int jjMoveStringLiteralDfa0_7() {
        return jjMoveNfa_7(0, 0);
    }

    private final void jjCheckNAdd(int state) {
        if (this.jjrounds[state] != this.jjround) {
            int[] iArr = this.jjstateSet;
            int i = this.jjnewStateCnt;
            this.jjnewStateCnt = i + 1;
            iArr[i] = state;
            this.jjrounds[state] = this.jjround;
        }
    }

    private final void jjAddStates(int start, int end) {
        int i;
        do {
            int[] iArr = this.jjstateSet;
            int i2 = this.jjnewStateCnt;
            this.jjnewStateCnt = i2 + 1;
            iArr[i2] = jjnextStates[start];
            i = start;
            start++;
        } while (i != end);
    }

    private final void jjCheckNAddTwoStates(int state1, int state2) {
        jjCheckNAdd(state1);
        jjCheckNAdd(state2);
    }

    private final void jjCheckNAddStates(int start, int end) {
        int i;
        do {
            jjCheckNAdd(jjnextStates[start]);
            i = start;
            start++;
        } while (i != end);
    }

    private final void jjCheckNAddStates(int start) {
        jjCheckNAdd(jjnextStates[start]);
        jjCheckNAdd(jjnextStates[start + 1]);
    }

    private final int jjMoveNfa_7(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 13;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if (((-1152956688978935809L) & l) != 0) {
                                if (kind > 132) {
                                    kind = 132;
                                }
                                jjCheckNAdd(6);
                            } else if ((1152956688978935808L & l) != 0 && kind > 133) {
                                kind = 133;
                            }
                            if (this.curChar == '-') {
                                jjAddStates(0, 1);
                                break;
                            } else if (this.curChar == '<') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 1;
                                break;
                            }
                            break;
                        case 1:
                            if (this.curChar == '/') {
                                jjCheckNAddTwoStates(2, 3);
                                break;
                            }
                            break;
                        case 2:
                            if (this.curChar == '#') {
                                jjCheckNAdd(3);
                                break;
                            }
                            break;
                        case 4:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(2, 3);
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == '>' && kind > 131) {
                                kind = 131;
                                break;
                            }
                            break;
                        case 6:
                            if (((-1152956688978935809L) & l) != 0) {
                                if (kind > 132) {
                                    kind = 132;
                                }
                                jjCheckNAdd(6);
                                break;
                            }
                            break;
                        case 7:
                            if ((1152956688978935808L & l) != 0 && kind > 133) {
                                kind = 133;
                                break;
                            }
                            break;
                        case 8:
                            if (this.curChar == '-') {
                                jjAddStates(0, 1);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == '>' && kind > 130) {
                                kind = 130;
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if (this.curChar == '-') {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 9;
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == '-') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 11;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if (((-134217729) & l2) != 0) {
                                if (kind > 132) {
                                    kind = 132;
                                }
                                jjCheckNAdd(6);
                            } else if (this.curChar == '[' && kind > 133) {
                                kind = 133;
                            }
                            if (this.curChar == '[') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 1;
                                break;
                            }
                            break;
                        case 3:
                            if ((576460743847706622L & l2) != 0) {
                                jjAddStates(4, 6);
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == ']' && kind > 131) {
                                kind = 131;
                                break;
                            }
                            break;
                        case 6:
                            if (((-134217729) & l2) != 0) {
                                if (kind > 132) {
                                    kind = 132;
                                }
                                jjCheckNAdd(6);
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == '[' && kind > 133) {
                                kind = 133;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if (this.curChar == ']' && kind > 130) {
                                kind = 130;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                        case 6:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                if (kind > 132) {
                                    kind = 132;
                                }
                                jjCheckNAdd(6);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i7 = this.jjnewStateCnt;
            i = i7;
            int i8 = startsAt;
            this.jjnewStateCnt = i8;
            int i9 = 13 - i8;
            startsAt = i9;
            if (i7 == i9) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_1(int pos, long active0, long active1) {
        switch (pos) {
            case 0:
                if ((active1 & 384) != 0) {
                    this.jjmatchedKind = 70;
                    break;
                }
                break;
        }
        return -1;
    }

    private final int jjStartNfa_1(int pos, long active0, long active1) {
        return jjMoveNfa_1(jjStopStringLiteralDfa_1(pos, active0, active1), pos + 1);
    }

    private final int jjStopAtPos(int pos, int kind) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        return pos + 1;
    }

    private final int jjStartNfaWithStates_1(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_1(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_1() {
        switch (this.curChar) {
            case FMParserConstants.END_FOREACH /* 35 */:
                return jjMoveStringLiteralDfa1_1(256L);
            case FMParserConstants.END_LOCAL /* 36 */:
                return jjMoveStringLiteralDfa1_1(128L);
            default:
                return jjMoveNfa_1(2, 0);
        }
    }

    private final int jjMoveStringLiteralDfa1_1(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DIGIT /* 123 */:
                    if ((active1 & 128) != 0) {
                        return jjStopAtPos(1, 71);
                    }
                    if ((active1 & 256) != 0) {
                        return jjStopAtPos(1, 72);
                    }
                    break;
            }
            return jjStartNfa_1(0, 0L, active1);
        } catch (IOException e) {
            jjStopStringLiteralDfa_1(0, 0L, active1);
            return 1;
        }
    }

    private final int jjMoveNfa_1(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 3;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((4294977024L & l) != 0) {
                                kind = 68;
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if (((-1152921611981039105L) & l) != 0) {
                                kind = 69;
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                        case 2:
                            if (((-1152921611981039105L) & l) == 0) {
                                if ((4294977024L & l) != 0) {
                                    if (kind > 68) {
                                        kind = 68;
                                    }
                                    jjCheckNAdd(0);
                                    break;
                                } else if ((1152921607686062080L & l) != 0 && kind > 70) {
                                    kind = 70;
                                    break;
                                }
                            } else {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                            if (((-576460752437641217L) & l2) != 0) {
                                kind = 69;
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                        case 2:
                            if (((-576460752437641217L) & l2) != 0) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            } else if ((576460752437641216L & l2) != 0 && kind > 70) {
                                kind = 70;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                        case 2:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i3 = this.jjnewStateCnt;
            i = i3;
            int i4 = startsAt;
            this.jjnewStateCnt = i4;
            int i5 = 3 - i4;
            startsAt = i5;
            if (i3 == i5) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_0(int pos, long active0, long active1) {
        switch (pos) {
            case 0:
                if ((active1 & 384) != 0) {
                    this.jjmatchedKind = 70;
                    break;
                }
                break;
        }
        return -1;
    }

    private final int jjStartNfa_0(int pos, long active0, long active1) {
        return jjMoveNfa_0(jjStopStringLiteralDfa_0(pos, active0, active1), pos + 1);
    }

    private final int jjStartNfaWithStates_0(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_0(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_0() {
        switch (this.curChar) {
            case FMParserConstants.END_FOREACH /* 35 */:
                return jjMoveStringLiteralDfa1_0(256L);
            case FMParserConstants.END_LOCAL /* 36 */:
                return jjMoveStringLiteralDfa1_0(128L);
            default:
                return jjMoveNfa_0(2, 0);
        }
    }

    private final int jjMoveStringLiteralDfa1_0(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DIGIT /* 123 */:
                    if ((active1 & 128) != 0) {
                        return jjStopAtPos(1, 71);
                    }
                    if ((active1 & 256) != 0) {
                        return jjStopAtPos(1, 72);
                    }
                    break;
            }
            return jjStartNfa_0(0, 0L, active1);
        } catch (IOException e) {
            jjStopStringLiteralDfa_0(0, 0L, active1);
            return 1;
        }
    }

    private final int jjMoveNfa_0(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 567;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((4294977024L & l) != 0) {
                                if (kind > 68) {
                                    kind = 68;
                                }
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if (((-1152921611981039105L) & l) != 0) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                        case 2:
                            if (((-1152921611981039105L) & l) != 0) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                            } else if ((4294977024L & l) != 0) {
                                if (kind > 68) {
                                    kind = 68;
                                }
                                jjCheckNAdd(0);
                            } else if ((1152921607686062080L & l) != 0 && kind > 70) {
                                kind = 70;
                            }
                            if (this.curChar == '<') {
                                jjAddStates(7, 8);
                            }
                            if (this.curChar == '<') {
                                jjCheckNAddStates(9, 84);
                            }
                            if (this.curChar == '<') {
                                jjCheckNAddStates(85, FMParserConstants.EMPTY_DIRECTIVE_END);
                                break;
                            }
                            break;
                        case 3:
                            if (this.curChar == '<') {
                                jjCheckNAddStates(85, FMParserConstants.EMPTY_DIRECTIVE_END);
                                break;
                            }
                            break;
                        case 5:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(FMParserConstants.NATURAL_GT, FMParserConstants.NATURAL_GTE);
                                break;
                            }
                            break;
                        case 6:
                            if (this.curChar == '>' && kind > 6) {
                                kind = 6;
                                break;
                            }
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(128, FMParserConstants.TERMINATING_EXCLAM);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if (this.curChar == '>' && kind > 7) {
                                kind = 7;
                                break;
                            }
                            break;
                        case FMParserConstants.STOP /* 23 */:
                            if ((4294977024L & l) != 0 && kind > 8) {
                                kind = 8;
                                break;
                            }
                            break;
                        case FMParserConstants.SETTING /* 26 */:
                            if ((4294977024L & l) != 0 && kind > 9) {
                                kind = 9;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                            if ((4294977024L & l) != 0 && kind > 10) {
                                kind = 10;
                                break;
                            }
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            if ((4294977024L & l) != 0 && kind > 11) {
                                kind = 11;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RETURN /* 46 */:
                            if ((4294977024L & l) != 0 && kind > 12) {
                                kind = 12;
                                break;
                            }
                            break;
                        case FMParserConstants.DEFAUL /* 53 */:
                            if ((4294977024L & l) != 0 && kind > 13) {
                                kind = 13;
                                break;
                            }
                            break;
                        case FMParserConstants.FALLBACK /* 58 */:
                            if ((4294977024L & l) != 0 && kind > 14) {
                                kind = 14;
                                break;
                            }
                            break;
                        case FMParserConstants.FTL_HEADER /* 65 */:
                            if ((4294977024L & l) != 0 && kind > 15) {
                                kind = 15;
                                break;
                            }
                            break;
                        case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                            if ((4294977024L & l) != 0 && kind > 16) {
                                kind = 16;
                                break;
                            }
                            break;
                        case 78:
                            if ((4294977024L & l) != 0 && kind > 17) {
                                kind = 17;
                                break;
                            }
                            break;
                        case FMParserConstants.DECIMAL /* 86 */:
                            if ((4294977024L & l) != 0 && kind > 18) {
                                kind = 18;
                                break;
                            }
                            break;
                        case FMParserConstants.NOT_EQUALS /* 93 */:
                            if ((4294977024L & l) != 0 && kind > 19) {
                                kind = 19;
                                break;
                            }
                            break;
                        case FMParserConstants.ELLIPSIS /* 102 */:
                            if ((4294977024L & l) != 0 && kind > 20) {
                                kind = 20;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMA /* 108 */:
                            if ((4294977024L & l) != 0 && kind > 21) {
                                kind = 21;
                                break;
                            }
                            break;
                        case FMParserConstants.AS /* 118 */:
                            if ((4294977024L & l) != 0 && kind > 22) {
                                kind = 22;
                                break;
                            }
                            break;
                        case FMParserConstants.DIRECTIVE_END /* 124 */:
                            if ((4294977024L & l) != 0 && kind > 23) {
                                kind = 23;
                                break;
                            }
                            break;
                        case FMParserConstants.TERMINATING_EXCLAM /* 129 */:
                            if ((4294977024L & l) != 0 && kind > 24) {
                                kind = 24;
                                break;
                            }
                            break;
                        case 136:
                            if ((4294977024L & l) != 0 && kind > 25) {
                                kind = 25;
                                break;
                            }
                            break;
                        case 141:
                            if ((4294977024L & l) != 0 && kind > 26) {
                                kind = 26;
                                break;
                            }
                            break;
                        case 149:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(FMParserConstants.TERSE_COMMENT_END, FMParserConstants.MAYBE_END);
                                break;
                            }
                            break;
                        case 150:
                            if (this.curChar == '>' && kind > 27) {
                                kind = 27;
                                break;
                            }
                            break;
                        case 159:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(FMParserConstants.KEEP_GOING, FMParserConstants.LONE_LESS_THAN_OR_DASH);
                                break;
                            }
                            break;
                        case 160:
                            if (this.curChar == '>' && kind > 28) {
                                kind = 28;
                                break;
                            }
                            break;
                        case 168:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(134, 135);
                                break;
                            }
                            break;
                        case 169:
                            if (this.curChar == '>' && kind > 30) {
                                kind = 30;
                                break;
                            }
                            break;
                        case 177:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(136, 138);
                                break;
                            }
                            break;
                        case 178:
                            if (this.curChar == '/') {
                                jjCheckNAdd(179);
                                break;
                            }
                            break;
                        case 179:
                            if (this.curChar == '>' && kind > 44) {
                                kind = 44;
                                break;
                            }
                            break;
                        case 184:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(139, 141);
                                break;
                            }
                            break;
                        case 185:
                            if (this.curChar == '/') {
                                jjCheckNAdd(186);
                                break;
                            }
                            break;
                        case 186:
                            if (this.curChar == '>' && kind > 45) {
                                kind = 45;
                                break;
                            }
                            break;
                        case 192:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(142, 144);
                                break;
                            }
                            break;
                        case 193:
                            if (this.curChar == '/') {
                                jjCheckNAdd(194);
                                break;
                            }
                            break;
                        case 194:
                            if (this.curChar == '>' && kind > 46) {
                                kind = 46;
                                break;
                            }
                            break;
                        case 201:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(145, 147);
                                break;
                            }
                            break;
                        case 202:
                            if (this.curChar == '/') {
                                jjCheckNAdd(203);
                                break;
                            }
                            break;
                        case 203:
                            if (this.curChar == '>' && kind > 47) {
                                kind = 47;
                                break;
                            }
                            break;
                        case 208:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(148, 150);
                                break;
                            }
                            break;
                        case 209:
                            if (this.curChar == '/') {
                                jjCheckNAdd(210);
                                break;
                            }
                            break;
                        case 210:
                            if (this.curChar == '>' && kind > 48) {
                                kind = 48;
                                break;
                            }
                            break;
                        case 216:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(151, 153);
                                break;
                            }
                            break;
                        case 217:
                            if (this.curChar == '/') {
                                jjCheckNAdd(218);
                                break;
                            }
                            break;
                        case 218:
                            if (this.curChar == '>' && kind > 49) {
                                kind = 49;
                                break;
                            }
                            break;
                        case 220:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(154, 156);
                                break;
                            }
                            break;
                        case 221:
                            if (this.curChar == '/') {
                                jjCheckNAdd(222);
                                break;
                            }
                            break;
                        case 222:
                            if (this.curChar == '>' && kind > 50) {
                                kind = 50;
                                break;
                            }
                            break;
                        case 225:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(157, 159);
                                break;
                            }
                            break;
                        case 226:
                            if (this.curChar == '/') {
                                jjCheckNAdd(227);
                                break;
                            }
                            break;
                        case 227:
                            if (this.curChar == '>' && kind > 51) {
                                kind = 51;
                                break;
                            }
                            break;
                        case 230:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(160, 162);
                                break;
                            }
                            break;
                        case 231:
                            if (this.curChar == '/') {
                                jjCheckNAdd(232);
                                break;
                            }
                            break;
                        case 232:
                            if (this.curChar == '>' && kind > 52) {
                                kind = 52;
                                break;
                            }
                            break;
                        case 235:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(163, 164);
                                break;
                            }
                            break;
                        case 236:
                            if (this.curChar == '>' && kind > 53) {
                                kind = 53;
                                break;
                            }
                            break;
                        case 244:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(165, 167);
                                break;
                            }
                            break;
                        case 245:
                            if (this.curChar == '/') {
                                jjCheckNAdd(246);
                                break;
                            }
                            break;
                        case 246:
                            if (this.curChar == '>' && kind > 54) {
                                kind = 54;
                                break;
                            }
                            break;
                        case 253:
                            if ((4294977024L & l) != 0 && kind > 55) {
                                kind = 55;
                                break;
                            }
                            break;
                        case 260:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(168, 170);
                                break;
                            }
                            break;
                        case 261:
                            if (this.curChar == '/') {
                                jjCheckNAdd(262);
                                break;
                            }
                            break;
                        case 262:
                            if (this.curChar == '>' && kind > 56) {
                                kind = 56;
                                break;
                            }
                            break;
                        case 270:
                            if ((4294977024L & l) != 0 && kind > 57) {
                                kind = 57;
                                break;
                            }
                            break;
                        case 278:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddStates(171, 173);
                                break;
                            }
                            break;
                        case 279:
                            if (this.curChar == '/') {
                                jjCheckNAdd(280);
                                break;
                            }
                            break;
                        case 280:
                            if (this.curChar == '>' && kind > 58) {
                                kind = 58;
                                break;
                            }
                            break;
                        case 289:
                            if ((4294977024L & l) != 0 && kind > 59) {
                                kind = 59;
                                break;
                            }
                            break;
                        case 296:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(174, 175);
                                break;
                            }
                            break;
                        case 297:
                            if (this.curChar == '>' && kind > 61) {
                                kind = 61;
                                break;
                            }
                            break;
                        case 305:
                            if (this.curChar == '<') {
                                jjCheckNAddStates(9, 84);
                                break;
                            }
                            break;
                        case 306:
                            if (this.curChar == '#') {
                                jjCheckNAdd(12);
                                break;
                            }
                            break;
                        case 307:
                            if (this.curChar == '#') {
                                jjCheckNAdd(21);
                                break;
                            }
                            break;
                        case 308:
                            if (this.curChar == '#') {
                                jjCheckNAdd(24);
                                break;
                            }
                            break;
                        case 309:
                            if (this.curChar == '#') {
                                jjCheckNAdd(31);
                                break;
                            }
                            break;
                        case 310:
                            if (this.curChar == '#') {
                                jjCheckNAdd(36);
                                break;
                            }
                            break;
                        case 311:
                            if (this.curChar == '#') {
                                jjCheckNAdd(44);
                                break;
                            }
                            break;
                        case 312:
                            if (this.curChar == '#') {
                                jjCheckNAdd(51);
                                break;
                            }
                            break;
                        case 313:
                            if (this.curChar == '#') {
                                jjCheckNAdd(56);
                                break;
                            }
                            break;
                        case 314:
                            if (this.curChar == '#') {
                                jjCheckNAdd(63);
                                break;
                            }
                            break;
                        case 315:
                            if (this.curChar == '#') {
                                jjCheckNAdd(70);
                                break;
                            }
                            break;
                        case 316:
                            if (this.curChar == '#') {
                                jjCheckNAdd(76);
                                break;
                            }
                            break;
                        case 317:
                            if (this.curChar == '#') {
                                jjCheckNAdd(84);
                                break;
                            }
                            break;
                        case 318:
                            if (this.curChar == '#') {
                                jjCheckNAdd(91);
                                break;
                            }
                            break;
                        case 319:
                            if (this.curChar == '#') {
                                jjCheckNAdd(100);
                                break;
                            }
                            break;
                        case 320:
                            if (this.curChar == '#') {
                                jjCheckNAdd(FMParserConstants.OR);
                                break;
                            }
                            break;
                        case 321:
                            if (this.curChar == '#') {
                                jjCheckNAdd(FMParserConstants.CLOSE_BRACE);
                                break;
                            }
                            break;
                        case 322:
                            if (this.curChar == '#') {
                                jjCheckNAdd(FMParserConstants.LETTER);
                                break;
                            }
                            break;
                        case 323:
                            if (this.curChar == '#') {
                                jjCheckNAdd(FMParserConstants.NATURAL_GTE);
                                break;
                            }
                            break;
                        case 324:
                            if (this.curChar == '#') {
                                jjCheckNAdd(134);
                                break;
                            }
                            break;
                        case 325:
                            if (this.curChar == '#') {
                                jjCheckNAdd(139);
                                break;
                            }
                            break;
                        case 326:
                            if (this.curChar == '#') {
                                jjCheckNAdd(147);
                                break;
                            }
                            break;
                        case 327:
                            if (this.curChar == '#') {
                                jjCheckNAdd(157);
                                break;
                            }
                            break;
                        case 328:
                            if (this.curChar == '#') {
                                jjCheckNAdd(166);
                                break;
                            }
                            break;
                        case 329:
                            if (this.curChar == '#') {
                                jjCheckNAdd(175);
                                break;
                            }
                            break;
                        case 330:
                            if (this.curChar == '/') {
                                jjCheckNAdd(334);
                                break;
                            }
                            break;
                        case 332:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(176, 177);
                                break;
                            }
                            break;
                        case 333:
                            if (this.curChar == '>' && kind > 31) {
                                kind = 31;
                                break;
                            }
                            break;
                        case 335:
                            if (this.curChar == '#') {
                                jjCheckNAdd(334);
                                break;
                            }
                            break;
                        case 336:
                        case 532:
                            if (this.curChar == '/') {
                                jjCheckNAdd(335);
                                break;
                            }
                            break;
                        case 337:
                            if (this.curChar == '/') {
                                jjCheckNAdd(343);
                                break;
                            }
                            break;
                        case 339:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(178, 179);
                                break;
                            }
                            break;
                        case 340:
                            if (this.curChar == '>' && kind > 32) {
                                kind = 32;
                                break;
                            }
                            break;
                        case 344:
                            if (this.curChar == '#') {
                                jjCheckNAdd(343);
                                break;
                            }
                            break;
                        case 345:
                        case 533:
                            if (this.curChar == '/') {
                                jjCheckNAdd(344);
                                break;
                            }
                            break;
                        case 346:
                            if (this.curChar == '/') {
                                jjCheckNAdd(355);
                                break;
                            }
                            break;
                        case 348:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(180, 181);
                                break;
                            }
                            break;
                        case 349:
                            if (this.curChar == '>' && kind > 33) {
                                kind = 33;
                                break;
                            }
                            break;
                        case 356:
                            if (this.curChar == '#') {
                                jjCheckNAdd(355);
                                break;
                            }
                            break;
                        case 357:
                        case 534:
                            if (this.curChar == '/') {
                                jjCheckNAdd(356);
                                break;
                            }
                            break;
                        case 358:
                            if (this.curChar == '/') {
                                jjCheckNAdd(367);
                                break;
                            }
                            break;
                        case 360:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(182, 183);
                                break;
                            }
                            break;
                        case 361:
                            if (this.curChar == '>' && kind > 34) {
                                kind = 34;
                                break;
                            }
                            break;
                        case 368:
                            if (this.curChar == '#') {
                                jjCheckNAdd(367);
                                break;
                            }
                            break;
                        case 369:
                        case 535:
                            if (this.curChar == '/') {
                                jjCheckNAdd(368);
                                break;
                            }
                            break;
                        case 370:
                            if (this.curChar == '/') {
                                jjCheckNAdd(379);
                                break;
                            }
                            break;
                        case 372:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(184, 185);
                                break;
                            }
                            break;
                        case 373:
                            if (this.curChar == '>' && kind > 35) {
                                kind = 35;
                                break;
                            }
                            break;
                        case 380:
                            if (this.curChar == '#') {
                                jjCheckNAdd(379);
                                break;
                            }
                            break;
                        case 381:
                        case 536:
                            if (this.curChar == '/') {
                                jjCheckNAdd(380);
                                break;
                            }
                            break;
                        case 382:
                            if (this.curChar == '/') {
                                jjCheckNAdd(389);
                                break;
                            }
                            break;
                        case 384:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(186, 187);
                                break;
                            }
                            break;
                        case 385:
                            if (this.curChar == '>' && kind > 36) {
                                kind = 36;
                                break;
                            }
                            break;
                        case 390:
                            if (this.curChar == '#') {
                                jjCheckNAdd(389);
                                break;
                            }
                            break;
                        case 391:
                        case 537:
                            if (this.curChar == '/') {
                                jjCheckNAdd(390);
                                break;
                            }
                            break;
                        case 392:
                            if (this.curChar == '/') {
                                jjCheckNAdd(400);
                                break;
                            }
                            break;
                        case 394:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(188, 189);
                                break;
                            }
                            break;
                        case 395:
                            if (this.curChar == '>' && kind > 37) {
                                kind = 37;
                                break;
                            }
                            break;
                        case 401:
                            if (this.curChar == '#') {
                                jjCheckNAdd(400);
                                break;
                            }
                            break;
                        case 402:
                        case 538:
                            if (this.curChar == '/') {
                                jjCheckNAdd(401);
                                break;
                            }
                            break;
                        case 403:
                            if (this.curChar == '/') {
                                jjCheckNAdd(411);
                                break;
                            }
                            break;
                        case 405:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(190, 191);
                                break;
                            }
                            break;
                        case 406:
                            if (this.curChar == '>' && kind > 38) {
                                kind = 38;
                                break;
                            }
                            break;
                        case 412:
                            if (this.curChar == '#') {
                                jjCheckNAdd(411);
                                break;
                            }
                            break;
                        case 413:
                        case 539:
                            if (this.curChar == '/') {
                                jjCheckNAdd(412);
                                break;
                            }
                            break;
                        case 414:
                            if (this.curChar == '/') {
                                jjCheckNAdd(424);
                                break;
                            }
                            break;
                        case 416:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(192, 193);
                                break;
                            }
                            break;
                        case 417:
                            if (this.curChar == '>' && kind > 39) {
                                kind = 39;
                                break;
                            }
                            break;
                        case 425:
                            if (this.curChar == '#') {
                                jjCheckNAdd(424);
                                break;
                            }
                            break;
                        case 426:
                        case 540:
                            if (this.curChar == '/') {
                                jjCheckNAdd(425);
                                break;
                            }
                            break;
                        case 427:
                            if (this.curChar == '/') {
                                jjCheckNAdd(434);
                                break;
                            }
                            break;
                        case 429:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(194, 195);
                                break;
                            }
                            break;
                        case 430:
                            if (this.curChar == '>' && kind > 40) {
                                kind = 40;
                                break;
                            }
                            break;
                        case 435:
                            if (this.curChar == '#') {
                                jjCheckNAdd(434);
                                break;
                            }
                            break;
                        case 436:
                        case 541:
                            if (this.curChar == '/') {
                                jjCheckNAdd(435);
                                break;
                            }
                            break;
                        case 437:
                            if (this.curChar == '/') {
                                jjCheckNAdd(447);
                                break;
                            }
                            break;
                        case 439:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(196, 197);
                                break;
                            }
                            break;
                        case 440:
                            if (this.curChar == '>' && kind > 41) {
                                kind = 41;
                                break;
                            }
                            break;
                        case 448:
                            if (this.curChar == '#') {
                                jjCheckNAdd(447);
                                break;
                            }
                            break;
                        case 449:
                        case 542:
                            if (this.curChar == '/') {
                                jjCheckNAdd(448);
                                break;
                            }
                            break;
                        case 450:
                            if (this.curChar == '/') {
                                jjCheckNAdd(461);
                                break;
                            }
                            break;
                        case 452:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(198, 199);
                                break;
                            }
                            break;
                        case 453:
                            if (this.curChar == '>' && kind > 42) {
                                kind = 42;
                                break;
                            }
                            break;
                        case 462:
                            if (this.curChar == '#') {
                                jjCheckNAdd(461);
                                break;
                            }
                            break;
                        case 463:
                        case 543:
                            if (this.curChar == '/') {
                                jjCheckNAdd(462);
                                break;
                            }
                            break;
                        case 464:
                            if (this.curChar == '/') {
                                jjCheckNAdd(472);
                                break;
                            }
                            break;
                        case 466:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(200, 201);
                                break;
                            }
                            break;
                        case 467:
                            if (this.curChar == '>' && kind > 43) {
                                kind = 43;
                                break;
                            }
                            break;
                        case 473:
                            if (this.curChar == '#') {
                                jjCheckNAdd(472);
                                break;
                            }
                            break;
                        case 474:
                        case 544:
                            if (this.curChar == '/') {
                                jjCheckNAdd(473);
                                break;
                            }
                            break;
                        case 475:
                            if (this.curChar == '#') {
                                jjCheckNAdd(182);
                                break;
                            }
                            break;
                        case 476:
                            if (this.curChar == '#') {
                                jjCheckNAdd(190);
                                break;
                            }
                            break;
                        case 477:
                            if (this.curChar == '#') {
                                jjCheckNAdd(199);
                                break;
                            }
                            break;
                        case 478:
                            if (this.curChar == '#') {
                                jjCheckNAdd(206);
                                break;
                            }
                            break;
                        case 479:
                            if (this.curChar == '#') {
                                jjCheckNAdd(214);
                                break;
                            }
                            break;
                        case 480:
                            if (this.curChar == '#') {
                                jjCheckNAdd(215);
                                break;
                            }
                            break;
                        case 481:
                            if (this.curChar == '#') {
                                jjCheckNAdd(223);
                                break;
                            }
                            break;
                        case 482:
                            if (this.curChar == '#') {
                                jjCheckNAdd(228);
                                break;
                            }
                            break;
                        case 483:
                            if (this.curChar == '#') {
                                jjCheckNAdd(233);
                                break;
                            }
                            break;
                        case 484:
                            if (this.curChar == '#') {
                                jjCheckNAdd(242);
                                break;
                            }
                            break;
                        case 485:
                            if (this.curChar == '#') {
                                jjCheckNAdd(251);
                                break;
                            }
                            break;
                        case 486:
                            if (this.curChar == '#') {
                                jjCheckNAdd(258);
                                break;
                            }
                            break;
                        case 487:
                            if (this.curChar == '#') {
                                jjCheckNAdd(268);
                                break;
                            }
                            break;
                        case 488:
                            if (this.curChar == '#') {
                                jjCheckNAdd(276);
                                break;
                            }
                            break;
                        case 489:
                            if (this.curChar == '#') {
                                jjCheckNAdd(287);
                                break;
                            }
                            break;
                        case 490:
                            if (this.curChar == '#') {
                                jjCheckNAdd(294);
                                break;
                            }
                            break;
                        case 491:
                            if (this.curChar == '/') {
                                jjCheckNAdd(499);
                                break;
                            }
                            break;
                        case 493:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(202, 203);
                                break;
                            }
                            break;
                        case 494:
                            if (this.curChar == '>' && kind > 60) {
                                kind = 60;
                                break;
                            }
                            break;
                        case 500:
                            if (this.curChar == '#') {
                                jjCheckNAdd(499);
                                break;
                            }
                            break;
                        case 501:
                        case 545:
                            if (this.curChar == '/') {
                                jjCheckNAdd(500);
                                break;
                            }
                            break;
                        case 502:
                            if (this.curChar == '#') {
                                jjCheckNAdd(304);
                                break;
                            }
                            break;
                        case 503:
                            if (this.curChar == '/') {
                                jjCheckNAdd(513);
                                break;
                            }
                            break;
                        case 505:
                            if ((4294977024L & l) != 0) {
                                jjAddStates(204, 205);
                                break;
                            }
                            break;
                        case 506:
                            if (this.curChar == '>' && kind > 62) {
                                kind = 62;
                                break;
                            }
                            break;
                        case 514:
                            if (this.curChar == '#') {
                                jjCheckNAdd(513);
                                break;
                            }
                            break;
                        case 515:
                        case 546:
                            if (this.curChar == '/') {
                                jjCheckNAdd(514);
                                break;
                            }
                            break;
                        case 518:
                            if ((4294977024L & l) != 0 && kind > 65) {
                                kind = 65;
                                break;
                            }
                            break;
                        case 521:
                            if (this.curChar == '#') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 520;
                                break;
                            }
                            break;
                        case 523:
                            if (this.curChar == '/') {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 524;
                                break;
                            }
                            break;
                        case 524:
                            if (this.curChar == '>' && kind > 66) {
                                kind = 66;
                                break;
                            }
                            break;
                        case 527:
                            if (this.curChar == '#') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 526;
                                break;
                            }
                            break;
                        case 528:
                            if (this.curChar == '#') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 529;
                                break;
                            }
                            break;
                        case 530:
                        case 553:
                            if (this.curChar == '/') {
                                jjCheckNAdd(528);
                                break;
                            }
                            break;
                        case 549:
                            if (this.curChar == '#') {
                                int[] iArr5 = this.jjstateSet;
                                int i7 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i7 + 1;
                                iArr5[i7] = 548;
                                break;
                            }
                            break;
                        case 552:
                            if (this.curChar == '#') {
                                int[] iArr6 = this.jjstateSet;
                                int i8 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i8 + 1;
                                iArr6[i8] = 551;
                                break;
                            }
                            break;
                        case 554:
                            if (this.curChar == '<') {
                                jjAddStates(7, 8);
                                break;
                            }
                            break;
                        case 555:
                            if (this.curChar == '-' && kind > 29) {
                                kind = 29;
                                break;
                            }
                            break;
                        case 556:
                            if (this.curChar == '-') {
                                int[] iArr7 = this.jjstateSet;
                                int i9 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i9 + 1;
                                iArr7[i9] = 555;
                                break;
                            }
                            break;
                        case 557:
                            if (this.curChar == '#') {
                                int[] iArr8 = this.jjstateSet;
                                int i10 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i10 + 1;
                                iArr8[i10] = 556;
                                break;
                            }
                            break;
                        case 559:
                            if (this.curChar == '$') {
                                jjCheckNAddStates(206, 209);
                                break;
                            }
                            break;
                        case 560:
                            if ((287948969894477824L & l) != 0) {
                                jjCheckNAddStates(206, 209);
                                break;
                            }
                            break;
                        case 561:
                            if (this.curChar == '.') {
                                int[] iArr9 = this.jjstateSet;
                                int i11 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i11 + 1;
                                iArr9[i11] = 562;
                                break;
                            }
                            break;
                        case 562:
                            if (this.curChar == '$') {
                                jjCheckNAddStates(210, 213);
                                break;
                            }
                            break;
                        case 563:
                            if ((287948969894477824L & l) != 0) {
                                jjCheckNAddStates(210, 213);
                                break;
                            }
                            break;
                        case 564:
                            if ((4294977024L & l) != 0) {
                                jjCheckNAddTwoStates(564, 565);
                                break;
                            }
                            break;
                        case 565:
                            if (this.curChar == '>' && kind > 64) {
                                kind = 64;
                                break;
                            }
                            break;
                        case 566:
                            if (this.curChar == '/') {
                                int[] iArr10 = this.jjstateSet;
                                int i12 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i12 + 1;
                                iArr10[i12] = 558;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                            if (((-576460752437641217L) & l2) != 0) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                        case 2:
                            if (((-576460752437641217L) & l2) != 0) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                            } else if ((576460752437641216L & l2) != 0 && kind > 70) {
                                kind = 70;
                            }
                            if (this.curChar == '[') {
                                jjAddStates(7, 8);
                            }
                            if (this.curChar == '[') {
                                jjAddStates(214, 274);
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == 't') {
                                jjAddStates(FMParserConstants.NATURAL_GT, FMParserConstants.NATURAL_GTE);
                                break;
                            }
                            break;
                        case 6:
                            if (this.curChar == ']' && kind > 6) {
                                kind = 6;
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == 'p') {
                                int[] iArr11 = this.jjstateSet;
                                int i13 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i13 + 1;
                                iArr11[i13] = 4;
                                break;
                            }
                            break;
                        case 8:
                            if (this.curChar == 'm') {
                                int[] iArr12 = this.jjstateSet;
                                int i14 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i14 + 1;
                                iArr12[i14] = 7;
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == 'e') {
                                int[] iArr13 = this.jjstateSet;
                                int i15 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i15 + 1;
                                iArr13[i15] = 8;
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if (this.curChar == 't') {
                                int[] iArr14 = this.jjstateSet;
                                int i16 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i16 + 1;
                                iArr14[i16] = 9;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if (this.curChar == 't') {
                                int[] iArr15 = this.jjstateSet;
                                int i17 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i17 + 1;
                                iArr15[i17] = 10;
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == 'a') {
                                int[] iArr16 = this.jjstateSet;
                                int i18 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i18 + 1;
                                iArr16[i18] = 11;
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (this.curChar == 'r') {
                                jjAddStates(128, FMParserConstants.TERMINATING_EXCLAM);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if (this.curChar == ']' && kind > 7) {
                                kind = 7;
                                break;
                            }
                            break;
                        case 16:
                            if (this.curChar == 'e') {
                                int[] iArr17 = this.jjstateSet;
                                int i19 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i19 + 1;
                                iArr17[i19] = 13;
                                break;
                            }
                            break;
                        case FMParserConstants._INCLUDE /* 17 */:
                            if (this.curChar == 'v') {
                                int[] iArr18 = this.jjstateSet;
                                int i20 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i20 + 1;
                                iArr18[i20] = 16;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if (this.curChar == 'o') {
                                int[] iArr19 = this.jjstateSet;
                                int i21 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i21 + 1;
                                iArr19[i21] = 17;
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (this.curChar == 'c') {
                                int[] iArr20 = this.jjstateSet;
                                int i22 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i22 + 1;
                                iArr20[i22] = 18;
                                break;
                            }
                            break;
                        case FMParserConstants.MACRO /* 20 */:
                            if (this.curChar == 'e') {
                                int[] iArr21 = this.jjstateSet;
                                int i23 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i23 + 1;
                                iArr21[i23] = 19;
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (this.curChar == 'r') {
                                int[] iArr22 = this.jjstateSet;
                                int i24 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i24 + 1;
                                iArr22[i24] = 20;
                                break;
                            }
                            break;
                        case FMParserConstants.VISIT /* 22 */:
                            if (this.curChar == 'f') {
                                int[] iArr23 = this.jjstateSet;
                                int i25 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i25 + 1;
                                iArr23[i25] = 23;
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (this.curChar == 'i') {
                                int[] iArr24 = this.jjstateSet;
                                int i26 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i26 + 1;
                                iArr24[i26] = 22;
                                break;
                            }
                            break;
                        case FMParserConstants.CALL /* 25 */:
                            if (this.curChar == 'f') {
                                int[] iArr25 = this.jjstateSet;
                                int i27 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i27 + 1;
                                iArr25[i27] = 26;
                                break;
                            }
                            break;
                        case FMParserConstants.COMPRESS /* 27 */:
                            if (this.curChar == 'i') {
                                int[] iArr26 = this.jjstateSet;
                                int i28 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i28 + 1;
                                iArr26[i28] = 25;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                            if (this.curChar == 'e') {
                                int[] iArr27 = this.jjstateSet;
                                int i29 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i29 + 1;
                                iArr27[i29] = 27;
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                            if (this.curChar == 's') {
                                int[] iArr28 = this.jjstateSet;
                                int i30 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i30 + 1;
                                iArr28[i30] = 28;
                                break;
                            }
                            break;
                        case FMParserConstants.NOPARSE /* 30 */:
                            if (this.curChar == 'l') {
                                int[] iArr29 = this.jjstateSet;
                                int i31 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i31 + 1;
                                iArr29[i31] = 29;
                                break;
                            }
                            break;
                        case FMParserConstants.END_IF /* 31 */:
                            if (this.curChar == 'e') {
                                int[] iArr30 = this.jjstateSet;
                                int i32 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i32 + 1;
                                iArr30[i32] = 30;
                                break;
                            }
                            break;
                        case 32:
                            if (this.curChar == 't') {
                                int[] iArr31 = this.jjstateSet;
                                int i33 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i33 + 1;
                                iArr31[i33] = 33;
                                break;
                            }
                            break;
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if (this.curChar == 's') {
                                int[] iArr32 = this.jjstateSet;
                                int i34 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i34 + 1;
                                iArr32[i34] = 32;
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == 'i') {
                                int[] iArr33 = this.jjstateSet;
                                int i35 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i35 + 1;
                                iArr33[i35] = 34;
                                break;
                            }
                            break;
                        case FMParserConstants.END_LOCAL /* 36 */:
                            if (this.curChar == 'l') {
                                int[] iArr34 = this.jjstateSet;
                                int i36 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i36 + 1;
                                iArr34[i36] = 35;
                                break;
                            }
                            break;
                        case FMParserConstants.END_GLOBAL /* 37 */:
                            if (this.curChar == 'h') {
                                int[] iArr35 = this.jjstateSet;
                                int i37 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i37 + 1;
                                iArr35[i37] = 38;
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if (this.curChar == 'c') {
                                int[] iArr36 = this.jjstateSet;
                                int i38 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i38 + 1;
                                iArr36[i38] = 37;
                                break;
                            }
                            break;
                        case FMParserConstants.END_MACRO /* 40 */:
                            if (this.curChar == 'a') {
                                int[] iArr37 = this.jjstateSet;
                                int i39 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i39 + 1;
                                iArr37[i39] = 39;
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if (this.curChar == 'e') {
                                int[] iArr38 = this.jjstateSet;
                                int i40 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i40 + 1;
                                iArr38[i40] = 40;
                                break;
                            }
                            break;
                        case FMParserConstants.END_TRANSFORM /* 42 */:
                            if (this.curChar == 'r') {
                                int[] iArr39 = this.jjstateSet;
                                int i41 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i41 + 1;
                                iArr39[i41] = 41;
                                break;
                            }
                            break;
                        case FMParserConstants.END_SWITCH /* 43 */:
                            if (this.curChar == 'o') {
                                int[] iArr40 = this.jjstateSet;
                                int i42 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i42 + 1;
                                iArr40[i42] = 42;
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE /* 44 */:
                            if (this.curChar == 'f') {
                                int[] iArr41 = this.jjstateSet;
                                int i43 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i43 + 1;
                                iArr41[i43] = 43;
                                break;
                            }
                            break;
                        case FMParserConstants.BREAK /* 45 */:
                            if (this.curChar == 'h') {
                                int[] iArr42 = this.jjstateSet;
                                int i44 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i44 + 1;
                                iArr42[i44] = 46;
                                break;
                            }
                            break;
                        case FMParserConstants.HALT /* 47 */:
                            if (this.curChar == 'c') {
                                int[] iArr43 = this.jjstateSet;
                                int i45 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i45 + 1;
                                iArr43[i45] = 45;
                                break;
                            }
                            break;
                        case FMParserConstants.FLUSH /* 48 */:
                            if (this.curChar == 't') {
                                int[] iArr44 = this.jjstateSet;
                                int i46 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i46 + 1;
                                iArr44[i46] = 47;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIM /* 49 */:
                            if (this.curChar == 'i') {
                                int[] iArr45 = this.jjstateSet;
                                int i47 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i47 + 1;
                                iArr45[i47] = 48;
                                break;
                            }
                            break;
                        case FMParserConstants.LTRIM /* 50 */:
                            if (this.curChar == 'w') {
                                int[] iArr46 = this.jjstateSet;
                                int i48 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i48 + 1;
                                iArr46[i48] = 49;
                                break;
                            }
                            break;
                        case FMParserConstants.RTRIM /* 51 */:
                            if (this.curChar == 's') {
                                int[] iArr47 = this.jjstateSet;
                                int i49 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i49 + 1;
                                iArr47[i49] = 50;
                                break;
                            }
                            break;
                        case FMParserConstants.NOTRIM /* 52 */:
                            if (this.curChar == 'e') {
                                int[] iArr48 = this.jjstateSet;
                                int i50 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i50 + 1;
                                iArr48[i50] = 53;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_NESTED /* 54 */:
                            if (this.curChar == 's') {
                                int[] iArr49 = this.jjstateSet;
                                int i51 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i51 + 1;
                                iArr49[i51] = 52;
                                break;
                            }
                            break;
                        case FMParserConstants.NESTED /* 55 */:
                            if (this.curChar == 'a') {
                                int[] iArr50 = this.jjstateSet;
                                int i52 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i52 + 1;
                                iArr50[i52] = 54;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                            if (this.curChar == 'c') {
                                int[] iArr51 = this.jjstateSet;
                                int i53 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i53 + 1;
                                iArr51[i53] = 55;
                                break;
                            }
                            break;
                        case FMParserConstants.RECURSE /* 57 */:
                            if (this.curChar == 'n') {
                                int[] iArr52 = this.jjstateSet;
                                int i54 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i54 + 1;
                                iArr52[i54] = 58;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPE /* 59 */:
                            if (this.curChar == 'g') {
                                int[] iArr53 = this.jjstateSet;
                                int i55 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i55 + 1;
                                iArr53[i55] = 57;
                                break;
                            }
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            if (this.curChar == 'i') {
                                int[] iArr54 = this.jjstateSet;
                                int i56 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i56 + 1;
                                iArr54[i56] = 59;
                                break;
                            }
                            break;
                        case FMParserConstants.NOESCAPE /* 61 */:
                            if (this.curChar == 's') {
                                int[] iArr55 = this.jjstateSet;
                                int i57 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i57 + 1;
                                iArr55[i57] = 60;
                                break;
                            }
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            if (this.curChar == 's') {
                                int[] iArr56 = this.jjstateSet;
                                int i58 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i58 + 1;
                                iArr56[i58] = 61;
                                break;
                            }
                            break;
                        case FMParserConstants.UNIFIED_CALL /* 63 */:
                            if (this.curChar == 'a') {
                                int[] iArr57 = this.jjstateSet;
                                int i59 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i59 + 1;
                                iArr57[i59] = 62;
                                break;
                            }
                            break;
                        case 64:
                            if (this.curChar == 'l') {
                                int[] iArr58 = this.jjstateSet;
                                int i60 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i60 + 1;
                                iArr58[i60] = 65;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                            if (this.curChar == 'a') {
                                int[] iArr59 = this.jjstateSet;
                                int i61 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i61 + 1;
                                iArr59[i61] = 64;
                                break;
                            }
                            break;
                        case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                            if (this.curChar == 'b') {
                                int[] iArr60 = this.jjstateSet;
                                int i62 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i62 + 1;
                                iArr60[i62] = 66;
                                break;
                            }
                            break;
                        case FMParserConstants.WHITESPACE /* 68 */:
                            if (this.curChar == 'o') {
                                int[] iArr61 = this.jjstateSet;
                                int i63 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i63 + 1;
                                iArr61[i63] = 67;
                                break;
                            }
                            break;
                        case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                            if (this.curChar == 'l') {
                                int[] iArr62 = this.jjstateSet;
                                int i64 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i64 + 1;
                                iArr62[i64] = 68;
                                break;
                            }
                            break;
                        case FMParserConstants.FALSE_ALERT /* 70 */:
                            if (this.curChar == 'g') {
                                int[] iArr63 = this.jjstateSet;
                                int i65 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i65 + 1;
                                iArr63[i65] = 69;
                                break;
                            }
                            break;
                        case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                            if (this.curChar == 'l') {
                                int[] iArr64 = this.jjstateSet;
                                int i66 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i66 + 1;
                                iArr64[i66] = 72;
                                break;
                            }
                            break;
                        case 73:
                            if (this.curChar == 'a') {
                                int[] iArr65 = this.jjstateSet;
                                int i67 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i67 + 1;
                                iArr65[i67] = 71;
                                break;
                            }
                            break;
                        case 74:
                            if (this.curChar == 'c') {
                                int[] iArr66 = this.jjstateSet;
                                int i68 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i68 + 1;
                                iArr66[i68] = 73;
                                break;
                            }
                            break;
                        case 75:
                            if (this.curChar == 'o') {
                                int[] iArr67 = this.jjstateSet;
                                int i69 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i69 + 1;
                                iArr67[i69] = 74;
                                break;
                            }
                            break;
                        case 76:
                            if (this.curChar == 'l') {
                                int[] iArr68 = this.jjstateSet;
                                int i70 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i70 + 1;
                                iArr68[i70] = 75;
                                break;
                            }
                            break;
                        case 77:
                            if (this.curChar == 'e') {
                                int[] iArr69 = this.jjstateSet;
                                int i71 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i71 + 1;
                                iArr69[i71] = 78;
                                break;
                            }
                            break;
                        case 79:
                            if (this.curChar == 'd') {
                                int[] iArr70 = this.jjstateSet;
                                int i72 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i72 + 1;
                                iArr70[i72] = 77;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPED_CHAR /* 80 */:
                            if (this.curChar == 'u') {
                                int[] iArr71 = this.jjstateSet;
                                int i73 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i73 + 1;
                                iArr71[i73] = 79;
                                break;
                            }
                            break;
                        case FMParserConstants.STRING_LITERAL /* 81 */:
                            if (this.curChar == 'l') {
                                int[] iArr72 = this.jjstateSet;
                                int i74 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i74 + 1;
                                iArr72[i74] = 80;
                                break;
                            }
                            break;
                        case FMParserConstants.RAW_STRING /* 82 */:
                            if (this.curChar == 'c') {
                                int[] iArr73 = this.jjstateSet;
                                int i75 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i75 + 1;
                                iArr73[i75] = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.FALSE /* 83 */:
                            if (this.curChar == 'n') {
                                int[] iArr74 = this.jjstateSet;
                                int i76 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i76 + 1;
                                iArr74[i76] = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.TRUE /* 84 */:
                            if (this.curChar == 'i') {
                                int[] iArr75 = this.jjstateSet;
                                int i77 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i77 + 1;
                                iArr75[i77] = 83;
                                break;
                            }
                            break;
                        case FMParserConstants.INTEGER /* 85 */:
                            if (this.curChar == 't') {
                                int[] iArr76 = this.jjstateSet;
                                int i78 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i78 + 1;
                                iArr76[i78] = 86;
                                break;
                            }
                            break;
                        case FMParserConstants.DOT /* 87 */:
                            if (this.curChar == 'r') {
                                int[] iArr77 = this.jjstateSet;
                                int i79 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i79 + 1;
                                iArr77[i79] = 85;
                                break;
                            }
                            break;
                        case FMParserConstants.DOT_DOT /* 88 */:
                            if (this.curChar == 'o') {
                                int[] iArr78 = this.jjstateSet;
                                int i80 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i80 + 1;
                                iArr78[i80] = 87;
                                break;
                            }
                            break;
                        case FMParserConstants.BUILT_IN /* 89 */:
                            if (this.curChar == 'p') {
                                int[] iArr79 = this.jjstateSet;
                                int i81 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i81 + 1;
                                iArr79[i81] = 88;
                                break;
                            }
                            break;
                        case FMParserConstants.EXISTS /* 90 */:
                            if (this.curChar == 'm') {
                                int[] iArr80 = this.jjstateSet;
                                int i82 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i82 + 1;
                                iArr80[i82] = 89;
                                break;
                            }
                            break;
                        case FMParserConstants.EQUALS /* 91 */:
                            if (this.curChar == 'i') {
                                int[] iArr81 = this.jjstateSet;
                                int i83 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i83 + 1;
                                iArr81[i83] = 90;
                                break;
                            }
                            break;
                        case FMParserConstants.DOUBLE_EQUALS /* 92 */:
                            if (this.curChar == 'n') {
                                int[] iArr82 = this.jjstateSet;
                                int i84 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i84 + 1;
                                iArr82[i84] = 93;
                                break;
                            }
                            break;
                        case FMParserConstants.LESS_THAN /* 94 */:
                            if (this.curChar == 'o') {
                                int[] iArr83 = this.jjstateSet;
                                int i85 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i85 + 1;
                                iArr83[i85] = 92;
                                break;
                            }
                            break;
                        case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
                            if (this.curChar == 'i') {
                                int[] iArr84 = this.jjstateSet;
                                int i86 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i86 + 1;
                                iArr84[i86] = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPED_GT /* 96 */:
                            if (this.curChar == 't') {
                                int[] iArr85 = this.jjstateSet;
                                int i87 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i87 + 1;
                                iArr85[i87] = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPED_GTE /* 97 */:
                            if (this.curChar == 'c') {
                                int[] iArr86 = this.jjstateSet;
                                int i88 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i88 + 1;
                                iArr86[i88] = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.PLUS /* 98 */:
                            if (this.curChar == 'n') {
                                int[] iArr87 = this.jjstateSet;
                                int i89 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i89 + 1;
                                iArr87[i89] = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.MINUS /* 99 */:
                            if (this.curChar == 'u') {
                                int[] iArr88 = this.jjstateSet;
                                int i90 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i90 + 1;
                                iArr88[i90] = 98;
                                break;
                            }
                            break;
                        case FMParserConstants.TIMES /* 100 */:
                            if (this.curChar == 'f') {
                                int[] iArr89 = this.jjstateSet;
                                int i91 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i91 + 1;
                                iArr89[i91] = 99;
                                break;
                            }
                            break;
                        case FMParserConstants.DOUBLE_STAR /* 101 */:
                            if (this.curChar == 'o') {
                                int[] iArr90 = this.jjstateSet;
                                int i92 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i92 + 1;
                                iArr90[i92] = 102;
                                break;
                            }
                            break;
                        case FMParserConstants.DIVIDE /* 103 */:
                            if (this.curChar == 'r') {
                                int[] iArr91 = this.jjstateSet;
                                int i93 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i93 + 1;
                                iArr91[i93] = 101;
                                break;
                            }
                            break;
                        case FMParserConstants.PERCENT /* 104 */:
                            if (this.curChar == 'c') {
                                int[] iArr92 = this.jjstateSet;
                                int i94 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i94 + 1;
                                iArr92[i94] = 103;
                                break;
                            }
                            break;
                        case FMParserConstants.AND /* 105 */:
                            if (this.curChar == 'a') {
                                int[] iArr93 = this.jjstateSet;
                                int i95 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i95 + 1;
                                iArr93[i95] = 104;
                                break;
                            }
                            break;
                        case FMParserConstants.OR /* 106 */:
                            if (this.curChar == 'm') {
                                int[] iArr94 = this.jjstateSet;
                                int i96 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i96 + 1;
                                iArr94[i96] = 105;
                                break;
                            }
                            break;
                        case FMParserConstants.EXCLAM /* 107 */:
                            if (this.curChar == 'm') {
                                int[] iArr95 = this.jjstateSet;
                                int i97 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i97 + 1;
                                iArr95[i97] = 108;
                                break;
                            }
                            break;
                        case FMParserConstants.SEMICOLON /* 109 */:
                            if (this.curChar == 'r') {
                                int[] iArr96 = this.jjstateSet;
                                int i98 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i98 + 1;
                                iArr96[i98] = 107;
                                break;
                            }
                            break;
                        case FMParserConstants.COLON /* 110 */:
                            if (this.curChar == 'o') {
                                int[] iArr97 = this.jjstateSet;
                                int i99 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i99 + 1;
                                iArr97[i99] = 109;
                                break;
                            }
                            break;
                        case FMParserConstants.OPEN_BRACKET /* 111 */:
                            if (this.curChar == 'f') {
                                int[] iArr98 = this.jjstateSet;
                                int i100 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i100 + 1;
                                iArr98[i100] = 110;
                                break;
                            }
                            break;
                        case FMParserConstants.CLOSE_BRACKET /* 112 */:
                            if (this.curChar == 's') {
                                int[] iArr99 = this.jjstateSet;
                                int i101 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i101 + 1;
                                iArr99[i101] = 111;
                                break;
                            }
                            break;
                        case FMParserConstants.OPEN_PAREN /* 113 */:
                            if (this.curChar == 'n') {
                                int[] iArr100 = this.jjstateSet;
                                int i102 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i102 + 1;
                                iArr100[i102] = 112;
                                break;
                            }
                            break;
                        case FMParserConstants.CLOSE_PAREN /* 114 */:
                            if (this.curChar == 'a') {
                                int[] iArr101 = this.jjstateSet;
                                int i103 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i103 + 1;
                                iArr101[i103] = 113;
                                break;
                            }
                            break;
                        case FMParserConstants.OPEN_BRACE /* 115 */:
                            if (this.curChar == 'r') {
                                int[] iArr102 = this.jjstateSet;
                                int i104 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i104 + 1;
                                iArr102[i104] = 114;
                                break;
                            }
                            break;
                        case FMParserConstants.CLOSE_BRACE /* 116 */:
                            if (this.curChar == 't') {
                                int[] iArr103 = this.jjstateSet;
                                int i105 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i105 + 1;
                                iArr103[i105] = 115;
                                break;
                            }
                            break;
                        case FMParserConstants.IN /* 117 */:
                            if (this.curChar == 't') {
                                int[] iArr104 = this.jjstateSet;
                                int i106 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i106 + 1;
                                iArr104[i106] = 118;
                                break;
                            }
                            break;
                        case FMParserConstants.USING /* 119 */:
                            if (this.curChar == 'i') {
                                int[] iArr105 = this.jjstateSet;
                                int i107 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i107 + 1;
                                iArr105[i107] = 117;
                                break;
                            }
                            break;
                        case FMParserConstants.ID /* 120 */:
                            if (this.curChar == 's') {
                                int[] iArr106 = this.jjstateSet;
                                int i108 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i108 + 1;
                                iArr106[i108] = 119;
                                break;
                            }
                            break;
                        case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
                            if (this.curChar == 'i') {
                                int[] iArr107 = this.jjstateSet;
                                int i109 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i109 + 1;
                                iArr107[i109] = 120;
                                break;
                            }
                            break;
                        case FMParserConstants.LETTER /* 122 */:
                            if (this.curChar == 'v') {
                                int[] iArr108 = this.jjstateSet;
                                int i110 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i110 + 1;
                                iArr108[i110] = 121;
                                break;
                            }
                            break;
                        case FMParserConstants.DIGIT /* 123 */:
                            if (this.curChar == 'p') {
                                int[] iArr109 = this.jjstateSet;
                                int i111 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i111 + 1;
                                iArr109[i111] = 124;
                                break;
                            }
                            break;
                        case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                            if (this.curChar == 'o') {
                                int[] iArr110 = this.jjstateSet;
                                int i112 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i112 + 1;
                                iArr110[i112] = 123;
                                break;
                            }
                            break;
                        case FMParserConstants.NATURAL_GT /* 126 */:
                            if (this.curChar == 't') {
                                int[] iArr111 = this.jjstateSet;
                                int i113 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i113 + 1;
                                iArr111[i113] = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.NATURAL_GTE /* 127 */:
                            if (this.curChar == 's') {
                                int[] iArr112 = this.jjstateSet;
                                int i114 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i114 + 1;
                                iArr112[i114] = 126;
                                break;
                            }
                            break;
                        case 128:
                            if (this.curChar == 'n') {
                                int[] iArr113 = this.jjstateSet;
                                int i115 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i115 + 1;
                                iArr113[i115] = 129;
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT_END /* 130 */:
                            if (this.curChar == 'r') {
                                int[] iArr114 = this.jjstateSet;
                                int i116 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i116 + 1;
                                iArr114[i116] = 128;
                                break;
                            }
                            break;
                        case FMParserConstants.MAYBE_END /* 131 */:
                            if (this.curChar == 'u') {
                                int[] iArr115 = this.jjstateSet;
                                int i117 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i117 + 1;
                                iArr115[i117] = 130;
                                break;
                            }
                            break;
                        case FMParserConstants.KEEP_GOING /* 132 */:
                            if (this.curChar == 't') {
                                int[] iArr116 = this.jjstateSet;
                                int i118 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i118 + 1;
                                iArr116[i118] = 131;
                                break;
                            }
                            break;
                        case FMParserConstants.LONE_LESS_THAN_OR_DASH /* 133 */:
                            if (this.curChar == 'e') {
                                int[] iArr117 = this.jjstateSet;
                                int i119 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i119 + 1;
                                iArr117[i119] = 132;
                                break;
                            }
                            break;
                        case 134:
                            if (this.curChar == 'r') {
                                int[] iArr118 = this.jjstateSet;
                                int i120 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i120 + 1;
                                iArr118[i120] = 133;
                                break;
                            }
                            break;
                        case 135:
                            if (this.curChar == 'l') {
                                int[] iArr119 = this.jjstateSet;
                                int i121 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i121 + 1;
                                iArr119[i121] = 136;
                                break;
                            }
                            break;
                        case 137:
                            if (this.curChar == 'l') {
                                int[] iArr120 = this.jjstateSet;
                                int i122 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i122 + 1;
                                iArr120[i122] = 135;
                                break;
                            }
                            break;
                        case 138:
                            if (this.curChar == 'a') {
                                int[] iArr121 = this.jjstateSet;
                                int i123 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i123 + 1;
                                iArr121[i123] = 137;
                                break;
                            }
                            break;
                        case 139:
                            if (this.curChar == 'c') {
                                int[] iArr122 = this.jjstateSet;
                                int i124 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i124 + 1;
                                iArr122[i124] = 138;
                                break;
                            }
                            break;
                        case 140:
                            if (this.curChar == 'g') {
                                int[] iArr123 = this.jjstateSet;
                                int i125 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i125 + 1;
                                iArr123[i125] = 141;
                                break;
                            }
                            break;
                        case 142:
                            if (this.curChar == 'n') {
                                int[] iArr124 = this.jjstateSet;
                                int i126 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i126 + 1;
                                iArr124[i126] = 140;
                                break;
                            }
                            break;
                        case 143:
                            if (this.curChar == 'i') {
                                int[] iArr125 = this.jjstateSet;
                                int i127 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i127 + 1;
                                iArr125[i127] = 142;
                                break;
                            }
                            break;
                        case 144:
                            if (this.curChar == 't') {
                                int[] iArr126 = this.jjstateSet;
                                int i128 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i128 + 1;
                                iArr126[i128] = 143;
                                break;
                            }
                            break;
                        case 145:
                            if (this.curChar == 't') {
                                int[] iArr127 = this.jjstateSet;
                                int i129 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i129 + 1;
                                iArr127[i129] = 144;
                                break;
                            }
                            break;
                        case 146:
                            if (this.curChar == 'e') {
                                int[] iArr128 = this.jjstateSet;
                                int i130 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i130 + 1;
                                iArr128[i130] = 145;
                                break;
                            }
                            break;
                        case 147:
                            if (this.curChar == 's') {
                                int[] iArr129 = this.jjstateSet;
                                int i131 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i131 + 1;
                                iArr129[i131] = 146;
                                break;
                            }
                            break;
                        case 148:
                            if (this.curChar == 's') {
                                jjAddStates(FMParserConstants.TERSE_COMMENT_END, FMParserConstants.MAYBE_END);
                                break;
                            }
                            break;
                        case 150:
                            if (this.curChar == ']' && kind > 27) {
                                kind = 27;
                                break;
                            }
                            break;
                        case 151:
                            if (this.curChar == 's') {
                                int[] iArr130 = this.jjstateSet;
                                int i132 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i132 + 1;
                                iArr130[i132] = 148;
                                break;
                            }
                            break;
                        case 152:
                            if (this.curChar == 'e') {
                                int[] iArr131 = this.jjstateSet;
                                int i133 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i133 + 1;
                                iArr131[i133] = 151;
                                break;
                            }
                            break;
                        case 153:
                            if (this.curChar == 'r') {
                                int[] iArr132 = this.jjstateSet;
                                int i134 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i134 + 1;
                                iArr132[i134] = 152;
                                break;
                            }
                            break;
                        case 154:
                            if (this.curChar == 'p') {
                                int[] iArr133 = this.jjstateSet;
                                int i135 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i135 + 1;
                                iArr133[i135] = 153;
                                break;
                            }
                            break;
                        case 155:
                            if (this.curChar == 'm') {
                                int[] iArr134 = this.jjstateSet;
                                int i136 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i136 + 1;
                                iArr134[i136] = 154;
                                break;
                            }
                            break;
                        case 156:
                            if (this.curChar == 'o') {
                                int[] iArr135 = this.jjstateSet;
                                int i137 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i137 + 1;
                                iArr135[i137] = 155;
                                break;
                            }
                            break;
                        case 157:
                            if (this.curChar == 'c') {
                                int[] iArr136 = this.jjstateSet;
                                int i138 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i138 + 1;
                                iArr136[i138] = 156;
                                break;
                            }
                            break;
                        case 158:
                            if (this.curChar == 't') {
                                jjAddStates(FMParserConstants.KEEP_GOING, FMParserConstants.LONE_LESS_THAN_OR_DASH);
                                break;
                            }
                            break;
                        case 160:
                            if (this.curChar == ']' && kind > 28) {
                                kind = 28;
                                break;
                            }
                            break;
                        case 161:
                            if (this.curChar == 'n') {
                                int[] iArr137 = this.jjstateSet;
                                int i139 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i139 + 1;
                                iArr137[i139] = 158;
                                break;
                            }
                            break;
                        case 162:
                            if (this.curChar == 'e') {
                                int[] iArr138 = this.jjstateSet;
                                int i140 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i140 + 1;
                                iArr138[i140] = 161;
                                break;
                            }
                            break;
                        case 163:
                            if (this.curChar == 'm') {
                                int[] iArr139 = this.jjstateSet;
                                int i141 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i141 + 1;
                                iArr139[i141] = 162;
                                break;
                            }
                            break;
                        case 164:
                            if (this.curChar == 'm') {
                                int[] iArr140 = this.jjstateSet;
                                int i142 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i142 + 1;
                                iArr140[i142] = 163;
                                break;
                            }
                            break;
                        case 165:
                            if (this.curChar == 'o') {
                                int[] iArr141 = this.jjstateSet;
                                int i143 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i143 + 1;
                                iArr141[i143] = 164;
                                break;
                            }
                            break;
                        case 166:
                            if (this.curChar == 'c') {
                                int[] iArr142 = this.jjstateSet;
                                int i144 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i144 + 1;
                                iArr142[i144] = 165;
                                break;
                            }
                            break;
                        case 167:
                            if (this.curChar == 'e') {
                                jjAddStates(134, 135);
                                break;
                            }
                            break;
                        case 169:
                            if (this.curChar == ']' && kind > 30) {
                                kind = 30;
                                break;
                            }
                            break;
                        case 170:
                            if (this.curChar == 's') {
                                int[] iArr143 = this.jjstateSet;
                                int i145 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i145 + 1;
                                iArr143[i145] = 167;
                                break;
                            }
                            break;
                        case 171:
                            if (this.curChar == 'r') {
                                int[] iArr144 = this.jjstateSet;
                                int i146 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i146 + 1;
                                iArr144[i146] = 170;
                                break;
                            }
                            break;
                        case 172:
                            if (this.curChar == 'a') {
                                int[] iArr145 = this.jjstateSet;
                                int i147 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i147 + 1;
                                iArr145[i147] = 171;
                                break;
                            }
                            break;
                        case 173:
                            if (this.curChar == 'p') {
                                int[] iArr146 = this.jjstateSet;
                                int i148 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i148 + 1;
                                iArr146[i148] = 172;
                                break;
                            }
                            break;
                        case 174:
                            if (this.curChar == 'o') {
                                int[] iArr147 = this.jjstateSet;
                                int i149 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i149 + 1;
                                iArr147[i149] = 173;
                                break;
                            }
                            break;
                        case 175:
                            if (this.curChar == 'n') {
                                int[] iArr148 = this.jjstateSet;
                                int i150 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i150 + 1;
                                iArr148[i150] = 174;
                                break;
                            }
                            break;
                        case 176:
                            if (this.curChar == 'e') {
                                jjAddStates(136, 138);
                                break;
                            }
                            break;
                        case 179:
                            if (this.curChar == ']' && kind > 44) {
                                kind = 44;
                                break;
                            }
                            break;
                        case 180:
                            if (this.curChar == 's') {
                                int[] iArr149 = this.jjstateSet;
                                int i151 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i151 + 1;
                                iArr149[i151] = 176;
                                break;
                            }
                            break;
                        case 181:
                            if (this.curChar == 'l') {
                                int[] iArr150 = this.jjstateSet;
                                int i152 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i152 + 1;
                                iArr150[i152] = 180;
                                break;
                            }
                            break;
                        case 182:
                            if (this.curChar == 'e') {
                                int[] iArr151 = this.jjstateSet;
                                int i153 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i153 + 1;
                                iArr151[i153] = 181;
                                break;
                            }
                            break;
                        case 183:
                            if (this.curChar == 'k') {
                                jjAddStates(139, 141);
                                break;
                            }
                            break;
                        case 186:
                            if (this.curChar == ']' && kind > 45) {
                                kind = 45;
                                break;
                            }
                            break;
                        case 187:
                            if (this.curChar == 'a') {
                                int[] iArr152 = this.jjstateSet;
                                int i154 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i154 + 1;
                                iArr152[i154] = 183;
                                break;
                            }
                            break;
                        case 188:
                            if (this.curChar == 'e') {
                                int[] iArr153 = this.jjstateSet;
                                int i155 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i155 + 1;
                                iArr153[i155] = 187;
                                break;
                            }
                            break;
                        case 189:
                            if (this.curChar == 'r') {
                                int[] iArr154 = this.jjstateSet;
                                int i156 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i156 + 1;
                                iArr154[i156] = 188;
                                break;
                            }
                            break;
                        case 190:
                            if (this.curChar == 'b') {
                                int[] iArr155 = this.jjstateSet;
                                int i157 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i157 + 1;
                                iArr155[i157] = 189;
                                break;
                            }
                            break;
                        case 191:
                            if (this.curChar == 'n') {
                                jjAddStates(142, 144);
                                break;
                            }
                            break;
                        case 194:
                            if (this.curChar == ']' && kind > 46) {
                                kind = 46;
                                break;
                            }
                            break;
                        case 195:
                            if (this.curChar == 'r') {
                                int[] iArr156 = this.jjstateSet;
                                int i158 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i158 + 1;
                                iArr156[i158] = 191;
                                break;
                            }
                            break;
                        case 196:
                            if (this.curChar == 'u') {
                                int[] iArr157 = this.jjstateSet;
                                int i159 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i159 + 1;
                                iArr157[i159] = 195;
                                break;
                            }
                            break;
                        case 197:
                            if (this.curChar == 't') {
                                int[] iArr158 = this.jjstateSet;
                                int i160 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i160 + 1;
                                iArr158[i160] = 196;
                                break;
                            }
                            break;
                        case 198:
                            if (this.curChar == 'e') {
                                int[] iArr159 = this.jjstateSet;
                                int i161 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i161 + 1;
                                iArr159[i161] = 197;
                                break;
                            }
                            break;
                        case 199:
                            if (this.curChar == 'r') {
                                int[] iArr160 = this.jjstateSet;
                                int i162 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i162 + 1;
                                iArr160[i162] = 198;
                                break;
                            }
                            break;
                        case 200:
                            if (this.curChar == 'p') {
                                jjAddStates(145, 147);
                                break;
                            }
                            break;
                        case 203:
                            if (this.curChar == ']' && kind > 47) {
                                kind = 47;
                                break;
                            }
                            break;
                        case 204:
                            if (this.curChar == 'o') {
                                int[] iArr161 = this.jjstateSet;
                                int i163 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i163 + 1;
                                iArr161[i163] = 200;
                                break;
                            }
                            break;
                        case 205:
                            if (this.curChar == 't') {
                                int[] iArr162 = this.jjstateSet;
                                int i164 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i164 + 1;
                                iArr162[i164] = 204;
                                break;
                            }
                            break;
                        case 206:
                            if (this.curChar == 's') {
                                int[] iArr163 = this.jjstateSet;
                                int i165 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i165 + 1;
                                iArr163[i165] = 205;
                                break;
                            }
                            break;
                        case 207:
                            if (this.curChar == 'h') {
                                jjAddStates(148, 150);
                                break;
                            }
                            break;
                        case 210:
                            if (this.curChar == ']' && kind > 48) {
                                kind = 48;
                                break;
                            }
                            break;
                        case 211:
                            if (this.curChar == 's') {
                                int[] iArr164 = this.jjstateSet;
                                int i166 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i166 + 1;
                                iArr164[i166] = 207;
                                break;
                            }
                            break;
                        case 212:
                            if (this.curChar == 'u') {
                                int[] iArr165 = this.jjstateSet;
                                int i167 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i167 + 1;
                                iArr165[i167] = 211;
                                break;
                            }
                            break;
                        case 213:
                            if (this.curChar == 'l') {
                                int[] iArr166 = this.jjstateSet;
                                int i168 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i168 + 1;
                                iArr166[i168] = 212;
                                break;
                            }
                            break;
                        case 214:
                            if (this.curChar == 'f') {
                                int[] iArr167 = this.jjstateSet;
                                int i169 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i169 + 1;
                                iArr167[i169] = 213;
                                break;
                            }
                            break;
                        case 215:
                            if (this.curChar == 't') {
                                jjAddStates(151, 153);
                                break;
                            }
                            break;
                        case 218:
                            if (this.curChar == ']' && kind > 49) {
                                kind = 49;
                                break;
                            }
                            break;
                        case 219:
                            if (this.curChar == 't') {
                                jjAddStates(154, 156);
                                break;
                            }
                            break;
                        case 222:
                            if (this.curChar == ']' && kind > 50) {
                                kind = 50;
                                break;
                            }
                            break;
                        case 223:
                            if (this.curChar == 'l') {
                                int[] iArr168 = this.jjstateSet;
                                int i170 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i170 + 1;
                                iArr168[i170] = 219;
                                break;
                            }
                            break;
                        case 224:
                            if (this.curChar == 't') {
                                jjAddStates(157, 159);
                                break;
                            }
                            break;
                        case 227:
                            if (this.curChar == ']' && kind > 51) {
                                kind = 51;
                                break;
                            }
                            break;
                        case 228:
                            if (this.curChar == 'r') {
                                int[] iArr169 = this.jjstateSet;
                                int i171 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i171 + 1;
                                iArr169[i171] = 224;
                                break;
                            }
                            break;
                        case 229:
                            if (this.curChar == 't') {
                                jjAddStates(160, 162);
                                break;
                            }
                            break;
                        case 232:
                            if (this.curChar == ']' && kind > 52) {
                                kind = 52;
                                break;
                            }
                            break;
                        case 233:
                            if (this.curChar == 'n') {
                                int[] iArr170 = this.jjstateSet;
                                int i172 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i172 + 1;
                                iArr170[i172] = 229;
                                break;
                            }
                            break;
                        case 234:
                            if (this.curChar == 't') {
                                jjAddStates(163, 164);
                                break;
                            }
                            break;
                        case 236:
                            if (this.curChar == ']' && kind > 53) {
                                kind = 53;
                                break;
                            }
                            break;
                        case 237:
                            if (this.curChar == 'l') {
                                int[] iArr171 = this.jjstateSet;
                                int i173 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i173 + 1;
                                iArr171[i173] = 234;
                                break;
                            }
                            break;
                        case 238:
                            if (this.curChar == 'u') {
                                int[] iArr172 = this.jjstateSet;
                                int i174 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i174 + 1;
                                iArr172[i174] = 237;
                                break;
                            }
                            break;
                        case 239:
                            if (this.curChar == 'a') {
                                int[] iArr173 = this.jjstateSet;
                                int i175 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i175 + 1;
                                iArr173[i175] = 238;
                                break;
                            }
                            break;
                        case 240:
                            if (this.curChar == 'f') {
                                int[] iArr174 = this.jjstateSet;
                                int i176 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i176 + 1;
                                iArr174[i176] = 239;
                                break;
                            }
                            break;
                        case 241:
                            if (this.curChar == 'e') {
                                int[] iArr175 = this.jjstateSet;
                                int i177 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i177 + 1;
                                iArr175[i177] = 240;
                                break;
                            }
                            break;
                        case 242:
                            if (this.curChar == 'd') {
                                int[] iArr176 = this.jjstateSet;
                                int i178 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i178 + 1;
                                iArr176[i178] = 241;
                                break;
                            }
                            break;
                        case 243:
                            if (this.curChar == 'd') {
                                jjAddStates(165, 167);
                                break;
                            }
                            break;
                        case 246:
                            if (this.curChar == ']' && kind > 54) {
                                kind = 54;
                                break;
                            }
                            break;
                        case 247:
                            if (this.curChar == 'e') {
                                int[] iArr177 = this.jjstateSet;
                                int i179 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i179 + 1;
                                iArr177[i179] = 243;
                                break;
                            }
                            break;
                        case 248:
                            if (this.curChar == 't') {
                                int[] iArr178 = this.jjstateSet;
                                int i180 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i180 + 1;
                                iArr178[i180] = 247;
                                break;
                            }
                            break;
                        case 249:
                            if (this.curChar == 's') {
                                int[] iArr179 = this.jjstateSet;
                                int i181 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i181 + 1;
                                iArr179[i181] = 248;
                                break;
                            }
                            break;
                        case 250:
                            if (this.curChar == 'e') {
                                int[] iArr180 = this.jjstateSet;
                                int i182 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i182 + 1;
                                iArr180[i182] = 249;
                                break;
                            }
                            break;
                        case 251:
                            if (this.curChar == 'n') {
                                int[] iArr181 = this.jjstateSet;
                                int i183 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i183 + 1;
                                iArr181[i183] = 250;
                                break;
                            }
                            break;
                        case 252:
                            if (this.curChar == 'd') {
                                int[] iArr182 = this.jjstateSet;
                                int i184 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i184 + 1;
                                iArr182[i184] = 253;
                                break;
                            }
                            break;
                        case 254:
                            if (this.curChar == 'e') {
                                int[] iArr183 = this.jjstateSet;
                                int i185 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i185 + 1;
                                iArr183[i185] = 252;
                                break;
                            }
                            break;
                        case 255:
                            if (this.curChar == 't') {
                                int[] iArr184 = this.jjstateSet;
                                int i186 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i186 + 1;
                                iArr184[i186] = 254;
                                break;
                            }
                            break;
                        case DebugModel.TYPE_METHOD /* 256 */:
                            if (this.curChar == 's') {
                                int[] iArr185 = this.jjstateSet;
                                int i187 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i187 + 1;
                                iArr185[i187] = 255;
                                break;
                            }
                            break;
                        case 257:
                            if (this.curChar == 'e') {
                                int[] iArr186 = this.jjstateSet;
                                int i188 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i188 + 1;
                                iArr186[i188] = 256;
                                break;
                            }
                            break;
                        case 258:
                            if (this.curChar == 'n') {
                                int[] iArr187 = this.jjstateSet;
                                int i189 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i189 + 1;
                                iArr187[i189] = 257;
                                break;
                            }
                            break;
                        case 259:
                            if (this.curChar == 'e') {
                                jjAddStates(168, 170);
                                break;
                            }
                            break;
                        case 262:
                            if (this.curChar == ']' && kind > 56) {
                                kind = 56;
                                break;
                            }
                            break;
                        case 263:
                            if (this.curChar == 's') {
                                int[] iArr188 = this.jjstateSet;
                                int i190 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i190 + 1;
                                iArr188[i190] = 259;
                                break;
                            }
                            break;
                        case 264:
                            if (this.curChar == 'r') {
                                int[] iArr189 = this.jjstateSet;
                                int i191 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i191 + 1;
                                iArr189[i191] = 263;
                                break;
                            }
                            break;
                        case 265:
                            if (this.curChar == 'u') {
                                int[] iArr190 = this.jjstateSet;
                                int i192 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i192 + 1;
                                iArr190[i192] = 264;
                                break;
                            }
                            break;
                        case 266:
                            if (this.curChar == 'c') {
                                int[] iArr191 = this.jjstateSet;
                                int i193 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i193 + 1;
                                iArr191[i193] = 265;
                                break;
                            }
                            break;
                        case 267:
                            if (this.curChar == 'e') {
                                int[] iArr192 = this.jjstateSet;
                                int i194 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i194 + 1;
                                iArr192[i194] = 266;
                                break;
                            }
                            break;
                        case 268:
                            if (this.curChar == 'r') {
                                int[] iArr193 = this.jjstateSet;
                                int i195 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i195 + 1;
                                iArr193[i195] = 267;
                                break;
                            }
                            break;
                        case 269:
                            if (this.curChar == 'e') {
                                int[] iArr194 = this.jjstateSet;
                                int i196 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i196 + 1;
                                iArr194[i196] = 270;
                                break;
                            }
                            break;
                        case 271:
                            if (this.curChar == 's') {
                                int[] iArr195 = this.jjstateSet;
                                int i197 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i197 + 1;
                                iArr195[i197] = 269;
                                break;
                            }
                            break;
                        case 272:
                            if (this.curChar == 'r') {
                                int[] iArr196 = this.jjstateSet;
                                int i198 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i198 + 1;
                                iArr196[i198] = 271;
                                break;
                            }
                            break;
                        case 273:
                            if (this.curChar == 'u') {
                                int[] iArr197 = this.jjstateSet;
                                int i199 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i199 + 1;
                                iArr197[i199] = 272;
                                break;
                            }
                            break;
                        case 274:
                            if (this.curChar == 'c') {
                                int[] iArr198 = this.jjstateSet;
                                int i200 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i200 + 1;
                                iArr198[i200] = 273;
                                break;
                            }
                            break;
                        case 275:
                            if (this.curChar == 'e') {
                                int[] iArr199 = this.jjstateSet;
                                int i201 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i201 + 1;
                                iArr199[i201] = 274;
                                break;
                            }
                            break;
                        case 276:
                            if (this.curChar == 'r') {
                                int[] iArr200 = this.jjstateSet;
                                int i202 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i202 + 1;
                                iArr200[i202] = 275;
                                break;
                            }
                            break;
                        case 277:
                            if (this.curChar == 'k') {
                                jjAddStates(171, 173);
                                break;
                            }
                            break;
                        case 280:
                            if (this.curChar == ']' && kind > 58) {
                                kind = 58;
                                break;
                            }
                            break;
                        case 281:
                            if (this.curChar == 'c') {
                                int[] iArr201 = this.jjstateSet;
                                int i203 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i203 + 1;
                                iArr201[i203] = 277;
                                break;
                            }
                            break;
                        case 282:
                            if (this.curChar == 'a') {
                                int[] iArr202 = this.jjstateSet;
                                int i204 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i204 + 1;
                                iArr202[i204] = 281;
                                break;
                            }
                            break;
                        case 283:
                            if (this.curChar == 'b') {
                                int[] iArr203 = this.jjstateSet;
                                int i205 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i205 + 1;
                                iArr203[i205] = 282;
                                break;
                            }
                            break;
                        case 284:
                            if (this.curChar == 'l') {
                                int[] iArr204 = this.jjstateSet;
                                int i206 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i206 + 1;
                                iArr204[i206] = 283;
                                break;
                            }
                            break;
                        case 285:
                            if (this.curChar == 'l') {
                                int[] iArr205 = this.jjstateSet;
                                int i207 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i207 + 1;
                                iArr205[i207] = 284;
                                break;
                            }
                            break;
                        case 286:
                            if (this.curChar == 'a') {
                                int[] iArr206 = this.jjstateSet;
                                int i208 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i208 + 1;
                                iArr206[i208] = 285;
                                break;
                            }
                            break;
                        case 287:
                            if (this.curChar == 'f') {
                                int[] iArr207 = this.jjstateSet;
                                int i209 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i209 + 1;
                                iArr207[i209] = 286;
                                break;
                            }
                            break;
                        case 288:
                            if (this.curChar == 'e') {
                                int[] iArr208 = this.jjstateSet;
                                int i210 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i210 + 1;
                                iArr208[i210] = 289;
                                break;
                            }
                            break;
                        case 290:
                            if (this.curChar == 'p') {
                                int[] iArr209 = this.jjstateSet;
                                int i211 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i211 + 1;
                                iArr209[i211] = 288;
                                break;
                            }
                            break;
                        case 291:
                            if (this.curChar == 'a') {
                                int[] iArr210 = this.jjstateSet;
                                int i212 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i212 + 1;
                                iArr210[i212] = 290;
                                break;
                            }
                            break;
                        case 292:
                            if (this.curChar == 'c') {
                                int[] iArr211 = this.jjstateSet;
                                int i213 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i213 + 1;
                                iArr211[i213] = 291;
                                break;
                            }
                            break;
                        case 293:
                            if (this.curChar == 's') {
                                int[] iArr212 = this.jjstateSet;
                                int i214 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i214 + 1;
                                iArr212[i214] = 292;
                                break;
                            }
                            break;
                        case 294:
                            if (this.curChar == 'e') {
                                int[] iArr213 = this.jjstateSet;
                                int i215 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i215 + 1;
                                iArr213[i215] = 293;
                                break;
                            }
                            break;
                        case 295:
                            if (this.curChar == 'e') {
                                jjAddStates(174, 175);
                                break;
                            }
                            break;
                        case 297:
                            if (this.curChar == ']' && kind > 61) {
                                kind = 61;
                                break;
                            }
                            break;
                        case 298:
                            if (this.curChar == 'p') {
                                int[] iArr214 = this.jjstateSet;
                                int i216 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i216 + 1;
                                iArr214[i216] = 295;
                                break;
                            }
                            break;
                        case 299:
                            if (this.curChar == 'a') {
                                int[] iArr215 = this.jjstateSet;
                                int i217 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i217 + 1;
                                iArr215[i217] = 298;
                                break;
                            }
                            break;
                        case 300:
                            if (this.curChar == 'c') {
                                int[] iArr216 = this.jjstateSet;
                                int i218 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i218 + 1;
                                iArr216[i218] = 299;
                                break;
                            }
                            break;
                        case 301:
                            if (this.curChar == 's') {
                                int[] iArr217 = this.jjstateSet;
                                int i219 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i219 + 1;
                                iArr217[i219] = 300;
                                break;
                            }
                            break;
                        case 302:
                            if (this.curChar == 'e') {
                                int[] iArr218 = this.jjstateSet;
                                int i220 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i220 + 1;
                                iArr218[i220] = 301;
                                break;
                            }
                            break;
                        case 303:
                            if (this.curChar == 'o') {
                                int[] iArr219 = this.jjstateSet;
                                int i221 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i221 + 1;
                                iArr219[i221] = 302;
                                break;
                            }
                            break;
                        case 304:
                            if (this.curChar == 'n') {
                                int[] iArr220 = this.jjstateSet;
                                int i222 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i222 + 1;
                                iArr220[i222] = 303;
                                break;
                            }
                            break;
                        case 331:
                            if (this.curChar == 'f') {
                                jjAddStates(176, 177);
                                break;
                            }
                            break;
                        case 333:
                            if (this.curChar == ']' && kind > 31) {
                                kind = 31;
                                break;
                            }
                            break;
                        case 334:
                            if (this.curChar == 'i') {
                                int[] iArr221 = this.jjstateSet;
                                int i223 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i223 + 1;
                                iArr221[i223] = 331;
                                break;
                            }
                            break;
                        case 338:
                            if (this.curChar == 't') {
                                jjAddStates(178, 179);
                                break;
                            }
                            break;
                        case 340:
                            if (this.curChar == ']' && kind > 32) {
                                kind = 32;
                                break;
                            }
                            break;
                        case 341:
                            if (this.curChar == 's') {
                                int[] iArr222 = this.jjstateSet;
                                int i224 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i224 + 1;
                                iArr222[i224] = 338;
                                break;
                            }
                            break;
                        case 342:
                            if (this.curChar == 'i') {
                                int[] iArr223 = this.jjstateSet;
                                int i225 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i225 + 1;
                                iArr223[i225] = 341;
                                break;
                            }
                            break;
                        case 343:
                            if (this.curChar == 'l') {
                                int[] iArr224 = this.jjstateSet;
                                int i226 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i226 + 1;
                                iArr224[i226] = 342;
                                break;
                            }
                            break;
                        case 347:
                            if (this.curChar == 'r') {
                                jjAddStates(180, 181);
                                break;
                            }
                            break;
                        case 349:
                            if (this.curChar == ']' && kind > 33) {
                                kind = 33;
                                break;
                            }
                            break;
                        case 350:
                            if (this.curChar == 'e') {
                                int[] iArr225 = this.jjstateSet;
                                int i227 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i227 + 1;
                                iArr225[i227] = 347;
                                break;
                            }
                            break;
                        case 351:
                            if (this.curChar == 'v') {
                                int[] iArr226 = this.jjstateSet;
                                int i228 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i228 + 1;
                                iArr226[i228] = 350;
                                break;
                            }
                            break;
                        case 352:
                            if (this.curChar == 'o') {
                                int[] iArr227 = this.jjstateSet;
                                int i229 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i229 + 1;
                                iArr227[i229] = 351;
                                break;
                            }
                            break;
                        case 353:
                            if (this.curChar == 'c') {
                                int[] iArr228 = this.jjstateSet;
                                int i230 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i230 + 1;
                                iArr228[i230] = 352;
                                break;
                            }
                            break;
                        case 354:
                            if (this.curChar == 'e') {
                                int[] iArr229 = this.jjstateSet;
                                int i231 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i231 + 1;
                                iArr229[i231] = 353;
                                break;
                            }
                            break;
                        case 355:
                            if (this.curChar == 'r') {
                                int[] iArr230 = this.jjstateSet;
                                int i232 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i232 + 1;
                                iArr230[i232] = 354;
                                break;
                            }
                            break;
                        case 359:
                            if (this.curChar == 't') {
                                jjAddStates(182, 183);
                                break;
                            }
                            break;
                        case 361:
                            if (this.curChar == ']' && kind > 34) {
                                kind = 34;
                                break;
                            }
                            break;
                        case 362:
                            if (this.curChar == 'p') {
                                int[] iArr231 = this.jjstateSet;
                                int i233 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i233 + 1;
                                iArr231[i233] = 359;
                                break;
                            }
                            break;
                        case 363:
                            if (this.curChar == 'm') {
                                int[] iArr232 = this.jjstateSet;
                                int i234 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i234 + 1;
                                iArr232[i234] = 362;
                                break;
                            }
                            break;
                        case 364:
                            if (this.curChar == 'e') {
                                int[] iArr233 = this.jjstateSet;
                                int i235 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i235 + 1;
                                iArr233[i235] = 363;
                                break;
                            }
                            break;
                        case 365:
                            if (this.curChar == 't') {
                                int[] iArr234 = this.jjstateSet;
                                int i236 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i236 + 1;
                                iArr234[i236] = 364;
                                break;
                            }
                            break;
                        case 366:
                            if (this.curChar == 't') {
                                int[] iArr235 = this.jjstateSet;
                                int i237 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i237 + 1;
                                iArr235[i237] = 365;
                                break;
                            }
                            break;
                        case 367:
                            if (this.curChar == 'a') {
                                int[] iArr236 = this.jjstateSet;
                                int i238 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i238 + 1;
                                iArr236[i238] = 366;
                                break;
                            }
                            break;
                        case 371:
                            if (this.curChar == 'h') {
                                jjAddStates(184, 185);
                                break;
                            }
                            break;
                        case 373:
                            if (this.curChar == ']' && kind > 35) {
                                kind = 35;
                                break;
                            }
                            break;
                        case 374:
                            if (this.curChar == 'c') {
                                int[] iArr237 = this.jjstateSet;
                                int i239 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i239 + 1;
                                iArr237[i239] = 371;
                                break;
                            }
                            break;
                        case 375:
                            if (this.curChar == 'a') {
                                int[] iArr238 = this.jjstateSet;
                                int i240 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i240 + 1;
                                iArr238[i240] = 374;
                                break;
                            }
                            break;
                        case 376:
                            if (this.curChar == 'e') {
                                int[] iArr239 = this.jjstateSet;
                                int i241 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i241 + 1;
                                iArr239[i241] = 375;
                                break;
                            }
                            break;
                        case 377:
                            if (this.curChar == 'r') {
                                int[] iArr240 = this.jjstateSet;
                                int i242 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i242 + 1;
                                iArr240[i242] = 376;
                                break;
                            }
                            break;
                        case 378:
                            if (this.curChar == 'o') {
                                int[] iArr241 = this.jjstateSet;
                                int i243 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i243 + 1;
                                iArr241[i243] = 377;
                                break;
                            }
                            break;
                        case 379:
                            if (this.curChar == 'f') {
                                int[] iArr242 = this.jjstateSet;
                                int i244 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i244 + 1;
                                iArr242[i244] = 378;
                                break;
                            }
                            break;
                        case 383:
                            if (this.curChar == 'l') {
                                jjAddStates(186, 187);
                                break;
                            }
                            break;
                        case 385:
                            if (this.curChar == ']' && kind > 36) {
                                kind = 36;
                                break;
                            }
                            break;
                        case 386:
                            if (this.curChar == 'a') {
                                int[] iArr243 = this.jjstateSet;
                                int i245 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i245 + 1;
                                iArr243[i245] = 383;
                                break;
                            }
                            break;
                        case 387:
                            if (this.curChar == 'c') {
                                int[] iArr244 = this.jjstateSet;
                                int i246 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i246 + 1;
                                iArr244[i246] = 386;
                                break;
                            }
                            break;
                        case 388:
                            if (this.curChar == 'o') {
                                int[] iArr245 = this.jjstateSet;
                                int i247 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i247 + 1;
                                iArr245[i247] = 387;
                                break;
                            }
                            break;
                        case 389:
                            if (this.curChar == 'l') {
                                int[] iArr246 = this.jjstateSet;
                                int i248 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i248 + 1;
                                iArr246[i248] = 388;
                                break;
                            }
                            break;
                        case 393:
                            if (this.curChar == 'l') {
                                jjAddStates(188, 189);
                                break;
                            }
                            break;
                        case 395:
                            if (this.curChar == ']' && kind > 37) {
                                kind = 37;
                                break;
                            }
                            break;
                        case 396:
                            if (this.curChar == 'a') {
                                int[] iArr247 = this.jjstateSet;
                                int i249 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i249 + 1;
                                iArr247[i249] = 393;
                                break;
                            }
                            break;
                        case 397:
                            if (this.curChar == 'b') {
                                int[] iArr248 = this.jjstateSet;
                                int i250 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i250 + 1;
                                iArr248[i250] = 396;
                                break;
                            }
                            break;
                        case 398:
                            if (this.curChar == 'o') {
                                int[] iArr249 = this.jjstateSet;
                                int i251 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i251 + 1;
                                iArr249[i251] = 397;
                                break;
                            }
                            break;
                        case 399:
                            if (this.curChar == 'l') {
                                int[] iArr250 = this.jjstateSet;
                                int i252 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i252 + 1;
                                iArr250[i252] = 398;
                                break;
                            }
                            break;
                        case 400:
                            if (this.curChar == 'g') {
                                int[] iArr251 = this.jjstateSet;
                                int i253 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i253 + 1;
                                iArr251[i253] = 399;
                                break;
                            }
                            break;
                        case 404:
                            if (this.curChar == 'n') {
                                jjAddStates(190, 191);
                                break;
                            }
                            break;
                        case 406:
                            if (this.curChar == ']' && kind > 38) {
                                kind = 38;
                                break;
                            }
                            break;
                        case 407:
                            if (this.curChar == 'g') {
                                int[] iArr252 = this.jjstateSet;
                                int i254 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i254 + 1;
                                iArr252[i254] = 404;
                                break;
                            }
                            break;
                        case 408:
                            if (this.curChar == 'i') {
                                int[] iArr253 = this.jjstateSet;
                                int i255 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i255 + 1;
                                iArr253[i255] = 407;
                                break;
                            }
                            break;
                        case 409:
                            if (this.curChar == 's') {
                                int[] iArr254 = this.jjstateSet;
                                int i256 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i256 + 1;
                                iArr254[i256] = 408;
                                break;
                            }
                            break;
                        case 410:
                            if (this.curChar == 's') {
                                int[] iArr255 = this.jjstateSet;
                                int i257 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i257 + 1;
                                iArr255[i257] = 409;
                                break;
                            }
                            break;
                        case 411:
                            if (this.curChar == 'a') {
                                int[] iArr256 = this.jjstateSet;
                                int i258 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i258 + 1;
                                iArr256[i258] = 410;
                                break;
                            }
                            break;
                        case 415:
                            if (this.curChar == 'n') {
                                jjAddStates(192, 193);
                                break;
                            }
                            break;
                        case 417:
                            if (this.curChar == ']' && kind > 39) {
                                kind = 39;
                                break;
                            }
                            break;
                        case 418:
                            if (this.curChar == 'o') {
                                int[] iArr257 = this.jjstateSet;
                                int i259 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i259 + 1;
                                iArr257[i259] = 415;
                                break;
                            }
                            break;
                        case 419:
                            if (this.curChar == 'i') {
                                int[] iArr258 = this.jjstateSet;
                                int i260 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i260 + 1;
                                iArr258[i260] = 418;
                                break;
                            }
                            break;
                        case 420:
                            if (this.curChar == 't') {
                                int[] iArr259 = this.jjstateSet;
                                int i261 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i261 + 1;
                                iArr259[i261] = 419;
                                break;
                            }
                            break;
                        case 421:
                            if (this.curChar == 'c') {
                                int[] iArr260 = this.jjstateSet;
                                int i262 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i262 + 1;
                                iArr260[i262] = 420;
                                break;
                            }
                            break;
                        case 422:
                            if (this.curChar == 'n') {
                                int[] iArr261 = this.jjstateSet;
                                int i263 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i263 + 1;
                                iArr261[i263] = 421;
                                break;
                            }
                            break;
                        case 423:
                            if (this.curChar == 'u') {
                                int[] iArr262 = this.jjstateSet;
                                int i264 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i264 + 1;
                                iArr262[i264] = 422;
                                break;
                            }
                            break;
                        case 424:
                            if (this.curChar == 'f') {
                                int[] iArr263 = this.jjstateSet;
                                int i265 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i265 + 1;
                                iArr263[i265] = 423;
                                break;
                            }
                            break;
                        case 428:
                            if (this.curChar == 'o') {
                                jjAddStates(194, 195);
                                break;
                            }
                            break;
                        case 430:
                            if (this.curChar == ']' && kind > 40) {
                                kind = 40;
                                break;
                            }
                            break;
                        case 431:
                            if (this.curChar == 'r') {
                                int[] iArr264 = this.jjstateSet;
                                int i266 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i266 + 1;
                                iArr264[i266] = 428;
                                break;
                            }
                            break;
                        case 432:
                            if (this.curChar == 'c') {
                                int[] iArr265 = this.jjstateSet;
                                int i267 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i267 + 1;
                                iArr265[i267] = 431;
                                break;
                            }
                            break;
                        case 433:
                            if (this.curChar == 'a') {
                                int[] iArr266 = this.jjstateSet;
                                int i268 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i268 + 1;
                                iArr266[i268] = 432;
                                break;
                            }
                            break;
                        case 434:
                            if (this.curChar == 'm') {
                                int[] iArr267 = this.jjstateSet;
                                int i269 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i269 + 1;
                                iArr267[i269] = 433;
                                break;
                            }
                            break;
                        case 438:
                            if (this.curChar == 's') {
                                jjAddStates(196, 197);
                                break;
                            }
                            break;
                        case 440:
                            if (this.curChar == ']' && kind > 41) {
                                kind = 41;
                                break;
                            }
                            break;
                        case 441:
                            if (this.curChar == 's') {
                                int[] iArr268 = this.jjstateSet;
                                int i270 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i270 + 1;
                                iArr268[i270] = 438;
                                break;
                            }
                            break;
                        case 442:
                            if (this.curChar == 'e') {
                                int[] iArr269 = this.jjstateSet;
                                int i271 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i271 + 1;
                                iArr269[i271] = 441;
                                break;
                            }
                            break;
                        case 443:
                            if (this.curChar == 'r') {
                                int[] iArr270 = this.jjstateSet;
                                int i272 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i272 + 1;
                                iArr270[i272] = 442;
                                break;
                            }
                            break;
                        case 444:
                            if (this.curChar == 'p') {
                                int[] iArr271 = this.jjstateSet;
                                int i273 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i273 + 1;
                                iArr271[i273] = 443;
                                break;
                            }
                            break;
                        case 445:
                            if (this.curChar == 'm') {
                                int[] iArr272 = this.jjstateSet;
                                int i274 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i274 + 1;
                                iArr272[i274] = 444;
                                break;
                            }
                            break;
                        case 446:
                            if (this.curChar == 'o') {
                                int[] iArr273 = this.jjstateSet;
                                int i275 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i275 + 1;
                                iArr273[i275] = 445;
                                break;
                            }
                            break;
                        case 447:
                            if (this.curChar == 'c') {
                                int[] iArr274 = this.jjstateSet;
                                int i276 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i276 + 1;
                                iArr274[i276] = 446;
                                break;
                            }
                            break;
                        case 451:
                            if (this.curChar == 'm') {
                                jjAddStates(198, 199);
                                break;
                            }
                            break;
                        case 453:
                            if (this.curChar == ']' && kind > 42) {
                                kind = 42;
                                break;
                            }
                            break;
                        case 454:
                            if (this.curChar == 'r') {
                                int[] iArr275 = this.jjstateSet;
                                int i277 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i277 + 1;
                                iArr275[i277] = 451;
                                break;
                            }
                            break;
                        case 455:
                            if (this.curChar == 'o') {
                                int[] iArr276 = this.jjstateSet;
                                int i278 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i278 + 1;
                                iArr276[i278] = 454;
                                break;
                            }
                            break;
                        case 456:
                            if (this.curChar == 'f') {
                                int[] iArr277 = this.jjstateSet;
                                int i279 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i279 + 1;
                                iArr277[i279] = 455;
                                break;
                            }
                            break;
                        case 457:
                            if (this.curChar == 's') {
                                int[] iArr278 = this.jjstateSet;
                                int i280 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i280 + 1;
                                iArr278[i280] = 456;
                                break;
                            }
                            break;
                        case 458:
                            if (this.curChar == 'n') {
                                int[] iArr279 = this.jjstateSet;
                                int i281 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i281 + 1;
                                iArr279[i281] = 457;
                                break;
                            }
                            break;
                        case 459:
                            if (this.curChar == 'a') {
                                int[] iArr280 = this.jjstateSet;
                                int i282 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i282 + 1;
                                iArr280[i282] = 458;
                                break;
                            }
                            break;
                        case 460:
                            if (this.curChar == 'r') {
                                int[] iArr281 = this.jjstateSet;
                                int i283 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i283 + 1;
                                iArr281[i283] = 459;
                                break;
                            }
                            break;
                        case 461:
                            if (this.curChar == 't') {
                                int[] iArr282 = this.jjstateSet;
                                int i284 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i284 + 1;
                                iArr282[i284] = 460;
                                break;
                            }
                            break;
                        case 465:
                            if (this.curChar == 'h') {
                                jjAddStates(200, 201);
                                break;
                            }
                            break;
                        case 467:
                            if (this.curChar == ']' && kind > 43) {
                                kind = 43;
                                break;
                            }
                            break;
                        case 468:
                            if (this.curChar == 'c') {
                                int[] iArr283 = this.jjstateSet;
                                int i285 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i285 + 1;
                                iArr283[i285] = 465;
                                break;
                            }
                            break;
                        case 469:
                            if (this.curChar == 't') {
                                int[] iArr284 = this.jjstateSet;
                                int i286 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i286 + 1;
                                iArr284[i286] = 468;
                                break;
                            }
                            break;
                        case 470:
                            if (this.curChar == 'i') {
                                int[] iArr285 = this.jjstateSet;
                                int i287 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i287 + 1;
                                iArr285[i287] = 469;
                                break;
                            }
                            break;
                        case 471:
                            if (this.curChar == 'w') {
                                int[] iArr286 = this.jjstateSet;
                                int i288 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i288 + 1;
                                iArr286[i288] = 470;
                                break;
                            }
                            break;
                        case 472:
                            if (this.curChar == 's') {
                                int[] iArr287 = this.jjstateSet;
                                int i289 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i289 + 1;
                                iArr287[i289] = 471;
                                break;
                            }
                            break;
                        case 492:
                            if (this.curChar == 'e') {
                                jjAddStates(202, 203);
                                break;
                            }
                            break;
                        case 494:
                            if (this.curChar == ']' && kind > 60) {
                                kind = 60;
                                break;
                            }
                            break;
                        case 495:
                            if (this.curChar == 'p') {
                                int[] iArr288 = this.jjstateSet;
                                int i290 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i290 + 1;
                                iArr288[i290] = 492;
                                break;
                            }
                            break;
                        case 496:
                            if (this.curChar == 'a') {
                                int[] iArr289 = this.jjstateSet;
                                int i291 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i291 + 1;
                                iArr289[i291] = 495;
                                break;
                            }
                            break;
                        case 497:
                            if (this.curChar == 'c') {
                                int[] iArr290 = this.jjstateSet;
                                int i292 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i292 + 1;
                                iArr290[i292] = 496;
                                break;
                            }
                            break;
                        case 498:
                            if (this.curChar == 's') {
                                int[] iArr291 = this.jjstateSet;
                                int i293 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i293 + 1;
                                iArr291[i293] = 497;
                                break;
                            }
                            break;
                        case 499:
                            if (this.curChar == 'e') {
                                int[] iArr292 = this.jjstateSet;
                                int i294 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i294 + 1;
                                iArr292[i294] = 498;
                                break;
                            }
                            break;
                        case 504:
                            if (this.curChar == 'e') {
                                jjAddStates(204, 205);
                                break;
                            }
                            break;
                        case 506:
                            if (this.curChar == ']' && kind > 62) {
                                kind = 62;
                                break;
                            }
                            break;
                        case 507:
                            if (this.curChar == 'p') {
                                int[] iArr293 = this.jjstateSet;
                                int i295 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i295 + 1;
                                iArr293[i295] = 504;
                                break;
                            }
                            break;
                        case 508:
                            if (this.curChar == 'a') {
                                int[] iArr294 = this.jjstateSet;
                                int i296 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i296 + 1;
                                iArr294[i296] = 507;
                                break;
                            }
                            break;
                        case 509:
                            if (this.curChar == 'c') {
                                int[] iArr295 = this.jjstateSet;
                                int i297 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i297 + 1;
                                iArr295[i297] = 508;
                                break;
                            }
                            break;
                        case 510:
                            if (this.curChar == 's') {
                                int[] iArr296 = this.jjstateSet;
                                int i298 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i298 + 1;
                                iArr296[i298] = 509;
                                break;
                            }
                            break;
                        case 511:
                            if (this.curChar == 'e') {
                                int[] iArr297 = this.jjstateSet;
                                int i299 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i299 + 1;
                                iArr297[i299] = 510;
                                break;
                            }
                            break;
                        case DebugModel.TYPE_METHOD_EX /* 512 */:
                            if (this.curChar == 'o') {
                                int[] iArr298 = this.jjstateSet;
                                int i300 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i300 + 1;
                                iArr298[i300] = 511;
                                break;
                            }
                            break;
                        case 513:
                            if (this.curChar == 'n') {
                                int[] iArr299 = this.jjstateSet;
                                int i301 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i301 + 1;
                                iArr299[i301] = 512;
                                break;
                            }
                            break;
                        case 516:
                            if (this.curChar == '@' && kind > 63) {
                                kind = 63;
                                break;
                            }
                            break;
                        case 517:
                            if (this.curChar == 'l') {
                                int[] iArr300 = this.jjstateSet;
                                int i302 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i302 + 1;
                                iArr300[i302] = 518;
                                break;
                            }
                            break;
                        case 519:
                        case 547:
                            if (this.curChar == 't') {
                                jjCheckNAdd(517);
                                break;
                            }
                            break;
                        case 520:
                            if (this.curChar == 'f') {
                                int[] iArr301 = this.jjstateSet;
                                int i303 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i303 + 1;
                                iArr301[i303] = 519;
                                break;
                            }
                            break;
                        case 522:
                            if (this.curChar == 'l') {
                                jjAddStates(275, 276);
                                break;
                            }
                            break;
                        case 524:
                            if (this.curChar == ']' && kind > 66) {
                                kind = 66;
                                break;
                            }
                            break;
                        case 525:
                        case 550:
                            if (this.curChar == 't') {
                                jjCheckNAdd(522);
                                break;
                            }
                            break;
                        case 526:
                            if (this.curChar == 'f') {
                                int[] iArr302 = this.jjstateSet;
                                int i304 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i304 + 1;
                                iArr302[i304] = 525;
                                break;
                            }
                            break;
                        case 529:
                            if ((576460745995190270L & l2) != 0) {
                                if (kind > 67) {
                                    kind = 67;
                                }
                                int[] iArr303 = this.jjstateSet;
                                int i305 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i305 + 1;
                                iArr303[i305] = 529;
                                break;
                            }
                            break;
                        case 531:
                            if (this.curChar == '[') {
                                jjAddStates(214, 274);
                                break;
                            }
                            break;
                        case 548:
                            if (this.curChar == 'f') {
                                int[] iArr304 = this.jjstateSet;
                                int i306 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i306 + 1;
                                iArr304[i306] = 547;
                                break;
                            }
                            break;
                        case 551:
                            if (this.curChar == 'f') {
                                int[] iArr305 = this.jjstateSet;
                                int i307 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i307 + 1;
                                iArr305[i307] = 550;
                                break;
                            }
                            break;
                        case 554:
                            if (this.curChar == '[') {
                                jjAddStates(7, 8);
                                break;
                            }
                            break;
                        case 558:
                            if (this.curChar == '@') {
                                jjCheckNAddStates(277, 279);
                                break;
                            }
                            break;
                        case 559:
                        case 560:
                            if ((576460745995190271L & l2) != 0) {
                                jjCheckNAddStates(206, 209);
                                break;
                            }
                            break;
                        case 562:
                        case 563:
                            if ((576460745995190271L & l2) != 0) {
                                jjCheckNAddStates(210, 213);
                                break;
                            }
                            break;
                        case 565:
                            if (this.curChar == ']' && kind > 64) {
                                kind = 64;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i2100 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                        case 2:
                            if (jjCanMove_0(hiByte, i1, i2100, l1, l22)) {
                                if (kind > 69) {
                                    kind = 69;
                                }
                                jjCheckNAdd(1);
                                break;
                            }
                            break;
                        case 559:
                        case 560:
                            if (jjCanMove_1(hiByte, i1, i2100, l1, l22)) {
                                jjCheckNAddStates(206, 209);
                                break;
                            }
                            break;
                        case 562:
                        case 563:
                            if (jjCanMove_1(hiByte, i1, i2100, l1, l22)) {
                                jjCheckNAddStates(210, 213);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i308 = this.jjnewStateCnt;
            i = i308;
            int i309 = startsAt;
            this.jjnewStateCnt = i309;
            int i310 = 567 - i309;
            startsAt = i310;
            if (i308 == i310) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_2(int pos, long active0, long active1) {
        switch (pos) {
            case 0:
                if ((active1 & 140737488355328L) != 0) {
                    return 2;
                }
                if ((active1 & 549755813888L) != 0) {
                    return 39;
                }
                if ((active1 & 63050394784759808L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    return 34;
                }
                return -1;
            case 1:
                if ((active1 & 27021597764222976L) != 0) {
                    return 34;
                }
                if ((active1 & 36028797020536832L) != 0) {
                    if (this.jjmatchedPos != 1) {
                        this.jjmatchedKind = FMParserConstants.ID;
                        this.jjmatchedPos = 1;
                        return 34;
                    }
                    return 34;
                }
                return -1;
            case 2:
                if ((active1 & 36028797020536832L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 2;
                    return 34;
                }
                return -1;
            case 3:
                if ((active1 & 1048576) != 0) {
                    return 34;
                }
                if ((active1 & 36028797019488256L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 3;
                    return 34;
                }
                return -1;
            default:
                return -1;
        }
    }

    private final int jjStartNfa_2(int pos, long active0, long active1) {
        return jjMoveNfa_2(jjStopStringLiteralDfa_2(pos, active0, active1), pos + 1);
    }

    private final int jjStartNfaWithStates_2(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_2(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_2() {
        switch (this.curChar) {
            case FMParserConstants.END_RECOVER /* 33 */:
                this.jjmatchedKind = FMParserConstants.EXCLAM;
                return jjMoveStringLiteralDfa1_2(536870912L);
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.FLUSH /* 48 */:
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case '@':
            case FMParserConstants.FTL_HEADER /* 65 */:
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case FMParserConstants.ESCAPED_CHAR /* 80 */:
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            case FMParserConstants.ID /* 120 */:
            case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
            case FMParserConstants.LETTER /* 122 */:
            case FMParserConstants.DIRECTIVE_END /* 124 */:
            default:
                return jjMoveNfa_2(1, 0);
            case FMParserConstants.END_GLOBAL /* 37 */:
                return jjStopAtPos(0, FMParserConstants.PERCENT);
            case FMParserConstants.END_MACRO /* 40 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_PAREN);
            case FMParserConstants.END_COMPRESS /* 41 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_PAREN);
            case FMParserConstants.END_TRANSFORM /* 42 */:
                this.jjmatchedKind = 100;
                return jjMoveStringLiteralDfa1_2(137438953472L);
            case FMParserConstants.END_SWITCH /* 43 */:
                return jjStopAtPos(0, 98);
            case FMParserConstants.ELSE /* 44 */:
                return jjStopAtPos(0, FMParserConstants.COMMA);
            case FMParserConstants.BREAK /* 45 */:
                return jjStopAtPos(0, 99);
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                this.jjmatchedKind = 87;
                return jjMoveStringLiteralDfa1_2(274894684160L);
            case FMParserConstants.HALT /* 47 */:
                return jjStartNfaWithStates_2(0, FMParserConstants.DIVIDE, 39);
            case FMParserConstants.FALLBACK /* 58 */:
                return jjStopAtPos(0, FMParserConstants.COLON);
            case FMParserConstants.ESCAPE /* 59 */:
                return jjStopAtPos(0, FMParserConstants.SEMICOLON);
            case FMParserConstants.NOESCAPE /* 61 */:
                this.jjmatchedKind = 91;
                return jjMoveStringLiteralDfa1_2(268435456L);
            case FMParserConstants.END_NOESCAPE /* 62 */:
                return jjStopAtPos(0, FMParserConstants.DIRECTIVE_END);
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                this.jjmatchedKind = 89;
                return jjMoveStringLiteralDfa1_2(67108864L);
            case FMParserConstants.EQUALS /* 91 */:
                return jjStartNfaWithStates_2(0, FMParserConstants.OPEN_BRACKET, 2);
            case FMParserConstants.NOT_EQUALS /* 93 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACKET);
            case FMParserConstants.ESCAPED_GTE /* 97 */:
                return jjMoveStringLiteralDfa1_2(18014398509481984L);
            case FMParserConstants.ELLIPSIS /* 102 */:
                return jjMoveStringLiteralDfa1_2(524288L);
            case FMParserConstants.AND /* 105 */:
                return jjMoveStringLiteralDfa1_2(9007199254740992L);
            case FMParserConstants.CLOSE_BRACE /* 116 */:
                return jjMoveStringLiteralDfa1_2(1048576L);
            case FMParserConstants.IN /* 117 */:
                return jjMoveStringLiteralDfa1_2(36028797018963968L);
            case FMParserConstants.DIGIT /* 123 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_BRACE);
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACE);
        }
    }

    private final int jjMoveStringLiteralDfa1_2(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.END_TRANSFORM /* 42 */:
                    if ((active1 & 137438953472L) != 0) {
                        return jjStopAtPos(1, FMParserConstants.DOUBLE_STAR);
                    }
                    break;
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active1 & 16777216) != 0) {
                        this.jjmatchedKind = 88;
                        this.jjmatchedPos = 1;
                    }
                    return jjMoveStringLiteralDfa2_2(active1, 274877906944L);
                case FMParserConstants.NOESCAPE /* 61 */:
                    if ((active1 & 268435456) != 0) {
                        return jjStopAtPos(1, 92);
                    }
                    if ((active1 & 536870912) != 0) {
                        return jjStopAtPos(1, 93);
                    }
                    break;
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                    if ((active1 & 67108864) != 0) {
                        return jjStopAtPos(1, 90);
                    }
                    break;
                case FMParserConstants.ESCAPED_GTE /* 97 */:
                    return jjMoveStringLiteralDfa2_2(active1, 524288L);
                case FMParserConstants.COLON /* 110 */:
                    if ((active1 & 9007199254740992L) != 0) {
                        return jjStartNfaWithStates_2(1, FMParserConstants.IN, 34);
                    }
                    break;
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    return jjMoveStringLiteralDfa2_2(active1, 1048576L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    if ((active1 & 18014398509481984L) != 0) {
                        return jjStartNfaWithStates_2(1, FMParserConstants.AS, 34);
                    }
                    return jjMoveStringLiteralDfa2_2(active1, 36028797018963968L);
            }
            return jjStartNfa_2(0, 0L, active1);
        } catch (IOException e) {
            jjStopStringLiteralDfa_2(0, 0L, active1);
            return 1;
        }
    }

    private final int jjMoveStringLiteralDfa2_2(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_2(0, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active12 & 274877906944L) != 0) {
                        return jjStopAtPos(2, FMParserConstants.ELLIPSIS);
                    }
                    break;
                case FMParserConstants.AND /* 105 */:
                    return jjMoveStringLiteralDfa3_2(active12, 36028797018963968L);
                case FMParserConstants.COMMA /* 108 */:
                    return jjMoveStringLiteralDfa3_2(active12, 524288L);
                case FMParserConstants.IN /* 117 */:
                    return jjMoveStringLiteralDfa3_2(active12, 1048576L);
            }
            return jjStartNfa_2(1, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_2(1, 0L, active12);
            return 2;
        }
    }

    private final int jjMoveStringLiteralDfa3_2(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_2(1, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 1048576) != 0) {
                        return jjStartNfaWithStates_2(3, 84, 34);
                    }
                    break;
                case FMParserConstants.COLON /* 110 */:
                    return jjMoveStringLiteralDfa4_2(active12, 36028797018963968L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    return jjMoveStringLiteralDfa4_2(active12, 524288L);
            }
            return jjStartNfa_2(2, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_2(2, 0L, active12);
            return 3;
        }
    }

    private final int jjMoveStringLiteralDfa4_2(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_2(2, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 524288) != 0) {
                        return jjStartNfaWithStates_2(4, 83, 34);
                    }
                    break;
                case FMParserConstants.DIVIDE /* 103 */:
                    if ((active12 & 36028797018963968L) != 0) {
                        return jjStartNfaWithStates_2(4, FMParserConstants.USING, 34);
                    }
                    break;
            }
            return jjStartNfa_2(3, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_2(3, 0L, active12);
            return 4;
        }
    }

    private final int jjMoveNfa_2(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 76;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(280, 282);
                            } else if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                            } else if (this.curChar == '&') {
                                jjAddStates(283, 287);
                            } else if (this.curChar == '/') {
                                jjAddStates(288, 289);
                            } else if (this.curChar == '#' || this.curChar == '$') {
                                jjCheckNAdd(35);
                            } else if (this.curChar == '<') {
                                jjCheckNAdd(27);
                            } else if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                            } else if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                            }
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '&') {
                                if (kind > 105) {
                                    kind = 105;
                                }
                            } else if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                            }
                            if (this.curChar == '<') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 2;
                                break;
                            }
                            break;
                        case 2:
                            if ((42949672960L & l) != 0) {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 4;
                                break;
                            }
                            break;
                        case 3:
                            if (this.curChar == '-' && kind > 74) {
                                kind = 74;
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == '-') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 3;
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 6:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 8:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == '\"' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case 16:
                            if (this.curChar == '\'' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.MACRO /* 20 */:
                            if (this.curChar == '\"') {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.VISIT /* 22 */:
                            if (this.curChar == '\"' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.STOP /* 23 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.CALL /* 25 */:
                            if (this.curChar == '\'' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.SETTING /* 26 */:
                            if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.COMPRESS /* 27 */:
                            if (this.curChar == '=' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                            if (this.curChar == '<') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                        case 73:
                            if (this.curChar == '&' && kind > 105) {
                                kind = 105;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((287948969894477824L & l) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_LOCAL /* 36 */:
                            if (this.curChar == '$') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_GLOBAL /* 37 */:
                            if (this.curChar == '#') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            if (this.curChar == '/') {
                                jjAddStates(288, 289);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if (this.curChar == '>' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(280, 282);
                                break;
                            }
                            break;
                        case FMParserConstants.END_TRANSFORM /* 42 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAdd(42);
                                break;
                            }
                            break;
                        case FMParserConstants.END_SWITCH /* 43 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddTwoStates(43, 44);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE /* 44 */:
                            if (this.curChar == '.') {
                                jjCheckNAdd(45);
                                break;
                            }
                            break;
                        case FMParserConstants.BREAK /* 45 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 86) {
                                    kind = 86;
                                }
                                jjCheckNAdd(45);
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPE /* 59 */:
                            if (this.curChar == '&') {
                                jjAddStates(283, 287);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            if (this.curChar == ';' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.UNIFIED_CALL /* 63 */:
                            if (this.curChar == ';') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                            if (this.curChar == ';' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                            if (this.curChar == '=' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.FALSE_ALERT /* 70 */:
                            if (this.curChar == ';') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 69;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '\\') {
                                jjAddStates(296, 299);
                            } else if (this.curChar == '|') {
                                int[] iArr5 = this.jjstateSet;
                                int i7 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i7 + 1;
                                iArr5[i7] = 31;
                            } else if (this.curChar == '[') {
                                int[] iArr6 = this.jjstateSet;
                                int i8 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i8 + 1;
                                iArr6[i8] = 2;
                            }
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(54, 75);
                                break;
                            } else if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(47, 49);
                                break;
                            } else if (this.curChar == '|') {
                                if (kind > 106) {
                                    kind = 106;
                                    break;
                                }
                            } else if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case 6:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == '\\') {
                                jjAddStates(302, 303);
                                break;
                            }
                            break;
                        case 8:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if (this.curChar == 'x') {
                                int[] iArr7 = this.jjstateSet;
                                int i9 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i9 + 1;
                                iArr7[i9] = 11;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            if (this.curChar == '\\') {
                                jjAddStates(304, 305);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants._INCLUDE /* 17 */:
                            if (this.curChar == 'x') {
                                int[] iArr8 = this.jjstateSet;
                                int i10 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i10 + 1;
                                iArr8[i10] = 18;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            jjAddStates(306, 307);
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            jjAddStates(308, 309);
                            break;
                        case FMParserConstants.NOPARSE /* 30 */:
                        case FMParserConstants.END_IF /* 31 */:
                            if (this.curChar == '|' && kind > 106) {
                                kind = 106;
                                break;
                            }
                            break;
                        case 32:
                            if (this.curChar == '|') {
                                int[] iArr9 = this.jjstateSet;
                                int i11 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i11 + 1;
                                iArr9[i11] = 31;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == '{' && kind > 121) {
                                kind = 121;
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if (this.curChar == ']' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RETURN /* 46 */:
                            if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(47, 49);
                                break;
                            }
                            break;
                        case FMParserConstants.HALT /* 47 */:
                            if (this.curChar == 't' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.FLUSH /* 48 */:
                            if (this.curChar == 'e' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIM /* 49 */:
                        case FMParserConstants.NOTRIM /* 52 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(48);
                                break;
                            }
                            break;
                        case FMParserConstants.LTRIM /* 50 */:
                            if (this.curChar == '\\') {
                                jjAddStates(296, 299);
                                break;
                            }
                            break;
                        case FMParserConstants.RTRIM /* 51 */:
                            if (this.curChar == 'l') {
                                jjCheckNAdd(47);
                                break;
                            }
                            break;
                        case FMParserConstants.DEFAUL /* 53 */:
                            if (this.curChar == 'l') {
                                int[] iArr10 = this.jjstateSet;
                                int i12 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i12 + 1;
                                iArr10[i12] = 52;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_NESTED /* 54 */:
                            if (this.curChar == 't' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.NESTED /* 55 */:
                            if (this.curChar == 'g') {
                                jjCheckNAdd(54);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                            if (this.curChar == 'e' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.RECURSE /* 57 */:
                        case 75:
                            if (this.curChar == 't') {
                                jjCheckNAdd(56);
                                break;
                            }
                            break;
                        case FMParserConstants.FALLBACK /* 58 */:
                            if (this.curChar == 'g') {
                                int[] iArr11 = this.jjstateSet;
                                int i13 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i13 + 1;
                                iArr11[i13] = 57;
                                break;
                            }
                            break;
                        case FMParserConstants.NOESCAPE /* 61 */:
                            if (this.curChar == 't') {
                                int[] iArr12 = this.jjstateSet;
                                int i14 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i14 + 1;
                                iArr12[i14] = 60;
                                break;
                            }
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            if (this.curChar == 'l') {
                                int[] iArr13 = this.jjstateSet;
                                int i15 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i15 + 1;
                                iArr13[i15] = 61;
                                break;
                            }
                            break;
                        case 64:
                            if (this.curChar == 't') {
                                int[] iArr14 = this.jjstateSet;
                                int i16 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i16 + 1;
                                iArr14[i16] = 63;
                                break;
                            }
                            break;
                        case FMParserConstants.FTL_HEADER /* 65 */:
                            if (this.curChar == 'l') {
                                int[] iArr15 = this.jjstateSet;
                                int i17 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i17 + 1;
                                iArr15[i17] = 64;
                                break;
                            }
                            break;
                        case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                            if (this.curChar == 't') {
                                int[] iArr16 = this.jjstateSet;
                                int i18 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i18 + 1;
                                iArr16[i18] = 66;
                                break;
                            }
                            break;
                        case FMParserConstants.WHITESPACE /* 68 */:
                            if (this.curChar == 'g') {
                                int[] iArr17 = this.jjstateSet;
                                int i19 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i19 + 1;
                                iArr17[i19] = 67;
                                break;
                            }
                            break;
                        case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                            if (this.curChar == 't') {
                                int[] iArr18 = this.jjstateSet;
                                int i20 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i20 + 1;
                                iArr18[i20] = 70;
                                break;
                            }
                            break;
                        case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                            if (this.curChar == 'g') {
                                int[] iArr19 = this.jjstateSet;
                                int i21 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i21 + 1;
                                iArr19[i21] = 71;
                                break;
                            }
                            break;
                        case 74:
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(54, 75);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if (jjCanMove_1(hiByte, i1, i22, l1, l22)) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case 6:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(306, 307);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(308, 309);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i23 = this.jjnewStateCnt;
            i = i23;
            int i24 = startsAt;
            this.jjnewStateCnt = i24;
            int i25 = 76 - i24;
            startsAt = i25;
            if (i23 == i25) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_3(int pos, long active0, long active1, long active2) {
        switch (pos) {
            case 0:
                if ((active1 & 140737488355328L) != 0) {
                    return 2;
                }
                if ((active1 & 63050394784759808L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    return 34;
                }
                return -1;
            case 1:
                if ((active1 & 27021597764222976L) != 0) {
                    return 34;
                }
                if ((active1 & 36028797020536832L) != 0) {
                    if (this.jjmatchedPos != 1) {
                        this.jjmatchedKind = FMParserConstants.ID;
                        this.jjmatchedPos = 1;
                        return 34;
                    }
                    return 34;
                }
                return -1;
            case 2:
                if ((active1 & 36028797020536832L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 2;
                    return 34;
                }
                return -1;
            case 3:
                if ((active1 & 1048576) != 0) {
                    return 34;
                }
                if ((active1 & 36028797019488256L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 3;
                    return 34;
                }
                return -1;
            default:
                return -1;
        }
    }

    private final int jjStartNfa_3(int pos, long active0, long active1, long active2) {
        return jjMoveNfa_3(jjStopStringLiteralDfa_3(pos, active0, active1, active2), pos + 1);
    }

    private final int jjStartNfaWithStates_3(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_3(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_3() {
        switch (this.curChar) {
            case FMParserConstants.END_RECOVER /* 33 */:
                this.jjmatchedKind = FMParserConstants.EXCLAM;
                return jjMoveStringLiteralDfa1_3(536870912L);
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.FLUSH /* 48 */:
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case '@':
            case FMParserConstants.FTL_HEADER /* 65 */:
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case FMParserConstants.ESCAPED_CHAR /* 80 */:
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            case FMParserConstants.ID /* 120 */:
            case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
            case FMParserConstants.LETTER /* 122 */:
            case FMParserConstants.DIRECTIVE_END /* 124 */:
            default:
                return jjMoveNfa_3(1, 0);
            case FMParserConstants.END_GLOBAL /* 37 */:
                return jjStopAtPos(0, FMParserConstants.PERCENT);
            case FMParserConstants.END_MACRO /* 40 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_PAREN);
            case FMParserConstants.END_COMPRESS /* 41 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_PAREN);
            case FMParserConstants.END_TRANSFORM /* 42 */:
                this.jjmatchedKind = 100;
                return jjMoveStringLiteralDfa1_3(137438953472L);
            case FMParserConstants.END_SWITCH /* 43 */:
                return jjStopAtPos(0, 98);
            case FMParserConstants.ELSE /* 44 */:
                return jjStopAtPos(0, FMParserConstants.COMMA);
            case FMParserConstants.BREAK /* 45 */:
                return jjStopAtPos(0, 99);
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                this.jjmatchedKind = 87;
                return jjMoveStringLiteralDfa1_3(274894684160L);
            case FMParserConstants.HALT /* 47 */:
                return jjStopAtPos(0, FMParserConstants.DIVIDE);
            case FMParserConstants.FALLBACK /* 58 */:
                return jjStopAtPos(0, FMParserConstants.COLON);
            case FMParserConstants.ESCAPE /* 59 */:
                return jjStopAtPos(0, FMParserConstants.SEMICOLON);
            case FMParserConstants.NOESCAPE /* 61 */:
                this.jjmatchedKind = 91;
                return jjMoveStringLiteralDfa1_3(268435456L);
            case FMParserConstants.END_NOESCAPE /* 62 */:
                this.jjmatchedKind = FMParserConstants.NATURAL_GT;
                return jjMoveStringLiteralDfa1_3(Long.MIN_VALUE);
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                this.jjmatchedKind = 89;
                return jjMoveStringLiteralDfa1_3(67108864L);
            case FMParserConstants.EQUALS /* 91 */:
                return jjStartNfaWithStates_3(0, FMParserConstants.OPEN_BRACKET, 2);
            case FMParserConstants.NOT_EQUALS /* 93 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACKET);
            case FMParserConstants.ESCAPED_GTE /* 97 */:
                return jjMoveStringLiteralDfa1_3(18014398509481984L);
            case FMParserConstants.ELLIPSIS /* 102 */:
                return jjMoveStringLiteralDfa1_3(524288L);
            case FMParserConstants.AND /* 105 */:
                return jjMoveStringLiteralDfa1_3(9007199254740992L);
            case FMParserConstants.CLOSE_BRACE /* 116 */:
                return jjMoveStringLiteralDfa1_3(1048576L);
            case FMParserConstants.IN /* 117 */:
                return jjMoveStringLiteralDfa1_3(36028797018963968L);
            case FMParserConstants.DIGIT /* 123 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_BRACE);
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACE);
        }
    }

    private final int jjMoveStringLiteralDfa1_3(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.END_TRANSFORM /* 42 */:
                    if ((active1 & 137438953472L) != 0) {
                        return jjStopAtPos(1, FMParserConstants.DOUBLE_STAR);
                    }
                    break;
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active1 & 16777216) != 0) {
                        this.jjmatchedKind = 88;
                        this.jjmatchedPos = 1;
                    }
                    return jjMoveStringLiteralDfa2_3(active1, 274877906944L);
                case FMParserConstants.NOESCAPE /* 61 */:
                    if ((active1 & 268435456) != 0) {
                        return jjStopAtPos(1, 92);
                    }
                    if ((active1 & 536870912) != 0) {
                        return jjStopAtPos(1, 93);
                    }
                    if ((active1 & Long.MIN_VALUE) != 0) {
                        return jjStopAtPos(1, FMParserConstants.NATURAL_GTE);
                    }
                    break;
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                    if ((active1 & 67108864) != 0) {
                        return jjStopAtPos(1, 90);
                    }
                    break;
                case FMParserConstants.ESCAPED_GTE /* 97 */:
                    return jjMoveStringLiteralDfa2_3(active1, 524288L);
                case FMParserConstants.COLON /* 110 */:
                    if ((active1 & 9007199254740992L) != 0) {
                        return jjStartNfaWithStates_3(1, FMParserConstants.IN, 34);
                    }
                    break;
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    return jjMoveStringLiteralDfa2_3(active1, 1048576L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    if ((active1 & 18014398509481984L) != 0) {
                        return jjStartNfaWithStates_3(1, FMParserConstants.AS, 34);
                    }
                    return jjMoveStringLiteralDfa2_3(active1, 36028797018963968L);
            }
            return jjStartNfa_3(0, 0L, active1, 0L);
        } catch (IOException e) {
            jjStopStringLiteralDfa_3(0, 0L, active1, 0L);
            return 1;
        }
    }

    private final int jjMoveStringLiteralDfa2_3(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_3(0, 0L, old1, 0L);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active12 & 274877906944L) != 0) {
                        return jjStopAtPos(2, FMParserConstants.ELLIPSIS);
                    }
                    break;
                case FMParserConstants.AND /* 105 */:
                    return jjMoveStringLiteralDfa3_3(active12, 36028797018963968L);
                case FMParserConstants.COMMA /* 108 */:
                    return jjMoveStringLiteralDfa3_3(active12, 524288L);
                case FMParserConstants.IN /* 117 */:
                    return jjMoveStringLiteralDfa3_3(active12, 1048576L);
            }
            return jjStartNfa_3(1, 0L, active12, 0L);
        } catch (IOException e) {
            jjStopStringLiteralDfa_3(1, 0L, active12, 0L);
            return 2;
        }
    }

    private final int jjMoveStringLiteralDfa3_3(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_3(1, 0L, old1, 0L);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 1048576) != 0) {
                        return jjStartNfaWithStates_3(3, 84, 34);
                    }
                    break;
                case FMParserConstants.COLON /* 110 */:
                    return jjMoveStringLiteralDfa4_3(active12, 36028797018963968L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    return jjMoveStringLiteralDfa4_3(active12, 524288L);
            }
            return jjStartNfa_3(2, 0L, active12, 0L);
        } catch (IOException e) {
            jjStopStringLiteralDfa_3(2, 0L, active12, 0L);
            return 3;
        }
    }

    private final int jjMoveStringLiteralDfa4_3(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_3(2, 0L, old1, 0L);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 524288) != 0) {
                        return jjStartNfaWithStates_3(4, 83, 34);
                    }
                    break;
                case FMParserConstants.DIVIDE /* 103 */:
                    if ((active12 & 36028797018963968L) != 0) {
                        return jjStartNfaWithStates_3(4, FMParserConstants.USING, 34);
                    }
                    break;
            }
            return jjStartNfa_3(3, 0L, active12, 0L);
        } catch (IOException e) {
            jjStopStringLiteralDfa_3(3, 0L, active12, 0L);
            return 4;
        }
    }

    private final int jjMoveNfa_3(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 73;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(310, 312);
                            } else if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                            } else if (this.curChar == '&') {
                                jjAddStates(313, 317);
                            } else if (this.curChar == '#' || this.curChar == '$') {
                                jjCheckNAdd(35);
                            } else if (this.curChar == '<') {
                                jjCheckNAdd(27);
                            } else if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                            } else if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                            }
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '&') {
                                if (kind > 105) {
                                    kind = 105;
                                }
                            } else if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                            }
                            if (this.curChar == '<') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 2;
                                break;
                            }
                            break;
                        case 2:
                            if ((42949672960L & l) != 0) {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 4;
                                break;
                            }
                            break;
                        case 3:
                            if (this.curChar == '-' && kind > 74) {
                                kind = 74;
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == '-') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 3;
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 6:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 8:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == '\"' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case 16:
                            if (this.curChar == '\'' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.MACRO /* 20 */:
                            if (this.curChar == '\"') {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.VISIT /* 22 */:
                            if (this.curChar == '\"' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.STOP /* 23 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.CALL /* 25 */:
                            if (this.curChar == '\'' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.SETTING /* 26 */:
                            if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.COMPRESS /* 27 */:
                            if (this.curChar == '=' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                            if (this.curChar == '<') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                        case FMParserConstants.FALSE_ALERT /* 70 */:
                            if (this.curChar == '&' && kind > 105) {
                                kind = 105;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((287948969894477824L & l) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_LOCAL /* 36 */:
                            if (this.curChar == '$') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_GLOBAL /* 37 */:
                            if (this.curChar == '#') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(310, 312);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAdd(39);
                                break;
                            }
                            break;
                        case FMParserConstants.END_MACRO /* 40 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddTwoStates(40, 41);
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if (this.curChar == '.') {
                                jjCheckNAdd(42);
                                break;
                            }
                            break;
                        case FMParserConstants.END_TRANSFORM /* 42 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 86) {
                                    kind = 86;
                                }
                                jjCheckNAdd(42);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                            if (this.curChar == '&') {
                                jjAddStates(313, 317);
                                break;
                            }
                            break;
                        case FMParserConstants.RECURSE /* 57 */:
                            if (this.curChar == ';' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            if (this.curChar == ';') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.UNIFIED_CALL /* 63 */:
                            if (this.curChar == ';' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                            if (this.curChar == '=' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                            if (this.curChar == ';') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 66;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '\\') {
                                jjAddStates(318, 321);
                            } else if (this.curChar == '|') {
                                int[] iArr5 = this.jjstateSet;
                                int i7 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i7 + 1;
                                iArr5[i7] = 31;
                            } else if (this.curChar == '[') {
                                int[] iArr6 = this.jjstateSet;
                                int i8 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i8 + 1;
                                iArr6[i8] = 2;
                            }
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(51, 72);
                                break;
                            } else if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(44, 46);
                                break;
                            } else if (this.curChar == '|') {
                                if (kind > 106) {
                                    kind = 106;
                                    break;
                                }
                            } else if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case 6:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == '\\') {
                                jjAddStates(302, 303);
                                break;
                            }
                            break;
                        case 8:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if (this.curChar == 'x') {
                                int[] iArr7 = this.jjstateSet;
                                int i9 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i9 + 1;
                                iArr7[i9] = 11;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            if (this.curChar == '\\') {
                                jjAddStates(304, 305);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants._INCLUDE /* 17 */:
                            if (this.curChar == 'x') {
                                int[] iArr8 = this.jjstateSet;
                                int i10 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i10 + 1;
                                iArr8[i10] = 18;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            jjAddStates(306, 307);
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            jjAddStates(308, 309);
                            break;
                        case FMParserConstants.NOPARSE /* 30 */:
                        case FMParserConstants.END_IF /* 31 */:
                            if (this.curChar == '|' && kind > 106) {
                                kind = 106;
                                break;
                            }
                            break;
                        case 32:
                            if (this.curChar == '|') {
                                int[] iArr9 = this.jjstateSet;
                                int i11 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i11 + 1;
                                iArr9[i11] = 31;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == '{' && kind > 121) {
                                kind = 121;
                                break;
                            }
                            break;
                        case FMParserConstants.END_SWITCH /* 43 */:
                            if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(44, 46);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE /* 44 */:
                            if (this.curChar == 't' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.BREAK /* 45 */:
                            if (this.curChar == 'e' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RETURN /* 46 */:
                        case FMParserConstants.TRIM /* 49 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(45);
                                break;
                            }
                            break;
                        case FMParserConstants.HALT /* 47 */:
                            if (this.curChar == '\\') {
                                jjAddStates(318, 321);
                                break;
                            }
                            break;
                        case FMParserConstants.FLUSH /* 48 */:
                            if (this.curChar == 'l') {
                                jjCheckNAdd(44);
                                break;
                            }
                            break;
                        case FMParserConstants.LTRIM /* 50 */:
                            if (this.curChar == 'l') {
                                int[] iArr10 = this.jjstateSet;
                                int i12 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i12 + 1;
                                iArr10[i12] = 49;
                                break;
                            }
                            break;
                        case FMParserConstants.RTRIM /* 51 */:
                            if (this.curChar == 't' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.NOTRIM /* 52 */:
                            if (this.curChar == 'g') {
                                jjCheckNAdd(51);
                                break;
                            }
                            break;
                        case FMParserConstants.DEFAUL /* 53 */:
                            if (this.curChar == 'e' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_NESTED /* 54 */:
                        case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(53);
                                break;
                            }
                            break;
                        case FMParserConstants.NESTED /* 55 */:
                            if (this.curChar == 'g') {
                                int[] iArr11 = this.jjstateSet;
                                int i13 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i13 + 1;
                                iArr11[i13] = 54;
                                break;
                            }
                            break;
                        case FMParserConstants.FALLBACK /* 58 */:
                            if (this.curChar == 't') {
                                int[] iArr12 = this.jjstateSet;
                                int i14 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i14 + 1;
                                iArr12[i14] = 57;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPE /* 59 */:
                            if (this.curChar == 'l') {
                                int[] iArr13 = this.jjstateSet;
                                int i15 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i15 + 1;
                                iArr13[i15] = 58;
                                break;
                            }
                            break;
                        case FMParserConstants.NOESCAPE /* 61 */:
                            if (this.curChar == 't') {
                                int[] iArr14 = this.jjstateSet;
                                int i16 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i16 + 1;
                                iArr14[i16] = 60;
                                break;
                            }
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            if (this.curChar == 'l') {
                                int[] iArr15 = this.jjstateSet;
                                int i17 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i17 + 1;
                                iArr15[i17] = 61;
                                break;
                            }
                            break;
                        case 64:
                            if (this.curChar == 't') {
                                int[] iArr16 = this.jjstateSet;
                                int i18 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i18 + 1;
                                iArr16[i18] = 63;
                                break;
                            }
                            break;
                        case FMParserConstants.FTL_HEADER /* 65 */:
                            if (this.curChar == 'g') {
                                int[] iArr17 = this.jjstateSet;
                                int i19 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i19 + 1;
                                iArr17[i19] = 64;
                                break;
                            }
                            break;
                        case FMParserConstants.WHITESPACE /* 68 */:
                            if (this.curChar == 't') {
                                int[] iArr18 = this.jjstateSet;
                                int i20 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i20 + 1;
                                iArr18[i20] = 67;
                                break;
                            }
                            break;
                        case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                            if (this.curChar == 'g') {
                                int[] iArr19 = this.jjstateSet;
                                int i21 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i21 + 1;
                                iArr19[i21] = 68;
                                break;
                            }
                            break;
                        case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(51, 72);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if (jjCanMove_1(hiByte, i1, i22, l1, l22)) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case 6:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(306, 307);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(308, 309);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i23 = this.jjnewStateCnt;
            i = i23;
            int i24 = startsAt;
            this.jjnewStateCnt = i24;
            int i25 = 73 - i24;
            startsAt = i25;
            if (i23 == i25) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:3:0x0001. Please report as an issue. */
    private final int jjStopStringLiteralDfa_5(int pos, long active0, long active1) {
        switch (pos) {
        }
        return -1;
    }

    private final int jjStartNfa_5(int pos, long active0, long active1) {
        return jjMoveNfa_5(jjStopStringLiteralDfa_5(pos, active0, active1), pos + 1);
    }

    private final int jjStartNfaWithStates_5(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_5(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_5() {
        switch (this.curChar) {
            case FMParserConstants.BREAK /* 45 */:
                return jjStartNfaWithStates_5(0, 78, 3);
            default:
                return jjMoveNfa_5(1, 0);
        }
    }

    private final int jjMoveNfa_5(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 6;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if (((-4611721202799476737L) & l) != 0) {
                                kind = 75;
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if (((-4611721202799476737L) & l) != 0) {
                                if (kind > 75) {
                                    kind = 75;
                                }
                                jjCheckNAdd(0);
                                break;
                            } else if (this.curChar == '-') {
                                jjAddStates(322, 323);
                                break;
                            }
                            break;
                        case 2:
                            if (this.curChar == '>') {
                                kind = 79;
                                break;
                            }
                            break;
                        case 3:
                            if (this.curChar == '-') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 4;
                            }
                            if (this.curChar == '-') {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 2;
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == '-') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 4;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                        case 1:
                            if (((-536870913) & l2) != 0) {
                                kind = 75;
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == ']') {
                                kind = 79;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                        case 1:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                if (kind > 75) {
                                    kind = 75;
                                }
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i6 = this.jjnewStateCnt;
            i = i6;
            int i7 = startsAt;
            this.jjnewStateCnt = i7;
            int i8 = 6 - i7;
            startsAt = i8;
            if (i6 == i8) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_6(int pos, long active0, long active1) {
        switch (pos) {
            case 0:
                if ((active1 & 549755813888L) != 0) {
                    return 35;
                }
                if ((active1 & 63050394784759808L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    return 29;
                }
                return -1;
            case 1:
                if ((active1 & 36028797020536832L) == 0) {
                    if ((active1 & 27021597764222976L) != 0) {
                        return 29;
                    }
                    return -1;
                }
                if (this.jjmatchedPos != 1) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 1;
                    return 29;
                }
                return 29;
            case 2:
                if ((active1 & 36028797020536832L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 2;
                    return 29;
                }
                return -1;
            case 3:
                if ((active1 & 1048576) != 0) {
                    return 29;
                }
                if ((active1 & 36028797019488256L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 3;
                    return 29;
                }
                return -1;
            default:
                return -1;
        }
    }

    private final int jjStartNfa_6(int pos, long active0, long active1) {
        return jjMoveNfa_6(jjStopStringLiteralDfa_6(pos, active0, active1), pos + 1);
    }

    private final int jjStartNfaWithStates_6(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_6(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_6() {
        switch (this.curChar) {
            case FMParserConstants.END_RECOVER /* 33 */:
                this.jjmatchedKind = FMParserConstants.EXCLAM;
                return jjMoveStringLiteralDfa1_6(536870912L);
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.FLUSH /* 48 */:
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case '@':
            case FMParserConstants.FTL_HEADER /* 65 */:
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case FMParserConstants.ESCAPED_CHAR /* 80 */:
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            case FMParserConstants.ID /* 120 */:
            case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
            case FMParserConstants.LETTER /* 122 */:
            case FMParserConstants.DIRECTIVE_END /* 124 */:
            default:
                return jjMoveNfa_6(0, 0);
            case FMParserConstants.END_GLOBAL /* 37 */:
                return jjStopAtPos(0, FMParserConstants.PERCENT);
            case FMParserConstants.END_MACRO /* 40 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_PAREN);
            case FMParserConstants.END_COMPRESS /* 41 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_PAREN);
            case FMParserConstants.END_TRANSFORM /* 42 */:
                this.jjmatchedKind = 100;
                return jjMoveStringLiteralDfa1_6(137438953472L);
            case FMParserConstants.END_SWITCH /* 43 */:
                return jjStopAtPos(0, 98);
            case FMParserConstants.ELSE /* 44 */:
                return jjStopAtPos(0, FMParserConstants.COMMA);
            case FMParserConstants.BREAK /* 45 */:
                return jjStopAtPos(0, 99);
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                this.jjmatchedKind = 87;
                return jjMoveStringLiteralDfa1_6(274894684160L);
            case FMParserConstants.HALT /* 47 */:
                return jjStartNfaWithStates_6(0, FMParserConstants.DIVIDE, 35);
            case FMParserConstants.FALLBACK /* 58 */:
                return jjStopAtPos(0, FMParserConstants.COLON);
            case FMParserConstants.ESCAPE /* 59 */:
                return jjStopAtPos(0, FMParserConstants.SEMICOLON);
            case FMParserConstants.NOESCAPE /* 61 */:
                this.jjmatchedKind = 91;
                return jjMoveStringLiteralDfa1_6(268435456L);
            case FMParserConstants.END_NOESCAPE /* 62 */:
                return jjStopAtPos(0, FMParserConstants.DIRECTIVE_END);
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                this.jjmatchedKind = 89;
                return jjMoveStringLiteralDfa1_6(67108864L);
            case FMParserConstants.EQUALS /* 91 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_BRACKET);
            case FMParserConstants.NOT_EQUALS /* 93 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACKET);
            case FMParserConstants.ESCAPED_GTE /* 97 */:
                return jjMoveStringLiteralDfa1_6(18014398509481984L);
            case FMParserConstants.ELLIPSIS /* 102 */:
                return jjMoveStringLiteralDfa1_6(524288L);
            case FMParserConstants.AND /* 105 */:
                return jjMoveStringLiteralDfa1_6(9007199254740992L);
            case FMParserConstants.CLOSE_BRACE /* 116 */:
                return jjMoveStringLiteralDfa1_6(1048576L);
            case FMParserConstants.IN /* 117 */:
                return jjMoveStringLiteralDfa1_6(36028797018963968L);
            case FMParserConstants.DIGIT /* 123 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_BRACE);
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACE);
        }
    }

    private final int jjMoveStringLiteralDfa1_6(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.END_TRANSFORM /* 42 */:
                    if ((active1 & 137438953472L) != 0) {
                        return jjStopAtPos(1, FMParserConstants.DOUBLE_STAR);
                    }
                    break;
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active1 & 16777216) != 0) {
                        this.jjmatchedKind = 88;
                        this.jjmatchedPos = 1;
                    }
                    return jjMoveStringLiteralDfa2_6(active1, 274877906944L);
                case FMParserConstants.NOESCAPE /* 61 */:
                    if ((active1 & 268435456) != 0) {
                        return jjStopAtPos(1, 92);
                    }
                    if ((active1 & 536870912) != 0) {
                        return jjStopAtPos(1, 93);
                    }
                    break;
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                    if ((active1 & 67108864) != 0) {
                        return jjStopAtPos(1, 90);
                    }
                    break;
                case FMParserConstants.ESCAPED_GTE /* 97 */:
                    return jjMoveStringLiteralDfa2_6(active1, 524288L);
                case FMParserConstants.COLON /* 110 */:
                    if ((active1 & 9007199254740992L) != 0) {
                        return jjStartNfaWithStates_6(1, FMParserConstants.IN, 29);
                    }
                    break;
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    return jjMoveStringLiteralDfa2_6(active1, 1048576L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    if ((active1 & 18014398509481984L) != 0) {
                        return jjStartNfaWithStates_6(1, FMParserConstants.AS, 29);
                    }
                    return jjMoveStringLiteralDfa2_6(active1, 36028797018963968L);
            }
            return jjStartNfa_6(0, 0L, active1);
        } catch (IOException e) {
            jjStopStringLiteralDfa_6(0, 0L, active1);
            return 1;
        }
    }

    private final int jjMoveStringLiteralDfa2_6(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_6(0, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active12 & 274877906944L) != 0) {
                        return jjStopAtPos(2, FMParserConstants.ELLIPSIS);
                    }
                    break;
                case FMParserConstants.AND /* 105 */:
                    return jjMoveStringLiteralDfa3_6(active12, 36028797018963968L);
                case FMParserConstants.COMMA /* 108 */:
                    return jjMoveStringLiteralDfa3_6(active12, 524288L);
                case FMParserConstants.IN /* 117 */:
                    return jjMoveStringLiteralDfa3_6(active12, 1048576L);
            }
            return jjStartNfa_6(1, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_6(1, 0L, active12);
            return 2;
        }
    }

    private final int jjMoveStringLiteralDfa3_6(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_6(1, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 1048576) != 0) {
                        return jjStartNfaWithStates_6(3, 84, 29);
                    }
                    break;
                case FMParserConstants.COLON /* 110 */:
                    return jjMoveStringLiteralDfa4_6(active12, 36028797018963968L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    return jjMoveStringLiteralDfa4_6(active12, 524288L);
            }
            return jjStartNfa_6(2, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_6(2, 0L, active12);
            return 3;
        }
    }

    private final int jjMoveStringLiteralDfa4_6(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_6(2, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 524288) != 0) {
                        return jjStartNfaWithStates_6(4, 83, 29);
                    }
                    break;
                case FMParserConstants.DIVIDE /* 103 */:
                    if ((active12 & 36028797018963968L) != 0) {
                        return jjStartNfaWithStates_6(4, FMParserConstants.USING, 29);
                    }
                    break;
            }
            return jjStartNfa_6(3, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_6(3, 0L, active12);
            return 4;
        }
    }

    private final int jjMoveNfa_6(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 72;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(324, 326);
                            } else if ((4294977024L & l) != 0) {
                                if (kind > 128) {
                                    kind = 128;
                                }
                                jjCheckNAdd(33);
                            } else if (this.curChar == '&') {
                                jjAddStates(327, 331);
                            } else if (this.curChar == '/') {
                                jjAddStates(332, 333);
                            } else if (this.curChar == '#' || this.curChar == '$') {
                                jjCheckNAdd(30);
                            } else if (this.curChar == '<') {
                                jjCheckNAdd(22);
                            } else if (this.curChar == '\'') {
                                jjCheckNAddStates(334, 336);
                            } else if (this.curChar == '\"') {
                                jjCheckNAddStates(337, 339);
                            }
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                                break;
                            } else if (this.curChar == '&') {
                                if (kind > 105) {
                                    kind = 105;
                                    break;
                                }
                            } else if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case 1:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 3:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == '\"' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case 6:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == '\'') {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case 8:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if (this.curChar == '\'' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if (this.curChar == '\"') {
                                jjCheckNAddTwoStates(16, 17);
                                break;
                            }
                            break;
                        case 16:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddTwoStates(16, 17);
                                break;
                            }
                            break;
                        case FMParserConstants._INCLUDE /* 17 */:
                            if (this.curChar == '\"' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddTwoStates(19, 20);
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddTwoStates(19, 20);
                                break;
                            }
                            break;
                        case FMParserConstants.MACRO /* 20 */:
                            if (this.curChar == '\'' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.VISIT /* 22 */:
                            if (this.curChar == '=' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.STOP /* 23 */:
                            if (this.curChar == '<') {
                                jjCheckNAdd(22);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                        case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                            if (this.curChar == '&' && kind > 105) {
                                kind = 105;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                            if ((287948969894477824L & l) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                                break;
                            }
                            break;
                        case FMParserConstants.END_IF /* 31 */:
                            if (this.curChar == '$') {
                                jjCheckNAdd(30);
                                break;
                            }
                            break;
                        case 32:
                            if (this.curChar == '#') {
                                jjCheckNAdd(30);
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                            if ((4294977024L & l) != 0) {
                                if (kind > 128) {
                                    kind = 128;
                                }
                                jjCheckNAdd(33);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if (this.curChar == '/') {
                                jjAddStates(332, 333);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == '>' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.END_GLOBAL /* 37 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(324, 326);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAdd(38);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddTwoStates(39, 40);
                                break;
                            }
                            break;
                        case FMParserConstants.END_MACRO /* 40 */:
                            if (this.curChar == '.') {
                                jjCheckNAdd(41);
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 86) {
                                    kind = 86;
                                }
                                jjCheckNAdd(41);
                                break;
                            }
                            break;
                        case FMParserConstants.NESTED /* 55 */:
                            if (this.curChar == '&') {
                                jjAddStates(327, 331);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                            if (this.curChar == ';' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPE /* 59 */:
                            if (this.curChar == ';') {
                                jjCheckNAdd(22);
                                break;
                            }
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            if (this.curChar == ';' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.FTL_HEADER /* 65 */:
                            if (this.curChar == '=' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                            if (this.curChar == ';') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 65;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                            } else if (this.curChar == '\\') {
                                jjAddStates(340, 343);
                            } else if (this.curChar == '|') {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 26;
                            }
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(50, 71);
                                break;
                            } else if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(43, 45);
                                break;
                            } else if (this.curChar == '|') {
                                if (kind > 106) {
                                    kind = 106;
                                    break;
                                }
                            } else if (this.curChar == 'r') {
                                jjAddStates(344, 345);
                                break;
                            }
                            break;
                        case 1:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 2:
                            if (this.curChar == '\\') {
                                jjAddStates(322, 323);
                                break;
                            }
                            break;
                        case 3:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == 'x') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 6;
                                break;
                            }
                            break;
                        case 6:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(337, 339);
                                break;
                            }
                            break;
                        case 8:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == '\\') {
                                jjAddStates(0, 1);
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == 'x') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 13;
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(334, 336);
                                break;
                            }
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            if (this.curChar == 'r') {
                                jjAddStates(344, 345);
                                break;
                            }
                            break;
                        case 16:
                            jjAddStates(346, 347);
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            jjAddStates(348, 349);
                            break;
                        case FMParserConstants.CALL /* 25 */:
                        case FMParserConstants.SETTING /* 26 */:
                            if (this.curChar == '|' && kind > 106) {
                                kind = 106;
                                break;
                            }
                            break;
                        case FMParserConstants.COMPRESS /* 27 */:
                            if (this.curChar == '|') {
                                int[] iArr5 = this.jjstateSet;
                                int i7 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i7 + 1;
                                iArr5[i7] = 26;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                                break;
                            }
                            break;
                        case FMParserConstants.NOPARSE /* 30 */:
                            if (this.curChar == '{' && kind > 121) {
                                kind = 121;
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == ']' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.END_TRANSFORM /* 42 */:
                            if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(43, 45);
                                break;
                            }
                            break;
                        case FMParserConstants.END_SWITCH /* 43 */:
                            if (this.curChar == 't' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE /* 44 */:
                            if (this.curChar == 'e' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.BREAK /* 45 */:
                        case FMParserConstants.FLUSH /* 48 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(44);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RETURN /* 46 */:
                            if (this.curChar == '\\') {
                                jjAddStates(340, 343);
                                break;
                            }
                            break;
                        case FMParserConstants.HALT /* 47 */:
                            if (this.curChar == 'l') {
                                jjCheckNAdd(43);
                                break;
                            }
                            break;
                        case FMParserConstants.TRIM /* 49 */:
                            if (this.curChar == 'l') {
                                int[] iArr6 = this.jjstateSet;
                                int i8 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i8 + 1;
                                iArr6[i8] = 48;
                                break;
                            }
                            break;
                        case FMParserConstants.LTRIM /* 50 */:
                            if (this.curChar == 't' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.RTRIM /* 51 */:
                            if (this.curChar == 'g') {
                                jjCheckNAdd(50);
                                break;
                            }
                            break;
                        case FMParserConstants.NOTRIM /* 52 */:
                            if (this.curChar == 'e' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.DEFAUL /* 53 */:
                        case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(52);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_NESTED /* 54 */:
                            if (this.curChar == 'g') {
                                int[] iArr7 = this.jjstateSet;
                                int i9 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i9 + 1;
                                iArr7[i9] = 53;
                                break;
                            }
                            break;
                        case FMParserConstants.RECURSE /* 57 */:
                            if (this.curChar == 't') {
                                int[] iArr8 = this.jjstateSet;
                                int i10 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i10 + 1;
                                iArr8[i10] = 56;
                                break;
                            }
                            break;
                        case FMParserConstants.FALLBACK /* 58 */:
                            if (this.curChar == 'l') {
                                int[] iArr9 = this.jjstateSet;
                                int i11 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i11 + 1;
                                iArr9[i11] = 57;
                                break;
                            }
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            if (this.curChar == 't') {
                                int[] iArr10 = this.jjstateSet;
                                int i12 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i12 + 1;
                                iArr10[i12] = 59;
                                break;
                            }
                            break;
                        case FMParserConstants.NOESCAPE /* 61 */:
                            if (this.curChar == 'l') {
                                int[] iArr11 = this.jjstateSet;
                                int i13 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i13 + 1;
                                iArr11[i13] = 60;
                                break;
                            }
                            break;
                        case FMParserConstants.UNIFIED_CALL /* 63 */:
                            if (this.curChar == 't') {
                                int[] iArr12 = this.jjstateSet;
                                int i14 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i14 + 1;
                                iArr12[i14] = 62;
                                break;
                            }
                            break;
                        case 64:
                            if (this.curChar == 'g') {
                                int[] iArr13 = this.jjstateSet;
                                int i15 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i15 + 1;
                                iArr13[i15] = 63;
                                break;
                            }
                            break;
                        case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                            if (this.curChar == 't') {
                                int[] iArr14 = this.jjstateSet;
                                int i16 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i16 + 1;
                                iArr14[i16] = 66;
                                break;
                            }
                            break;
                        case FMParserConstants.WHITESPACE /* 68 */:
                            if (this.curChar == 'g') {
                                int[] iArr15 = this.jjstateSet;
                                int i17 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i17 + 1;
                                iArr15[i17] = 67;
                                break;
                            }
                            break;
                        case FMParserConstants.FALSE_ALERT /* 70 */:
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(50, 71);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                            if (jjCanMove_1(hiByte, i1, i22, l1, l22)) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(29);
                                break;
                            }
                            break;
                        case 1:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(337, 339);
                                break;
                            }
                            break;
                        case 8:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(334, 336);
                                break;
                            }
                            break;
                        case 16:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(346, 347);
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(348, 349);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i18 = this.jjnewStateCnt;
            i = i18;
            int i19 = startsAt;
            this.jjnewStateCnt = i19;
            int i20 = 72 - i19;
            startsAt = i20;
            if (i18 == i20) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private final int jjStopStringLiteralDfa_4(int pos, long active0, long active1) {
        switch (pos) {
            case 0:
                if ((active1 & 140737488355328L) != 0) {
                    return 2;
                }
                if ((active1 & 63050394784759808L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    return 34;
                }
                if ((active1 & 8796629893120L) != 0) {
                    return 39;
                }
                if ((active1 & 549755813888L) != 0) {
                    return 41;
                }
                return -1;
            case 1:
                if ((active1 & 27021597764222976L) != 0) {
                    return 34;
                }
                if ((active1 & 36028797020536832L) != 0) {
                    if (this.jjmatchedPos != 1) {
                        this.jjmatchedKind = FMParserConstants.ID;
                        this.jjmatchedPos = 1;
                        return 34;
                    }
                    return 34;
                }
                return -1;
            case 2:
                if ((active1 & 36028797020536832L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 2;
                    return 34;
                }
                return -1;
            case 3:
                if ((active1 & 1048576) != 0) {
                    return 34;
                }
                if ((active1 & 36028797019488256L) != 0) {
                    this.jjmatchedKind = FMParserConstants.ID;
                    this.jjmatchedPos = 3;
                    return 34;
                }
                return -1;
            default:
                return -1;
        }
    }

    private final int jjStartNfa_4(int pos, long active0, long active1) {
        return jjMoveNfa_4(jjStopStringLiteralDfa_4(pos, active0, active1), pos + 1);
    }

    private final int jjStartNfaWithStates_4(int pos, int kind, int state) {
        this.jjmatchedKind = kind;
        this.jjmatchedPos = pos;
        try {
            this.curChar = this.input_stream.readChar();
            return jjMoveNfa_4(state, pos + 1);
        } catch (IOException e) {
            return pos + 1;
        }
    }

    private final int jjMoveStringLiteralDfa0_4() {
        switch (this.curChar) {
            case FMParserConstants.END_RECOVER /* 33 */:
                this.jjmatchedKind = FMParserConstants.EXCLAM;
                return jjMoveStringLiteralDfa1_4(536870912L);
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.FLUSH /* 48 */:
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case '@':
            case FMParserConstants.FTL_HEADER /* 65 */:
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case FMParserConstants.ESCAPED_CHAR /* 80 */:
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            case FMParserConstants.ID /* 120 */:
            case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
            case FMParserConstants.LETTER /* 122 */:
            case FMParserConstants.DIRECTIVE_END /* 124 */:
            default:
                return jjMoveNfa_4(1, 0);
            case FMParserConstants.END_GLOBAL /* 37 */:
                return jjStopAtPos(0, FMParserConstants.PERCENT);
            case FMParserConstants.END_MACRO /* 40 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_PAREN);
            case FMParserConstants.END_COMPRESS /* 41 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_PAREN);
            case FMParserConstants.END_TRANSFORM /* 42 */:
                this.jjmatchedKind = 100;
                return jjMoveStringLiteralDfa1_4(137438953472L);
            case FMParserConstants.END_SWITCH /* 43 */:
                return jjStopAtPos(0, 98);
            case FMParserConstants.ELSE /* 44 */:
                return jjStopAtPos(0, FMParserConstants.COMMA);
            case FMParserConstants.BREAK /* 45 */:
                return jjStopAtPos(0, 99);
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                this.jjmatchedKind = 87;
                return jjMoveStringLiteralDfa1_4(274894684160L);
            case FMParserConstants.HALT /* 47 */:
                return jjStartNfaWithStates_4(0, FMParserConstants.DIVIDE, 41);
            case FMParserConstants.FALLBACK /* 58 */:
                return jjStopAtPos(0, FMParserConstants.COLON);
            case FMParserConstants.ESCAPE /* 59 */:
                return jjStopAtPos(0, FMParserConstants.SEMICOLON);
            case FMParserConstants.NOESCAPE /* 61 */:
                this.jjmatchedKind = 91;
                return jjMoveStringLiteralDfa1_4(268435456L);
            case FMParserConstants.END_NOESCAPE /* 62 */:
                return jjStopAtPos(0, FMParserConstants.DIRECTIVE_END);
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                this.jjmatchedKind = 89;
                return jjMoveStringLiteralDfa1_4(67108864L);
            case FMParserConstants.EQUALS /* 91 */:
                return jjStartNfaWithStates_4(0, FMParserConstants.OPEN_BRACKET, 2);
            case FMParserConstants.NOT_EQUALS /* 93 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACKET);
            case FMParserConstants.ESCAPED_GTE /* 97 */:
                return jjMoveStringLiteralDfa1_4(18014398509481984L);
            case FMParserConstants.ELLIPSIS /* 102 */:
                return jjMoveStringLiteralDfa1_4(524288L);
            case FMParserConstants.AND /* 105 */:
                return jjMoveStringLiteralDfa1_4(9007199254740992L);
            case FMParserConstants.CLOSE_BRACE /* 116 */:
                return jjMoveStringLiteralDfa1_4(1048576L);
            case FMParserConstants.IN /* 117 */:
                return jjMoveStringLiteralDfa1_4(36028797018963968L);
            case FMParserConstants.DIGIT /* 123 */:
                return jjStopAtPos(0, FMParserConstants.OPEN_BRACE);
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                return jjStopAtPos(0, FMParserConstants.CLOSE_BRACE);
        }
    }

    private final int jjMoveStringLiteralDfa1_4(long active1) {
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.END_TRANSFORM /* 42 */:
                    if ((active1 & 137438953472L) != 0) {
                        return jjStopAtPos(1, FMParserConstants.DOUBLE_STAR);
                    }
                    break;
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active1 & 16777216) != 0) {
                        this.jjmatchedKind = 88;
                        this.jjmatchedPos = 1;
                    }
                    return jjMoveStringLiteralDfa2_4(active1, 274877906944L);
                case FMParserConstants.NOESCAPE /* 61 */:
                    if ((active1 & 268435456) != 0) {
                        return jjStopAtPos(1, 92);
                    }
                    if ((active1 & 536870912) != 0) {
                        return jjStopAtPos(1, 93);
                    }
                    break;
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                    if ((active1 & 67108864) != 0) {
                        return jjStopAtPos(1, 90);
                    }
                    break;
                case FMParserConstants.ESCAPED_GTE /* 97 */:
                    return jjMoveStringLiteralDfa2_4(active1, 524288L);
                case FMParserConstants.COLON /* 110 */:
                    if ((active1 & 9007199254740992L) != 0) {
                        return jjStartNfaWithStates_4(1, FMParserConstants.IN, 34);
                    }
                    break;
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    return jjMoveStringLiteralDfa2_4(active1, 1048576L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    if ((active1 & 18014398509481984L) != 0) {
                        return jjStartNfaWithStates_4(1, FMParserConstants.AS, 34);
                    }
                    return jjMoveStringLiteralDfa2_4(active1, 36028797018963968L);
            }
            return jjStartNfa_4(0, 0L, active1);
        } catch (IOException e) {
            jjStopStringLiteralDfa_4(0, 0L, active1);
            return 1;
        }
    }

    private final int jjMoveStringLiteralDfa2_4(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_4(0, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                    if ((active12 & 274877906944L) != 0) {
                        return jjStopAtPos(2, FMParserConstants.ELLIPSIS);
                    }
                    break;
                case FMParserConstants.AND /* 105 */:
                    return jjMoveStringLiteralDfa3_4(active12, 36028797018963968L);
                case FMParserConstants.COMMA /* 108 */:
                    return jjMoveStringLiteralDfa3_4(active12, 524288L);
                case FMParserConstants.IN /* 117 */:
                    return jjMoveStringLiteralDfa3_4(active12, 1048576L);
            }
            return jjStartNfa_4(1, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_4(1, 0L, active12);
            return 2;
        }
    }

    private final int jjMoveStringLiteralDfa3_4(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_4(1, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 1048576) != 0) {
                        return jjStartNfaWithStates_4(3, 84, 34);
                    }
                    break;
                case FMParserConstants.COLON /* 110 */:
                    return jjMoveStringLiteralDfa4_4(active12, 36028797018963968L);
                case FMParserConstants.OPEN_BRACE /* 115 */:
                    return jjMoveStringLiteralDfa4_4(active12, 524288L);
            }
            return jjStartNfa_4(2, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_4(2, 0L, active12);
            return 3;
        }
    }

    private final int jjMoveStringLiteralDfa4_4(long old1, long active1) {
        long active12 = active1 & old1;
        if (active12 == 0) {
            return jjStartNfa_4(2, 0L, old1);
        }
        try {
            this.curChar = this.input_stream.readChar();
            switch (this.curChar) {
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                    if ((active12 & 524288) != 0) {
                        return jjStartNfaWithStates_4(4, 83, 34);
                    }
                    break;
                case FMParserConstants.DIVIDE /* 103 */:
                    if ((active12 & 36028797018963968L) != 0) {
                        return jjStartNfaWithStates_4(4, FMParserConstants.USING, 34);
                    }
                    break;
            }
            return jjStartNfa_4(3, 0L, active12);
        } catch (IOException e) {
            jjStopStringLiteralDfa_4(3, 0L, active12);
            return 4;
        }
    }

    private final int jjMoveNfa_4(int startState, int curPos) {
        int startsAt = 0;
        this.jjnewStateCnt = 78;
        int i = 1;
        this.jjstateSet[0] = startState;
        int kind = Integer.MAX_VALUE;
        while (true) {
            int i2 = this.jjround + 1;
            this.jjround = i2;
            if (i2 == Integer.MAX_VALUE) {
                ReInitRounds();
            }
            if (this.curChar < '@') {
                long l = 1 << this.curChar;
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 0:
                            if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                                break;
                            }
                            break;
                        case 1:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(350, 352);
                            } else if ((4294977024L & l) != 0) {
                                if (kind > 73) {
                                    kind = 73;
                                }
                                jjCheckNAdd(0);
                            } else if (this.curChar == '&') {
                                jjAddStates(353, 357);
                            } else if (this.curChar == '/') {
                                jjAddStates(358, 359);
                            } else if (this.curChar == '!') {
                                jjCheckNAdd(39);
                            } else if (this.curChar == '#' || this.curChar == '$') {
                                jjCheckNAdd(35);
                            } else if (this.curChar == '<') {
                                jjCheckNAdd(27);
                            } else if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                            } else if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                            }
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '&') {
                                if (kind > 105) {
                                    kind = 105;
                                }
                            } else if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                            }
                            if (this.curChar == '<') {
                                int[] iArr = this.jjstateSet;
                                int i3 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i3 + 1;
                                iArr[i3] = 2;
                                break;
                            }
                            break;
                        case 2:
                            if ((42949672960L & l) != 0) {
                                int[] iArr2 = this.jjstateSet;
                                int i4 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i4 + 1;
                                iArr2[i4] = 4;
                                break;
                            }
                            break;
                        case 3:
                            if (this.curChar == '-' && kind > 74) {
                                kind = 74;
                                break;
                            }
                            break;
                        case 4:
                            if (this.curChar == '-') {
                                int[] iArr3 = this.jjstateSet;
                                int i5 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i5 + 1;
                                iArr3[i5] = 3;
                                break;
                            }
                            break;
                        case 5:
                            if (this.curChar == '\"') {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 6:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 8:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            if (this.curChar == '\"' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((635655159808L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case 16:
                            if (this.curChar == '\'' && kind > 81) {
                                kind = 81;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.MACRO /* 20 */:
                            if (this.curChar == '\"') {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (((-17179869185L) & l) != 0) {
                                jjCheckNAddTwoStates(21, 22);
                                break;
                            }
                            break;
                        case FMParserConstants.VISIT /* 22 */:
                            if (this.curChar == '\"' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.STOP /* 23 */:
                            if (this.curChar == '\'') {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (((-549755813889L) & l) != 0) {
                                jjCheckNAddTwoStates(24, 25);
                                break;
                            }
                            break;
                        case FMParserConstants.CALL /* 25 */:
                            if (this.curChar == '\'' && kind > 82) {
                                kind = 82;
                                break;
                            }
                            break;
                        case FMParserConstants.SETTING /* 26 */:
                            if (this.curChar == '<' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.COMPRESS /* 27 */:
                            if (this.curChar == '=' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.COMMENT /* 28 */:
                            if (this.curChar == '<') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.TERSE_COMMENT /* 29 */:
                        case 75:
                            if (this.curChar == '&' && kind > 105) {
                                kind = 105;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                            if (this.curChar == '$') {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((287948969894477824L & l) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_LOCAL /* 36 */:
                            if (this.curChar == '$') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_GLOBAL /* 37 */:
                            if (this.curChar == '#') {
                                jjCheckNAdd(35);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ASSIGN /* 38 */:
                            if (this.curChar == '!') {
                                jjCheckNAdd(39);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FUNCTION /* 39 */:
                            if ((4294977024L & l) != 0) {
                                if (kind > 129) {
                                    kind = 129;
                                }
                                jjCheckNAdd(39);
                                break;
                            }
                            break;
                        case FMParserConstants.END_MACRO /* 40 */:
                            if (this.curChar == '/') {
                                jjAddStates(358, 359);
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if (this.curChar == '>' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.END_SWITCH /* 43 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAddStates(350, 352);
                                break;
                            }
                            break;
                        case FMParserConstants.ELSE /* 44 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 85) {
                                    kind = 85;
                                }
                                jjCheckNAdd(44);
                                break;
                            }
                            break;
                        case FMParserConstants.BREAK /* 45 */:
                            if ((287948901175001088L & l) != 0) {
                                jjCheckNAddTwoStates(45, 46);
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RETURN /* 46 */:
                            if (this.curChar == '.') {
                                jjCheckNAdd(47);
                                break;
                            }
                            break;
                        case FMParserConstants.HALT /* 47 */:
                            if ((287948901175001088L & l) != 0) {
                                if (kind > 86) {
                                    kind = 86;
                                }
                                jjCheckNAdd(47);
                                break;
                            }
                            break;
                        case FMParserConstants.NOESCAPE /* 61 */:
                            if (this.curChar == '&') {
                                jjAddStates(353, 357);
                                break;
                            }
                            break;
                        case FMParserConstants.END_NOESCAPE /* 62 */:
                            if (this.curChar == ';' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.FTL_HEADER /* 65 */:
                            if (this.curChar == ';') {
                                jjCheckNAdd(27);
                                break;
                            }
                            break;
                        case FMParserConstants.WHITESPACE /* 68 */:
                            if (this.curChar == ';' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                            if (this.curChar == '=' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                            if (this.curChar == ';') {
                                int[] iArr4 = this.jjstateSet;
                                int i6 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i6 + 1;
                                iArr4[i6] = 71;
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else if (this.curChar < 128) {
                long l2 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                            } else if (this.curChar == '\\') {
                                jjAddStates(360, 363);
                            } else if (this.curChar == '|') {
                                int[] iArr5 = this.jjstateSet;
                                int i7 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i7 + 1;
                                iArr5[i7] = 31;
                            } else if (this.curChar == '[') {
                                int[] iArr6 = this.jjstateSet;
                                int i8 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i8 + 1;
                                iArr6[i8] = 2;
                            }
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(56, 77);
                                break;
                            } else if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(49, 51);
                                break;
                            } else if (this.curChar == '|') {
                                if (kind > 106) {
                                    kind = 106;
                                    break;
                                }
                            } else if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case 6:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case 7:
                            if (this.curChar == '\\') {
                                jjAddStates(302, 303);
                                break;
                            }
                            break;
                        case 8:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            if (this.curChar == 'x') {
                                int[] iArr7 = this.jjstateSet;
                                int i9 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i9 + 1;
                                iArr7[i9] = 11;
                                break;
                            }
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (((-268435457) & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            if (this.curChar == '\\') {
                                jjAddStates(304, 305);
                                break;
                            }
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            if ((582179063439818752L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants._INCLUDE /* 17 */:
                            if (this.curChar == 'x') {
                                int[] iArr8 = this.jjstateSet;
                                int i10 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i10 + 1;
                                iArr8[i10] = 18;
                                break;
                            }
                            break;
                        case FMParserConstants.IMPORT /* 18 */:
                            if ((541165879422L & l2) != 0) {
                                jjCheckNAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.FUNCTION /* 19 */:
                            if (this.curChar == 'r') {
                                jjAddStates(300, 301);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            jjAddStates(306, 307);
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            jjAddStates(308, 309);
                            break;
                        case FMParserConstants.NOPARSE /* 30 */:
                        case FMParserConstants.END_IF /* 31 */:
                            if (this.curChar == '|' && kind > 106) {
                                kind = 106;
                                break;
                            }
                            break;
                        case 32:
                            if (this.curChar == '|') {
                                int[] iArr9 = this.jjstateSet;
                                int i11 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i11 + 1;
                                iArr9[i11] = 31;
                                break;
                            }
                            break;
                        case FMParserConstants.END_RECOVER /* 33 */:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if ((576460745995190271L & l2) != 0) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case FMParserConstants.END_FOREACH /* 35 */:
                            if (this.curChar == '{' && kind > 121) {
                                kind = 121;
                                break;
                            }
                            break;
                        case FMParserConstants.END_COMPRESS /* 41 */:
                            if (this.curChar == ']' && kind > 125) {
                                kind = 125;
                                break;
                            }
                            break;
                        case FMParserConstants.FLUSH /* 48 */:
                            if (this.curChar == 'l') {
                                jjCheckNAddTwoStates(49, 51);
                                break;
                            }
                            break;
                        case FMParserConstants.TRIM /* 49 */:
                            if (this.curChar == 't' && kind > 94) {
                                kind = 94;
                                break;
                            }
                            break;
                        case FMParserConstants.LTRIM /* 50 */:
                            if (this.curChar == 'e' && kind > 95) {
                                kind = 95;
                                break;
                            }
                            break;
                        case FMParserConstants.RTRIM /* 51 */:
                        case FMParserConstants.SIMPLE_NESTED /* 54 */:
                            if (this.curChar == 't') {
                                jjCheckNAdd(50);
                                break;
                            }
                            break;
                        case FMParserConstants.NOTRIM /* 52 */:
                            if (this.curChar == '\\') {
                                jjAddStates(360, 363);
                                break;
                            }
                            break;
                        case FMParserConstants.DEFAUL /* 53 */:
                            if (this.curChar == 'l') {
                                jjCheckNAdd(49);
                                break;
                            }
                            break;
                        case FMParserConstants.NESTED /* 55 */:
                            if (this.curChar == 'l') {
                                int[] iArr10 = this.jjstateSet;
                                int i12 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i12 + 1;
                                iArr10[i12] = 54;
                                break;
                            }
                            break;
                        case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                            if (this.curChar == 't' && kind > 96) {
                                kind = 96;
                                break;
                            }
                            break;
                        case FMParserConstants.RECURSE /* 57 */:
                            if (this.curChar == 'g') {
                                jjCheckNAdd(56);
                                break;
                            }
                            break;
                        case FMParserConstants.FALLBACK /* 58 */:
                            if (this.curChar == 'e' && kind > 97) {
                                kind = 97;
                                break;
                            }
                            break;
                        case FMParserConstants.ESCAPE /* 59 */:
                        case 77:
                            if (this.curChar == 't') {
                                jjCheckNAdd(58);
                                break;
                            }
                            break;
                        case FMParserConstants.END_ESCAPE /* 60 */:
                            if (this.curChar == 'g') {
                                int[] iArr11 = this.jjstateSet;
                                int i13 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i13 + 1;
                                iArr11[i13] = 59;
                                break;
                            }
                            break;
                        case FMParserConstants.UNIFIED_CALL /* 63 */:
                            if (this.curChar == 't') {
                                int[] iArr12 = this.jjstateSet;
                                int i14 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i14 + 1;
                                iArr12[i14] = 62;
                                break;
                            }
                            break;
                        case 64:
                            if (this.curChar == 'l') {
                                int[] iArr13 = this.jjstateSet;
                                int i15 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i15 + 1;
                                iArr13[i15] = 63;
                                break;
                            }
                            break;
                        case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                            if (this.curChar == 't') {
                                int[] iArr14 = this.jjstateSet;
                                int i16 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i16 + 1;
                                iArr14[i16] = 65;
                                break;
                            }
                            break;
                        case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                            if (this.curChar == 'l') {
                                int[] iArr15 = this.jjstateSet;
                                int i17 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i17 + 1;
                                iArr15[i17] = 66;
                                break;
                            }
                            break;
                        case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                            if (this.curChar == 't') {
                                int[] iArr16 = this.jjstateSet;
                                int i18 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i18 + 1;
                                iArr16[i18] = 68;
                                break;
                            }
                            break;
                        case FMParserConstants.FALSE_ALERT /* 70 */:
                            if (this.curChar == 'g') {
                                int[] iArr17 = this.jjstateSet;
                                int i19 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i19 + 1;
                                iArr17[i19] = 69;
                                break;
                            }
                            break;
                        case 73:
                            if (this.curChar == 't') {
                                int[] iArr18 = this.jjstateSet;
                                int i20 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i20 + 1;
                                iArr18[i20] = 72;
                                break;
                            }
                            break;
                        case 74:
                            if (this.curChar == 'g') {
                                int[] iArr19 = this.jjstateSet;
                                int i21 = this.jjnewStateCnt;
                                this.jjnewStateCnt = i21 + 1;
                                iArr19[i21] = 73;
                                break;
                            }
                            break;
                        case 76:
                            if (this.curChar == 'g') {
                                jjCheckNAddTwoStates(56, 77);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            } else {
                int hiByte = this.curChar >> '\b';
                int i1 = hiByte >> 6;
                long l1 = 1 << (hiByte & 63);
                int i22 = (this.curChar & 255) >> 6;
                long l22 = 1 << (this.curChar & '?');
                do {
                    i--;
                    switch (this.jjstateSet[i]) {
                        case 1:
                        case FMParserConstants.END_ATTEMPT /* 34 */:
                            if (jjCanMove_1(hiByte, i1, i22, l1, l22)) {
                                if (kind > 120) {
                                    kind = 120;
                                }
                                jjCheckNAdd(34);
                                break;
                            }
                            break;
                        case 6:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(293, 295);
                                break;
                            }
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(290, 292);
                                break;
                            }
                            break;
                        case FMParserConstants.TRANSFORM /* 21 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(306, 307);
                                break;
                            }
                            break;
                        case FMParserConstants.RETURN /* 24 */:
                            if (jjCanMove_0(hiByte, i1, i22, l1, l22)) {
                                jjAddStates(308, 309);
                                break;
                            }
                            break;
                    }
                } while (i != startsAt);
            }
            if (kind != Integer.MAX_VALUE) {
                this.jjmatchedKind = kind;
                this.jjmatchedPos = curPos;
                kind = Integer.MAX_VALUE;
            }
            curPos++;
            int i23 = this.jjnewStateCnt;
            i = i23;
            int i24 = startsAt;
            this.jjnewStateCnt = i24;
            int i25 = 78 - i24;
            startsAt = i25;
            if (i23 == i25) {
                return curPos;
            }
            try {
                this.curChar = this.input_stream.readChar();
            } catch (IOException e) {
                return curPos;
            }
        }
    }

    private static final boolean jjCanMove_0(int hiByte, int i1, int i2, long l1, long l2) {
        switch (hiByte) {
            case 0:
                return (jjbitVec2[i2] & l2) != 0;
            default:
                if ((jjbitVec0[i1] & l1) != 0) {
                    return true;
                }
                return false;
        }
    }

    private static final boolean jjCanMove_1(int hiByte, int i1, int i2, long l1, long l2) {
        switch (hiByte) {
            case 0:
                return (jjbitVec4[i2] & l2) != 0;
            case FMParserConstants.FLUSH /* 48 */:
                return (jjbitVec5[i2] & l2) != 0;
            case FMParserConstants.TRIM /* 49 */:
                return (jjbitVec6[i2] & l2) != 0;
            case FMParserConstants.RTRIM /* 51 */:
                return (jjbitVec7[i2] & l2) != 0;
            case FMParserConstants.NOESCAPE /* 61 */:
                return (jjbitVec8[i2] & l2) != 0;
            default:
                if ((jjbitVec3[i1] & l1) != 0) {
                    return true;
                }
                return false;
        }
    }

    public FMParserTokenManager(SimpleCharStream stream) {
        this.debugStream = System.out;
        this.jjrounds = new int[567];
        this.jjstateSet = new int[1134];
        this.curLexState = 0;
        this.defaultLexState = 0;
        this.input_stream = stream;
    }

    public FMParserTokenManager(SimpleCharStream stream, int lexState) {
        this(stream);
        SwitchTo(lexState);
    }

    public void ReInit(SimpleCharStream stream) {
        this.jjnewStateCnt = 0;
        this.jjmatchedPos = 0;
        this.curLexState = this.defaultLexState;
        this.input_stream = stream;
        ReInitRounds();
    }

    private final void ReInitRounds() {
        this.jjround = -2147483647;
        int i = 567;
        while (true) {
            int i2 = i;
            i--;
            if (i2 > 0) {
                this.jjrounds[i] = Integer.MIN_VALUE;
            } else {
                return;
            }
        }
    }

    public void ReInit(SimpleCharStream stream, int lexState) {
        ReInit(stream);
        SwitchTo(lexState);
    }

    public void SwitchTo(int lexState) {
        if (lexState >= 8 || lexState < 0) {
            throw new TokenMgrError(new StringBuffer().append("Error: Ignoring invalid lexical state : ").append(lexState).append(". State unchanged.").toString(), 2);
        }
        this.curLexState = lexState;
    }

    protected Token jjFillToken() {
        Token t = Token.newToken(this.jjmatchedKind);
        t.kind = this.jjmatchedKind;
        String im = jjstrLiteralImages[this.jjmatchedKind];
        t.image = im == null ? this.input_stream.GetImage() : im;
        t.beginLine = this.input_stream.getBeginLine();
        t.beginColumn = this.input_stream.getBeginColumn();
        t.endLine = this.input_stream.getEndLine();
        t.endColumn = this.input_stream.getEndColumn();
        return t;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01ce A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public freemarker.core.Token getNextToken() {
        /*
            Method dump skipped, instructions count: 618
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.FMParserTokenManager.getNextToken():freemarker.core.Token");
    }

    void SkipLexicalActions(Token matchedToken) {
        switch (this.jjmatchedKind) {
            case 79:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream = this.input_stream;
                    int i = this.jjimageLen;
                    int i2 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i2;
                    this.image = new StringBuffer(new String(simpleCharStream.GetSuffix(i + i2)));
                } else {
                    StringBuffer stringBuffer = this.image;
                    SimpleCharStream simpleCharStream2 = this.input_stream;
                    int i3 = this.jjimageLen;
                    int i4 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i4;
                    stringBuffer.append(new String(simpleCharStream2.GetSuffix(i3 + i4)));
                }
                if (this.parenthesisNesting <= 0) {
                    if (!this.inInvocation) {
                        SwitchTo(2);
                        break;
                    } else {
                        SwitchTo(4);
                        break;
                    }
                } else {
                    SwitchTo(3);
                    break;
                }
        }
    }

    void TokenLexicalActions(Token matchedToken) {
        String tip;
        switch (this.jjmatchedKind) {
            case 6:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream = this.input_stream;
                    int i = this.jjimageLen;
                    int i2 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i2;
                    this.image = new StringBuffer(new String(simpleCharStream.GetSuffix(i + i2)));
                } else {
                    StringBuffer stringBuffer = this.image;
                    SimpleCharStream simpleCharStream2 = this.input_stream;
                    int i3 = this.jjimageLen;
                    int i4 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i4;
                    stringBuffer.append(new String(simpleCharStream2.GetSuffix(i3 + i4)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case 7:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream3 = this.input_stream;
                    int i5 = this.jjimageLen;
                    int i6 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i6;
                    this.image = new StringBuffer(new String(simpleCharStream3.GetSuffix(i5 + i6)));
                } else {
                    StringBuffer stringBuffer2 = this.image;
                    SimpleCharStream simpleCharStream4 = this.input_stream;
                    int i7 = this.jjimageLen;
                    int i8 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i8;
                    stringBuffer2.append(new String(simpleCharStream4.GetSuffix(i7 + i8)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case 8:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream5 = this.input_stream;
                    int i9 = this.jjimageLen;
                    int i10 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i10;
                    this.image = new StringBuffer(new String(simpleCharStream5.GetSuffix(i9 + i10)));
                } else {
                    StringBuffer stringBuffer3 = this.image;
                    SimpleCharStream simpleCharStream6 = this.input_stream;
                    int i11 = this.jjimageLen;
                    int i12 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i12;
                    stringBuffer3.append(new String(simpleCharStream6.GetSuffix(i11 + i12)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.ELSE_IF /* 9 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream7 = this.input_stream;
                    int i13 = this.jjimageLen;
                    int i14 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i14;
                    this.image = new StringBuffer(new String(simpleCharStream7.GetSuffix(i13 + i14)));
                } else {
                    StringBuffer stringBuffer4 = this.image;
                    SimpleCharStream simpleCharStream8 = this.input_stream;
                    int i15 = this.jjimageLen;
                    int i16 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i16;
                    stringBuffer4.append(new String(simpleCharStream8.GetSuffix(i15 + i16)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.LIST /* 10 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream9 = this.input_stream;
                    int i17 = this.jjimageLen;
                    int i18 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i18;
                    this.image = new StringBuffer(new String(simpleCharStream9.GetSuffix(i17 + i18)));
                } else {
                    StringBuffer stringBuffer5 = this.image;
                    SimpleCharStream simpleCharStream10 = this.input_stream;
                    int i19 = this.jjimageLen;
                    int i20 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i20;
                    stringBuffer5.append(new String(simpleCharStream10.GetSuffix(i19 + i20)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.FOREACH /* 11 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream11 = this.input_stream;
                    int i21 = this.jjimageLen;
                    int i22 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i22;
                    this.image = new StringBuffer(new String(simpleCharStream11.GetSuffix(i21 + i22)));
                } else {
                    StringBuffer stringBuffer6 = this.image;
                    SimpleCharStream simpleCharStream12 = this.input_stream;
                    int i23 = this.jjimageLen;
                    int i24 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i24;
                    stringBuffer6.append(new String(simpleCharStream12.GetSuffix(i23 + i24)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.SWITCH /* 12 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream13 = this.input_stream;
                    int i25 = this.jjimageLen;
                    int i26 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i26;
                    this.image = new StringBuffer(new String(simpleCharStream13.GetSuffix(i25 + i26)));
                } else {
                    StringBuffer stringBuffer7 = this.image;
                    SimpleCharStream simpleCharStream14 = this.input_stream;
                    int i27 = this.jjimageLen;
                    int i28 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i28;
                    stringBuffer7.append(new String(simpleCharStream14.GetSuffix(i27 + i28)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.CASE /* 13 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream15 = this.input_stream;
                    int i29 = this.jjimageLen;
                    int i30 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i30;
                    this.image = new StringBuffer(new String(simpleCharStream15.GetSuffix(i29 + i30)));
                } else {
                    StringBuffer stringBuffer8 = this.image;
                    SimpleCharStream simpleCharStream16 = this.input_stream;
                    int i31 = this.jjimageLen;
                    int i32 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i32;
                    stringBuffer8.append(new String(simpleCharStream16.GetSuffix(i31 + i32)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.ASSIGN /* 14 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream17 = this.input_stream;
                    int i33 = this.jjimageLen;
                    int i34 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i34;
                    this.image = new StringBuffer(new String(simpleCharStream17.GetSuffix(i33 + i34)));
                } else {
                    StringBuffer stringBuffer9 = this.image;
                    SimpleCharStream simpleCharStream18 = this.input_stream;
                    int i35 = this.jjimageLen;
                    int i36 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i36;
                    stringBuffer9.append(new String(simpleCharStream18.GetSuffix(i35 + i36)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.GLOBALASSIGN /* 15 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream19 = this.input_stream;
                    int i37 = this.jjimageLen;
                    int i38 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i38;
                    this.image = new StringBuffer(new String(simpleCharStream19.GetSuffix(i37 + i38)));
                } else {
                    StringBuffer stringBuffer10 = this.image;
                    SimpleCharStream simpleCharStream20 = this.input_stream;
                    int i39 = this.jjimageLen;
                    int i40 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i40;
                    stringBuffer10.append(new String(simpleCharStream20.GetSuffix(i39 + i40)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case 16:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream21 = this.input_stream;
                    int i41 = this.jjimageLen;
                    int i42 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i42;
                    this.image = new StringBuffer(new String(simpleCharStream21.GetSuffix(i41 + i42)));
                } else {
                    StringBuffer stringBuffer11 = this.image;
                    SimpleCharStream simpleCharStream22 = this.input_stream;
                    int i43 = this.jjimageLen;
                    int i44 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i44;
                    stringBuffer11.append(new String(simpleCharStream22.GetSuffix(i43 + i44)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants._INCLUDE /* 17 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream23 = this.input_stream;
                    int i45 = this.jjimageLen;
                    int i46 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i46;
                    this.image = new StringBuffer(new String(simpleCharStream23.GetSuffix(i45 + i46)));
                } else {
                    StringBuffer stringBuffer12 = this.image;
                    SimpleCharStream simpleCharStream24 = this.input_stream;
                    int i47 = this.jjimageLen;
                    int i48 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i48;
                    stringBuffer12.append(new String(simpleCharStream24.GetSuffix(i47 + i48)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.IMPORT /* 18 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream25 = this.input_stream;
                    int i49 = this.jjimageLen;
                    int i50 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i50;
                    this.image = new StringBuffer(new String(simpleCharStream25.GetSuffix(i49 + i50)));
                } else {
                    StringBuffer stringBuffer13 = this.image;
                    SimpleCharStream simpleCharStream26 = this.input_stream;
                    int i51 = this.jjimageLen;
                    int i52 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i52;
                    stringBuffer13.append(new String(simpleCharStream26.GetSuffix(i51 + i52)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.FUNCTION /* 19 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream27 = this.input_stream;
                    int i53 = this.jjimageLen;
                    int i54 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i54;
                    this.image = new StringBuffer(new String(simpleCharStream27.GetSuffix(i53 + i54)));
                } else {
                    StringBuffer stringBuffer14 = this.image;
                    SimpleCharStream simpleCharStream28 = this.input_stream;
                    int i55 = this.jjimageLen;
                    int i56 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i56;
                    stringBuffer14.append(new String(simpleCharStream28.GetSuffix(i55 + i56)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.MACRO /* 20 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream29 = this.input_stream;
                    int i57 = this.jjimageLen;
                    int i58 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i58;
                    this.image = new StringBuffer(new String(simpleCharStream29.GetSuffix(i57 + i58)));
                } else {
                    StringBuffer stringBuffer15 = this.image;
                    SimpleCharStream simpleCharStream30 = this.input_stream;
                    int i59 = this.jjimageLen;
                    int i60 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i60;
                    stringBuffer15.append(new String(simpleCharStream30.GetSuffix(i59 + i60)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.TRANSFORM /* 21 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream31 = this.input_stream;
                    int i61 = this.jjimageLen;
                    int i62 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i62;
                    this.image = new StringBuffer(new String(simpleCharStream31.GetSuffix(i61 + i62)));
                } else {
                    StringBuffer stringBuffer16 = this.image;
                    SimpleCharStream simpleCharStream32 = this.input_stream;
                    int i63 = this.jjimageLen;
                    int i64 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i64;
                    stringBuffer16.append(new String(simpleCharStream32.GetSuffix(i63 + i64)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.VISIT /* 22 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream33 = this.input_stream;
                    int i65 = this.jjimageLen;
                    int i66 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i66;
                    this.image = new StringBuffer(new String(simpleCharStream33.GetSuffix(i65 + i66)));
                } else {
                    StringBuffer stringBuffer17 = this.image;
                    SimpleCharStream simpleCharStream34 = this.input_stream;
                    int i67 = this.jjimageLen;
                    int i68 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i68;
                    stringBuffer17.append(new String(simpleCharStream34.GetSuffix(i67 + i68)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.STOP /* 23 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream35 = this.input_stream;
                    int i69 = this.jjimageLen;
                    int i70 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i70;
                    this.image = new StringBuffer(new String(simpleCharStream35.GetSuffix(i69 + i70)));
                } else {
                    StringBuffer stringBuffer18 = this.image;
                    SimpleCharStream simpleCharStream36 = this.input_stream;
                    int i71 = this.jjimageLen;
                    int i72 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i72;
                    stringBuffer18.append(new String(simpleCharStream36.GetSuffix(i71 + i72)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.RETURN /* 24 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream37 = this.input_stream;
                    int i73 = this.jjimageLen;
                    int i74 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i74;
                    this.image = new StringBuffer(new String(simpleCharStream37.GetSuffix(i73 + i74)));
                } else {
                    StringBuffer stringBuffer19 = this.image;
                    SimpleCharStream simpleCharStream38 = this.input_stream;
                    int i75 = this.jjimageLen;
                    int i76 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i76;
                    stringBuffer19.append(new String(simpleCharStream38.GetSuffix(i75 + i76)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.CALL /* 25 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream39 = this.input_stream;
                    int i77 = this.jjimageLen;
                    int i78 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i78;
                    this.image = new StringBuffer(new String(simpleCharStream39.GetSuffix(i77 + i78)));
                } else {
                    StringBuffer stringBuffer20 = this.image;
                    SimpleCharStream simpleCharStream40 = this.input_stream;
                    int i79 = this.jjimageLen;
                    int i80 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i80;
                    stringBuffer20.append(new String(simpleCharStream40.GetSuffix(i79 + i80)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.SETTING /* 26 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream41 = this.input_stream;
                    int i81 = this.jjimageLen;
                    int i82 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i82;
                    this.image = new StringBuffer(new String(simpleCharStream41.GetSuffix(i81 + i82)));
                } else {
                    StringBuffer stringBuffer21 = this.image;
                    SimpleCharStream simpleCharStream42 = this.input_stream;
                    int i83 = this.jjimageLen;
                    int i84 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i84;
                    stringBuffer21.append(new String(simpleCharStream42.GetSuffix(i83 + i84)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.COMPRESS /* 27 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream43 = this.input_stream;
                    int i85 = this.jjimageLen;
                    int i86 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i86;
                    this.image = new StringBuffer(new String(simpleCharStream43.GetSuffix(i85 + i86)));
                } else {
                    StringBuffer stringBuffer22 = this.image;
                    SimpleCharStream simpleCharStream44 = this.input_stream;
                    int i87 = this.jjimageLen;
                    int i88 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i88;
                    stringBuffer22.append(new String(simpleCharStream44.GetSuffix(i87 + i88)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.COMMENT /* 28 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream45 = this.input_stream;
                    int i89 = this.jjimageLen;
                    int i90 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i90;
                    this.image = new StringBuffer(new String(simpleCharStream45.GetSuffix(i89 + i90)));
                } else {
                    StringBuffer stringBuffer23 = this.image;
                    SimpleCharStream simpleCharStream46 = this.input_stream;
                    int i91 = this.jjimageLen;
                    int i92 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i92;
                    stringBuffer23.append(new String(simpleCharStream46.GetSuffix(i91 + i92)));
                }
                strictSyntaxCheck(matchedToken, 7);
                this.noparseTag = "comment";
                return;
            case FMParserConstants.TERSE_COMMENT /* 29 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream47 = this.input_stream;
                    int i93 = this.jjimageLen;
                    int i94 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i94;
                    this.image = new StringBuffer(new String(simpleCharStream47.GetSuffix(i93 + i94)));
                } else {
                    StringBuffer stringBuffer24 = this.image;
                    SimpleCharStream simpleCharStream48 = this.input_stream;
                    int i95 = this.jjimageLen;
                    int i96 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i96;
                    stringBuffer24.append(new String(simpleCharStream48.GetSuffix(i95 + i96)));
                }
                this.noparseTag = "-->";
                strictSyntaxCheck(matchedToken, 7);
                return;
            case FMParserConstants.NOPARSE /* 30 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream49 = this.input_stream;
                    int i97 = this.jjimageLen;
                    int i98 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i98;
                    this.image = new StringBuffer(new String(simpleCharStream49.GetSuffix(i97 + i98)));
                } else {
                    StringBuffer stringBuffer25 = this.image;
                    SimpleCharStream simpleCharStream50 = this.input_stream;
                    int i99 = this.jjimageLen;
                    int i100 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i100;
                    stringBuffer25.append(new String(simpleCharStream50.GetSuffix(i99 + i100)));
                }
                strictSyntaxCheck(matchedToken, 7);
                this.noparseTag = "noparse";
                return;
            case FMParserConstants.END_IF /* 31 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream51 = this.input_stream;
                    int i101 = this.jjimageLen;
                    int i102 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i102;
                    this.image = new StringBuffer(new String(simpleCharStream51.GetSuffix(i101 + i102)));
                } else {
                    StringBuffer stringBuffer26 = this.image;
                    SimpleCharStream simpleCharStream52 = this.input_stream;
                    int i103 = this.jjimageLen;
                    int i104 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i104;
                    stringBuffer26.append(new String(simpleCharStream52.GetSuffix(i103 + i104)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case 32:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream53 = this.input_stream;
                    int i105 = this.jjimageLen;
                    int i106 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i106;
                    this.image = new StringBuffer(new String(simpleCharStream53.GetSuffix(i105 + i106)));
                } else {
                    StringBuffer stringBuffer27 = this.image;
                    SimpleCharStream simpleCharStream54 = this.input_stream;
                    int i107 = this.jjimageLen;
                    int i108 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i108;
                    stringBuffer27.append(new String(simpleCharStream54.GetSuffix(i107 + i108)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_RECOVER /* 33 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream55 = this.input_stream;
                    int i109 = this.jjimageLen;
                    int i110 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i110;
                    this.image = new StringBuffer(new String(simpleCharStream55.GetSuffix(i109 + i110)));
                } else {
                    StringBuffer stringBuffer28 = this.image;
                    SimpleCharStream simpleCharStream56 = this.input_stream;
                    int i111 = this.jjimageLen;
                    int i112 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i112;
                    stringBuffer28.append(new String(simpleCharStream56.GetSuffix(i111 + i112)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_ATTEMPT /* 34 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream57 = this.input_stream;
                    int i113 = this.jjimageLen;
                    int i114 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i114;
                    this.image = new StringBuffer(new String(simpleCharStream57.GetSuffix(i113 + i114)));
                } else {
                    StringBuffer stringBuffer29 = this.image;
                    SimpleCharStream simpleCharStream58 = this.input_stream;
                    int i115 = this.jjimageLen;
                    int i116 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i116;
                    stringBuffer29.append(new String(simpleCharStream58.GetSuffix(i115 + i116)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_FOREACH /* 35 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream59 = this.input_stream;
                    int i117 = this.jjimageLen;
                    int i118 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i118;
                    this.image = new StringBuffer(new String(simpleCharStream59.GetSuffix(i117 + i118)));
                } else {
                    StringBuffer stringBuffer30 = this.image;
                    SimpleCharStream simpleCharStream60 = this.input_stream;
                    int i119 = this.jjimageLen;
                    int i120 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i120;
                    stringBuffer30.append(new String(simpleCharStream60.GetSuffix(i119 + i120)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_LOCAL /* 36 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream61 = this.input_stream;
                    int i121 = this.jjimageLen;
                    int i122 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i122;
                    this.image = new StringBuffer(new String(simpleCharStream61.GetSuffix(i121 + i122)));
                } else {
                    StringBuffer stringBuffer31 = this.image;
                    SimpleCharStream simpleCharStream62 = this.input_stream;
                    int i123 = this.jjimageLen;
                    int i124 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i124;
                    stringBuffer31.append(new String(simpleCharStream62.GetSuffix(i123 + i124)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_GLOBAL /* 37 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream63 = this.input_stream;
                    int i125 = this.jjimageLen;
                    int i126 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i126;
                    this.image = new StringBuffer(new String(simpleCharStream63.GetSuffix(i125 + i126)));
                } else {
                    StringBuffer stringBuffer32 = this.image;
                    SimpleCharStream simpleCharStream64 = this.input_stream;
                    int i127 = this.jjimageLen;
                    int i128 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i128;
                    stringBuffer32.append(new String(simpleCharStream64.GetSuffix(i127 + i128)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_ASSIGN /* 38 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream65 = this.input_stream;
                    int i129 = this.jjimageLen;
                    int i130 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i130;
                    this.image = new StringBuffer(new String(simpleCharStream65.GetSuffix(i129 + i130)));
                } else {
                    StringBuffer stringBuffer33 = this.image;
                    SimpleCharStream simpleCharStream66 = this.input_stream;
                    int i131 = this.jjimageLen;
                    int i132 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i132;
                    stringBuffer33.append(new String(simpleCharStream66.GetSuffix(i131 + i132)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_FUNCTION /* 39 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream67 = this.input_stream;
                    int i133 = this.jjimageLen;
                    int i134 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i134;
                    this.image = new StringBuffer(new String(simpleCharStream67.GetSuffix(i133 + i134)));
                } else {
                    StringBuffer stringBuffer34 = this.image;
                    SimpleCharStream simpleCharStream68 = this.input_stream;
                    int i135 = this.jjimageLen;
                    int i136 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i136;
                    stringBuffer34.append(new String(simpleCharStream68.GetSuffix(i135 + i136)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_MACRO /* 40 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream69 = this.input_stream;
                    int i137 = this.jjimageLen;
                    int i138 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i138;
                    this.image = new StringBuffer(new String(simpleCharStream69.GetSuffix(i137 + i138)));
                } else {
                    StringBuffer stringBuffer35 = this.image;
                    SimpleCharStream simpleCharStream70 = this.input_stream;
                    int i139 = this.jjimageLen;
                    int i140 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i140;
                    stringBuffer35.append(new String(simpleCharStream70.GetSuffix(i139 + i140)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_COMPRESS /* 41 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream71 = this.input_stream;
                    int i141 = this.jjimageLen;
                    int i142 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i142;
                    this.image = new StringBuffer(new String(simpleCharStream71.GetSuffix(i141 + i142)));
                } else {
                    StringBuffer stringBuffer36 = this.image;
                    SimpleCharStream simpleCharStream72 = this.input_stream;
                    int i143 = this.jjimageLen;
                    int i144 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i144;
                    stringBuffer36.append(new String(simpleCharStream72.GetSuffix(i143 + i144)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_TRANSFORM /* 42 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream73 = this.input_stream;
                    int i145 = this.jjimageLen;
                    int i146 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i146;
                    this.image = new StringBuffer(new String(simpleCharStream73.GetSuffix(i145 + i146)));
                } else {
                    StringBuffer stringBuffer37 = this.image;
                    SimpleCharStream simpleCharStream74 = this.input_stream;
                    int i147 = this.jjimageLen;
                    int i148 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i148;
                    stringBuffer37.append(new String(simpleCharStream74.GetSuffix(i147 + i148)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_SWITCH /* 43 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream75 = this.input_stream;
                    int i149 = this.jjimageLen;
                    int i150 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i150;
                    this.image = new StringBuffer(new String(simpleCharStream75.GetSuffix(i149 + i150)));
                } else {
                    StringBuffer stringBuffer38 = this.image;
                    SimpleCharStream simpleCharStream76 = this.input_stream;
                    int i151 = this.jjimageLen;
                    int i152 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i152;
                    stringBuffer38.append(new String(simpleCharStream76.GetSuffix(i151 + i152)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.ELSE /* 44 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream77 = this.input_stream;
                    int i153 = this.jjimageLen;
                    int i154 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i154;
                    this.image = new StringBuffer(new String(simpleCharStream77.GetSuffix(i153 + i154)));
                } else {
                    StringBuffer stringBuffer39 = this.image;
                    SimpleCharStream simpleCharStream78 = this.input_stream;
                    int i155 = this.jjimageLen;
                    int i156 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i156;
                    stringBuffer39.append(new String(simpleCharStream78.GetSuffix(i155 + i156)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.BREAK /* 45 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream79 = this.input_stream;
                    int i157 = this.jjimageLen;
                    int i158 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i158;
                    this.image = new StringBuffer(new String(simpleCharStream79.GetSuffix(i157 + i158)));
                } else {
                    StringBuffer stringBuffer40 = this.image;
                    SimpleCharStream simpleCharStream80 = this.input_stream;
                    int i159 = this.jjimageLen;
                    int i160 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i160;
                    stringBuffer40.append(new String(simpleCharStream80.GetSuffix(i159 + i160)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream81 = this.input_stream;
                    int i161 = this.jjimageLen;
                    int i162 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i162;
                    this.image = new StringBuffer(new String(simpleCharStream81.GetSuffix(i161 + i162)));
                } else {
                    StringBuffer stringBuffer41 = this.image;
                    SimpleCharStream simpleCharStream82 = this.input_stream;
                    int i163 = this.jjimageLen;
                    int i164 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i164;
                    stringBuffer41.append(new String(simpleCharStream82.GetSuffix(i163 + i164)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.HALT /* 47 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream83 = this.input_stream;
                    int i165 = this.jjimageLen;
                    int i166 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i166;
                    this.image = new StringBuffer(new String(simpleCharStream83.GetSuffix(i165 + i166)));
                } else {
                    StringBuffer stringBuffer42 = this.image;
                    SimpleCharStream simpleCharStream84 = this.input_stream;
                    int i167 = this.jjimageLen;
                    int i168 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i168;
                    stringBuffer42.append(new String(simpleCharStream84.GetSuffix(i167 + i168)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.FLUSH /* 48 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream85 = this.input_stream;
                    int i169 = this.jjimageLen;
                    int i170 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i170;
                    this.image = new StringBuffer(new String(simpleCharStream85.GetSuffix(i169 + i170)));
                } else {
                    StringBuffer stringBuffer43 = this.image;
                    SimpleCharStream simpleCharStream86 = this.input_stream;
                    int i171 = this.jjimageLen;
                    int i172 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i172;
                    stringBuffer43.append(new String(simpleCharStream86.GetSuffix(i171 + i172)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.TRIM /* 49 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream87 = this.input_stream;
                    int i173 = this.jjimageLen;
                    int i174 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i174;
                    this.image = new StringBuffer(new String(simpleCharStream87.GetSuffix(i173 + i174)));
                } else {
                    StringBuffer stringBuffer44 = this.image;
                    SimpleCharStream simpleCharStream88 = this.input_stream;
                    int i175 = this.jjimageLen;
                    int i176 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i176;
                    stringBuffer44.append(new String(simpleCharStream88.GetSuffix(i175 + i176)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.LTRIM /* 50 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream89 = this.input_stream;
                    int i177 = this.jjimageLen;
                    int i178 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i178;
                    this.image = new StringBuffer(new String(simpleCharStream89.GetSuffix(i177 + i178)));
                } else {
                    StringBuffer stringBuffer45 = this.image;
                    SimpleCharStream simpleCharStream90 = this.input_stream;
                    int i179 = this.jjimageLen;
                    int i180 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i180;
                    stringBuffer45.append(new String(simpleCharStream90.GetSuffix(i179 + i180)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.RTRIM /* 51 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream91 = this.input_stream;
                    int i181 = this.jjimageLen;
                    int i182 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i182;
                    this.image = new StringBuffer(new String(simpleCharStream91.GetSuffix(i181 + i182)));
                } else {
                    StringBuffer stringBuffer46 = this.image;
                    SimpleCharStream simpleCharStream92 = this.input_stream;
                    int i183 = this.jjimageLen;
                    int i184 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i184;
                    stringBuffer46.append(new String(simpleCharStream92.GetSuffix(i183 + i184)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.NOTRIM /* 52 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream93 = this.input_stream;
                    int i185 = this.jjimageLen;
                    int i186 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i186;
                    this.image = new StringBuffer(new String(simpleCharStream93.GetSuffix(i185 + i186)));
                } else {
                    StringBuffer stringBuffer47 = this.image;
                    SimpleCharStream simpleCharStream94 = this.input_stream;
                    int i187 = this.jjimageLen;
                    int i188 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i188;
                    stringBuffer47.append(new String(simpleCharStream94.GetSuffix(i187 + i188)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.DEFAUL /* 53 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream95 = this.input_stream;
                    int i189 = this.jjimageLen;
                    int i190 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i190;
                    this.image = new StringBuffer(new String(simpleCharStream95.GetSuffix(i189 + i190)));
                } else {
                    StringBuffer stringBuffer48 = this.image;
                    SimpleCharStream simpleCharStream96 = this.input_stream;
                    int i191 = this.jjimageLen;
                    int i192 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i192;
                    stringBuffer48.append(new String(simpleCharStream96.GetSuffix(i191 + i192)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream97 = this.input_stream;
                    int i193 = this.jjimageLen;
                    int i194 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i194;
                    this.image = new StringBuffer(new String(simpleCharStream97.GetSuffix(i193 + i194)));
                } else {
                    StringBuffer stringBuffer49 = this.image;
                    SimpleCharStream simpleCharStream98 = this.input_stream;
                    int i195 = this.jjimageLen;
                    int i196 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i196;
                    stringBuffer49.append(new String(simpleCharStream98.GetSuffix(i195 + i196)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.NESTED /* 55 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream99 = this.input_stream;
                    int i197 = this.jjimageLen;
                    int i198 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i198;
                    this.image = new StringBuffer(new String(simpleCharStream99.GetSuffix(i197 + i198)));
                } else {
                    StringBuffer stringBuffer50 = this.image;
                    SimpleCharStream simpleCharStream100 = this.input_stream;
                    int i199 = this.jjimageLen;
                    int i200 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i200;
                    stringBuffer50.append(new String(simpleCharStream100.GetSuffix(i199 + i200)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream101 = this.input_stream;
                    int i201 = this.jjimageLen;
                    int i202 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i202;
                    this.image = new StringBuffer(new String(simpleCharStream101.GetSuffix(i201 + i202)));
                } else {
                    StringBuffer stringBuffer51 = this.image;
                    SimpleCharStream simpleCharStream102 = this.input_stream;
                    int i203 = this.jjimageLen;
                    int i204 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i204;
                    stringBuffer51.append(new String(simpleCharStream102.GetSuffix(i203 + i204)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.RECURSE /* 57 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream103 = this.input_stream;
                    int i205 = this.jjimageLen;
                    int i206 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i206;
                    this.image = new StringBuffer(new String(simpleCharStream103.GetSuffix(i205 + i206)));
                } else {
                    StringBuffer stringBuffer52 = this.image;
                    SimpleCharStream simpleCharStream104 = this.input_stream;
                    int i207 = this.jjimageLen;
                    int i208 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i208;
                    stringBuffer52.append(new String(simpleCharStream104.GetSuffix(i207 + i208)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.FALLBACK /* 58 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream105 = this.input_stream;
                    int i209 = this.jjimageLen;
                    int i210 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i210;
                    this.image = new StringBuffer(new String(simpleCharStream105.GetSuffix(i209 + i210)));
                } else {
                    StringBuffer stringBuffer53 = this.image;
                    SimpleCharStream simpleCharStream106 = this.input_stream;
                    int i211 = this.jjimageLen;
                    int i212 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i212;
                    stringBuffer53.append(new String(simpleCharStream106.GetSuffix(i211 + i212)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.ESCAPE /* 59 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream107 = this.input_stream;
                    int i213 = this.jjimageLen;
                    int i214 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i214;
                    this.image = new StringBuffer(new String(simpleCharStream107.GetSuffix(i213 + i214)));
                } else {
                    StringBuffer stringBuffer54 = this.image;
                    SimpleCharStream simpleCharStream108 = this.input_stream;
                    int i215 = this.jjimageLen;
                    int i216 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i216;
                    stringBuffer54.append(new String(simpleCharStream108.GetSuffix(i215 + i216)));
                }
                strictSyntaxCheck(matchedToken, 2);
                return;
            case FMParserConstants.END_ESCAPE /* 60 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream109 = this.input_stream;
                    int i217 = this.jjimageLen;
                    int i218 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i218;
                    this.image = new StringBuffer(new String(simpleCharStream109.GetSuffix(i217 + i218)));
                } else {
                    StringBuffer stringBuffer55 = this.image;
                    SimpleCharStream simpleCharStream110 = this.input_stream;
                    int i219 = this.jjimageLen;
                    int i220 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i220;
                    stringBuffer55.append(new String(simpleCharStream110.GetSuffix(i219 + i220)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.NOESCAPE /* 61 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream111 = this.input_stream;
                    int i221 = this.jjimageLen;
                    int i222 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i222;
                    this.image = new StringBuffer(new String(simpleCharStream111.GetSuffix(i221 + i222)));
                } else {
                    StringBuffer stringBuffer56 = this.image;
                    SimpleCharStream simpleCharStream112 = this.input_stream;
                    int i223 = this.jjimageLen;
                    int i224 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i224;
                    stringBuffer56.append(new String(simpleCharStream112.GetSuffix(i223 + i224)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.END_NOESCAPE /* 62 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream113 = this.input_stream;
                    int i225 = this.jjimageLen;
                    int i226 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i226;
                    this.image = new StringBuffer(new String(simpleCharStream113.GetSuffix(i225 + i226)));
                } else {
                    StringBuffer stringBuffer57 = this.image;
                    SimpleCharStream simpleCharStream114 = this.input_stream;
                    int i227 = this.jjimageLen;
                    int i228 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i228;
                    stringBuffer57.append(new String(simpleCharStream114.GetSuffix(i227 + i228)));
                }
                strictSyntaxCheck(matchedToken, 0);
                return;
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream115 = this.input_stream;
                    int i229 = this.jjimageLen;
                    int i230 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i230;
                    this.image = new StringBuffer(new String(simpleCharStream115.GetSuffix(i229 + i230)));
                } else {
                    StringBuffer stringBuffer58 = this.image;
                    SimpleCharStream simpleCharStream116 = this.input_stream;
                    int i231 = this.jjimageLen;
                    int i232 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i232;
                    stringBuffer58.append(new String(simpleCharStream116.GetSuffix(i231 + i232)));
                }
                unifiedCall(matchedToken);
                return;
            case 64:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream117 = this.input_stream;
                    int i233 = this.jjimageLen;
                    int i234 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i234;
                    this.image = new StringBuffer(new String(simpleCharStream117.GetSuffix(i233 + i234)));
                } else {
                    StringBuffer stringBuffer59 = this.image;
                    SimpleCharStream simpleCharStream118 = this.input_stream;
                    int i235 = this.jjimageLen;
                    int i236 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i236;
                    stringBuffer59.append(new String(simpleCharStream118.GetSuffix(i235 + i236)));
                }
                unifiedCallEnd(matchedToken);
                return;
            case FMParserConstants.FTL_HEADER /* 65 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream119 = this.input_stream;
                    int i237 = this.jjimageLen;
                    int i238 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i238;
                    this.image = new StringBuffer(new String(simpleCharStream119.GetSuffix(i237 + i238)));
                } else {
                    StringBuffer stringBuffer60 = this.image;
                    SimpleCharStream simpleCharStream120 = this.input_stream;
                    int i239 = this.jjimageLen;
                    int i240 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i240;
                    stringBuffer60.append(new String(simpleCharStream120.GetSuffix(i239 + i240)));
                }
                ftlHeader(matchedToken);
                return;
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream121 = this.input_stream;
                    int i241 = this.jjimageLen;
                    int i242 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i242;
                    this.image = new StringBuffer(new String(simpleCharStream121.GetSuffix(i241 + i242)));
                } else {
                    StringBuffer stringBuffer61 = this.image;
                    SimpleCharStream simpleCharStream122 = this.input_stream;
                    int i243 = this.jjimageLen;
                    int i244 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i244;
                    stringBuffer61.append(new String(simpleCharStream122.GetSuffix(i243 + i244)));
                }
                ftlHeader(matchedToken);
                return;
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream123 = this.input_stream;
                    int i245 = this.jjimageLen;
                    int i246 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i246;
                    this.image = new StringBuffer(new String(simpleCharStream123.GetSuffix(i245 + i246)));
                } else {
                    StringBuffer stringBuffer62 = this.image;
                    SimpleCharStream simpleCharStream124 = this.input_stream;
                    int i247 = this.jjimageLen;
                    int i248 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i248;
                    stringBuffer62.append(new String(simpleCharStream124.GetSuffix(i247 + i248)));
                }
                if (!this.directiveSyntaxEstablished && this.incompatibleImprovements < 2003019) {
                    matchedToken.kind = 69;
                    return;
                }
                char firstChar = matchedToken.image.charAt(0);
                if (!this.directiveSyntaxEstablished && this.autodetectTagSyntax) {
                    this.squBracTagSyntax = firstChar == '[';
                    this.directiveSyntaxEstablished = true;
                }
                if (firstChar == '<' && this.squBracTagSyntax) {
                    matchedToken.kind = 69;
                    return;
                }
                if (firstChar == '[' && !this.squBracTagSyntax) {
                    matchedToken.kind = 69;
                    return;
                }
                if (this.strictEscapeSyntax) {
                    String s = matchedToken.image;
                    int index = s.indexOf(35);
                    String s2 = s.substring(index);
                    if (!s2.toLowerCase().equals(s2)) {
                        tip = "Directive names are all-lower-case.";
                    } else if (s2.equals("#set")) {
                        tip = "Use #assign or #local or #global, depending on the intented scope (#assign is template-scope).";
                    } else if (s2.equals("#else_if")) {
                        tip = "Use #elseif.";
                    } else if (s2.equals("#no_escape")) {
                        tip = "Use #noescape instead.";
                    } else if (s2.equals("#method")) {
                        tip = "Use #function instead.";
                    } else if (s2.equals("#head") || s2.equals("#template") || s2.equals("#fm")) {
                        tip = "You may meant #ftl.";
                    } else if (s2.equals("#try") || s2.equals("#atempt")) {
                        tip = "You may meant #attempt.";
                    } else if (s2.equals("#for") || s2.equals("#each") || s2.equals("#iterate") || s2.equals("#iterator")) {
                        tip = "You may meant #list (http://freemarker.org/docs/ref_directive_list.html).";
                    } else {
                        tip = new StringBuffer().append("Help (latest version): http://freemarker.org/docs/ref_directive_alphaidx.html; you're using FreeMarker ").append(Configuration.getVersion()).append(".").toString();
                    }
                    throw new TokenMgrError(new StringBuffer().append("Unknown directive: ").append(s2).append(tip != null ? new StringBuffer().append(". ").append(tip).toString() : "").toString(), 0, matchedToken.beginLine, matchedToken.beginColumn + 1);
                }
                return;
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
            case 73:
            case 74:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case FMParserConstants.ESCAPED_CHAR /* 80 */:
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.EQUALS /* 91 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.NOT_EQUALS /* 93 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.ESCAPED_GTE /* 97 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.ELLIPSIS /* 102 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.AND /* 105 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            case FMParserConstants.ID /* 120 */:
            case FMParserConstants.LETTER /* 122 */:
            case FMParserConstants.DIGIT /* 123 */:
            case FMParserConstants.NATURAL_GT /* 126 */:
            case FMParserConstants.NATURAL_GTE /* 127 */:
            case 128:
            case FMParserConstants.TERMINATING_EXCLAM /* 129 */:
            default:
                return;
            case FMParserConstants.OPEN_BRACKET /* 111 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[111]);
                } else {
                    this.image.append(jjstrLiteralImages[111]);
                }
                this.bracketNesting++;
                return;
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[112]);
                } else {
                    this.image.append(jjstrLiteralImages[112]);
                }
                closeBracket(matchedToken);
                return;
            case FMParserConstants.OPEN_PAREN /* 113 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[113]);
                } else {
                    this.image.append(jjstrLiteralImages[113]);
                }
                this.parenthesisNesting++;
                if (this.parenthesisNesting == 1) {
                    SwitchTo(3);
                    return;
                }
                return;
            case FMParserConstants.CLOSE_PAREN /* 114 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[114]);
                } else {
                    this.image.append(jjstrLiteralImages[114]);
                }
                this.parenthesisNesting--;
                if (this.parenthesisNesting == 0) {
                    if (!this.inInvocation) {
                        SwitchTo(2);
                        return;
                    } else {
                        SwitchTo(4);
                        return;
                    }
                }
                return;
            case FMParserConstants.OPEN_BRACE /* 115 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[115]);
                } else {
                    this.image.append(jjstrLiteralImages[115]);
                }
                this.hashLiteralNesting++;
                return;
            case FMParserConstants.CLOSE_BRACE /* 116 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[116]);
                } else {
                    this.image.append(jjstrLiteralImages[116]);
                }
                if (this.hashLiteralNesting == 0) {
                    SwitchTo(0);
                    return;
                } else {
                    this.hashLiteralNesting--;
                    return;
                }
            case FMParserConstants.OPEN_MISPLACED_INTERPOLATION /* 121 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream125 = this.input_stream;
                    int i249 = this.jjimageLen;
                    int i250 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i250;
                    this.image = new StringBuffer(new String(simpleCharStream125.GetSuffix(i249 + i250)));
                } else {
                    StringBuffer stringBuffer63 = this.image;
                    SimpleCharStream simpleCharStream126 = this.input_stream;
                    int i251 = this.jjimageLen;
                    int i252 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i252;
                    stringBuffer63.append(new String(simpleCharStream126.GetSuffix(i251 + i252)));
                }
                if ("".length() == 0) {
                    char c = matchedToken.image.charAt(0);
                    throw new TokenMgrError(new StringBuffer().append("You can't use \"").append(c).append("{\" here as you are already in FreeMarker-expression-mode. Thus, instead ").append("of ").append(c).append("{myExpression}, just write myExpression. ").append("(").append(c).append("{...} is only needed where otherwise static text is expected, i.e, outside FreeMarker tags and ").append("${...}-s.)").toString(), 0, matchedToken.beginLine, matchedToken.beginColumn + 1);
                }
                return;
            case FMParserConstants.DIRECTIVE_END /* 124 */:
                if (this.image == null) {
                    this.image = new StringBuffer(jjstrLiteralImages[124]);
                } else {
                    this.image.append(jjstrLiteralImages[124]);
                }
                if (this.inFTLHeader) {
                    eatNewline();
                }
                this.inFTLHeader = false;
                if (this.squBracTagSyntax) {
                    matchedToken.kind = FMParserConstants.NATURAL_GT;
                    return;
                } else {
                    SwitchTo(0);
                    return;
                }
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream127 = this.input_stream;
                    int i253 = this.jjimageLen;
                    int i254 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i254;
                    this.image = new StringBuffer(new String(simpleCharStream127.GetSuffix(i253 + i254)));
                } else {
                    StringBuffer stringBuffer64 = this.image;
                    SimpleCharStream simpleCharStream128 = this.input_stream;
                    int i255 = this.jjimageLen;
                    int i256 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i256;
                    stringBuffer64.append(new String(simpleCharStream128.GetSuffix(i255 + i256)));
                }
                if (this.inFTLHeader) {
                    eatNewline();
                }
                this.inFTLHeader = false;
                SwitchTo(0);
                return;
            case FMParserConstants.TERSE_COMMENT_END /* 130 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream129 = this.input_stream;
                    int i257 = this.jjimageLen;
                    int i258 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i258;
                    this.image = new StringBuffer(new String(simpleCharStream129.GetSuffix(i257 + i258)));
                } else {
                    StringBuffer stringBuffer65 = this.image;
                    SimpleCharStream simpleCharStream130 = this.input_stream;
                    int i259 = this.jjimageLen;
                    int i260 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i260;
                    stringBuffer65.append(new String(simpleCharStream130.GetSuffix(i259 + i260)));
                }
                if (this.noparseTag.equals("-->")) {
                    boolean squareBracket = matchedToken.image.endsWith("]");
                    if ((this.squBracTagSyntax && squareBracket) || (!this.squBracTagSyntax && !squareBracket)) {
                        SwitchTo(0);
                        return;
                    }
                    return;
                }
                return;
            case FMParserConstants.MAYBE_END /* 131 */:
                if (this.image == null) {
                    SimpleCharStream simpleCharStream131 = this.input_stream;
                    int i261 = this.jjimageLen;
                    int i262 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i262;
                    this.image = new StringBuffer(new String(simpleCharStream131.GetSuffix(i261 + i262)));
                } else {
                    StringBuffer stringBuffer66 = this.image;
                    SimpleCharStream simpleCharStream132 = this.input_stream;
                    int i263 = this.jjimageLen;
                    int i264 = this.jjmatchedPos + 1;
                    this.lengthOfMatch = i264;
                    stringBuffer66.append(new String(simpleCharStream132.GetSuffix(i263 + i264)));
                }
                StringTokenizer st = new StringTokenizer(this.image.toString(), " \t\n\r<>[]/#", false);
                if (st.nextToken().equals(this.noparseTag)) {
                    SwitchTo(0);
                    return;
                }
                return;
        }
    }
}
