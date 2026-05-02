.class final Lcom/google/common/base/CharMatcher$9;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;
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
    .line 413
    iput-char p2, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-direct {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public and(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 3
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 423
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-virtual {p1, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_9

    .end local p0    # "this":Lcom/google/common/base/CharMatcher$9;
    :goto_8
    return-object p0

    .restart local p0    # "this":Lcom/google/common/base/CharMatcher$9;
    :cond_9
    sget-object p0, Lcom/google/common/base/CharMatcher$9;->NONE:Lcom/google/common/base/CharMatcher;

    goto :goto_8
.end method

.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 415
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    if-ne p1, v0, :cond_6

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
    .line 431
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-static {v0}, Lcom/google/common/base/CharMatcher$9;->isNot(C)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    return-object v0
.end method

.method public or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;
    .registers 3
    .param p1, "other"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 427
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-virtual {p1, v0}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_9

    .end local p1    # "other":Lcom/google/common/base/CharMatcher;
    :goto_8
    return-object p1

    .restart local p1    # "other":Lcom/google/common/base/CharMatcher;
    :cond_9
    invoke-super {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;->or(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/CharMatcher;

    move-result-object p1

    goto :goto_8
.end method

.method public replaceFrom(Ljava/lang/CharSequence;C)Ljava/lang/String;
    .registers 5
    .param p1, "sequence"    # Ljava/lang/CharSequence;
    .param p2, "replacement"    # C

    .prologue
    .line 419
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget-char v1, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-virtual {v0, v1, p2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 3
    .param p1, "table"    # Ljava/util/BitSet;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.util.BitSet"
    .end annotation

    .prologue
    .line 437
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$9;->val$match:C

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->set(I)V

    .line 438
    return-void
.end method
