.class Lcom/github/zafarkhaja/semver/VersionParser;
.super Ljava/lang/Object;
.source "VersionParser.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/Parser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/VersionParser$1;,
        Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/github/zafarkhaja/semver/Parser",
        "<",
        "Lcom/github/zafarkhaja/semver/Version;",
        ">;"
    }
.end annotation


# instance fields
.field private final chars:Lcom/github/zafarkhaja/semver/util/Stream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/github/zafarkhaja/semver/util/Stream",
            "<",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 162
    :cond_b
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Input string is NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 164
    :cond_13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    new-array v0, v2, [Ljava/lang/Character;

    .line 165
    .local v0, "elements":[Ljava/lang/Character;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2d

    .line 166
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    aput-object v2, v0, v1

    .line 165
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 168
    :cond_2d
    new-instance v2, Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-direct {v2, v0}, Lcom/github/zafarkhaja/semver/util/Stream;-><init>([Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    .line 169
    return-void
.end method

.method private alphanumericIdentifier()Ljava/lang/String;
    .registers 9

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 426
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 428
    .local v0, "sb":Ljava/lang/StringBuilder;
    :cond_9
    new-array v1, v7, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v5

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v6

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 429
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v7, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v5

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v6

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 430
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private buildIdentifier()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 384
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->checkForEmptyIdentifier()V

    .line 385
    new-array v1, v3, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v5

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->nearestCharType([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    move-result-object v0

    .line 386
    .local v0, "boundary":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v3, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v5

    invoke-virtual {v1, v0, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookaheadBefore(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 387
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->alphanumericIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 389
    :goto_2a
    return-object v1

    :cond_2b
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->digits()Ljava/lang/String;

    move-result-object v1

    goto :goto_2a
.end method

.method private checkForEmptyIdentifier()V
    .registers 10

    .prologue
    const/4 v8, 0x1

    .line 492
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v1, v8}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 493
    .local v0, "la":Ljava/lang/Character;
    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v1, v0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v1, v0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v1, v0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 494
    :cond_21
    new-instance v1, Lcom/github/zafarkhaja/semver/ParseException;

    const-string v2, "Identifiers MUST NOT be empty"

    new-instance v3, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;

    iget-object v4, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    .line 498
    invoke-virtual {v4}, Lcom/github/zafarkhaja/semver/util/Stream;->currentOffset()I

    move-result v4

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    const/4 v6, 0x0

    sget-object v7, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v7, v5, v6

    sget-object v6, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v6, v5, v8

    const/4 v6, 0x2

    sget-object v7, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v7, v5, v6

    invoke-direct {v3, v0, v4, v5}, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;-><init>(Ljava/lang/Character;I[Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V

    invoke-direct {v1, v2, v3}, Lcom/github/zafarkhaja/semver/ParseException;-><init>(Ljava/lang/String;Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;)V

    throw v1

    .line 503
    :cond_45
    return-void
.end method

.method private checkForLeadingZeroes()V
    .registers 5

    .prologue
    .line 476
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 477
    .local v0, "la1":Ljava/lang/Character;
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Character;

    .line 478
    .local v1, "la2":Ljava/lang/Character;
    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v2

    const/16 v3, 0x30

    if-ne v2, v3, :cond_2c

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v2, v1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 479
    new-instance v2, Lcom/github/zafarkhaja/semver/ParseException;

    const-string v3, "Numeric identifier MUST NOT contain leading zeroes"

    invoke-direct {v2, v3}, Lcom/github/zafarkhaja/semver/ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 483
    :cond_2c
    return-void
.end method

.method private varargs consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;
    .registers 4
    .param p1, "expected"    # [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .prologue
    .line 514
    :try_start_0
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v1, p1}, Lcom/github/zafarkhaja/semver/util/Stream;->consume([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Character;
    :try_end_8
    .catch Lcom/github/zafarkhaja/semver/util/UnexpectedElementException; {:try_start_0 .. :try_end_8} :catch_9

    return-object v1

    .line 515
    :catch_9
    move-exception v0

    .line 516
    .local v0, "e":Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;
    new-instance v1, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;

    invoke-direct {v1, v0}, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;-><init>(Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;)V

    throw v1
.end method

.method private digits()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 446
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 448
    .local v0, "sb":Ljava/lang/StringBuilder;
    :cond_7
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 449
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 450
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private varargs ensureValidLookahead([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V
    .registers 5
    .param p1, "expected"    # [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .prologue
    .line 527
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v0, p1}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 528
    new-instance v1, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;

    iget-object v0, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    const/4 v2, 0x1

    .line 529
    invoke-virtual {v0, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    .line 530
    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->currentOffset()I

    move-result v2

    invoke-direct {v1, v0, v2, p1}, Lcom/github/zafarkhaja/semver/UnexpectedCharacterException;-><init>(Ljava/lang/Character;I[Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V

    throw v1

    .line 534
    :cond_1d
    return-void
.end method

.method private varargs nearestCharType([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    .registers 8
    .param p1, "types"    # [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .prologue
    .line 460
    iget-object v2, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-virtual {v2}, Lcom/github/zafarkhaja/semver/util/Stream;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Character;

    .line 461
    .local v0, "chr":Ljava/lang/Character;
    array-length v4, p1

    const/4 v2, 0x0

    :goto_14
    if-ge v2, v4, :cond_6

    aget-object v1, p1, v2

    .line 462
    .local v1, "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    invoke-virtual {v1, v0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 467
    .end local v0    # "chr":Ljava/lang/Character;
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :goto_1e
    return-object v1

    .line 461
    .restart local v0    # "chr":Ljava/lang/Character;
    .restart local v1    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :cond_1f
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 467
    .end local v0    # "chr":Ljava/lang/Character;
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :cond_22
    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    goto :goto_1e
.end method

.method private numericIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 407
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->checkForLeadingZeroes()V

    .line 408
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->digits()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parseBuild()Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 358
    const/4 v1, 0x3

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v5

    const/4 v2, 0x2

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v1, v2

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->ensureValidLookahead([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V

    .line 359
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 361
    .local v0, "idents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1a
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->buildIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 363
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    goto :goto_1a

    .line 368
    :cond_39
    new-instance v2, Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-direct {v2, v1}, Lcom/github/zafarkhaja/semver/MetadataVersion;-><init>([Ljava/lang/String;)V

    return-object v2
.end method

.method static parseBuild(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 3
    .param p0, "build"    # Ljava/lang/String;

    .prologue
    .line 236
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser;

    invoke-direct {v0, p0}, Lcom/github/zafarkhaja/semver/VersionParser;-><init>(Ljava/lang/String;)V

    .line 237
    .local v0, "parser":Lcom/github/zafarkhaja/semver/VersionParser;
    invoke-direct {v0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseBuild()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v1

    return-object v1
.end method

.method private parsePreRelease()Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 308
    const/4 v1, 0x3

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v5

    const/4 v2, 0x2

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v1, v2

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->ensureValidLookahead([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)V

    .line 309
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 311
    .local v0, "idents":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1a
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->preReleaseIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 313
    new-array v1, v5, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    goto :goto_1a

    .line 318
    :cond_39
    new-instance v2, Lcom/github/zafarkhaja/semver/MetadataVersion;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-direct {v2, v1}, Lcom/github/zafarkhaja/semver/MetadataVersion;-><init>([Ljava/lang/String;)V

    return-object v2
.end method

.method static parsePreRelease(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/MetadataVersion;
    .registers 3
    .param p0, "preRelease"    # Ljava/lang/String;

    .prologue
    .line 222
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser;

    invoke-direct {v0, p0}, Lcom/github/zafarkhaja/semver/VersionParser;-><init>(Ljava/lang/String;)V

    .line 223
    .local v0, "parser":Lcom/github/zafarkhaja/semver/VersionParser;
    invoke-direct {v0}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v1

    return-object v1
.end method

.method private parseValidSemVer()Lcom/github/zafarkhaja/semver/Version;
    .registers 10

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 255
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseVersionCore()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v2

    .line 256
    .local v2, "normal":Lcom/github/zafarkhaja/semver/NormalVersion;
    sget-object v3, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    .line 257
    .local v3, "preRelease":Lcom/github/zafarkhaja/semver/MetadataVersion;
    sget-object v0, Lcom/github/zafarkhaja/semver/MetadataVersion;->NULL:Lcom/github/zafarkhaja/semver/MetadataVersion;

    .line 259
    .local v0, "build":Lcom/github/zafarkhaja/semver/MetadataVersion;
    const/4 v4, 0x3

    new-array v4, v4, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v6

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v7

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v8

    invoke-direct {p0, v4}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    move-result-object v1

    .line 260
    .local v1, "next":Ljava/lang/Character;
    sget-object v4, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v4, v1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 261
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parsePreRelease()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v3

    .line 262
    new-array v4, v8, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v6

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v7

    invoke-direct {p0, v4}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    move-result-object v1

    .line 263
    sget-object v4, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v4, v1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 264
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseBuild()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v0

    .line 269
    :cond_44
    :goto_44
    new-array v4, v7, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v5, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v5, v4, v6

    invoke-direct {p0, v4}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    .line 270
    new-instance v4, Lcom/github/zafarkhaja/semver/Version;

    invoke-direct {v4, v2, v3, v0}, Lcom/github/zafarkhaja/semver/Version;-><init>(Lcom/github/zafarkhaja/semver/NormalVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;Lcom/github/zafarkhaja/semver/MetadataVersion;)V

    return-object v4

    .line 266
    :cond_53
    sget-object v4, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v4, v1}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    .line 267
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseBuild()Lcom/github/zafarkhaja/semver/MetadataVersion;

    move-result-object v0

    goto :goto_44
.end method

.method static parseValidSemVer(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 3
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    .line 194
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser;

    invoke-direct {v0, p0}, Lcom/github/zafarkhaja/semver/VersionParser;-><init>(Ljava/lang/String;)V

    .line 195
    .local v0, "parser":Lcom/github/zafarkhaja/semver/VersionParser;
    invoke-direct {v0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseValidSemVer()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v1

    return-object v1
.end method

.method private parseVersionCore()Lcom/github/zafarkhaja/semver/NormalVersion;
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 285
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->numericIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 286
    .local v0, "major":I
    new-array v3, v6, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v4, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    .line 287
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->numericIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 288
    .local v1, "minor":I
    new-array v3, v6, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v4, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v4, v3, v5

    invoke-direct {p0, v3}, Lcom/github/zafarkhaja/semver/VersionParser;->consumeNextCharacter([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Ljava/lang/Character;

    .line 289
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->numericIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 290
    .local v2, "patch":I
    new-instance v3, Lcom/github/zafarkhaja/semver/NormalVersion;

    invoke-direct {v3, v0, v1, v2}, Lcom/github/zafarkhaja/semver/NormalVersion;-><init>(III)V

    return-object v3
.end method

.method static parseVersionCore(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/NormalVersion;
    .registers 3
    .param p0, "versionCore"    # Ljava/lang/String;

    .prologue
    .line 208
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser;

    invoke-direct {v0, p0}, Lcom/github/zafarkhaja/semver/VersionParser;-><init>(Ljava/lang/String;)V

    .line 209
    .local v0, "parser":Lcom/github/zafarkhaja/semver/VersionParser;
    invoke-direct {v0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseVersionCore()Lcom/github/zafarkhaja/semver/NormalVersion;

    move-result-object v1

    return-object v1
.end method

.method private preReleaseIdentifier()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 334
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->checkForEmptyIdentifier()V

    .line 335
    const/4 v1, 0x3

    new-array v1, v1, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v4

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v5

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v1, v3

    invoke-direct {p0, v1}, Lcom/github/zafarkhaja/semver/VersionParser;->nearestCharType([Lcom/github/zafarkhaja/semver/VersionParser$CharType;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    move-result-object v0

    .line 336
    .local v0, "boundary":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/VersionParser;->chars:Lcom/github/zafarkhaja/semver/util/Stream;

    new-array v2, v3, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v4

    sget-object v3, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v3, v2, v5

    invoke-virtual {v1, v0, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->positiveLookaheadBefore(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 337
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->alphanumericIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 339
    :goto_2f
    return-object v1

    :cond_30
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->numericIdentifier()Ljava/lang/String;

    move-result-object v1

    goto :goto_2f
.end method


# virtual methods
.method public parse(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 181
    invoke-direct {p0}, Lcom/github/zafarkhaja/semver/VersionParser;->parseValidSemVer()Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/github/zafarkhaja/semver/VersionParser;->parse(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/Version;

    move-result-object v0

    return-object v0
.end method
