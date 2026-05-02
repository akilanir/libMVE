package freemarker.core;

import freemarker.debug.DebugModel;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.StringUtil;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.Vector;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/FMParser.class */
public class FMParser implements FMParserConstants {
    private Template template;
    private int loopNesting;
    private int switchNesting;
    private boolean inMacro;
    private boolean inFunction;
    private boolean stripWhitespace;
    private boolean stripText;
    private LinkedList escapes;
    private int contentNesting;
    private int incompatibleImprovements;
    public FMParserTokenManager token_source;
    SimpleCharStream jj_input_stream;
    public Token token;
    public Token jj_nt;
    private int jj_ntk;
    private Token jj_scanpos;
    private Token jj_lastpos;
    private int jj_la;
    public boolean lookingAhead;
    private boolean jj_semLA;
    private int jj_gen;
    private final int[] jj_la1;
    private static int[] jj_la1_0;
    private static int[] jj_la1_1;
    private static int[] jj_la1_2;
    private static int[] jj_la1_3;
    private static int[] jj_la1_4;
    private final JJCalls[] jj_2_rtns;
    private boolean jj_rescan;
    private int jj_gc;
    private final LookaheadSuccess jj_ls;
    private Vector jj_expentries;
    private int[] jj_expentry;
    private int jj_kind;
    private int[] jj_lasttokens;
    private int jj_endpos;

    /* renamed from: freemarker.core.FMParser$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/FMParser$1.class */
    static class AnonymousClass1 {
    }

    public static FMParser createExpressionParser(String s) {
        SimpleCharStream scs = new SimpleCharStream(new StringReader(s), 1, 1, s.length());
        FMParserTokenManager token_source = new FMParserTokenManager(scs);
        token_source.SwitchTo(2);
        FMParser parser = new FMParser(token_source);
        token_source.setParser(parser);
        return parser;
    }

    public FMParser(Template template, Reader reader, boolean strictEscapeSyntax, boolean stripWhitespace) {
        this(reader);
        setTemplate(template);
        this.token_source.setParser(this);
        this.token_source.strictEscapeSyntax = strictEscapeSyntax;
        this.stripWhitespace = stripWhitespace;
    }

    public FMParser(Template template, Reader reader, boolean strictEscapeSyntax, boolean stripWhitespace, int tagSyntax) {
        this(template, reader, strictEscapeSyntax, stripWhitespace, tagSyntax, Configuration.PARSED_DEFAULT_INCOMPATIBLE_ENHANCEMENTS);
    }

    public FMParser(Template template, Reader reader, boolean strictEscapeSyntax, boolean stripWhitespace, int tagSyntax, int incompatibleImprovements) {
        this(template, reader, strictEscapeSyntax, stripWhitespace);
        switch (tagSyntax) {
            case 0:
                this.token_source.autodetectTagSyntax = true;
                break;
            case 1:
                this.token_source.squBracTagSyntax = false;
                break;
            case 2:
                this.token_source.squBracTagSyntax = true;
                break;
            default:
                throw new IllegalArgumentException("Illegal argument for tagSyntax");
        }
        this.token_source.incompatibleImprovements = incompatibleImprovements;
        this.incompatibleImprovements = incompatibleImprovements;
    }

    public FMParser(String template) {
        this(null, new StringReader(template), true, true);
    }

    void setTemplate(Template template) {
        this.template = template;
    }

    Template getTemplate() {
        return this.template;
    }

    public int _getLastTagSyntax() {
        return this.token_source.squBracTagSyntax ? 2 : 1;
    }

    private void notStringLiteral(Expression exp, String expected) throws ParseException {
        if (exp instanceof StringLiteral) {
            throw new ParseException(new StringBuffer().append("Found string literal: ").append(exp).append(". Expecting: ").append(expected).toString(), exp);
        }
    }

    private void notNumberLiteral(Expression exp, String expected) throws ParseException {
        if (exp instanceof NumberLiteral) {
            throw new ParseException(new StringBuffer().append("Found number literal: ").append(exp.getCanonicalForm()).append(". Expecting ").append(expected).toString(), exp);
        }
    }

    private void notBooleanLiteral(Expression exp, String expected) throws ParseException {
        if (exp instanceof BooleanLiteral) {
            throw new ParseException(new StringBuffer().append("Found: ").append(exp.getCanonicalForm()).append(". Expecting ").append(expected).toString(), exp);
        }
    }

    private void notHashLiteral(Expression exp, String expected) throws ParseException {
        if (exp instanceof HashLiteral) {
            throw new ParseException(new StringBuffer().append("Found hash literal: ").append(exp.getCanonicalForm()).append(". Expecting ").append(expected).toString(), exp);
        }
    }

    private void notListLiteral(Expression exp, String expected) throws ParseException {
        if (exp instanceof ListLiteral) {
            throw new ParseException(new StringBuffer().append("Found list literal: ").append(exp.getCanonicalForm()).append(". Expecting ").append(expected).toString(), exp);
        }
    }

    private void numberLiteralOnly(Expression exp) throws ParseException {
        notStringLiteral(exp, "number");
        notListLiteral(exp, "number");
        notHashLiteral(exp, "number");
        notBooleanLiteral(exp, "number");
    }

    private void stringLiteralOnly(Expression exp) throws ParseException {
        notNumberLiteral(exp, "string");
        notListLiteral(exp, "string");
        notHashLiteral(exp, "string");
        notBooleanLiteral(exp, "string");
    }

    private void booleanLiteralOnly(Expression exp) throws ParseException {
        notStringLiteral(exp, "boolean (true/false)");
        notListLiteral(exp, "boolean (true/false)");
        notHashLiteral(exp, "boolean (true/false)");
        notNumberLiteral(exp, "boolean (true/false)");
    }

    private Expression escapedExpression(Expression exp) {
        if (!this.escapes.isEmpty()) {
            return ((EscapeBlock) this.escapes.getFirst()).doEscape(exp);
        }
        return exp;
    }

    private boolean getBoolean(Expression exp) throws ParseException {
        try {
            TemplateModel tm = exp.eval(null);
            if (tm instanceof TemplateBooleanModel) {
                try {
                    return ((TemplateBooleanModel) tm).getAsBoolean();
                } catch (TemplateModelException e) {
                }
            }
            if (tm instanceof TemplateScalarModel) {
                try {
                    return StringUtil.getYesNo(((TemplateScalarModel) tm).getAsString());
                } catch (Exception e2) {
                    throw new ParseException(new StringBuffer().append(e2.getMessage()).append("\nExpecting boolean (true/false), found: ").append(exp.getCanonicalForm()).toString(), exp);
                }
            }
            throw new ParseException("Expecting boolean (true/false) parameter", exp);
        } catch (Exception e3) {
            throw new ParseException(new StringBuffer().append(e3.getMessage()).append("\nCould not evaluate expression: ").append(exp.getCanonicalForm()).toString(), exp, e3);
        }
    }

    public final Expression Expression() throws ParseException {
        Expression exp = OrExpression();
        return exp;
    }

    public final Expression PrimaryExpression() throws ParseException {
        Expression BuiltinVariable;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
                BuiltinVariable = StringLiteral(true);
                break;
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
                BuiltinVariable = BooleanLiteral();
                break;
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
                BuiltinVariable = NumberLiteral();
                break;
            case FMParserConstants.DOT /* 87 */:
                BuiltinVariable = BuiltinVariable();
                break;
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
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.CLOSE_BRACE /* 116 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            default:
                this.jj_la1[0] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
            case FMParserConstants.OPEN_BRACKET /* 111 */:
                BuiltinVariable = ListLiteral();
                break;
            case FMParserConstants.OPEN_PAREN /* 113 */:
                BuiltinVariable = Parenthesis();
                break;
            case FMParserConstants.OPEN_BRACE /* 115 */:
                BuiltinVariable = HashLiteral();
                break;
            case FMParserConstants.ID /* 120 */:
                BuiltinVariable = Identifier();
                break;
        }
        while (true) {
            Expression exp = BuiltinVariable;
            if (jj_2_1(Integer.MAX_VALUE)) {
                BuiltinVariable = AddSubExpression(exp);
            } else {
                return exp;
            }
        }
    }

    public final Expression Parenthesis() throws ParseException {
        Token start = jj_consume_token(FMParserConstants.OPEN_PAREN);
        Expression exp = Expression();
        Token end = jj_consume_token(FMParserConstants.CLOSE_PAREN);
        Expression result = new ParentheticalExpression(exp);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final Expression UnaryExpression() throws ParseException {
        Expression result;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.ID /* 120 */:
                result = PrimaryExpression();
                break;
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
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.ELLIPSIS /* 102 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.AND /* 105 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.CLOSE_BRACE /* 116 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            default:
                this.jj_la1[1] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
                result = UnaryPlusMinusExpression();
                break;
            case FMParserConstants.EXCLAM /* 107 */:
                result = NotExpression();
                break;
        }
        return result;
    }

    public final Expression NotExpression() throws ParseException {
        Expression result = null;
        ArrayList nots = new ArrayList();
        while (true) {
            Token t = jj_consume_token(FMParserConstants.EXCLAM);
            nots.add(t);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.EXCLAM /* 107 */:
                default:
                    this.jj_la1[2] = this.jj_gen;
                    Expression exp = PrimaryExpression();
                    for (int i = 0; i < nots.size(); i++) {
                        result = new NotExpression(exp);
                        Token tok = (Token) nots.get((nots.size() - i) - 1);
                        result.setLocation(this.template, tok, exp);
                        exp = result;
                    }
                    return result;
            }
        }
    }

    public final Expression UnaryPlusMinusExpression() throws ParseException {
        Token t;
        boolean isMinus = false;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.PLUS /* 98 */:
                t = jj_consume_token(98);
                break;
            case FMParserConstants.MINUS /* 99 */:
                t = jj_consume_token(99);
                isMinus = true;
                break;
            default:
                this.jj_la1[3] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        Expression exp = PrimaryExpression();
        Expression result = new UnaryPlusMinusExpression(exp, isMinus);
        result.setLocation(this.template, t, exp);
        return result;
    }

    public final Expression AdditiveExpression() throws ParseException {
        boolean plus;
        Expression arithmeticExpression;
        Expression lhs = MultiplicativeExpression();
        Expression result = lhs;
        while (jj_2_2(Integer.MAX_VALUE)) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.PLUS /* 98 */:
                    jj_consume_token(98);
                    plus = true;
                    break;
                case FMParserConstants.MINUS /* 99 */:
                    jj_consume_token(99);
                    plus = false;
                    break;
                default:
                    this.jj_la1[4] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            Expression rhs = MultiplicativeExpression();
            if (plus) {
                arithmeticExpression = new AddConcatExpression(lhs, rhs);
            } else {
                numberLiteralOnly(lhs);
                numberLiteralOnly(rhs);
                arithmeticExpression = new ArithmeticExpression(lhs, rhs, 0);
            }
            result = arithmeticExpression;
            result.setLocation(this.template, lhs, rhs);
            lhs = result;
        }
        return result;
    }

    public final Expression MultiplicativeExpression() throws ParseException {
        int i;
        Expression lhs = UnaryExpression();
        Expression result = lhs;
        while (jj_2_3(Integer.MAX_VALUE)) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.TIMES /* 100 */:
                    jj_consume_token(100);
                    i = 1;
                    break;
                case FMParserConstants.DOUBLE_STAR /* 101 */:
                case FMParserConstants.ELLIPSIS /* 102 */:
                default:
                    this.jj_la1[5] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
                case FMParserConstants.DIVIDE /* 103 */:
                    jj_consume_token(FMParserConstants.DIVIDE);
                    i = 2;
                    break;
                case FMParserConstants.PERCENT /* 104 */:
                    jj_consume_token(FMParserConstants.PERCENT);
                    i = 3;
                    break;
            }
            int operation = i;
            Expression rhs = UnaryExpression();
            numberLiteralOnly(lhs);
            numberLiteralOnly(rhs);
            result = new ArithmeticExpression(lhs, rhs, operation);
            result.setLocation(this.template, lhs, rhs);
            lhs = result;
        }
        return result;
    }

    public final Expression EqualityExpression() throws ParseException {
        Token t;
        Expression lhs = RelationalExpression();
        Expression result = lhs;
        if (jj_2_4(Integer.MAX_VALUE)) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.EQUALS /* 91 */:
                    t = jj_consume_token(91);
                    break;
                case FMParserConstants.DOUBLE_EQUALS /* 92 */:
                    t = jj_consume_token(92);
                    break;
                case FMParserConstants.NOT_EQUALS /* 93 */:
                    t = jj_consume_token(93);
                    break;
                default:
                    this.jj_la1[6] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            Expression rhs = RelationalExpression();
            notHashLiteral(lhs, "scalar");
            notHashLiteral(rhs, "scalar");
            notListLiteral(lhs, "scalar");
            notListLiteral(rhs, "scalar");
            result = new ComparisonExpression(lhs, rhs, t.image);
            result.setLocation(this.template, lhs, rhs);
        }
        return result;
    }

    public final Expression RelationalExpression() throws ParseException {
        Token t;
        Expression lhs = RangeExpression();
        Expression result = lhs;
        if (jj_2_5(Integer.MAX_VALUE)) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.LESS_THAN /* 94 */:
                    t = jj_consume_token(94);
                    break;
                case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
                    t = jj_consume_token(95);
                    break;
                case FMParserConstants.ESCAPED_GT /* 96 */:
                    t = jj_consume_token(96);
                    break;
                case FMParserConstants.ESCAPED_GTE /* 97 */:
                    t = jj_consume_token(97);
                    break;
                case FMParserConstants.NATURAL_GT /* 126 */:
                    t = jj_consume_token(FMParserConstants.NATURAL_GT);
                    break;
                case FMParserConstants.NATURAL_GTE /* 127 */:
                    t = jj_consume_token(FMParserConstants.NATURAL_GTE);
                    break;
                default:
                    this.jj_la1[7] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            Expression rhs = RangeExpression();
            notHashLiteral(lhs, "scalar");
            notHashLiteral(rhs, "scalar");
            notListLiteral(lhs, "scalar");
            notListLiteral(rhs, "scalar");
            notStringLiteral(lhs, "number");
            notStringLiteral(rhs, "number");
            result = new ComparisonExpression(lhs, rhs, t.image);
            result.setLocation(this.template, lhs, rhs);
        }
        return result;
    }

    public final Expression RangeExpression() throws ParseException {
        Expression rhs = null;
        Expression lhs = AdditiveExpression();
        Expression result = lhs;
        if (jj_2_7(Integer.MAX_VALUE)) {
            jj_consume_token(88);
            if (jj_2_6(Integer.MAX_VALUE)) {
                rhs = AdditiveExpression();
            }
            numberLiteralOnly(lhs);
            if (rhs != null) {
                numberLiteralOnly(rhs);
            }
            Range range = new Range(lhs, rhs);
            if (rhs != null) {
                range.setLocation(this.template, lhs, rhs);
            } else {
                range.setLocation(this.template, lhs, lhs);
            }
            result = range;
        }
        return result;
    }

    public final Expression AndExpression() throws ParseException {
        Expression lhs = EqualityExpression();
        Expression result = lhs;
        while (jj_2_8(Integer.MAX_VALUE)) {
            jj_consume_token(FMParserConstants.AND);
            Expression rhs = EqualityExpression();
            booleanLiteralOnly(lhs);
            booleanLiteralOnly(rhs);
            result = new AndExpression(lhs, rhs);
            result.setLocation(this.template, lhs, rhs);
            lhs = result;
        }
        return result;
    }

    public final Expression OrExpression() throws ParseException {
        Expression lhs = AndExpression();
        Expression result = lhs;
        while (jj_2_9(Integer.MAX_VALUE)) {
            jj_consume_token(FMParserConstants.OR);
            Expression rhs = AndExpression();
            booleanLiteralOnly(lhs);
            booleanLiteralOnly(rhs);
            result = new OrExpression(lhs, rhs);
            result.setLocation(this.template, lhs, rhs);
            lhs = result;
        }
        return result;
    }

    public final ListLiteral ListLiteral() throws ParseException {
        new ArrayList();
        Token begin = jj_consume_token(FMParserConstants.OPEN_BRACKET);
        ArrayList values = PositionalArgs();
        Token end = jj_consume_token(FMParserConstants.CLOSE_BRACKET);
        ListLiteral result = new ListLiteral(values);
        result.setLocation(this.template, begin, end);
        return result;
    }

    public final Expression NumberLiteral() throws ParseException {
        Token t;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.INTEGER /* 85 */:
                t = jj_consume_token(85);
                break;
            case FMParserConstants.DECIMAL /* 86 */:
                t = jj_consume_token(86);
                break;
            default:
                this.jj_la1[8] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        String s = t.image;
        Expression result = new NumberLiteral(this.template.getArithmeticEngine().toNumber(s));
        Token startToken = 0 != 0 ? null : t;
        result.setLocation(this.template, startToken, t);
        return result;
    }

    public final Identifier Identifier() throws ParseException {
        Token t = jj_consume_token(FMParserConstants.ID);
        Identifier id = new Identifier(t.image);
        id.setLocation(this.template, t, t);
        return id;
    }

    public final Expression IdentifierOrStringLiteral() throws ParseException {
        Expression exp;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
                exp = StringLiteral(false);
                break;
            case FMParserConstants.ID /* 120 */:
                exp = Identifier();
                break;
            default:
                this.jj_la1[9] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return exp;
    }

    public final BuiltinVariable BuiltinVariable() throws ParseException {
        Token dot = jj_consume_token(87);
        Token name = jj_consume_token(FMParserConstants.ID);
        try {
            BuiltinVariable result = new BuiltinVariable(name.image);
            result.setLocation(this.template, dot, name);
            return result;
        } catch (ParseException pe) {
            pe.lineNumber = dot.beginLine;
            pe.columnNumber = dot.beginColumn;
            throw pe;
        }
    }

    public final Expression AddSubExpression(Expression exp) throws ParseException {
        Expression result;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.DOT /* 87 */:
                result = DotVariable(exp);
                break;
            case FMParserConstants.BUILT_IN /* 89 */:
                result = BuiltIn(exp);
                break;
            case FMParserConstants.EXISTS /* 90 */:
                result = Exists(exp);
                break;
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.TERMINATING_EXCLAM /* 129 */:
                result = DefaultTo(exp);
                break;
            case FMParserConstants.OPEN_BRACKET /* 111 */:
                result = DynamicKey(exp);
                break;
            case FMParserConstants.OPEN_PAREN /* 113 */:
                result = MethodArgs(exp);
                break;
            default:
                this.jj_la1[10] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return result;
    }

    public final Expression DefaultTo(Expression exp) throws ParseException {
        Token t;
        Expression rhs = null;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.EXCLAM /* 107 */:
                t = jj_consume_token(FMParserConstants.EXCLAM);
                if (jj_2_10(Integer.MAX_VALUE)) {
                    rhs = Expression();
                    break;
                }
                break;
            case FMParserConstants.TERMINATING_EXCLAM /* 129 */:
                t = jj_consume_token(FMParserConstants.TERMINATING_EXCLAM);
                break;
            default:
                this.jj_la1[11] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        DefaultToExpression result = new DefaultToExpression(exp, rhs);
        if (rhs == null) {
            result.setLocation(this.template, exp, t);
        } else {
            result.setLocation(this.template, exp, rhs);
        }
        return result;
    }

    public final Expression Exists(Expression exp) throws ParseException {
        Token t = jj_consume_token(90);
        ExistsExpression result = new ExistsExpression(exp);
        result.setLocation(this.template, exp, t);
        return result;
    }

    public final Expression BuiltIn(Expression exp) throws ParseException {
        jj_consume_token(89);
        Token t = jj_consume_token(FMParserConstants.ID);
        try {
            BuiltIn result = BuiltIn.newBuiltIn(this.incompatibleImprovements, exp, t.image);
            result.setLocation(this.template, exp, t);
            return result;
        } catch (ParseException pe) {
            pe.lineNumber = t.beginLine;
            pe.columnNumber = t.beginColumn;
            throw pe;
        }
    }

    public final Expression DotVariable(Expression exp) throws ParseException {
        Token t;
        jj_consume_token(87);
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.LESS_THAN /* 94 */:
            case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
            case FMParserConstants.ESCAPED_GT /* 96 */:
            case FMParserConstants.ESCAPED_GTE /* 97 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.FALSE /* 83 */:
                        t = jj_consume_token(83);
                        break;
                    case FMParserConstants.TRUE /* 84 */:
                        t = jj_consume_token(84);
                        break;
                    case FMParserConstants.LESS_THAN /* 94 */:
                        t = jj_consume_token(94);
                        break;
                    case FMParserConstants.LESS_THAN_EQUALS /* 95 */:
                        t = jj_consume_token(95);
                        break;
                    case FMParserConstants.ESCAPED_GT /* 96 */:
                        t = jj_consume_token(96);
                        break;
                    case FMParserConstants.ESCAPED_GTE /* 97 */:
                        t = jj_consume_token(97);
                        break;
                    case FMParserConstants.IN /* 117 */:
                        t = jj_consume_token(FMParserConstants.IN);
                        break;
                    case FMParserConstants.AS /* 118 */:
                        t = jj_consume_token(FMParserConstants.AS);
                        break;
                    case FMParserConstants.USING /* 119 */:
                        t = jj_consume_token(FMParserConstants.USING);
                        break;
                    default:
                        this.jj_la1[12] = this.jj_gen;
                        jj_consume_token(-1);
                        throw new ParseException();
                }
                if (!Character.isLetter(t.image.charAt(0))) {
                    throw new ParseException(new StringBuffer().append(t.image).append(" is not a valid identifier.").toString(), this.template, t);
                }
                break;
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.DOT_DOT /* 88 */:
            case FMParserConstants.BUILT_IN /* 89 */:
            case FMParserConstants.EXISTS /* 90 */:
            case FMParserConstants.EQUALS /* 91 */:
            case FMParserConstants.DOUBLE_EQUALS /* 92 */:
            case FMParserConstants.NOT_EQUALS /* 93 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.ELLIPSIS /* 102 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.AND /* 105 */:
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
            case FMParserConstants.CLOSE_BRACE /* 116 */:
            default:
                this.jj_la1[13] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
            case FMParserConstants.TIMES /* 100 */:
                t = jj_consume_token(100);
                break;
            case FMParserConstants.DOUBLE_STAR /* 101 */:
                t = jj_consume_token(FMParserConstants.DOUBLE_STAR);
                break;
            case FMParserConstants.ID /* 120 */:
                t = jj_consume_token(FMParserConstants.ID);
                break;
        }
        notListLiteral(exp, "hash");
        notStringLiteral(exp, "hash");
        notBooleanLiteral(exp, "hash");
        Dot dot = new Dot(exp, t.image);
        dot.setLocation(this.template, exp, t);
        return dot;
    }

    public final Expression DynamicKey(Expression exp) throws ParseException {
        jj_consume_token(FMParserConstants.OPEN_BRACKET);
        Expression arg = Expression();
        Token t = jj_consume_token(FMParserConstants.CLOSE_BRACKET);
        notBooleanLiteral(exp, "list or hash");
        notNumberLiteral(exp, "list or hash");
        DynamicKeyName dkn = new DynamicKeyName(exp, arg);
        dkn.setLocation(this.template, exp, t);
        return dkn;
    }

    public final MethodCall MethodArgs(Expression exp) throws ParseException {
        new ArrayList();
        jj_consume_token(FMParserConstants.OPEN_PAREN);
        ArrayList args = PositionalArgs();
        Token end = jj_consume_token(FMParserConstants.CLOSE_PAREN);
        args.trimToSize();
        MethodCall result = new MethodCall(exp, args);
        result.setLocation(this.template, exp, end);
        return result;
    }

    public final StringLiteral StringLiteral(boolean interpolate) throws ParseException {
        Token t;
        String s;
        boolean raw = false;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
                t = jj_consume_token(81);
                break;
            case FMParserConstants.RAW_STRING /* 82 */:
                t = jj_consume_token(82);
                raw = true;
                break;
            default:
                this.jj_la1[14] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        String s2 = t.image;
        String s3 = s2.substring(1, s2.length() - 1);
        if (raw) {
            s = s3.substring(1);
        } else {
            try {
                s = StringUtil.FTLStringLiteralDec(s3);
            } catch (ParseException pe) {
                pe.lineNumber = t.beginLine;
                pe.columnNumber = t.beginColumn;
                throw pe;
            }
        }
        StringLiteral result = new StringLiteral(s);
        result.setLocation(this.template, t, t);
        if (interpolate && !raw && (t.image.indexOf("${") >= 0 || t.image.indexOf("#{") >= 0)) {
            result.checkInterpolation();
        }
        return result;
    }

    public final Expression BooleanLiteral() throws ParseException {
        Token t;
        Expression result;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.FALSE /* 83 */:
                t = jj_consume_token(83);
                result = new BooleanLiteral(false);
                break;
            case FMParserConstants.TRUE /* 84 */:
                t = jj_consume_token(84);
                result = new BooleanLiteral(true);
                break;
            default:
                this.jj_la1[15] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        result.setLocation(this.template, t, t);
        return result;
    }

    public final HashLiteral HashLiteral() throws ParseException {
        ArrayList keys = new ArrayList();
        ArrayList values = new ArrayList();
        Token begin = jj_consume_token(FMParserConstants.OPEN_BRACE);
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.ID /* 120 */:
                Expression key = Expression();
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.COMMA /* 108 */:
                        jj_consume_token(FMParserConstants.COMMA);
                        break;
                    case FMParserConstants.COLON /* 110 */:
                        jj_consume_token(FMParserConstants.COLON);
                        break;
                    default:
                        this.jj_la1[16] = this.jj_gen;
                        jj_consume_token(-1);
                        throw new ParseException();
                }
                Expression value = Expression();
                stringLiteralOnly(key);
                keys.add(key);
                values.add(value);
                while (true) {
                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                        case FMParserConstants.COMMA /* 108 */:
                            jj_consume_token(FMParserConstants.COMMA);
                            Expression key2 = Expression();
                            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                                case FMParserConstants.COMMA /* 108 */:
                                    jj_consume_token(FMParserConstants.COMMA);
                                    break;
                                case FMParserConstants.COLON /* 110 */:
                                    jj_consume_token(FMParserConstants.COLON);
                                    break;
                                default:
                                    this.jj_la1[18] = this.jj_gen;
                                    jj_consume_token(-1);
                                    throw new ParseException();
                            }
                            Expression value2 = Expression();
                            stringLiteralOnly(key2);
                            keys.add(key2);
                            values.add(value2);
                        default:
                            this.jj_la1[17] = this.jj_gen;
                            break;
                    }
                }
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
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.ELLIPSIS /* 102 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.AND /* 105 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.CLOSE_BRACE /* 116 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            default:
                this.jj_la1[19] = this.jj_gen;
                break;
        }
        Token end = jj_consume_token(FMParserConstants.CLOSE_BRACE);
        HashLiteral result = new HashLiteral(keys, values);
        result.setLocation(this.template, begin, end);
        return result;
    }

    public final DollarVariable StringOutput() throws ParseException {
        Token begin = jj_consume_token(71);
        Expression exp = Expression();
        notHashLiteral(exp, "string or something automatically convertible to string (number, date or boolean)");
        notListLiteral(exp, "string or something automatically convertible to string (number, date or boolean)");
        Token end = jj_consume_token(FMParserConstants.CLOSE_BRACE);
        DollarVariable result = new DollarVariable(exp, escapedExpression(exp));
        result.setLocation(this.template, begin, end);
        return result;
    }

    public final NumericalOutput NumericalOutput() throws ParseException {
        NumericalOutput result;
        Token fmt = null;
        Token begin = jj_consume_token(72);
        Expression exp = Expression();
        numberLiteralOnly(exp);
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.SEMICOLON /* 109 */:
                jj_consume_token(FMParserConstants.SEMICOLON);
                fmt = jj_consume_token(FMParserConstants.ID);
                break;
            default:
                this.jj_la1[20] = this.jj_gen;
                break;
        }
        Token end = jj_consume_token(FMParserConstants.CLOSE_BRACE);
        if (fmt != null) {
            int minFrac = -1;
            int maxFrac = -1;
            StringTokenizer st = new StringTokenizer(fmt.image, "mM", true);
            char type = '-';
            while (st.hasMoreTokens()) {
                String token = st.nextToken();
                if (type != '-') {
                    try {
                        switch (type) {
                            case 'M':
                                if (maxFrac == -1) {
                                    maxFrac = Integer.parseInt(token);
                                    break;
                                } else {
                                    throw new ParseException("Invalid formatting string", this.template, fmt);
                                }
                            case FMParserConstants.SEMICOLON /* 109 */:
                                if (minFrac == -1) {
                                    minFrac = Integer.parseInt(token);
                                    break;
                                } else {
                                    throw new ParseException("Invalid formatting string", this.template, fmt);
                                }
                            default:
                                throw new ParseException("Invalid formatting string", this.template, fmt);
                        }
                        type = '-';
                    } catch (ParseException e) {
                        throw new ParseException(new StringBuffer().append("Invalid format specifier ").append(fmt.image).toString(), this.template, fmt);
                    } catch (NumberFormatException e2) {
                        throw new ParseException(new StringBuffer().append("Invalid number in the format specifier ").append(fmt.image).toString(), this.template, fmt);
                    }
                } else if (token.equals("m")) {
                    type = 'm';
                } else if (token.equals("M")) {
                    type = 'M';
                } else {
                    throw new ParseException();
                }
            }
            if (maxFrac == -1) {
                if (minFrac == -1) {
                    throw new ParseException("Invalid format specification, at least one of m and M must be specified!", this.template, fmt);
                }
                maxFrac = minFrac;
            } else if (minFrac == -1) {
                minFrac = 0;
            }
            if (minFrac > maxFrac) {
                throw new ParseException("Invalid format specification, min cannot be greater than max!", this.template, fmt);
            }
            if (minFrac > 50 || maxFrac > 50) {
                throw new ParseException("Cannot specify more than 50 fraction digits", this.template, fmt);
            }
            result = new NumericalOutput(exp, minFrac, maxFrac);
        } else {
            result = new NumericalOutput(exp);
        }
        result.setLocation(this.template, begin, end);
        return result;
    }

    public final TemplateElement If() throws ParseException {
        Token start = jj_consume_token(8);
        Expression condition = Expression();
        jj_consume_token(FMParserConstants.DIRECTIVE_END);
        TemplateElement block = OptionalBlock();
        ConditionalBlock cblock = new ConditionalBlock(condition, block, 0);
        cblock.setLocation(this.template, start, block);
        IfBlock ifBlock = new IfBlock(cblock);
        while (true) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.ELSE_IF /* 9 */:
                    Token t = jj_consume_token(9);
                    Expression condition2 = Expression();
                    LooseDirectiveEnd();
                    TemplateElement block2 = OptionalBlock();
                    ConditionalBlock cblock2 = new ConditionalBlock(condition2, block2, 2);
                    cblock2.setLocation(this.template, t, block2);
                    ifBlock.addBlock(cblock2);
                default:
                    this.jj_la1[21] = this.jj_gen;
                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                        case FMParserConstants.ELSE /* 44 */:
                            Token t2 = jj_consume_token(44);
                            TemplateElement block3 = OptionalBlock();
                            ConditionalBlock cblock3 = new ConditionalBlock(null, block3, 1);
                            cblock3.setLocation(this.template, t2, block3);
                            ifBlock.addBlock(cblock3);
                            break;
                        default:
                            this.jj_la1[22] = this.jj_gen;
                            break;
                    }
                    Token end = jj_consume_token(31);
                    ifBlock.setLocation(this.template, start, end);
                    return ifBlock;
            }
        }
    }

    public final AttemptBlock Attempt() throws ParseException {
        Token end;
        Token start = jj_consume_token(6);
        TemplateElement block = OptionalBlock();
        RecoveryBlock recoveryBlock = Recover();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.END_RECOVER /* 33 */:
                end = jj_consume_token(33);
                break;
            case FMParserConstants.END_ATTEMPT /* 34 */:
                end = jj_consume_token(34);
                break;
            default:
                this.jj_la1[23] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        AttemptBlock result = new AttemptBlock(block, recoveryBlock);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final RecoveryBlock Recover() throws ParseException {
        Token start = jj_consume_token(7);
        TemplateElement block = OptionalBlock();
        RecoveryBlock result = new RecoveryBlock(block);
        result.setLocation(this.template, start, block);
        return result;
    }

    public final IteratorBlock List() throws ParseException {
        Token start = jj_consume_token(10);
        this.loopNesting++;
        Expression exp = Expression();
        jj_consume_token(FMParserConstants.AS);
        Token index = jj_consume_token(FMParserConstants.ID);
        jj_consume_token(FMParserConstants.DIRECTIVE_END);
        TemplateElement block = OptionalBlock();
        Token end = jj_consume_token(32);
        this.loopNesting--;
        IteratorBlock result = new IteratorBlock(exp, index.image, block, false);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final IteratorBlock ForEach() throws ParseException {
        Token start = jj_consume_token(11);
        this.loopNesting++;
        Token index = jj_consume_token(FMParserConstants.ID);
        jj_consume_token(FMParserConstants.IN);
        Expression exp = Expression();
        jj_consume_token(FMParserConstants.DIRECTIVE_END);
        TemplateElement block = OptionalBlock();
        Token end = jj_consume_token(35);
        this.loopNesting--;
        IteratorBlock result = new IteratorBlock(exp, index.image, block, true);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final VisitNode Visit() throws ParseException {
        Expression namespaces = null;
        Token start = jj_consume_token(22);
        Expression targetNode = Expression();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.USING /* 119 */:
                jj_consume_token(FMParserConstants.USING);
                namespaces = Expression();
                break;
            default:
                this.jj_la1[24] = this.jj_gen;
                break;
        }
        Token end = LooseDirectiveEnd();
        VisitNode result = new VisitNode(targetNode, namespaces);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final RecurseNode Recurse() throws ParseException {
        Token start;
        Token end = null;
        Expression node = null;
        Expression namespaces = null;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                start = jj_consume_token(56);
                break;
            case FMParserConstants.RECURSE /* 57 */:
                start = jj_consume_token(57);
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.STRING_LITERAL /* 81 */:
                    case FMParserConstants.RAW_STRING /* 82 */:
                    case FMParserConstants.FALSE /* 83 */:
                    case FMParserConstants.TRUE /* 84 */:
                    case FMParserConstants.INTEGER /* 85 */:
                    case FMParserConstants.DECIMAL /* 86 */:
                    case FMParserConstants.DOT /* 87 */:
                    case FMParserConstants.PLUS /* 98 */:
                    case FMParserConstants.MINUS /* 99 */:
                    case FMParserConstants.EXCLAM /* 107 */:
                    case FMParserConstants.OPEN_BRACKET /* 111 */:
                    case FMParserConstants.OPEN_PAREN /* 113 */:
                    case FMParserConstants.OPEN_BRACE /* 115 */:
                    case FMParserConstants.ID /* 120 */:
                        node = Expression();
                        break;
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
                    case FMParserConstants.TIMES /* 100 */:
                    case FMParserConstants.DOUBLE_STAR /* 101 */:
                    case FMParserConstants.ELLIPSIS /* 102 */:
                    case FMParserConstants.DIVIDE /* 103 */:
                    case FMParserConstants.PERCENT /* 104 */:
                    case FMParserConstants.AND /* 105 */:
                    case FMParserConstants.OR /* 106 */:
                    case FMParserConstants.COMMA /* 108 */:
                    case FMParserConstants.SEMICOLON /* 109 */:
                    case FMParserConstants.COLON /* 110 */:
                    case FMParserConstants.CLOSE_BRACKET /* 112 */:
                    case FMParserConstants.CLOSE_PAREN /* 114 */:
                    case FMParserConstants.CLOSE_BRACE /* 116 */:
                    case FMParserConstants.IN /* 117 */:
                    case FMParserConstants.AS /* 118 */:
                    case FMParserConstants.USING /* 119 */:
                    default:
                        this.jj_la1[25] = this.jj_gen;
                        break;
                }
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.USING /* 119 */:
                        jj_consume_token(FMParserConstants.USING);
                        namespaces = Expression();
                        break;
                    default:
                        this.jj_la1[26] = this.jj_gen;
                        break;
                }
                end = LooseDirectiveEnd();
                break;
            default:
                this.jj_la1[27] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        if (end == null) {
            end = start;
        }
        RecurseNode result = new RecurseNode(node, namespaces);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final FallbackInstruction FallBack() throws ParseException {
        Token tok = jj_consume_token(58);
        if (!this.inMacro) {
            throw new ParseException("Cannot fall back outside a macro.", this.template, tok);
        }
        FallbackInstruction result = new FallbackInstruction();
        result.setLocation(this.template, tok, tok);
        return result;
    }

    public final BreakInstruction Break() throws ParseException {
        Token start = jj_consume_token(45);
        if (this.loopNesting < 1 && this.switchNesting < 1) {
            throw new ParseException(new StringBuffer().append(start.image).append(" occurred outside a loop or a switch block.").toString(), this.template, start);
        }
        BreakInstruction result = new BreakInstruction();
        result.setLocation(this.template, start, start);
        return result;
    }

    public final ReturnInstruction Return() throws ParseException {
        Token start;
        Token end;
        Expression exp = null;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.RETURN /* 24 */:
                start = jj_consume_token(24);
                exp = Expression();
                end = LooseDirectiveEnd();
                break;
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                start = jj_consume_token(46);
                end = start;
                break;
            default:
                this.jj_la1[28] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        if (this.inMacro) {
            if (exp != null) {
                throw new ParseException("A macro cannot return a value", this.template, start);
            }
        } else if (this.inFunction) {
            if (exp == null) {
                throw new ParseException("A function must return a value", this.template, start);
            }
        } else if (exp == null) {
            throw new ParseException("A return instruction can only occur inside a macro or function", this.template, start);
        }
        ReturnInstruction result = new ReturnInstruction(exp);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final StopInstruction Stop() throws ParseException {
        Token start;
        Expression exp = null;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STOP /* 23 */:
                start = jj_consume_token(23);
                exp = Expression();
                LooseDirectiveEnd();
                break;
            case FMParserConstants.HALT /* 47 */:
                start = jj_consume_token(47);
                break;
            default:
                this.jj_la1[29] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        StopInstruction result = new StopInstruction(exp);
        result.setLocation(this.template, start, start);
        return result;
    }

    public final TemplateElement Nested() throws ParseException {
        Token t;
        BodyInstruction result;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
                t = jj_consume_token(54);
                result = new BodyInstruction(null);
                result.setLocation(this.template, t, t);
                break;
            case FMParserConstants.NESTED /* 55 */:
                t = jj_consume_token(55);
                ArrayList bodyParameters = PositionalArgs();
                Token end = LooseDirectiveEnd();
                result = new BodyInstruction(bodyParameters);
                result.setLocation(this.template, t, end);
                break;
            default:
                this.jj_la1[30] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        if (!this.inMacro) {
            throw new ParseException(new StringBuffer().append("Cannot use a ").append(t.image).append(" instruction outside a macro.").toString(), this.template, t);
        }
        return result;
    }

    public final TemplateElement Flush() throws ParseException {
        Token t = jj_consume_token(48);
        FlushInstruction result = new FlushInstruction();
        result.setLocation(this.template, t, t);
        return result;
    }

    public final TemplateElement Trim() throws ParseException {
        Token t;
        TrimInstruction result;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.TRIM /* 49 */:
                t = jj_consume_token(49);
                result = new TrimInstruction(true, true);
                break;
            case FMParserConstants.LTRIM /* 50 */:
                t = jj_consume_token(50);
                result = new TrimInstruction(true, false);
                break;
            case FMParserConstants.RTRIM /* 51 */:
                t = jj_consume_token(51);
                result = new TrimInstruction(false, true);
                break;
            case FMParserConstants.NOTRIM /* 52 */:
                t = jj_consume_token(52);
                result = new TrimInstruction(false, false);
                break;
            default:
                this.jj_la1[31] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        result.setLocation(this.template, t, t);
        return result;
    }

    public final TemplateElement Assign() throws ParseException {
        Token start;
        int scope;
        Token end;
        Expression nsExp = null;
        ArrayList assignments = new ArrayList();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.ASSIGN /* 14 */:
                start = jj_consume_token(14);
                scope = 1;
                break;
            case FMParserConstants.GLOBALASSIGN /* 15 */:
                start = jj_consume_token(15);
                scope = 3;
                break;
            case 16:
                start = jj_consume_token(16);
                scope = 2;
                if (!this.inMacro && !this.inFunction) {
                    throw new ParseException("Local variable assigned outside a macro.", this.template, start);
                }
                break;
            default:
                this.jj_la1[32] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        Expression nameExp = IdentifierOrStringLiteral();
        String varName = nameExp instanceof StringLiteral ? ((StringLiteral) nameExp).getAsString() : nameExp.toString();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.EQUALS /* 91 */:
                jj_consume_token(91);
                Expression exp = Expression();
                Assignment ass = new Assignment(varName, exp, scope);
                ass.setLocation(this.template, nameExp, exp);
                assignments.add(ass);
                while (jj_2_11(Integer.MAX_VALUE)) {
                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                        case FMParserConstants.COMMA /* 108 */:
                            jj_consume_token(FMParserConstants.COMMA);
                            break;
                        default:
                            this.jj_la1[33] = this.jj_gen;
                            break;
                    }
                    Expression nameExp2 = IdentifierOrStringLiteral();
                    String varName2 = nameExp2 instanceof StringLiteral ? ((StringLiteral) nameExp2).getAsString() : nameExp2.toString();
                    jj_consume_token(91);
                    Expression exp2 = Expression();
                    Assignment ass2 = new Assignment(varName2, exp2, scope);
                    ass2.setLocation(this.template, nameExp2, exp2);
                    assignments.add(ass2);
                }
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.IN /* 117 */:
                        Token id = jj_consume_token(FMParserConstants.IN);
                        nsExp = Expression();
                        if (scope != 1) {
                            throw new ParseException("Cannot assign to namespace here.", this.template, id);
                        }
                        break;
                    default:
                        this.jj_la1[34] = this.jj_gen;
                        break;
                }
                Token end2 = LooseDirectiveEnd();
                AssignmentInstruction ai = new AssignmentInstruction(scope);
                for (int i = 0; i < assignments.size(); i++) {
                    ai.addAssignment((Assignment) assignments.get(i));
                }
                ai.setNamespaceExp(nsExp);
                ai.setLocation(this.template, start, end2);
                return ai;
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.DIRECTIVE_END /* 124 */:
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.IN /* 117 */:
                        Token id2 = jj_consume_token(FMParserConstants.IN);
                        nsExp = Expression();
                        if (scope != 1) {
                            throw new ParseException("Cannot assign to namespace here.", this.template, id2);
                        }
                        break;
                    default:
                        this.jj_la1[35] = this.jj_gen;
                        break;
                }
                jj_consume_token(FMParserConstants.DIRECTIVE_END);
                TemplateElement block = OptionalBlock();
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.END_LOCAL /* 36 */:
                        end = jj_consume_token(36);
                        if (scope != 2) {
                            throw new ParseException("Mismatched assignment tags.", this.template, end);
                        }
                        break;
                    case FMParserConstants.END_GLOBAL /* 37 */:
                        end = jj_consume_token(37);
                        if (scope != 3) {
                            throw new ParseException("Mismatched assignment tags", this.template, end);
                        }
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        end = jj_consume_token(38);
                        if (scope != 1) {
                            throw new ParseException("Mismatched assignment tags.", this.template, end);
                        }
                        break;
                    default:
                        this.jj_la1[36] = this.jj_gen;
                        jj_consume_token(-1);
                        throw new ParseException();
                }
                BlockAssignment ba = new BlockAssignment(block, varName, scope, nsExp);
                ba.setLocation(this.template, start, end);
                return ba;
            default:
                this.jj_la1[37] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public final freemarker.core.Include Include() throws freemarker.core.ParseException {
        /*
            Method dump skipped, instructions count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.FMParser.Include():freemarker.core.Include");
    }

    public final LibraryLoad Import() throws ParseException {
        Token start = jj_consume_token(18);
        Expression nameExp = Expression();
        jj_consume_token(FMParserConstants.AS);
        Token ns = jj_consume_token(FMParserConstants.ID);
        Token end = LooseDirectiveEnd();
        LibraryLoad result = new LibraryLoad(this.template, nameExp, ns.image);
        result.setLocation(this.template, start, end);
        this.template.addImport(result);
        return result;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:101)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public final freemarker.core.Macro Macro() throws freemarker.core.ParseException {
        /*
            Method dump skipped, instructions count: 901
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.FMParser.Macro():freemarker.core.Macro");
    }

    public final CompressedBlock Compress() throws ParseException {
        Token start = jj_consume_token(27);
        TemplateElement block = OptionalBlock();
        Token end = jj_consume_token(41);
        CompressedBlock cb = new CompressedBlock(block);
        cb.setLocation(this.template, start, end);
        return cb;
    }

    public final TemplateElement UnifiedMacroTransform() throws ParseException {
        Token end;
        HashMap namedArgs = null;
        ArrayList positionalArgs = null;
        ArrayList bodyParameters = null;
        String directiveName = null;
        TemplateElement nestedBlock = null;
        Token start = jj_consume_token(63);
        Expression exp = Expression();
        if ((exp instanceof Identifier) || ((exp instanceof Dot) && ((Dot) exp).onlyHasIdentifiers())) {
            directiveName = exp.getCanonicalForm();
        }
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case 128:
                jj_consume_token(128);
                break;
            default:
                this.jj_la1[48] = this.jj_gen;
                break;
        }
        if (jj_2_12(Integer.MAX_VALUE)) {
            namedArgs = NamedArgs();
        } else {
            positionalArgs = PositionalArgs();
        }
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.SEMICOLON /* 109 */:
                jj_consume_token(FMParserConstants.SEMICOLON);
                bodyParameters = new ArrayList();
                switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                    case FMParserConstants.ID /* 120 */:
                    case 128:
                        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                            case 128:
                                jj_consume_token(128);
                                break;
                            default:
                                this.jj_la1[49] = this.jj_gen;
                                break;
                        }
                        Token t = jj_consume_token(FMParserConstants.ID);
                        bodyParameters.add(t.image);
                        while (true) {
                            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                                case FMParserConstants.COMMA /* 108 */:
                                case 128:
                                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                                        case 128:
                                            jj_consume_token(128);
                                            break;
                                        default:
                                            this.jj_la1[51] = this.jj_gen;
                                            break;
                                    }
                                    jj_consume_token(FMParserConstants.COMMA);
                                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                                        case 128:
                                            jj_consume_token(128);
                                            break;
                                        default:
                                            this.jj_la1[52] = this.jj_gen;
                                            break;
                                    }
                                    Token t2 = jj_consume_token(FMParserConstants.ID);
                                    bodyParameters.add(t2.image);
                                default:
                                    this.jj_la1[50] = this.jj_gen;
                                    break;
                            }
                        }
                    default:
                        this.jj_la1[53] = this.jj_gen;
                        break;
                }
            default:
                this.jj_la1[54] = this.jj_gen;
                break;
        }
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.DIRECTIVE_END /* 124 */:
                jj_consume_token(FMParserConstants.DIRECTIVE_END);
                nestedBlock = OptionalBlock();
                end = jj_consume_token(64);
                String s = end.image.substring(3);
                String s2 = s.substring(0, s.length() - 1).trim();
                if (s2.length() > 0 && !s2.equals(directiveName)) {
                    if (directiveName == null) {
                        throw new ParseException("Expecting </@>", this.template, end);
                    }
                    throw new ParseException(new StringBuffer().append("Expecting </@> or </@").append(directiveName).append(">").toString(), this.template, end);
                }
                break;
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                end = jj_consume_token(FMParserConstants.EMPTY_DIRECTIVE_END);
                break;
            default:
                this.jj_la1[55] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        TemplateElement result = positionalArgs != null ? new UnifiedCall(exp, positionalArgs, nestedBlock, bodyParameters) : new UnifiedCall(exp, namedArgs, nestedBlock, bodyParameters);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final TemplateElement Call() throws ParseException {
        UnifiedCall result;
        HashMap namedArgs = null;
        ArrayList positionalArgs = null;
        Token start = jj_consume_token(25);
        Token id = jj_consume_token(FMParserConstants.ID);
        String macroName = id.image;
        if (jj_2_14(Integer.MAX_VALUE)) {
            namedArgs = NamedArgs();
        } else {
            if (jj_2_13(Integer.MAX_VALUE)) {
                jj_consume_token(FMParserConstants.OPEN_PAREN);
            }
            positionalArgs = PositionalArgs();
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.CLOSE_PAREN /* 114 */:
                    jj_consume_token(FMParserConstants.CLOSE_PAREN);
                    break;
                default:
                    this.jj_la1[56] = this.jj_gen;
                    break;
            }
        }
        Token end = LooseDirectiveEnd();
        if (positionalArgs != null) {
            result = new UnifiedCall(new Identifier(macroName), positionalArgs, (TemplateElement) null, (List) null);
        } else {
            result = new UnifiedCall(new Identifier(macroName), namedArgs, (TemplateElement) null, (List) null);
        }
        result.legacySyntax = true;
        result.setLocation(this.template, start, end);
        return result;
    }

    public final HashMap NamedArgs() throws ParseException {
        HashMap result = new HashMap();
        while (true) {
            Token t = jj_consume_token(FMParserConstants.ID);
            jj_consume_token(91);
            FMParserTokenManager fMParserTokenManager = this.token_source;
            FMParserTokenManager fMParserTokenManager2 = this.token_source;
            fMParserTokenManager.SwitchTo(4);
            this.token_source.inInvocation = true;
            Expression exp = Expression();
            result.put(t.image, exp);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.ID /* 120 */:
                default:
                    this.jj_la1[57] = this.jj_gen;
                    this.token_source.inInvocation = false;
                    return result;
            }
        }
    }

    public final ArrayList PositionalArgs() throws ParseException {
        ArrayList result = new ArrayList();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.STRING_LITERAL /* 81 */:
            case FMParserConstants.RAW_STRING /* 82 */:
            case FMParserConstants.FALSE /* 83 */:
            case FMParserConstants.TRUE /* 84 */:
            case FMParserConstants.INTEGER /* 85 */:
            case FMParserConstants.DECIMAL /* 86 */:
            case FMParserConstants.DOT /* 87 */:
            case FMParserConstants.PLUS /* 98 */:
            case FMParserConstants.MINUS /* 99 */:
            case FMParserConstants.EXCLAM /* 107 */:
            case FMParserConstants.OPEN_BRACKET /* 111 */:
            case FMParserConstants.OPEN_PAREN /* 113 */:
            case FMParserConstants.OPEN_BRACE /* 115 */:
            case FMParserConstants.ID /* 120 */:
                Expression arg = Expression();
                result.add(arg);
                while (true) {
                    switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                        case FMParserConstants.STRING_LITERAL /* 81 */:
                        case FMParserConstants.RAW_STRING /* 82 */:
                        case FMParserConstants.FALSE /* 83 */:
                        case FMParserConstants.TRUE /* 84 */:
                        case FMParserConstants.INTEGER /* 85 */:
                        case FMParserConstants.DECIMAL /* 86 */:
                        case FMParserConstants.DOT /* 87 */:
                        case FMParserConstants.PLUS /* 98 */:
                        case FMParserConstants.MINUS /* 99 */:
                        case FMParserConstants.EXCLAM /* 107 */:
                        case FMParserConstants.COMMA /* 108 */:
                        case FMParserConstants.OPEN_BRACKET /* 111 */:
                        case FMParserConstants.OPEN_PAREN /* 113 */:
                        case FMParserConstants.OPEN_BRACE /* 115 */:
                        case FMParserConstants.ID /* 120 */:
                            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                                case FMParserConstants.COMMA /* 108 */:
                                    jj_consume_token(FMParserConstants.COMMA);
                                    break;
                                default:
                                    this.jj_la1[59] = this.jj_gen;
                                    break;
                            }
                            Expression arg2 = Expression();
                            result.add(arg2);
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
                        case FMParserConstants.TIMES /* 100 */:
                        case FMParserConstants.DOUBLE_STAR /* 101 */:
                        case FMParserConstants.ELLIPSIS /* 102 */:
                        case FMParserConstants.DIVIDE /* 103 */:
                        case FMParserConstants.PERCENT /* 104 */:
                        case FMParserConstants.AND /* 105 */:
                        case FMParserConstants.OR /* 106 */:
                        case FMParserConstants.SEMICOLON /* 109 */:
                        case FMParserConstants.COLON /* 110 */:
                        case FMParserConstants.CLOSE_BRACKET /* 112 */:
                        case FMParserConstants.CLOSE_PAREN /* 114 */:
                        case FMParserConstants.CLOSE_BRACE /* 116 */:
                        case FMParserConstants.IN /* 117 */:
                        case FMParserConstants.AS /* 118 */:
                        case FMParserConstants.USING /* 119 */:
                        default:
                            this.jj_la1[58] = this.jj_gen;
                            break;
                    }
                }
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
            case FMParserConstants.TIMES /* 100 */:
            case FMParserConstants.DOUBLE_STAR /* 101 */:
            case FMParserConstants.ELLIPSIS /* 102 */:
            case FMParserConstants.DIVIDE /* 103 */:
            case FMParserConstants.PERCENT /* 104 */:
            case FMParserConstants.AND /* 105 */:
            case FMParserConstants.OR /* 106 */:
            case FMParserConstants.COMMA /* 108 */:
            case FMParserConstants.SEMICOLON /* 109 */:
            case FMParserConstants.COLON /* 110 */:
            case FMParserConstants.CLOSE_BRACKET /* 112 */:
            case FMParserConstants.CLOSE_PAREN /* 114 */:
            case FMParserConstants.CLOSE_BRACE /* 116 */:
            case FMParserConstants.IN /* 117 */:
            case FMParserConstants.AS /* 118 */:
            case FMParserConstants.USING /* 119 */:
            default:
                this.jj_la1[60] = this.jj_gen;
                break;
        }
        return result;
    }

    public final Comment Comment() throws ParseException {
        Token start;
        StringBuffer buf = new StringBuffer();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.COMMENT /* 28 */:
                start = jj_consume_token(28);
                break;
            case FMParserConstants.TERSE_COMMENT /* 29 */:
                start = jj_consume_token(29);
                break;
            default:
                this.jj_la1[61] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        Token end = UnparsedContent(buf);
        Comment result = new Comment(buf.toString());
        result.setLocation(this.template, start, end);
        return result;
    }

    public final TextBlock NoParse() throws ParseException {
        StringBuffer buf = new StringBuffer();
        Token start = jj_consume_token(30);
        Token end = UnparsedContent(buf);
        TextBlock result = new TextBlock(buf.toString(), true);
        result.setLocation(this.template, start, end);
        return result;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public final freemarker.core.TransformBlock Transform() throws freemarker.core.ParseException {
        /*
            Method dump skipped, instructions count: 315
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.FMParser.Transform():freemarker.core.TransformBlock");
    }

    public final SwitchBlock Switch() throws ParseException {
        boolean defaultFound = false;
        Token start = jj_consume_token(12);
        Expression switchExp = Expression();
        jj_consume_token(FMParserConstants.DIRECTIVE_END);
        this.switchNesting++;
        SwitchBlock switchBlock = new SwitchBlock(switchExp);
        while (jj_2_15(2)) {
            Case caseIns = Case();
            if (caseIns.condition == null) {
                if (defaultFound) {
                    throw new ParseException("You can only have one default case in a switch statement", this.template, start);
                }
                defaultFound = true;
            }
            switchBlock.addCase(caseIns);
        }
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.WHITESPACE /* 68 */:
                jj_consume_token(68);
                break;
            default:
                this.jj_la1[65] = this.jj_gen;
                break;
        }
        Token end = jj_consume_token(43);
        this.switchNesting--;
        switchBlock.setLocation(this.template, start, end);
        return switchBlock;
    }

    public final Case Case() throws ParseException {
        Token start;
        Expression exp;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.WHITESPACE /* 68 */:
                jj_consume_token(68);
                break;
            default:
                this.jj_la1[66] = this.jj_gen;
                break;
        }
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.CASE /* 13 */:
                start = jj_consume_token(13);
                exp = Expression();
                jj_consume_token(FMParserConstants.DIRECTIVE_END);
                break;
            case FMParserConstants.DEFAUL /* 53 */:
                start = jj_consume_token(53);
                exp = null;
                break;
            default:
                this.jj_la1[67] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        TemplateElement block = OptionalBlock();
        Case result = new Case(exp, block);
        result.setLocation(this.template, start, block);
        return result;
    }

    public final EscapeBlock Escape() throws ParseException {
        Token start = jj_consume_token(59);
        Token variable = jj_consume_token(FMParserConstants.ID);
        jj_consume_token(FMParserConstants.AS);
        Expression escapeExpr = Expression();
        jj_consume_token(FMParserConstants.DIRECTIVE_END);
        EscapeBlock result = new EscapeBlock(variable.image, escapeExpr, escapedExpression(escapeExpr));
        this.escapes.addFirst(result);
        TemplateElement content = OptionalBlock();
        result.setContent(content);
        this.escapes.removeFirst();
        Token end = jj_consume_token(60);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final NoEscapeBlock NoEscape() throws ParseException {
        Token start = jj_consume_token(61);
        if (this.escapes.isEmpty()) {
            throw new ParseException("noescape with no matching escape encountered.", this.template, start);
        }
        Object escape = this.escapes.removeFirst();
        TemplateElement content = OptionalBlock();
        Token end = jj_consume_token(62);
        this.escapes.addFirst(escape);
        NoEscapeBlock result = new NoEscapeBlock(content);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final Token LooseDirectiveEnd() throws ParseException {
        Token t;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case FMParserConstants.DIRECTIVE_END /* 124 */:
                t = jj_consume_token(FMParserConstants.DIRECTIVE_END);
                break;
            case FMParserConstants.EMPTY_DIRECTIVE_END /* 125 */:
                t = jj_consume_token(FMParserConstants.EMPTY_DIRECTIVE_END);
                break;
            default:
                this.jj_la1[68] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return t;
    }

    public final PropertySetting Setting() throws ParseException {
        Token start = jj_consume_token(26);
        Token key = jj_consume_token(FMParserConstants.ID);
        jj_consume_token(91);
        Expression value = Expression();
        Token end = LooseDirectiveEnd();
        PropertySetting result = new PropertySetting(key.image, value);
        result.setLocation(this.template, start, end);
        return result;
    }

    public final TemplateElement FreemarkerDirective() throws ParseException {
        TemplateElement tp;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case 6:
                tp = Attempt();
                break;
            case 7:
            case FMParserConstants.ELSE_IF /* 9 */:
            case FMParserConstants.CASE /* 13 */:
            case FMParserConstants.END_IF /* 31 */:
            case 32:
            case FMParserConstants.END_RECOVER /* 33 */:
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_GLOBAL /* 37 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.END_MACRO /* 40 */:
            case FMParserConstants.END_COMPRESS /* 41 */:
            case FMParserConstants.END_TRANSFORM /* 42 */:
            case FMParserConstants.END_SWITCH /* 43 */:
            case FMParserConstants.ELSE /* 44 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case FMParserConstants.END_NOESCAPE /* 62 */:
            default:
                this.jj_la1[69] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
            case 8:
                tp = If();
                break;
            case FMParserConstants.LIST /* 10 */:
                tp = List();
                break;
            case FMParserConstants.FOREACH /* 11 */:
                tp = ForEach();
                break;
            case FMParserConstants.SWITCH /* 12 */:
                tp = Switch();
                break;
            case FMParserConstants.ASSIGN /* 14 */:
            case FMParserConstants.GLOBALASSIGN /* 15 */:
            case 16:
                tp = Assign();
                break;
            case FMParserConstants._INCLUDE /* 17 */:
                tp = Include();
                break;
            case FMParserConstants.IMPORT /* 18 */:
                tp = Import();
                break;
            case FMParserConstants.FUNCTION /* 19 */:
            case FMParserConstants.MACRO /* 20 */:
                tp = Macro();
                break;
            case FMParserConstants.TRANSFORM /* 21 */:
                tp = Transform();
                break;
            case FMParserConstants.VISIT /* 22 */:
                tp = Visit();
                break;
            case FMParserConstants.STOP /* 23 */:
            case FMParserConstants.HALT /* 47 */:
                tp = Stop();
                break;
            case FMParserConstants.RETURN /* 24 */:
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
                tp = Return();
                break;
            case FMParserConstants.CALL /* 25 */:
                tp = Call();
                break;
            case FMParserConstants.SETTING /* 26 */:
                tp = Setting();
                break;
            case FMParserConstants.COMPRESS /* 27 */:
                tp = Compress();
                break;
            case FMParserConstants.COMMENT /* 28 */:
            case FMParserConstants.TERSE_COMMENT /* 29 */:
                tp = Comment();
                break;
            case FMParserConstants.NOPARSE /* 30 */:
                tp = NoParse();
                break;
            case FMParserConstants.BREAK /* 45 */:
                tp = Break();
                break;
            case FMParserConstants.FLUSH /* 48 */:
                tp = Flush();
                break;
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
                tp = Trim();
                break;
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
                tp = Nested();
                break;
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
                tp = Recurse();
                break;
            case FMParserConstants.FALLBACK /* 58 */:
                tp = FallBack();
                break;
            case FMParserConstants.ESCAPE /* 59 */:
                tp = Escape();
                break;
            case FMParserConstants.NOESCAPE /* 61 */:
                tp = NoEscape();
                break;
            case FMParserConstants.UNIFIED_CALL /* 63 */:
                tp = UnifiedMacroTransform();
                break;
        }
        return tp;
    }

    public final TextBlock PCData() throws ParseException {
        StringBuffer buf = new StringBuffer();
        Token t = null;
        Token start = null;
        Token prevToken = null;
        do {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.WHITESPACE /* 68 */:
                    prevToken = t;
                    t = jj_consume_token(68);
                    break;
                case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                    t = jj_consume_token(69);
                    break;
                case FMParserConstants.FALSE_ALERT /* 70 */:
                    t = jj_consume_token(70);
                    break;
                default:
                    this.jj_la1[70] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            buf.append(t.image);
            if (start == null) {
                start = t;
            }
            if (prevToken != null) {
                prevToken.next = null;
            }
        } while (jj_2_16(Integer.MAX_VALUE));
        if (this.stripText && this.contentNesting == 1) {
            return TextBlock.EMPTY_BLOCK;
        }
        TextBlock result = new TextBlock(buf.toString(), false);
        result.setLocation(this.template, start, t);
        return result;
    }

    public final Token UnparsedContent(StringBuffer buf) throws ParseException {
        Token t;
        while (true) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.TERSE_COMMENT_END /* 130 */:
                    t = jj_consume_token(FMParserConstants.TERSE_COMMENT_END);
                    break;
                case FMParserConstants.MAYBE_END /* 131 */:
                    t = jj_consume_token(FMParserConstants.MAYBE_END);
                    break;
                case FMParserConstants.KEEP_GOING /* 132 */:
                    t = jj_consume_token(FMParserConstants.KEEP_GOING);
                    break;
                case FMParserConstants.LONE_LESS_THAN_OR_DASH /* 133 */:
                    t = jj_consume_token(FMParserConstants.LONE_LESS_THAN_OR_DASH);
                    break;
                default:
                    this.jj_la1[71] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            buf.append(t.image);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.TERSE_COMMENT_END /* 130 */:
                case FMParserConstants.MAYBE_END /* 131 */:
                case FMParserConstants.KEEP_GOING /* 132 */:
                case FMParserConstants.LONE_LESS_THAN_OR_DASH /* 133 */:
                default:
                    this.jj_la1[72] = this.jj_gen;
                    buf.setLength(buf.length() - t.image.length());
                    return t;
            }
        }
    }

    public final TemplateElement Content() throws ParseException {
        TemplateElement elem;
        MixedContent nodes = new MixedContent();
        TemplateElement begin = null;
        this.contentNesting++;
        while (true) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case 6:
                case 8:
                case FMParserConstants.LIST /* 10 */:
                case FMParserConstants.FOREACH /* 11 */:
                case FMParserConstants.SWITCH /* 12 */:
                case FMParserConstants.ASSIGN /* 14 */:
                case FMParserConstants.GLOBALASSIGN /* 15 */:
                case 16:
                case FMParserConstants._INCLUDE /* 17 */:
                case FMParserConstants.IMPORT /* 18 */:
                case FMParserConstants.FUNCTION /* 19 */:
                case FMParserConstants.MACRO /* 20 */:
                case FMParserConstants.TRANSFORM /* 21 */:
                case FMParserConstants.VISIT /* 22 */:
                case FMParserConstants.STOP /* 23 */:
                case FMParserConstants.RETURN /* 24 */:
                case FMParserConstants.CALL /* 25 */:
                case FMParserConstants.SETTING /* 26 */:
                case FMParserConstants.COMPRESS /* 27 */:
                case FMParserConstants.COMMENT /* 28 */:
                case FMParserConstants.TERSE_COMMENT /* 29 */:
                case FMParserConstants.NOPARSE /* 30 */:
                case FMParserConstants.BREAK /* 45 */:
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                case FMParserConstants.HALT /* 47 */:
                case FMParserConstants.FLUSH /* 48 */:
                case FMParserConstants.TRIM /* 49 */:
                case FMParserConstants.LTRIM /* 50 */:
                case FMParserConstants.RTRIM /* 51 */:
                case FMParserConstants.NOTRIM /* 52 */:
                case FMParserConstants.SIMPLE_NESTED /* 54 */:
                case FMParserConstants.NESTED /* 55 */:
                case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                case FMParserConstants.RECURSE /* 57 */:
                case FMParserConstants.FALLBACK /* 58 */:
                case FMParserConstants.ESCAPE /* 59 */:
                case FMParserConstants.NOESCAPE /* 61 */:
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                    elem = FreemarkerDirective();
                    break;
                case 7:
                case FMParserConstants.ELSE_IF /* 9 */:
                case FMParserConstants.CASE /* 13 */:
                case FMParserConstants.END_IF /* 31 */:
                case 32:
                case FMParserConstants.END_RECOVER /* 33 */:
                case FMParserConstants.END_ATTEMPT /* 34 */:
                case FMParserConstants.END_FOREACH /* 35 */:
                case FMParserConstants.END_LOCAL /* 36 */:
                case FMParserConstants.END_GLOBAL /* 37 */:
                case FMParserConstants.END_ASSIGN /* 38 */:
                case FMParserConstants.END_FUNCTION /* 39 */:
                case FMParserConstants.END_MACRO /* 40 */:
                case FMParserConstants.END_COMPRESS /* 41 */:
                case FMParserConstants.END_TRANSFORM /* 42 */:
                case FMParserConstants.END_SWITCH /* 43 */:
                case FMParserConstants.ELSE /* 44 */:
                case FMParserConstants.DEFAUL /* 53 */:
                case FMParserConstants.END_ESCAPE /* 60 */:
                case FMParserConstants.END_NOESCAPE /* 62 */:
                case 64:
                case FMParserConstants.FTL_HEADER /* 65 */:
                case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                default:
                    this.jj_la1[73] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
                case FMParserConstants.WHITESPACE /* 68 */:
                case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                case FMParserConstants.FALSE_ALERT /* 70 */:
                    elem = PCData();
                    break;
                case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                    elem = StringOutput();
                    break;
                case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                    elem = NumericalOutput();
                    break;
            }
            if (begin == null) {
                begin = elem;
            }
            nodes.addElement(elem);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case 6:
                case 8:
                case FMParserConstants.LIST /* 10 */:
                case FMParserConstants.FOREACH /* 11 */:
                case FMParserConstants.SWITCH /* 12 */:
                case FMParserConstants.ASSIGN /* 14 */:
                case FMParserConstants.GLOBALASSIGN /* 15 */:
                case 16:
                case FMParserConstants._INCLUDE /* 17 */:
                case FMParserConstants.IMPORT /* 18 */:
                case FMParserConstants.FUNCTION /* 19 */:
                case FMParserConstants.MACRO /* 20 */:
                case FMParserConstants.TRANSFORM /* 21 */:
                case FMParserConstants.VISIT /* 22 */:
                case FMParserConstants.STOP /* 23 */:
                case FMParserConstants.RETURN /* 24 */:
                case FMParserConstants.CALL /* 25 */:
                case FMParserConstants.SETTING /* 26 */:
                case FMParserConstants.COMPRESS /* 27 */:
                case FMParserConstants.COMMENT /* 28 */:
                case FMParserConstants.TERSE_COMMENT /* 29 */:
                case FMParserConstants.NOPARSE /* 30 */:
                case FMParserConstants.BREAK /* 45 */:
                case FMParserConstants.SIMPLE_RETURN /* 46 */:
                case FMParserConstants.HALT /* 47 */:
                case FMParserConstants.FLUSH /* 48 */:
                case FMParserConstants.TRIM /* 49 */:
                case FMParserConstants.LTRIM /* 50 */:
                case FMParserConstants.RTRIM /* 51 */:
                case FMParserConstants.NOTRIM /* 52 */:
                case FMParserConstants.SIMPLE_NESTED /* 54 */:
                case FMParserConstants.NESTED /* 55 */:
                case FMParserConstants.SIMPLE_RECURSE /* 56 */:
                case FMParserConstants.RECURSE /* 57 */:
                case FMParserConstants.FALLBACK /* 58 */:
                case FMParserConstants.ESCAPE /* 59 */:
                case FMParserConstants.NOESCAPE /* 61 */:
                case FMParserConstants.UNIFIED_CALL /* 63 */:
                case FMParserConstants.WHITESPACE /* 68 */:
                case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                case FMParserConstants.FALSE_ALERT /* 70 */:
                case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                case 7:
                case FMParserConstants.ELSE_IF /* 9 */:
                case FMParserConstants.CASE /* 13 */:
                case FMParserConstants.END_IF /* 31 */:
                case 32:
                case FMParserConstants.END_RECOVER /* 33 */:
                case FMParserConstants.END_ATTEMPT /* 34 */:
                case FMParserConstants.END_FOREACH /* 35 */:
                case FMParserConstants.END_LOCAL /* 36 */:
                case FMParserConstants.END_GLOBAL /* 37 */:
                case FMParserConstants.END_ASSIGN /* 38 */:
                case FMParserConstants.END_FUNCTION /* 39 */:
                case FMParserConstants.END_MACRO /* 40 */:
                case FMParserConstants.END_COMPRESS /* 41 */:
                case FMParserConstants.END_TRANSFORM /* 42 */:
                case FMParserConstants.END_SWITCH /* 43 */:
                case FMParserConstants.ELSE /* 44 */:
                case FMParserConstants.DEFAUL /* 53 */:
                case FMParserConstants.END_ESCAPE /* 60 */:
                case FMParserConstants.END_NOESCAPE /* 62 */:
                case 64:
                case FMParserConstants.FTL_HEADER /* 65 */:
                case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
                case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
                default:
                    this.jj_la1[74] = this.jj_gen;
                    this.contentNesting--;
                    nodes.setLocation(this.template, begin, elem);
                    return nodes;
            }
        }
    }

    public final TemplateElement FreeMarkerText() throws ParseException {
        TemplateElement elem;
        MixedContent nodes = new MixedContent();
        TemplateElement begin = null;
        while (true) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.WHITESPACE /* 68 */:
                case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                case FMParserConstants.FALSE_ALERT /* 70 */:
                    elem = PCData();
                    break;
                case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                    elem = StringOutput();
                    break;
                case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                    elem = NumericalOutput();
                    break;
                default:
                    this.jj_la1[75] = this.jj_gen;
                    jj_consume_token(-1);
                    throw new ParseException();
            }
            if (begin == null) {
                begin = elem;
            }
            nodes.addElement(elem);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.WHITESPACE /* 68 */:
                case FMParserConstants.PRINTABLE_CHARS /* 69 */:
                case FMParserConstants.FALSE_ALERT /* 70 */:
                case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
                case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                default:
                    this.jj_la1[76] = this.jj_gen;
                    nodes.setLocation(this.template, begin, elem);
                    return nodes;
            }
        }
    }

    public final TemplateElement OptionalBlock() throws ParseException {
        TemplateElement tp = TextBlock.EMPTY_BLOCK;
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case 6:
            case 8:
            case FMParserConstants.LIST /* 10 */:
            case FMParserConstants.FOREACH /* 11 */:
            case FMParserConstants.SWITCH /* 12 */:
            case FMParserConstants.ASSIGN /* 14 */:
            case FMParserConstants.GLOBALASSIGN /* 15 */:
            case 16:
            case FMParserConstants._INCLUDE /* 17 */:
            case FMParserConstants.IMPORT /* 18 */:
            case FMParserConstants.FUNCTION /* 19 */:
            case FMParserConstants.MACRO /* 20 */:
            case FMParserConstants.TRANSFORM /* 21 */:
            case FMParserConstants.VISIT /* 22 */:
            case FMParserConstants.STOP /* 23 */:
            case FMParserConstants.RETURN /* 24 */:
            case FMParserConstants.CALL /* 25 */:
            case FMParserConstants.SETTING /* 26 */:
            case FMParserConstants.COMPRESS /* 27 */:
            case FMParserConstants.COMMENT /* 28 */:
            case FMParserConstants.TERSE_COMMENT /* 29 */:
            case FMParserConstants.NOPARSE /* 30 */:
            case FMParserConstants.BREAK /* 45 */:
            case FMParserConstants.SIMPLE_RETURN /* 46 */:
            case FMParserConstants.HALT /* 47 */:
            case FMParserConstants.FLUSH /* 48 */:
            case FMParserConstants.TRIM /* 49 */:
            case FMParserConstants.LTRIM /* 50 */:
            case FMParserConstants.RTRIM /* 51 */:
            case FMParserConstants.NOTRIM /* 52 */:
            case FMParserConstants.SIMPLE_NESTED /* 54 */:
            case FMParserConstants.NESTED /* 55 */:
            case FMParserConstants.SIMPLE_RECURSE /* 56 */:
            case FMParserConstants.RECURSE /* 57 */:
            case FMParserConstants.FALLBACK /* 58 */:
            case FMParserConstants.ESCAPE /* 59 */:
            case FMParserConstants.NOESCAPE /* 61 */:
            case FMParserConstants.UNIFIED_CALL /* 63 */:
            case FMParserConstants.WHITESPACE /* 68 */:
            case FMParserConstants.PRINTABLE_CHARS /* 69 */:
            case FMParserConstants.FALSE_ALERT /* 70 */:
            case FMParserConstants.OUTPUT_ESCAPE /* 71 */:
            case FMParserConstants.NUMERICAL_ESCAPE /* 72 */:
                tp = Content();
                break;
            case 7:
            case FMParserConstants.ELSE_IF /* 9 */:
            case FMParserConstants.CASE /* 13 */:
            case FMParserConstants.END_IF /* 31 */:
            case 32:
            case FMParserConstants.END_RECOVER /* 33 */:
            case FMParserConstants.END_ATTEMPT /* 34 */:
            case FMParserConstants.END_FOREACH /* 35 */:
            case FMParserConstants.END_LOCAL /* 36 */:
            case FMParserConstants.END_GLOBAL /* 37 */:
            case FMParserConstants.END_ASSIGN /* 38 */:
            case FMParserConstants.END_FUNCTION /* 39 */:
            case FMParserConstants.END_MACRO /* 40 */:
            case FMParserConstants.END_COMPRESS /* 41 */:
            case FMParserConstants.END_TRANSFORM /* 42 */:
            case FMParserConstants.END_SWITCH /* 43 */:
            case FMParserConstants.ELSE /* 44 */:
            case FMParserConstants.DEFAUL /* 53 */:
            case FMParserConstants.END_ESCAPE /* 60 */:
            case FMParserConstants.END_NOESCAPE /* 62 */:
            case 64:
            case FMParserConstants.FTL_HEADER /* 65 */:
            case FMParserConstants.TRIVIAL_FTL_HEADER /* 66 */:
            case FMParserConstants.UNKNOWN_DIRECTIVE /* 67 */:
            default:
                this.jj_la1[77] = this.jj_gen;
                break;
        }
        return tp;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.processFallThroughCases(SwitchRegionMaker.java:105)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    /* JADX WARN: Multi-variable type inference failed */
    public final void HeaderElement() throws freemarker.core.ParseException {
        /*
            Method dump skipped, instructions count: 798
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.FMParser.HeaderElement():void");
    }

    public final Map ParamList() throws ParseException {
        Map result = new HashMap();
        while (true) {
            Identifier id = Identifier();
            jj_consume_token(91);
            Expression exp = Expression();
            result.put(id.toString(), exp);
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.COMMA /* 108 */:
                    jj_consume_token(FMParserConstants.COMMA);
                    break;
                default:
                    this.jj_la1[81] = this.jj_gen;
                    break;
            }
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case FMParserConstants.ID /* 120 */:
                default:
                    this.jj_la1[82] = this.jj_gen;
                    return result;
            }
        }
    }

    public final TemplateElement Root() throws ParseException {
        if (jj_2_17(Integer.MAX_VALUE)) {
            HeaderElement();
        }
        TemplateElement doc = OptionalBlock();
        jj_consume_token(0);
        doc.setParentRecursively(null);
        return doc.postParseCleanup(this.stripWhitespace);
    }

    private final boolean jj_2_1(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_1();
            jj_save(0, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(0, xla);
            return true;
        } catch (Throwable th) {
            jj_save(0, xla);
            throw th;
        }
    }

    private final boolean jj_2_2(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_2();
            jj_save(1, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(1, xla);
            return true;
        } catch (Throwable th) {
            jj_save(1, xla);
            throw th;
        }
    }

    private final boolean jj_2_3(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_3();
            jj_save(2, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(2, xla);
            return true;
        } catch (Throwable th) {
            jj_save(2, xla);
            throw th;
        }
    }

    private final boolean jj_2_4(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_4();
            jj_save(3, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(3, xla);
            return true;
        } catch (Throwable th) {
            jj_save(3, xla);
            throw th;
        }
    }

    private final boolean jj_2_5(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_5();
            jj_save(4, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(4, xla);
            return true;
        } catch (Throwable th) {
            jj_save(4, xla);
            throw th;
        }
    }

    private final boolean jj_2_6(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_6();
            jj_save(5, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(5, xla);
            return true;
        } catch (Throwable th) {
            jj_save(5, xla);
            throw th;
        }
    }

    private final boolean jj_2_7(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_7();
            jj_save(6, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(6, xla);
            return true;
        } catch (Throwable th) {
            jj_save(6, xla);
            throw th;
        }
    }

    private final boolean jj_2_8(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_8();
            jj_save(7, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(7, xla);
            return true;
        } catch (Throwable th) {
            jj_save(7, xla);
            throw th;
        }
    }

    private final boolean jj_2_9(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_9();
            jj_save(8, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(8, xla);
            return true;
        } catch (Throwable th) {
            jj_save(8, xla);
            throw th;
        }
    }

    private final boolean jj_2_10(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_10();
            jj_save(9, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(9, xla);
            return true;
        } catch (Throwable th) {
            jj_save(9, xla);
            throw th;
        }
    }

    private final boolean jj_2_11(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_11();
            jj_save(10, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(10, xla);
            return true;
        } catch (Throwable th) {
            jj_save(10, xla);
            throw th;
        }
    }

    private final boolean jj_2_12(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_12();
            jj_save(11, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(11, xla);
            return true;
        } catch (Throwable th) {
            jj_save(11, xla);
            throw th;
        }
    }

    private final boolean jj_2_13(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_13();
            jj_save(12, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(12, xla);
            return true;
        } catch (Throwable th) {
            jj_save(12, xla);
            throw th;
        }
    }

    private final boolean jj_2_14(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_14();
            jj_save(13, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(13, xla);
            return true;
        } catch (Throwable th) {
            jj_save(13, xla);
            throw th;
        }
    }

    private final boolean jj_2_15(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_15();
            jj_save(14, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(14, xla);
            return true;
        } catch (Throwable th) {
            jj_save(14, xla);
            throw th;
        }
    }

    private final boolean jj_2_16(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_16();
            jj_save(15, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(15, xla);
            return true;
        } catch (Throwable th) {
            jj_save(15, xla);
            throw th;
        }
    }

    private final boolean jj_2_17(int xla) {
        this.jj_la = xla;
        Token token = this.token;
        this.jj_scanpos = token;
        this.jj_lastpos = token;
        try {
            boolean z = !jj_3_17();
            jj_save(16, xla);
            return z;
        } catch (LookaheadSuccess e) {
            jj_save(16, xla);
            return true;
        } catch (Throwable th) {
            jj_save(16, xla);
            throw th;
        }
    }

    private final boolean jj_3R_92() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(20)) {
            this.jj_scanpos = xsp;
            return jj_3R_122();
        }
        return false;
    }

    private final boolean jj_3R_169() {
        if (jj_scan_token(87)) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.ID)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(100)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(FMParserConstants.DOUBLE_STAR)) {
                    this.jj_scanpos = xsp;
                    return jj_3R_176();
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_88() {
        return jj_scan_token(11);
    }

    private final boolean jj_3_2() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(98)) {
            this.jj_scanpos = xsp;
            return jj_scan_token(99);
        }
        return false;
    }

    private final boolean jj_3R_84() {
        return jj_scan_token(99);
    }

    private final boolean jj_3R_83() {
        return jj_scan_token(98);
    }

    private final boolean jj_3R_107() {
        return jj_scan_token(59);
    }

    private final boolean jj_3R_51() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_83()) {
            this.jj_scanpos = xsp;
            if (jj_3R_84()) {
                return true;
            }
        }
        return jj_3R_50();
    }

    private final boolean jj_3R_44() {
        Token xsp;
        if (jj_3R_50()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_51());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_172() {
        return jj_scan_token(89) || jj_scan_token(FMParserConstants.ID);
    }

    private final boolean jj_3R_91() {
        return jj_scan_token(18);
    }

    private final boolean jj_3R_27() {
        return jj_scan_token(53);
    }

    private final boolean jj_3R_87() {
        return jj_scan_token(10);
    }

    private final boolean jj_3R_26() {
        return jj_scan_token(13) || jj_3R_23();
    }

    private final boolean jj_3R_24() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(68)) {
            this.jj_scanpos = xsp;
        }
        Token xsp2 = this.jj_scanpos;
        if (jj_3R_26()) {
            this.jj_scanpos = xsp2;
            if (jj_3R_27()) {
                return true;
            }
        }
        return jj_3R_28();
    }

    private final boolean jj_3R_136() {
        return jj_scan_token(99);
    }

    private final boolean jj_3R_174() {
        return jj_scan_token(90);
    }

    private final boolean jj_3R_133() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(98)) {
            this.jj_scanpos = xsp;
            if (jj_3R_136()) {
                return true;
            }
        }
        return jj_3R_135();
    }

    private final boolean jj_3_10() {
        return jj_3R_23();
    }

    private final boolean jj_3R_178() {
        return jj_3R_23();
    }

    private final boolean jj_3R_90() {
        return jj_scan_token(17);
    }

    private final boolean jj_3R_137() {
        return jj_scan_token(FMParserConstants.EXCLAM);
    }

    private final boolean jj_3R_177() {
        if (jj_scan_token(FMParserConstants.EXCLAM)) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_178()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3_15() {
        return jj_3R_24();
    }

    private final boolean jj_3R_134() {
        Token xsp;
        if (jj_3R_137()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_137());
        this.jj_scanpos = xsp;
        return jj_3R_135();
    }

    private final boolean jj_3R_173() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.TERMINATING_EXCLAM)) {
            this.jj_scanpos = xsp;
            return jj_3R_177();
        }
        return false;
    }

    private final boolean jj_3R_112() {
        return jj_scan_token(6);
    }

    private final boolean jj_3R_99() {
        return jj_scan_token(12);
    }

    private final boolean jj_3R_166() {
        return jj_3R_174();
    }

    private final boolean jj_3R_165() {
        return jj_3R_173();
    }

    private final boolean jj_3R_164() {
        return jj_3R_172();
    }

    private final boolean jj_3R_163() {
        return jj_3R_171();
    }

    private final boolean jj_3R_162() {
        return jj_3R_170();
    }

    private final boolean jj_3R_161() {
        return jj_3R_169();
    }

    private final boolean jj_3R_155() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_161()) {
            this.jj_scanpos = xsp;
            if (jj_3R_162()) {
                this.jj_scanpos = xsp;
                if (jj_3R_163()) {
                    this.jj_scanpos = xsp;
                    if (jj_3R_164()) {
                        this.jj_scanpos = xsp;
                        if (jj_3R_165()) {
                            this.jj_scanpos = xsp;
                            return jj_3R_166();
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_115() {
        return jj_3R_135();
    }

    private final boolean jj_3R_114() {
        return jj_3R_134();
    }

    private final boolean jj_3R_113() {
        return jj_3R_133();
    }

    private final boolean jj_3R_98() {
        return jj_scan_token(21);
    }

    private final boolean jj_3R_81() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_113()) {
            this.jj_scanpos = xsp;
            if (jj_3R_114()) {
                this.jj_scanpos = xsp;
                return jj_3R_115();
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3_11() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.COMMA)) {
            this.jj_scanpos = xsp;
        }
        Token xsp2 = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.ID)) {
            this.jj_scanpos = xsp2;
            if (jj_scan_token(81)) {
                return true;
            }
        }
        return jj_scan_token(91);
    }

    private final boolean jj_3R_31() {
        return jj_3R_34();
    }

    private final boolean jj_3R_86() {
        return jj_scan_token(8);
    }

    private final boolean jj_3R_28() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_31()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_154() {
        return jj_scan_token(87) || jj_scan_token(FMParserConstants.ID);
    }

    private final boolean jj_3R_97() {
        return jj_scan_token(30);
    }

    private final boolean jj_3R_153() {
        return jj_scan_token(FMParserConstants.OPEN_PAREN) || jj_3R_23() || jj_scan_token(FMParserConstants.CLOSE_PAREN);
    }

    private final boolean jj_3_1() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(87)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(FMParserConstants.OPEN_BRACKET)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(FMParserConstants.OPEN_PAREN)) {
                    this.jj_scanpos = xsp;
                    if (jj_scan_token(89)) {
                        this.jj_scanpos = xsp;
                        if (jj_scan_token(FMParserConstants.EXCLAM)) {
                            this.jj_scanpos = xsp;
                            if (jj_scan_token(FMParserConstants.TERMINATING_EXCLAM)) {
                                this.jj_scanpos = xsp;
                                return jj_scan_token(90);
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_96() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(28)) {
            this.jj_scanpos = xsp;
            return jj_scan_token(29);
        }
        return false;
    }

    private final boolean jj_3R_121() {
        return jj_scan_token(16);
    }

    private final boolean jj_3R_146() {
        return jj_3R_155();
    }

    private final boolean jj_3R_120() {
        return jj_scan_token(15);
    }

    private final boolean jj_3R_152() {
        return jj_scan_token(FMParserConstants.ID);
    }

    private final boolean jj_3R_145() {
        return jj_3R_154();
    }

    private final boolean jj_3R_119() {
        return jj_scan_token(14);
    }

    private final boolean jj_3R_144() {
        return jj_3R_153();
    }

    private final boolean jj_3R_89() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_119()) {
            this.jj_scanpos = xsp;
            if (jj_3R_120()) {
                this.jj_scanpos = xsp;
                return jj_3R_121();
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_143() {
        return jj_3R_152();
    }

    private final boolean jj_3R_175() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.COMMA)) {
            this.jj_scanpos = xsp;
        }
        return jj_3R_23();
    }

    private final boolean jj_3R_142() {
        return jj_3R_151();
    }

    private final boolean jj_3R_141() {
        return jj_3R_150();
    }

    private final boolean jj_3R_140() {
        return jj_3R_149();
    }

    private final boolean jj_3R_168() {
        Token xsp;
        if (jj_3R_23()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_175());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_139() {
        return jj_3R_148();
    }

    private final boolean jj_3R_138() {
        return jj_3R_147();
    }

    private final boolean jj_3R_160() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_168()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_135() {
        Token xsp;
        Token xsp2 = this.jj_scanpos;
        if (jj_3R_138()) {
            this.jj_scanpos = xsp2;
            if (jj_3R_139()) {
                this.jj_scanpos = xsp2;
                if (jj_3R_140()) {
                    this.jj_scanpos = xsp2;
                    if (jj_3R_141()) {
                        this.jj_scanpos = xsp2;
                        if (jj_3R_142()) {
                            this.jj_scanpos = xsp2;
                            if (jj_3R_143()) {
                                this.jj_scanpos = xsp2;
                                if (jj_3R_144()) {
                                    this.jj_scanpos = xsp2;
                                    if (jj_3R_145()) {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_146());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_147() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(85)) {
            this.jj_scanpos = xsp;
            return jj_scan_token(86);
        }
        return false;
    }

    private final boolean jj_3R_43() {
        return jj_3R_49();
    }

    private final boolean jj_3R_129() {
        return jj_scan_token(52);
    }

    private final boolean jj_3R_42() {
        return jj_3R_48();
    }

    private final boolean jj_3R_128() {
        return jj_scan_token(51);
    }

    private final boolean jj_3R_41() {
        return jj_3R_47();
    }

    private final boolean jj_3R_127() {
        return jj_scan_token(50);
    }

    private final boolean jj_3R_40() {
        return jj_3R_46();
    }

    private final boolean jj_3R_126() {
        return jj_scan_token(49);
    }

    private final boolean jj_3R_105() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_126()) {
            this.jj_scanpos = xsp;
            if (jj_3R_127()) {
                this.jj_scanpos = xsp;
                if (jj_3R_128()) {
                    this.jj_scanpos = xsp;
                    return jj_3R_129();
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_37() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_40()) {
            this.jj_scanpos = xsp;
            if (jj_3R_41()) {
                this.jj_scanpos = xsp;
                if (jj_3R_42()) {
                    this.jj_scanpos = xsp;
                    return jj_3R_43();
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_151() {
        return jj_scan_token(FMParserConstants.OPEN_BRACKET) || jj_3R_160() || jj_scan_token(FMParserConstants.CLOSE_BRACKET);
    }

    private final boolean jj_3R_23() {
        return jj_3R_25();
    }

    private final boolean jj_3R_34() {
        Token xsp;
        if (jj_3R_37()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_37());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3_9() {
        return jj_scan_token(FMParserConstants.OR);
    }

    private final boolean jj_3R_48() {
        return jj_scan_token(72);
    }

    private final boolean jj_3R_104() {
        return jj_scan_token(48);
    }

    private final boolean jj_3_13() {
        return jj_scan_token(FMParserConstants.OPEN_PAREN);
    }

    private final boolean jj_3R_30() {
        return jj_scan_token(FMParserConstants.OR) || jj_3R_29();
    }

    private final boolean jj_3R_25() {
        Token xsp;
        if (jj_3R_29()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_30());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3_14() {
        return jj_scan_token(FMParserConstants.ID) || jj_scan_token(91);
    }

    private final boolean jj_3R_47() {
        return jj_scan_token(71);
    }

    private final boolean jj_3_8() {
        return jj_scan_token(FMParserConstants.AND);
    }

    private final boolean jj_3R_131() {
        return jj_scan_token(55);
    }

    private final boolean jj_3R_130() {
        return jj_scan_token(54);
    }

    private final boolean jj_3R_95() {
        return jj_scan_token(25);
    }

    private final boolean jj_3R_33() {
        return jj_scan_token(FMParserConstants.AND) || jj_3R_32();
    }

    private final boolean jj_3_16() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(68)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(69)) {
                this.jj_scanpos = xsp;
                return jj_scan_token(70);
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_106() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_130()) {
            this.jj_scanpos = xsp;
            return jj_3R_131();
        }
        return false;
    }

    private final boolean jj_3R_29() {
        Token xsp;
        if (jj_3R_32()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_33());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_85() {
        return jj_scan_token(68);
    }

    private final boolean jj_3R_167() {
        if (jj_scan_token(FMParserConstants.COMMA) || jj_3R_23()) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.COMMA)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(FMParserConstants.COLON)) {
                return true;
            }
        }
        return jj_3R_23();
    }

    private final boolean jj_3R_53() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_85()) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(69)) {
                this.jj_scanpos = xsp;
                return jj_scan_token(70);
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_46() {
        Token xsp;
        if (jj_3R_53()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_53());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_125() {
        return jj_scan_token(23);
    }

    private final boolean jj_3_6() {
        return jj_3R_23();
    }

    private final boolean jj_3R_103() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(47)) {
            this.jj_scanpos = xsp;
            return jj_3R_125();
        }
        return false;
    }

    private final boolean jj_3R_156() {
        Token xsp;
        if (jj_3R_23()) {
            return true;
        }
        Token xsp2 = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.COMMA)) {
            this.jj_scanpos = xsp2;
            if (jj_scan_token(FMParserConstants.COLON)) {
                return true;
            }
        }
        if (jj_3R_23()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_167());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3_7() {
        return jj_scan_token(88);
    }

    private final boolean jj_3R_148() {
        if (jj_scan_token(FMParserConstants.OPEN_BRACE)) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_156()) {
            this.jj_scanpos = xsp;
        }
        return jj_scan_token(FMParserConstants.CLOSE_BRACE);
    }

    private final boolean jj_3R_52() {
        return jj_3R_44();
    }

    private final boolean jj_3R_80() {
        return jj_3R_112();
    }

    private final boolean jj_3R_79() {
        return jj_3R_111();
    }

    private final boolean jj_3R_45() {
        if (jj_scan_token(88)) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_52()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_78() {
        return jj_3R_110();
    }

    private final boolean jj_3_12() {
        return jj_scan_token(FMParserConstants.ID) || jj_scan_token(91);
    }

    private final boolean jj_3R_77() {
        return jj_3R_109();
    }

    private final boolean jj_3R_38() {
        if (jj_3R_44()) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_45()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_76() {
        return jj_3R_108();
    }

    private final boolean jj_3R_159() {
        return jj_scan_token(84);
    }

    private final boolean jj_3R_75() {
        return jj_3R_107();
    }

    private final boolean jj_3R_158() {
        return jj_scan_token(83);
    }

    private final boolean jj_3R_74() {
        return jj_3R_106();
    }

    private final boolean jj_3R_73() {
        return jj_3R_105();
    }

    private final boolean jj_3R_124() {
        return jj_scan_token(24);
    }

    private final boolean jj_3R_72() {
        return jj_3R_104();
    }

    private final boolean jj_3R_150() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_158()) {
            this.jj_scanpos = xsp;
            return jj_3R_159();
        }
        return false;
    }

    private final boolean jj_3R_123() {
        return jj_scan_token(46);
    }

    private final boolean jj_3R_71() {
        return jj_3R_103();
    }

    private final boolean jj_3R_70() {
        return jj_3R_102();
    }

    private final boolean jj_3R_102() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_123()) {
            this.jj_scanpos = xsp;
            return jj_3R_124();
        }
        return false;
    }

    private final boolean jj_3R_69() {
        return jj_3R_101();
    }

    private final boolean jj_3R_68() {
        return jj_3R_100();
    }

    private final boolean jj_3R_67() {
        return jj_3R_99();
    }

    private final boolean jj_3R_94() {
        return jj_scan_token(63);
    }

    private final boolean jj_3R_66() {
        return jj_3R_98();
    }

    private final boolean jj_3R_65() {
        return jj_3R_97();
    }

    private final boolean jj_3_5() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.NATURAL_GTE)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(97)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(FMParserConstants.NATURAL_GT)) {
                    this.jj_scanpos = xsp;
                    if (jj_scan_token(96)) {
                        this.jj_scanpos = xsp;
                        if (jj_scan_token(95)) {
                            this.jj_scanpos = xsp;
                            if (jj_scan_token(95)) {
                                this.jj_scanpos = xsp;
                                return jj_scan_token(94);
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_64() {
        return jj_3R_96();
    }

    private final boolean jj_3R_63() {
        return jj_3R_95();
    }

    private final boolean jj_3R_62() {
        return jj_3R_94();
    }

    private final boolean jj_3R_61() {
        return jj_3R_93();
    }

    private final boolean jj_3R_60() {
        return jj_3R_92();
    }

    private final boolean jj_3R_39() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(FMParserConstants.NATURAL_GTE)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(97)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(FMParserConstants.NATURAL_GT)) {
                    this.jj_scanpos = xsp;
                    if (jj_scan_token(96)) {
                        this.jj_scanpos = xsp;
                        if (jj_scan_token(95)) {
                            this.jj_scanpos = xsp;
                            if (jj_scan_token(94)) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return jj_3R_38();
    }

    private final boolean jj_3R_59() {
        return jj_3R_91();
    }

    private final boolean jj_3R_101() {
        return jj_scan_token(45);
    }

    private final boolean jj_3R_58() {
        return jj_3R_90();
    }

    private final boolean jj_3R_35() {
        if (jj_3R_38()) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_39()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_57() {
        return jj_3R_89();
    }

    private final boolean jj_3R_157() {
        return jj_scan_token(82);
    }

    private final boolean jj_3R_93() {
        return jj_scan_token(27);
    }

    private final boolean jj_3R_56() {
        return jj_3R_88();
    }

    private final boolean jj_3R_55() {
        return jj_3R_87();
    }

    private final boolean jj_3R_149() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(81)) {
            this.jj_scanpos = xsp;
            return jj_3R_157();
        }
        return false;
    }

    private final boolean jj_3R_54() {
        return jj_3R_86();
    }

    private final boolean jj_3R_49() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_54()) {
            this.jj_scanpos = xsp;
            if (jj_3R_55()) {
                this.jj_scanpos = xsp;
                if (jj_3R_56()) {
                    this.jj_scanpos = xsp;
                    if (jj_3R_57()) {
                        this.jj_scanpos = xsp;
                        if (jj_3R_58()) {
                            this.jj_scanpos = xsp;
                            if (jj_3R_59()) {
                                this.jj_scanpos = xsp;
                                if (jj_3R_60()) {
                                    this.jj_scanpos = xsp;
                                    if (jj_3R_61()) {
                                        this.jj_scanpos = xsp;
                                        if (jj_3R_62()) {
                                            this.jj_scanpos = xsp;
                                            if (jj_3R_63()) {
                                                this.jj_scanpos = xsp;
                                                if (jj_3R_64()) {
                                                    this.jj_scanpos = xsp;
                                                    if (jj_3R_65()) {
                                                        this.jj_scanpos = xsp;
                                                        if (jj_3R_66()) {
                                                            this.jj_scanpos = xsp;
                                                            if (jj_3R_67()) {
                                                                this.jj_scanpos = xsp;
                                                                if (jj_3R_68()) {
                                                                    this.jj_scanpos = xsp;
                                                                    if (jj_3R_69()) {
                                                                        this.jj_scanpos = xsp;
                                                                        if (jj_3R_70()) {
                                                                            this.jj_scanpos = xsp;
                                                                            if (jj_3R_71()) {
                                                                                this.jj_scanpos = xsp;
                                                                                if (jj_3R_72()) {
                                                                                    this.jj_scanpos = xsp;
                                                                                    if (jj_3R_73()) {
                                                                                        this.jj_scanpos = xsp;
                                                                                        if (jj_3R_74()) {
                                                                                            this.jj_scanpos = xsp;
                                                                                            if (jj_3R_75()) {
                                                                                                this.jj_scanpos = xsp;
                                                                                                if (jj_3R_76()) {
                                                                                                    this.jj_scanpos = xsp;
                                                                                                    if (jj_3R_77()) {
                                                                                                        this.jj_scanpos = xsp;
                                                                                                        if (jj_3R_78()) {
                                                                                                            this.jj_scanpos = xsp;
                                                                                                            if (jj_3R_79()) {
                                                                                                                this.jj_scanpos = xsp;
                                                                                                                return jj_3R_80();
                                                                                                            }
                                                                                                            return false;
                                                                                                        }
                                                                                                        return false;
                                                                                                    }
                                                                                                    return false;
                                                                                                }
                                                                                                return false;
                                                                                            }
                                                                                            return false;
                                                                                        }
                                                                                        return false;
                                                                                    }
                                                                                    return false;
                                                                                }
                                                                                return false;
                                                                            }
                                                                            return false;
                                                                        }
                                                                        return false;
                                                                    }
                                                                    return false;
                                                                }
                                                                return false;
                                                            }
                                                            return false;
                                                        }
                                                        return false;
                                                    }
                                                    return false;
                                                }
                                                return false;
                                            }
                                            return false;
                                        }
                                        return false;
                                    }
                                    return false;
                                }
                                return false;
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3_4() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(93)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(91)) {
                this.jj_scanpos = xsp;
                return jj_scan_token(92);
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_111() {
        return jj_scan_token(58);
    }

    private final boolean jj_3R_171() {
        return jj_scan_token(FMParserConstants.OPEN_PAREN) || jj_3R_160() || jj_scan_token(FMParserConstants.CLOSE_PAREN);
    }

    private final boolean jj_3R_36() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(93)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(91)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(92)) {
                    return true;
                }
            }
        }
        return jj_3R_35();
    }

    private final boolean jj_3R_100() {
        return jj_scan_token(26);
    }

    private final boolean jj_3R_32() {
        if (jj_3R_35()) {
            return true;
        }
        Token xsp = this.jj_scanpos;
        if (jj_3R_36()) {
            this.jj_scanpos = xsp;
            return false;
        }
        return false;
    }

    private final boolean jj_3R_132() {
        return jj_scan_token(57);
    }

    private final boolean jj_3_17() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(68)) {
            this.jj_scanpos = xsp;
        }
        Token xsp2 = this.jj_scanpos;
        if (jj_scan_token(66)) {
            this.jj_scanpos = xsp2;
            return jj_scan_token(65);
        }
        return false;
    }

    private final boolean jj_3R_170() {
        return jj_scan_token(FMParserConstants.OPEN_BRACKET) || jj_3R_23() || jj_scan_token(FMParserConstants.CLOSE_BRACKET);
    }

    private final boolean jj_3R_110() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(56)) {
            this.jj_scanpos = xsp;
            return jj_3R_132();
        }
        return false;
    }

    private final boolean jj_3_3() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(100)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(FMParserConstants.DIVIDE)) {
                this.jj_scanpos = xsp;
                return jj_scan_token(FMParserConstants.PERCENT);
            }
            return false;
        }
        return false;
    }

    private final boolean jj_3R_118() {
        return jj_scan_token(FMParserConstants.PERCENT);
    }

    private final boolean jj_3R_117() {
        return jj_scan_token(FMParserConstants.DIVIDE);
    }

    private final boolean jj_3R_116() {
        return jj_scan_token(100);
    }

    private final boolean jj_3R_82() {
        Token xsp = this.jj_scanpos;
        if (jj_3R_116()) {
            this.jj_scanpos = xsp;
            if (jj_3R_117()) {
                this.jj_scanpos = xsp;
                if (jj_3R_118()) {
                    return true;
                }
            }
        }
        return jj_3R_81();
    }

    private final boolean jj_3R_50() {
        Token xsp;
        if (jj_3R_81()) {
            return true;
        }
        do {
            xsp = this.jj_scanpos;
        } while (!jj_3R_82());
        this.jj_scanpos = xsp;
        return false;
    }

    private final boolean jj_3R_109() {
        return jj_scan_token(22);
    }

    private final boolean jj_3R_108() {
        return jj_scan_token(61);
    }

    private final boolean jj_3R_122() {
        return jj_scan_token(19);
    }

    private final boolean jj_3R_176() {
        Token xsp = this.jj_scanpos;
        if (jj_scan_token(94)) {
            this.jj_scanpos = xsp;
            if (jj_scan_token(95)) {
                this.jj_scanpos = xsp;
                if (jj_scan_token(96)) {
                    this.jj_scanpos = xsp;
                    if (jj_scan_token(97)) {
                        this.jj_scanpos = xsp;
                        if (jj_scan_token(83)) {
                            this.jj_scanpos = xsp;
                            if (jj_scan_token(84)) {
                                this.jj_scanpos = xsp;
                                if (jj_scan_token(FMParserConstants.IN)) {
                                    this.jj_scanpos = xsp;
                                    if (jj_scan_token(FMParserConstants.AS)) {
                                        this.jj_scanpos = xsp;
                                        return jj_scan_token(FMParserConstants.USING);
                                    }
                                    return false;
                                }
                                return false;
                            }
                            return false;
                        }
                        return false;
                    }
                    return false;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    static {
        jj_la1_0();
        jj_la1_1();
        jj_la1_2();
        jj_la1_3();
        jj_la1_4();
    }

    private static void jj_la1_0() {
        jj_la1_0 = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, DebugModel.TYPE_METHOD_EX, 0, 0, 0, 0, 0, 0, 16777216, 8388608, 0, 0, 114688, 0, 0, 0, 0, 0, 0, 0, 1572864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 805306368, 0, 0, 0, 0, 0, DebugModel.TYPE_CONFIGURATION, 0, 2147474752, 0, 0, 0, 2147474752, 2147474752, 0, 0, 2147474752, 0, 0, 0, 0, 0};
    }

    private static void jj_la1_1() {
        jj_la1_1 = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, DebugModel.TYPE_TEMPLATE, 6, 0, 0, 0, 50331648, 16384, 32768, 12582912, 1966080, 0, 0, 0, 0, FMParserConstants.CLOSE_BRACKET, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2097152, 0, -1344282624, 0, 0, 0, -1344282624, -1344282624, 0, 0, -1344282624, 0, 0, 0, 0, 0};
    }

    private static void jj_la1_2() {
        jj_la1_2 = new int[]{16646144, 16646144, 0, 0, 0, 0, 939524096, -1073741824, 6291456, 393216, 109051904, 0, -1072168960, -1072168960, 393216, 1572864, 0, 0, 0, 16646144, 0, 0, 0, 0, 0, 16646144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 134217728, 0, 0, 0, 0, 0, 0, 134217728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16646144, 0, 16646144, 0, 0, 0, 0, 16, 16, 0, 0, 0, FMParserConstants.CLOSE_BRACKET, 0, 0, 496, 496, 496, 496, 496, 16, 0, 6, 0, 0};
    }

    private static void jj_la1_3() {
        jj_la1_3 = new int[]{17465344, 17467404, DebugModel.TYPE_ENVIRONMENT, 12, 12, 400, 0, -1073741821, 0, 16777216, 165888, DebugModel.TYPE_ENVIRONMENT, 14680067, 31457331, 0, 0, 20480, DebugModel.TYPE_TEMPLATE, 20480, 17467404, DebugModel.TYPE_CONFIGURATION, 0, 0, 0, 8388608, 17467404, 8388608, 0, 0, 0, 0, 0, 0, DebugModel.TYPE_TEMPLATE, 2097152, 2097152, 0, 270532608, DebugModel.TYPE_CONFIGURATION, 16777216, 0, 131072, 16777216, 64, 0, DebugModel.TYPE_TEMPLATE, 262144, 0, 0, 0, DebugModel.TYPE_TEMPLATE, 0, 0, 16777216, DebugModel.TYPE_CONFIGURATION, 805306368, 262144, 16777216, 17471500, DebugModel.TYPE_TEMPLATE, 17467404, 0, DebugModel.TYPE_CONFIGURATION, 16777216, 805306368, 0, 0, 0, 805306368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16777216, 0, DebugModel.TYPE_TEMPLATE, 16777216};
    }

    private static void jj_la1_4() {
        jj_la1_4 = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    }

    public FMParser(InputStream stream) {
        this.escapes = new LinkedList();
        this.lookingAhead = false;
        this.jj_la1 = new int[83];
        this.jj_2_rtns = new JJCalls[17];
        this.jj_rescan = false;
        this.jj_gc = 0;
        this.jj_ls = new LookaheadSuccess(null);
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.jj_lasttokens = new int[100];
        this.jj_input_stream = new SimpleCharStream(stream, 1, 1);
        this.token_source = new FMParserTokenManager(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    public void ReInit(InputStream stream) {
        this.jj_input_stream.ReInit(stream, 1, 1);
        this.token_source.ReInit(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    public FMParser(Reader stream) {
        this.escapes = new LinkedList();
        this.lookingAhead = false;
        this.jj_la1 = new int[83];
        this.jj_2_rtns = new JJCalls[17];
        this.jj_rescan = false;
        this.jj_gc = 0;
        this.jj_ls = new LookaheadSuccess(null);
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.jj_lasttokens = new int[100];
        this.jj_input_stream = new SimpleCharStream(stream, 1, 1);
        this.token_source = new FMParserTokenManager(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    public void ReInit(Reader stream) {
        this.jj_input_stream.ReInit(stream, 1, 1);
        this.token_source.ReInit(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    public FMParser(FMParserTokenManager tm) {
        this.escapes = new LinkedList();
        this.lookingAhead = false;
        this.jj_la1 = new int[83];
        this.jj_2_rtns = new JJCalls[17];
        this.jj_rescan = false;
        this.jj_gc = 0;
        this.jj_ls = new LookaheadSuccess(null);
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.jj_lasttokens = new int[100];
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    public void ReInit(FMParserTokenManager tm) {
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 83; i++) {
            this.jj_la1[i] = -1;
        }
        for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
            this.jj_2_rtns[i2] = new JJCalls();
        }
    }

    private final Token jj_consume_token(int kind) throws ParseException {
        Token oldToken = this.token;
        if (oldToken.next != null) {
            this.token = this.token.next;
        } else {
            Token token = this.token;
            Token nextToken = this.token_source.getNextToken();
            token.next = nextToken;
            this.token = nextToken;
        }
        this.jj_ntk = -1;
        if (this.token.kind == kind) {
            this.jj_gen++;
            int i = this.jj_gc + 1;
            this.jj_gc = i;
            if (i > 100) {
                this.jj_gc = 0;
                for (int i2 = 0; i2 < this.jj_2_rtns.length; i2++) {
                    JJCalls jJCalls = this.jj_2_rtns[i2];
                    while (true) {
                        JJCalls c = jJCalls;
                        if (c != null) {
                            if (c.gen < this.jj_gen) {
                                c.first = null;
                            }
                            jJCalls = c.next;
                        }
                    }
                }
            }
            return this.token;
        }
        this.token = oldToken;
        this.jj_kind = kind;
        throw generateParseException();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/FMParser$LookaheadSuccess.class */
    private static final class LookaheadSuccess extends Error {
        private LookaheadSuccess() {
        }

        LookaheadSuccess(AnonymousClass1 x0) {
            this();
        }
    }

    private final boolean jj_scan_token(int kind) {
        Token tok;
        if (this.jj_scanpos == this.jj_lastpos) {
            this.jj_la--;
            if (this.jj_scanpos.next == null) {
                Token token = this.jj_scanpos;
                Token nextToken = this.token_source.getNextToken();
                token.next = nextToken;
                this.jj_scanpos = nextToken;
                this.jj_lastpos = nextToken;
            } else {
                Token token2 = this.jj_scanpos.next;
                this.jj_scanpos = token2;
                this.jj_lastpos = token2;
            }
        } else {
            this.jj_scanpos = this.jj_scanpos.next;
        }
        if (this.jj_rescan) {
            int i = 0;
            Token token3 = this.token;
            while (true) {
                tok = token3;
                if (tok == null || tok == this.jj_scanpos) {
                    break;
                }
                i++;
                token3 = tok.next;
            }
            if (tok != null) {
                jj_add_error_token(kind, i);
            }
        }
        if (this.jj_scanpos.kind != kind) {
            return true;
        }
        if (this.jj_la == 0 && this.jj_scanpos == this.jj_lastpos) {
            throw this.jj_ls;
        }
        return false;
    }

    public final Token getNextToken() {
        if (this.token.next != null) {
            this.token = this.token.next;
        } else {
            Token token = this.token;
            Token nextToken = this.token_source.getNextToken();
            token.next = nextToken;
            this.token = nextToken;
        }
        this.jj_ntk = -1;
        this.jj_gen++;
        return this.token;
    }

    public final Token getToken(int index) {
        Token token;
        Token t = this.lookingAhead ? this.jj_scanpos : this.token;
        for (int i = 0; i < index; i++) {
            if (t.next != null) {
                token = t.next;
            } else {
                Token nextToken = this.token_source.getNextToken();
                token = nextToken;
                t.next = nextToken;
            }
            t = token;
        }
        return t;
    }

    private final int jj_ntk() {
        Token token = this.token.next;
        this.jj_nt = token;
        if (token == null) {
            Token token2 = this.token;
            Token nextToken = this.token_source.getNextToken();
            token2.next = nextToken;
            int i = nextToken.kind;
            this.jj_ntk = i;
            return i;
        }
        int i2 = this.jj_nt.kind;
        this.jj_ntk = i2;
        return i2;
    }

    private void jj_add_error_token(int kind, int pos) {
        if (pos >= 100) {
            return;
        }
        if (pos == this.jj_endpos + 1) {
            int[] iArr = this.jj_lasttokens;
            int i = this.jj_endpos;
            this.jj_endpos = i + 1;
            iArr[i] = kind;
            return;
        }
        if (this.jj_endpos != 0) {
            this.jj_expentry = new int[this.jj_endpos];
            for (int i2 = 0; i2 < this.jj_endpos; i2++) {
                this.jj_expentry[i2] = this.jj_lasttokens[i2];
            }
            boolean exists = false;
            Enumeration e = this.jj_expentries.elements();
            while (e.hasMoreElements()) {
                int[] oldentry = (int[]) e.nextElement();
                if (oldentry.length == this.jj_expentry.length) {
                    exists = true;
                    int i3 = 0;
                    while (true) {
                        if (i3 >= this.jj_expentry.length) {
                            break;
                        }
                        if (oldentry[i3] == this.jj_expentry[i3]) {
                            i3++;
                        } else {
                            exists = false;
                            break;
                        }
                    }
                    if (exists) {
                        break;
                    }
                }
            }
            if (!exists) {
                this.jj_expentries.addElement(this.jj_expentry);
            }
            if (pos != 0) {
                int[] iArr2 = this.jj_lasttokens;
                this.jj_endpos = pos;
                iArr2[pos - 1] = kind;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v18, types: [int[], int[][]] */
    public ParseException generateParseException() {
        this.jj_expentries.removeAllElements();
        boolean[] la1tokens = new boolean[134];
        for (int i = 0; i < 134; i++) {
            la1tokens[i] = false;
        }
        if (this.jj_kind >= 0) {
            la1tokens[this.jj_kind] = true;
            this.jj_kind = -1;
        }
        for (int i2 = 0; i2 < 83; i2++) {
            if (this.jj_la1[i2] == this.jj_gen) {
                for (int j = 0; j < 32; j++) {
                    if ((jj_la1_0[i2] & (1 << j)) != 0) {
                        la1tokens[j] = true;
                    }
                    if ((jj_la1_1[i2] & (1 << j)) != 0) {
                        la1tokens[32 + j] = true;
                    }
                    if ((jj_la1_2[i2] & (1 << j)) != 0) {
                        la1tokens[64 + j] = true;
                    }
                    if ((jj_la1_3[i2] & (1 << j)) != 0) {
                        la1tokens[96 + j] = true;
                    }
                    if ((jj_la1_4[i2] & (1 << j)) != 0) {
                        la1tokens[128 + j] = true;
                    }
                }
            }
        }
        for (int i3 = 0; i3 < 134; i3++) {
            if (la1tokens[i3]) {
                this.jj_expentry = new int[1];
                this.jj_expentry[0] = i3;
                this.jj_expentries.addElement(this.jj_expentry);
            }
        }
        this.jj_endpos = 0;
        jj_rescan_token();
        jj_add_error_token(0, 0);
        ?? r0 = new int[this.jj_expentries.size()];
        for (int i4 = 0; i4 < this.jj_expentries.size(); i4++) {
            r0[i4] = (int[]) this.jj_expentries.elementAt(i4);
        }
        return new ParseException(this.token, (int[][]) r0, FMParserConstants.tokenImage);
    }

    public final void enable_tracing() {
    }

    public final void disable_tracing() {
    }

    private final void jj_rescan_token() {
        this.jj_rescan = true;
        for (int i = 0; i < 17; i++) {
            JJCalls p = this.jj_2_rtns[i];
            do {
                if (p.gen > this.jj_gen) {
                    this.jj_la = p.arg;
                    Token token = p.first;
                    this.jj_scanpos = token;
                    this.jj_lastpos = token;
                    switch (i) {
                        case 0:
                            jj_3_1();
                            break;
                        case 1:
                            jj_3_2();
                            break;
                        case 2:
                            jj_3_3();
                            break;
                        case 3:
                            jj_3_4();
                            break;
                        case 4:
                            jj_3_5();
                            break;
                        case 5:
                            jj_3_6();
                            break;
                        case 6:
                            jj_3_7();
                            break;
                        case 7:
                            jj_3_8();
                            break;
                        case 8:
                            jj_3_9();
                            break;
                        case FMParserConstants.ELSE_IF /* 9 */:
                            jj_3_10();
                            break;
                        case FMParserConstants.LIST /* 10 */:
                            jj_3_11();
                            break;
                        case FMParserConstants.FOREACH /* 11 */:
                            jj_3_12();
                            break;
                        case FMParserConstants.SWITCH /* 12 */:
                            jj_3_13();
                            break;
                        case FMParserConstants.CASE /* 13 */:
                            jj_3_14();
                            break;
                        case FMParserConstants.ASSIGN /* 14 */:
                            jj_3_15();
                            break;
                        case FMParserConstants.GLOBALASSIGN /* 15 */:
                            jj_3_16();
                            break;
                        case 16:
                            jj_3_17();
                            break;
                    }
                }
                p = p.next;
            } while (p != null);
        }
        this.jj_rescan = false;
    }

    private final void jj_save(int index, int xla) {
        JJCalls p;
        JJCalls jJCalls = this.jj_2_rtns[index];
        while (true) {
            p = jJCalls;
            if (p.gen <= this.jj_gen) {
                break;
            }
            if (p.next == null) {
                JJCalls jJCalls2 = new JJCalls();
                p.next = jJCalls2;
                p = jJCalls2;
                break;
            }
            jJCalls = p.next;
        }
        p.gen = (this.jj_gen + xla) - this.jj_la;
        p.first = this.token;
        p.arg = xla;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/FMParser$JJCalls.class */
    static final class JJCalls {
        int gen;
        Token first;
        int arg;
        JJCalls next;

        JJCalls() {
        }
    }
}
