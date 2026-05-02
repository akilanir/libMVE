.class public Lcom/yalantis/ucrop/view/OverlayView;
.super Landroid/view/View;
.source "OverlayView.java"


# static fields
.field public static final DEFAULT_CROP_GRID_COLUMN_COUNT:I = 0x2

.field public static final DEFAULT_CROP_GRID_ROW_COUNT:I = 0x2

.field public static final DEFAULT_FREESTYLE_CROP_ENABLED:Z = false

.field public static final DEFAULT_OVAL_DIMMED_LAYER:Z = false

.field public static final DEFAULT_SHOW_CROP_FRAME:Z = true

.field public static final DEFAULT_SHOW_CROP_GRID:Z = true


# instance fields
.field private mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

.field private mCircularPath:Landroid/graphics/Path;

.field private mCropFrameCornersPaint:Landroid/graphics/Paint;

.field private mCropFramePaint:Landroid/graphics/Paint;

.field private mCropGridColumnCount:I

.field protected mCropGridCorners:[F

.field private mCropGridPaint:Landroid/graphics/Paint;

.field private mCropGridRowCount:I

.field private mCropRectCornerTouchAreaLineLength:I

.field private mCropRectMinSize:I

.field private final mCropViewRect:Landroid/graphics/RectF;

.field private mCurrentTouchCornerIndex:I

.field private mDimmedColor:I

.field private mDimmedStrokePaint:Landroid/graphics/Paint;

.field private mGridPoints:[F

.field private mIsFreestyleCropEnabled:Z

.field private mOvalDimmedLayer:Z

.field private mShowCropFrame:Z

.field private mShowCropGrid:Z

.field private mTargetAspectRatio:F

.field private final mTempRect:Landroid/graphics/RectF;

.field protected mThisHeight:I

.field protected mThisWidth:I

.field private mTouchPointThreshold:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/OverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/OverlayView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x1

    .line 78
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    .line 38
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    .line 46
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCircularPath:Landroid/graphics/Path;

    .line 47
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedStrokePaint:Landroid/graphics/Paint;

    .line 48
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFrameCornersPaint:Landroid/graphics/Paint;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mIsFreestyleCropEnabled:Z

    .line 56
    const/4 v0, -0x1

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    .line 64
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_rect_corner_touch_threshold:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTouchPointThreshold:I

    .line 65
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_rect_min_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectMinSize:I

    .line 66
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_rect_corner_touch_area_line_length:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectCornerTouchAreaLineLength:I

    .line 79
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->init()V

    .line 80
    return-void
.end method

.method private getCurrentTouchCorner(FF)I
    .registers 15
    .param p1, "touchX"    # F
    .param p2, "touchY"    # F

    .prologue
    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    .line 343
    const/4 v2, -0x1

    .line 344
    .local v2, "closestPointIndex":I
    iget v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTouchPointThreshold:I

    int-to-double v0, v6

    .line 345
    .local v0, "closestPointDistance":D
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_7
    const/16 v6, 0x8

    if-ge v5, v6, :cond_32

    .line 346
    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridCorners:[F

    aget v6, v6, v5

    sub-float v6, p1, v6

    float-to-double v6, v6

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    iget-object v8, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridCorners:[F

    add-int/lit8 v9, v5, 0x1

    aget v8, v8, v9

    sub-float v8, p2, v8

    float-to-double v8, v8

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    add-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    .line 348
    .local v3, "distanceToCorner":D
    cmpg-double v6, v3, v0

    if-gez v6, :cond_2f

    .line 349
    move-wide v0, v3

    .line 350
    div-int/lit8 v2, v5, 0x2

    .line 345
    :cond_2f
    add-int/lit8 v5, v5, 0x2

    goto :goto_7

    .line 353
    .end local v3    # "distanceToCorner":D
    :cond_32
    return v2
.end method

.method private initCropFrameStyle(Landroid/content/res/TypedArray;)V
    .registers 7
    .param p1, "a"    # Landroid/content/res/TypedArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 455
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_frame_stroke_size:I

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_frame_stoke_width:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 457
    .local v1, "cropFrameStrokeSize":I
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_frame_color:I

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_crop_frame:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 459
    .local v0, "cropFrameColor":I
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 460
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 461
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 463
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFrameCornersPaint:Landroid/graphics/Paint;

    mul-int/lit8 v3, v1, 0x3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 464
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFrameCornersPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 465
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFrameCornersPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 466
    return-void
.end method

.method private initCropGridStyle(Landroid/content/res/TypedArray;)V
    .registers 8
    .param p1, "a"    # Landroid/content/res/TypedArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x2

    .line 473
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_grid_stroke_size:I

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/yalantis/ucrop/R$dimen;->ucrop_default_crop_grid_stoke_width:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 475
    .local v1, "cropGridStrokeSize":I
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_grid_color:I

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_crop_grid:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    .line 477
    .local v0, "cropGridColor":I
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 478
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 480
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_grid_row_count:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    .line 481
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_grid_column_count:I

    invoke-virtual {p1, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    .line 482
    return-void
.end method

.method private resizeCropViewRect(FF)V
    .registers 10
    .param p1, "touchX"    # F
    .param p2, "touchY"    # F

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 301
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 303
    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    packed-switch v4, :pswitch_data_a8

    .line 318
    :goto_e
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectMinSize:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_8d

    move v0, v2

    .line 319
    .local v0, "changeHeight":Z
    :goto_1c
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectMinSize:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_8f

    move v1, v2

    .line 320
    .local v1, "changeWidth":Z
    :goto_2a
    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_91

    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    move v5, v2

    :goto_33
    if-eqz v0, :cond_97

    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    move v4, v2

    :goto_3a
    if-eqz v1, :cond_9d

    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    move v3, v2

    :goto_41
    if-eqz v0, :cond_a3

    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    :goto_47
    invoke-virtual {v6, v5, v4, v3, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 326
    if-nez v0, :cond_4e

    if-eqz v1, :cond_54

    .line 327
    :cond_4e
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/OverlayView;->updateGridPoints()V

    .line 328
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->postInvalidate()V

    .line 330
    :cond_54
    return-void

    .line 305
    .end local v0    # "changeHeight":Z
    .end local v1    # "changeWidth":Z
    :pswitch_55
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v4, p1, p2, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_e

    .line 308
    :pswitch_63
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v4, v5, p2, p1, v6}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_e

    .line 311
    :pswitch_71
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    invoke-virtual {v4, v5, v6, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_e

    .line 314
    :pswitch_7f
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    iget-object v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    invoke-virtual {v4, p1, v5, v6, p2}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_e

    :cond_8d
    move v0, v3

    .line 318
    goto :goto_1c

    .restart local v0    # "changeHeight":Z
    :cond_8f
    move v1, v3

    .line 319
    goto :goto_2a

    .line 320
    .restart local v1    # "changeWidth":Z
    :cond_91
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    move v5, v2

    goto :goto_33

    :cond_97
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    move v4, v2

    goto :goto_3a

    :cond_9d
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    move v3, v2

    goto :goto_41

    :cond_a3
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    goto :goto_47

    .line 303
    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_55
        :pswitch_63
        :pswitch_71
        :pswitch_7f
    .end packed-switch
.end method

.method private updateGridPoints()V
    .registers 4

    .prologue
    .line 221
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-static {v0}, Lcom/yalantis/ucrop/util/RectUtils;->getCornersFromRect(Landroid/graphics/RectF;)[F

    move-result-object v0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridCorners:[F

    .line 223
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    .line 224
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCircularPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 225
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCircularPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 226
    return-void
.end method


# virtual methods
.method protected drawCropGrid(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    .line 383
    iget-boolean v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropGrid:Z

    if-eqz v3, :cond_cb

    .line 384
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    if-nez v3, :cond_c0

    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c0

    .line 386
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    mul-int/lit8 v3, v3, 0x4

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    mul-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    new-array v3, v3, [F

    iput-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    .line 388
    const/4 v1, 0x0

    .line 389
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    if-ge v0, v3, :cond_70

    .line 390
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .local v2, "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    aput v4, v3, v1

    .line 391
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    int-to-float v5, v0

    add-float/2addr v5, v7

    iget v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    add-int/lit8 v6, v6, 0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v5

    aput v4, v3, v2

    .line 392
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    aput v4, v3, v1

    .line 393
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    int-to-float v5, v0

    add-float/2addr v5, v7

    iget v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    add-int/lit8 v6, v6, 0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v5

    aput v4, v3, v2

    .line 389
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 396
    :cond_70
    const/4 v0, 0x0

    :goto_71
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    if-ge v0, v3, :cond_c0

    .line 397
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    int-to-float v5, v0

    add-float/2addr v5, v7

    iget v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    add-int/lit8 v6, v6, 0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v5

    aput v4, v3, v1

    .line 398
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    aput v4, v3, v2

    .line 399
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "index":I
    .restart local v2    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    int-to-float v5, v0

    add-float/2addr v5, v7

    iget v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    add-int/lit8 v6, v6, 0x1

    int-to-float v6, v6

    div-float/2addr v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v5

    aput v4, v3, v1

    .line 400
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    add-int/lit8 v1, v2, 0x1

    .end local v2    # "index":I
    .restart local v1    # "index":I
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    aput v4, v3, v2

    .line 396
    add-int/lit8 v0, v0, 0x1

    goto :goto_71

    .line 404
    .end local v0    # "i":I
    .end local v1    # "index":I
    :cond_c0
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    if-eqz v3, :cond_cb

    .line 405
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawLines([FLandroid/graphics/Paint;)V

    .line 409
    :cond_cb
    iget-boolean v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropFrame:Z

    if-eqz v3, :cond_d6

    .line 410
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 413
    :cond_d6
    iget-boolean v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mIsFreestyleCropEnabled:Z

    if-eqz v3, :cond_11b

    .line 414
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 416
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 417
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectCornerTouchAreaLineLength:I

    int-to-float v4, v4

    iget v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectCornerTouchAreaLineLength:I

    neg-int v5, v5

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 418
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z

    .line 420
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 421
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectCornerTouchAreaLineLength:I

    neg-int v4, v4

    int-to-float v4, v4

    iget v5, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropRectCornerTouchAreaLineLength:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 422
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTempRect:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z

    .line 424
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFrameCornersPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 426
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 428
    :cond_11b
    return-void
.end method

.method protected drawDimmedLayer(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 362
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 363
    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mOvalDimmedLayer:Z

    if-eqz v0, :cond_22

    .line 364
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCircularPath:Landroid/graphics/Path;

    sget-object v1, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 368
    :goto_e
    iget v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 369
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 371
    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mOvalDimmedLayer:Z

    if-eqz v0, :cond_21

    .line 372
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 374
    :cond_21
    return-void

    .line 366
    :cond_22
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    sget-object v1, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;Landroid/graphics/Region$Op;)Z

    goto :goto_e
.end method

.method public getCropViewRect()Landroid/graphics/RectF;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getOverlayViewChangeListener()Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    return-object v0
.end method

.method protected init()V
    .registers 3

    .prologue
    .line 229
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_11

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_11

    .line 231
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/yalantis/ucrop/view/OverlayView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 233
    :cond_11
    return-void
.end method

.method public isFreestyleCropEnabled()Z
    .registers 2

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mIsFreestyleCropEnabled:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 253
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 254
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/view/OverlayView;->drawDimmedLayer(Landroid/graphics/Canvas;)V

    .line 255
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/view/OverlayView;->drawCropGrid(Landroid/graphics/Canvas;)V

    .line 256
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 237
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 238
    if-eqz p1, :cond_29

    .line 239
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result p2

    .line 240
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result p3

    .line 241
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingRight()I

    move-result v1

    sub-int p4, v0, v1

    .line 242
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingBottom()I

    move-result v1

    sub-int p5, v0, v1

    .line 243
    sub-int v0, p4, p2

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisWidth:I

    .line 244
    sub-int v0, p5, p3

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisHeight:I

    .line 246
    :cond_29
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v6, -0x1

    const/4 v2, 0x1

    .line 260
    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_f

    iget-boolean v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mIsFreestyleCropEnabled:Z

    if-nez v4, :cond_11

    :cond_f
    move v2, v3

    .line 289
    :cond_10
    :goto_10
    return v2

    .line 262
    :cond_11
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 263
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 265
    .local v1, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    if-nez v4, :cond_2d

    .line 266
    invoke-direct {p0, v0, v1}, Lcom/yalantis/ucrop/view/OverlayView;->getCurrentTouchCorner(FF)I

    move-result v4

    iput v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    .line 267
    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    if-ne v4, v6, :cond_10

    move v2, v3

    goto :goto_10

    .line 270
    :cond_2d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    const/4 v5, 0x2

    if-ne v4, v5, :cond_72

    .line 271
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    if-ne v4, v2, :cond_72

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    if-eq v4, v6, :cond_72

    .line 273
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 274
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 276
    invoke-direct {p0, v0, v1}, Lcom/yalantis/ucrop/view/OverlayView;->resizeCropViewRect(FF)V

    goto :goto_10

    .line 282
    :cond_72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v4, v4, 0xff

    if-ne v4, v2, :cond_87

    .line 283
    iput v6, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCurrentTouchCornerIndex:I

    .line 284
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    if-eqz v2, :cond_87

    .line 285
    iget-object v2, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-interface {v2, v4}, Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;->onCropRectUpdated(Landroid/graphics/RectF;)V

    :cond_87
    move v2, v3

    .line 289
    goto :goto_10
.end method

.method protected processStyledAttributes(Landroid/content/res/TypedArray;)V
    .registers 6
    .param p1, "a"    # Landroid/content/res/TypedArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    .line 436
    sget v0, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_oval_dimmed_layer:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mOvalDimmedLayer:Z

    .line 437
    sget v0, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_dimmed_color:I

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/yalantis/ucrop/R$color;->ucrop_color_default_dimmed:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedColor:I

    .line 439
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedStrokePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 440
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedStrokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 441
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedStrokePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 443
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/view/OverlayView;->initCropFrameStyle(Landroid/content/res/TypedArray;)V

    .line 444
    sget v0, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_show_frame:I

    invoke-virtual {p1, v0, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropFrame:Z

    .line 446
    invoke-direct {p0, p1}, Lcom/yalantis/ucrop/view/OverlayView;->initCropGridStyle(Landroid/content/res/TypedArray;)V

    .line 447
    sget v0, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_show_grid:I

    invoke-virtual {p1, v0, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropGrid:Z

    .line 448
    return-void
.end method

.method public setCropFrameColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 175
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 176
    return-void
.end method

.method public setCropFrameStrokeWidth(I)V
    .registers 4
    .param p1, "width"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 161
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropFramePaint:Landroid/graphics/Paint;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 162
    return-void
.end method

.method public setCropGridColor(I)V
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 182
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 183
    return-void
.end method

.method public setCropGridColumnCount(I)V
    .registers 3
    .param p1, "cropGridColumnCount"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 126
    iput p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridColumnCount:I

    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    .line 128
    return-void
.end method

.method public setCropGridRowCount(I)V
    .registers 3
    .param p1, "cropGridRowCount"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 117
    iput p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridRowCount:I

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mGridPoints:[F

    .line 119
    return-void
.end method

.method public setCropGridStrokeWidth(I)V
    .registers 4
    .param p1, "width"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
        .end annotation
    .end param

    .prologue
    .line 168
    iget-object v0, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropGridPaint:Landroid/graphics/Paint;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 169
    return-void
.end method

.method public setDimmedColor(I)V
    .registers 2
    .param p1, "dimmedColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 154
    iput p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mDimmedColor:I

    .line 155
    return-void
.end method

.method public setFreestyleCropEnabled(Z)V
    .registers 2
    .param p1, "freestyleCropEnabled"    # Z

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mIsFreestyleCropEnabled:Z

    .line 101
    return-void
.end method

.method public setOvalDimmedLayer(Z)V
    .registers 2
    .param p1, "ovalDimmedLayer"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mOvalDimmedLayer:Z

    .line 110
    return-void
.end method

.method public setOverlayViewChangeListener(Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;)V
    .registers 2
    .param p1, "callback"    # Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    .line 88
    return-void
.end method

.method public setShowCropFrame(Z)V
    .registers 2
    .param p1, "showCropFrame"    # Z

    .prologue
    .line 136
    iput-boolean p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropFrame:Z

    .line 137
    return-void
.end method

.method public setShowCropGrid(Z)V
    .registers 2
    .param p1, "showCropGrid"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mShowCropGrid:Z

    .line 146
    return-void
.end method

.method public setTargetAspectRatio(F)V
    .registers 2
    .param p1, "targetAspectRatio"    # F

    .prologue
    .line 191
    iput p1, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTargetAspectRatio:F

    .line 192
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->setupCropBounds()V

    .line 193
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->postInvalidate()V

    .line 194
    return-void
.end method

.method public setupCropBounds()V
    .registers 10

    .prologue
    .line 201
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisWidth:I

    int-to-float v3, v3

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTargetAspectRatio:F

    div-float/2addr v3, v4

    float-to-int v1, v3

    .line 202
    .local v1, "height":I
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisHeight:I

    if-le v1, v3, :cond_45

    .line 203
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisHeight:I

    int-to-float v3, v3

    iget v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mTargetAspectRatio:F

    mul-float/2addr v3, v4

    float-to-int v2, v3

    .line 204
    .local v2, "width":I
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisWidth:I

    sub-int/2addr v3, v2

    div-int/lit8 v0, v3, 0x2

    .line 205
    .local v0, "halfDiff":I
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result v4

    add-int/2addr v4, v0

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result v6

    add-int/2addr v6, v2

    add-int/2addr v6, v0

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result v7

    iget v8, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisHeight:I

    add-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 213
    .end local v2    # "width":I
    :goto_36
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    if-eqz v3, :cond_41

    .line 214
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCallback:Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-interface {v3, v4}, Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;->onCropRectUpdated(Landroid/graphics/RectF;)V

    .line 217
    :cond_41
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/OverlayView;->updateGridPoints()V

    .line 218
    return-void

    .line 208
    .end local v0    # "halfDiff":I
    :cond_45
    iget v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisHeight:I

    sub-int/2addr v3, v1

    div-int/lit8 v0, v3, 0x2

    .line 209
    .restart local v0    # "halfDiff":I
    iget-object v3, p0, Lcom/yalantis/ucrop/view/OverlayView;->mCropViewRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result v5

    add-int/2addr v5, v0

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingLeft()I

    move-result v6

    iget v7, p0, Lcom/yalantis/ucrop/view/OverlayView;->mThisWidth:I

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/OverlayView;->getPaddingTop()I

    move-result v7

    add-int/2addr v7, v1

    add-int/2addr v7, v0

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_36
.end method
