.class Lcom/google/common/base/CharMatcher$And;
.super Lcom/google/common/base/CharMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "And"
.end annotation


# instance fields
.field final first:Lcom/google/common/base/CharMatcher;

.field final second:Lcom/google/common/base/CharMatcher;


# direct methods
.method constructor <init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;)V
    .registers 5
    .param p1, "a"    # Lcom/google/common/base/CharMatcher;
    .param p2, "b"    # Lcom/google/common/base/CharMatcher;

    .prologue
    .line 682
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CharMatcher.and("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/base/CharMatcher$And;-><init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;Ljava/lang/String;)V

    .line 683
    return-void
.end method

.method constructor <init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    .registers 5
    .param p1, "a"    # Lcom/google/common/base/CharMatcher;
    .param p2, "b"    # Lcom/google/common/base/CharMatcher;
    .param p3, "description"    # Ljava/lang/String;

    .prologue
    .line 686
    invoke-direct {p0, p3}, Lcom/google/common/base/CharMatcher;-><init>(Ljava/lang/String;)V

    .line 687
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/CharMatcher;

    iput-object v0, p0, Lcom/google/common/base/CharMatcher$And;->first:Lcom/google/common/base/CharMatcher;

    .line 688
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/base/CharMatcher;

    iput-object v0, p0, Lcom/google/common/base/CharMatcher$And;->second:Lcom/google/common/base/CharMatcher;

    .line 689
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 677
    check-cast p1, Ljava/lang/Character;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-super {p0, p1}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result v0

    return v0
.end method

.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 693
    iget-object v0, p0, Lcom/google/common/base/CharMatcher$And;->first:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p1}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/common/base/CharMatcher$And;->second:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p1}, Lcom/google/common/base/CharMatcher;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 5
    .param p1, "table"    # Ljava/util/BitSet;
    .annotation build Lcom/google/common/annotations/GwtIncompatible;
        value = "java.util.BitSet"
    .end annotation

    .prologue
    .line 699
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 700
    .local v0, "tmp1":Ljava/util/BitSet;
    iget-object v2, p0, Lcom/google/common/base/CharMatcher$And;->first:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v2, v0}, Lcom/google/common/base/CharMatcher;->setBits(Ljava/util/BitSet;)V

    .line 701
    new-instance v1, Ljava/util/BitSet;

    invoke-direct {v1}, Ljava/util/BitSet;-><init>()V

    .line 702
    .local v1, "tmp2":Ljava/util/BitSet;
    iget-object v2, p0, Lcom/google/common/base/CharMatcher$And;->second:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v2, v1}, Lcom/google/common/base/CharMatcher;->setBits(Ljava/util/BitSet;)V

    .line 703
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->and(Ljava/util/BitSet;)V

    .line 704
    invoke-virtual {p1, v0}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 705
    return-void
.end method

.method withToString(Ljava/lang/String;)Lcom/google/common/base/CharMatcher;
    .registers 5
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 709
    new-instance v0, Lcom/google/common/base/CharMatcher$And;

    iget-object v1, p0, Lcom/google/common/base/CharMatcher$And;->first:Lcom/google/common/base/CharMatcher;

    iget-object v2, p0, Lcom/google/common/base/CharMatcher$And;->second:Lcom/google/common/base/CharMatcher;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/common/base/CharMatcher$And;-><init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;Ljava/lang/String;)V

    return-object v0
.end method
