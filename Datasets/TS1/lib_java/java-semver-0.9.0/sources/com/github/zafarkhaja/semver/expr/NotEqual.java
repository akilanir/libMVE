package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.Version;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/NotEqual.class */
class NotEqual implements Expression {
    private final Version parsedVersion;

    NotEqual(Version parsedVersion) {
        this.parsedVersion = parsedVersion;
    }

    @Override // com.github.zafarkhaja.semver.expr.Expression
    public boolean interpret(Version version) {
        return !version.equals(this.parsedVersion);
    }
}
