package com.github.zafarkhaja.semver.expr;

import com.github.zafarkhaja.semver.Version;

/* loaded from: java-semver-0.9.0.jar:com/github/zafarkhaja/semver/expr/LessOrEqual.class */
class LessOrEqual implements Expression {
    private final Version parsedVersion;

    LessOrEqual(Version parsedVersion) {
        this.parsedVersion = parsedVersion;
    }

    @Override // com.github.zafarkhaja.semver.expr.Expression
    public boolean interpret(Version version) {
        return version.lessThanOrEqualTo(this.parsedVersion);
    }
}
