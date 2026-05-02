.class public Lcom/theartofdev/edmodo/cropper/CropOverlayView;
.super Landroid/view/View;
.source "CropOverlayView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;
    }
.end annotation


# instance fields
.field private initializedCropWindow:Z

.field private mAspectRatioX:I

.field private mAspectRatioY:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private final mBitmapRect:Landroid/graphics/RectF;

.field private mBorderCornerLength:F

.field private mBorderCornerOffset:F

.field private mBorderCornerPaint:Landroid/graphics/Paint;

.field private mBorderPaint:Landroid/graphics/Paint;

.field private mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

.field private mCropWindowChangeListener:Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;

.field private final mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

.field private final mDrawRect:Landroid/graphics/RectF;

.field private mFixAspectRatio:Z

.field private mGuidelinePaint:Landroid/graphics/Paint;

.field private mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

.field private mInitialCropWindowPaddingRatio:F

.field private final mInitialCropWindowRect:Landroid/graphics/Rect;

.field private mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

.field private mOriginalLayerType:Ljava/lang/Integer;

.field private mSnapRadius:F

.field private mTargetAspectRatio:F

.field private mTouchRadius:F

.field private mViewHeight:I

.field private mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 164
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 165
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 168
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    new-instance v0, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-direct {v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    .line 48
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mDrawRect:Landroid/graphics/RectF;

    .line 73
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    .line 135
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    .line 150
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    .line 169
    return-void
.end method

.method private callOnCropWindowChanged(Z)V
    .registers 5
    .param p1, "inProgress"    # Z

    .prologue
    .line 814
    :try_start_0
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowChangeListener:Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;

    if-eqz v1, :cond_9

    .line 815
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowChangeListener:Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;

    invoke-interface {v1, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;->onCropWindowChanged(Z)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_a

    .line 820
    :cond_9
    :goto_9
    return-void

    .line 817
    :catch_a
    move-exception v0

    .line 818
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "AIC"

    const-string v2, "Exception in crop window changed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9
.end method

.method private drawBackground(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "bitmapRect"    # Landroid/graphics/RectF;

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 604
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v7

    .line 606
    .local v7, "rect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v0, v1, :cond_47

    .line 607
    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, p2, Landroid/graphics/RectF;->top:F

    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v7, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 608
    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, v7, Landroid/graphics/RectF;->bottom:F

    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 609
    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, v7, Landroid/graphics/RectF;->top:F

    iget v3, v7, Landroid/graphics/RectF;->left:F

    iget v4, v7, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 610
    iget v1, v7, Landroid/graphics/RectF;->right:F

    iget v2, v7, Landroid/graphics/RectF;->top:F

    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, v7, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 624
    :goto_46
    return-void

    .line 612
    :cond_47
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 613
    .local v6, "circleSelectionPath":Landroid/graphics/Path;
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_90

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-gt v0, v1, :cond_90

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v0, v1, :cond_90

    .line 614
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mDrawRect:Landroid/graphics/RectF;

    iget v1, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v1, v5

    iget v2, v7, Landroid/graphics/RectF;->top:F

    add-float/2addr v2, v5

    iget v3, v7, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v5

    iget v4, v7, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 618
    :goto_6f
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mDrawRect:Landroid/graphics/RectF;

    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 619
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 620
    sget-object v0, Landroid/graphics/Region$Op;->XOR:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 621
    iget v1, p2, Landroid/graphics/RectF;->left:F

    iget v2, p2, Landroid/graphics/RectF;->top:F

    iget v3, p2, Landroid/graphics/RectF;->right:F

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 622
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_46

    .line 616
    :cond_90
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mDrawRect:Landroid/graphics/RectF;

    iget v1, v7, Landroid/graphics/RectF;->left:F

    iget v2, v7, Landroid/graphics/RectF;->top:F

    iget v3, v7, Landroid/graphics/RectF;->right:F

    iget v4, v7, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_6f
.end method

.method private drawBorders(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 677
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_24

    .line 678
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    .line 679
    .local v1, "w":F
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 680
    .local v0, "rect":Landroid/graphics/RectF;
    div-float v2, v1, v3

    div-float v3, v1, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->inset(FF)V

    .line 682
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v3, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v2, v3, :cond_25

    .line 684
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 690
    .end local v0    # "rect":Landroid/graphics/RectF;
    .end local v1    # "w":F
    :cond_24
    :goto_24
    return-void

    .line 687
    .restart local v0    # "rect":Landroid/graphics/RectF;
    .restart local v1    # "w":F
    :cond_25
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_24
.end method

.method private drawCorners(Landroid/graphics/Canvas;)V
    .registers 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 696
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_e9

    .line 698
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_ea

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v9

    .line 699
    .local v9, "lineWidth":F
    :goto_10
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v8

    .line 700
    .local v8, "cornerWidth":F
    div-float v0, v8, v2

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerOffset:F

    add-float v11, v0, v1

    .line 701
    .local v11, "w":F
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v10

    .line 702
    .local v10, "rect":Landroid/graphics/RectF;
    invoke-virtual {v10, v11, v11}, Landroid/graphics/RectF;->inset(FF)V

    .line 704
    sub-float v0, v8, v9

    div-float v7, v0, v2

    .line 705
    .local v7, "cornerOffset":F
    div-float v0, v8, v2

    add-float v6, v0, v7

    .line 708
    .local v6, "cornerExtension":F
    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v3, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->top:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 709
    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    add-float/2addr v3, v0

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v4, v0, v7

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 712
    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v1, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v3, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->top:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    add-float/2addr v4, v0

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 713
    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v1, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v2, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->right:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    sub-float v3, v0, v3

    iget v0, v10, Landroid/graphics/RectF;->top:F

    sub-float v4, v0, v7

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 716
    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v2, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v3, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    sub-float v4, v0, v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 717
    iget v0, v10, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v2, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    add-float/2addr v3, v0

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v4, v0, v7

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 720
    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v1, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v2, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v3, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    sub-float v4, v0, v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 721
    iget v0, v10, Landroid/graphics/RectF;->right:F

    add-float v1, v0, v6

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v2, v0, v7

    iget v0, v10, Landroid/graphics/RectF;->right:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    sub-float v3, v0, v3

    iget v0, v10, Landroid/graphics/RectF;->bottom:F

    add-float v4, v0, v7

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 723
    .end local v6    # "cornerExtension":F
    .end local v7    # "cornerOffset":F
    .end local v8    # "cornerWidth":F
    .end local v9    # "lineWidth":F
    .end local v10    # "rect":Landroid/graphics/RectF;
    .end local v11    # "w":F
    :cond_e9
    return-void

    .line 698
    :cond_ea
    const/4 v9, 0x0

    goto/16 :goto_10
.end method

.method private drawGuidelines(Landroid/graphics/Canvas;)V
    .registers 26
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 630
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    if-eqz v3, :cond_f6

    .line 631
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    if-eqz v3, :cond_f7

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v18

    .line 632
    .local v18, "sw":F
    :goto_14
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v17

    .line 633
    .local v17, "rect":Landroid/graphics/RectF;
    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    .line 635
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v5, 0x40400000    # 3.0f

    div-float v16, v3, v5

    .line 636
    .local v16, "oneThirdCropWidth":F
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v5, 0x40400000    # 3.0f

    div-float v15, v3, v5

    .line 638
    .local v15, "oneThirdCropHeight":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v5, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v3, v5, :cond_fb

    .line 640
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->width()F

    move-result v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    sub-float v19, v3, v18

    .line 641
    .local v19, "w":F
    invoke-virtual/range {v17 .. v17}, Landroid/graphics/RectF;->height()F

    move-result v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    sub-float v14, v3, v18

    .line 644
    .local v14, "h":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->left:F

    add-float v4, v3, v16

    .line 645
    .local v4, "x1":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v20, v3, v16

    .line 646
    .local v20, "x2":F
    float-to-double v5, v14

    sub-float v3, v19, v16

    div-float v3, v3, v19

    float-to-double v8, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->acos(D)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    mul-double/2addr v5, v8

    double-to-float v0, v5

    move/from16 v23, v0

    .line 647
    .local v23, "yv":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v14

    sub-float v5, v3, v23

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v14

    add-float v7, v3, v23

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    move v6, v4

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 648
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v14

    sub-float v7, v3, v23

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v14

    add-float v9, v3, v23

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    move/from16 v6, v20

    move/from16 v8, v20

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 651
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->top:F

    add-float v7, v3, v15

    .line 652
    .local v7, "y1":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v22, v3, v15

    .line 653
    .local v22, "y2":F
    move/from16 v0, v19

    float-to-double v5, v0

    sub-float v3, v14, v15

    div-float/2addr v3, v14

    float-to-double v8, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->asin(D)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v8

    mul-double/2addr v5, v8

    double-to-float v0, v5

    move/from16 v21, v0

    .line 654
    .local v21, "xv":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->left:F

    add-float v3, v3, v19

    sub-float v6, v3, v21

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v3, v3, v19

    add-float v8, v3, v21

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    move v9, v7

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 655
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->left:F

    add-float v3, v3, v19

    sub-float v9, v3, v21

    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v3, v3, v19

    add-float v11, v3, v21

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move/from16 v10, v22

    move/from16 v12, v22

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 671
    .end local v4    # "x1":F
    .end local v7    # "y1":F
    .end local v14    # "h":F
    .end local v15    # "oneThirdCropHeight":F
    .end local v16    # "oneThirdCropWidth":F
    .end local v17    # "rect":Landroid/graphics/RectF;
    .end local v18    # "sw":F
    .end local v19    # "w":F
    .end local v20    # "x2":F
    .end local v21    # "xv":F
    .end local v22    # "y2":F
    .end local v23    # "yv":F
    :cond_f6
    :goto_f6
    return-void

    .line 631
    :cond_f7
    const/16 v18, 0x0

    goto/16 :goto_14

    .line 659
    .restart local v15    # "oneThirdCropHeight":F
    .restart local v16    # "oneThirdCropWidth":F
    .restart local v17    # "rect":Landroid/graphics/RectF;
    .restart local v18    # "sw":F
    :cond_fb
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->left:F

    add-float v4, v3, v16

    .line 660
    .restart local v4    # "x1":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->right:F

    sub-float v20, v3, v16

    .line 661
    .restart local v20    # "x2":F
    move-object/from16 v0, v17

    iget v10, v0, Landroid/graphics/RectF;->top:F

    move-object/from16 v0, v17

    iget v12, v0, Landroid/graphics/RectF;->bottom:F

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move v9, v4

    move v11, v4

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 662
    move-object/from16 v0, v17

    iget v10, v0, Landroid/graphics/RectF;->top:F

    move-object/from16 v0, v17

    iget v12, v0, Landroid/graphics/RectF;->bottom:F

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move/from16 v9, v20

    move/from16 v11, v20

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 665
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->top:F

    add-float v7, v3, v15

    .line 666
    .restart local v7    # "y1":F
    move-object/from16 v0, v17

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    sub-float v22, v3, v15

    .line 667
    .restart local v22    # "y2":F
    move-object/from16 v0, v17

    iget v6, v0, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, v17

    iget v8, v0, Landroid/graphics/RectF;->right:F

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    move v9, v7

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 668
    move-object/from16 v0, v17

    iget v9, v0, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, v17

    iget v11, v0, Landroid/graphics/RectF;->right:F

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move/from16 v10, v22

    move/from16 v12, v22

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_f6
.end method

.method private fixCropWindowRectByRules(Landroid/graphics/RectF;)V
    .registers 12
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    const/4 v7, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    .line 520
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_28

    .line 521
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v6

    sub-float/2addr v5, v6

    div-float v0, v5, v9

    .line 522
    .local v0, "adj":F
    iget v5, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->left:F

    .line 523
    iget v5, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->right:F

    .line 525
    .end local v0    # "adj":F
    :cond_28
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_4d

    .line 526
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v5, v6

    div-float v0, v5, v9

    .line 527
    .restart local v0    # "adj":F
    iget v5, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->top:F

    .line 528
    iget v5, p1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->bottom:F

    .line 530
    .end local v0    # "adj":F
    :cond_4d
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_72

    .line 531
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropWidth()F

    move-result v6

    sub-float/2addr v5, v6

    div-float v0, v5, v9

    .line 532
    .restart local v0    # "adj":F
    iget v5, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->left:F

    .line 533
    iget v5, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->right:F

    .line 535
    .end local v0    # "adj":F
    :cond_72
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_97

    .line 536
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMaxCropHeight()F

    move-result v6

    sub-float/2addr v5, v6

    div-float v0, v5, v9

    .line 537
    .restart local v0    # "adj":F
    iget v5, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->top:F

    .line 538
    iget v5, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->bottom:F

    .line 540
    .end local v0    # "adj":F
    :cond_97
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v5, :cond_f9

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    cmpl-float v5, v5, v7

    if-lez v5, :cond_f9

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    cmpl-float v5, v5, v7

    if-lez v5, :cond_f9

    .line 541
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 542
    .local v2, "leftLimit":F
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 543
    .local v4, "topLimit":F
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 544
    .local v3, "rightLimit":F
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 545
    .local v1, "bottomLimit":F
    iget v5, p1, Landroid/graphics/RectF;->left:F

    cmpg-float v5, v5, v2

    if-gez v5, :cond_e1

    .line 546
    iput v2, p1, Landroid/graphics/RectF;->left:F

    .line 548
    :cond_e1
    iget v5, p1, Landroid/graphics/RectF;->top:F

    cmpg-float v5, v5, v4

    if-gez v5, :cond_e9

    .line 549
    iput v4, p1, Landroid/graphics/RectF;->top:F

    .line 551
    :cond_e9
    iget v5, p1, Landroid/graphics/RectF;->right:F

    cmpl-float v5, v5, v3

    if-lez v5, :cond_f1

    .line 552
    iput v3, p1, Landroid/graphics/RectF;->right:F

    .line 554
    :cond_f1
    iget v5, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v5, v5, v1

    if-lez v5, :cond_f9

    .line 555
    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    .line 558
    .end local v1    # "bottomLimit":F
    .end local v2    # "leftLimit":F
    .end local v3    # "rightLimit":F
    .end local v4    # "topLimit":F
    :cond_f9
    iget-boolean v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    if-eqz v5, :cond_142

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget v7, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    mul-float/2addr v6, v7

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    float-to-double v5, v5

    const-wide v7, 0x3fb999999999999aL    # 0.1

    cmpl-double v5, v5, v7

    if-lez v5, :cond_142

    .line 559
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget v7, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    mul-float/2addr v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_143

    .line 560
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    mul-float/2addr v5, v6

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    div-float v0, v5, v9

    .line 561
    .restart local v0    # "adj":F
    iget v5, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->left:F

    .line 562
    iget v5, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->right:F

    .line 569
    .end local v0    # "adj":F
    :cond_142
    :goto_142
    return-void

    .line 564
    :cond_143
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    div-float/2addr v5, v6

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    div-float v0, v5, v9

    .line 565
    .restart local v0    # "adj":F
    iget v5, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->top:F

    .line 566
    iget v5, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, v0

    iput v5, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_142
.end method

.method private static getNewPaint(I)Landroid/graphics/Paint;
    .registers 2
    .param p0, "color"    # I

    .prologue
    .line 729
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 730
    .local v0, "paint":Landroid/graphics/Paint;
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 731
    return-object v0
.end method

.method private static getNewPaintOrNull(FI)Landroid/graphics/Paint;
    .registers 4
    .param p0, "thickness"    # F
    .param p1, "color"    # I

    .prologue
    .line 738
    const/4 v1, 0x0

    cmpl-float v1, p0, v1

    if-lez v1, :cond_1a

    .line 739
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 740
    .local v0, "borderPaint":Landroid/graphics/Paint;
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 741
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 742
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 743
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 746
    .end local v0    # "borderPaint":Landroid/graphics/Paint;
    :goto_19
    return-object v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method private initCropWindow()V
    .registers 19

    .prologue
    .line 438
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v15, :cond_22

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    move-result v15

    const/16 v16, 0x0

    cmpl-float v15, v15, v16

    if-eqz v15, :cond_22

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v15}, Landroid/graphics/RectF;->height()F

    move-result v15

    const/16 v16, 0x0

    cmpl-float v15, v15, v16

    if-nez v15, :cond_23

    .line 514
    :cond_22
    :goto_22
    return-void

    .line 442
    :cond_23
    new-instance v11, Landroid/graphics/RectF;

    invoke-direct {v11}, Landroid/graphics/RectF;-><init>()V

    .line 445
    .local v11, "rect":Landroid/graphics/RectF;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    .line 447
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v15, v15, Landroid/graphics/RectF;->left:F

    const/16 v16, 0x0

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->max(FF)F

    move-result v10

    .line 448
    .local v10, "leftLimit":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v15, v15, Landroid/graphics/RectF;->top:F

    const/16 v16, 0x0

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 449
    .local v13, "topLimit":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v15, v15, Landroid/graphics/RectF;->right:F

    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getWidth()I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->min(FF)F

    move-result v12

    .line 450
    .local v12, "rightLimit":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v15, v15, Landroid/graphics/RectF;->bottom:F

    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getHeight()I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 451
    .local v2, "bottomLimit":F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowPaddingRatio:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->width()F

    move-result v16

    mul-float v9, v15, v16

    .line 452
    .local v9, "horizontalPadding":F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowPaddingRatio:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->height()F

    move-result v16

    mul-float v14, v15, v16

    .line 454
    .local v14, "verticalPadding":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->width()I

    move-result v15

    if-lez v15, :cond_13b

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Rect;->height()I

    move-result v15

    if-lez v15, :cond_13b

    .line 456
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->left:I

    int-to-float v15, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getScaleFactorWidth()F

    move-result v16

    div-float v15, v15, v16

    add-float/2addr v15, v10

    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 457
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->top:I

    int-to-float v15, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getScaleFactorHeight()F

    move-result v16

    div-float v15, v15, v16

    add-float/2addr v15, v13

    iput v15, v11, Landroid/graphics/RectF;->top:F

    .line 458
    iget v15, v11, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->width()I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getScaleFactorWidth()F

    move-result v17

    div-float v16, v16, v17

    add-float v15, v15, v16

    iput v15, v11, Landroid/graphics/RectF;->right:F

    .line 459
    iget v15, v11, Landroid/graphics/RectF;->top:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->height()I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getScaleFactorHeight()F

    move-result v17

    div-float v16, v16, v17

    add-float v15, v15, v16

    iput v15, v11, Landroid/graphics/RectF;->bottom:F

    .line 462
    iget v15, v11, Landroid/graphics/RectF;->left:F

    invoke-static {v10, v15}, Ljava/lang/Math;->max(FF)F

    move-result v15

    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 463
    iget v15, v11, Landroid/graphics/RectF;->top:F

    invoke-static {v13, v15}, Ljava/lang/Math;->max(FF)F

    move-result v15

    iput v15, v11, Landroid/graphics/RectF;->top:F

    .line 464
    iget v15, v11, Landroid/graphics/RectF;->right:F

    invoke-static {v12, v15}, Ljava/lang/Math;->min(FF)F

    move-result v15

    iput v15, v11, Landroid/graphics/RectF;->right:F

    .line 465
    iget v15, v11, Landroid/graphics/RectF;->bottom:F

    invoke-static {v2, v15}, Ljava/lang/Math;->min(FF)F

    move-result v15

    iput v15, v11, Landroid/graphics/RectF;->bottom:F

    .line 511
    :goto_12d
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->fixCropWindowRectByRules(Landroid/graphics/RectF;)V

    .line 513
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v15, v11}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    goto/16 :goto_22

    .line 467
    :cond_13b
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    if-eqz v15, :cond_1eb

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v15}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_1eb

    .line 471
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v15}, Landroid/graphics/RectF;->width()F

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/RectF;->height()F

    move-result v16

    div-float v1, v15, v16

    .line 472
    .local v1, "bitmapAspectRatio":F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    cmpl-float v15, v1, v15

    if-lez v15, :cond_1b4

    .line 474
    add-float v15, v13, v14

    iput v15, v11, Landroid/graphics/RectF;->top:F

    .line 475
    sub-float v15, v2, v14

    iput v15, v11, Landroid/graphics/RectF;->bottom:F

    .line 477
    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getWidth()I

    move-result v15

    int-to-float v15, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v3, v15, v16

    .line 480
    .local v3, "centerX":F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    int-to-float v15, v15

    move-object/from16 v0, p0

    iget v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    div-float v15, v15, v16

    move-object/from16 v0, p0

    iput v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    .line 483
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v15}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropWidth()F

    move-result v15

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    move/from16 v17, v0

    mul-float v16, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->max(FF)F

    move-result v6

    .line 485
    .local v6, "cropWidth":F
    const/high16 v15, 0x40000000    # 2.0f

    div-float v8, v6, v15

    .line 486
    .local v8, "halfCropWidth":F
    sub-float v15, v3, v8

    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 487
    add-float v15, v3, v8

    iput v15, v11, Landroid/graphics/RectF;->right:F

    goto/16 :goto_12d

    .line 491
    .end local v3    # "centerX":F
    .end local v6    # "cropWidth":F
    .end local v8    # "halfCropWidth":F
    :cond_1b4
    add-float v15, v10, v9

    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 492
    sub-float v15, v12, v9

    iput v15, v11, Landroid/graphics/RectF;->right:F

    .line 494
    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getHeight()I

    move-result v15

    int-to-float v15, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v4, v15, v16

    .line 497
    .local v4, "centerY":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v15}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMinCropHeight()F

    move-result v15

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    move/from16 v17, v0

    div-float v16, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .line 499
    .local v5, "cropHeight":F
    const/high16 v15, 0x40000000    # 2.0f

    div-float v7, v5, v15

    .line 500
    .local v7, "halfCropHeight":F
    sub-float v15, v4, v7

    iput v15, v11, Landroid/graphics/RectF;->top:F

    .line 501
    add-float v15, v4, v7

    iput v15, v11, Landroid/graphics/RectF;->bottom:F

    goto/16 :goto_12d

    .line 505
    .end local v1    # "bitmapAspectRatio":F
    .end local v4    # "centerY":F
    .end local v5    # "cropHeight":F
    .end local v7    # "halfCropHeight":F
    :cond_1eb
    add-float v15, v10, v9

    iput v15, v11, Landroid/graphics/RectF;->left:F

    .line 506
    add-float v15, v13, v14

    iput v15, v11, Landroid/graphics/RectF;->top:F

    .line 507
    sub-float v15, v12, v9

    iput v15, v11, Landroid/graphics/RectF;->right:F

    .line 508
    sub-float v15, v2, v14

    iput v15, v11, Landroid/graphics/RectF;->bottom:F

    goto/16 :goto_12d
.end method

.method private onActionDown(FF)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 780
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTouchRadius:F

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getMoveHandler(FFFLcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    .line 781
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    if-eqz v0, :cond_13

    .line 782
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 784
    :cond_13
    return-void
.end method

.method private onActionMove(FF)V
    .registers 12
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 802
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    if-eqz v0, :cond_1e

    .line 803
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mViewWidth:I

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mViewHeight:I

    iget v6, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mSnapRadius:F

    iget-boolean v7, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    iget v8, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    move v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v8}, Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;->move(FFLandroid/graphics/RectF;IIFZF)V

    .line 804
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->callOnCropWindowChanged(Z)V

    .line 805
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 807
    :cond_1e
    return-void
.end method

.method private onActionUp()V
    .registers 2

    .prologue
    .line 790
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    if-eqz v0, :cond_e

    .line 791
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    .line 792
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->callOnCropWindowChanged(Z)V

    .line 793
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 795
    :cond_e
    return-void
.end method


# virtual methods
.method public getAspectRatioX()I
    .registers 2

    .prologue
    .line 299
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    return v0
.end method

.method public getAspectRatioY()I
    .registers 2

    .prologue
    .line 323
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    return v0
.end method

.method public getCropShape()Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    return-object v0
.end method

.method public getCropWindowRect()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getGuidelines()Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    return-object v0
.end method

.method public getInitialCropWindowRect()Landroid/graphics/Rect;
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public isFixAspectRatio()Z
    .registers 2

    .prologue
    .line 279
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 577
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 580
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    .line 582
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->showGuidelines()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 584
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->ON:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    if-ne v0, v1, :cond_26

    .line 585
    invoke-direct {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->drawGuidelines(Landroid/graphics/Canvas;)V

    .line 592
    :cond_19
    :goto_19
    invoke-direct {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->drawBorders(Landroid/graphics/Canvas;)V

    .line 594
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->RECTANGLE:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v0, v1, :cond_25

    .line 595
    invoke-direct {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->drawCorners(Landroid/graphics/Canvas;)V

    .line 597
    :cond_25
    return-void

    .line 586
    :cond_26
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->ON_TOUCH:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    if-ne v0, v1, :cond_19

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mMoveHandler:Lcom/theartofdev/edmodo/cropper/CropWindowMoveHandler;

    if-eqz v0, :cond_19

    .line 588
    invoke-direct {p0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->drawGuidelines(Landroid/graphics/Canvas;)V

    goto :goto_19
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 753
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 754
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    packed-switch v2, :pswitch_data_3e

    move v0, v1

    .line 771
    :goto_10
    return v0

    .line 756
    :pswitch_11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->onActionDown(FF)V

    goto :goto_10

    .line 760
    :pswitch_1d
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 761
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->onActionUp()V

    goto :goto_10

    .line 764
    :pswitch_28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->onActionMove(FF)V

    .line 765
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_10

    :cond_3b
    move v0, v1

    .line 771
    goto :goto_10

    .line 754
    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_11
        :pswitch_1d
        :pswitch_28
        :pswitch_1d
    .end packed-switch
.end method

.method public resetCropOverlayView()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 216
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_15

    .line 217
    sget-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT_F:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setBitmapRect(Landroid/graphics/RectF;II)V

    .line 218
    sget-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT_F:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 219
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 220
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 222
    :cond_15
    return-void
.end method

.method public resetCropWindowRect()V
    .registers 2

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_e

    .line 387
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 388
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 389
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->callOnCropWindowChanged(Z)V

    .line 391
    :cond_e
    return-void
.end method

.method public setAspectRatioX(I)V
    .registers 4
    .param p1, "aspectRatioX"    # I

    .prologue
    .line 306
    if-gtz p1, :cond_a

    .line 307
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 308
    :cond_a
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    if-eq v0, p1, :cond_23

    .line 309
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    .line 310
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    .line 312
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_23

    .line 313
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 314
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 317
    :cond_23
    return-void
.end method

.method public setAspectRatioY(I)V
    .registers 4
    .param p1, "aspectRatioY"    # I

    .prologue
    .line 333
    if-gtz p1, :cond_a

    .line 334
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 335
    :cond_a
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    if-eq v0, p1, :cond_23

    .line 336
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    .line 337
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTargetAspectRatio:F

    .line 339
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_23

    .line 340
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 341
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 344
    :cond_23
    return-void
.end method

.method public setBitmapRect(Landroid/graphics/RectF;II)V
    .registers 7
    .param p1, "bitmapRect"    # Landroid/graphics/RectF;
    .param p2, "viewWidth"    # I
    .param p3, "viewHeight"    # I

    .prologue
    const/4 v2, 0x0

    .line 201
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v1}, Landroid/graphics/RectF;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 202
    :cond_d
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v1, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 203
    iput p2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mViewWidth:I

    .line 204
    iput p3, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mViewHeight:I

    .line 205
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->getRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 206
    .local v0, "cropRect":Landroid/graphics/RectF;
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_2f

    .line 207
    :cond_2c
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 210
    .end local v0    # "cropRect":Landroid/graphics/RectF;
    :cond_2f
    return-void
.end method

.method public setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)V
    .registers 6
    .param p1, "cropShape"    # Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 235
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-eq v0, p1, :cond_32

    .line 236
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 237
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_2f

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-gt v0, v1, :cond_2f

    .line 238
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->OVAL:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    if-ne v0, v1, :cond_36

    .line 239
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getLayerType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    .line 240
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v0, v3, :cond_33

    .line 242
    invoke-virtual {p0, v3, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 252
    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 254
    :cond_32
    return-void

    .line 244
    :cond_33
    iput-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    goto :goto_2f

    .line 246
    :cond_36
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    if-eqz v0, :cond_2f

    .line 248
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 249
    iput-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mOriginalLayerType:Ljava/lang/Integer;

    goto :goto_2f
.end method

.method public setCropWindowChangeListener(Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowChangeListener:Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;

    .line 176
    return-void
.end method

.method public setCropWindowLimits(FFFF)V
    .registers 6
    .param p1, "maxWidth"    # F
    .param p2, "maxHeight"    # F
    .param p3, "scaleFactorWidth"    # F
    .param p4, "scaleFactorHeight"    # F

    .prologue
    .line 360
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setCropWindowLimits(FFFF)V

    .line 361
    return-void
.end method

.method public setCropWindowRect(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setRect(Landroid/graphics/RectF;)V

    .line 190
    return-void
.end method

.method public setFixedAspectRatio(Z)V
    .registers 3
    .param p1, "fixAspectRatio"    # Z

    .prologue
    .line 286
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    if-eq v0, p1, :cond_10

    .line 287
    iput-boolean p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mFixAspectRatio:Z

    .line 288
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_10

    .line 289
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 290
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 293
    :cond_10
    return-void
.end method

.method public setGuidelines(Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;)V
    .registers 3
    .param p1, "guidelines"    # Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .prologue
    .line 267
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    if-eq v0, p1, :cond_d

    .line 268
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .line 269
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_d

    .line 270
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 273
    :cond_d
    return-void
.end method

.method public setInitialAttributeValues(Lcom/theartofdev/edmodo/cropper/CropImageOptions;)V
    .registers 4
    .param p1, "options"    # Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .prologue
    .line 399
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mCropWindowHandler:Lcom/theartofdev/edmodo/cropper/CropWindowHandler;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropWindowHandler;->setInitialAttributeValues(Lcom/theartofdev/edmodo/cropper/CropImageOptions;)V

    .line 401
    iget-object v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)V

    .line 403
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setSnapRadius(F)V

    .line 405
    iget-object v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setGuidelines(Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;)V

    .line 407
    iget-boolean v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setFixedAspectRatio(Z)V

    .line 409
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setAspectRatioX(I)V

    .line 411
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setAspectRatioY(I)V

    .line 413
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mTouchRadius:F

    .line 415
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowPaddingRatio:F

    .line 417
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    iget v1, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    invoke-static {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getNewPaintOrNull(FI)Landroid/graphics/Paint;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderPaint:Landroid/graphics/Paint;

    .line 419
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerOffset:F

    .line 420
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerLength:F

    .line 421
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    iget v1, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    invoke-static {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getNewPaintOrNull(FI)Landroid/graphics/Paint;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBorderCornerPaint:Landroid/graphics/Paint;

    .line 423
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    iget v1, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    invoke-static {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getNewPaintOrNull(FI)Landroid/graphics/Paint;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mGuidelinePaint:Landroid/graphics/Paint;

    .line 425
    iget v0, p1, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    invoke-static {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getNewPaint(I)Landroid/graphics/Paint;

    move-result-object v0

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 426
    return-void
.end method

.method public setInitialCropWindowRect(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mInitialCropWindowRect:Landroid/graphics/Rect;

    if-eqz p1, :cond_16

    .end local p1    # "rect":Landroid/graphics/Rect;
    :goto_4
    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 375
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initializedCropWindow:Z

    if-eqz v0, :cond_15

    .line 376
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->initCropWindow()V

    .line 377
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 378
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->callOnCropWindowChanged(Z)V

    .line 380
    :cond_15
    return-void

    .line 374
    .restart local p1    # "rect":Landroid/graphics/Rect;
    :cond_16
    sget-object p1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT:Landroid/graphics/Rect;

    goto :goto_4
.end method

.method public setSnapRadius(F)V
    .registers 2
    .param p1, "snapRadius"    # F

    .prologue
    .line 352
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->mSnapRadius:F

    .line 353
    return-void
.end method
