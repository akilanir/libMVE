package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.Version;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/Or.class */
class Or implements Expression {
    private final Expression left;
    private final Expression right;

    Or(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override // com.github.zafarkhaja.semver.expr.Expression
    public boolean interpret(Version version) {
        return this.left.interpret(version) || this.right.interpret(version);
    }
}
