.class public Lcom/github/mikephil/charting/utils/ViewPortHandler;
.super Ljava/lang/Object;
.source "ViewPortHandler.java"


# instance fields
.field protected mChartHeight:F

.field protected mChartWidth:F

.field protected mContentRect:Landroid/graphics/RectF;

.field protected final mMatrixTouch:Landroid/graphics/Matrix;

.field private mMaxScaleX:F

.field private mMaxScaleY:F

.field private mMinScaleX:F

.field private mMinScaleY:F

.field private mScaleX:F

.field private mScaleY:F

.field private mTransOffsetX:F

.field private mTransOffsetY:F

.field private mTransX:F

.field private mTransY:F

.field protected final matrixBuffer:[F


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    const v3, 0x7f7fffff    # Float.MAX_VALUE

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    .line 25
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    .line 28
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    .line 33
    iput v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    .line 38
    iput v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleY:F

    .line 43
    iput v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    .line 48
    iput v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    .line 53
    iput v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    .line 58
    iput v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    .line 63
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransX:F

    .line 68
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransY:F

    .line 73
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetX:F

    .line 78
    iput v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetY:F

    .line 357
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    .line 85
    return-void
.end method


# virtual methods
.method public canZoomInMoreX()Z
    .registers 3

    .prologue
    .line 688
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public canZoomInMoreY()Z
    .registers 3

    .prologue
    .line 706
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleY:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public canZoomOutMoreX()Z
    .registers 3

    .prologue
    .line 679
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public canZoomOutMoreY()Z
    .registers 3

    .prologue
    .line 697
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public centerViewPort([FLandroid/view/View;)V
    .registers 9
    .param p1, "transformedPts"    # [F
    .param p2, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 343
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 344
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 346
    const/4 v3, 0x0

    aget v3, p1, v3

    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v4

    sub-float v1, v3, v4

    .line 347
    .local v1, "x":F
    aget v3, p1, v5

    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v4

    sub-float v2, v3, v4

    .line 349
    .local v2, "y":F
    neg-float v3, v1

    neg-float v4, v2

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 351
    invoke-virtual {p0, v0, p2, v5}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;

    .line 352
    return-void
.end method

.method public contentBottom()F
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    return v0
.end method

.method public contentHeight()F
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    return v0
.end method

.method public contentLeft()F
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    return v0
.end method

.method public contentRight()F
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    return v0
.end method

.method public contentTop()F
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    return v0
.end method

.method public contentWidth()F
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    return v0
.end method

.method public fitScreen()Landroid/graphics/Matrix;
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 291
    iput v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    .line 292
    iput v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    .line 294
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 295
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 297
    const/16 v2, 0x9

    new-array v1, v2, [F

    .line 299
    .local v1, "vals":[F
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 302
    const/4 v2, 0x2

    aput v4, v1, v2

    .line 303
    const/4 v2, 0x5

    aput v4, v1, v2

    .line 304
    const/4 v2, 0x0

    aput v3, v1, v2

    .line 305
    const/4 v2, 0x4

    aput v3, v1, v2

    .line 307
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setValues([F)V

    .line 309
    return-object v0
.end method

.method public getChartHeight()F
    .registers 2

    .prologue
    .line 170
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    return v0
.end method

.method public getChartWidth()F
    .registers 2

    .prologue
    .line 174
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    return v0
.end method

.method public getContentCenter()Landroid/graphics/PointF;
    .registers 4

    .prologue
    .line 166
    new-instance v0, Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v0
.end method

.method public getContentRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getMatrixTouch()Landroid/graphics/Matrix;
    .registers 2

    .prologue
    .line 509
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getMaxScaleX()F
    .registers 2

    .prologue
    .line 577
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    return v0
.end method

.method public getMaxScaleY()F
    .registers 2

    .prologue
    .line 585
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleY:F

    return v0
.end method

.method public getMinScaleX()F
    .registers 2

    .prologue
    .line 573
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    return v0
.end method

.method public getMinScaleY()F
    .registers 2

    .prologue
    .line 581
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    return v0
.end method

.method public getScaleX()F
    .registers 2

    .prologue
    .line 562
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    return v0
.end method

.method public getScaleY()F
    .registers 2

    .prologue
    .line 569
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    return v0
.end method

.method public getTransX()F
    .registers 2

    .prologue
    .line 594
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransX:F

    return v0
.end method

.method public getTransY()F
    .registers 2

    .prologue
    .line 603
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransY:F

    return v0
.end method

.method public hasChartDimens()Z
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 109
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_f

    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_f

    .line 110
    const/4 v0, 0x1

    .line 112
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public hasNoDragOffset()Z
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 670
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetX:F

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_f

    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetY:F

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isFullyZoomedOut()Z
    .registers 2

    .prologue
    .line 613
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isFullyZoomedOutX()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isFullyZoomedOutY()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 614
    const/4 v0, 0x1

    .line 616
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isFullyZoomedOutX()Z
    .registers 3

    .prologue
    .line 638
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_10

    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_12

    .line 639
    :cond_10
    const/4 v0, 0x0

    .line 641
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x1

    goto :goto_11
.end method

.method public isFullyZoomedOutY()Z
    .registers 3

    .prologue
    .line 625
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_10

    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_12

    .line 626
    :cond_10
    const/4 v0, 0x0

    .line 628
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x1

    goto :goto_11
.end method

.method public isInBounds(FF)Z
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 534
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsX(F)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsY(F)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 535
    const/4 v0, 0x1

    .line 537
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isInBoundsBottom(F)Z
    .registers 4
    .param p1, "y"    # F

    .prologue
    const/high16 v1, 0x42c80000    # 100.0f

    .line 554
    mul-float v0, p1, v1

    float-to-int v0, v0

    int-to-float v0, v0

    div-float p1, v0, v1

    .line 555
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, p1

    if-ltz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isInBoundsLeft(F)Z
    .registers 3
    .param p1, "x"    # F

    .prologue
    .line 541
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInBoundsRight(F)Z
    .registers 4
    .param p1, "x"    # F

    .prologue
    const/high16 v1, 0x42c80000    # 100.0f

    .line 545
    mul-float v0, p1, v1

    float-to-int v0, v0

    int-to-float v0, v0

    div-float p1, v0, v1

    .line 546
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, v0, p1

    if-ltz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isInBoundsTop(F)Z
    .registers 3
    .param p1, "y"    # F

    .prologue
    .line 550
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInBoundsX(F)Z
    .registers 3
    .param p1, "x"    # F

    .prologue
    .line 520
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsLeft(F)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsRight(F)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 521
    const/4 v0, 0x1

    .line 523
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isInBoundsY(F)Z
    .registers 3
    .param p1, "y"    # F

    .prologue
    .line 527
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsTop(F)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->isInBoundsBottom(F)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 528
    const/4 v0, 0x1

    .line 530
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V
    .registers 14
    .param p1, "matrix"    # Landroid/graphics/Matrix;
    .param p2, "content"    # Landroid/graphics/RectF;

    .prologue
    .line 386
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    invoke-virtual {p1, v8}, Landroid/graphics/Matrix;->getValues([F)V

    .line 388
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x2

    aget v2, v8, v9

    .line 389
    .local v2, "curTransX":F
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x0

    aget v0, v8, v9

    .line 391
    .local v0, "curScaleX":F
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x5

    aget v3, v8, v9

    .line 392
    .local v3, "curTransY":F
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x4

    aget v1, v8, v9

    .line 395
    .local v1, "curScaleY":F
    iget v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    invoke-static {v8, v0}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget v9, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    .line 398
    iget v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    invoke-static {v8, v1}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget v9, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleY:F

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    .line 400
    const/4 v7, 0x0

    .line 401
    .local v7, "width":F
    const/4 v4, 0x0

    .line 403
    .local v4, "height":F
    if-eqz p2, :cond_41

    .line 404
    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v7

    .line 405
    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v4

    .line 408
    :cond_41
    neg-float v8, v7

    iget v9, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    const/high16 v10, 0x3f800000    # 1.0f

    sub-float/2addr v9, v10

    mul-float v5, v8, v9

    .line 409
    .local v5, "maxTransX":F
    iget v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetX:F

    sub-float v8, v5, v8

    invoke-static {v2, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iget v9, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetX:F

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransX:F

    .line 411
    iget v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    const/high16 v9, 0x3f800000    # 1.0f

    sub-float/2addr v8, v9

    mul-float v6, v4, v8

    .line 412
    .local v6, "maxTransY":F
    iget v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetY:F

    add-float/2addr v8, v6

    invoke-static {v3, v8}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iget v9, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetY:F

    neg-float v9, v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransY:F

    .line 414
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x2

    iget v10, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransX:F

    aput v10, v8, v9

    .line 415
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x0

    iget v10, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleX:F

    aput v10, v8, v9

    .line 417
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x5

    iget v10, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransY:F

    aput v10, v8, v9

    .line 418
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    const/4 v9, 0x4

    iget v10, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mScaleY:F

    aput v10, v8, v9

    .line 420
    iget-object v8, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->matrixBuffer:[F

    invoke-virtual {p1, v8}, Landroid/graphics/Matrix;->setValues([F)V

    .line 421
    return-void
.end method

.method public offsetBottom()F
    .registers 3

    .prologue
    .line 134
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public offsetLeft()F
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    return v0
.end method

.method public offsetRight()F
    .registers 3

    .prologue
    .line 126
    iget v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public offsetTop()F
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    return v0
.end method

.method public refresh(Landroid/graphics/Matrix;Landroid/view/View;Z)Landroid/graphics/Matrix;
    .registers 6
    .param p1, "newMatrix"    # Landroid/graphics/Matrix;
    .param p2, "chart"    # Landroid/view/View;
    .param p3, "invalidate"    # Z

    .prologue
    .line 367
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 370
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 372
    if-eqz p3, :cond_11

    .line 373
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    .line 375
    :cond_11
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 376
    return-object p1
.end method

.method public restrainViewPort(FFFF)V
    .registers 8
    .param p1, "offsetLeft"    # F
    .param p2, "offsetTop"    # F
    .param p3, "offsetRight"    # F
    .param p4, "offsetBottom"    # F

    .prologue
    .line 117
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    sub-float/2addr v1, p3

    iget v2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    sub-float/2addr v2, p4

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 119
    return-void
.end method

.method public setChartDimens(FF)V
    .registers 7
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v1

    .line 97
    .local v1, "offsetLeft":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v3

    .line 98
    .local v3, "offsetTop":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetRight()F

    move-result v2

    .line 99
    .local v2, "offsetRight":F
    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetBottom()F

    move-result v0

    .line 101
    .local v0, "offsetBottom":F
    iput p2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartHeight:F

    .line 102
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mChartWidth:F

    .line 104
    invoke-virtual {p0, v1, v3, v2, v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->restrainViewPort(FFFF)V

    .line 106
    return-void
.end method

.method public setDragOffsetX(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 651
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetX:F

    .line 652
    return-void
.end method

.method public setDragOffsetY(F)V
    .registers 3
    .param p1, "offset"    # F

    .prologue
    .line 661
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mTransOffsetY:F

    .line 662
    return-void
.end method

.method public setMaximumScaleX(F)V
    .registers 4
    .param p1, "xScale"    # F

    .prologue
    .line 445
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_8

    .line 446
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 448
    :cond_8
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    .line 450
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 451
    return-void
.end method

.method public setMaximumScaleY(F)V
    .registers 4
    .param p1, "yScale"    # F

    .prologue
    .line 495
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_8

    .line 496
    const p1, 0x7f7fffff    # Float.MAX_VALUE

    .line 498
    :cond_8
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleY:F

    .line 500
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 501
    return-void
.end method

.method public setMinMaxScaleX(FF)V
    .registers 5
    .param p1, "minScaleX"    # F
    .param p2, "maxScaleX"    # F

    .prologue
    .line 461
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 462
    const/high16 p1, 0x3f800000    # 1.0f

    .line 464
    :cond_8
    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_10

    .line 465
    const p2, 0x7f7fffff    # Float.MAX_VALUE

    .line 467
    :cond_10
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    .line 468
    iput p2, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMaxScaleX:F

    .line 470
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 471
    return-void
.end method

.method public setMinimumScaleX(F)V
    .registers 4
    .param p1, "xScale"    # F

    .prologue
    .line 430
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 431
    const/high16 p1, 0x3f800000    # 1.0f

    .line 433
    :cond_8
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleX:F

    .line 435
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 436
    return-void
.end method

.method public setMinimumScaleY(F)V
    .registers 4
    .param p1, "yScale"    # F

    .prologue
    .line 480
    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_8

    .line 481
    const/high16 p1, 0x3f800000    # 1.0f

    .line 483
    :cond_8
    iput p1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMinScaleY:F

    .line 485
    iget-object v0, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mContentRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->limitTransAndScale(Landroid/graphics/Matrix;Landroid/graphics/RectF;)V

    .line 486
    return-void
.end method

.method public setZoom(FF)Landroid/graphics/Matrix;
    .registers 5
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F

    .prologue
    .line 258
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 259
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 261
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 263
    return-object v0
.end method

.method public setZoom(FFFF)Landroid/graphics/Matrix;
    .registers 7
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 277
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 278
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 280
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 282
    return-object v0
.end method

.method public translate([F)Landroid/graphics/Matrix;
    .registers 7
    .param p1, "transformedPts"    # [F

    .prologue
    .line 320
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 321
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 323
    const/4 v3, 0x0

    aget v3, p1, v3

    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetLeft()F

    move-result v4

    sub-float v1, v3, v4

    .line 324
    .local v1, "x":F
    const/4 v3, 0x1

    aget v3, p1, v3

    invoke-virtual {p0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->offsetTop()F

    move-result v4

    sub-float v2, v3, v4

    .line 326
    .local v2, "y":F
    neg-float v3, v1

    neg-float v4, v2

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 328
    return-object v0
.end method

.method public zoom(FF)Landroid/graphics/Matrix;
    .registers 5
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F

    .prologue
    .line 222
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 223
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 225
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 227
    return-object v0
.end method

.method public zoom(FFFF)Landroid/graphics/Matrix;
    .registers 7
    .param p1, "scaleX"    # F
    .param p2, "scaleY"    # F
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    .line 241
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 242
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 244
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 246
    return-object v0
.end method

.method public zoomIn(FF)Landroid/graphics/Matrix;
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const v2, 0x3fb33333    # 1.4f

    .line 191
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 192
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 194
    invoke-virtual {v0, v2, v2, p1, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 196
    return-object v0
.end method

.method public zoomOut(FF)Landroid/graphics/Matrix;
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const v2, 0x3f333333    # 0.7f

    .line 205
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 206
    .local v0, "save":Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/github/mikephil/charting/utils/ViewPortHandler;->mMatrixTouch:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 208
    invoke-virtual {v0, v2, v2, p1, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 210
    return-object v0
.end method
