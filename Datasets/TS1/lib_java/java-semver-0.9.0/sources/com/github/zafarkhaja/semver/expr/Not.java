package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.Version;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/Not.class */
class Not implements Expression {
    private final Expression expr;

    Not(Expression expr) {
        this.expr = expr;
    }

    @Override // com.github.zafarkhaja.semver.expr.Expression
    public boolean interpret(Version version) {
        return !this.expr.interpret(version);
    }
}
