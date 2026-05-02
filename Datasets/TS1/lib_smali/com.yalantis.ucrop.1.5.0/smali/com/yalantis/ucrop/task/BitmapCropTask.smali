.class public Lcom/yalantis/ucrop/task/BitmapCropTask;
.super Landroid/os/AsyncTask;
.source "BitmapCropTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Exception;",
        ">;"
    }
.end annotation


# instance fields
.field private final mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private final mCompressQuality:I

.field private final mContext:Landroid/content/Context;

.field private final mCropCallback:Lcom/yalantis/ucrop/callback/BitmapCropCallback;

.field private final mCropRect:Landroid/graphics/RectF;

.field private mCurrentAngle:F

.field private final mCurrentImageRect:Landroid/graphics/RectF;

.field private mCurrentScale:F

.field private final mMaxResultImageSizeX:I

.field private final mMaxResultImageSizeY:I

.field private final mOutputUri:Landroid/net/Uri;

.field private final mTempMatrix:Landroid/graphics/Matrix;

.field private mViewBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/Bitmap;Landroid/graphics/RectF;Landroid/graphics/RectF;FFIILandroid/graphics/Bitmap$CompressFormat;ILandroid/net/Uri;Lcom/yalantis/ucrop/callback/BitmapCropCallback;)V
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "viewBitmap"    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "cropRect"    # Landroid/graphics/RectF;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "currentImageRect"    # Landroid/graphics/RectF;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "currentScale"    # F
    .param p6, "currentAngle"    # F
    .param p7, "maxResultImageSizeX"    # I
    .param p8, "maxResultImageSizeY"    # I
    .param p9, "compressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p10, "compressQuality"    # I
    .param p11, "outputUri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p12, "cropCallback"    # Lcom/yalantis/ucrop/callback/BitmapCropCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 32
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mTempMatrix:Landroid/graphics/Matrix;

    .line 51
    iput-object p1, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mContext:Landroid/content/Context;

    .line 53
    iput-object p2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 54
    iput-object p3, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    .line 55
    iput-object p4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentImageRect:Landroid/graphics/RectF;

    .line 57
    iput p5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    .line 58
    iput p6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentAngle:F

    .line 59
    iput p7, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeX:I

    .line 60
    iput p8, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeY:I

    .line 62
    iput-object p9, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 63
    iput p10, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCompressQuality:I

    .line 65
    iput-object p11, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mOutputUri:Landroid/net/Uri;

    .line 67
    iput-object p12, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropCallback:Lcom/yalantis/ucrop/callback/BitmapCropCallback;

    .line 68
    return-void
.end method

.method private crop()V
    .registers 7

    .prologue
    .line 139
    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 140
    .local v2, "top":I
    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 141
    .local v1, "left":I
    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 142
    .local v3, "width":I
    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 144
    .local v0, "height":I
    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-static {v4, v1, v2, v3, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 145
    return-void
.end method

.method private resize()V
    .registers 11

    .prologue
    .line 105
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    iget v7, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float v1, v6, v7

    .line 106
    .local v1, "cropWidth":F
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget v7, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float v0, v6, v7

    .line 108
    .local v0, "cropHeight":F
    iget v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeX:I

    int-to-float v6, v6

    cmpl-float v6, v1, v6

    if-gtz v6, :cond_22

    iget v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeY:I

    int-to-float v6, v6

    cmpl-float v6, v0, v6

    if-lez v6, :cond_5f

    .line 110
    :cond_22
    iget v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeX:I

    int-to-float v6, v6

    div-float v4, v6, v1

    .line 111
    .local v4, "scaleX":F
    iget v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeY:I

    int-to-float v6, v6

    div-float v5, v6, v0

    .line 112
    .local v5, "scaleY":F
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 114
    .local v2, "resizeScale":F
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    iget-object v7, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v2

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    iget-object v8, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v2

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    const/4 v9, 0x0

    invoke-static {v6, v7, v8, v9}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 117
    .local v3, "resizedBitmap":Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    if-eq v6, v3, :cond_58

    .line 118
    iget-object v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 120
    :cond_58
    iput-object v3, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 122
    iget v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    div-float/2addr v6, v2

    iput v6, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentScale:F

    .line 124
    .end local v2    # "resizeScale":F
    .end local v3    # "resizedBitmap":Landroid/graphics/Bitmap;
    .end local v4    # "scaleX":F
    .end local v5    # "scaleY":F
    :cond_5f
    return-void
.end method

.method private rotate()V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 127
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 128
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mTempMatrix:Landroid/graphics/Matrix;

    iget v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentAngle:F

    iget-object v3, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget-object v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 130
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mTempMatrix:Landroid/graphics/Matrix;

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 132
    .local v7, "rotatedBitmap":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    if-eq v0, v7, :cond_3e

    .line 133
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 135
    :cond_3e
    iput-object v7, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    .line 136
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Exception;
    .registers 7
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 73
    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-eqz v2, :cond_15

    .line 74
    :cond_d
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v2, "ViewBitmap is null or already recycled"

    invoke-direct {v0, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 101
    :goto_14
    return-object v0

    .line 76
    :cond_15
    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentImageRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 77
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v2, "CurrentImageRect is empty"

    invoke-direct {v0, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    goto :goto_14

    .line 80
    :cond_25
    iget v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeX:I

    if-lez v2, :cond_30

    iget v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mMaxResultImageSizeY:I

    if-lez v2, :cond_30

    .line 81
    invoke-direct {p0}, Lcom/yalantis/ucrop/task/BitmapCropTask;->resize()V

    .line 84
    :cond_30
    iget v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCurrentAngle:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_3a

    .line 85
    invoke-direct {p0}, Lcom/yalantis/ucrop/task/BitmapCropTask;->rotate()V

    .line 88
    :cond_3a
    invoke-direct {p0}, Lcom/yalantis/ucrop/task/BitmapCropTask;->crop()V

    .line 90
    const/4 v1, 0x0

    .line 92
    .local v1, "outputStream":Ljava/io/OutputStream;
    :try_start_3e
    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mOutputUri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v1

    .line 93
    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v4, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCompressQuality:I

    invoke-virtual {v2, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 94
    iget-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 95
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mViewBitmap:Landroid/graphics/Bitmap;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_5b} :catch_5f
    .catchall {:try_start_3e .. :try_end_5b} :catchall_64

    .line 99
    invoke-static {v1}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    goto :goto_14

    .line 96
    :catch_5f
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    goto :goto_14

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_64
    move-exception v2

    invoke-static {v1}, Lcom/yalantis/ucrop/util/BitmapLoadUtils;->close(Ljava/io/Closeable;)V

    throw v2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 24
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/task/BitmapCropTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Exception;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "result"    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 149
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropCallback:Lcom/yalantis/ucrop/callback/BitmapCropCallback;

    if-eqz v0, :cond_b

    .line 150
    if-nez p1, :cond_c

    .line 151
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropCallback:Lcom/yalantis/ucrop/callback/BitmapCropCallback;

    invoke-interface {v0}, Lcom/yalantis/ucrop/callback/BitmapCropCallback;->onBitmapCropped()V

    .line 156
    :cond_b
    :goto_b
    return-void

    .line 153
    :cond_c
    iget-object v0, p0, Lcom/yalantis/ucrop/task/BitmapCropTask;->mCropCallback:Lcom/yalantis/ucrop/callback/BitmapCropCallback;

    invoke-interface {v0, p1}, Lcom/yalantis/ucrop/callback/BitmapCropCallback;->onCropFailure(Ljava/lang/Exception;)V

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    check-cast p1, Ljava/lang/Exception;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/yalantis/ucrop/task/BitmapCropTask;->onPostExecute(Ljava/lang/Exception;)V

    return-void
.end method
