.class final Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;
.super Ljava/lang/Object;
.source "CropWindowMoveHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    }
.end annotation


# instance fields
.field private final mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

.field private final mTouchOffset:Landroid/graphics/PointF;

.field private final mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;


# direct methods
.method public constructor <init>(Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;Lcom/theartofdev/edmodo/cropper/CropWindowHandler;FF)V
    .registers 6
    .param p1, "type"    # Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;
    .param p2, "cropWindowHandler"    # Lcom/theartofdev/edmodo/cropper/CropWindowHandler;
    .param p3, "touchX"    # F
    .param p4, "touchY"    # F

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    .line 53
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    .line 54
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    .line 55
    invoke-direct {p0, p3, p4}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->calculateTouchOffset(FF)V

    .line 56
    return-void
.end method

.method private adjustBottom(FLandroid/graphics/RectF;IFFZZ)V
    .registers 15
    .param p1, "bottom"    # F
    .param p2, "bounds"    # Landroid/graphics/RectF;
    .param p3, "viewHeight"    # I
    .param p4, "snapMargin"    # F
    .param p5, "aspectRatio"    # F
    .param p6, "leftMoves"    # Z
    .param p7, "rightMoves"    # Z

    .prologue
    .line 536
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 538
    .local v2, "rect":Landroid/graphics/RectF;
    move v0, p1

    .line 540
    .local v0, "newBottom":F
    int-to-float v3, p3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_24

    .line 541
    int-to-float v3, p3

    int-to-float v4, p3

    sub-float v4, v0, v4

    const v5, 0x3f866666    # 1.05f

    div-float/2addr v4, v5

    add-float v0, v3, v4

    .line 542
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->y:F

    int-to-float v5, p3

    sub-float v5, v0, v5

    const v6, 0x3f8ccccd    # 1.1f

    div-float/2addr v5, v6

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->y:F

    .line 545
    :cond_24
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    cmpg-float v3, v3, p4

    if-gez v3, :cond_2d

    .line 546
    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    .line 550
    :cond_2d
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_45

    .line 551
    iget v3, v2, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v4

    add-float v0, v3, v4

    .line 555
    :cond_45
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5d

    .line 556
    iget v3, v2, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v4

    add-float v0, v3, v4

    .line 559
    :cond_5d
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    cmpg-float v3, v3, p4

    if-gez v3, :cond_66

    .line 560
    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    .line 564
    :cond_66
    const/4 v3, 0x0

    cmpl-float v3, p5, v3

    if-lez v3, :cond_c7

    .line 565
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    mul-float v1, v3, p5

    .line 568
    .local v1, "newWidth":F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v3

    cmpg-float v3, v1, v3

    if-gez v3, :cond_91

    .line 569
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v5

    div-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 570
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    mul-float v1, v3, p5

    .line 574
    :cond_91
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_b1

    .line 575
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v5

    div-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 576
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    mul-float v1, v3, p5

    .line 580
    :cond_b1
    if-eqz p6, :cond_cf

    if-eqz p7, :cond_cf

    .line 581
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 596
    .end local v1    # "newWidth":F
    :cond_c7
    :goto_c7
    iput v0, v2, Landroid/graphics/RectF;->bottom:F

    .line 597
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 598
    return-void

    .line 584
    .restart local v1    # "newWidth":F
    :cond_cf
    if-eqz p6, :cond_ef

    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    iget v4, p2, Landroid/graphics/RectF;->left:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_ef

    .line 585
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/RectF;->top:F

    iget v5, v2, Landroid/graphics/RectF;->right:F

    iget v6, p2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    div-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 586
    iget v3, v2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    mul-float v1, v3, p5

    .line 590
    :cond_ef
    if-eqz p7, :cond_c7

    iget v3, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v1

    iget v4, p2, Landroid/graphics/RectF;->right:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_c7

    .line 591
    iget v3, p2, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/RectF;->top:F

    iget v5, p2, Landroid/graphics/RectF;->right:F

    iget v6, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    div-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_c7
.end method

.method private adjustBottomByAspectRatio(F)V
    .registers 5
    .param p1, "aspectRatio"    # F

    .prologue
    .line 635
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 636
    .local v0, "rect":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, p1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 637
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 638
    return-void
.end method

.method private adjustLeft(FLandroid/graphics/RectF;FFZZ)V
    .registers 14
    .param p1, "left"    # F
    .param p2, "bounds"    # Landroid/graphics/RectF;
    .param p3, "snapMargin"    # F
    .param p4, "aspectRatio"    # F
    .param p5, "topMoves"    # Z
    .param p6, "bottomMoves"    # Z

    .prologue
    const/4 v6, 0x0

    .line 311
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 313
    .local v2, "rect":Landroid/graphics/RectF;
    move v1, p1

    .line 315
    .local v1, "newLeft":F
    cmpg-float v3, v1, v6

    if-gez v3, :cond_1c

    .line 316
    const v3, 0x3f866666    # 1.05f

    div-float/2addr v1, v3

    .line 317
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->x:F

    const v5, 0x3f8ccccd    # 1.1f

    div-float v5, v1, v5

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->x:F

    .line 320
    :cond_1c
    iget v3, p2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    cmpg-float v3, v3, p3

    if-gez v3, :cond_26

    .line 321
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 325
    :cond_26
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3d

    .line 326
    iget v3, v2, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v4

    sub-float v1, v3, v4

    .line 330
    :cond_3d
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_54

    .line 331
    iget v3, v2, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v4

    sub-float v1, v3, v4

    .line 334
    :cond_54
    iget v3, p2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    cmpg-float v3, v3, p3

    if-gez v3, :cond_5e

    .line 335
    iget v1, p2, Landroid/graphics/RectF;->left:F

    .line 339
    :cond_5e
    cmpl-float v3, p4, v6

    if-lez v3, :cond_bb

    .line 340
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    div-float v0, v3, p4

    .line 343
    .local v0, "newHeight":F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v3

    cmpg-float v3, v0, v3

    if-gez v3, :cond_86

    .line 344
    iget v3, p2, Landroid/graphics/RectF;->left:F

    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v5

    mul-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 345
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    div-float v0, v3, p4

    .line 349
    :cond_86
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_a5

    .line 350
    iget v3, p2, Landroid/graphics/RectF;->left:F

    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v5

    mul-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 351
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    div-float v0, v3, p4

    .line 355
    :cond_a5
    if-eqz p5, :cond_c3

    if-eqz p6, :cond_c3

    .line 356
    iget v3, p2, Landroid/graphics/RectF;->left:F

    iget v4, v2, Landroid/graphics/RectF;->right:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v5

    mul-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 371
    .end local v0    # "newHeight":F
    :cond_bb
    :goto_bb
    iput v1, v2, Landroid/graphics/RectF;->left:F

    .line 372
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 373
    return-void

    .line 359
    .restart local v0    # "newHeight":F
    :cond_c3
    if-eqz p5, :cond_e2

    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    iget v4, p2, Landroid/graphics/RectF;->top:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_e2

    .line 360
    iget v3, p2, Landroid/graphics/RectF;->left:F

    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    iget v6, p2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 361
    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    div-float v0, v3, p4

    .line 365
    :cond_e2
    if-eqz p6, :cond_bb

    iget v3, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v0

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_bb

    .line 366
    iget v3, p2, Landroid/graphics/RectF;->left:F

    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget v5, p2, Landroid/graphics/RectF;->bottom:F

    iget v6, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_bb
.end method

.method private adjustLeftByAspectRatio(F)V
    .registers 5
    .param p1, "aspectRatio"    # F

    .prologue
    .line 605
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 606
    .local v0, "rect":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    mul-float/2addr v2, p1

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 607
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 608
    return-void
.end method

.method private adjustLeftRightByAspectRatio(Landroid/graphics/RectF;F)V
    .registers 7
    .param p1, "bounds"    # Landroid/graphics/RectF;
    .param p2, "aspectRatio"    # F

    .prologue
    const/4 v3, 0x0

    .line 645
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 646
    .local v0, "rect":Landroid/graphics/RectF;
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    mul-float/2addr v2, p2

    sub-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 647
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, p1, Landroid/graphics/RectF;->left:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_27

    .line 648
    iget v1, p1, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 650
    :cond_27
    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget v2, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_37

    .line 651
    iget v1, p1, Landroid/graphics/RectF;->right:F

    iget v2, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 653
    :cond_37
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 654
    return-void
.end method

.method private adjustRight(FLandroid/graphics/RectF;IFFZZ)V
    .registers 15
    .param p1, "right"    # F
    .param p2, "bounds"    # Landroid/graphics/RectF;
    .param p3, "viewWidth"    # I
    .param p4, "snapMargin"    # F
    .param p5, "aspectRatio"    # F
    .param p6, "topMoves"    # Z
    .param p7, "bottomMoves"    # Z

    .prologue
    .line 386
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 388
    .local v2, "rect":Landroid/graphics/RectF;
    move v1, p1

    .line 390
    .local v1, "newRight":F
    int-to-float v3, p3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_24

    .line 391
    int-to-float v3, p3

    int-to-float v4, p3

    sub-float v4, v1, v4

    const v5, 0x3f866666    # 1.05f

    div-float/2addr v4, v5

    add-float v1, v3, v4

    .line 392
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->x:F

    int-to-float v5, p3

    sub-float v5, v1, v5

    const v6, 0x3f8ccccd    # 1.1f

    div-float/2addr v5, v6

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->x:F

    .line 396
    :cond_24
    iget v3, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    cmpg-float v3, v3, p4

    if-gez v3, :cond_2d

    .line 397
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 401
    :cond_2d
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_45

    .line 402
    iget v3, v2, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v4

    add-float v1, v3, v4

    .line 406
    :cond_45
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5d

    .line 407
    iget v3, v2, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v4

    add-float v1, v3, v4

    .line 411
    :cond_5d
    iget v3, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    cmpg-float v3, v3, p4

    if-gez v3, :cond_66

    .line 412
    iget v1, p2, Landroid/graphics/RectF;->right:F

    .line 416
    :cond_66
    const/4 v3, 0x0

    cmpl-float v3, p5, v3

    if-lez v3, :cond_c7

    .line 417
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    div-float v0, v3, p5

    .line 420
    .local v0, "newHeight":F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v3

    cmpg-float v3, v0, v3

    if-gez v3, :cond_91

    .line 421
    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v5

    mul-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 422
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    div-float v0, v3, p5

    .line 426
    :cond_91
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_b1

    .line 427
    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v5

    mul-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 428
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    div-float v0, v3, p5

    .line 432
    :cond_b1
    if-eqz p6, :cond_cf

    if-eqz p7, :cond_cf

    .line 433
    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/RectF;->left:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v5

    mul-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 448
    .end local v0    # "newHeight":F
    :cond_c7
    :goto_c7
    iput v1, v2, Landroid/graphics/RectF;->right:F

    .line 449
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 450
    return-void

    .line 436
    .restart local v0    # "newHeight":F
    :cond_cf
    if-eqz p6, :cond_ef

    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    iget v4, p2, Landroid/graphics/RectF;->top:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_ef

    .line 437
    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    iget v6, p2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 438
    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float v3, v1, v3

    div-float v0, v3, p5

    .line 442
    :cond_ef
    if-eqz p7, :cond_c7

    iget v3, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v0

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_c7

    .line 443
    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget v5, p2, Landroid/graphics/RectF;->bottom:F

    iget v6, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, p5

    add-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    goto :goto_c7
.end method

.method private adjustRightByAspectRatio(F)V
    .registers 5
    .param p1, "aspectRatio"    # F

    .prologue
    .line 625
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 626
    .local v0, "rect":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 627
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 628
    return-void
.end method

.method private adjustTop(FLandroid/graphics/RectF;FFZZ)V
    .registers 14
    .param p1, "top"    # F
    .param p2, "bounds"    # Landroid/graphics/RectF;
    .param p3, "snapMargin"    # F
    .param p4, "aspectRatio"    # F
    .param p5, "leftMoves"    # Z
    .param p6, "rightMoves"    # Z

    .prologue
    const/4 v6, 0x0

    .line 462
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 464
    .local v2, "rect":Landroid/graphics/RectF;
    move v0, p1

    .line 466
    .local v0, "newTop":F
    cmpg-float v3, v0, v6

    if-gez v3, :cond_1c

    .line 467
    const v3, 0x3f866666    # 1.05f

    div-float/2addr v0, v3

    .line 468
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->y:F

    const v5, 0x3f8ccccd    # 1.1f

    div-float v5, v0, v5

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->y:F

    .line 471
    :cond_1c
    iget v3, p2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    cmpg-float v3, v3, p3

    if-gez v3, :cond_26

    .line 472
    iget v0, p2, Landroid/graphics/RectF;->top:F

    .line 476
    :cond_26
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3d

    .line 477
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v4

    sub-float v0, v3, v4

    .line 481
    :cond_3d
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_54

    .line 482
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v4

    sub-float v0, v3, v4

    .line 485
    :cond_54
    iget v3, p2, Landroid/graphics/RectF;->top:F

    sub-float v3, v0, v3

    cmpg-float v3, v3, p3

    if-gez v3, :cond_5e

    .line 486
    iget v0, p2, Landroid/graphics/RectF;->top:F

    .line 490
    :cond_5e
    cmpl-float v3, p4, v6

    if-lez v3, :cond_bb

    .line 491
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    mul-float v1, v3, p4

    .line 494
    .local v1, "newWidth":F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v3

    cmpg-float v3, v1, v3

    if-gez v3, :cond_86

    .line 495
    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v5

    div-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 496
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    mul-float v1, v3, p4

    .line 500
    :cond_86
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_a5

    .line 501
    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v5

    div-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 502
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    mul-float v1, v3, p4

    .line 506
    :cond_a5
    if-eqz p5, :cond_c3

    if-eqz p6, :cond_c3

    .line 507
    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 522
    .end local v1    # "newWidth":F
    :cond_bb
    :goto_bb
    iput v0, v2, Landroid/graphics/RectF;->top:F

    .line 523
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 524
    return-void

    .line 510
    .restart local v1    # "newWidth":F
    :cond_c3
    if-eqz p5, :cond_e2

    iget v3, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v1

    iget v4, p2, Landroid/graphics/RectF;->left:F

    cmpg-float v3, v3, v4

    if-gez v3, :cond_e2

    .line 511
    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget v5, v2, Landroid/graphics/RectF;->right:F

    iget v6, p2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    div-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 512
    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v0

    mul-float v1, v3, p4

    .line 516
    :cond_e2
    if-eqz p6, :cond_bb

    iget v3, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v1

    iget v4, p2, Landroid/graphics/RectF;->right:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_bb

    .line 517
    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget v5, p2, Landroid/graphics/RectF;->right:F

    iget v6, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v6

    div-float/2addr v5, p4

    sub-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_bb
.end method

.method private adjustTopBottomByAspectRatio(Landroid/graphics/RectF;F)V
    .registers 7
    .param p1, "bounds"    # Landroid/graphics/RectF;
    .param p2, "aspectRatio"    # F

    .prologue
    const/4 v3, 0x0

    .line 661
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 662
    .local v0, "rect":Landroid/graphics/RectF;
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, p2

    sub-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->inset(FF)V

    .line 663
    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget v2, p1, Landroid/graphics/RectF;->top:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_27

    .line 664
    iget v1, p1, Landroid/graphics/RectF;->top:F

    iget v2, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 666
    :cond_27
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_37

    .line 667
    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v2

    invoke-virtual {v0, v3, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 669
    :cond_37
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 670
    return-void
.end method

.method private adjustTopByAspectRatio(F)V
    .registers 5
    .param p1, "aspectRatio"    # F

    .prologue
    .line 615
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 616
    .local v0, "rect":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, p1

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 617
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 618
    return-void
.end method

.method private static calculateAspectRatio(FFFF)F
    .registers 6
    .param p0, "left"    # F
    .param p1, "top"    # F
    .param p2, "right"    # F
    .param p3, "bottom"    # F

    .prologue
    .line 676
    sub-float v0, p2, p0

    sub-float v1, p3, p1

    div-float/2addr v0, v1

    return v0
.end method

.method private calculateTouchOffset(FF)V
    .registers 8
    .param p1, "touchX"    # F
    .param p2, "touchY"    # F

    .prologue
    .line 106
    const/4 v1, 0x0

    .line 107
    .local v1, "touchOffsetX":F
    const/4 v2, 0x0

    .line 109
    .local v2, "touchOffsetY":F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 112
    .local v0, "rect":Landroid/graphics/RectF;
    sget-object v3, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$1;->$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type:[I

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_68

    .line 153
    :goto_15
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iput v1, v3, Landroid/graphics/PointF;->x:F

    .line 154
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iput v2, v3, Landroid/graphics/PointF;->y:F

    .line 155
    return-void

    .line 114
    :pswitch_1e
    iget v3, v0, Landroid/graphics/RectF;->left:F

    sub-float v1, v3, p1

    .line 115
    iget v3, v0, Landroid/graphics/RectF;->top:F

    sub-float v2, v3, p2

    .line 116
    goto :goto_15

    .line 118
    :pswitch_27
    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v1, v3, p1

    .line 119
    iget v3, v0, Landroid/graphics/RectF;->top:F

    sub-float v2, v3, p2

    .line 120
    goto :goto_15

    .line 122
    :pswitch_30
    iget v3, v0, Landroid/graphics/RectF;->left:F

    sub-float v1, v3, p1

    .line 123
    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v2, v3, p2

    .line 124
    goto :goto_15

    .line 126
    :pswitch_39
    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v1, v3, p1

    .line 127
    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v2, v3, p2

    .line 128
    goto :goto_15

    .line 130
    :pswitch_42
    iget v3, v0, Landroid/graphics/RectF;->left:F

    sub-float v1, v3, p1

    .line 131
    const/4 v2, 0x0

    .line 132
    goto :goto_15

    .line 134
    :pswitch_48
    const/4 v1, 0x0

    .line 135
    iget v3, v0, Landroid/graphics/RectF;->top:F

    sub-float v2, v3, p2

    .line 136
    goto :goto_15

    .line 138
    :pswitch_4e
    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v1, v3, p1

    .line 139
    const/4 v2, 0x0

    .line 140
    goto :goto_15

    .line 142
    :pswitch_54
    const/4 v1, 0x0

    .line 143
    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v2, v3, p2

    .line 144
    goto :goto_15

    .line 146
    :pswitch_5a
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    sub-float v1, v3, p1

    .line 147
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float v2, v3, p2

    .line 148
    goto :goto_15

    .line 112
    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_1e
        :pswitch_27
        :pswitch_30
        :pswitch_39
        :pswitch_42
        :pswitch_48
        :pswitch_4e
        :pswitch_54
        :pswitch_5a
    .end packed-switch
.end method

.method private moveCenter(FFLandroid/graphics/RectF;IIF)V
    .registers 16
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "viewWidth"    # I
    .param p5, "viewHeight"    # I
    .param p6, "snapRadius"    # F

    .prologue
    const/high16 v8, 0x40000000    # 2.0f

    const v7, 0x3f866666    # 1.05f

    const/4 v6, 0x0

    .line 161
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 162
    .local v2, "rect":Landroid/graphics/RectF;
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    sub-float v0, p1, v3

    .line 163
    .local v0, "dx":F
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float v1, p2, v3

    .line 164
    .local v1, "dy":F
    iget v3, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v0

    cmpg-float v3, v3, v6

    if-ltz v3, :cond_27

    iget v3, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v0

    int-to-float v4, p4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_31

    .line 165
    :cond_27
    div-float/2addr v0, v7

    .line 166
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->x:F

    div-float v5, v0, v8

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->x:F

    .line 168
    :cond_31
    iget v3, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v1

    cmpg-float v3, v3, v6

    if-ltz v3, :cond_40

    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v1

    int-to-float v4, p5

    cmpl-float v3, v3, v4

    if-lez v3, :cond_4a

    .line 169
    :cond_40
    div-float/2addr v1, v7

    .line 170
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v4, v3, Landroid/graphics/PointF;->y:F

    div-float v5, v1, v8

    sub-float/2addr v4, v5

    iput v4, v3, Landroid/graphics/PointF;->y:F

    .line 172
    :cond_4a
    invoke-virtual {v2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 173
    invoke-direct {p0, v2, p3, p6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->snapEdgesToBounds(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    .line 174
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 175
    return-void
.end method

.method private moveSizeWithFixedAspectRatio(FFLandroid/graphics/RectF;IIFF)V
    .registers 18
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "viewWidth"    # I
    .param p5, "viewHeight"    # I
    .param p6, "snapMargin"    # F
    .param p7, "aspectRatio"    # F

    .prologue
    .line 224
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v9

    .line 225
    .local v9, "rect":Landroid/graphics/RectF;
    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$1;->$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type:[I

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_12a

    .line 281
    :goto_13
    return-void

    .line 227
    :pswitch_14
    iget v1, v9, Landroid/graphics/RectF;->right:F

    iget v2, v9, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, p2, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->calculateAspectRatio(FFFF)F

    move-result v1

    cmpg-float v1, v1, p7

    if-gez v1, :cond_32

    .line 228
    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    .line 229
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeftByAspectRatio(F)V

    goto :goto_13

    .line 231
    :cond_32
    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    .line 232
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTopByAspectRatio(F)V

    goto :goto_13

    .line 236
    :pswitch_44
    iget v1, v9, Landroid/graphics/RectF;->left:F

    iget v2, v9, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, p2, p1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->calculateAspectRatio(FFFF)F

    move-result v1

    cmpg-float v1, v1, p7

    if-gez v1, :cond_62

    .line 237
    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    .line 238
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRightByAspectRatio(F)V

    goto :goto_13

    .line 240
    :cond_62
    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move v4, p4

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    .line 241
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTopByAspectRatio(F)V

    goto :goto_13

    .line 245
    :pswitch_75
    iget v1, v9, Landroid/graphics/RectF;->top:F

    iget v2, v9, Landroid/graphics/RectF;->right:F

    invoke-static {p1, v1, v2, p2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->calculateAspectRatio(FFFF)F

    move-result v1

    cmpg-float v1, v1, p7

    if-gez v1, :cond_94

    .line 246
    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    .line 247
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeftByAspectRatio(F)V

    goto :goto_13

    .line 249
    :cond_94
    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    .line 250
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottomByAspectRatio(F)V

    goto/16 :goto_13

    .line 254
    :pswitch_a7
    iget v1, v9, Landroid/graphics/RectF;->left:F

    iget v2, v9, Landroid/graphics/RectF;->top:F

    invoke-static {v1, v2, p1, p2}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->calculateAspectRatio(FFFF)F

    move-result v1

    cmpg-float v1, v1, p7

    if-gez v1, :cond_c7

    .line 255
    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    .line 256
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRightByAspectRatio(F)V

    goto/16 :goto_13

    .line 258
    :cond_c7
    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move v4, p4

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    .line 259
    move/from16 v0, p7

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottomByAspectRatio(F)V

    goto/16 :goto_13

    .line 263
    :pswitch_db
    const/4 v6, 0x1

    const/4 v7, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    .line 264
    move/from16 v0, p7

    invoke-direct {p0, p3, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTopBottomByAspectRatio(Landroid/graphics/RectF;F)V

    goto/16 :goto_13

    .line 267
    :pswitch_ee
    const/4 v6, 0x1

    const/4 v7, 0x1

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v1 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    .line 268
    move/from16 v0, p7

    invoke-direct {p0, p3, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeftRightByAspectRatio(Landroid/graphics/RectF;F)V

    goto/16 :goto_13

    .line 271
    :pswitch_101
    const/4 v7, 0x1

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p1

    move-object v3, p3

    move v4, p4

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    .line 272
    move/from16 v0, p7

    invoke-direct {p0, p3, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTopBottomByAspectRatio(Landroid/graphics/RectF;F)V

    goto/16 :goto_13

    .line 275
    :pswitch_115
    const/4 v7, 0x1

    const/4 v8, 0x1

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    invoke-direct/range {v1 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    .line 276
    move/from16 v0, p7

    invoke-direct {p0, p3, v0}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeftRightByAspectRatio(Landroid/graphics/RectF;F)V

    goto/16 :goto_13

    .line 225
    nop

    :pswitch_data_12a
    .packed-switch 0x1
        :pswitch_14
        :pswitch_44
        :pswitch_75
        :pswitch_a7
        :pswitch_db
        :pswitch_ee
        :pswitch_101
        :pswitch_115
    .end packed-switch
.end method

.method private moveSizeWithFreeAspectRatio(FFLandroid/graphics/RectF;IIF)V
    .registers 15
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "viewWidth"    # I
    .param p5, "viewHeight"    # I
    .param p6, "snapMargin"    # F

    .prologue
    .line 183
    sget-object v0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$1;->$SwitchMap$com$theartofdev$edmodo$cropper$CropWindowMoveHandler$Type:[I

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_96

    .line 215
    :goto_d
    return-void

    .line 185
    :pswitch_e
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    .line 186
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    goto :goto_d

    .line 189
    :pswitch_23
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    .line 190
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p4

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    goto :goto_d

    .line 193
    :pswitch_39
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    .line 194
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    goto :goto_d

    .line 197
    :pswitch_4f
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    .line 198
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p4

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    goto :goto_d

    .line 201
    :pswitch_66
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustLeft(FLandroid/graphics/RectF;FFZZ)V

    goto :goto_d

    .line 204
    :pswitch_71
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p6

    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustTop(FLandroid/graphics/RectF;FFZZ)V

    goto :goto_d

    .line 207
    :pswitch_7c
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p3

    move v3, p4

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustRight(FLandroid/graphics/RectF;IFFZZ)V

    goto :goto_d

    .line 210
    :pswitch_88
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p2

    move-object v2, p3

    move v3, p5

    move v4, p6

    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->adjustBottom(FLandroid/graphics/RectF;IFFZZ)V

    goto/16 :goto_d

    .line 183
    nop

    :pswitch_data_96
    .packed-switch 0x1
        :pswitch_e
        :pswitch_23
        :pswitch_39
        :pswitch_4f
        :pswitch_66
        :pswitch_71
        :pswitch_7c
        :pswitch_88
    .end packed-switch
.end method

.method private snapEdgesToBounds(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .registers 7
    .param p1, "edges"    # Landroid/graphics/RectF;
    .param p2, "bounds"    # Landroid/graphics/RectF;
    .param p3, "margin"    # F

    .prologue
    const/4 v2, 0x0

    .line 287
    iget v0, p1, Landroid/graphics/RectF;->left:F

    iget v1, p2, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, p3

    cmpg-float v0, v0, v1

    if-gez v0, :cond_12

    .line 288
    iget v0, p2, Landroid/graphics/RectF;->left:F

    iget v1, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 290
    :cond_12
    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v1, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr v1, p3

    cmpg-float v0, v0, v1

    if-gez v0, :cond_23

    .line 291
    iget v0, p2, Landroid/graphics/RectF;->top:F

    iget v1, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v1

    invoke-virtual {p1, v2, v0}, Landroid/graphics/RectF;->offset(FF)V

    .line 293
    :cond_23
    iget v0, p1, Landroid/graphics/RectF;->right:F

    iget v1, p2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, p3

    cmpl-float v0, v0, v1

    if-lez v0, :cond_34

    .line 294
    iget v0, p2, Landroid/graphics/RectF;->right:F

    iget v1, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/RectF;->offset(FF)V

    .line 296
    :cond_34
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget v1, p2, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, p3

    cmpl-float v0, v0, v1

    if-lez v0, :cond_45

    .line 297
    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    iget v1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    invoke-virtual {p1, v2, v0}, Landroid/graphics/RectF;->offset(FF)V

    .line 299
    :cond_45
    return-void
.end method


# virtual methods
.method public move(FFLandroid/graphics/RectF;IIFZF)V
    .registers 17
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "bounds"    # Landroid/graphics/RectF;
    .param p4, "viewWidth"    # I
    .param p5, "viewHeight"    # I
    .param p6, "snapMargin"    # F
    .param p7, "fixedAspectRatio"    # Z
    .param p8, "aspectRatio"    # F

    .prologue
    .line 84
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    add-float v1, p1, v0

    .line 85
    .local v1, "adjX":F
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mTouchOffset:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    add-float v2, p2, v0

    .line 87
    .local v2, "adjY":F
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->mType:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    sget-object v3, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;->CENTER:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler$Type;

    if-ne v0, v3, :cond_1b

    move-object v0, p0

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 88
    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->moveCenter(FFLandroid/graphics/RectF;IIF)V

    .line 96
    :goto_1a
    return-void

    .line 90
    :cond_1b
    if-eqz p7, :cond_28

    move-object v0, p0

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p8

    .line 91
    invoke-direct/range {v0 .. v7}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->moveSizeWithFixedAspectRatio(FFLandroid/graphics/RectF;IIFF)V

    goto :goto_1a

    :cond_28
    move-object v0, p0

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 93
    invoke-direct/range {v0 .. v6}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->moveSizeWithFreeAspectRatio(FFLandroid/graphics/RectF;IIF)V

    goto :goto_1a
.end method
