.class public Lcom/github/zafarkhaja/semver/expr/ExpressionParser;
.super Ljava/lang/Object;
.source "ExpressionParser.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/expr/ExpressionParser$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/github/zafarkhaja/semver/Parser",
        "<",
        "Lcom/github/zafarkhaja/semver/expr/Expression;",
        ">;"
    }
.end annotation


# instance fields
.field private final lexer:Lcom/github/zafarkhaja/semver/expr/Lexer;

.field private tokens:Lcom/github/zafarkhaja/semver/util/Stream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/github/zafarkhaja/semver/util/Stream",
            "<",
            "Lcom/github/zafarkhaja/semver/expr/Lexer$Token;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/expr/Lexer;)V
    .registers 2
    .param p1, "lexer"    # Lcom/github/zafarkhaja/semver/expr/Lexer;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->lexer:Lcom/github/zafarkhaja/semver/expr/Lexer;

    .line 63
    return-void
.end method

.method private varargs consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    .registers 4
    .param p1, "expected"    # [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    .prologue
    .line 505
    :try_start_0
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v1, p1}, Lcom/github/zafarkhaja/semver/util/Stream;->consume([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    :try_end_8
    .catch Lcom/github/zafarkhaja/semver/util/UnexpectedElementException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 506
    :catch_9
    move-exception v0

    .line 507
    .local v0, "e":Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;
    new-instance v1, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;

    invoke-direct {v1, v0}, Lcom/github/zafarkhaja/semver/expr/UnexpectedTokenException;-><init>(Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;)V

    throw v1
.end method

.method private intOf(Ljava/lang/String;)I
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 493
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private isHyphenRange()Z
    .registers 2

    .prologue
    .line 342
    sget-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->HYPHEN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->isVersionFollowedBy(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    return v0
.end method

.method private isPartialVersionRange()Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 371
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v1

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 375
    :goto_10
    return v1

    .line 374
    :cond_11
    sget-object v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-static {v1, v2}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v1

    invoke-static {v1}, Ljava/util/EnumSet;->complementOf(Ljava/util/EnumSet;)Ljava/util/EnumSet;

    move-result-object v0

    .line 375
    .local v0, "expected":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;>;"
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    const/4 v3, 0x5

    invoke-virtual {v0}, Ljava/util/EnumSet;->size()I

    move-result v1

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/github/zafarkhaja/semver/util/Stream$ElementType;

    invoke-virtual {v2, v3, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookaheadUntil(I[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    goto :goto_10
.end method

.method private isVersionFollowedBy(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<",
            "Lcom/github/zafarkhaja/semver/expr/Lexer$Token;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 439
    .local p1, "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<Lcom/github/zafarkhaja/semver/expr/Lexer$Token;>;"
    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-static {v3, v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    .line 440
    .local v0, "expected":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;>;"
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/util/Stream;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 441
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/github/zafarkhaja/semver/expr/Lexer$Token;>;"
    const/4 v2, 0x0

    .line 442
    .local v2, "lookahead":Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 443
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "lookahead":Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    check-cast v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 444
    .restart local v2    # "lookahead":Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    iget-object v3, v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-virtual {v0, v3}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 448
    :cond_23
    invoke-interface {p1, v2}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v3

    return v3
.end method

.method private isWildcardRange()Z
    .registers 2

    .prologue
    .line 296
    sget-object v0, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->isVersionFollowedBy(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    return v0
.end method

.method public static newInstance()Lcom/github/zafarkhaja/semver/Parser;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/github/zafarkhaja/semver/Parser",
            "<",
            "Lcom/github/zafarkhaja/semver/expr/Expression;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;

    new-instance v1, Lcom/github/zafarkhaja/semver/expr/Lexer;

    invoke-direct {v1}, Lcom/github/zafarkhaja/semver/expr/Lexer;-><init>()V

    invoke-direct {v0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;-><init>(Lcom/github/zafarkhaja/semver/expr/Lexer;)V

    return-object v0
.end method

.method private parseCaretRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 13

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 261
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->CARET:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 262
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v7

    iget-object v7, v7, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v2

    .line 263
    .local v2, "major":I
    iget-object v7, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v8, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v9, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v9, v8, v10

    invoke-virtual {v7, v8}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v7

    if-nez v7, :cond_40

    .line 264
    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v7

    invoke-static {v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    add-int/lit8 v8, v2, 0x1

    invoke-direct {p0, v8}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v8

    invoke-static {v8}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    .line 284
    :goto_3f
    return-object v7

    .line 266
    :cond_40
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 267
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v7

    iget-object v7, v7, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v3

    .line 268
    .local v3, "minor":I
    iget-object v7, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v8, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v9, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v9, v8, v10

    invoke-virtual {v7, v8}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v7

    if-nez v7, :cond_83

    .line 269
    invoke-direct {p0, v2, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v1

    .line 270
    .local v1, "lower":Lcom/github/zafarkhaja/semver/Version;
    if-lez v2, :cond_7e

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/Version;->incrementMajorVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v5

    .line 271
    .local v5, "upper":Lcom/github/zafarkhaja/semver/Version;
    :goto_71
    invoke-static {v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    invoke-static {v5}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    goto :goto_3f

    .line 270
    .end local v5    # "upper":Lcom/github/zafarkhaja/semver/Version;
    :cond_7e
    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/Version;->incrementMinorVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v5

    goto :goto_71

    .line 273
    .end local v1    # "lower":Lcom/github/zafarkhaja/semver/Version;
    :cond_83
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 274
    new-array v7, v11, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v8, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v8, v7, v10

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v7

    iget-object v7, v7, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v4

    .line 275
    .local v4, "patch":I
    invoke-direct {p0, v2, v3, v4}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v6

    .line 276
    .local v6, "version":Lcom/github/zafarkhaja/semver/Version;
    invoke-static {v6}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 277
    .local v0, "gte":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    if-lez v2, :cond_b3

    .line 278
    invoke-virtual {v6}, Lcom/github/zafarkhaja/semver/Version;->incrementMajorVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v7

    invoke-static {v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    goto :goto_3f

    .line 279
    :cond_b3
    if-lez v3, :cond_c3

    .line 280
    invoke-virtual {v6}, Lcom/github/zafarkhaja/semver/Version;->incrementMinorVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v7

    invoke-static {v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    goto/16 :goto_3f

    .line 281
    :cond_c3
    if-lez v4, :cond_d3

    .line 282
    invoke-virtual {v6}, Lcom/github/zafarkhaja/semver/Version;->incrementPatchVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v7

    invoke-static {v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    goto/16 :goto_3f

    .line 284
    :cond_d3
    invoke-static {v6}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->eq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v7

    goto/16 :goto_3f
.end method

.method private parseComparisonRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 5

    .prologue
    .line 189
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 191
    .local v1, "token":Lcom/github/zafarkhaja/semver/expr/Lexer$Token;
    sget-object v2, Lcom/github/zafarkhaja/semver/expr/ExpressionParser$1;->$SwitchMap$com$github$zafarkhaja$semver$expr$Lexer$Token$Type:[I

    iget-object v3, v1, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->type:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_72

    .line 217
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->eq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 219
    .local v0, "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :goto_1d
    return-object v0

    .line 193
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_1e
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 194
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->eq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 195
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 197
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_2c
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 198
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->neq(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 199
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 201
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_3a
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 202
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 203
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 205
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_48
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 206
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 207
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 209
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_56
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 210
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 211
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 213
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :pswitch_64
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 214
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 215
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_1d

    .line 191
    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_2c
        :pswitch_3a
        :pswitch_48
        :pswitch_56
        :pswitch_64
    .end packed-switch
.end method

.method private parseHyphenRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 5

    .prologue
    .line 357
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v1

    invoke-static {v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 358
    .local v0, "gte":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const/4 v2, 0x0

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->HYPHEN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v1, v2

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 359
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseVersion()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v1

    invoke-static {v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v1

    return-object v1
.end method

.method private parseMoreExpressions(Lcom/github/zafarkhaja/semver/expr/CompositeExpression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 7
    .param p1, "expr"    # Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 136
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v1, v4, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->AND:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 137
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 138
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object p1

    .line 143
    :cond_1d
    :goto_1d
    return-object p1

    .line 139
    :cond_1e
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v1, v4, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->OR:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 140
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v0}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 141
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->or(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object p1

    goto :goto_1d
.end method

.method private parsePartialVersionRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 390
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v2

    iget-object v2, v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v0

    .line 391
    .local v0, "major":I
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v3, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v2

    if-nez v2, :cond_37

    .line 392
    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    .line 396
    :goto_36
    return-object v2

    .line 394
    :cond_37
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 395
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v2

    iget-object v2, v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v1

    .line 396
    .local v1, "minor":I
    invoke-direct {p0, v0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    goto :goto_36
.end method

.method private parseRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 163
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v1, v4, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->TILDE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 164
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseTildeRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 174
    :goto_14
    return-object v0

    .line 165
    :cond_15
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v1, v4, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->CARET:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 166
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseCaretRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    goto :goto_14

    .line 167
    :cond_28
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->isWildcardRange()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 168
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseWildcardRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    goto :goto_14

    .line 169
    :cond_33
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->isHyphenRange()Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 170
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseHyphenRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    goto :goto_14

    .line 171
    :cond_3e
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->isPartialVersionRange()Z

    move-result v0

    if-eqz v0, :cond_49

    .line 172
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parsePartialVersionRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    goto :goto_14

    .line 174
    :cond_49
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseComparisonRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    goto :goto_14
.end method

.method private parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 108
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 109
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v1}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 110
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 111
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v1

    invoke-static {v1}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->not(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 112
    .local v0, "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->RIGHT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 120
    :goto_2f
    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseMoreExpressions(Lcom/github/zafarkhaja/semver/expr/CompositeExpression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v1

    return-object v1

    .line 113
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :cond_34
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_59

    .line 114
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->LEFT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 115
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 116
    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->RIGHT_PAREN:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    goto :goto_2f

    .line 118
    .end local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    :cond_59
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .restart local v0    # "expr":Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    goto :goto_2f
.end method

.method private parseTildeRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 9

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 234
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->TILDE:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 235
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v0

    .line 236
    .local v0, "major":I
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v4, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v3

    if-nez v3, :cond_40

    .line 237
    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    invoke-direct {p0, v4}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v4

    invoke-static {v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    .line 246
    :goto_3f
    return-object v3

    .line 239
    :cond_40
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 240
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v1

    .line 241
    .local v1, "minor":I
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v4, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v3

    if-nez v3, :cond_7e

    .line 242
    invoke-direct {p0, v0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    invoke-direct {p0, v0, v4}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v4

    invoke-static {v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    goto :goto_3f

    .line 244
    :cond_7e
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 245
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v2

    .line 246
    .local v2, "patch":I
    invoke-direct {p0, v0, v1, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    add-int/lit8 v4, v1, 0x1

    invoke-direct {p0, v0, v4}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v4

    invoke-static {v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    goto :goto_3f
.end method

.method private parseVersion()Lcom/github/zafarkhaja/semver/Version;
    .registers 9

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 413
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v0

    .line 414
    .local v0, "major":I
    const/4 v1, 0x0

    .line 415
    .local v1, "minor":I
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v4, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 416
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 417
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v1

    .line 419
    :cond_36
    const/4 v2, 0x0

    .line 420
    .local v2, "patch":I
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v4, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v5, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v3

    if-eqz v3, :cond_5a

    .line 421
    iget-object v3, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v3}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 422
    new-array v3, v7, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v6

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v3

    iget-object v3, v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v2

    .line 424
    :cond_5a
    invoke-direct {p0, v0, v1, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    return-object v3
.end method

.method private parseWildcardRange()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 315
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v3, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 316
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 317
    invoke-direct {p0, v5, v5, v5}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    .line 330
    :goto_1d
    return-object v2

    .line 320
    :cond_1e
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v2

    iget-object v2, v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v0

    .line 321
    .local v0, "major":I
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 322
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v3, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v4, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v2

    if-eqz v2, :cond_61

    .line 323
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    .line 324
    invoke-direct {p0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(I)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    goto :goto_1d

    .line 327
    :cond_61
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->NUMERIC:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    move-result-object v2

    iget-object v2, v2, Lcom/github/zafarkhaja/semver/expr/Lexer$Token;->lexeme:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->intOf(Ljava/lang/String;)I

    move-result v1

    .line 328
    .local v1, "minor":I
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->DOT:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 329
    new-array v2, v6, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->WILDCARD:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v2, v5

    invoke-direct {p0, v2}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 330
    invoke-direct {p0, v0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v2

    invoke-static {v2}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->gte(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v0, v3}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(II)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v3

    invoke-static {v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression$Helper;->lt(Lcom/github/zafarkhaja/semver/Version;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/expr/CompositeExpression;->and(Lcom/github/zafarkhaja/semver/expr/Expression;)Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v2

    goto :goto_1d
.end method

.method private versionFor(I)Lcom/github/zafarkhaja/semver/Version;
    .registers 3
    .param p1, "major"    # I

    .prologue
    const/4 v0, 0x0

    .line 458
    invoke-direct {p0, p1, v0, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method

.method private versionFor(II)Lcom/github/zafarkhaja/semver/Version;
    .registers 4
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .prologue
    .line 470
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->versionFor(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method

.method private versionFor(III)Lcom/github/zafarkhaja/semver/Version;
    .registers 5
    .param p1, "major"    # I
    .param p2, "minor"    # I
    .param p3, "patch"    # I

    .prologue
    .line 483
    invoke-static {p1, p2, p3}, Lcom/github/zafarkhaja/semver/Version;->forIntegers(III)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public parse(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/Expression;
    .registers 6
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 86
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->lexer:Lcom/github/zafarkhaja/semver/expr/Lexer;

    invoke-virtual {v1, p1}, Lcom/github/zafarkhaja/semver/expr/Lexer;->tokenize(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/util/Stream;

    move-result-object v1

    iput-object v1, p0, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->tokens:Lcom/github/zafarkhaja/semver/util/Stream;

    .line 87
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parseSemVerExpression()Lcom/github/zafarkhaja/semver/expr/CompositeExpression;

    move-result-object v0

    .line 88
    .local v0, "expr":Lcom/github/zafarkhaja/semver/expr/Expression;
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    const/4 v2, 0x0

    sget-object v3, Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;->EOI:Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;

    aput-object v3, v1, v2

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->consumeNextToken([Lcom/github/zafarkhaja/semver/expr/Lexer$Token$Type;)Lcom/github/zafarkhaja/semver/expr/Lexer$Token;

    .line 89
    return-object v0
.end method

.method public bridge synthetic parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/expr/ExpressionParser;->parse(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/expr/Expression;

    move-result-object v0

    return-object v0
.end method
