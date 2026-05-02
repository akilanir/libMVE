package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.pattern.parser.TokenStream;
import ch.qos.logback.core.pattern.util.AsIsEscapeUtil;
import ch.qos.logback.core.pattern.util.IEscapeUtil;
import ch.qos.logback.core.spi.ScanException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/OptionTokenizer.class */
public class OptionTokenizer {
    private static final int EXPECTING_STATE = 0;
    private static final int RAW_COLLECTING_STATE = 1;
    private static final int QUOTED_COLLECTING_STATE = 2;
    final IEscapeUtil escapeUtil;
    final TokenStream tokenStream;
    final String pattern;
    final int patternLength;
    char quoteChar;
    int state;

    OptionTokenizer(TokenStream tokenStream) {
        this(tokenStream, new AsIsEscapeUtil());
    }

    OptionTokenizer(TokenStream tokenStream, IEscapeUtil iEscapeUtil) {
        this.state = 0;
        this.tokenStream = tokenStream;
        this.pattern = tokenStream.pattern;
        this.patternLength = tokenStream.patternLength;
        this.escapeUtil = iEscapeUtil;
    }

    void tokenize(char c, List<Token> list) throws ScanException {
        StringBuffer stringBuffer = new StringBuffer();
        ArrayList arrayList = new ArrayList();
        char c2 = c;
        while (this.tokenStream.pointer < this.patternLength) {
            switch (this.state) {
                case 0:
                    switch (c2) {
                        case CoreConstants.TAB /* 9 */:
                        case '\n':
                        case '\r':
                        case ' ':
                        case CoreConstants.COMMA_CHAR /* 44 */:
                            break;
                        case CoreConstants.DOUBLE_QUOTE_CHAR /* 34 */:
                        case CoreConstants.SINGLE_QUOTE_CHAR /* 39 */:
                            this.state = 2;
                            this.quoteChar = c2;
                            break;
                        case CoreConstants.CURLY_RIGHT /* 125 */:
                            emitOptionToken(list, arrayList);
                            return;
                        default:
                            stringBuffer.append(c2);
                            this.state = 1;
                            break;
                    }
                case 1:
                    switch (c2) {
                        case CoreConstants.COMMA_CHAR /* 44 */:
                            arrayList.add(stringBuffer.toString().trim());
                            stringBuffer.setLength(0);
                            this.state = 0;
                            break;
                        case CoreConstants.CURLY_RIGHT /* 125 */:
                            arrayList.add(stringBuffer.toString().trim());
                            emitOptionToken(list, arrayList);
                            return;
                        default:
                            stringBuffer.append(c2);
                            break;
                    }
                case 2:
                    if (c2 != this.quoteChar) {
                        if (c2 != '\\') {
                            stringBuffer.append(c2);
                            break;
                        } else {
                            escape(String.valueOf(this.quoteChar), stringBuffer);
                            break;
                        }
                    } else {
                        arrayList.add(stringBuffer.toString());
                        stringBuffer.setLength(0);
                        this.state = 0;
                        break;
                    }
            }
            c2 = this.pattern.charAt(this.tokenStream.pointer);
            this.tokenStream.pointer++;
        }
        if (c2 != '}') {
            throw new ScanException("Unexpected end of pattern string in OptionTokenizer");
        }
        if (this.state == 0) {
            emitOptionToken(list, arrayList);
        } else {
            if (this.state != 1) {
                throw new ScanException("Unexpected end of pattern string in OptionTokenizer");
            }
            arrayList.add(stringBuffer.toString().trim());
            emitOptionToken(list, arrayList);
        }
    }

    void emitOptionToken(List<Token> list, List<String> list2) {
        list.add(new Token(1006, list2));
        this.tokenStream.state = TokenStream.TokenizerState.LITERAL_STATE;
    }

    void escape(String str, StringBuffer stringBuffer) {
        if (this.tokenStream.pointer < this.patternLength) {
            String str2 = this.pattern;
            TokenStream tokenStream = this.tokenStream;
            int i = tokenStream.pointer;
            tokenStream.pointer = i + 1;
            this.escapeUtil.escape(str, stringBuffer, str2.charAt(i), this.tokenStream.pointer);
        }
    }
}
