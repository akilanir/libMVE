package ch.qos.logback.core.subst;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.spi.ScanException;
import ch.qos.logback.core.subst.Token;
import java.util.ArrayList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Tokenizer.class */
public class Tokenizer {
    final String pattern;
    final int patternLength;
    TokenizerState state = TokenizerState.LITERAL_STATE;
    int pointer = 0;

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Tokenizer$TokenizerState.class */
    enum TokenizerState {
        LITERAL_STATE,
        START_STATE,
        DEFAULT_VAL_STATE
    }

    public Tokenizer(String str) {
        this.pattern = str;
        this.patternLength = str.length();
    }

    List<Token> tokenize() throws ScanException {
        ArrayList arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        while (this.pointer < this.patternLength) {
            char charAt = this.pattern.charAt(this.pointer);
            this.pointer++;
            switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$subst$Tokenizer$TokenizerState[this.state.ordinal()]) {
                case 1:
                    handleLiteralState(charAt, arrayList, sb);
                    break;
                case 2:
                    handleStartState(charAt, arrayList, sb);
                    break;
                case SyslogConstants.ERROR_SEVERITY /* 3 */:
                    handleDefaultValueState(charAt, arrayList, sb);
                    break;
            }
        }
        switch (this.state) {
            case LITERAL_STATE:
                addLiteralToken(arrayList, sb);
                break;
            case START_STATE:
                throw new ScanException("Unexpected end of pattern string");
        }
        return arrayList;
    }

    private void handleDefaultValueState(char c, List<Token> list, StringBuilder sb) {
        switch (c) {
            case CoreConstants.DOLLAR /* 36 */:
                sb.append(':');
                addLiteralToken(list, sb);
                sb.setLength(0);
                this.state = TokenizerState.START_STATE;
                break;
            case CoreConstants.DASH_CHAR /* 45 */:
                list.add(Token.DEFAULT_SEP_TOKEN);
                this.state = TokenizerState.LITERAL_STATE;
                break;
            default:
                sb.append(':').append(c);
                this.state = TokenizerState.LITERAL_STATE;
                break;
        }
    }

    private void handleStartState(char c, List<Token> list, StringBuilder sb) {
        if (c == '{') {
            list.add(Token.START_TOKEN);
        } else {
            sb.append('$').append(c);
        }
        this.state = TokenizerState.LITERAL_STATE;
    }

    private void handleLiteralState(char c, List<Token> list, StringBuilder sb) {
        if (c == '$') {
            addLiteralToken(list, sb);
            sb.setLength(0);
            this.state = TokenizerState.START_STATE;
            return;
        }
        if (c == ':') {
            addLiteralToken(list, sb);
            sb.setLength(0);
            this.state = TokenizerState.DEFAULT_VAL_STATE;
        } else if (c == '{') {
            addLiteralToken(list, sb);
            list.add(Token.CURLY_LEFT_TOKEN);
            sb.setLength(0);
        } else {
            if (c != '}') {
                sb.append(c);
                return;
            }
            addLiteralToken(list, sb);
            list.add(Token.CURLY_RIGHT_TOKEN);
            sb.setLength(0);
        }
    }

    private void addLiteralToken(List<Token> list, StringBuilder sb) {
        if (sb.length() == 0) {
            return;
        }
        list.add(new Token(Token.Type.LITERAL, sb.toString()));
    }
}
