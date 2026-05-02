package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.ParseException;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/LexerException.class */
public class LexerException extends ParseException {
    private final String expr;

    LexerException(String expr) {
        this.expr = expr;
    }

    @Override // com.github.zafarkhaja.semver.ParseException, java.lang.Throwable
    public String toString() {
        return "Illegal character near '" + this.expr + "'";
    }
}
