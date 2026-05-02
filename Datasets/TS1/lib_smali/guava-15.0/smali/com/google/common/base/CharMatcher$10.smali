.class final Lcom/google/common/base/CharMatcher$10;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/CharMatcher;->isNot(C)Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$match:C


# direct methods
.method constructor <init>(Ljava/lang/String;C)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 449
    iput-char p2, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    invoke-direct {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 3
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 455
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    invoke-virtual {p1, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-super {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;->and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object p1

    .end local p1    # "other":Lcom/google/common/base/CharMatcher;
    :cond_c
    return-object p1
.end method

.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 451
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    if-eq p1, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public negate()Lcom/google/common/base/CharMatcher;
    .registers 2

    .prologue
    .line 470
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    invoke-static {v0}, Lcom/google/common/base/CharMatcher$10;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    return-object v0
.end method

.method public or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 3
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 459
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    invoke-virtual {p1, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_a

    sget-object p0, Lcom/google/common/base/CharMatcher$10;->ANY:Lcom/google/common/base/CharMatcher;

    .end local p0    # "this":Lcom/google/common/base/CharMatcher$10;
    :cond_a
    return-object p0
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 4
    .param p1, "table"    # Ljava/util/BitSet;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.util.BitSet"
    .end annotation

    .prologue
    .line 465
    const/4 v0, 0x0

    iget-char v1, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    invoke-virtual {p1, v0, v1}, Ljava/util/BitSet;->set(II)V

    .line 466
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$10;->val$match:C

    add-int/lit8 v0, v0, 0x1

    const/high16 v1, 0x10000

    invoke-virtual {p1, v0, v1}, Ljava/util/BitSet;->set(II)V

    .line 467
    return-void
.end method
