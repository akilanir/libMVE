.class final Lcom/google/common/base/CharMatcher$12;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/CharMatcher;->isEither(CC)Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$match1:C

.field final synthetic val$match2:C


# direct methods
.method constructor <init>(Ljava/lang/String;CC)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 518
    iput-char p2, p0, Lcom/google/common/base/CharMatcher$12;->val$match1:C

    iput-char p3, p0, Lcom/google/common/base/CharMatcher$12;->val$match2:C

    invoke-direct {p0, p1}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 520
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$12;->val$match1:C

    if-eq p1, v0, :cond_8

    iget-char v0, p0, Lcom/google/common/base/CharMatcher$12;->val$match2:C

    if-ne p1, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 3
    .param p1, "table"    # Ljava/util/BitSet;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.util.BitSet"
    .end annotation

    .prologue
    .line 525
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$12;->val$match1:C

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->set(I)V

    .line 526
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$12;->val$match2:C

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->set(I)V

    .line 527
    return-void
.end method
