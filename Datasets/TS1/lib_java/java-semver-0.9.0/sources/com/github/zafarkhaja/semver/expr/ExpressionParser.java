package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.Parser;
import com.github.zafarkhaja.semver.Version;
import com.github.zafarkhaja.semver.expr.CompositeExpression;
import com.github.zafarkhaja.semver.expr.Lexer;
import com.github.zafarkhaja.semver.util.Stream;
import com.github.zafarkhaja.semver.util.UnexpectedElementException;
import java.util.EnumSet;
import java.util.Iterator;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/ExpressionParser.class */
public class ExpressionParser implements Parser<Expression> {
    private final Lexer lexer;
    private Stream<Lexer.Token> tokens;

    ExpressionParser(Lexer lexer) {
        this.lexer = lexer;
    }

    public static Parser<Expression> newInstance() {
        return new ExpressionParser(new Lexer());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.github.zafarkhaja.semver.Parser
    public Expression parse(String input) {
        this.tokens = this.lexer.tokenize(input);
        Expression expr = parseSemVerExpression();
        consumeNextToken(Lexer.Token.Type.EOI);
        return expr;
    }

    private CompositeExpression parseSemVerExpression() {
        CompositeExpression expr;
        if (this.tokens.positiveLookahead(Lexer.Token.Type.NOT)) {
            this.tokens.consume();
            consumeNextToken(Lexer.Token.Type.LEFT_PAREN);
            expr = CompositeExpression.Helper.not(parseSemVerExpression());
            consumeNextToken(Lexer.Token.Type.RIGHT_PAREN);
        } else if (this.tokens.positiveLookahead(Lexer.Token.Type.LEFT_PAREN)) {
            consumeNextToken(Lexer.Token.Type.LEFT_PAREN);
            expr = parseSemVerExpression();
            consumeNextToken(Lexer.Token.Type.RIGHT_PAREN);
        } else {
            expr = parseRange();
        }
        return parseMoreExpressions(expr);
    }

    private CompositeExpression parseMoreExpressions(CompositeExpression expr) {
        if (this.tokens.positiveLookahead(Lexer.Token.Type.AND)) {
            this.tokens.consume();
            expr = expr.and(parseSemVerExpression());
        } else if (this.tokens.positiveLookahead(Lexer.Token.Type.OR)) {
            this.tokens.consume();
            expr = expr.or(parseSemVerExpression());
        }
        return expr;
    }

    private CompositeExpression parseRange() {
        if (this.tokens.positiveLookahead(Lexer.Token.Type.TILDE)) {
            return parseTildeRange();
        }
        if (this.tokens.positiveLookahead(Lexer.Token.Type.CARET)) {
            return parseCaretRange();
        }
        if (isWildcardRange()) {
            return parseWildcardRange();
        }
        if (isHyphenRange()) {
            return parseHyphenRange();
        }
        if (isPartialVersionRange()) {
            return parsePartialVersionRange();
        }
        return parseComparisonRange();
    }

    private CompositeExpression parseComparisonRange() {
        CompositeExpression expr;
        this.tokens.lookahead();
        switch (token.type) {
            case EQUAL:
                this.tokens.consume();
                expr = CompositeExpression.Helper.eq(parseVersion());
                break;
            case NOT_EQUAL:
                this.tokens.consume();
                expr = CompositeExpression.Helper.neq(parseVersion());
                break;
            case GREATER:
                this.tokens.consume();
                expr = CompositeExpression.Helper.gt(parseVersion());
                break;
            case GREATER_EQUAL:
                this.tokens.consume();
                expr = CompositeExpression.Helper.gte(parseVersion());
                break;
            case LESS:
                this.tokens.consume();
                expr = CompositeExpression.Helper.lt(parseVersion());
                break;
            case LESS_EQUAL:
                this.tokens.consume();
                expr = CompositeExpression.Helper.lte(parseVersion());
                break;
            default:
                expr = CompositeExpression.Helper.eq(parseVersion());
                break;
        }
        return expr;
    }

    private CompositeExpression parseTildeRange() {
        consumeNextToken(Lexer.Token.Type.TILDE);
        int major = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            return CompositeExpression.Helper.gte(versionFor(major)).and(CompositeExpression.Helper.lt(versionFor(major + 1)));
        }
        consumeNextToken(Lexer.Token.Type.DOT);
        int minor = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            return CompositeExpression.Helper.gte(versionFor(major, minor)).and(CompositeExpression.Helper.lt(versionFor(major, minor + 1)));
        }
        consumeNextToken(Lexer.Token.Type.DOT);
        int patch = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        return CompositeExpression.Helper.gte(versionFor(major, minor, patch)).and(CompositeExpression.Helper.lt(versionFor(major, minor + 1)));
    }

    private CompositeExpression parseCaretRange() {
        consumeNextToken(Lexer.Token.Type.CARET);
        int major = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            return CompositeExpression.Helper.gte(versionFor(major)).and(CompositeExpression.Helper.lt(versionFor(major + 1)));
        }
        consumeNextToken(Lexer.Token.Type.DOT);
        int minor = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            Version lower = versionFor(major, minor);
            Version upper = major > 0 ? lower.incrementMajorVersion() : lower.incrementMinorVersion();
            return CompositeExpression.Helper.gte(lower).and(CompositeExpression.Helper.lt(upper));
        }
        consumeNextToken(Lexer.Token.Type.DOT);
        int patch = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        Version version = versionFor(major, minor, patch);
        CompositeExpression gte = CompositeExpression.Helper.gte(version);
        if (major > 0) {
            return gte.and(CompositeExpression.Helper.lt(version.incrementMajorVersion()));
        }
        if (minor > 0) {
            return gte.and(CompositeExpression.Helper.lt(version.incrementMinorVersion()));
        }
        if (patch > 0) {
            return gte.and(CompositeExpression.Helper.lt(version.incrementPatchVersion()));
        }
        return CompositeExpression.Helper.eq(version);
    }

    private boolean isWildcardRange() {
        return isVersionFollowedBy(Lexer.Token.Type.WILDCARD);
    }

    private CompositeExpression parseWildcardRange() {
        if (this.tokens.positiveLookahead(Lexer.Token.Type.WILDCARD)) {
            this.tokens.consume();
            return CompositeExpression.Helper.gte(versionFor(0, 0, 0));
        }
        int major = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        consumeNextToken(Lexer.Token.Type.DOT);
        if (this.tokens.positiveLookahead(Lexer.Token.Type.WILDCARD)) {
            this.tokens.consume();
            return CompositeExpression.Helper.gte(versionFor(major)).and(CompositeExpression.Helper.lt(versionFor(major + 1)));
        }
        int minor = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        consumeNextToken(Lexer.Token.Type.DOT);
        consumeNextToken(Lexer.Token.Type.WILDCARD);
        return CompositeExpression.Helper.gte(versionFor(major, minor)).and(CompositeExpression.Helper.lt(versionFor(major, minor + 1)));
    }

    private boolean isHyphenRange() {
        return isVersionFollowedBy(Lexer.Token.Type.HYPHEN);
    }

    private CompositeExpression parseHyphenRange() {
        CompositeExpression gte = CompositeExpression.Helper.gte(parseVersion());
        consumeNextToken(Lexer.Token.Type.HYPHEN);
        return gte.and(CompositeExpression.Helper.lte(parseVersion()));
    }

    private boolean isPartialVersionRange() {
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.NUMERIC)) {
            return false;
        }
        EnumSet<Lexer.Token.Type> expected = EnumSet.complementOf(EnumSet.of(Lexer.Token.Type.NUMERIC, Lexer.Token.Type.DOT));
        return this.tokens.positiveLookaheadUntil(5, (Stream.ElementType[]) expected.toArray(new Lexer.Token.Type[expected.size()]));
    }

    private CompositeExpression parsePartialVersionRange() {
        int major = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        if (!this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            return CompositeExpression.Helper.gte(versionFor(major)).and(CompositeExpression.Helper.lt(versionFor(major + 1)));
        }
        consumeNextToken(Lexer.Token.Type.DOT);
        int minor = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        return CompositeExpression.Helper.gte(versionFor(major, minor)).and(CompositeExpression.Helper.lt(versionFor(major, minor + 1)));
    }

    private Version parseVersion() {
        int major = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        int minor = 0;
        if (this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            this.tokens.consume();
            minor = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        }
        int patch = 0;
        if (this.tokens.positiveLookahead(Lexer.Token.Type.DOT)) {
            this.tokens.consume();
            patch = intOf(consumeNextToken(Lexer.Token.Type.NUMERIC).lexeme);
        }
        return versionFor(major, minor, patch);
    }

    private boolean isVersionFollowedBy(Stream.ElementType<Lexer.Token> type) {
        EnumSet<Lexer.Token.Type> expected = EnumSet.of(Lexer.Token.Type.NUMERIC, Lexer.Token.Type.DOT);
        Iterator<Lexer.Token> it = this.tokens.iterator();
        Lexer.Token lookahead = null;
        while (it.hasNext()) {
            lookahead = it.next();
            if (!expected.contains(lookahead.type)) {
                break;
            }
        }
        return type.isMatchedBy(lookahead);
    }

    private Version versionFor(int major) {
        return versionFor(major, 0, 0);
    }

    private Version versionFor(int major, int minor) {
        return versionFor(major, minor, 0);
    }

    private Version versionFor(int major, int minor, int patch) {
        return Version.forIntegers(major, minor, patch);
    }

    private int intOf(String value) {
        return Integer.parseInt(value);
    }

    private Lexer.Token consumeNextToken(Lexer.Token.Type... expected) {
        try {
            return this.tokens.consume(expected);
        } catch (UnexpectedElementException e) {
            throw new UnexpectedTokenException(e);
        }
    }
}
