.class final Lcom/theartofdev/edmodo/cropper/CropWindowHandler;
.super Ljava/lang/Object;
.source "CropWindowHandler.java"


# instance fields
.field private final mEdges:Landroid/graphics/RectF;

.field private final mGetEdges:Landroid/graphics/RectF;

.field private mMaxCropResultHeight:F

.field private mMaxCropResultWidth:F

.field private mMaxCropWindowHeight:F

.field private mMaxCropWindowWidth:F

.field private mMinCropResultHeight:F

.field private mMinCropResultWidth:F

.field private mMinCropWindowHeight:F

.field private mMinCropWindowWidth:F

.field private mScaleFactorHeight:F

.field private mScaleFactorWidth:F


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    .line 32
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mGetEdges:Landroid/graphics/RectF;

    .line 81
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorWidth:F

    .line 86
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorHeight:F

    return-void
.end method

.method private focusCenter()Z
    .registers 2

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->showGuidelines()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private getOvalPressedMoveType(FF)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    .registers 14
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/high16 v10, 0x40c00000    # 6.0f

    const/high16 v9, 0x40a00000    # 5.0f

    .line 270
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float v2, v7, v10

    .line 271
    .local v2, "cellLength":F
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    add-float v3, v7, v2

    .line 272
    .local v3, "leftCenter":F
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    mul-float v8, v9, v2

    add-float v5, v7, v8

    .line 274
    .local v5, "rightCenter":F
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float v1, v7, v10

    .line 275
    .local v1, "cellHeight":F
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    add-float v6, v7, v1

    .line 276
    .local v6, "topCenter":F
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    mul-float v8, v9, v1

    add-float v0, v7, v8

    .line 279
    .local v0, "bottomCenter":F
    cmpg-float v7, p1, v3

    if-gez v7, :cond_45

    .line 280
    cmpg-float v7, p2, v6

    if-gez v7, :cond_3b

    .line 281
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 305
    .local v4, "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :goto_3a
    return-object v4

    .line 282
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_3b
    cmpg-float v7, p2, v0

    if-gez v7, :cond_42

    .line 283
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 285
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_42
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 287
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_45
    cmpg-float v7, p1, v5

    if-gez v7, :cond_5a

    .line 288
    cmpg-float v7, p2, v6

    if-gez v7, :cond_50

    .line 289
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 290
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_50
    cmpg-float v7, p2, v0

    if-gez v7, :cond_57

    .line 291
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 293
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_57
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 296
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_5a
    cmpg-float v7, p2, v6

    if-gez v7, :cond_61

    .line 297
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 298
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_61
    cmpg-float v7, p2, v0

    if-gez v7, :cond_68

    .line 299
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a

    .line 301
    .end local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_68
    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .restart local v4    # "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    goto :goto_3a
.end method

.method private getRectanglePressedMoveType(FFF)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    .registers 11
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "targetRadius"    # F

    .prologue
    .line 216
    const/4 v6, 0x0

    .line 219
    .local v6, "moveType":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-static {p1, p2, v0, v1, p3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 220
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 241
    :cond_11
    :goto_11
    return-object v6

    .line 221
    :cond_12
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-static {p1, p2, v0, v1, p3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 222
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto :goto_11

    .line 223
    :cond_23
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, p2, v0, v1, p3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 224
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto :goto_11

    .line 225
    :cond_34
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, p2, v0, v1, p3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 226
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM_RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto :goto_11

    .line 227
    :cond_45
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    move v0, p1

    move v1, p2

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCenterTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->focusCenter()Z

    move-result v0

    if-eqz v0, :cond_66

    .line 228
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto :goto_11

    .line 229
    :cond_66
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->top:F

    move v0, p1

    move v1, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_7e

    .line 230
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->TOP:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto :goto_11

    .line 231
    :cond_7e
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    move v0, p1

    move v1, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_97

    .line 232
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->BOTTOM:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto/16 :goto_11

    .line 233
    :cond_97
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    move v0, p1

    move v1, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_b0

    .line 234
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->LEFT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto/16 :goto_11

    .line 235
    :cond_b0
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    move v0, p1

    move v1, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_c9

    .line 236
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->RIGHT:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto/16 :goto_11

    .line 237
    :cond_c9
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v4, v0, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    move v0, p1

    move v1, p2

    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->isInCenterTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->focusCenter()Z

    move-result v0

    if-nez v0, :cond_11

    .line 238
    sget-object v6, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    goto/16 :goto_11
.end method

.method private static isInCenterTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "left"    # F
    .param p3, "top"    # F
    .param p4, "right"    # F
    .param p5, "bottom"    # F

    .prologue
    .line 372
    cmpl-float v0, p0, p2

    if-lez v0, :cond_12

    cmpg-float v0, p0, p4

    if-gez v0, :cond_12

    cmpl-float v0, p1, p3

    if-lez v0, :cond_12

    cmpg-float v0, p1, p5

    if-gez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static isInCornerTargetZone(FFFFF)Z
    .registers 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleX"    # F
    .param p3, "handleY"    # F
    .param p4, "targetRadius"    # F

    .prologue
    .line 321
    sub-float v0, p0, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p4

    if-gtz v0, :cond_16

    sub-float v0, p1, p3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p4

    if-gtz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private static isInHorizontalTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleXStart"    # F
    .param p3, "handleXEnd"    # F
    .param p4, "handleY"    # F
    .param p5, "targetRadius"    # F

    .prologue
    .line 338
    cmpl-float v0, p0, p2

    if-lez v0, :cond_14

    cmpg-float v0, p0, p3

    if-gez v0, :cond_14

    sub-float v0, p1, p4

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p5

    if-gtz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private static isInVerticalTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleX"    # F
    .param p3, "handleYStart"    # F
    .param p4, "handleYEnd"    # F
    .param p5, "targetRadius"    # F

    .prologue
    .line 355
    sub-float v0, p0, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p5

    if-gtz v0, :cond_14

    cmpl-float v0, p1, p3

    if-lez v0, :cond_14

    cmpg-float v0, p1, p4

    if-gez v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method


# virtual methods
.method public getMaxCropHeight()F
    .registers 4

    .prologue
    .line 122
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropWindowHeight:F

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropResultHeight:F

    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorHeight:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public getMaxCropWidth()F
    .registers 4

    .prologue
    .line 115
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropWindowWidth:F

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropResultWidth:F

    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorWidth:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public getMinCropHeight()F
    .registers 4

    .prologue
    .line 108
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropWindowHeight:F

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropResultHeight:F

    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorHeight:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getMinCropWidth()F
    .registers 4

    .prologue
    .line 101
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropWindowWidth:F

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropResultWidth:F

    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorWidth:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getMoveHandler(FFFLcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "targetRadius"    # F
    .param p4, "cropShape"    # Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .prologue
    .line 194
    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne p4, v1, :cond_10

    .line 195
    invoke-direct {p0, p1, p2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getOvalPressedMoveType(FF)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    move-result-object v0

    .line 197
    .local v0, "type":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :goto_8
    if-eqz v0, :cond_15

    new-instance v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    invoke-direct {v1, v0, p0, p1, p2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;-><init>(Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;Lcom/theartofdev/edmodo/cropper/CropWindowHandler;FF)V

    :goto_f
    return-object v1

    .line 196
    .end local v0    # "type":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_10
    invoke-direct {p0, p1, p2, p3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRectanglePressedMoveType(FFF)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    move-result-object v0

    goto :goto_8

    .line 197
    .restart local v0    # "type":Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    :cond_15
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public getRect()Landroid/graphics/RectF;
    .registers 3

    .prologue
    .line 93
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mGetEdges:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 94
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mGetEdges:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getScaleFactorHeight()F
    .registers 2

    .prologue
    .line 136
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorHeight:F

    return v0
.end method

.method public getScaleFactorWidth()F
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorWidth:F

    return v0
.end method

.method public setCropWindowLimits(FFFF)V
    .registers 5
    .param p1, "maxWidth"    # F
    .param p2, "maxHeight"    # F
    .param p3, "scaleFactorWidth"    # F
    .param p4, "scaleFactorHeight"    # F

    .prologue
    .line 144
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropWindowWidth:F

    .line 145
    iput p2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropWindowHeight:F

    .line 146
    iput p3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorWidth:F

    .line 147
    iput p4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mScaleFactorHeight:F

    .line 148
    return-void
.end method

.method public setInitialAttributeValues(Lcom/theartofdev/edmodo/cropper/CropImageOptions;)V
    .registers 3
    .param p1, "options"    # Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .prologue
    .line 154
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropWindowWidth:F

    .line 155
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropWindowHeight:F

    .line 156
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropResultWidth:F

    .line 157
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMinCropResultHeight:F

    .line 158
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropResultWidth:F

    .line 159
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    int-to-float v0, v0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mMaxCropResultHeight:F

    .line 160
    return-void
.end method

.method public setRect(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 167
    return-void
.end method

.method public showGuidelines()Z
    .registers 3

    .prologue
    const/high16 v1, 0x42c80000    # 100.0f

    .line 177
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_18

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->mEdges:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method
