.class public Lcom/theartofdev/edmodo/cropper/CropImageView;
.super Landroid/widget/FrameLayout;
.source "CropImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;,
        Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;,
        Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;,
        Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;,
        Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;,
        Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
    }
.end annotation


# instance fields
.field private mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

.field private mAutoZoomEnabled:Z

.field private mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;",
            ">;"
        }
    .end annotation
.end field

.field private mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;",
            ">;"
        }
    .end annotation
.end field

.field private final mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

.field private mDegreesRotated:I

.field private final mImageInverseMatrix:Landroid/graphics/Matrix;

.field private final mImageMatrix:Landroid/graphics/Matrix;

.field private final mImageRect:Landroid/graphics/RectF;

.field private mImageResource:I

.field private final mImageView:Landroid/widget/ImageView;

.field private mLayoutHeight:I

.field private mLayoutWidth:I

.field private mLoadedImageUri:Landroid/net/Uri;

.field private mLoadedSampleSize:I

.field private mMaxZoom:I

.field private mOnGetCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOnSaveCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;",
            ">;"
        }
    .end annotation
.end field

.field private mOnSetImageUriCompleteListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mProgressBar:Landroid/widget/ProgressBar;

.field private mRestoreCropWindowRect:Landroid/graphics/RectF;

.field private mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

.field private mShowCropOverlay:Z

.field private mShowProgressBar:Z

.field private mZoom:F

.field private mZoomOffsetX:F

.field private mZoomOffsetY:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 178
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 179
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v6, 0x0

    const/4 v8, 0x1

    .line 182
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    .line 65
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    .line 75
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    .line 102
    iput-boolean v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    .line 108
    iput-boolean v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    .line 114
    iput-boolean v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    .line 144
    iput v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    .line 149
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 184
    const/4 v2, 0x0

    .line 185
    .local v2, "options":Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    instance-of v5, p1, Landroid/app/Activity;

    if-eqz v5, :cond_1f3

    move-object v5, p1

    check-cast v5, Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 186
    .local v1, "intent":Landroid/content/Intent;
    :goto_32
    if-eqz v1, :cond_3c

    .line 187
    const-string v5, "CROP_IMAGE_EXTRA_OPTIONS"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    .end local v2    # "options":Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    check-cast v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .line 190
    .restart local v2    # "options":Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    :cond_3c
    if-nez v2, :cond_19a

    .line 192
    new-instance v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;

    .end local v2    # "options":Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    invoke-direct {v2}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;-><init>()V

    .line 194
    .restart local v2    # "options":Lcom/theartofdev/edmodo/cropper/CropImageOptions;
    if-eqz p2, :cond_19a

    .line 195
    sget-object v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView:[I

    invoke-virtual {p1, p2, v5, v6, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 197
    .local v3, "ta":Landroid/content/res/TypedArray;
    :try_start_4b
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropFixAspectRatio:I

    iget-boolean v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->fixAspectRatio:Z

    .line 198
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropAspectRatioX:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioX:I

    .line 199
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropAspectRatioY:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->aspectRatioY:I

    .line 200
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    move-result-object v5

    sget v6, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropScaleType:I

    iget-object v7, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    invoke-virtual {v7}, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->ordinal()I

    move-result v7

    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    aget-object v5, v5, v6

    iput-object v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 201
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropAutoZoomEnabled:I

    iget-boolean v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    .line 202
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMaxZoom:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    .line 203
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    move-result-object v5

    sget v6, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropShape:I

    iget-object v7, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    invoke-virtual {v7}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->ordinal()I

    move-result v7

    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    aget-object v5, v5, v6

    iput-object v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->cropShape:Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .line 204
    invoke-static {}, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->values()[Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    move-result-object v5

    sget v6, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropGuidelines:I

    iget-object v7, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    invoke-virtual {v7}, Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;->ordinal()I

    move-result v7

    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    aget-object v5, v5, v6

    iput-object v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelines:Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .line 205
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropSnapRadius:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->snapRadius:F

    .line 206
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropTouchRadius:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->touchRadius:F

    .line 207
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropInitialCropWindowPaddingRatio:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->initialCropWindowPaddingRatio:F

    .line 208
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderLineThickness:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineThickness:F

    .line 209
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderLineColor:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderLineColor:I

    .line 210
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderCornerThickness:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    .line 211
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderCornerOffset:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerOffset:F

    .line 212
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderCornerLength:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerLength:F

    .line 213
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderCornerColor:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerColor:I

    .line 214
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropGuidelinesThickness:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesThickness:F

    .line 215
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropGuidelinesColor:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->guidelinesColor:I

    .line 216
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBackgroundColor:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->backgroundColor:I

    .line 217
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropShowCropOverlay:I

    iget-boolean v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    .line 218
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropShowProgressBar:I

    iget-boolean v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showProgressBar:Z

    .line 219
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropBorderCornerThickness:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->borderCornerThickness:F

    .line 220
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMinCropWindowWidth:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowWidth:I

    .line 221
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMinCropWindowHeight:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropWindowHeight:I

    .line 222
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMinCropResultWidthPX:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultWidth:I

    .line 223
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMinCropResultHeightPX:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->minCropResultHeight:I

    .line 224
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMaxCropResultWidthPX:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultWidth:I

    .line 225
    sget v5, Lcom/theartofdev/edmodo/cropper/R$styleable;->CropImageView_cropMaxCropResultHeightPX:I

    iget v6, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I

    int-to-float v6, v6

    invoke-virtual {v3, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    float-to-int v5, v5

    iput v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxCropResultHeight:I
    :try_end_197
    .catchall {:try_start_4b .. :try_end_197} :catchall_1f6

    .line 227
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 232
    .end local v3    # "ta":Landroid/content/res/TypedArray;
    :cond_19a
    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->validate()V

    .line 234
    iget-object v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->scaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 235
    iget-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->autoZoomEnabled:Z

    iput-boolean v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    .line 236
    iget v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->maxZoom:I

    iput v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    .line 237
    iget-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showCropOverlay:Z

    iput-boolean v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    .line 238
    iget-boolean v5, v2, Lcom/theartofdev/edmodo/cropper/CropImageOptions;->showProgressBar:Z

    iput-boolean v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    .line 240
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 241
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v5, Lcom/theartofdev/edmodo/cropper/R$layout;->crop_image_view:I

    invoke-virtual {v0, v5, p0, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 243
    .local v4, "v":Landroid/view/View;
    sget v5, Lcom/theartofdev/edmodo/cropper/R$id;->ImageView_image:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    .line 244
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    sget-object v6, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 246
    sget v5, Lcom/theartofdev/edmodo/cropper/R$id;->CropOverlayView:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 247
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    new-instance v6, Lcom/theartofdev/edmodo/cropper/CropImageView$1;

    invoke-direct {v6, p0}, Lcom/theartofdev/edmodo/cropper/CropImageView$1;-><init>(Lcom/theartofdev/edmodo/cropper/CropImageView;)V

    invoke-virtual {v5, v6}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowChangeListener(Lcom/theartofdev/edmodo/cropper/CropOverlayView$CropWindowChangeListener;)V

    .line 253
    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v5, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialAttributeValues(Lcom/theartofdev/edmodo/cropper/CropImageOptions;)V

    .line 255
    sget v5, Lcom/theartofdev/edmodo/cropper/R$id;->CropProgressBar:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ProgressBar;

    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mProgressBar:Landroid/widget/ProgressBar;

    .line 256
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 257
    return-void

    .line 185
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v4    # "v":Landroid/view/View;
    :cond_1f3
    const/4 v1, 0x0

    goto/16 :goto_32

    .line 227
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v3    # "ta":Landroid/content/res/TypedArray;
    :catchall_1f6
    move-exception v5

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    throw v5
.end method

.method static synthetic access$000(Lcom/theartofdev/edmodo/cropper/CropImageView;ZZ)V
    .registers 3
    .param p0, "x0"    # Lcom/theartofdev/edmodo/cropper/CropImageView;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->handleCropWindowChanged(ZZ)V

    return-void
.end method

.method private applyImageMatrix(FFZZ)V
    .registers 14
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "center"    # Z
    .param p4, "animate"    # Z

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v8, 0x40000000    # 2.0f

    const/4 v3, 0x0

    .line 1191
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_12b

    cmpl-float v2, p1, v3

    if-lez v2, :cond_12b

    cmpl-float v2, p2, v3

    if-lez v2, :cond_12b

    .line 1193
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 1194
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v3, v3, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1197
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    sub-float v4, p1, v4

    div-float/2addr v4, v8

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    sub-float v5, p2, v5

    div-float/2addr v5, v8

    invoke-virtual {v2, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1198
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V

    .line 1201
    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    if-lez v2, :cond_62

    .line 1202
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    invoke-virtual {v2, v4, v5, v6}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 1203
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V

    .line 1207
    :cond_62
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float v2, p1, v2

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float v4, p2, v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 1208
    .local v1, "scale":F
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->FIT_CENTER:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    if-eq v2, v4, :cond_8e

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    sget-object v4, Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;->CENTER_INSIDE:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    if-ne v2, v4, :cond_86

    cmpg-float v2, v1, v7

    if-ltz v2, :cond_8e

    :cond_86
    cmpl-float v2, v1, v7

    if-lez v2, :cond_a4

    iget-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    if-eqz v2, :cond_a4

    .line 1209
    :cond_8e
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v2, v1, v1, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1210
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V

    .line 1214
    :cond_a4
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    move-result v7

    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 1215
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V

    .line 1217
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 1220
    .local v0, "cropRect":Landroid/graphics/RectF;
    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    neg-float v2, v2

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v2, v4

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    neg-float v4, v4

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v4, v5

    invoke-virtual {v0, v2, v4}, Landroid/graphics/RectF;->offset(FF)V

    .line 1222
    if-eqz p3, :cond_172

    .line 1224
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    cmpl-float v2, p1, v2

    if-lez v2, :cond_12c

    move v2, v3

    .line 1225
    :goto_e0
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 1226
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpl-float v2, p2, v2

    if-lez v2, :cond_14e

    .line 1227
    :goto_ec
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    .line 1235
    :goto_ee
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1236
    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 1237
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v2, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 1238
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V

    .line 1241
    if-eqz p4, :cond_1a6

    .line 1243
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3, v4}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setEndState(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V

    .line 1244
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1250
    :goto_126
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    invoke-direct {p0, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->updateBitmapRect(Landroid/graphics/RectF;)V

    .line 1252
    .end local v0    # "cropRect":Landroid/graphics/RectF;
    .end local v1    # "scale":F
    :cond_12b
    return-void

    .line 1224
    .restart local v0    # "cropRect":Landroid/graphics/RectF;
    .restart local v1    # "scale":F
    :cond_12c
    div-float v2, p1, v8

    .line 1225
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    sub-float/2addr v2, v4

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    neg-float v4, v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v2, v4

    goto :goto_e0

    .line 1226
    :cond_14e
    div-float v2, p2, v8

    .line 1227
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    neg-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float v3, v2, v3

    goto/16 :goto_ec

    .line 1230
    :cond_172
    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/RectF;->left:F

    neg-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget v3, v0, Landroid/graphics/RectF;->right:F

    neg-float v3, v3

    add-float/2addr v3, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v2, v3

    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 1231
    iget v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    mul-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/RectF;->top:F

    neg-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget v3, v0, Landroid/graphics/RectF;->bottom:F

    neg-float v3, v3

    add-float/2addr v3, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v2, v3

    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    goto/16 :goto_ee

    .line 1246
    :cond_1a6
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    goto/16 :goto_126
.end method

.method private clearImage(Z)V
    .registers 6
    .param p1, "full"    # Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 879
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    if-gtz v0, :cond_f

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-eqz v0, :cond_14

    .line 880
    :cond_f
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 882
    :cond_14
    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    .line 884
    if-eqz p1, :cond_36

    .line 886
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    .line 887
    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    .line 888
    const/4 v0, 0x1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    .line 889
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 890
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 891
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 892
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    .line 893
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 895
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 897
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setCropOverlayVisibility()V

    .line 899
    :cond_36
    return-void
.end method

.method private static getOnMeasureSpec(III)I
    .registers 5
    .param p0, "measureSpecMode"    # I
    .param p1, "measureSpecSize"    # I
    .param p2, "desiredSize"    # I

    .prologue
    .line 1276
    const/high16 v1, 0x40000000    # 2.0f

    if-ne p0, v1, :cond_6

    .line 1278
    move v0, p1

    .line 1287
    .local v0, "spec":I
    :goto_5
    return v0

    .line 1279
    .end local v0    # "spec":I
    :cond_6
    const/high16 v1, -0x80000000

    if-ne p0, v1, :cond_f

    .line 1281
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .restart local v0    # "spec":I
    goto :goto_5

    .line 1284
    .end local v0    # "spec":I
    :cond_f
    move v0, p2

    .restart local v0    # "spec":I
    goto :goto_5
.end method

.method private handleCropWindowChanged(ZZ)V
    .registers 16
    .param p1, "inProgress"    # Z
    .param p2, "animate"    # Z

    .prologue
    const v12, 0x3f23d70a    # 0.64f

    const v11, 0x3f028f5c    # 0.51f

    const/high16 v6, 0x3f000000    # 0.5f

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    .line 1130
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v3

    .line 1131
    .local v3, "width":I
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    .line 1132
    .local v1, "height":I
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_44

    if-lez v3, :cond_44

    if-lez v1, :cond_44

    .line 1134
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 1135
    .local v0, "cropRect":Landroid/graphics/RectF;
    if-eqz p1, :cond_45

    .line 1136
    iget v4, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v4, v4, v9

    if-ltz v4, :cond_3d

    iget v4, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v4, v4, v9

    if-ltz v4, :cond_3d

    iget v4, v0, Landroid/graphics/RectF;->right:F

    int-to-float v5, v3

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_3d

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    int-to-float v5, v1

    cmpl-float v4, v4, v5

    if-lez v4, :cond_44

    .line 1137
    :cond_3d
    int-to-float v4, v3

    int-to-float v5, v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 1169
    .end local v0    # "cropRect":Landroid/graphics/RectF;
    :cond_44
    :goto_44
    return-void

    .line 1139
    .restart local v0    # "cropRect":Landroid/graphics/RectF;
    :cond_45
    iget-boolean v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    if-nez v4, :cond_4f

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    cmpl-float v4, v4, v10

    if-lez v4, :cond_44

    .line 1140
    :cond_4f
    const/4 v2, 0x0

    .line 1142
    .local v2, "newZoom":F
    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    iget v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_8c

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v4

    int-to-float v5, v3

    mul-float/2addr v5, v6

    cmpg-float v4, v4, v5

    if-gez v4, :cond_8c

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    int-to-float v5, v1

    mul-float/2addr v5, v6

    cmpg-float v4, v4, v5

    if-gez v4, :cond_8c

    .line 1143
    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    int-to-float v4, v4

    int-to-float v5, v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v6

    iget v7, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v6, v7

    div-float/2addr v6, v12

    div-float/2addr v5, v6

    int-to-float v6, v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v7

    iget v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v7, v8

    div-float/2addr v7, v12

    div-float/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 1145
    :cond_8c
    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    cmpl-float v4, v4, v10

    if-lez v4, :cond_c8

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v4

    int-to-float v5, v3

    const v6, 0x3f266666    # 0.65f

    mul-float/2addr v5, v6

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_ac

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    int-to-float v5, v1

    const v6, 0x3f266666    # 0.65f

    mul-float/2addr v5, v6

    cmpl-float v4, v4, v5

    if-lez v4, :cond_c8

    .line 1146
    :cond_ac
    int-to-float v4, v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v5, v6

    div-float/2addr v5, v11

    div-float/2addr v4, v5

    int-to-float v5, v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget v7, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float/2addr v6, v7

    div-float/2addr v6, v11

    div-float/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v10, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1148
    :cond_c8
    iget-boolean v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    if-nez v4, :cond_ce

    .line 1149
    const/high16 v2, 0x3f800000    # 1.0f

    .line 1152
    :cond_ce
    cmpl-float v4, v2, v9

    if-lez v4, :cond_44

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    cmpl-float v4, v2, v4

    if-eqz v4, :cond_44

    .line 1153
    if-eqz p2, :cond_f2

    .line 1154
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    if-nez v4, :cond_e9

    .line 1156
    new-instance v4, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-direct {v4, v5, v6}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;-><init>(Landroid/widget/ImageView;Lcom/theartofdev/edmodo/cropper/CropOverlayView;)V

    iput-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    .line 1159
    :cond_e9
    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAnimation:Lcom/theartofdev/edmodo/cropper/CropImageAnimation;

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageRect:Landroid/graphics/RectF;

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v5, v6}, Lcom/theartofdev/edmodo/cropper/CropImageAnimation;->setStartState(Landroid/graphics/RectF;Landroid/graphics/Matrix;)V

    .line 1162
    :cond_f2
    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    div-float v4, v2, v4

    invoke-direct {p0, v4}, Lcom/theartofdev/edmodo/cropper/CropImageView;->updateCropRectByZoomChange(F)V

    .line 1163
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 1165
    int-to-float v4, v3

    int-to-float v5, v1

    const/4 v6, 0x1

    invoke-direct {p0, v4, v5, v6, p2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    goto/16 :goto_44
.end method

.method private mapImageRectangleByImageMatrix(Landroid/graphics/RectF;)V
    .registers 5
    .param p1, "imgRect"    # Landroid/graphics/RectF;

    .prologue
    const/4 v2, 0x0

    .line 1259
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1260
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 1261
    return-void
.end method

.method private setBitmap(Landroid/graphics/Bitmap;Z)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "clearFull"    # Z

    .prologue
    .line 853
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 855
    :cond_c
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 857
    invoke-direct {p0, p2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->clearImage(Z)V

    .line 859
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    .line 860
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 862
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 864
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    if-eqz v0, :cond_38

    .line 865
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->resetCropOverlayView()V

    .line 866
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setCropOverlayVisibility()V

    .line 869
    :cond_38
    return-void
.end method

.method private setCropOverlayVisibility()V
    .registers 3

    .prologue
    .line 1294
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    if-eqz v0, :cond_12

    .line 1295
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    :goto_f
    invoke-virtual {v1, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setVisibility(I)V

    .line 1297
    :cond_12
    return-void

    .line 1295
    :cond_13
    const/4 v0, 0x4

    goto :goto_f
.end method

.method private setProgressBarVisibility()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 1303
    iget-boolean v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    if-eqz v2, :cond_1a

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_d

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_11

    :cond_d
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1a

    :cond_11
    const/4 v0, 0x1

    .line 1305
    .local v0, "visible":Z
    :goto_12
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_1c

    :goto_16
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1306
    return-void

    .end local v0    # "visible":Z
    :cond_1a
    move v0, v1

    .line 1303
    goto :goto_12

    .line 1305
    .restart local v0    # "visible":Z
    :cond_1c
    const/4 v1, 0x4

    goto :goto_16
.end method

.method private updateBitmapRect(Landroid/graphics/RectF;)V
    .registers 7
    .param p1, "bitmapRect"    # Landroid/graphics/RectF;

    .prologue
    const/4 v3, 0x0

    .line 1312
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_44

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_44

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_44

    .line 1315
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v1, v2, v3

    .line 1316
    .local v1, "scaleFactorWidth":F
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float v0, v2, v3

    .line 1317
    .local v0, "scaleFactorHeight":F
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4, v1, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowLimits(FFFF)V

    .line 1321
    .end local v0    # "scaleFactorHeight":F
    .end local v1    # "scaleFactorWidth":F
    :cond_44
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v4

    invoke-virtual {v2, p1, v3, v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setBitmapRect(Landroid/graphics/RectF;II)V

    .line 1322
    return-void
.end method

.method private updateCropRectByZoomChange(F)V
    .registers 9
    .param p1, "zoomChange"    # F

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 1176
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 1177
    .local v0, "cropRect":Landroid/graphics/RectF;
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    sub-float v1, v3, v4

    .line 1178
    .local v1, "xCenterOffset":F
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    sub-float v2, v3, v4

    .line 1179
    .local v2, "yCenterOffset":F
    mul-float v3, v1, p1

    sub-float v3, v1, v3

    mul-float v4, v2, p1

    sub-float v4, v2, v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/RectF;->offset(FF)V

    .line 1180
    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float/2addr v4, p1

    sub-float/2addr v3, v4

    div-float/2addr v3, v6

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v5

    mul-float/2addr v5, p1

    sub-float/2addr v4, v5

    div-float/2addr v4, v6

    invoke-virtual {v0, v3, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 1181
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3, v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 1182
    return-void
.end method


# virtual methods
.method public clearImage()V
    .registers 3

    .prologue
    .line 749
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->clearImage(Z)V

    .line 750
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 751
    return-void
.end method

.method public getAspectRatio()Landroid/util/Pair;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 381
    new-instance v0, Landroid/util/Pair;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method public getCropPoints()[F
    .registers 6

    .prologue
    .line 493
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v0

    .line 495
    .local v0, "cropWindowRect":Landroid/graphics/RectF;
    const/16 v3, 0x8

    new-array v2, v3, [F

    const/4 v3, 0x0

    iget v4, v0, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x1

    iget v4, v0, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x2

    iget v4, v0, Landroid/graphics/RectF;->right:F

    aput v4, v2, v3

    const/4 v3, 0x3

    iget v4, v0, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x4

    iget v4, v0, Landroid/graphics/RectF;->right:F

    aput v4, v2, v3

    const/4 v3, 0x5

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    aput v4, v2, v3

    const/4 v3, 0x6

    iget v4, v0, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x7

    iget v4, v0, Landroid/graphics/RectF;->bottom:F

    aput v4, v2, v3

    .line 506
    .local v2, "points":[F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 507
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 509
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3f
    array-length v3, v2

    if-ge v1, v3, :cond_4d

    .line 510
    aget v3, v2, v1

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    int-to-float v4, v4

    mul-float/2addr v3, v4

    aput v3, v2, v1

    .line 509
    add-int/lit8 v1, v1, 0x1

    goto :goto_3f

    .line 513
    :cond_4d
    return-object v2
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .registers 7

    .prologue
    .line 467
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_33

    .line 470
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v0

    .line 472
    .local v0, "points":[F
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v1, v3, v4

    .line 473
    .local v1, "orgWidth":I
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v2, v3, v4

    .line 476
    .local v2, "orgHeight":I
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 477
    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v3

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v4

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v5}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v5

    .line 476
    invoke-static/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->getRectFromPoints([FIIZII)Landroid/graphics/Rect;

    move-result-object v3

    .line 479
    .end local v0    # "points":[F
    .end local v1    # "orgWidth":I
    .end local v2    # "orgHeight":I
    :goto_32
    return-object v3

    :cond_33
    const/4 v3, 0x0

    goto :goto_32
.end method

.method public getCropShape()Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;
    .registers 2

    .prologue
    .line 283
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropShape()Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    move-result-object v0

    return-object v0
.end method

.method public getCroppedImage()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 544
    invoke-virtual {p0, v0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCroppedImage(II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getCroppedImage(II)Landroid/graphics/Bitmap;
    .registers 16
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    .line 560
    const/4 v12, 0x0

    .line 561
    .local v12, "croppedBitmap":Landroid/graphics/Bitmap;
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_4b

    .line 562
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    .line 563
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-eqz v0, :cond_4c

    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_4c

    .line 564
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v4, v0, v1

    .line 565
    .local v4, "orgWidth":I
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v5, v0, v1

    .line 566
    .local v5, "orgHeight":I
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v2

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 568
    invoke-virtual {v6}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v6

    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v7}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v7

    iget-object v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v8}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v8

    move v9, p1

    move v10, p2

    .line 566
    invoke-static/range {v0 .. v10}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropBitmap(Landroid/content/Context;Landroid/net/Uri;[FIIIZIIII)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 576
    .end local v4    # "orgWidth":I
    .end local v5    # "orgHeight":I
    :cond_4b
    :goto_4b
    return-object v12

    .line 571
    :cond_4c
    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v7

    iget v8, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 572
    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v9

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v10

    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v11

    .line 571
    invoke-static/range {v6 .. v11}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->cropBitmap(Landroid/graphics/Bitmap;[FIZII)Landroid/graphics/Bitmap;

    move-result-object v12

    goto :goto_4b
.end method

.method public getCroppedImageAsync()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 584
    invoke-virtual {p0, v0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCroppedImageAsync(II)V

    .line 585
    return-void
.end method

.method public getCroppedImageAsync(II)V
    .registers 9
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I

    .prologue
    const/4 v3, 0x0

    .line 600
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnGetCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_d

    .line 601
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "OnGetCroppedImageCompleteListener is not set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 603
    :cond_d
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->startCropWorkerTask(IILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V

    .line 604
    return-void
.end method

.method public getGuidelines()Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;
    .registers 2

    .prologue
    .line 367
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getGuidelines()Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    move-result-object v0

    return-object v0
.end method

.method public getImageResource()I
    .registers 2

    .prologue
    .line 450
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    return v0
.end method

.method public getImageUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 457
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getMaxZoom()I
    .registers 2

    .prologue
    .line 315
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    return v0
.end method

.method public getRotatedDegrees()I
    .registers 2

    .prologue
    .line 335
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    return v0
.end method

.method public getScaleType()Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;
    .registers 2

    .prologue
    .line 263
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    return-object v0
.end method

.method public isAutoZoomEnabled()Z
    .registers 2

    .prologue
    .line 297
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    return v0
.end method

.method public isFixAspectRatio()Z
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v0

    return v0
.end method

.method public isShowCropOverlay()Z
    .registers 2

    .prologue
    .line 431
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    return v0
.end method

.method public isShowProgressBar()Z
    .registers 2

    .prologue
    .line 411
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    return v0
.end method

.method onImageCroppingAsyncComplete(Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;)V
    .registers 5
    .param p1, "result"    # Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;

    .prologue
    const/4 v0, 0x0

    .line 830
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    .line 831
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 833
    iget-boolean v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->isSave:Z

    if-eqz v1, :cond_21

    .line 834
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSaveCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_17

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSaveCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    .line 835
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;

    move-object v0, v1

    .line 836
    .local v0, "listener":Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;
    :cond_17
    if-eqz v0, :cond_20

    .line 837
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->uri:Landroid/net/Uri;

    iget-object v2, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->error:Ljava/lang/Exception;

    invoke-interface {v0, p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;->onSaveCroppedImageComplete(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;Ljava/lang/Exception;)V

    .line 846
    .end local v0    # "listener":Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;
    :cond_20
    :goto_20
    return-void

    .line 840
    :cond_21
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnGetCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_2e

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnGetCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    .line 841
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;

    move-object v0, v1

    .line 842
    .local v0, "listener":Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;
    :cond_2e
    if-eqz v0, :cond_20

    .line 843
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    iget-object v2, p1, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask$Result;->error:Ljava/lang/Exception;

    invoke-interface {v0, p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;->onGetCroppedImageComplete(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/graphics/Bitmap;Ljava/lang/Exception;)V

    goto :goto_20
.end method

.method protected onLayout(ZIIII)V
    .registers 10
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v3, 0x0

    .line 1093
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 1095
    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutWidth:I

    if-lez v1, :cond_4b

    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutHeight:I

    if-lez v1, :cond_4b

    .line 1097
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 1098
    .local v0, "origParams":Landroid/view/ViewGroup$LayoutParams;
    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutWidth:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 1099
    iget v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutHeight:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1100
    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1102
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_45

    .line 1103
    sub-int v1, p4, p2

    int-to-float v1, v1

    sub-int v2, p5, p3

    int-to-float v2, v2

    invoke-direct {p0, v1, v2, v3, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 1106
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_44

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mRestoreCropWindowRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_44

    .line 1107
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mRestoreCropWindowRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 1108
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mRestoreCropWindowRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 1109
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mRestoreCropWindowRect:Landroid/graphics/RectF;

    .line 1110
    invoke-direct {p0, v3, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView;->handleCropWindowChanged(ZZ)V

    .line 1118
    .end local v0    # "origParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_44
    :goto_44
    return-void

    .line 1113
    .restart local v0    # "origParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_45
    sget-object v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT_F:Landroid/graphics/RectF;

    invoke-direct {p0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->updateBitmapRect(Landroid/graphics/RectF;)V

    goto :goto_44

    .line 1116
    .end local v0    # "origParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_4b
    sget-object v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->EMPTY_RECT_F:Landroid/graphics/RectF;

    invoke-direct {p0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->updateBitmapRect(Landroid/graphics/RectF;)V

    goto :goto_44
.end method

.method protected onMeasure(II)V
    .registers 20
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 1034
    invoke-super/range {p0 .. p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 1036
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v11

    .line 1037
    .local v11, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v12

    .line 1038
    .local v12, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 1039
    .local v4, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 1041
    .local v5, "heightSize":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v13, :cond_ab

    .line 1044
    if-nez v5, :cond_23

    .line 1045
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 1051
    :cond_23
    const-wide/high16 v8, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 1052
    .local v8, "viewToBitmapWidthRatio":D
    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    .line 1055
    .local v6, "viewToBitmapHeightRatio":D
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    if-ge v12, v13, :cond_3d

    .line 1056
    int-to-double v13, v12

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    int-to-double v15, v15

    div-double v8, v13, v15

    .line 1058
    :cond_3d
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    if-ge v5, v13, :cond_53

    .line 1059
    int-to-double v13, v5

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v15

    int-to-double v15, v15

    div-double v6, v13, v15

    .line 1063
    :cond_53
    const-wide/high16 v13, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v13, v8, v13

    if-nez v13, :cond_5f

    const-wide/high16 v13, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    cmpl-double v13, v6, v13

    if-eqz v13, :cond_9a

    .line 1064
    :cond_5f
    cmpg-double v13, v8, v6

    if-gtz v13, :cond_8d

    .line 1065
    move v2, v12

    .line 1066
    .local v2, "desiredWidth":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    int-to-double v13, v13

    mul-double/2addr v13, v8

    double-to-int v1, v13

    .line 1077
    .local v1, "desiredHeight":I
    :goto_6f
    invoke-static {v11, v12, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getOnMeasureSpec(III)I

    move-result v10

    .line 1078
    .local v10, "width":I
    invoke-static {v4, v5, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getOnMeasureSpec(III)I

    move-result v3

    .line 1080
    .local v3, "height":I
    move-object/from16 v0, p0

    iput v10, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutWidth:I

    .line 1081
    move-object/from16 v0, p0

    iput v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutHeight:I

    .line 1083
    move-object/from16 v0, p0

    iget v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutWidth:I

    move-object/from16 v0, p0

    iget v14, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLayoutHeight:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setMeasuredDimension(II)V

    .line 1088
    .end local v1    # "desiredHeight":I
    .end local v2    # "desiredWidth":I
    .end local v3    # "height":I
    .end local v6    # "viewToBitmapHeightRatio":D
    .end local v8    # "viewToBitmapWidthRatio":D
    .end local v10    # "width":I
    :goto_8c
    return-void

    .line 1068
    .restart local v6    # "viewToBitmapHeightRatio":D
    .restart local v8    # "viewToBitmapWidthRatio":D
    :cond_8d
    move v1, v5

    .line 1069
    .restart local v1    # "desiredHeight":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    int-to-double v13, v13

    mul-double/2addr v13, v6

    double-to-int v2, v13

    .restart local v2    # "desiredWidth":I
    goto :goto_6f

    .line 1073
    .end local v1    # "desiredHeight":I
    .end local v2    # "desiredWidth":I
    :cond_9a
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 1074
    .restart local v2    # "desiredWidth":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v13}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .restart local v1    # "desiredHeight":I
    goto :goto_6f

    .line 1086
    .end local v1    # "desiredHeight":I
    .end local v2    # "desiredWidth":I
    .end local v6    # "viewToBitmapHeightRatio":D
    .end local v8    # "viewToBitmapWidthRatio":D
    :cond_ab
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setMeasuredDimension(II)V

    goto :goto_8c
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 11
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    const/4 v7, 0x0

    const/4 v8, 0x1

    .line 977
    instance-of v6, p1, Landroid/os/Bundle;

    if-eqz v6, :cond_c9

    move-object v1, p1

    .line 978
    check-cast v1, Landroid/os/Bundle;

    .line 980
    .local v1, "bundle":Landroid/os/Bundle;
    const/4 v0, 0x0

    .line 981
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const-string v6, "LOADED_IMAGE_URI"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    .line 982
    .local v5, "uri":Landroid/net/Uri;
    if-eqz v5, :cond_a1

    .line 983
    const-string v6, "LOADED_IMAGE_STATE_BITMAP_KEY"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 984
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_50

    .line 985
    sget-object v6, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mStateBitmap:Landroid/util/Pair;

    if-eqz v6, :cond_9f

    sget-object v6, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mStateBitmap:Landroid/util/Pair;

    iget-object v6, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9f

    sget-object v6, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mStateBitmap:Landroid/util/Pair;

    iget-object v6, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v6, Ljava/lang/ref/WeakReference;

    .line 986
    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    move-object v4, v6

    .line 987
    .local v4, "stateBitmap":Landroid/graphics/Bitmap;
    :goto_39
    if-eqz v4, :cond_50

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v6

    if-nez v6, :cond_50

    .line 988
    sput-object v7, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mStateBitmap:Landroid/util/Pair;

    .line 989
    invoke-direct {p0, v4, v8}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    .line 990
    iput-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    .line 991
    const-string v6, "LOADED_SAMPLE_SIZE"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    .line 994
    .end local v4    # "stateBitmap":Landroid/graphics/Bitmap;
    :cond_50
    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-nez v6, :cond_57

    .line 995
    invoke-virtual {p0, v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setImageUriAsync(Landroid/net/Uri;)V

    .line 1015
    .end local v2    # "key":Ljava/lang/String;
    :cond_57
    :goto_57
    const-string v6, "DEGREES_ROTATED"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 1017
    iget-object v7, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const-string v6, "INITIAL_CROP_RECT"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/graphics/Rect;

    invoke-virtual {v7, v6}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 1019
    const-string v6, "CROP_WINDOW_RECT"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/graphics/RectF;

    iput-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mRestoreCropWindowRect:Landroid/graphics/RectF;

    .line 1021
    iget-object v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const-string v7, "CROP_SHAPE"

    invoke-virtual {v1, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->valueOf(Ljava/lang/String;)Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)V

    .line 1023
    const-string v6, "CROP_AUTO_ZOOM_ENABLED"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    .line 1024
    const-string v6, "CROP_MAX_ZOOM"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    .line 1026
    const-string v6, "instanceState"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    invoke-super {p0, v6}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 1030
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v5    # "uri":Landroid/net/Uri;
    :goto_9e
    return-void

    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bundle":Landroid/os/Bundle;
    .restart local v2    # "key":Ljava/lang/String;
    .restart local v5    # "uri":Landroid/net/Uri;
    :cond_9f
    move-object v4, v7

    .line 986
    goto :goto_39

    .line 999
    .end local v2    # "key":Ljava/lang/String;
    :cond_a1
    const-string v6, "LOADED_IMAGE_RESOURCE"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 1000
    .local v3, "resId":I
    if-lez v3, :cond_ad

    .line 1001
    invoke-virtual {p0, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setImageResource(I)V

    goto :goto_57

    .line 1003
    :cond_ad
    const-string v6, "SET_BITMAP"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    check-cast v0, Landroid/graphics/Bitmap;

    .line 1004
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_bb

    .line 1005
    invoke-direct {p0, v0, v8}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    goto :goto_57

    .line 1007
    :cond_bb
    const-string v6, "LOADING_IMAGE_URI"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    .end local v5    # "uri":Landroid/net/Uri;
    check-cast v5, Landroid/net/Uri;

    .line 1008
    .restart local v5    # "uri":Landroid/net/Uri;
    if-eqz v5, :cond_57

    .line 1009
    invoke-virtual {p0, v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setImageUriAsync(Landroid/net/Uri;)V

    goto :goto_57

    .line 1028
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "bundle":Landroid/os/Bundle;
    .end local v3    # "resId":I
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_c9
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_9e
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 7

    .prologue
    .line 940
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 941
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "instanceState"

    invoke-super {p0}, Landroid/widget/FrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 942
    const-string v3, "LOADED_IMAGE_URI"

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 943
    const-string v3, "LOADED_IMAGE_RESOURCE"

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 944
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-nez v3, :cond_2c

    iget v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    const/4 v4, 0x1

    if-ge v3, v4, :cond_2c

    .line 945
    const-string v3, "SET_BITMAP"

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 947
    :cond_2c
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-eqz v3, :cond_4f

    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_4f

    .line 948
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    .line 949
    .local v1, "key":Ljava/lang/String;
    new-instance v3, Landroid/util/Pair;

    new-instance v4, Ljava/lang/ref/WeakReference;

    iget-object v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v4, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v3, v1, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v3, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->mStateBitmap:Landroid/util/Pair;

    .line 950
    const-string v3, "LOADED_IMAGE_STATE_BITMAP_KEY"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 952
    .end local v1    # "key":Ljava/lang/String;
    :cond_4f
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    if-eqz v3, :cond_66

    .line 953
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;

    .line 954
    .local v2, "task":Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;
    if-eqz v2, :cond_66

    .line 955
    const-string v3, "LOADING_IMAGE_URI"

    invoke-virtual {v2}, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 958
    .end local v2    # "task":Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;
    :cond_66
    const-string v3, "LOADED_SAMPLE_SIZE"

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 959
    const-string v3, "DEGREES_ROTATED"

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 960
    const-string v3, "INITIAL_CROP_RECT"

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getInitialCropWindowRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 962
    sget-object v3, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 964
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 965
    iget-object v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    sget-object v4, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    invoke-virtual {v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 967
    const-string v3, "CROP_WINDOW_RECT"

    sget-object v4, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 968
    const-string v3, "CROP_SHAPE"

    iget-object v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropShape()Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    move-result-object v4

    invoke-virtual {v4}, Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    const-string v3, "CROP_AUTO_ZOOM_ENABLED"

    iget-boolean v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 970
    const-string v3, "CROP_MAX_ZOOM"

    iget v4, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 972
    return-object v0
.end method

.method onSetImageUriAsyncComplete(Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;)V
    .registers 5
    .param p1, "result"    # Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;

    .prologue
    const/4 v0, 0x0

    .line 806
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    .line 807
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 809
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->error:Ljava/lang/Exception;

    if-nez v1, :cond_1c

    .line 810
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->bitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    .line 811
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->uri:Landroid/net/Uri;

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    .line 812
    iget v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->loadSampleSize:I

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    .line 813
    iget v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->degreesRotated:I

    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 816
    :cond_1c
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSetImageUriCompleteListener:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSetImageUriCompleteListener:Ljava/lang/ref/WeakReference;

    .line 817
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;

    move-object v0, v1

    .line 818
    .local v0, "listener":Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;
    :cond_29
    if-eqz v0, :cond_32

    .line 819
    iget-object v1, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->uri:Landroid/net/Uri;

    iget-object v2, p1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask$Result;->error:Ljava/lang/Exception;

    invoke-interface {v0, p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;->onSetImageUriComplete(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;Ljava/lang/Exception;)V

    .line 821
    :cond_32
    return-void
.end method

.method public resetCropRect()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 530
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 531
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 532
    iput v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    .line 533
    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 534
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1, v2, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 535
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->resetCropWindowRect()V

    .line 536
    return-void
.end method

.method public rotateImage(I)V
    .registers 8
    .param p1, "degrees"    # I

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 760
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_6b

    .line 761
    rem-int/lit8 v0, p1, 0x5a

    if-nez v0, :cond_73

    .line 763
    sget-object v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getCropWindowRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 765
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 766
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageInverseMatrix:Landroid/graphics/Matrix;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 768
    iput v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 769
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 770
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    .line 771
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 772
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    if-ltz v0, :cond_6c

    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    rem-int/lit16 v0, v0, 0x168

    :goto_39
    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 774
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1, v4, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 776
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageMatrix:Landroid/graphics/Matrix;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 778
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->resetCropOverlayView()V

    .line 779
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    sget-object v1, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->RECT:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropWindowRect(Landroid/graphics/RectF;)V

    .line 780
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1, v4, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    .line 781
    invoke-direct {p0, v2, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->handleCropWindowChanged(ZZ)V

    .line 794
    :cond_6b
    :goto_6b
    return-void

    .line 772
    :cond_6c
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    rem-int/lit16 v0, v0, 0x168

    add-int/lit16 v0, v0, 0x168

    goto :goto_39

    .line 785
    :cond_73
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 786
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    if-ltz v0, :cond_9b

    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    rem-int/lit16 v0, v0, 0x168

    :goto_80
    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 788
    iput v5, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 789
    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    iput v3, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 790
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->resetCropOverlayView()V

    .line 791
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {p0, v0, v1, v4, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->applyImageMatrix(FFZZ)V

    goto :goto_6b

    .line 786
    :cond_9b
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    rem-int/lit16 v0, v0, 0x168

    add-int/lit16 v0, v0, 0x168

    goto :goto_80
.end method

.method public saveCroppedImageAsync(Landroid/net/Uri;)V
    .registers 8
    .param p1, "saveUri"    # Landroid/net/Uri;

    .prologue
    const/4 v4, 0x0

    .line 614
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x5a

    move-object v0, p0

    move-object v1, p1

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->saveCroppedImageAsync(Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;III)V

    .line 615
    return-void
.end method

.method public saveCroppedImageAsync(Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 10
    .param p1, "saveUri"    # Landroid/net/Uri;
    .param p2, "saveCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "saveCompressQuality"    # I

    .prologue
    const/4 v4, 0x0

    .line 626
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->saveCroppedImageAsync(Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;III)V

    .line 627
    return-void
.end method

.method public saveCroppedImageAsync(Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;III)V
    .registers 12
    .param p1, "saveUri"    # Landroid/net/Uri;
    .param p2, "saveCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "saveCompressQuality"    # I
    .param p4, "reqWidth"    # I
    .param p5, "reqHeight"    # I

    .prologue
    .line 645
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSaveCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_c

    .line 646
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "mOnSaveCroppedImageCompleteListener is not set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    move-object v0, p0

    move v1, p4

    move v2, p5

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    .line 648
    invoke-virtual/range {v0 .. v5}, Lcom/theartofdev/edmodo/cropper/CropImageView;->startCropWorkerTask(IILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V

    .line 649
    return-void
.end method

.method public setAspectRatio(II)V
    .registers 4
    .param p1, "aspectRatioX"    # I
    .param p2, "aspectRatioY"    # I

    .prologue
    .line 391
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setAspectRatioX(I)V

    .line 392
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setAspectRatioY(I)V

    .line 393
    return-void
.end method

.method public setAutoZoomEnabled(Z)V
    .registers 4
    .param p1, "autoZoomEnabled"    # Z

    .prologue
    const/4 v1, 0x0

    .line 304
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    if-eq v0, p1, :cond_f

    .line 305
    iput-boolean p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mAutoZoomEnabled:Z

    .line 306
    invoke-direct {p0, v1, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->handleCropWindowChanged(ZZ)V

    .line 307
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 309
    :cond_f
    return-void
.end method

.method public setCropRect(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 523
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 524
    return-void
.end method

.method public setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)V
    .registers 3
    .param p1, "cropShape"    # Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;

    .prologue
    .line 290
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setCropShape(Lcom/theartofdev/edmodo/cropper/CropImageView$CropShape;)V

    .line 291
    return-void
.end method

.method public setFixedAspectRatio(Z)V
    .registers 3
    .param p1, "fixAspectRatio"    # Z

    .prologue
    .line 360
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setFixedAspectRatio(Z)V

    .line 361
    return-void
.end method

.method public setGuidelines(Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;)V
    .registers 3
    .param p1, "guidelines"    # Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setGuidelines(Lcom/theartofdev/edmodo/cropper/CropImageView$Guidelines;)V

    .line 375
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 681
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 682
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    .line 683
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Landroid/media/ExifInterface;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "exif"    # Landroid/media/ExifInterface;

    .prologue
    .line 696
    if-eqz p1, :cond_19

    if-eqz p2, :cond_19

    .line 697
    invoke-static {p1, p2}, Lcom/theartofdev/edmodo/cropper/BitmapUtils;->rotateBitmapByExif(Landroid/graphics/Bitmap;Landroid/media/ExifInterface;)Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;

    move-result-object v0

    .line 698
    .local v0, "result":Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
    iget-object v1, v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 699
    .local v1, "setBitmap":Landroid/graphics/Bitmap;
    iget v2, v0, Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;->degrees:I

    iput v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    .line 703
    .end local v0    # "result":Lcom/theartofdev/edmodo/cropper/BitmapUtils$RotateBitmapResult;
    :goto_e
    iget-object v2, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 704
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    .line 705
    return-void

    .line 701
    .end local v1    # "setBitmap":Landroid/graphics/Bitmap;
    :cond_19
    move-object v1, p1

    .restart local v1    # "setBitmap":Landroid/graphics/Bitmap;
    goto :goto_e
.end method

.method public setImageResource(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 713
    if-eqz p1, :cond_16

    .line 714
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 715
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 716
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Z)V

    .line 717
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageResource:I

    .line 719
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_16
    return-void
.end method

.method public setImageUriAsync(Landroid/net/Uri;)V
    .registers 6
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 729
    if-eqz p1, :cond_3b

    .line 730
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_3c

    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;

    move-object v0, v1

    .line 731
    .local v0, "currentTask":Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;
    :goto_11
    if-eqz v0, :cond_16

    .line 733
    invoke-virtual {v0, v3}, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;->cancel(Z)Z

    .line 737
    :cond_16
    invoke-direct {p0, v3}, Lcom/theartofdev/edmodo/cropper/CropImageView;->clearImage(Z)V

    .line 738
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v1, v2}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setInitialCropWindowRect(Landroid/graphics/Rect;)V

    .line 739
    new-instance v1, Ljava/lang/ref/WeakReference;

    new-instance v2, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;

    invoke-direct {v2, p0, p1}, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;-><init>(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;)V

    invoke-direct {v1, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    .line 740
    iget-object v1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapLoadingWorkerTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 741
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 743
    .end local v0    # "currentTask":Lcom/theartofdev/edmodo/cropper/BitmapLoadingWorkerTask;
    :cond_3b
    return-void

    :cond_3c
    move-object v0, v2

    .line 730
    goto :goto_11
.end method

.method public setMaxZoom(I)V
    .registers 4
    .param p1, "maxZoom"    # I

    .prologue
    const/4 v1, 0x0

    .line 322
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    if-eq v0, p1, :cond_11

    if-lez p1, :cond_11

    .line 323
    iput p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mMaxZoom:I

    .line 324
    invoke-direct {p0, v1, v1}, Lcom/theartofdev/edmodo/cropper/CropImageView;->handleCropWindowChanged(ZZ)V

    .line 325
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->invalidate()V

    .line 327
    :cond_11
    return-void
.end method

.method public setOnGetCroppedImageCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/theartofdev/edmodo/cropper/CropImageView$OnGetCroppedImageCompleteListener;

    .prologue
    .line 664
    if-eqz p1, :cond_a

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    :goto_7
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnGetCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    .line 665
    return-void

    .line 664
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setOnSaveCroppedImageCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/theartofdev/edmodo/cropper/CropImageView$OnSaveCroppedImageCompleteListener;

    .prologue
    .line 672
    if-eqz p1, :cond_a

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    :goto_7
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSaveCroppedImageCompleteListener:Ljava/lang/ref/WeakReference;

    .line 673
    return-void

    .line 672
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setOnSetImageUriCompleteListener(Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/theartofdev/edmodo/cropper/CropImageView$OnSetImageUriCompleteListener;

    .prologue
    .line 656
    if-eqz p1, :cond_a

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    :goto_7
    iput-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mOnSetImageUriCompleteListener:Ljava/lang/ref/WeakReference;

    .line 657
    return-void

    .line 656
    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setRotatedDegrees(I)V
    .registers 3
    .param p1, "degrees"    # I

    .prologue
    .line 344
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    if-eq v0, p1, :cond_b

    .line 345
    iget v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    sub-int v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->rotateImage(I)V

    .line 347
    :cond_b
    return-void
.end method

.method public setScaleType(Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .prologue
    .line 270
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    if-eq p1, v0, :cond_17

    .line 271
    iput-object p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mScaleType:Lcom/theartofdev/edmodo/cropper/CropImageView$ScaleType;

    .line 272
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoom:F

    .line 273
    const/4 v0, 0x0

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetY:F

    iput v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mZoomOffsetX:F

    .line 274
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->resetCropOverlayView()V

    .line 275
    invoke-virtual {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->requestLayout()V

    .line 277
    :cond_17
    return-void
.end method

.method public setShowCropOverlay(Z)V
    .registers 3
    .param p1, "showCropOverlay"    # Z

    .prologue
    .line 440
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    if-eq v0, p1, :cond_9

    .line 441
    iput-boolean p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowCropOverlay:Z

    .line 442
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setCropOverlayVisibility()V

    .line 444
    :cond_9
    return-void
.end method

.method public setShowProgressBar(Z)V
    .registers 3
    .param p1, "showProgressBar"    # Z

    .prologue
    .line 419
    iget-boolean v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    if-eq v0, p1, :cond_9

    .line 420
    iput-boolean p1, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mShowProgressBar:Z

    .line 421
    invoke-direct {p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 423
    :cond_9
    return-void
.end method

.method public setSnapRadius(F)V
    .registers 3
    .param p1, "snapRadius"    # F

    .prologue
    .line 401
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_a

    .line 402
    iget-object v0, p0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v0, p1}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->setSnapRadius(F)V

    .line 404
    :cond_a
    return-void
.end method

.method public startCropWorkerTask(IILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 27
    .param p1, "reqWidth"    # I
    .param p2, "reqHeight"    # I
    .param p3, "saveUri"    # Landroid/net/Uri;
    .param p4, "saveCompressFormat"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p5, "saveCompressQuality"    # I

    .prologue
    .line 915
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->clearAnimation()V

    .line 917
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_a0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;

    move-object/from16 v20, v2

    .line 918
    .local v20, "currentTask":Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;
    :goto_19
    if-eqz v20, :cond_21

    .line 920
    const/4 v2, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->cancel(Z)Z

    .line 923
    :cond_21
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v7, v2, v3

    .line 924
    .local v7, "orgWidth":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    mul-int v8, v2, v3

    .line 925
    .local v8, "orgHeight":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    if-eqz v2, :cond_a4

    move-object/from16 v0, p0

    iget v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedSampleSize:I

    const/4 v3, 0x1

    if-le v2, v3, :cond_a4

    .line 926
    new-instance v17, Ljava/lang/ref/WeakReference;

    new-instance v2, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mLoadedImageUri:Landroid/net/Uri;

    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v5

    move-object/from16 v0, p0

    iget v6, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 928
    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v10

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v11

    move-object/from16 v3, p0

    move/from16 v12, p1

    move/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move/from16 v16, p5

    invoke-direct/range {v2 .. v16}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;-><init>(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/net/Uri;[FIIIZIIIILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    .line 934
    :goto_8c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 935
    invoke-direct/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->setProgressBarVisibility()V

    .line 936
    return-void

    .line 917
    .end local v7    # "orgWidth":I
    .end local v8    # "orgHeight":I
    .end local v20    # "currentTask":Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;
    :cond_a0
    const/16 v20, 0x0

    goto/16 :goto_19

    .line 931
    .restart local v7    # "orgWidth":I
    .restart local v8    # "orgHeight":I
    .restart local v20    # "currentTask":Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;
    :cond_a4
    new-instance v2, Ljava/lang/ref/WeakReference;

    new-instance v9, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual/range {p0 .. p0}, Lcom/theartofdev/edmodo/cropper/CropImageView;->getCropPoints()[F

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mDegreesRotated:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    .line 932
    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->isFixAspectRatio()Z

    move-result v14

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioX()I

    move-result v15

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mCropOverlayView:Lcom/theartofdev/edmodo/cropper/CropOverlayView;

    invoke-virtual {v3}, Lcom/theartofdev/edmodo/cropper/CropOverlayView;->getAspectRatioY()I

    move-result v16

    move-object/from16 v10, p0

    move-object/from16 v17, p3

    move-object/from16 v18, p4

    move/from16 v19, p5

    invoke-direct/range {v9 .. v19}, Lcom/theartofdev/edmodo/cropper/BitmapCroppingWorkerTask;-><init>(Lcom/theartofdev/edmodo/cropper/CropImageView;Landroid/graphics/Bitmap;[FIZIILandroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;I)V

    invoke-direct {v2, v9}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/theartofdev/edmodo/cropper/CropImageView;->mBitmapCroppingWorkerTask:Ljava/lang/ref/WeakReference;

    goto :goto_8c
.end method
