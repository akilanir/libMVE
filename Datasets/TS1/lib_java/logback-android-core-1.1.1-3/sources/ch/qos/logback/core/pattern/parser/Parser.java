package ch.qos.logback.core.pattern.parser;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.pattern.Converter;
import ch.qos.logback.core.pattern.FormatInfo;
import ch.qos.logback.core.pattern.IdentityCompositeConverter;
import ch.qos.logback.core.pattern.ReplacingCompositeConverter;
import ch.qos.logback.core.pattern.util.IEscapeUtil;
import ch.qos.logback.core.pattern.util.RegularEscapeUtil;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.ScanException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/Parser.class */
public class Parser<E> extends ContextAwareBase {
    public static final String MISSING_RIGHT_PARENTHESIS = "http://logback.qos.ch/codes.html#missingRightParenthesis";
    public static final Map<String, String> DEFAULT_COMPOSITE_CONVERTER_MAP = new HashMap();
    public static final String REPLACE_CONVERTER_WORD = "replace";
    final List tokenList;
    int pointer;

    Parser(TokenStream tokenStream) throws ScanException {
        this.pointer = 0;
        this.tokenList = tokenStream.tokenize();
    }

    public Parser(String str) throws ScanException {
        this(str, new RegularEscapeUtil());
    }

    public Parser(String str, IEscapeUtil iEscapeUtil) throws ScanException {
        this.pointer = 0;
        try {
            this.tokenList = new TokenStream(str, iEscapeUtil).tokenize();
        } catch (IllegalArgumentException e) {
            throw new ScanException("Failed to initialize Parser", e);
        }
    }

    public Converter<E> compile(Node node, Map map) {
        Compiler compiler = new Compiler(node, map);
        compiler.setContext(this.context);
        return compiler.compile();
    }

    public Node parse() throws ScanException {
        return E();
    }

    Node E() throws ScanException {
        Node T = T();
        if (T == null) {
            return null;
        }
        Node Eopt = Eopt();
        if (Eopt != null) {
            T.setNext(Eopt);
        }
        return T;
    }

    Node Eopt() throws ScanException {
        if (getCurentToken() == null) {
            return null;
        }
        return E();
    }

    Node T() throws ScanException {
        FormattingNode C;
        Token curentToken = getCurentToken();
        expectNotNull(curentToken, "a LITERAL or '%'");
        switch (curentToken.getType()) {
            case CoreConstants.PERCENT_CHAR /* 37 */:
                advanceTokenPointer();
                Token curentToken2 = getCurentToken();
                expectNotNull(curentToken2, "a FORMAT_MODIFIER, SIMPLE_KEYWORD or COMPOUND_KEYWORD");
                if (curentToken2.getType() == 1002) {
                    FormatInfo valueOf = FormatInfo.valueOf((String) curentToken2.getValue());
                    advanceTokenPointer();
                    C = C();
                    C.setFormatInfo(valueOf);
                } else {
                    C = C();
                }
                return C;
            case CoreConstants.MILLIS_IN_ONE_SECOND /* 1000 */:
                advanceTokenPointer();
                return new Node(0, curentToken.getValue());
            default:
                return null;
        }
    }

    FormattingNode C() throws ScanException {
        Token curentToken = getCurentToken();
        expectNotNull(curentToken, "a LEFT_PARENTHESIS or KEYWORD");
        switch (curentToken.getType()) {
            case 1004:
                return SINGLE();
            case 1005:
                advanceTokenPointer();
                return COMPOSITE(curentToken.getValue().toString());
            default:
                throw new IllegalStateException("Unexpected token " + curentToken);
        }
    }

    FormattingNode SINGLE() throws ScanException {
        SimpleKeywordNode simpleKeywordNode = new SimpleKeywordNode(getNextToken().getValue());
        Token curentToken = getCurentToken();
        if (curentToken != null && curentToken.getType() == 1006) {
            simpleKeywordNode.setOptions((List) curentToken.getValue());
            advanceTokenPointer();
        }
        return simpleKeywordNode;
    }

    FormattingNode COMPOSITE(String str) throws ScanException {
        CompositeNode compositeNode = new CompositeNode(str);
        compositeNode.setChildNode(E());
        Token nextToken = getNextToken();
        if (nextToken == null || nextToken.getType() != 41) {
            String str2 = "Expecting RIGHT_PARENTHESIS token but got " + nextToken;
            addError(str2);
            addError("See also http://logback.qos.ch/codes.html#missingRightParenthesis");
            throw new ScanException(str2);
        }
        Token curentToken = getCurentToken();
        if (curentToken != null && curentToken.getType() == 1006) {
            compositeNode.setOptions((List) curentToken.getValue());
            advanceTokenPointer();
        }
        return compositeNode;
    }

    Token getNextToken() {
        if (this.pointer >= this.tokenList.size()) {
            return null;
        }
        List list = this.tokenList;
        int i = this.pointer;
        this.pointer = i + 1;
        return (Token) list.get(i);
    }

    Token getCurentToken() {
        if (this.pointer < this.tokenList.size()) {
            return (Token) this.tokenList.get(this.pointer);
        }
        return null;
    }

    void advanceTokenPointer() {
        this.pointer++;
    }

    void expectNotNull(Token token, String str) {
        if (token == null) {
            throw new IllegalStateException("All tokens consumed but was expecting " + str);
        }
    }

    static {
        DEFAULT_COMPOSITE_CONVERTER_MAP.put(Token.BARE_COMPOSITE_KEYWORD_TOKEN.getValue().toString(), IdentityCompositeConverter.class.getName());
        DEFAULT_COMPOSITE_CONVERTER_MAP.put(REPLACE_CONVERTER_WORD, ReplacingCompositeConverter.class.getName());
    }
}
