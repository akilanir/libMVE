.class Lcom/google/common/base/CharMatcher$BitSetMatcher;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtIncompatible;
    value = "java.util.BitSet"
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BitSetMatcher"
.end annotation


# instance fields
.field private final table:Ljava/util/BitSet;


# direct methods
.method private constructor <init>(Ljava/util/BitSet;Ljava/lang/String;)V
    .registers 5
    .param p1, "table"    # Ljava/util/BitSet;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 885
    invoke-direct {p0, p2}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>(Ljava/lang/String;)V

    .line 886
    invoke-virtual {p1}, Ljava/util/BitSet;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x40

    invoke-virtual {p1}, Ljava/util/BitSet;->size()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 887
    invoke-virtual {p1}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "table":Ljava/util/BitSet;
    check-cast p1, Ljava/util/BitSet;

    .line 890
    .restart local p1    # "table":Ljava/util/BitSet;
    :cond_15
    iput-object p1, p0, Lcom/google/common/base/CharMatcher$BitSetMatcher;->table:Ljava/util/BitSet;

    .line 891
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/BitSet;Ljava/lang/String;Lcom/google/common/base/CharMatcher$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/util/BitSet;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lcom/google/common/base/CharMatcher$1;

    .prologue
    .line 881
    invoke-direct {p0, p1, p2}, Lcom/google/common/base/CharMatcher$BitSetMatcher;-><init>(Ljava/util/BitSet;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public matches(C)Z
    .registers 3
    .param p1, "c"    # C

    .prologue
    .line 894
    iget-object v0, p0, Lcom/google/common/base/CharMatcher$BitSetMatcher;->table:Ljava/util/BitSet;

    invoke-virtual {v0, p1}, Ljava/util/BitSet;->get(I)Z

    move-result v0

    return v0
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 3
    .param p1, "bitSet"    # Ljava/util/BitSet;

    .prologue
    .line 899
    iget-object v0, p0, Lcom/google/common/base/CharMatcher$BitSetMatcher;->table:Ljava/util/BitSet;

    invoke-virtual {p1, v0}, Ljava/util/BitSet;->or(Ljava/util/BitSet;)V

    .line 900
    return-void
.end method
