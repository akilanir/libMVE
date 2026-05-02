.class public Lcom/yalantis/ucrop/view/CropImageView;
.super Lcom/yalantis/ucrop/view/TransformImageView;
.source "CropImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;,
        Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;
    }
.end annotation


# static fields
.field public static final DEFAULT_ASPECT_RATIO:F = 0.0f

.field public static final DEFAULT_IMAGE_TO_CROP_BOUNDS_ANIM_DURATION:I = 0x1f4

.field public static final DEFAULT_MAX_BITMAP_SIZE:I = 0x0

.field public static final DEFAULT_MAX_SCALE_MULTIPLIER:F = 10.0f

.field public static final SOURCE_IMAGE_ASPECT_RATIO:F


# instance fields
.field private mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

.field private final mCropRect:Landroid/graphics/RectF;

.field private mImageToWrapCropBoundsAnimDuration:J

.field private mMaxResultImageSizeX:I

.field private mMaxResultImageSizeY:I

.field private mMaxScale:F

.field private mMaxScaleMultiplier:F

.field private mMinScale:F

.field private mTargetAspectRatio:F

.field private final mTempMatrix:Landroid/graphics/Matrix;

.field private mWrapCropBoundsRunnable:Ljava/lang/Runnable;

.field private mZoomImageToPositionRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/CropImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/CropImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/yalantis/ucrop/view/TransformImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    .line 41
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    .line 44
    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxScaleMultiplier:F

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mZoomImageToPositionRunnable:Ljava/lang/Runnable;

    .line 51
    iput v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeX:I

    iput v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeY:I

    .line 52
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mImageToWrapCropBoundsAnimDuration:J

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/yalantis/ucrop/view/CropImageView;)Landroid/graphics/RectF;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/view/CropImageView;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method private calculateImageIndents()[F
    .registers 13

    .prologue
    const/4 v9, 0x0

    .line 329
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10}, Landroid/graphics/Matrix;->reset()V

    .line 330
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v11

    neg-float v11, v11

    invoke-virtual {v10, v11}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 332
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    iget-object v11, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    array-length v11, v11

    invoke-static {v10, v11}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v7

    .line 333
    .local v7, "unrotatedImageCorners":[F
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-static {v10}, Lcom/yalantis/ucrop/util/RectUtils;->getCornersFromRect(Landroid/graphics/RectF;)[F

    move-result-object v5

    .line 335
    .local v5, "unrotatedCropBoundsCorners":[F
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v7}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 336
    iget-object v10, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v10, v5}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 338
    invoke-static {v7}, Lcom/yalantis/ucrop/util/RectUtils;->trapToRect([F)Landroid/graphics/RectF;

    move-result-object v8

    .line 339
    .local v8, "unrotatedImageRect":Landroid/graphics/RectF;
    invoke-static {v5}, Lcom/yalantis/ucrop/util/RectUtils;->trapToRect([F)Landroid/graphics/RectF;

    move-result-object v6

    .line 341
    .local v6, "unrotatedCropRect":Landroid/graphics/RectF;
    iget v10, v8, Landroid/graphics/RectF;->left:F

    iget v11, v6, Landroid/graphics/RectF;->left:F

    sub-float v1, v10, v11

    .line 342
    .local v1, "deltaLeft":F
    iget v10, v8, Landroid/graphics/RectF;->top:F

    iget v11, v6, Landroid/graphics/RectF;->top:F

    sub-float v3, v10, v11

    .line 343
    .local v3, "deltaTop":F
    iget v10, v8, Landroid/graphics/RectF;->right:F

    iget v11, v6, Landroid/graphics/RectF;->right:F

    sub-float v2, v10, v11

    .line 344
    .local v2, "deltaRight":F
    iget v10, v8, Landroid/graphics/RectF;->bottom:F

    iget v11, v6, Landroid/graphics/RectF;->bottom:F

    sub-float v0, v10, v11

    .line 346
    .local v0, "deltaBottom":F
    const/4 v10, 0x4

    new-array v4, v10, [F

    .line 347
    .local v4, "indents":[F
    const/4 v10, 0x0

    cmpl-float v11, v1, v9

    if-lez v11, :cond_7c

    .end local v1    # "deltaLeft":F
    :goto_51
    aput v1, v4, v10

    .line 348
    const/4 v10, 0x1

    cmpl-float v11, v3, v9

    if-lez v11, :cond_7e

    .end local v3    # "deltaTop":F
    :goto_58
    aput v3, v4, v10

    .line 349
    const/4 v10, 0x2

    cmpg-float v11, v2, v9

    if-gez v11, :cond_80

    .end local v2    # "deltaRight":F
    :goto_5f
    aput v2, v4, v10

    .line 350
    const/4 v10, 0x3

    cmpg-float v11, v0, v9

    if-gez v11, :cond_82

    .end local v0    # "deltaBottom":F
    :goto_66
    aput v0, v4, v10

    .line 352
    iget-object v9, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v9}, Landroid/graphics/Matrix;->reset()V

    .line 353
    iget-object v9, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v10

    invoke-virtual {v9, v10}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 354
    iget-object v9, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v9, v4}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 356
    return-object v4

    .restart local v0    # "deltaBottom":F
    .restart local v1    # "deltaLeft":F
    .restart local v2    # "deltaRight":F
    .restart local v3    # "deltaTop":F
    :cond_7c
    move v1, v9

    .line 347
    goto :goto_51

    .end local v1    # "deltaLeft":F
    :cond_7e
    move v3, v9

    .line 348
    goto :goto_58

    .end local v3    # "deltaTop":F
    :cond_80
    move v2, v9

    .line 349
    goto :goto_5f

    .end local v2    # "deltaRight":F
    :cond_82
    move v0, v9

    .line 350
    goto :goto_66
.end method

.method private calculateImageScaleBounds()V
    .registers 4

    .prologue
    .line 447
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 448
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_7

    .line 452
    :goto_6
    return-void

    .line 451
    :cond_7
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {p0, v1, v2}, Lcom/yalantis/ucrop/view/CropImageView;->calculateImageScaleBounds(FF)V

    goto :goto_6
.end method

.method private calculateImageScaleBounds(FF)V
    .registers 7
    .param p1, "drawableWidth"    # F
    .param p2, "drawableHeight"    # F

    .prologue
    .line 461
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float v1, v2, p1

    .line 462
    .local v1, "widthScale":F
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float v0, v2, p2

    .line 464
    .local v0, "heightScale":F
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    .line 465
    iget v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    iget v3, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxScaleMultiplier:F

    mul-float/2addr v2, v3

    iput v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxScale:F

    .line 466
    return-void
.end method

.method private setupInitialImagePosition(FF)V
    .registers 10
    .param p1, "drawableWidth"    # F
    .param p2, "drawableHeight"    # F

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 476
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v1

    .line 477
    .local v1, "cropRectWidth":F
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v0

    .line 479
    .local v0, "cropRectHeight":F
    iget v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    mul-float/2addr v4, p1

    sub-float v4, v1, v4

    div-float/2addr v4, v6

    iget-object v5, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    add-float v3, v4, v5

    .line 480
    .local v3, "tw":F
    iget v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    mul-float/2addr v4, p2

    sub-float v4, v0, v4

    div-float/2addr v4, v6

    iget-object v5, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    add-float v2, v4, v5

    .line 482
    .local v2, "th":F
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4}, Landroid/graphics/Matrix;->reset()V

    .line 483
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    iget v5, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 484
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v3, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 485
    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v4}, Lcom/yalantis/ucrop/view/CropImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 486
    return-void
.end method


# virtual methods
.method public cancelAllAnimations()V
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mWrapCropBoundsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 254
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mZoomImageToPositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 255
    return-void
.end method

.method public cropAndSaveImage(Landroid/graphics/Bitmap$CompressFormat;ILandroid/net/Uri;Lcom/yalantis/ucrop/callback/BitmapCropCallback;)V
    .registers 18
    .param p1, "compressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "compressQuality"    # I
    .param p3, "outputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "cropCallback"    # Lcom/yalantis/ucrop/callback/BitmapCropCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->cancelAllAnimations()V

    .line 73
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->setImageToWrapCropBounds(Z)V

    .line 75
    new-instance v0, Lcom/yalantis/ucrop/task/BitmapCropTask;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getViewBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    invoke-static {v4}, Lcom/yalantis/ucrop/util/RectUtils;->trapToRect([F)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v5

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v6

    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeX:I

    iget v8, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeY:I

    move-object v9, p1

    move v10, p2

    move-object/from16 v11, p3

    move-object/from16 v12, p4

    invoke-direct/range {v0 .. v12}, Lcom/yalantis/ucrop/task/BitmapCropTask;-><init>(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/graphics/RectF;Landroid/graphics/RectF;FFIILandroid/graphics/Bitmap$CompressFormat;ILandroid/net/Uri;Lcom/yalantis/ucrop/callback/BitmapCropCallback;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/yalantis/ucrop/task/BitmapCropTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 81
    return-void
.end method

.method public getCropBoundsChangeListener()Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 145
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    return-object v0
.end method

.method public getMaxScale()F
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxScale:F

    return v0
.end method

.method public getMinScale()F
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMinScale:F

    return v0
.end method

.method public getTargetAspectRatio()F
    .registers 2

    .prologue
    .line 102
    iget v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    return v0
.end method

.method protected isImageWrapCropBounds()Z
    .registers 2

    .prologue
    .line 403
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->isImageWrapCropBounds([F)Z

    move-result v0

    return v0
.end method

.method protected isImageWrapCropBounds([F)Z
    .registers 6
    .param p1, "imageCorners"    # [F

    .prologue
    .line 414
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 415
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v3

    neg-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 417
    array-length v2, p1

    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v1

    .line 418
    .local v1, "unrotatedImageCorners":[F
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 420
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-static {v2}, Lcom/yalantis/ucrop/util/RectUtils;->getCornersFromRect(Landroid/graphics/RectF;)[F

    move-result-object v0

    .line 421
    .local v0, "unrotatedCropBoundsCorners":[F
    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 423
    invoke-static {v1}, Lcom/yalantis/ucrop/util/RectUtils;->trapToRect([F)Landroid/graphics/RectF;

    move-result-object v2

    invoke-static {v0}, Lcom/yalantis/ucrop/util/RectUtils;->trapToRect([F)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v2

    return v2
.end method

.method protected onImageLaidOut()V
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 364
    invoke-super {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->onImageLaidOut()V

    .line 365
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 366
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_b

    .line 397
    :cond_a
    :goto_a
    return-void

    .line 370
    :cond_b
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    int-to-float v2, v6

    .line 371
    .local v2, "drawableWidth":F
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    int-to-float v1, v6

    .line 373
    .local v1, "drawableHeight":F
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    cmpl-float v6, v6, v10

    if-nez v6, :cond_1f

    .line 374
    div-float v6, v2, v1

    iput v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    .line 377
    :cond_1f
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisWidth:I

    int-to-float v6, v6

    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    div-float/2addr v6, v7

    float-to-int v4, v6

    .line 378
    .local v4, "height":I
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisHeight:I

    if-le v4, v6, :cond_6a

    .line 379
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisHeight:I

    int-to-float v6, v6

    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    mul-float/2addr v6, v7

    float-to-int v5, v6

    .line 380
    .local v5, "width":I
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisWidth:I

    sub-int/2addr v6, v5

    div-int/lit8 v3, v6, 0x2

    .line 381
    .local v3, "halfDiff":I
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    int-to-float v7, v3

    add-int v8, v5, v3

    int-to-float v8, v8

    iget v9, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisHeight:I

    int-to-float v9, v9

    invoke-virtual {v6, v7, v10, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 387
    .end local v5    # "width":I
    :goto_42
    invoke-direct {p0, v2, v1}, Lcom/yalantis/ucrop/view/CropImageView;->calculateImageScaleBounds(FF)V

    .line 388
    invoke-direct {p0, v2, v1}, Lcom/yalantis/ucrop/view/CropImageView;->setupInitialImagePosition(FF)V

    .line 390
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    if-eqz v6, :cond_53

    .line 391
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    iget v7, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    invoke-interface {v6, v7}, Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;->onCropAspectRatioChanged(F)V

    .line 393
    :cond_53
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    if-eqz v6, :cond_a

    .line 394
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v7

    invoke-interface {v6, v7}, Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;->onScale(F)V

    .line 395
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v7

    invoke-interface {v6, v7}, Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;->onRotate(F)V

    goto :goto_a

    .line 383
    .end local v3    # "halfDiff":I
    :cond_6a
    iget v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisHeight:I

    sub-int/2addr v6, v4

    div-int/lit8 v3, v6, 0x2

    .line 384
    .restart local v3    # "halfDiff":I
    iget-object v6, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    int-to-float v7, v3

    iget v8, p0, Lcom/yalantis/ucrop/view/CropImageView;->mThisWidth:I

    int-to-float v8, v8

    add-int v9, v4, v3

    int-to-float v9, v9

    invoke-virtual {v6, v10, v7, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_42
.end method

.method public postRotate(F)V
    .registers 4
    .param p1, "deltaAngle"    # F

    .prologue
    .line 246
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/yalantis/ucrop/view/CropImageView;->postRotate(FFF)V

    .line 247
    return-void
.end method

.method public postScale(FFF)V
    .registers 7
    .param p1, "deltaScale"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 233
    cmpl-float v0, p1, v2

    if-lez v0, :cond_17

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v0

    mul-float/2addr v0, p1

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMaxScale()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_17

    .line 234
    invoke-super {p0, p1, p2, p3}, Lcom/yalantis/ucrop/view/TransformImageView;->postScale(FFF)V

    .line 238
    :cond_16
    :goto_16
    return-void

    .line 235
    :cond_17
    cmpg-float v0, p1, v2

    if-gez v0, :cond_16

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v0

    mul-float/2addr v0, p1

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMinScale()F

    move-result v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_16

    .line 236
    invoke-super {p0, p1, p2, p3}, Lcom/yalantis/ucrop/view/TransformImageView;->postScale(FFF)V

    goto :goto_16
.end method

.method protected processStyledAttributes(Landroid/content/res/TypedArray;)V
    .registers 6
    .param p1, "a"    # Landroid/content/res/TypedArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 494
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_aspect_ratio_x:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 495
    .local v0, "targetAspectRatioX":F
    sget v2, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView_ucrop_aspect_ratio_y:I

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 497
    .local v1, "targetAspectRatioY":F
    cmpl-float v2, v0, v3

    if-eqz v2, :cond_1d

    cmpl-float v2, v1, v3

    if-nez v2, :cond_20

    .line 498
    :cond_1d
    iput v3, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    .line 502
    :goto_1f
    return-void

    .line 500
    :cond_20
    div-float v2, v0, v1

    iput v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    goto :goto_1f
.end method

.method public setCropBoundsChangeListener(Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;)V
    .registers 2
    .param p1, "cropBoundsChangeListener"    # Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 149
    iput-object p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    .line 150
    return-void
.end method

.method public setCropRect(Landroid/graphics/RectF;)V
    .registers 8
    .param p1, "cropRect"    # Landroid/graphics/RectF;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    iget v1, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getPaddingLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    iget v2, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getPaddingTop()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    iget v3, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getPaddingRight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getPaddingBottom()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 114
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/CropImageView;->calculateImageScaleBounds()V

    .line 115
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->setImageToWrapCropBounds()V

    .line 116
    return-void
.end method

.method public setImageToWrapCropBounds()V
    .registers 2

    .prologue
    .line 258
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->setImageToWrapCropBounds(Z)V

    .line 259
    return-void
.end method

.method public setImageToWrapCropBounds(Z)V
    .registers 17
    .param p1, "animate"    # Z

    .prologue
    .line 270
    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mBitmapLaidOut:Z

    if-eqz v0, :cond_6a

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->isImageWrapCropBounds()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 272
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCenter:[F

    const/4 v1, 0x0

    aget v4, v0, v1

    .line 273
    .local v4, "currentX":F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCenter:[F

    const/4 v1, 0x1

    aget v5, v0, v1

    .line 274
    .local v5, "currentY":F
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v8

    .line 276
    .local v8, "currentScale":F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    sub-float v6, v0, v4

    .line 277
    .local v6, "deltaX":F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    sub-float v7, v0, v5

    .line 278
    .local v7, "deltaY":F
    const/4 v9, 0x0

    .line 280
    .local v9, "deltaScale":F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 281
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v6, v7}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 283
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v14

    .line 284
    .local v14, "tempCurrentImageCorners":[F
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v14}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 286
    invoke-virtual {p0, v14}, Lcom/yalantis/ucrop/view/CropImageView;->isImageWrapCropBounds([F)Z

    move-result v10

    .line 288
    .local v10, "willImageWrapCropBoundsAfterTranslate":Z
    if-eqz v10, :cond_6b

    .line 289
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/CropImageView;->calculateImageIndents()[F

    move-result-object v12

    .line 290
    .local v12, "imageIndents":[F
    const/4 v0, 0x0

    aget v0, v12, v0

    const/4 v1, 0x2

    aget v1, v12, v1

    add-float/2addr v0, v1

    neg-float v6, v0

    .line 291
    const/4 v0, 0x1

    aget v0, v12, v0

    const/4 v1, 0x3

    aget v1, v12, v1

    add-float/2addr v0, v1

    neg-float v7, v0

    .line 307
    .end local v12    # "imageIndents":[F
    :goto_5b
    if-eqz p1, :cond_ac

    .line 308
    new-instance v0, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;

    iget-wide v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mImageToWrapCropBoundsAnimDuration:J

    move-object v1, p0

    invoke-direct/range {v0 .. v10}, Lcom/yalantis/ucrop/view/CropImageView$WrapCropBoundsRunnable;-><init>(Lcom/yalantis/ucrop/view/CropImageView;JFFFFFFZ)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mWrapCropBoundsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->post(Ljava/lang/Runnable;)Z

    .line 318
    .end local v4    # "currentX":F
    .end local v5    # "currentY":F
    .end local v6    # "deltaX":F
    .end local v7    # "deltaY":F
    .end local v8    # "currentScale":F
    .end local v9    # "deltaScale":F
    .end local v10    # "willImageWrapCropBoundsAfterTranslate":Z
    .end local v14    # "tempCurrentImageCorners":[F
    :cond_6a
    :goto_6a
    return-void

    .line 293
    .restart local v4    # "currentX":F
    .restart local v5    # "currentY":F
    .restart local v6    # "deltaX":F
    .restart local v7    # "deltaY":F
    .restart local v8    # "currentScale":F
    .restart local v9    # "deltaScale":F
    .restart local v10    # "willImageWrapCropBoundsAfterTranslate":Z
    .restart local v14    # "tempCurrentImageCorners":[F
    :cond_6b
    new-instance v13, Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-direct {v13, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 294
    .local v13, "tempCropRect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 295
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentAngle()F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 296
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v13}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 298
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCurrentImageCorners:[F

    invoke-static {v0}, Lcom/yalantis/ucrop/util/RectUtils;->getRectSidesFromCorners([F)[F

    move-result-object v11

    .line 300
    .local v11, "currentImageSides":[F
    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    aget v1, v11, v1

    div-float/2addr v0, v1

    invoke-virtual {v13}, Landroid/graphics/RectF;->height()F

    move-result v1

    const/4 v2, 0x1

    aget v2, v11, v2

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 303
    float-to-double v0, v9

    const-wide v2, 0x3ff028f5c28f5c29L    # 1.01

    mul-double/2addr v0, v2

    double-to-float v9, v0

    .line 304
    mul-float v0, v9, v8

    sub-float v9, v0, v8

    goto :goto_5b

    .line 312
    .end local v11    # "currentImageSides":[F
    .end local v13    # "tempCropRect":Landroid/graphics/RectF;
    :cond_ac
    invoke-virtual {p0, v6, v7}, Lcom/yalantis/ucrop/view/CropImageView;->postTranslate(FF)V

    .line 313
    if-nez v10, :cond_6a

    .line 314
    add-float v0, v8, v9

    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/yalantis/ucrop/view/CropImageView;->zoomInImage(FFF)V

    goto :goto_6a
.end method

.method public setImageToWrapCropBoundsAnimDuration(J)V
    .registers 5
    .param p1, "imageToWrapCropBoundsAnimDuration"    # J
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x64L
        .end annotation
    .end param

    .prologue
    .line 176
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_9

    .line 177
    iput-wide p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mImageToWrapCropBoundsAnimDuration:J

    .line 181
    return-void

    .line 179
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Animation duration cannot be negative value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMaxResultImageSizeX(I)V
    .registers 2
    .param p1, "maxResultImageSizeX"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0xaL
        .end annotation
    .end param

    .prologue
    .line 158
    iput p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeX:I

    .line 159
    return-void
.end method

.method public setMaxResultImageSizeY(I)V
    .registers 2
    .param p1, "maxResultImageSizeY"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0xaL
        .end annotation
    .end param

    .prologue
    .line 167
    iput p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxResultImageSizeY:I

    .line 168
    return-void
.end method

.method public setMaxScaleMultiplier(F)V
    .registers 2
    .param p1, "maxScaleMultiplier"    # F

    .prologue
    .line 189
    iput p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mMaxScaleMultiplier:F

    .line 190
    return-void
.end method

.method public setTargetAspectRatio(F)V
    .registers 5
    .param p1, "targetAspectRatio"    # F

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 127
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_9

    .line 128
    iput p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    .line 141
    :cond_8
    :goto_8
    return-void

    .line 132
    :cond_9
    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-nez v1, :cond_27

    .line 133
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iput v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    .line 138
    :goto_1b
    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    if-eqz v1, :cond_8

    .line 139
    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropBoundsChangeListener:Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;

    iget v2, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    invoke-interface {v1, v2}, Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;->onCropAspectRatioChanged(F)V

    goto :goto_8

    .line 135
    :cond_27
    iput p1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mTargetAspectRatio:F

    goto :goto_1b
.end method

.method protected zoomImageToPosition(FFFJ)V
    .registers 14
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F
    .param p4, "durationMs"    # J

    .prologue
    .line 435
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMaxScale()F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_c

    .line 436
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMaxScale()F

    move-result p1

    .line 439
    :cond_c
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v4

    .line 440
    .local v4, "oldScale":F
    sub-float v5, p1, v4

    .line 442
    .local v5, "deltaScale":F
    new-instance v0, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;

    move-object v1, p0

    move-wide v2, p4

    move v6, p2

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/yalantis/ucrop/view/CropImageView$ZoomImageToPosition;-><init>(Lcom/yalantis/ucrop/view/CropImageView;JFFFF)V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mZoomImageToPositionRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/CropImageView;->post(Ljava/lang/Runnable;)Z

    .line 444
    return-void
.end method

.method public zoomInImage(F)V
    .registers 4
    .param p1, "deltaScale"    # F

    .prologue
    .line 212
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/yalantis/ucrop/view/CropImageView;->zoomInImage(FFF)V

    .line 213
    return-void
.end method

.method public zoomInImage(FFF)V
    .registers 5
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    .line 219
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMaxScale()F

    move-result v0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_11

    .line 220
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v0

    div-float v0, p1, v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/yalantis/ucrop/view/CropImageView;->postScale(FFF)V

    .line 222
    :cond_11
    return-void
.end method

.method public zoomOutImage(F)V
    .registers 4
    .param p1, "deltaScale"    # F

    .prologue
    .line 196
    iget-object v0, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/yalantis/ucrop/view/CropImageView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/yalantis/ucrop/view/CropImageView;->zoomOutImage(FFF)V

    .line 197
    return-void
.end method

.method public zoomOutImage(FFF)V
    .registers 5
    .param p1, "scale"    # F
    .param p2, "centerX"    # F
    .param p3, "centerY"    # F

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getMinScale()F

    move-result v0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_11

    .line 204
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/CropImageView;->getCurrentScale()F

    move-result v0

    div-float v0, p1, v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/yalantis/ucrop/view/CropImageView;->postScale(FFF)V

    .line 206
    :cond_11
    return-void
.end method
