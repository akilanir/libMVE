.class public Lpl/droidsonroids/gif/GifTextureView;
.super Landroid/view/TextureView;
.source "GifTextureView.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/gif/GifTextureView$RenderThread;
    }
.end annotation


# static fields
.field private static final sScaleTypeArray:[Landroid/widget/ImageView$ScaleType;


# instance fields
.field private mFreezesAnimation:Z

.field private mInputSource:Lpl/droidsonroids/gif/InputSource;

.field private mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mSpeedFactor:F

.field private final mTransform:Landroid/graphics/Matrix;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 76
    const/16 v0, 0x8

    new-array v0, v0, [Landroid/widget/ImageView$ScaleType;

    const/4 v1, 0x0

    sget-object v2, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lpl/droidsonroids/gif/GifTextureView;->sScaleTypeArray:[Landroid/widget/ImageView$ScaleType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 47
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    .line 53
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Lpl/droidsonroids/gif/GifTextureView;->init(Landroid/util/AttributeSet;II)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 61
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    .line 53
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    .line 62
    invoke-direct {p0, p2, v1, v1}, Lpl/droidsonroids/gif/GifTextureView;->init(Landroid/util/AttributeSet;II)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 66
    invoke-direct {p0, p1, p2, p3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    .line 53
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Lpl/droidsonroids/gif/GifTextureView;->init(Landroid/util/AttributeSet;II)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 72
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 47
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 48
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    .line 53
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    .line 73
    invoke-direct {p0, p2, p3, p4}, Lpl/droidsonroids/gif/GifTextureView;->init(Landroid/util/AttributeSet;II)V

    .line 74
    return-void
.end method

.method static synthetic access$000(Lpl/droidsonroids/gif/GifTextureView;)Lpl/droidsonroids/gif/InputSource;
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView;

    .prologue
    .line 45
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    return-object v0
.end method

.method static synthetic access$100(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView;
    .param p1, "x1"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifTextureView;->setSuperSurfaceTextureListener(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V

    return-void
.end method

.method static synthetic access$300(Lpl/droidsonroids/gif/GifTextureView;Lpl/droidsonroids/gif/GifInfoHandle;)V
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView;
    .param p1, "x1"    # Lpl/droidsonroids/gif/GifInfoHandle;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/GifTextureView;->updateTextureViewSize(Lpl/droidsonroids/gif/GifInfoHandle;)V

    return-void
.end method

.method static synthetic access$400(Lpl/droidsonroids/gif/GifTextureView;)F
    .registers 2
    .param p0, "x0"    # Lpl/droidsonroids/gif/GifTextureView;

    .prologue
    .line 45
    iget v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    return v0
.end method

.method private static findSource(Landroid/content/res/TypedArray;)Lpl/droidsonroids/gif/InputSource;
    .registers 6
    .param p0, "textureViewAttributes"    # Landroid/content/res/TypedArray;

    .prologue
    .line 144
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 145
    .local v1, "value":Landroid/util/TypedValue;
    sget v2, Lpl/droidsonroids/gif/R$styleable;->GifTextureView_gifSource:I

    invoke-virtual {p0, v2, v1}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 146
    const/4 v2, 0x0

    .line 157
    :goto_e
    return-object v2

    .line 149
    :cond_f
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_58

    .line 150
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "resourceTypeName":Ljava/lang/String;
    sget-object v2, Lpl/droidsonroids/gif/GifViewUtils;->SUPPORTED_RESOURCE_TYPE_NAMES:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_31

    .line 152
    new-instance v2, Lpl/droidsonroids/gif/InputSource$ResourcesSource;

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {v2, v3, v4}, Lpl/droidsonroids/gif/InputSource$ResourcesSource;-><init>(Landroid/content/res/Resources;I)V

    goto :goto_e

    .line 153
    :cond_31
    const-string v2, "string"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_58

    .line 154
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected string, drawable, mipmap or raw resource type. \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' is not supported"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    .end local v0    # "resourceTypeName":Ljava/lang/String;
    :cond_58
    new-instance v2, Lpl/droidsonroids/gif/InputSource$AssetSource;

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    iget-object v4, v1, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lpl/droidsonroids/gif/InputSource$AssetSource;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    goto :goto_e
.end method

.method private init(Landroid/util/AttributeSet;II)V
    .registers 10
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    const/4 v5, 0x0

    .line 88
    if-eqz p1, :cond_5b

    .line 89
    const-string v2, "http://schemas.android.com/apk/res/android"

    const-string v3, "scaleType"

    const/4 v4, -0x1

    invoke-interface {p1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 90
    .local v0, "scaleTypeIndex":I
    if-ltz v0, :cond_19

    sget-object v2, Lpl/droidsonroids/gif/GifTextureView;->sScaleTypeArray:[Landroid/widget/ImageView$ScaleType;

    array-length v2, v2

    if-ge v0, v2, :cond_19

    .line 91
    sget-object v2, Lpl/droidsonroids/gif/GifTextureView;->sScaleTypeArray:[Landroid/widget/ImageView$ScaleType;

    aget-object v2, v2, v0

    iput-object v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 93
    :cond_19
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lpl/droidsonroids/gif/R$styleable;->GifTextureView:[I

    invoke-virtual {v2, p1, v3, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 95
    .local v1, "textureViewAttributes":Landroid/content/res/TypedArray;
    invoke-static {v1}, Lpl/droidsonroids/gif/GifTextureView;->findSource(Landroid/content/res/TypedArray;)Lpl/droidsonroids/gif/InputSource;

    move-result-object v2

    iput-object v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 96
    sget v2, Lpl/droidsonroids/gif/R$styleable;->GifTextureView_isOpaque:I

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-super {p0, v2}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 97
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 98
    invoke-static {p0, p1, p2, p3}, Lpl/droidsonroids/gif/GifViewUtils;->isFreezingAnimation(Landroid/view/View;Landroid/util/AttributeSet;II)Z

    move-result v2

    iput-boolean v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mFreezesAnimation:Z

    .line 102
    .end local v0    # "scaleTypeIndex":I
    .end local v1    # "textureViewAttributes":Landroid/content/res/TypedArray;
    :goto_3b
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->isInEditMode()Z

    move-result v2

    if-nez v2, :cond_5a

    .line 103
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "pl_droidsonroids_gif_surface"

    invoke-static {v2, v3}, Lpl/droidsonroids/gif/LibraryLoader;->loadLibrary(Landroid/content/Context;Ljava/lang/String;)V

    .line 104
    new-instance v2, Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-direct {v2, p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;-><init>(Lpl/droidsonroids/gif/GifTextureView;)V

    iput-object v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .line 105
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    if-eqz v2, :cond_5a

    .line 106
    iget-object v2, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-virtual {v2}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->start()V

    .line 109
    :cond_5a
    return-void

    .line 100
    :cond_5b
    invoke-super {p0, v5}, Landroid/view/TextureView;->setOpaque(Z)V

    goto :goto_3b
.end method

.method private setSuperSurfaceTextureListener(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)V
    .registers 2
    .param p1, "renderThread"    # Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .prologue
    .line 259
    invoke-super {p0, p1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 260
    return-void
.end method

.method private updateTextureViewSize(Lpl/droidsonroids/gif/GifInfoHandle;)V
    .registers 15
    .param p1, "gifInfoHandle"    # Lpl/droidsonroids/gif/GifInfoHandle;

    .prologue
    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/high16 v11, 0x40000000    # 2.0f

    .line 351
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 352
    .local v5, "transform":Landroid/graphics/Matrix;
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->getWidth()I

    move-result v8

    int-to-float v7, v8

    .line 353
    .local v7, "viewWidth":F
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->getHeight()I

    move-result v8

    int-to-float v6, v8

    .line 355
    .local v6, "viewHeight":F
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v8

    int-to-float v8, v8

    div-float v2, v8, v7

    .line 356
    .local v2, "scaleX":F
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float v3, v8, v6

    .line 357
    .local v3, "scaleY":F
    new-instance v4, Landroid/graphics/RectF;

    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v9

    int-to-float v9, v9

    invoke-direct {v4, v10, v10, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 358
    .local v4, "src":Landroid/graphics/RectF;
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v10, v10, v7, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 359
    .local v0, "dst":Landroid/graphics/RectF;
    sget-object v8, Lpl/droidsonroids/gif/GifTextureView$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v9, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v9}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_ae

    .line 394
    :goto_43
    invoke-super {p0, v5}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 395
    :pswitch_46
    return-void

    .line 361
    :pswitch_47
    div-float v8, v7, v11

    div-float v9, v6, v11

    invoke-virtual {v5, v2, v3, v8, v9}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_43

    .line 364
    :pswitch_4f
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v8

    div-float v1, v12, v8

    .line 365
    .local v1, "scaleRef":F
    mul-float v8, v1, v2

    mul-float v9, v1, v3

    div-float v10, v7, v11

    div-float v11, v6, v11

    invoke-virtual {v5, v8, v9, v10, v11}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_43

    .line 368
    .end local v1    # "scaleRef":F
    :pswitch_61
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v8, v8, v7

    if-gtz v8, :cond_81

    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v8, v8, v6

    if-gtz v8, :cond_81

    .line 369
    const/high16 v1, 0x3f800000    # 1.0f

    .line 373
    .restart local v1    # "scaleRef":F
    :goto_75
    mul-float v8, v1, v2

    mul-float v9, v1, v3

    div-float v10, v7, v11

    div-float v11, v6, v11

    invoke-virtual {v5, v8, v9, v10, v11}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_43

    .line 371
    .end local v1    # "scaleRef":F
    :cond_81
    div-float v8, v12, v2

    div-float v9, v12, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .restart local v1    # "scaleRef":F
    goto :goto_75

    .line 376
    .end local v1    # "scaleRef":F
    :pswitch_8a
    sget-object v8, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v5, v4, v0, v8}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 377
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_43

    .line 380
    :pswitch_93
    sget-object v8, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v5, v4, v0, v8}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 381
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_43

    .line 384
    :pswitch_9c
    sget-object v8, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v5, v4, v0, v8}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 385
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_43

    .line 390
    :pswitch_a5
    iget-object v8, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    invoke-virtual {v5, v8}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 391
    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_43

    .line 359
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_47
        :pswitch_4f
        :pswitch_61
        :pswitch_8a
        :pswitch_93
        :pswitch_9c
        :pswitch_46
        :pswitch_a5
    .end packed-switch
.end method


# virtual methods
.method public getIOException()Ljava/io/IOException;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 324
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$500(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Ljava/io/IOException;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 325
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mIOException:Ljava/io/IOException;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$500(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Ljava/io/IOException;

    move-result-object v0

    .line 327
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNativeErrorCode()I

    move-result v0

    invoke-static {v0}, Lpl/droidsonroids/gif/GifIOException;->fromCode(I)Lpl/droidsonroids/gif/GifIOException;

    move-result-object v0

    goto :goto_e
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .registers 2

    .prologue
    .line 347
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;
    .registers 2

    .prologue
    .line 129
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 3
    .param p1, "transform"    # Landroid/graphics/Matrix;

    .prologue
    .line 430
    if-nez p1, :cond_7

    .line 431
    new-instance p1, Landroid/graphics/Matrix;

    .end local p1    # "transform":Landroid/graphics/Matrix;
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 433
    .restart local p1    # "transform":Landroid/graphics/Matrix;
    :cond_7
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 434
    return-object p1
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 281
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-virtual {v1, p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->dispose(Lpl/droidsonroids/gif/GifTextureView;)V

    .line 282
    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V

    .line 283
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 284
    .local v0, "surfaceTexture":Landroid/graphics/SurfaceTexture;
    if-eqz v0, :cond_11

    .line 285
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 287
    :cond_11
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 6
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 445
    move-object v0, p1

    check-cast v0, Lpl/droidsonroids/gif/GifViewSavedState;

    .line 446
    .local v0, "ss":Lpl/droidsonroids/gif/GifViewSavedState;
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifViewSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/view/TextureView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 447
    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    iget-object v2, v0, Lpl/droidsonroids/gif/GifViewSavedState;->mStates:[[J

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iput-object v2, v1, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mSavedState:[J

    .line 448
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .prologue
    .line 439
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    iget-object v1, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    invoke-static {v1}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v1

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getSavedState()[J

    move-result-object v1

    iput-object v1, v0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mSavedState:[J

    .line 440
    new-instance v1, Lpl/droidsonroids/gif/GifViewSavedState;

    invoke-super {p0}, Landroid/view/TextureView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    iget-boolean v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mFreezesAnimation:Z

    if-eqz v0, :cond_20

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    iget-object v0, v0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mSavedState:[J

    :goto_1c
    invoke-direct {v1, v2, v0}, Lpl/droidsonroids/gif/GifViewSavedState;-><init>(Landroid/os/Parcelable;[J)V

    return-object v1

    :cond_20
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public setFreezesAnimation(Z)V
    .registers 2
    .param p1, "freezesAnimation"    # Z

    .prologue
    .line 457
    iput-boolean p1, p0, Lpl/droidsonroids/gif/GifTextureView;->mFreezesAnimation:Z

    .line 458
    return-void
.end method

.method public setImageMatrix(Landroid/graphics/Matrix;)V
    .registers 2
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .prologue
    .line 404
    invoke-virtual {p0, p1}, Lpl/droidsonroids/gif/GifTextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 405
    return-void
.end method

.method public declared-synchronized setInputSource(Lpl/droidsonroids/gif/InputSource;)V
    .registers 3
    .param p1, "inputSource"    # Lpl/droidsonroids/gif/InputSource;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 295
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-virtual {v0, p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->dispose(Lpl/droidsonroids/gif/GifTextureView;)V

    .line 296
    iput-object p1, p0, Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    .line 297
    new-instance v0, Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-direct {v0, p0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;-><init>(Lpl/droidsonroids/gif/GifTextureView;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    .line 298
    if-eqz p1, :cond_16

    .line 299
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->start()V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_18

    .line 301
    :cond_16
    monitor-exit p0

    return-void

    .line 295
    :catchall_18
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setOpaque(Z)V
    .registers 3
    .param p1, "opaque"    # Z

    .prologue
    .line 273
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTextureView;->isOpaque()Z

    move-result v0

    if-eq p1, v0, :cond_e

    .line 274
    invoke-super {p0, p1}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 275
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mInputSource:Lpl/droidsonroids/gif/InputSource;

    invoke-virtual {p0, v0}, Lpl/droidsonroids/gif/GifTextureView;->setInputSource(Lpl/droidsonroids/gif/InputSource;)V

    .line 277
    :cond_e
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .registers 3
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 338
    iput-object p1, p0, Lpl/droidsonroids/gif/GifTextureView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 339
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifTextureView;->updateTextureViewSize(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 340
    return-void
.end method

.method public setSpeed(F)V
    .registers 3
    .param p1, "factor"    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            fromInclusive = false
        .end annotation
    .end param

    .prologue
    .line 311
    iput p1, p0, Lpl/droidsonroids/gif/GifTextureView;->mSpeedFactor:F

    .line 312
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(F)V

    .line 313
    return-void
.end method

.method public setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V
    .registers 4
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 140
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Changing SurfaceTexture is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V
    .registers 4
    .param p1, "listener"    # Landroid/view/TextureView$SurfaceTextureListener;

    .prologue
    .line 119
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Changing SurfaceTextureListener is not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTransform(Landroid/graphics/Matrix;)V
    .registers 3
    .param p1, "transform"    # Landroid/graphics/Matrix;

    .prologue
    .line 415
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mTransform:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 416
    iget-object v0, p0, Lpl/droidsonroids/gif/GifTextureView;->mRenderThread:Lpl/droidsonroids/gif/GifTextureView$RenderThread;

    # getter for: Lpl/droidsonroids/gif/GifTextureView$RenderThread;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;
    invoke-static {v0}, Lpl/droidsonroids/gif/GifTextureView$RenderThread;->access$200(Lpl/droidsonroids/gif/GifTextureView$RenderThread;)Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object v0

    invoke-direct {p0, v0}, Lpl/droidsonroids/gif/GifTextureView;->updateTextureViewSize(Lpl/droidsonroids/gif/GifInfoHandle;)V

    .line 417
    return-void
.end method
