package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.util.Stream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/Lexer.class */
class Lexer {

    /* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/Lexer$Token.class */
    static class Token {
        final Type type;
        final String lexeme;
        final int position;

        /* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/Lexer$Token$Type.class */
        enum Type implements Stream.ElementType<Token> {
            NUMERIC("0|[1-9][0-9]*"),
            DOT("\\."),
            HYPHEN("-"),
            EQUAL("="),
            NOT_EQUAL("!="),
            GREATER(">(?!=)"),
            GREATER_EQUAL(">="),
            LESS("<(?!=)"),
            LESS_EQUAL("<="),
            TILDE("~"),
            WILDCARD("[\\*xX]"),
            CARET("\\^"),
            AND("&"),
            OR("\\|"),
            NOT("!(?!=)"),
            LEFT_PAREN("\\("),
            RIGHT_PAREN("\\)"),
            WHITESPACE("\\s+"),
            EOI("?!");

            final Pattern pattern;

            Type(String regexp) {
                this.pattern = Pattern.compile("^(" + regexp + ")");
            }

            @Override // java.lang.Enum
            public String toString() {
                return name() + "(" + this.pattern + ")";
            }

            @Override // com.github.zafarkhaja.semver.util.Stream.ElementType
            public boolean isMatchedBy(Token token) {
                return token != null && this == token.type;
            }
        }

        Token(Type type, String lexeme, int position) {
            this.type = type;
            this.lexeme = lexeme == null ? "" : lexeme;
            this.position = position;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Token)) {
                return false;
            }
            Token token = (Token) other;
            return this.type.equals(token.type) && this.lexeme.equals(token.lexeme) && this.position == token.position;
        }

        public int hashCode() {
            int hash = (71 * 5) + this.type.hashCode();
            return (71 * ((71 * hash) + this.lexeme.hashCode())) + this.position;
        }

        public String toString() {
            return String.format("%s(%s) at position %d", this.type.name(), this.lexeme, Integer.valueOf(this.position));
        }
    }

    Lexer() {
    }

    Stream<Token> tokenize(String input) {
        List<Token> tokens = new ArrayList<>();
        int tokenPos = 0;
        while (!input.isEmpty()) {
            boolean matched = false;
            Token.Type[] values = Token.Type.values();
            int length = values.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                Token.Type tokenType = values[i];
                Matcher matcher = tokenType.pattern.matcher(input);
                if (!matcher.find()) {
                    i++;
                } else {
                    matched = true;
                    input = matcher.replaceFirst("");
                    if (tokenType != Token.Type.WHITESPACE) {
                        tokens.add(new Token(tokenType, matcher.group(), tokenPos));
                    }
                    tokenPos += matcher.end();
                }
            }
            if (!matched) {
                throw new LexerException(input);
            }
        }
        tokens.add(new Token(Token.Type.EOI, null, tokenPos));
        return new Stream<>(tokens.toArray(new Token[tokens.size()]));
    }
}
