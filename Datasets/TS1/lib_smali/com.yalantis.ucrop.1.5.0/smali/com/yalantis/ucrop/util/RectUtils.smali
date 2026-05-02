.class public Lcom/yalantis/ucrop/util/RectUtils;
.super Ljava/lang/Object;
.source "RectUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCenterFromRect(Landroid/graphics/RectF;)[F
    .registers 4
    .param p0, "r"    # Landroid/graphics/RectF;

    .prologue
    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    invoke-virtual {p0}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p0}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    aput v2, v0, v1

    return-object v0
.end method

.method public static getCornersFromRect(Landroid/graphics/RectF;)[F
    .registers 4
    .param p0, "r"    # Landroid/graphics/RectF;

    .prologue
    .line 21
    const/16 v0, 0x8

    new-array v0, v0, [F

    const/4 v1, 0x0

    iget v2, p0, Landroid/graphics/RectF;->left:F

    aput v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Landroid/graphics/RectF;->top:F

    aput v2, v0, v1

    const/4 v1, 0x2

    iget v2, p0, Landroid/graphics/RectF;->right:F

    aput v2, v0, v1

    const/4 v1, 0x3

    iget v2, p0, Landroid/graphics/RectF;->top:F

    aput v2, v0, v1

    const/4 v1, 0x4

    iget v2, p0, Landroid/graphics/RectF;->right:F

    aput v2, v0, v1

    const/4 v1, 0x5

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    aput v2, v0, v1

    const/4 v1, 0x6

    iget v2, p0, Landroid/graphics/RectF;->left:F

    aput v2, v0, v1

    const/4 v1, 0x7

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    aput v2, v0, v1

    return-object v0
.end method

.method public static getRectSidesFromCorners([F)[F
    .registers 12
    .param p0, "corners"    # [F

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x2

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 42
    new-array v0, v7, [F

    aget v1, p0, v8

    aget v2, p0, v7

    sub-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    aget v3, p0, v9

    aget v4, p0, v10

    sub-float/2addr v3, v4

    float-to-double v3, v3

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    add-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    aput v1, v0, v8

    aget v1, p0, v7

    const/4 v2, 0x4

    aget v2, p0, v2

    sub-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    aget v3, p0, v10

    const/4 v4, 0x5

    aget v4, p0, v4

    sub-float/2addr v3, v4

    float-to-double v3, v3

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    add-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    aput v1, v0, v9

    return-object v0
.end method

.method public static trapToRect([F)Landroid/graphics/RectF;
    .registers 7
    .param p0, "array"    # [F

    .prologue
    const/high16 v5, 0x7f800000    # Float.POSITIVE_INFINITY

    const/high16 v4, -0x800000    # Float.NEGATIVE_INFINITY

    .line 58
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v5, v5, v4, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 60
    .local v1, "r":Landroid/graphics/RectF;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a
    array-length v4, p0

    if-ge v0, v4, :cond_44

    .line 61
    add-int/lit8 v4, v0, -0x1

    aget v2, p0, v4

    .line 62
    .local v2, "x":F
    aget v3, p0, v0

    .line 63
    .local v3, "y":F
    iget v4, v1, Landroid/graphics/RectF;->left:F

    cmpg-float v4, v2, v4

    if-gez v4, :cond_38

    move v4, v2

    :goto_1a
    iput v4, v1, Landroid/graphics/RectF;->left:F

    .line 64
    iget v4, v1, Landroid/graphics/RectF;->top:F

    cmpg-float v4, v3, v4

    if-gez v4, :cond_3b

    move v4, v3

    :goto_23
    iput v4, v1, Landroid/graphics/RectF;->top:F

    .line 65
    iget v4, v1, Landroid/graphics/RectF;->right:F

    cmpl-float v4, v2, v4

    if-lez v4, :cond_3e

    .end local v2    # "x":F
    :goto_2b
    iput v2, v1, Landroid/graphics/RectF;->right:F

    .line 66
    iget v4, v1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v4, v3, v4

    if-lez v4, :cond_41

    .end local v3    # "y":F
    :goto_33
    iput v3, v1, Landroid/graphics/RectF;->bottom:F

    .line 60
    add-int/lit8 v0, v0, 0x2

    goto :goto_a

    .line 63
    .restart local v2    # "x":F
    .restart local v3    # "y":F
    :cond_38
    iget v4, v1, Landroid/graphics/RectF;->left:F

    goto :goto_1a

    .line 64
    :cond_3b
    iget v4, v1, Landroid/graphics/RectF;->top:F

    goto :goto_23

    .line 65
    :cond_3e
    iget v2, v1, Landroid/graphics/RectF;->right:F

    goto :goto_2b

    .line 66
    .end local v2    # "x":F
    :cond_41
    iget v3, v1, Landroid/graphics/RectF;->bottom:F

    goto :goto_33

    .line 68
    .end local v3    # "y":F
    :cond_44
    invoke-virtual {v1}, Landroid/graphics/RectF;->sort()V

    .line 69
    return-object v1
.end method
