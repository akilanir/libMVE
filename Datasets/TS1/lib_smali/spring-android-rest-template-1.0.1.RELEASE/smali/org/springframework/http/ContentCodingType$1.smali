.class final Lorg/springframework/http/ContentCodingType$1;
.super Ljava/lang/Object;
.source "ContentCodingType.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/http/ContentCodingType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/springframework/http/ContentCodingType;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 461
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 461
    check-cast p1, Lorg/springframework/http/ContentCodingType;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/springframework/http/ContentCodingType;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/springframework/http/ContentCodingType$1;->compare(Lorg/springframework/http/ContentCodingType;Lorg/springframework/http/ContentCodingType;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/springframework/http/ContentCodingType;Lorg/springframework/http/ContentCodingType;)I
    .registers 11
    .param p1, "codingType1"    # Lorg/springframework/http/ContentCodingType;
    .param p2, "codingType2"    # Lorg/springframework/http/ContentCodingType;

    .prologue
    const/4 v5, 0x0

    .line 464
    invoke-virtual {p1}, Lorg/springframework/http/ContentCodingType;->getQualityValue()D

    move-result-wide v0

    .line 465
    .local v0, "quality1":D
    invoke-virtual {p2}, Lorg/springframework/http/ContentCodingType;->getQualityValue()D

    move-result-wide v2

    .line 466
    .local v2, "quality2":D
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Double;->compare(DD)I

    move-result v4

    .line 467
    .local v4, "qualityComparison":I
    if-eqz v4, :cond_10

    .line 476
    .end local v4    # "qualityComparison":I
    :goto_f
    return v4

    .line 469
    .restart local v4    # "qualityComparison":I
    :cond_10
    invoke-virtual {p1}, Lorg/springframework/http/ContentCodingType;->isWildcardType()Z

    move-result v6

    if-eqz v6, :cond_1e

    invoke-virtual {p2}, Lorg/springframework/http/ContentCodingType;->isWildcardType()Z

    move-result v6

    if-nez v6, :cond_1e

    .line 470
    const/4 v4, 0x1

    goto :goto_f

    .line 471
    :cond_1e
    invoke-virtual {p2}, Lorg/springframework/http/ContentCodingType;->isWildcardType()Z

    move-result v6

    if-eqz v6, :cond_2c

    invoke-virtual {p1}, Lorg/springframework/http/ContentCodingType;->isWildcardType()Z

    move-result v6

    if-nez v6, :cond_2c

    .line 472
    const/4 v4, -0x1

    goto :goto_f

    .line 473
    :cond_2c
    invoke-virtual {p1}, Lorg/springframework/http/ContentCodingType;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lorg/springframework/http/ContentCodingType;->getType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3c

    move v4, v5

    .line 474
    goto :goto_f

    :cond_3c
    move v4, v5

    .line 476
    goto :goto_f
.end method
