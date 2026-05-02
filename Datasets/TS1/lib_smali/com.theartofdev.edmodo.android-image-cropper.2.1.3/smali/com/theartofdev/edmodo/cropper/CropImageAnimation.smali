.class final Lcom/theartofdev/edmodo/cropper/CropImageAnimation;
.super Landroid/view/animation/Animation;
.source "CropImageAnimation.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# instance fields
.field private final mAnimMatrix:[F

.field private final mAnimRect:Landroid/graphics/RectF;

.field private final mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

.field private final mEndCropWindowRect:Landroid/graphics/RectF;

.field private final mEndImageMatrix:[F

.field private final mEndImageRect:Landroid/graphics/RectF;

.field private final mImageView:Landroid/widget/ImageView;

.field private final mStartCropWindowRect:Landroid/graphics/RectF;

.field private final mStartImageMatrix:[F

.field private final mStartImageRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;Lcom/theartofdev/edmodo/cropper/CropOverlayView;)V
    .registers 5
    .param p1, "cropImageView"    # Landroid/widget/ImageView;
    .param p2, "cropOverlayView"    # Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .prologue
    const/16 v1, 0x9

    .line 50
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 33
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    .line 35
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    .line 37
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    .line 39
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    .line 41
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageMatrix:[F

    .line 43
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageMatrix:[F

    .line 45
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    .line 47
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimMatrix:[F

    .line 51
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    .line 52
    iput-object p2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 54
    const-wide/16 v0, 0x12c

    invoke-virtual {p0, v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setDuration(J)V

    .line 55
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setFillAfter(Z)V

    .line 56
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 57
    invoke-virtual {p0, p0}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 58
    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 9
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 76
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 77
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 78
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 79
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 80
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 82
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->left:F

    .line 83
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->top:F

    .line 84
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->right:F

    .line 85
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    .line 86
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setBitmapRect(Landroid/graphics/RectF;II)V

    .line 88
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b3
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimMatrix:[F

    array-length v2, v2

    if-ge v0, v2, :cond_ce

    .line 89
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimMatrix:[F

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageMatrix:[F

    aget v3, v3, v0

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageMatrix:[F

    aget v4, v4, v0

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageMatrix:[F

    aget v5, v5, v0

    sub-float/2addr v4, v5

    mul-float/2addr v4, p1

    add-float/2addr v3, v4

    aput v3, v2, v0

    .line 88
    add-int/lit8 v0, v0, 0x1

    goto :goto_b3

    .line 91
    :cond_ce
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    .line 92
    .local v1, "m":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mAnimMatrix:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->setValues([F)V

    .line 93
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 95
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->invalidate()V

    .line 96
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 97
    return-void
.end method

.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 3
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 107
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 112
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 102
    return-void
.end method

.method public setEndState(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "imageRect"    # Landroid/graphics/RectF;
    .param p2, "imageMatrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 69
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndCropWindowRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 70
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mEndImageMatrix:[F

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 71
    return-void
.end method

.method public setStartState(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V
    .registers 5
    .param p1, "imageRect"    # Landroid/graphics/RectF;
    .param p2, "imageMatrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->reset()V

    .line 62
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 63
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartCropWindowRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 64
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->mStartImageMatrix:[F

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 65
    return-void
.end method
