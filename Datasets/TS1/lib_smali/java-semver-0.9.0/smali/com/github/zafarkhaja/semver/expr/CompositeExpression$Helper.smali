.class public Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;
.super Ljava/lang/Object;
.source "CompositeExpression.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Helper"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static eq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 63
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/Equal;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/Equal;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static eq(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->eq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static gt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 113
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/Greater;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/Greater;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static gt(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 127
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 138
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/GreaterOrEqual;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/GreaterOrEqual;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static gte(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 152
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 163
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/Less;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/Less;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static lt(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 177
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static lte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 188
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/LessOrEqual;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/LessOrEqual;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static lte(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 202
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static neq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "version"    # Lcom/github/zafarkhaja/semver/Version;

    .prologue
    .line 88
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/NotEqual;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/NotEqual;-><init>(Lcom/github/zafarkhaja/semver/Version;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method

.method public static neq(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 2
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-static {p0}, Lcom/github/zafarkhaja/semver/Version;->valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    invoke-static {v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->neq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    return-object v0
.end method

.method public static not(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 3
    .param p0, "expr"    # Lcom/github/zafarkhaja/semver/expr/Expression;

    .prologue
    .line 52
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/Not;

    invoke-direct {v1, p0}, Lcom/github/zafarkhaja/semver/expr/Not;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;-><init>(Lcom/github/zafarkhaja/semver/expr/Expression;)V

    return-object v0
.end method
