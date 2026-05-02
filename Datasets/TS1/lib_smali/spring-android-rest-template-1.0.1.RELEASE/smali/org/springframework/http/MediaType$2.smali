.class final Lorg/springframework/http/MediaType$2;
.super Ljava/lang/Object;
.source "MediaType.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/http/MediaType;
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
        "Lorg/springframework/http/MediaType;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 836
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 836
    check-cast p1, Lorg/springframework/http/MediaType;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/springframework/http/MediaType;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/springframework/http/MediaType$2;->compare(Lorg/springframework/http/MediaType;Lorg/springframework/http/MediaType;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/springframework/http/MediaType;Lorg/springframework/http/MediaType;)I
    .registers 15
    .param p1, "mediaType1"    # Lorg/springframework/http/MediaType;
    .param p2, "mediaType2"    # Lorg/springframework/http/MediaType;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 839
    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->getQualityValue()D

    move-result-wide v2

    .line 840
    .local v2, "quality1":D
    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->getQualityValue()D

    move-result-wide v4

    .line 841
    .local v4, "quality2":D
    invoke-static {v4, v5, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result v6

    .line 842
    .local v6, "qualityComparison":I
    if-eqz v6, :cond_13

    move v7, v6

    .line 860
    :cond_12
    :goto_12
    return v7

    .line 844
    :cond_13
    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->isWildcardType()Z

    move-result v10

    if-eqz v10, :cond_21

    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->isWildcardType()Z

    move-result v10

    if-nez v10, :cond_21

    move v7, v9

    .line 845
    goto :goto_12

    .line 846
    :cond_21
    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->isWildcardType()Z

    move-result v10

    if-eqz v10, :cond_2d

    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->isWildcardType()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 848
    :cond_2d
    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->getType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->getType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3d

    move v7, v8

    .line 849
    goto :goto_12

    .line 851
    :cond_3d
    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->isWildcardSubtype()Z

    move-result v10

    if-eqz v10, :cond_4b

    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->isWildcardSubtype()Z

    move-result v10

    if-nez v10, :cond_4b

    move v7, v9

    .line 852
    goto :goto_12

    .line 853
    :cond_4b
    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->isWildcardSubtype()Z

    move-result v10

    if-eqz v10, :cond_57

    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->isWildcardSubtype()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 855
    :cond_57
    invoke-virtual {p1}, Lorg/springframework/http/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p2}, Lorg/springframework/http/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_67

    move v7, v8

    .line 856
    goto :goto_12

    .line 858
    :cond_67
    # getter for: Lorg/springframework/http/MediaType;->parameters:Ljava/util/Map;
    invoke-static {p1}, Lorg/springframework/http/MediaType;->access$000(Lorg/springframework/http/MediaType;)Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v0

    .line 859
    .local v0, "paramsSize1":I
    # getter for: Lorg/springframework/http/MediaType;->parameters:Ljava/util/Map;
    invoke-static {p2}, Lorg/springframework/http/MediaType;->access$000(Lorg/springframework/http/MediaType;)Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v1

    .line 860
    .local v1, "paramsSize2":I
    if-lt v1, v0, :cond_12

    if-ne v1, v0, :cond_7d

    move v7, v8

    goto :goto_12

    :cond_7d
    move v7, v9

    goto :goto_12
.end method
