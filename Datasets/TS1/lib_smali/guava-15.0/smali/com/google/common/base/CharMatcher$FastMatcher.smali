.class abstract Lcom/google/common/base/CharMatcher$FastMatcher;
.super Lcom/google/common/base/CharMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "FastMatcher"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 812
    invoke-direct {p0}, Lcom/google/common/base/CharMatcher;-><init>()V

    .line 813
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 816
    invoke-direct {p0, p1}, Lcom/google/common/base/CharMatcher;-><init>(Ljava/lang/String;)V

    .line 817
    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 810
    check-cast p1, Ljava/lang/Character;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-super {p0, p1}, Lcom/google/common/base/CharMatcher;->apply(Ljava/lang/Character;)Z

    move-result v0

    return v0
.end method

.method public negate()Lcom/google/common/base/CharMatcher;
    .registers 2

    .prologue
    .line 826
    new-instance v0, Lcom/google/common/base/CharMatcher$NegatedFastMatcher;

    invoke-direct {v0, p0}, Lcom/google/common/base/CharMatcher$NegatedFastMatcher;-><init>(Lcom/google/common/base/CharMatcher;)V

    return-object v0
.end method

.method public final precomputed()Lcom/google/common/base/CharMatcher;
    .registers 1

    .prologue
    .line 821
    return-object p0
.end method
