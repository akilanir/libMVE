.class final Lcom/google/common/base/CharMatcher$8;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 326
    invoke-direct {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 2
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 393
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    return-object p0
.end method

.method public collapseFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .registers 4
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "replacement"    # C

    .prologue
    .line 370
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public countIn(Ljava/lang/CharSequence;)I
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 388
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    const/4 v0, 0x0

    return v0
.end method

.method public indexIn(Ljava/lang/CharSequence;)I
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 332
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    const/4 v0, -0x1

    return v0
.end method

.method public indexIn(Ljava/lang/CharSequence;I)I
    .registers 5
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I

    .prologue
    .line 337
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 338
    .local v0, "length":I
    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 339
    const/4 v1, -0x1

    return v1
.end method

.method public lastIndexIn(Ljava/lang/CharSequence;)I
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 343
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    const/4 v0, -0x1

    return v0
.end method

.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 328
    const/4 v0, 0x0

    return v0
.end method

.method public matchesAllOf(Ljava/lang/CharSequence;)Z
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 348
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public matchesNoneOf(Ljava/lang/CharSequence;)Z
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 352
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    const/4 v0, 0x1

    return v0
.end method

.method public negate()Lcom/google/common/base/CharMatcher;
    .registers 2

    .prologue
    .line 402
    sget-object v0, Lcom/google/common/base/CharMatcher$8;->ANY:Lcom/google/common/base/CharMatcher;

    return-object v0
.end method

.method public or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 3
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 398
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/CharMatcher;

    return-object v0
.end method

.method public removeFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 357
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public replaceFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .registers 4
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "replacement"    # C

    .prologue
    .line 361
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public replaceFrom(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 4
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "replacement"    # Ljava/lang/CharSequence;

    .prologue
    .line 365
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 366
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trimFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 374
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trimLeadingFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 379
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trimTrailingFrom(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 3
    .param p1, "sequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 384
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
