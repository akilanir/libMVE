.class public Lcom/yalantis/ucrop/view/TransformImageView;
.super Landroid/widget/ImageView;
.source "TransformImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;
    }
.end annotation


# static fields
.field private static final MATRIX_VALUES_COUNT:I = 0x9

.field private static final RECT_CENTER_POINT_COORDS:I = 0x2

.field private static final RECT_CORNER_POINTS_COORDS:I = 0x8

.field private static final TAG:Ljava/lang/String; = "TransformImageView"


# instance fields
.field protected mBitmapDecoded:Z

.field protected mBitmapLaidOut:Z

.field protected final mCurrentImageCenter:[F

.field protected final mCurrentImageCorners:[F

.field protected mCurrentImageMatrix:Landroid/graphics/Matrix;

.field private mImageUri:Landroid/net/Uri;

.field private mInitialImageCenter:[F

.field private mInitialImageCorners:[F

.field private final mMatrixValues:[F

.field private mMaxBitmapSize:I

.field protected mThisHeight:I

.field protected mThisWidth:I

.field protected mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/yalantis/ucrop/view/TransformImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/TransformImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 79
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 82
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageCorners:[F

    .line 40
    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageCenter:[F

    .line 42
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMatrixValues:[F

    .line 44
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    .line 52
    iput-boolean v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mBitmapDecoded:Z

    .line 53
    iput-boolean v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mBitmapLaidOut:Z

    .line 55
    iput v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMaxBitmapSize:I

    .line 83
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->init()V

    .line 84
    return-void
.end method

.method private updateCurrentImagePoints()V
    .registers 4

    .prologue
    .line 348
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageCorners:[F

    iget-object v2, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mInitialImageCorners:[F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    .line 349
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageCenter:[F

    iget-object v2, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mInitialImageCenter:[F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    .line 350
    return-void
.end method


# virtual methods
.method protected calculateMaxBitmapSize()I
    .registers 12

    .prologue
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 259
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "window"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    .line 260
    .local v4, "wm":Landroid/view/WindowManager;
    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 262
    .local v0, "display":Landroid/view/Display;
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2}, Landroid/graphics/Point;-><init>()V

    .line 264
    .local v2, "size":Landroid/graphics/Point;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xd

    if-lt v5, v6, :cond_35

    .line 265
    invoke-virtual {v0, v2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 266
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 267
    .local v3, "width":I
    iget v1, v2, Landroid/graphics/Point;->y:I

    .line 272
    .local v1, "height":I
    :goto_24
    int-to-double v5, v3

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    int-to-double v7, v1

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    add-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-int v5, v5

    return v5

    .line 269
    .end local v1    # "height":I
    .end local v3    # "width":I
    :cond_35
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v3

    .line 270
    .restart local v3    # "width":I
    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v1

    .restart local v1    # "height":I
    goto :goto_24
.end method

.method public getCurrentAngle()F
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixAngle(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method public getCurrentScale()F
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method public getImageUri()Landroid/net/Uri;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 123
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mImageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getMatrixAngle(Landroid/graphics/Matrix;)F
    .registers 6
    .param p1, "matrix"    # Landroid/graphics/Matrix;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 181
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    const-wide v2, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    mul-double/2addr v0, v2

    neg-double v0, v0

    double-to-float v0, v0

    return v0
.end method

.method public getMatrixScale(Landroid/graphics/Matrix;)F
    .registers 8
    .param p1, "matrix"    # Landroid/graphics/Matrix;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    .line 166
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const/4 v2, 0x3

    invoke-virtual {p0, p1, v2}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method protected getMatrixValue(Landroid/graphics/Matrix;I)F
    .registers 4
    .param p1, "matrix"    # Landroid/graphics/Matrix;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "valueIndex"    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x0L
            to = 0x9L
        .end annotation
    .end param

    .prologue
    .line 325
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 326
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method public getMaxBitmapSize()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMaxBitmapSize:I

    if-gtz v0, :cond_a

    .line 111
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->calculateMaxBitmapSize()I

    move-result v0

    iput v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMaxBitmapSize:I

    .line 113
    :cond_a
    iget v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMaxBitmapSize:I

    return v0
.end method

.method public getViewBitmap()Landroid/graphics/Bitmap;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Lcom/yalantis/ucrop/util/FastBitmapDrawable;

    if-nez v0, :cond_10

    .line 194
    :cond_e
    const/4 v0, 0x0

    .line 196
    :goto_f
    return-object v0

    :cond_10
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/yalantis/ucrop/util/FastBitmapDrawable;

    invoke-virtual {v0}, Lcom/yalantis/ucrop/util/FastBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_f
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 248
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 249
    return-void
.end method

.method protected onImageLaidOut()V
    .registers 12

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 296
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 297
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_9

    .line 315
    :cond_8
    :goto_8
    return-void

    .line 301
    :cond_9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    int-to-float v3, v4

    .line 302
    .local v3, "w":F
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v1, v4

    .line 304
    .local v1, "h":F
    const-string v4, "TransformImageView"

    const-string v5, "Image size: [%d:%d]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    float-to-int v8, v3

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    float-to-int v7, v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v9, v9, v3, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 307
    .local v2, "initialImageRect":Landroid/graphics/RectF;
    invoke-static {v2}, Lcom/yalantis/ucrop/util/RectUtils;->getCornersFromRect(Landroid/graphics/RectF;)[F

    move-result-object v4

    iput-object v4, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mInitialImageCorners:[F

    .line 308
    invoke-static {v2}, Lcom/yalantis/ucrop/util/RectUtils;->getCenterFromRect(Landroid/graphics/RectF;)[F

    move-result-object v4

    iput-object v4, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mInitialImageCenter:[F

    .line 310
    iput-boolean v10, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mBitmapLaidOut:Z

    .line 312
    iget-object v4, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    if-eqz v4, :cond_8

    .line 313
    iget-object v4, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    invoke-interface {v4}, Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;->onLoadComplete()V

    goto :goto_8
.end method

.method protected onLayout(ZIIII)V
    .registers 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 277
    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    .line 278
    if-nez p1, :cond_d

    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mBitmapDecoded:Z

    if-eqz v0, :cond_34

    iget-boolean v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mBitmapLaidOut:Z

    if-nez v0, :cond_34

    .line 280
    :cond_d
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getPaddingLeft()I

    move-result p2

    .line 281
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getPaddingTop()I

    move-result p3

    .line 282
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getPaddingRight()I

    move-result v1

    sub-int p4, v0, v1

    .line 283
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getPaddingBottom()I

    move-result v1

    sub-int p5, v0, v1

    .line 284
    sub-int v0, p4, p2

    iput v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mThisWidth:I

    .line 285
    sub-int v0, p5, p3

    iput v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mThisHeight:I

    .line 287
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->onImageLaidOut()V

    .line 289
    :cond_34
    return-void
.end method

.method public postRotate(FFF)V
    .registers 6
    .param p1, "deltaAngle"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .prologue
    .line 238
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1e

    .line 239
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 240
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 241
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    if-eqz v0, :cond_1e

    .line 242
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixAngle(Landroid/graphics/Matrix;)F

    move-result v1

    invoke-interface {v0, v1}, Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;->onRotate(F)V

    .line 245
    :cond_1e
    return-void
.end method

.method public postScale(FFF)V
    .registers 6
    .param p1, "deltaScale"    # F
    .param p2, "px"    # F
    .param p3, "py"    # F

    .prologue
    .line 221
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1e

    .line 222
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 223
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 224
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    if-eqz v0, :cond_1e

    .line 225
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    iget-object v1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixScale(Landroid/graphics/Matrix;)F

    move-result v1

    invoke-interface {v0, v1}, Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;->onScale(F)V

    .line 228
    :cond_1e
    return-void
.end method

.method public postTranslate(FF)V
    .registers 5
    .param p1, "deltaX"    # F
    .param p2, "deltaY"    # F

    .prologue
    const/4 v1, 0x0

    .line 207
    cmpl-float v0, p1, v1

    if-nez v0, :cond_9

    cmpl-float v0, p2, v1

    if-eqz v0, :cond_13

    .line 208
    :cond_9
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 209
    iget-object v0, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mCurrentImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 211
    :cond_13
    return-void
.end method

.method protected printMatrix(Ljava/lang/String;Landroid/graphics/Matrix;)V
    .registers 10
    .param p1, "logPrefix"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "matrix"    # Landroid/graphics/Matrix;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 335
    const/4 v4, 0x2

    invoke-virtual {p0, p2, v4}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v2

    .line 336
    .local v2, "x":F
    const/4 v4, 0x5

    invoke-virtual {p0, p2, v4}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixValue(Landroid/graphics/Matrix;I)F

    move-result v3

    .line 337
    .local v3, "y":F
    invoke-virtual {p0, p2}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixScale(Landroid/graphics/Matrix;)F

    move-result v1

    .line 338
    .local v1, "rScale":F
    invoke-virtual {p0, p2}, Lcom/yalantis/ucrop/view/TransformImageView;->getMatrixAngle(Landroid/graphics/Matrix;)F

    move-result v0

    .line 339
    .local v0, "rAngle":F
    const-string v4, "TransformImageView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": matrix: { x: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", y: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", scale: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", angle: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " }"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 118
    new-instance v0, Lcom/yalantis/ucrop/util/FastBitmapDrawable;

    invoke-direct {v0, p1}, Lcom/yalantis/ucrop/util/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v0}, Lcom/yalantis/ucrop/view/TransformImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 119
    return-void
.end method

.method public setImageMatrix(Landroid/graphics/Matrix;)V
    .registers 2
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 187
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 188
    invoke-direct {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->updateCurrentImagePoints()V

    .line 189
    return-void
.end method

.method public setImageUri(Landroid/net/Uri;Landroid/net/Uri;)V
    .registers 9
    .param p1, "imageUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "outputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 133
    iput-object p1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mImageUri:Landroid/net/Uri;

    .line 134
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getMaxBitmapSize()I

    move-result v3

    .line 136
    .local v3, "maxBitmapSize":I
    invoke-virtual {p0}, Lcom/yalantis/ucrop/view/TransformImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v5, Lcom/yalantis/ucrop/view/TransformImageView$1;

    invoke-direct {v5, p0}, Lcom/yalantis/ucrop/view/TransformImageView$1;-><init>(Lcom/yalantis/ucrop/view/TransformImageView;)V

    move-object v1, p1

    move-object v2, p2

    move v4, v3

    invoke-static/range {v0 .. v5}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->decodeBitmapInBackground(Landroid/content/Context;Landroid/net/Uri;Landroid/net/Uri;IILcom/yalantis/ucrop/callback/BitmapLoadCallback;)V

    .line 152
    return-void
.end method

.method public setMaxBitmapSize(I)V
    .registers 2
    .param p1, "maxBitmapSize"    # I

    .prologue
    .line 106
    iput p1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mMaxBitmapSize:I

    .line 107
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 4
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 92
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne p1, v0, :cond_8

    .line 93
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 97
    :goto_7
    return-void

    .line 95
    :cond_8
    const-string v0, "TransformImageView"

    const-string v1, "Invalid ScaleType. Only ScaleType.MATRIX can be used"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7
.end method

.method public setTransformImageListener(Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;)V
    .registers 2
    .param p1, "transformImageListener"    # Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/yalantis/ucrop/view/TransformImageView;->mTransformImageListener:Lcom/yalantis/ucrop/view/TransformImageView$TransformImageListener;

    .line 88
    return-void
.end method
