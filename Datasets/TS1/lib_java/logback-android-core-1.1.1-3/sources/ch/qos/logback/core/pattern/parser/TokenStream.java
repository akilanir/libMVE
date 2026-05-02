package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.pattern.util.IEscapeUtil;
import ch.qos.logback.core.pattern.util.RegularEscapeUtil;
import ch.qos.logback.core.pattern.util.RestrictedEscapeUtil;
import ch.qos.logback.core.spi.ScanException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/TokenStream.class */
class TokenStream {
    final String pattern;
    final int patternLength;
    final IEscapeUtil escapeUtil;
    final IEscapeUtil optionEscapeUtil;
    TokenizerState state;
    int pointer;

    /* renamed from: ch.qos.logback.core.pattern.parser.TokenStream$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/TokenStream$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState = new int[TokenizerState.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[TokenizerState.LITERAL_STATE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[TokenizerState.FORMAT_MODIFIER_STATE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[TokenizerState.OPTION_STATE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[TokenizerState.KEYWORD_STATE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[TokenizerState.RIGHT_PARENTHESIS_STATE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/TokenStream$TokenizerState.class */
    enum TokenizerState {
        LITERAL_STATE,
        FORMAT_MODIFIER_STATE,
        KEYWORD_STATE,
        OPTION_STATE,
        RIGHT_PARENTHESIS_STATE
    }

    TokenStream(String str) {
        this(str, new RegularEscapeUtil());
    }

    TokenStream(String str, IEscapeUtil iEscapeUtil) {
        this.optionEscapeUtil = new RestrictedEscapeUtil();
        this.state = TokenizerState.LITERAL_STATE;
        this.pointer = 0;
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("null or empty pattern string not allowed");
        }
        this.pattern = str;
        this.patternLength = str.length();
        this.escapeUtil = iEscapeUtil;
    }

    List tokenize() throws ScanException {
        ArrayList arrayList = new ArrayList();
        StringBuffer stringBuffer = new StringBuffer();
        while (this.pointer < this.patternLength) {
            char charAt = this.pattern.charAt(this.pointer);
            this.pointer++;
            switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[this.state.ordinal()]) {
                case 1:
                    handleLiteralState(charAt, arrayList, stringBuffer);
                    break;
                case 2:
                    handleFormatModifierState(charAt, arrayList, stringBuffer);
                    break;
                case SyslogConstants.ERROR_SEVERITY /* 3 */:
                    processOption(charAt, arrayList, stringBuffer);
                    break;
                case 4:
                    handleKeywordState(charAt, arrayList, stringBuffer);
                    break;
                case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                    handleRightParenthesisState(charAt, arrayList, stringBuffer);
                    break;
            }
        }
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState[this.state.ordinal()]) {
            case 1:
                addValuedToken(CoreConstants.MILLIS_IN_ONE_SECOND, stringBuffer, arrayList);
                break;
            case 2:
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                throw new ScanException("Unexpected end of pattern string");
            case 4:
                arrayList.add(new Token(1004, stringBuffer.toString()));
                break;
            case SyslogConstants.NOTICE_SEVERITY /* 5 */:
                arrayList.add(Token.RIGHT_PARENTHESIS_TOKEN);
                break;
        }
        return arrayList;
    }

    private void handleRightParenthesisState(char c, List<Token> list, StringBuffer stringBuffer) {
        list.add(Token.RIGHT_PARENTHESIS_TOKEN);
        switch (c) {
            case CoreConstants.RIGHT_PARENTHESIS_CHAR /* 41 */:
                break;
            case CoreConstants.ESCAPE_CHAR /* 92 */:
                escape("%{}", stringBuffer);
                this.state = TokenizerState.LITERAL_STATE;
                break;
            case CoreConstants.CURLY_LEFT /* 123 */:
                this.state = TokenizerState.OPTION_STATE;
                break;
            default:
                stringBuffer.append(c);
                this.state = TokenizerState.LITERAL_STATE;
                break;
        }
    }

    private void processOption(char c, List<Token> list, StringBuffer stringBuffer) throws ScanException {
        new OptionTokenizer(this).tokenize(c, list);
    }

    private void handleFormatModifierState(char c, List<Token> list, StringBuffer stringBuffer) {
        if (c == '(') {
            addValuedToken(1002, stringBuffer, list);
            list.add(Token.BARE_COMPOSITE_KEYWORD_TOKEN);
            this.state = TokenizerState.LITERAL_STATE;
        } else {
            if (!Character.isJavaIdentifierStart(c)) {
                stringBuffer.append(c);
                return;
            }
            addValuedToken(1002, stringBuffer, list);
            this.state = TokenizerState.KEYWORD_STATE;
            stringBuffer.append(c);
        }
    }

    private void handleLiteralState(char c, List<Token> list, StringBuffer stringBuffer) {
        switch (c) {
            case CoreConstants.PERCENT_CHAR /* 37 */:
                addValuedToken(CoreConstants.MILLIS_IN_ONE_SECOND, stringBuffer, list);
                list.add(Token.PERCENT_TOKEN);
                this.state = TokenizerState.FORMAT_MODIFIER_STATE;
                break;
            case CoreConstants.RIGHT_PARENTHESIS_CHAR /* 41 */:
                addValuedToken(CoreConstants.MILLIS_IN_ONE_SECOND, stringBuffer, list);
                this.state = TokenizerState.RIGHT_PARENTHESIS_STATE;
                break;
            case CoreConstants.ESCAPE_CHAR /* 92 */:
                escape("%()", stringBuffer);
                break;
            default:
                stringBuffer.append(c);
                break;
        }
    }

    private void handleKeywordState(char c, List<Token> list, StringBuffer stringBuffer) {
        if (Character.isJavaIdentifierPart(c)) {
            stringBuffer.append(c);
            return;
        }
        if (c == '{') {
            addValuedToken(1004, stringBuffer, list);
            this.state = TokenizerState.OPTION_STATE;
            return;
        }
        if (c == '(') {
            addValuedToken(1005, stringBuffer, list);
            this.state = TokenizerState.LITERAL_STATE;
            return;
        }
        if (c == '%') {
            addValuedToken(1004, stringBuffer, list);
            list.add(Token.PERCENT_TOKEN);
            this.state = TokenizerState.FORMAT_MODIFIER_STATE;
        } else {
            if (c == ')') {
                addValuedToken(1004, stringBuffer, list);
                this.state = TokenizerState.RIGHT_PARENTHESIS_STATE;
                return;
            }
            addValuedToken(1004, stringBuffer, list);
            if (c != '\\') {
                stringBuffer.append(c);
            } else if (this.pointer < this.patternLength) {
                String str = this.pattern;
                int i = this.pointer;
                this.pointer = i + 1;
                this.escapeUtil.escape("%()", stringBuffer, str.charAt(i), this.pointer);
            }
            this.state = TokenizerState.LITERAL_STATE;
        }
    }

    void escape(String str, StringBuffer stringBuffer) {
        if (this.pointer < this.patternLength) {
            String str2 = this.pattern;
            int i = this.pointer;
            this.pointer = i + 1;
            this.escapeUtil.escape(str, stringBuffer, str2.charAt(i), this.pointer);
        }
    }

    void optionEscape(String str, StringBuffer stringBuffer) {
        if (this.pointer < this.patternLength) {
            String str2 = this.pattern;
            int i = this.pointer;
            this.pointer = i + 1;
            this.optionEscapeUtil.escape(str, stringBuffer, str2.charAt(i), this.pointer);
        }
    }

    private void addValuedToken(int i, StringBuffer stringBuffer, List<Token> list) {
        if (stringBuffer.length() > 0) {
            list.add(new Token(i, stringBuffer.toString()));
            stringBuffer.setLength(0);
        }
    }
}
