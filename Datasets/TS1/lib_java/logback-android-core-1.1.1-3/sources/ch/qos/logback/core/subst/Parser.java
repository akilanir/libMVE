package ch.qos.logback.core.subst;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.net.SyslogConstants;
import ch.qos.logback.core.spi.ScanException;
import ch.qos.logback.core.subst.Node;
import ch.qos.logback.core.subst.Token;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Parser.class */
public class Parser {
    final List<Token> tokenList;
    int pointer = 0;

    /* renamed from: ch.qos.logback.core.subst.Parser$1, reason: invalid class name */
    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Parser$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$ch$qos$logback$core$subst$Token$Type = new int[Token.Type.values().length];

        static {
            try {
                $SwitchMap$ch$qos$logback$core$subst$Token$Type[Token.Type.LITERAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$subst$Token$Type[Token.Type.CURLY_LEFT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$ch$qos$logback$core$subst$Token$Type[Token.Type.START.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public Parser(List<Token> list) {
        this.tokenList = list;
    }

    public Node parse() throws ScanException {
        return E();
    }

    private Node E() throws ScanException {
        Node T = T();
        if (T == null) {
            return null;
        }
        Node Eopt = Eopt();
        if (Eopt != null) {
            T.append(Eopt);
        }
        return T;
    }

    private Node Eopt() throws ScanException {
        if (peekAtCurentToken() == null) {
            return null;
        }
        return E();
    }

    private Node T() throws ScanException {
        Token peekAtCurentToken = peekAtCurentToken();
        if (peekAtCurentToken == null) {
            return null;
        }
        switch (AnonymousClass1.$SwitchMap$ch$qos$logback$core$subst$Token$Type[peekAtCurentToken.type.ordinal()]) {
            case 1:
                advanceTokenPointer();
                return makeNewLiteralNode(peekAtCurentToken.payload);
            case 2:
                advanceTokenPointer();
                Node C = C();
                expectCurlyRight(peekAtCurentToken());
                advanceTokenPointer();
                Node makeNewLiteralNode = makeNewLiteralNode(CoreConstants.LEFT_ACCOLADE);
                makeNewLiteralNode.append(C);
                makeNewLiteralNode.append(makeNewLiteralNode(CoreConstants.RIGHT_ACCOLADE));
                return makeNewLiteralNode;
            case SyslogConstants.ERROR_SEVERITY /* 3 */:
                advanceTokenPointer();
                Node V = V();
                expectCurlyRight(peekAtCurentToken());
                advanceTokenPointer();
                return V;
            default:
                return null;
        }
    }

    private Node makeNewLiteralNode(String str) {
        return new Node(Node.Type.LITERAL, str);
    }

    private Node V() throws ScanException {
        Node node = new Node(Node.Type.VARIABLE, E());
        if (isDefaultToken(peekAtCurentToken())) {
            advanceTokenPointer();
            node.defaultPart = E();
        }
        return node;
    }

    private Node C() throws ScanException {
        Node E = E();
        if (isDefaultToken(peekAtCurentToken())) {
            advanceTokenPointer();
            E.append(makeNewLiteralNode(CoreConstants.DEFAULT_VALUE_SEPARATOR));
            E.append(E());
        }
        return E;
    }

    private boolean isDefaultToken(Token token) {
        return token != null && token.type == Token.Type.DEFAULT;
    }

    void advanceTokenPointer() {
        this.pointer++;
    }

    void expectNotNull(Token token, String str) {
        if (token == null) {
            throw new IllegalArgumentException("All tokens consumed but was expecting \"" + str + "\"");
        }
    }

    void expectCurlyRight(Token token) throws ScanException {
        expectNotNull(token, "}");
        if (token.type != Token.Type.CURLY_RIGHT) {
            throw new ScanException("Expecting }");
        }
    }

    Token peekAtCurentToken() {
        if (this.pointer < this.tokenList.size()) {
            return this.tokenList.get(this.pointer);
        }
        return null;
    }
}
