.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.super Landroid/view/View;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$DefaultOnImageEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$DefaultOnAnimationEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
    }
.end annotation


# static fields
.field public static final EASE_IN_OUT_QUAD:I = 0x2

.field public static final EASE_OUT_QUAD:I = 0x1

.field private static final MESSAGE_LONG_CLICK:I = 0x1

.field public static final ORIENTATION_0:I = 0x0

.field public static final ORIENTATION_180:I = 0xb4

.field public static final ORIENTATION_270:I = 0x10e

.field public static final ORIENTATION_90:I = 0x5a

.field public static final ORIENTATION_USE_EXIF:I = -0x1

.field public static final PAN_LIMIT_CENTER:I = 0x3

.field public static final PAN_LIMIT_INSIDE:I = 0x1

.field public static final PAN_LIMIT_OUTSIDE:I = 0x2

.field public static final SCALE_TYPE_CENTER_CROP:I = 0x2

.field public static final SCALE_TYPE_CENTER_INSIDE:I = 0x1

.field public static final SCALE_TYPE_CUSTOM:I = 0x3

.field private static final TAG:Ljava/lang/String;

.field private static final VALID_EASING_STYLES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final VALID_ORIENTATIONS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final VALID_PAN_LIMITS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final VALID_SCALE_TYPES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final VALID_ZOOM_STYLES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final ZOOM_FOCUS_CENTER:I = 0x2

.field public static final ZOOM_FOCUS_CENTER_IMMEDIATE:I = 0x3

.field public static final ZOOM_FOCUS_FIXED:I = 0x1


# instance fields
.field private anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

.field private bitmap:Landroid/graphics/Bitmap;

.field private bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;",
            ">;"
        }
    .end annotation
.end field

.field private bitmapIsCached:Z

.field private bitmapIsPreview:Z

.field private bitmapPaint:Landroid/graphics/Paint;

.field private debug:Z

.field private debugPaint:Landroid/graphics/Paint;

.field private decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

.field private final decoderLock:Ljava/lang/Object;

.field private detector:Landroid/view/GestureDetector;

.field private doubleTapZoomDuration:I

.field private doubleTapZoomScale:F

.field private doubleTapZoomStyle:I

.field private dstArray:[F

.field private fullImageSampleSize:I

.field private handler:Landroid/os/Handler;

.field private imageLoadedSent:Z

.field private isPanning:Z

.field private isQuickScaling:Z

.field private isZooming:Z

.field private matrix:Landroid/graphics/Matrix;

.field private maxScale:F

.field private maxTouchCount:I

.field private minScale:F

.field private minimumScaleType:I

.field private minimumTileDpi:I

.field private onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

.field private onLongClickListener:Landroid/view/View$OnLongClickListener;

.field private orientation:I

.field private pRegion:Landroid/graphics/Rect;

.field private panEnabled:Z

.field private panLimit:I

.field private parallelLoadingEnabled:Z

.field private pendingScale:Ljava/lang/Float;

.field private quickScaleCenter:Landroid/graphics/PointF;

.field private quickScaleEnabled:Z

.field private quickScaleLastDistance:F

.field private quickScaleLastPoint:Landroid/graphics/PointF;

.field private quickScaleMoved:Z

.field private final quickScaleThreshold:F

.field private readySent:Z

.field private regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;"
        }
    .end annotation
.end field

.field private sHeight:I

.field private sOrientation:I

.field private sPendingCenter:Landroid/graphics/PointF;

.field private sRect:Landroid/graphics/RectF;

.field private sRegion:Landroid/graphics/Rect;

.field private sRequestedCenter:Landroid/graphics/PointF;

.field private sWidth:I

.field private satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

.field private scale:F

.field private scaleStart:F

.field private srcArray:[F

.field private tileBgPaint:Landroid/graphics/Paint;

.field private tileMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/util/List",
            "<",
            "Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;",
            ">;>;"
        }
    .end annotation
.end field

.field private uri:Landroid/net/Uri;

.field private vCenterStart:Landroid/graphics/PointF;

.field private vDistStart:F

.field private vTranslate:Landroid/graphics/PointF;

.field private vTranslateStart:Landroid/graphics/PointF;

.field private zoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 81
    const-class v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    .line 94
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Integer;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    const/16 v1, 0x5a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    const/16 v1, 0xb4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    const/16 v1, 0x10e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    const/4 v1, 0x4

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    .line 103
    new-array v0, v5, [Ljava/lang/Integer;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ZOOM_STYLES:Ljava/util/List;

    .line 110
    new-array v0, v4, [Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;

    .line 119
    new-array v0, v5, [Ljava/lang/Integer;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_PAN_LIMITS:Ljava/util/List;

    .line 128
    new-array v0, v5, [Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_SCALE_TYPES:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 311
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 312
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attr"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 262
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 152
    iput v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    .line 155
    const/high16 v3, 0x40000000    # 2.0f

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 158
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v3

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    .line 161
    const/4 v3, -0x1

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    .line 164
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    .line 167
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    .line 173
    iput-boolean v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    .line 174
    iput-boolean v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    .line 175
    iput-boolean v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    .line 178
    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    .line 179
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    .line 180
    const/16 v3, 0x1f4

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    .line 216
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    .line 217
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 218
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 258
    const/16 v3, 0x8

    new-array v3, v3, [F

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    .line 259
    const/16 v3, 0x8

    new-array v3, v3, [F

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 263
    const/16 v3, 0xa0

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMinimumDpi(I)V

    .line 264
    const/16 v3, 0xa0

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomDpi(I)V

    .line 265
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 266
    new-instance v3, Landroid/os/Handler;

    new-instance v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    invoke-direct {v4, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    .line 278
    if-eqz p2, :cond_e6

    .line 279
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/davemorrissey/labs/subscaleview/R$styleable;->SubsamplingScaleImageView:[I

    invoke-virtual {v3, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 280
    .local v2, "typedAttr":Landroid/content/res/TypedArray;
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_92

    .line 281
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "assetName":Ljava/lang/String;
    if-eqz v0, :cond_92

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_92

    .line 283
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->asset(Ljava/lang/String;)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {v3}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tilingEnabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 286
    .end local v0    # "assetName":Ljava/lang/String;
    :cond_92
    invoke-virtual {v2, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_a9

    .line 287
    invoke-virtual {v2, v6, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 288
    .local v1, "resId":I
    if-lez v1, :cond_a9

    .line 289
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource(I)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {v3}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tilingEnabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 292
    .end local v1    # "resId":I
    :cond_a9
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_b6

    .line 293
    invoke-virtual {v2, v7, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setPanEnabled(Z)V

    .line 295
    :cond_b6
    invoke-virtual {v2, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_c3

    .line 296
    invoke-virtual {v2, v8, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setZoomEnabled(Z)V

    .line 298
    :cond_c3
    invoke-virtual {v2, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_d0

    .line 299
    invoke-virtual {v2, v9, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setQuickScaleEnabled(Z)V

    .line 301
    :cond_d0
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_e3

    .line 302
    const/4 v3, 0x5

    invoke-static {v6, v6, v6, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setTileBackgroundColor(I)V

    .line 304
    :cond_e3
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 307
    .end local v2    # "typedAttr":Landroid/content/res/TypedArray;
    :cond_e6
    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v5, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    .line 308
    return-void
.end method

.method static synthetic access$000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/view/View$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    return v0
.end method

.method static synthetic access$102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;I)I
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # I

    .prologue
    .line 79
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    return p1
.end method

.method static synthetic access$1300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    return v0
.end method

.method static synthetic access$1400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$1702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$1802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # F

    .prologue
    .line 79
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    return p1
.end method

.method static synthetic access$1902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    return p1
.end method

.method static synthetic access$2000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$2002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$201(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 79
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method static synthetic access$2102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # F

    .prologue
    .line 79
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    return p1
.end method

.method static synthetic access$2202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    return p1
.end method

.method static synthetic access$2400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/PointF;
    .param p2, "x2"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-void
.end method

.method static synthetic access$301(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 79
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method static synthetic access$4800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)I
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getExifOrientation(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$4900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$5000()Ljava/lang/String;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;III)V
    .registers 5
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onTilesInited(Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;III)V

    return-void
.end method

.method static synthetic access$5200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/Rect;
    .param p2, "x2"    # Landroid/graphics/Rect;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method

.method static synthetic access$5500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V
    .registers 1
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onTileLoaded()V

    return-void
.end method

.method static synthetic access$5600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;)V
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onPreviewLoaded(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$5700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;IZ)V
    .registers 4
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # I
    .param p3, "x3"    # Z

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded(Landroid/graphics/Bitmap;IZ)V

    return-void
.end method

.method static synthetic access$5900()Ljava/util/List;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    return v0
.end method

.method static synthetic access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    return-object v0
.end method

.method static synthetic access$6002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    return-object p1
.end method

.method static synthetic access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # F

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v0

    return v0
.end method

.method static synthetic access$6200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 6
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # F
    .param p2, "x2"    # F
    .param p3, "x3"    # F
    .param p4, "x4"    # Landroid/graphics/PointF;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedSCenter(FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    return-void
.end method

.method static synthetic access$700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    return v0
.end method

.method static synthetic access$800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    return v0
.end method

.method static synthetic access$902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    return p1
.end method

.method private calculateInSampleSize(F)I
    .registers 12
    .param p1, "scale"    # F

    .prologue
    .line 1228
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    if-lez v8, :cond_1a

    .line 1229
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 1230
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    iget v8, v3, Landroid/util/DisplayMetrics;->xdpi:F

    iget v9, v3, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    div-float v0, v8, v9

    .line 1231
    .local v0, "averageDpi":F
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    int-to-float v8, v8

    div-float/2addr v8, v0

    mul-float/2addr p1, v8

    .line 1234
    .end local v0    # "averageDpi":F
    .end local v3    # "metrics":Landroid/util/DisplayMetrics;
    :cond_1a
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, p1

    float-to-int v6, v8

    .line 1235
    .local v6, "reqWidth":I
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, p1

    float-to-int v5, v8

    .line 1238
    .local v5, "reqHeight":I
    const/4 v2, 0x1

    .line 1239
    .local v2, "inSampleSize":I
    if-eqz v6, :cond_2d

    if-nez v5, :cond_30

    .line 1240
    :cond_2d
    const/16 v4, 0x20

    .line 1261
    :cond_2f
    return v4

    .line 1243
    :cond_30
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    if-gt v8, v5, :cond_3c

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    if-le v8, v6, :cond_55

    .line 1246
    :cond_3c
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v5

    div-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1247
    .local v1, "heightRatio":I
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v6

    div-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 1252
    .local v7, "widthRatio":I
    if-ge v1, v7, :cond_5d

    move v2, v1

    .line 1256
    .end local v1    # "heightRatio":I
    .end local v7    # "widthRatio":I
    :cond_55
    :goto_55
    const/4 v4, 0x1

    .line 1257
    .local v4, "power":I
    :goto_56
    mul-int/lit8 v8, v4, 0x2

    if-ge v8, v2, :cond_2f

    .line 1258
    mul-int/lit8 v4, v4, 0x2

    goto :goto_56

    .end local v4    # "power":I
    .restart local v1    # "heightRatio":I
    .restart local v7    # "widthRatio":I
    :cond_5d
    move v2, v7

    .line 1252
    goto :goto_55
.end method

.method private checkImageLoaded()Z
    .registers 3

    .prologue
    .line 1074
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    .line 1075
    .local v0, "imageLoaded":Z
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-nez v1, :cond_1c

    if-eqz v0, :cond_1c

    .line 1076
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 1077
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    .line 1078
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded()V

    .line 1079
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    if-eqz v1, :cond_1c

    .line 1080
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;->onImageLoaded()V

    .line 1083
    :cond_1c
    return v0
.end method

.method private checkReady()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 1057
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    if-lez v2, :cond_38

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v2

    if-lez v2, :cond_38

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v2, :cond_38

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v2, :cond_38

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_1f

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v2

    if-eqz v2, :cond_38

    :cond_1f
    move v0, v1

    .line 1058
    .local v0, "ready":Z
    :goto_20
    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-nez v2, :cond_37

    if-eqz v0, :cond_37

    .line 1059
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 1060
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    .line 1061
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onReady()V

    .line 1062
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    if-eqz v1, :cond_37

    .line 1063
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;->onReady()V

    .line 1066
    :cond_37
    return v0

    .line 1057
    .end local v0    # "ready":Z
    :cond_38
    const/4 v0, 0x0

    goto :goto_20
.end method

.method private createPaints()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 1090
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_1b

    .line 1091
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 1092
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1093
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1094
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 1096
    :cond_1b
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_40

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v0, :cond_40

    .line 1097
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    .line 1098
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1099
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    const v1, -0xff01

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1100
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1102
    :cond_40
    return-void
.end method

.method private distance(FFFF)F
    .registers 9
    .param p1, "x0"    # F
    .param p2, "x1"    # F
    .param p3, "y0"    # F
    .param p4, "y1"    # F

    .prologue
    .line 1842
    sub-float v0, p1, p2

    .line 1843
    .local v0, "x":F
    sub-float v1, p3, p4

    .line 1844
    .local v1, "y":F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v2, v2

    return v2
.end method

.method private doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .registers 16
    .param p1, "sCenter"    # Landroid/graphics/PointF;
    .param p2, "vFocus"    # Landroid/graphics/PointF;

    .prologue
    const/4 v5, 0x0

    const/4 v0, 0x1

    const/4 v8, 0x0

    .line 829
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_17

    .line 830
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    if-eqz v1, :cond_3d

    .line 832
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 833
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iput v1, p1, Landroid/graphics/PointF;->y:F

    .line 840
    :cond_17
    :goto_17
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 841
    .local v6, "doubleTapZoomScale":F
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    float-to-double v3, v1

    float-to-double v9, v6

    const-wide v11, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v9, v11

    cmpg-double v1, v3, v9

    if-gtz v1, :cond_50

    move v7, v0

    .line 842
    .local v7, "zoomIn":Z
    :goto_2e
    if-eqz v7, :cond_52

    move v2, v6

    .line 843
    .local v2, "targetScale":F
    :goto_31
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/4 v3, 0x3

    if-ne v1, v3, :cond_57

    .line 844
    invoke-virtual {p0, v2, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setScaleAndCenter(FLandroid/graphics/PointF;)V

    .line 850
    :cond_39
    :goto_39
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 851
    return-void

    .line 836
    .end local v2    # "targetScale":F
    .end local v6    # "doubleTapZoomScale":F
    .end local v7    # "zoomIn":Z
    :cond_3d
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 837
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p1, Landroid/graphics/PointF;->y:F

    goto :goto_17

    .restart local v6    # "doubleTapZoomScale":F
    :cond_50
    move v7, v8

    .line 841
    goto :goto_2e

    .line 842
    .restart local v7    # "zoomIn":Z
    :cond_52
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v2

    goto :goto_31

    .line 845
    .restart local v2    # "targetScale":F
    :cond_57
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_62

    if-eqz v7, :cond_62

    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_76

    .line 846
    :cond_62
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {v0, p0, v2, p1, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    invoke-virtual {v0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withDuration(J)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    goto :goto_39

    .line 847
    :cond_76
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    if-ne v1, v0, :cond_39

    .line 848
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    invoke-virtual {v0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withDuration(J)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    goto :goto_39
.end method

.method private ease(IJFFJ)F
    .registers 15
    .param p1, "type"    # I
    .param p2, "time"    # J
    .param p4, "from"    # F
    .param p5, "change"    # F
    .param p6, "duration"    # J

    .prologue
    .line 2033
    packed-switch p1, :pswitch_data_30

    .line 2039
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected easing type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_1c
    move-object v0, p0

    move-wide v1, p2

    move v3, p4

    move v4, p5

    move-wide v5, p6

    .line 2035
    invoke-direct/range {v0 .. v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->easeInOutQuad(JFFJ)F

    move-result v0

    .line 2037
    :goto_25
    return v0

    :pswitch_26
    move-object v0, p0

    move-wide v1, p2

    move v3, p4

    move v4, p5

    move-wide v5, p6

    invoke-direct/range {v0 .. v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->easeOutQuad(JFFJ)F

    move-result v0

    goto :goto_25

    .line 2033
    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_26
        :pswitch_1c
    .end packed-switch
.end method

.method private easeInOutQuad(JFFJ)F
    .registers 12
    .param p1, "time"    # J
    .param p3, "from"    # F
    .param p4, "change"    # F
    .param p5, "duration"    # J

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v3, 0x40000000    # 2.0f

    .line 2065
    long-to-float v1, p1

    long-to-float v2, p5

    div-float/2addr v2, v3

    div-float v0, v1, v2

    .line 2066
    .local v0, "timeF":F
    cmpg-float v1, v0, v4

    if-gez v1, :cond_13

    .line 2067
    div-float v1, p4, v3

    mul-float/2addr v1, v0

    mul-float/2addr v1, v0

    add-float/2addr v1, p3

    .line 2070
    :goto_12
    return v1

    .line 2069
    :cond_13
    sub-float/2addr v0, v4

    .line 2070
    neg-float v1, p4

    div-float/2addr v1, v3

    sub-float v2, v0, v3

    mul-float/2addr v2, v0

    sub-float/2addr v2, v4

    mul-float/2addr v1, v2

    add-float/2addr v1, p3

    goto :goto_12
.end method

.method private easeOutQuad(JFFJ)F
    .registers 10
    .param p1, "time"    # J
    .param p3, "from"    # F
    .param p4, "change"    # F
    .param p5, "duration"    # J

    .prologue
    .line 2052
    long-to-float v1, p1

    long-to-float v2, p5

    div-float v0, v1, v2

    .line 2053
    .local v0, "progress":F
    neg-float v1, p4

    mul-float/2addr v1, v0

    const/high16 v2, 0x40000000    # 2.0f

    sub-float v2, v0, v2

    mul-float/2addr v1, v2

    add-float/2addr v1, p3

    return v1
.end method

.method private execute(Landroid/os/AsyncTask;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/AsyncTask",
            "<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "*>;)V"
        }
    .end annotation

    .prologue
    .local p1, "asyncTask":Landroid/os/AsyncTask;, "Landroid/os/AsyncTask<Ljava/lang/Void;Ljava/lang/Void;*>;"
    const/4 v9, 0x0

    .line 1702
    iget-boolean v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->parallelLoadingEnabled:Z

    if-eqz v4, :cond_45

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_45

    .line 1704
    :try_start_b
    const-class v4, Landroid/os/AsyncTask;

    const-string v5, "THREAD_POOL_EXECUTOR"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 1705
    .local v3, "executorField":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 1706
    .local v2, "executor":Ljava/util/concurrent/Executor;
    const-class v4, Landroid/os/AsyncTask;

    const-string v5, "executeOnExecutor"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Ljava/util/concurrent/Executor;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, [Ljava/lang/Object;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1707
    .local v1, "executeMethod":Ljava/lang/reflect/Method;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aput-object v6, v4, v5

    invoke-virtual {v1, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_3c} :catch_3d

    .line 1714
    .end local v1    # "executeMethod":Ljava/lang/reflect/Method;
    .end local v2    # "executor":Ljava/util/concurrent/Executor;
    .end local v3    # "executorField":Ljava/lang/reflect/Field;
    :goto_3c
    return-void

    .line 1709
    :catch_3d
    move-exception v0

    .line 1710
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v5, "Failed to execute AsyncTask on thread pool executor, falling back to single threaded executor"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1713
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_45
    new-array v4, v9, [Ljava/lang/Void;

    invoke-virtual {p1, v4}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_3c
.end method

.method private fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "sRect"    # Landroid/graphics/Rect;
    .param p2, "target"    # Landroid/graphics/Rect;

    .prologue
    .line 1816
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    if-nez v0, :cond_a

    .line 1817
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1825
    :goto_9
    return-void

    .line 1818
    :cond_a
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_24

    .line 1819
    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v4, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v3, v4

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_9

    .line 1820
    :cond_24
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0xb4

    if-ne v0, v1, :cond_44

    .line 1821
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v3, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    iget v4, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v4

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_9

    .line 1823
    :cond_44
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v1, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v1

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    iget v3, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v2, v3

    iget v3, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_9
.end method

.method private fitToBounds(Z)V
    .registers 7
    .param p1, "center"    # Z

    .prologue
    const/4 v4, 0x0

    .line 1321
    const/4 v0, 0x0

    .line 1322
    .local v0, "init":Z
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v1, :cond_e

    .line 1323
    const/4 v0, 0x1

    .line 1324
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 1326
    :cond_e
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v1, :cond_1f

    .line 1327
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v3, 0x0

    invoke-direct {v1, v4, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 1329
    :cond_1f
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1330
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 1331
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, p1, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1332
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 1333
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 1334
    if-eqz v0, :cond_64

    .line 1335
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-direct {p0, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateForSCenter(FFF)Landroid/graphics/PointF;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 1337
    :cond_64
    return-void
.end method

.method private fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    .registers 14
    .param p1, "center"    # Z
    .param p2, "sat"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .prologue
    .line 1272
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_c

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 1273
    const/4 p1, 0x0

    .line 1276
    :cond_c
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v5

    .line 1277
    .local v5, "vTranslate":Landroid/graphics/PointF;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v8

    invoke-direct {p0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v2

    .line 1278
    .local v2, "scale":F
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float v4, v2, v8

    .line 1279
    .local v4, "scaleWidth":F
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float v3, v2, v8

    .line 1281
    .local v3, "scaleHeight":F
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_c2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_c2

    .line 1282
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    sub-float/2addr v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1283
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    sub-float/2addr v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    .line 1293
    :goto_51
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v8

    if-gtz v8, :cond_5d

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v8

    if-lez v8, :cond_f6

    :cond_5d
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v9

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v10

    add-int/2addr v9, v10

    int-to-float v9, v9

    div-float v6, v8, v9

    .line 1294
    .local v6, "xPaddingRatio":F
    :goto_6e
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v8

    if-gtz v8, :cond_7a

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v8

    if-lez v8, :cond_fa

    :cond_7a
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v9

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v10

    add-int/2addr v9, v10

    int-to-float v9, v9

    div-float v7, v8, v9

    .line 1298
    .local v7, "yPaddingRatio":F
    :goto_8b
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_fd

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_fd

    .line 1299
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v0, v8

    .line 1300
    .local v0, "maxTx":F
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v1, v8

    .line 1309
    .local v1, "maxTy":F
    :goto_ae
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-static {v8, v0}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1310
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-static {v8, v1}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    .line 1312
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {p2, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1313
    return-void

    .line 1284
    .end local v0    # "maxTx":F
    .end local v1    # "maxTy":F
    .end local v6    # "xPaddingRatio":F
    .end local v7    # "yPaddingRatio":F
    :cond_c2
    if-eqz p1, :cond_e2

    .line 1285
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1286
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    goto/16 :goto_51

    .line 1288
    :cond_e2
    iget v8, v5, Landroid/graphics/PointF;->x:F

    neg-float v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1289
    iget v8, v5, Landroid/graphics/PointF;->y:F

    neg-float v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    goto/16 :goto_51

    .line 1293
    :cond_f6
    const/high16 v6, 0x3f000000    # 0.5f

    goto/16 :goto_6e

    .line 1294
    .restart local v6    # "xPaddingRatio":F
    :cond_fa
    const/high16 v7, 0x3f000000    # 0.5f

    goto :goto_8b

    .line 1301
    .restart local v7    # "yPaddingRatio":F
    :cond_fd
    if-eqz p1, :cond_118

    .line 1302
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v4

    mul-float/2addr v9, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 1303
    .restart local v0    # "maxTx":F
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v3

    mul-float/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .restart local v1    # "maxTy":F
    goto :goto_ae

    .line 1305
    .end local v0    # "maxTx":F
    .end local v1    # "maxTy":F
    :cond_118
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v0, v8

    .line 1306
    .restart local v0    # "maxTx":F
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v1, v8

    .restart local v1    # "maxTy":F
    goto :goto_ae
.end method

.method private getExifOrientation(Ljava/lang/String;)I
    .registers 14
    .param p1, "sourceUri"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 1660
    const/4 v9, 0x0

    .line 1661
    .local v9, "exifOrientation":I
    const-string v0, "content"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_68

    .line 1663
    const/4 v0, 0x1

    :try_start_b
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "orientation"

    aput-object v1, v2, v0

    .line 1664
    .local v2, "columns":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1665
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_45

    .line 1666
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 1667
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 1668
    .local v10, "orientation":I
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    const/4 v0, -0x1

    if-eq v10, v0, :cond_46

    .line 1669
    move v9, v10

    .line 1674
    .end local v10    # "orientation":I
    :cond_42
    :goto_42
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1698
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_45
    :goto_45
    return v9

    .line 1671
    .restart local v2    # "columns":[Ljava/lang/String;
    .restart local v6    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "orientation":I
    :cond_46
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported orientation: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_5e} :catch_5f

    goto :goto_42

    .line 1676
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    .end local v10    # "orientation":I
    :catch_5f
    move-exception v7

    .line 1677
    .local v7, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v1, "Could not get orientation of image from media store"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_45

    .line 1679
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_68
    const-string v0, "file:///"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_45

    const-string v0, "file:///android_asset/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_45

    .line 1681
    :try_start_78
    new-instance v8, Landroid/media/ExifInterface;

    const-string v0, "file:///"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 1682
    .local v8, "exifInterface":Landroid/media/ExifInterface;
    const-string v0, "Orientation"

    const/4 v1, 0x1

    invoke-virtual {v8, v0, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v11

    .line 1683
    .local v11, "orientationAttr":I
    if-eq v11, v3, :cond_94

    if-nez v11, :cond_96

    .line 1684
    :cond_94
    const/4 v9, 0x0

    goto :goto_45

    .line 1685
    :cond_96
    const/4 v0, 0x6

    if-ne v11, v0, :cond_9c

    .line 1686
    const/16 v9, 0x5a

    goto :goto_45

    .line 1687
    :cond_9c
    const/4 v0, 0x3

    if-ne v11, v0, :cond_a2

    .line 1688
    const/16 v9, 0xb4

    goto :goto_45

    .line 1689
    :cond_a2
    const/16 v0, 0x8

    if-ne v11, v0, :cond_a9

    .line 1690
    const/16 v9, 0x10e

    goto :goto_45

    .line 1692
    :cond_a9
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported EXIF orientation: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_c1} :catch_c2

    goto :goto_45

    .line 1694
    .end local v8    # "exifInterface":Landroid/media/ExifInterface;
    .end local v11    # "orientationAttr":I
    :catch_c2
    move-exception v7

    .line 1695
    .restart local v7    # "e":Ljava/lang/Exception;
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v1, "Could not get EXIF orientation of image"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_45
.end method

.method private getMaxBitmapDimensions(Landroid/graphics/Canvas;)Landroid/graphics/Point;
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v5, 0x800

    .line 1772
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_3f

    .line 1774
    :try_start_8
    const-class v2, Landroid/graphics/Canvas;

    const-string v3, "getMaximumBitmapWidth"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1775
    .local v1, "maxWidth":I
    const-class v2, Landroid/graphics/Canvas;

    const-string v3, "getMaximumBitmapHeight"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1776
    .local v0, "maxHeight":I
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v1, v0}, Landroid/graphics/Point;-><init>(II)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3d} :catch_3e

    .line 1781
    .end local v0    # "maxHeight":I
    .end local v1    # "maxWidth":I
    :goto_3d
    return-object v2

    .line 1777
    :catch_3e
    move-exception v2

    .line 1781
    :cond_3f
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v5, v5}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_3d
.end method

.method private getRequiredRotation()I
    .registers 3

    .prologue
    .line 1831
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    .line 1832
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1834
    :goto_7
    return v0

    :cond_8
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    goto :goto_7
.end method

.method private declared-synchronized initialiseBaseLayer(Landroid/graphics/Point;)V
    .registers 12
    .param p1, "maxTileDimensions"    # Landroid/graphics/Point;

    .prologue
    const/4 v9, 0x1

    .line 1110
    monitor-enter p0

    :try_start_2
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    const/4 v2, 0x0

    new-instance v3, Landroid/graphics/PointF;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v3, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 1111
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1115
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v1

    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1116
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-le v1, v9, :cond_2e

    .line 1117
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1120
    :cond_2e
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v1, v9, :cond_62

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    if-nez v1, :cond_62

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v1

    iget v2, p1, Landroid/graphics/Point;->x:I

    if-ge v1, v2, :cond_62

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    iget v2, p1, Landroid/graphics/Point;->y:I

    if-ge v1, v2, :cond_62

    .line 1124
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 1125
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 1126
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 1127
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V
    :try_end_60
    .catchall {:try_start_2 .. :try_end_60} :catchall_8e

    .line 1142
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    :goto_60
    monitor-exit p0

    return-void

    .line 1131
    :cond_62
    :try_start_62
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseTileMap(Landroid/graphics/Point;)V

    .line 1133
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 1134
    .local v6, "baseGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_77
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_91

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 1135
    .local v7, "baseTile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v0, p0, v1, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 1136
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V
    :try_end_8d
    .catchall {:try_start_62 .. :try_end_8d} :catchall_8e

    goto :goto_77

    .line 1110
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    .end local v6    # "baseGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    .end local v7    # "baseTile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v8    # "i$":Ljava/util/Iterator;
    :catchall_8e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1138
    .restart local v6    # "baseGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_91
    const/4 v1, 0x1

    :try_start_92
    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V
    :try_end_95
    .catchall {:try_start_92 .. :try_end_95} :catchall_8e

    goto :goto_60
.end method

.method private initialiseTileMap(Landroid/graphics/Point;)V
    .registers 20
    .param p1, "maxTileDimensions"    # Landroid/graphics/Point;

    .prologue
    .line 1343
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 1344
    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1345
    .local v3, "sampleSize":I
    const/4 v9, 0x1

    .line 1346
    .local v9, "xTiles":I
    const/4 v11, 0x1

    .line 1348
    .local v11, "yTiles":I
    :goto_f
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v12

    div-int v2, v12, v9

    .line 1349
    .local v2, "sTileWidth":I
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v12

    div-int v1, v12, v11

    .line 1350
    .local v1, "sTileHeight":I
    div-int v5, v2, v3

    .line 1351
    .local v5, "subTileWidth":I
    div-int v4, v1, v3

    .line 1352
    .local v4, "subTileHeight":I
    :goto_1f
    add-int v12, v5, v9

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p1

    iget v13, v0, Landroid/graphics/Point;->x:I

    if-gt v12, v13, :cond_3d

    int-to-double v12, v5

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v14

    int-to-double v14, v14

    const-wide/high16 v16, 0x3ff4000000000000L    # 1.25

    mul-double v14, v14, v16

    cmpl-double v12, v12, v14

    if-lez v12, :cond_48

    move-object/from16 v0, p0

    iget v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ge v3, v12, :cond_48

    .line 1353
    :cond_3d
    add-int/lit8 v9, v9, 0x1

    .line 1354
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v12

    div-int v2, v12, v9

    .line 1355
    div-int v5, v2, v3

    goto :goto_1f

    .line 1357
    :cond_48
    :goto_48
    add-int v12, v4, v11

    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p1

    iget v13, v0, Landroid/graphics/Point;->y:I

    if-gt v12, v13, :cond_66

    int-to-double v12, v4

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v14

    int-to-double v14, v14

    const-wide/high16 v16, 0x3ff4000000000000L    # 1.25

    mul-double v14, v14, v16

    cmpl-double v12, v12, v14

    if-lez v12, :cond_71

    move-object/from16 v0, p0

    iget v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ge v3, v12, :cond_71

    .line 1358
    :cond_66
    add-int/lit8 v11, v11, 0x1

    .line 1359
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v12

    div-int v1, v12, v11

    .line 1360
    div-int v4, v1, v3

    goto :goto_48

    .line 1362
    :cond_71
    new-instance v7, Ljava/util/ArrayList;

    mul-int v12, v9, v11

    invoke-direct {v7, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 1363
    .local v7, "tileGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    const/4 v8, 0x0

    .local v8, "x":I
    :goto_79
    if-ge v8, v9, :cond_dd

    .line 1364
    const/4 v10, 0x0

    .local v10, "y":I
    :goto_7c
    if-ge v10, v11, :cond_da

    .line 1365
    new-instance v6, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    const/4 v12, 0x0

    invoke-direct {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 1366
    .local v6, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v6, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;I)I

    .line 1367
    move-object/from16 v0, p0

    iget v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v3, v12, :cond_cf

    const/4 v12, 0x1

    :goto_8e
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1368
    new-instance v14, Landroid/graphics/Rect;

    mul-int v15, v8, v2

    mul-int v16, v10, v1

    add-int/lit8 v12, v9, -0x1

    if-ne v8, v12, :cond_d1

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v12

    move v13, v12

    :goto_a0
    add-int/lit8 v12, v11, -0x1

    if-ne v10, v12, :cond_d6

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v12

    :goto_a8
    move/from16 v0, v16

    invoke-direct {v14, v15, v0, v13, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {v6, v14}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1374
    new-instance v12, Landroid/graphics/Rect;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v12 .. v16}, Landroid/graphics/Rect;-><init>(IIII)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1375
    new-instance v12, Landroid/graphics/Rect;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1376
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1364
    add-int/lit8 v10, v10, 0x1

    goto :goto_7c

    .line 1367
    :cond_cf
    const/4 v12, 0x0

    goto :goto_8e

    .line 1368
    :cond_d1
    add-int/lit8 v12, v8, 0x1

    mul-int/2addr v12, v2

    move v13, v12

    goto :goto_a0

    :cond_d6
    add-int/lit8 v12, v10, 0x1

    mul-int/2addr v12, v1

    goto :goto_a8

    .line 1363
    .end local v6    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    :cond_da
    add-int/lit8 v8, v8, 0x1

    goto :goto_79

    .line 1379
    .end local v10    # "y":I
    :cond_dd
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1380
    const/4 v12, 0x1

    if-ne v3, v12, :cond_ec

    .line 1386
    return-void

    .line 1383
    :cond_ec
    div-int/lit8 v3, v3, 0x2

    .line 1385
    goto/16 :goto_f
.end method

.method private isBaseLayerReady()Z
    .registers 8

    .prologue
    .line 1033
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_a

    iget-boolean v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-nez v5, :cond_a

    .line 1034
    const/4 v0, 0x1

    .line 1048
    :cond_9
    :goto_9
    return v0

    .line 1035
    :cond_a
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v5, :cond_57

    .line 1036
    const/4 v0, 0x1

    .line 1037
    .local v0, "baseLayerReady":Z
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 1038
    .local v4, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v5, v6, :cond_19

    .line 1039
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_3d
    :goto_3d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_19

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 1040
    .local v3, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v5

    if-nez v5, :cond_55

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v5

    if-nez v5, :cond_3d

    .line 1041
    :cond_55
    const/4 v0, 0x0

    goto :goto_3d

    .line 1048
    .end local v0    # "baseLayerReady":Z
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v4    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    :cond_57
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private limitedSCenter(FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 13
    .param p1, "sCenterX"    # F
    .param p2, "sCenterY"    # F
    .param p3, "scale"    # F
    .param p4, "sTarget"    # Landroid/graphics/PointF;

    .prologue
    .line 1990
    invoke-direct {p0, p1, p2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateForSCenter(FFF)Landroid/graphics/PointF;

    move-result-object v2

    .line 1991
    .local v2, "vTranslate":Landroid/graphics/PointF;
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v5

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v7

    sub-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x2

    add-int v3, v5, v6

    .line 1992
    .local v3, "vxCenter":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v5

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v7

    sub-int/2addr v6, v7

    div-int/lit8 v6, v6, 0x2

    add-int v4, v5, v6

    .line 1993
    .local v4, "vyCenter":I
    int-to-float v5, v3

    iget v6, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v6

    div-float v0, v5, p3

    .line 1994
    .local v0, "sx":F
    int-to-float v5, v4

    iget v6, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v5, v6

    div-float v1, v5, p3

    .line 1995
    .local v1, "sy":F
    invoke-virtual {p4, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 1996
    return-object p4
.end method

.method private limitedScale(F)F
    .registers 3
    .param p1, "targetScale"    # F

    .prologue
    .line 2018
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 2019
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 2020
    return p1
.end method

.method private minScale()F
    .registers 6

    .prologue
    .line 2003
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v3

    add-int v1, v2, v3

    .line 2004
    .local v1, "vPadding":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v3

    add-int v0, v2, v3

    .line 2005
    .local v0, "hPadding":I
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_36

    .line 2006
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    int-to-float v2, v2

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v3

    sub-int/2addr v3, v1

    int-to-float v3, v3

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 2010
    :goto_35
    return v2

    .line 2007
    :cond_36
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_45

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_45

    .line 2008
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    goto :goto_35

    .line 2010
    :cond_45
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    int-to-float v2, v2

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v3

    sub-int/2addr v3, v1

    int-to-float v3, v3

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    goto :goto_35
.end method

.method private declared-synchronized onImageLoaded(Landroid/graphics/Bitmap;IZ)V
    .registers 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "sOrientation"    # I
    .param p3, "bitmapIsCached"    # Z

    .prologue
    .line 1635
    monitor-enter p0

    :try_start_1
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v2, :cond_1d

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v2, :cond_1d

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-ne v2, v3, :cond_19

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-eq v2, v3, :cond_1d

    .line 1636
    :cond_19
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1638
    :cond_1d
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_2a

    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v2, :cond_2a

    .line 1639
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 1641
    :cond_2a
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1642
    iput-boolean p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1643
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1644
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1645
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1646
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1647
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v1

    .line 1648
    .local v1, "ready":Z
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    move-result v0

    .line 1649
    .local v0, "imageLoaded":Z
    if-nez v1, :cond_4b

    if-eqz v0, :cond_51

    .line 1650
    :cond_4b
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1651
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_51
    .catchall {:try_start_1 .. :try_end_51} :catchall_53

    .line 1653
    :cond_51
    monitor-exit p0

    return-void

    .line 1635
    .end local v0    # "imageLoaded":Z
    .end local v1    # "ready":Z
    :catchall_53
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized onPreviewLoaded(Landroid/graphics/Bitmap;)V
    .registers 6
    .param p1, "previewBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1614
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-eqz v0, :cond_e

    .line 1615
    :cond_9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_3c

    .line 1628
    :cond_c
    :goto_c
    monitor-exit p0

    return-void

    .line 1618
    :cond_e
    :try_start_e
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    if-eqz v0, :cond_3f

    .line 1619
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {p1, v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1623
    :goto_2c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1624
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1625
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1626
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_3b
    .catchall {:try_start_e .. :try_end_3b} :catchall_3c

    goto :goto_c

    .line 1614
    :catchall_3c
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1621
    :cond_3f
    :try_start_3f
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;
    :try_end_41
    .catchall {:try_start_3f .. :try_end_41} :catchall_3c

    goto :goto_2c
.end method

.method private declared-synchronized onTileLoaded()V
    .registers 2

    .prologue
    .line 1535
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    .line 1536
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    .line 1537
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_23

    .line 1538
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v0, :cond_1a

    .line 1539
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1541
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1542
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1543
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1545
    :cond_23
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_28

    .line 1546
    monitor-exit p0

    return-void

    .line 1535
    :catchall_28
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onTilesInited(Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;III)V
    .registers 6
    .param p1, "decoder"    # Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;
    .param p2, "sWidth"    # I
    .param p3, "sHeight"    # I
    .param p4, "sOrientation"    # I

    .prologue
    .line 1450
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_2b

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v0, :cond_2b

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-ne v0, p2, :cond_11

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-eq v0, p3, :cond_2b

    .line 1451
    :cond_11
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1452
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2b

    .line 1453
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v0, :cond_22

    .line 1454
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1456
    :cond_22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1457
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1458
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1461
    :cond_2b
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 1462
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1463
    iput p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1464
    iput p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1465
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    .line 1466
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    .line 1467
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1468
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_3f
    .catchall {:try_start_1 .. :try_end_3f} :catchall_41

    .line 1469
    monitor-exit p0

    return-void

    .line 1450
    :catchall_41
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private preDraw()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1202
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v0

    if-eqz v0, :cond_16

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_16

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-gtz v0, :cond_17

    .line 1222
    :cond_16
    :goto_16
    return-void

    .line 1207
    :cond_17
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    if-eqz v0, :cond_62

    .line 1208
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 1209
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_32

    .line 1210
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 1212
    :cond_32
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 1213
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 1214
    iput-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 1215
    iput-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 1216
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 1217
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 1221
    :cond_62
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    goto :goto_16
.end method

.method private refreshRequiredTiles(Z)V
    .registers 13
    .param p1, "load"    # Z

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1150
    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v6, :cond_b

    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v6, :cond_c

    .line 1185
    :cond_b
    return-void

    .line 1152
    :cond_c
    iget v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-direct {p0, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1156
    .local v2, "sampleSize":I
    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 1157
    .local v5, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_38
    :goto_38
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 1158
    .local v4, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-lt v6, v2, :cond_58

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-le v6, v2, :cond_6b

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v6, v7, :cond_6b

    .line 1159
    :cond_58
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1160
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_6b

    .line 1161
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 1162
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 1165
    :cond_6b
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-ne v6, v2, :cond_af

    .line 1166
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileVisible(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v6

    if-eqz v6, :cond_93

    .line 1167
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1168
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v6

    if-nez v6, :cond_38

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-nez v6, :cond_38

    if-eqz p1, :cond_38

    .line 1169
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v3, p0, v6, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 1170
    .local v3, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    invoke-direct {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto :goto_38

    .line 1172
    .end local v3    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    :cond_93
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v6, v7, :cond_38

    .line 1173
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1174
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_38

    .line 1175
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 1176
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    goto :goto_38

    .line 1179
    :cond_af
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v6, v7, :cond_38

    .line 1180
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    goto/16 :goto_38
.end method

.method private reset(Z)V
    .registers 10
    .param p1, "newImage"    # Z

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 431
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 432
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 433
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 434
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 435
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 436
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 437
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 438
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 439
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 440
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 441
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 442
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 443
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 444
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 445
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    .line 446
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 447
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    .line 448
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 449
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 450
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 451
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 452
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    .line 453
    if-eqz p1, :cond_68

    .line 454
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 455
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v4, :cond_47

    .line 456
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    monitor-enter v5

    .line 457
    :try_start_3e
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-interface {v4}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 458
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 459
    monitor-exit v5
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_ac

    .line 461
    :cond_47
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_54

    iget-boolean v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v4, :cond_54

    .line 462
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 464
    :cond_54
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 465
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 466
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 467
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    .line 468
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    .line 469
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    .line 470
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    .line 471
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 472
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 473
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 475
    :cond_68
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v4, :cond_b1

    .line 476
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_76
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_af

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 477
    .local v3, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8c
    :goto_8c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_76

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 478
    .local v2, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v2, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 479
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_8c

    .line 480
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 481
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    goto :goto_8c

    .line 459
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v3    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    :catchall_ac
    move-exception v4

    :try_start_ad
    monitor-exit v5
    :try_end_ae
    .catchall {:try_start_ad .. :try_end_ae} :catchall_ac

    throw v4

    .line 485
    :cond_af
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 487
    :cond_b1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 488
    return-void
.end method

.method private restoreState(Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V
    .registers 4
    .param p1, "state"    # Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    .prologue
    .line 1760
    if-eqz p1, :cond_31

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    if-eqz v0, :cond_31

    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getOrientation()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 1761
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getOrientation()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    .line 1762
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getScale()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 1763
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 1764
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1766
    :cond_31
    return-void
.end method

.method private sHeight()I
    .registers 3

    .prologue
    .line 1802
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    .line 1803
    .local v0, "rotation":I
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_c

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_f

    .line 1804
    :cond_c
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1806
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    goto :goto_e
.end method

.method private sWidth()I
    .registers 3

    .prologue
    .line 1789
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    .line 1790
    .local v0, "rotation":I
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_c

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_f

    .line 1791
    :cond_c
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1793
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    goto :goto_e
.end method

.method private setGestureDetector(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 491
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;

    invoke-direct {v1, p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    .line 540
    return-void
.end method

.method private setMatrixArray([FFFFFFFFF)V
    .registers 11
    .param p1, "array"    # [F
    .param p2, "f0"    # F
    .param p3, "f1"    # F
    .param p4, "f2"    # F
    .param p5, "f3"    # F
    .param p6, "f4"    # F
    .param p7, "f5"    # F
    .param p8, "f6"    # F
    .param p9, "f7"    # F

    .prologue
    .line 1019
    const/4 v0, 0x0

    aput p2, p1, v0

    .line 1020
    const/4 v0, 0x1

    aput p3, p1, v0

    .line 1021
    const/4 v0, 0x2

    aput p4, p1, v0

    .line 1022
    const/4 v0, 0x3

    aput p5, p1, v0

    .line 1023
    const/4 v0, 0x4

    aput p6, p1, v0

    .line 1024
    const/4 v0, 0x5

    aput p7, p1, v0

    .line 1025
    const/4 v0, 0x6

    aput p8, p1, v0

    .line 1026
    const/4 v0, 0x7

    aput p9, p1, v0

    .line 1027
    return-void
.end method

.method private sourceToViewRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 7
    .param p1, "sRect"    # Landroid/graphics/Rect;
    .param p2, "vTarget"    # Landroid/graphics/Rect;

    .prologue
    .line 1959
    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v0

    float-to-int v0, v0

    iget v1, p1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v1

    float-to-int v1, v1

    iget v2, p1, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    invoke-direct {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v2

    float-to-int v2, v2

    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    invoke-direct {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 1965
    return-object p2
.end method

.method private sourceToViewX(F)F
    .registers 4
    .param p1, "sx"    # F

    .prologue
    .line 1911
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1912
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    mul-float/2addr v0, p1

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    add-float/2addr v0, v1

    goto :goto_6
.end method

.method private sourceToViewY(F)F
    .registers 4
    .param p1, "sy"    # F

    .prologue
    .line 1919
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1920
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    mul-float/2addr v0, p1

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    add-float/2addr v0, v1

    goto :goto_6
.end method

.method private tileVisible(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z
    .registers 8
    .param p1, "tile"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    const/4 v5, 0x0

    .line 1191
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v1

    .line 1192
    .local v1, "sVisLeft":F
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v2

    .line 1193
    .local v2, "sVisRight":F
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v3

    .line 1194
    .local v3, "sVisTop":F
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v0

    .line 1195
    .local v0, "sVisBottom":F
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    cmpl-float v4, v1, v4

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    cmpl-float v4, v4, v2

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    cmpl-float v4, v3, v4

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    cmpl-float v4, v4, v0

    if-gtz v4, :cond_49

    const/4 v4, 0x1

    :goto_48
    return v4

    :cond_49
    const/4 v4, 0x0

    goto :goto_48
.end method

.method private vTranslateForSCenter(FFF)Landroid/graphics/PointF;
    .registers 10
    .param p1, "sCenterX"    # F
    .param p2, "sCenterY"    # F
    .param p3, "scale"    # F

    .prologue
    const/4 v5, 0x0

    .line 1974
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 1975
    .local v0, "vxCenter":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    add-int v1, v2, v3

    .line 1976
    .local v1, "vyCenter":I
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v2, :cond_3e

    .line 1977
    new-instance v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v5, v5}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v4, 0x0

    invoke-direct {v2, v5, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 1979
    :cond_3e
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1980
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    int-to-float v3, v0

    mul-float v4, p1, p3

    sub-float/2addr v3, v4

    int-to-float v4, v1

    mul-float v5, p2, p3

    sub-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 1981
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1982
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    return-object v2
.end method

.method private viewToSourceX(F)F
    .registers 4
    .param p1, "vx"    # F

    .prologue
    .line 1863
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1864
    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    sub-float v0, p1, v0

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr v0, v1

    goto :goto_6
.end method

.method private viewToSourceY(F)F
    .registers 4
    .param p1, "vy"    # F

    .prologue
    .line 1871
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1872
    :goto_6
    return v0

    :cond_7
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    sub-float v0, p1, v0

    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    div-float/2addr v0, v1

    goto :goto_6
.end method


# virtual methods
.method public animateCenter(Landroid/graphics/PointF;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 4
    .param p1, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v0, 0x0

    .line 2496
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2499
    :goto_7
    return-object v0

    :cond_8
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {v1, p0, p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    move-object v0, v1

    goto :goto_7
.end method

.method public animateScale(F)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 4
    .param p1, "scale"    # F

    .prologue
    const/4 v0, 0x0

    .line 2509
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2512
    :goto_7
    return-object v0

    :cond_8
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {v1, p0, p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    move-object v0, v1

    goto :goto_7
.end method

.method public animateScaleAndCenter(FLandroid/graphics/PointF;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 5
    .param p1, "scale"    # F
    .param p2, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v0, 0x0

    .line 2522
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2525
    :goto_7
    return-object v0

    :cond_8
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    move-object v0, v1

    goto :goto_7
.end method

.method public final getAppliedOrientation()I
    .registers 2

    .prologue
    .line 2334
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    return v0
.end method

.method public final getCenter()Landroid/graphics/PointF;
    .registers 5

    .prologue
    .line 2230
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 2231
    .local v0, "mX":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v2

    div-int/lit8 v1, v2, 0x2

    .line 2232
    .local v1, "mY":I
    int-to-float v2, v0

    int-to-float v3, v1

    invoke-virtual {p0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(FF)Landroid/graphics/PointF;

    move-result-object v2

    return-object v2
.end method

.method public getMaxScale()F
    .registers 2

    .prologue
    .line 2198
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    return v0
.end method

.method public final getMinScale()F
    .registers 2

    .prologue
    .line 2205
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    return v0
.end method

.method public final getOrientation()I
    .registers 2

    .prologue
    .line 2326
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    return v0
.end method

.method public final getSHeight()I
    .registers 2

    .prologue
    .line 2318
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    return v0
.end method

.method public final getSWidth()I
    .registers 2

    .prologue
    .line 2310
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    return v0
.end method

.method public final getScale()F
    .registers 2

    .prologue
    .line 2239
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    return v0
.end method

.method public final getState()Lcom/davemorrissey/labs/subscaleview/ImageViewState;
    .registers 5

    .prologue
    .line 2342
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_1e

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_1e

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v0, :cond_1e

    .line 2343
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getScale()F

    move-result v1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getOrientation()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;-><init>(FLandroid/graphics/PointF;I)V

    .line 2345
    :goto_1d
    return-object v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public final isImageLoaded()Z
    .registers 2

    .prologue
    .line 2295
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    return v0
.end method

.method public final isPanEnabled()Z
    .registers 2

    .prologue
    .line 2380
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    return v0
.end method

.method public final isQuickScaleEnabled()Z
    .registers 2

    .prologue
    .line 2366
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    return v0
.end method

.method public final isReady()Z
    .registers 2

    .prologue
    .line 2278
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    return v0
.end method

.method public final isZoomEnabled()Z
    .registers 2

    .prologue
    .line 2352
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 34
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 859
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 860
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->createPaints()V

    .line 863
    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-eqz v2, :cond_1e

    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-eqz v2, :cond_1e

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v2

    if-nez v2, :cond_1f

    .line 1013
    :cond_1e
    :goto_1e
    return-void

    .line 868
    :cond_1f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v2, :cond_34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v2, :cond_34

    .line 869
    invoke-direct/range {p0 .. p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getMaxBitmapDimensions(Landroid/graphics/Canvas;)Landroid/graphics/Point;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseBaseLayer(Landroid/graphics/Point;)V

    .line 875
    :cond_34
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 880
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 883
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    if-eqz v2, :cond_183

    .line 884
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v6

    sub-long v4, v2, v6

    .line 885
    .local v4, "scaleElapsed":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v2

    cmp-long v2, v4, v2

    if-lez v2, :cond_1f4

    const/16 v18, 0x1

    .line 886
    .local v18, "finished":Z
    :goto_5f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 887
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v7

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 890
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v6, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/PointF;->x:F

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v28

    .line 891
    .local v28, "vFocusNowX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v6, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/PointF;->y:F

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v29

    .line 893
    .local v29, "vFocusNowY":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v6

    sub-float v6, v6, v28

    sub-float/2addr v3, v6

    iput v3, v2, Landroid/graphics/PointF;->x:F

    .line 894
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v6

    sub-float v6, v6, v29

    sub-float/2addr v3, v6

    iput v3, v2, Landroid/graphics/PointF;->y:F

    .line 897
    if-nez v18, :cond_157

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v3

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1f8

    :cond_157
    const/4 v2, 0x1

    :goto_158
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 898
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 899
    if-eqz v18, :cond_180

    .line 900
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v2

    if-eqz v2, :cond_17b

    .line 902
    :try_start_170
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v2

    invoke-interface {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onComplete()V
    :try_end_17b
    .catch Ljava/lang/Exception; {:try_start_170 .. :try_end_17b} :catch_1fb

    .line 907
    :cond_17b
    :goto_17b
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 909
    :cond_180
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 912
    .end local v4    # "scaleElapsed":J
    .end local v18    # "finished":Z
    .end local v28    # "vFocusNowX":F
    .end local v29    # "vFocusNowY":F
    :cond_183
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v2, :cond_635

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v2

    if-eqz v2, :cond_635

    .line 915
    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v22

    .line 918
    .local v22, "sampleSize":I
    const/16 v19, 0x0

    .line 919
    .local v19, "hasMissingTiles":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_1af
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_207

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/util/Map$Entry;

    .line 920
    .local v24, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move/from16 v0, v22

    if-ne v2, v0, :cond_1af

    .line 921
    invoke-interface/range {v24 .. v24}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, "i$":Ljava/util/Iterator;
    :cond_1d3
    :goto_1d3
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1af

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 922
    .local v23, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_1d3

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-nez v2, :cond_1f1

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_1d3

    .line 923
    :cond_1f1
    const/16 v19, 0x1

    goto :goto_1d3

    .line 885
    .end local v19    # "hasMissingTiles":Z
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v22    # "sampleSize":I
    .end local v23    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v24    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    .restart local v4    # "scaleElapsed":J
    :cond_1f4
    const/16 v18, 0x0

    goto/16 :goto_5f

    .line 897
    .restart local v18    # "finished":Z
    .restart local v28    # "vFocusNowX":F
    .restart local v29    # "vFocusNowY":F
    :cond_1f8
    const/4 v2, 0x0

    goto/16 :goto_158

    .line 903
    :catch_1fb
    move-exception v17

    .line 904
    .local v17, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v3, "Error thrown by animation listener"

    move-object/from16 v0, v17

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_17b

    .line 930
    .end local v4    # "scaleElapsed":J
    .end local v17    # "e":Ljava/lang/Exception;
    .end local v18    # "finished":Z
    .end local v28    # "vFocusNowX":F
    .end local v29    # "vFocusNowY":F
    .restart local v19    # "hasMissingTiles":Z
    .restart local v22    # "sampleSize":I
    :cond_207
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :cond_213
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c1

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/util/Map$Entry;

    .line 931
    .restart local v24    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface/range {v24 .. v24}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move/from16 v0, v22

    if-eq v2, v0, :cond_22f

    if-eqz v19, :cond_213

    .line 932
    :cond_22f
    invoke-interface/range {v24 .. v24}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .restart local v21    # "i$":Ljava/util/Iterator;
    :cond_239
    :goto_239
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_213

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 933
    .restart local v23    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 934
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-nez v2, :cond_496

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_496

    .line 935
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_271

    .line 936
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 938
    :cond_271
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v2, :cond_280

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 939
    :cond_280
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 940
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    const/4 v8, 0x0

    const/4 v9, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v10, v2

    const/4 v11, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v13, v2

    const/4 v14, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 941
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    if-nez v2, :cond_3b5

    .line 942
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 950
    :cond_2ff
    :goto_2ff
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    const/4 v10, 0x0

    const/4 v11, 0x4

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z

    .line 951
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 952
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_335

    .line 953
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 958
    :cond_335
    :goto_335
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_239

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_239

    .line 959
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ISS "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " RECT "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v3, 0x5

    int-to-float v3, v3

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/lit8 v6, v6, 0xf

    int-to-float v6, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_239

    .line 943
    :cond_3b5
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_400

    .line 944
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2ff

    .line 945
    :cond_400
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_44b

    .line 946
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2ff

    .line 947
    :cond_44b
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_2ff

    .line 948
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2ff

    .line 955
    :cond_496
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_335

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_335

    .line 956
    const-string v2, "LOADING"

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v3, 0x5

    int-to-float v3, v3

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v23 .. v23}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/lit8 v6, v6, 0x23

    int-to-float v6, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_335

    .line 965
    .end local v21    # "i$":Ljava/util/Iterator;
    .end local v23    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v24    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    :cond_4c1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_1e

    .line 966
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Scale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%.2f"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v9, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v3, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v6, 0x41700000    # 15.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 967
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Translate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%.2f"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v3, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%.2f"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v3, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v6, 0x420c0000    # 35.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 968
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v16

    .line 969
    .local v16, "center":Landroid/graphics/PointF;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Source center: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%.2f"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, v16

    iget v9, v0, Landroid/graphics/PointF;->x:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v3, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v6, "%.2f"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, v16

    iget v9, v0, Landroid/graphics/PointF;->y:F

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v3, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v6, 0x425c0000    # 55.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 971
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    if-eqz v2, :cond_1e

    .line 972
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v27

    .line 973
    .local v27, "vCenterStart":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v26

    .line 974
    .local v26, "vCenterEndRequested":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v25

    .line 975
    .local v25, "vCenterEnd":Landroid/graphics/PointF;
    move-object/from16 v0, v27

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v27

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 976
    move-object/from16 v0, v26

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v26

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41a00000    # 20.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 977
    move-object/from16 v0, v25

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v25

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41c80000    # 25.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 978
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    const/high16 v6, 0x41f00000    # 30.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_1e

    .line 982
    .end local v16    # "center":Landroid/graphics/PointF;
    .end local v19    # "hasMissingTiles":Z
    .end local v22    # "sampleSize":I
    .end local v25    # "vCenterEnd":Landroid/graphics/PointF;
    .end local v26    # "vCenterEndRequested":Landroid/graphics/PointF;
    .end local v27    # "vCenterStart":Landroid/graphics/PointF;
    :cond_635
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1e

    .line 984
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v30, v0

    .local v30, "xScale":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v31, v0

    .line 985
    .local v31, "yScale":F
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-eqz v2, :cond_677

    .line 986
    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v3, v6

    mul-float v30, v2, v3

    .line 987
    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v3, v6

    mul-float v31, v2, v3

    .line 990
    :cond_677
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v2, :cond_686

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 991
    :cond_686
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 992
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move/from16 v0, v30

    move/from16 v1, v31

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 993
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 994
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 996
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_72d

    .line 997
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v6, v6

    mul-float/2addr v3, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v7, v7

    mul-float/2addr v6, v7

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1004
    :cond_6da
    :goto_6da
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_71a

    .line 1005
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    if-nez v2, :cond_6ef

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    .line 1006
    :cond_6ef
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v8, v8

    invoke-virtual {v2, v3, v6, v7, v8}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1007
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 1008
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1010
    :cond_71a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto/16 :goto_1e

    .line 998
    :cond_72d
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_748

    .line 999
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    int-to-float v6, v6

    mul-float/2addr v3, v6

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_6da

    .line 1000
    :cond_748
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_6da

    .line 1001
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    iget v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    int-to-float v7, v7

    mul-float/2addr v6, v7

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_6da
.end method

.method protected onImageLoaded()V
    .registers 1

    .prologue
    .line 2303
    return-void
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 561
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v7

    .line 562
    .local v7, "widthSpecMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 563
    .local v1, "heightSpecMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 564
    .local v3, "parentWidth":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 565
    .local v2, "parentHeight":I
    if-eq v7, v9, :cond_43

    move v5, v4

    .line 566
    .local v5, "resizeWidth":Z
    :goto_17
    if-eq v1, v9, :cond_45

    .line 567
    .local v4, "resizeHeight":Z
    :goto_19
    move v6, v3

    .line 568
    .local v6, "width":I
    move v0, v2

    .line 569
    .local v0, "height":I
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v8, :cond_2f

    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v8, :cond_2f

    .line 570
    if-eqz v5, :cond_47

    if-eqz v4, :cond_47

    .line 571
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v6

    .line 572
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v0

    .line 579
    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getSuggestedMinimumWidth()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 580
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getSuggestedMinimumHeight()I

    move-result v8

    invoke-static {v0, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 581
    invoke-virtual {p0, v6, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMeasuredDimension(II)V

    .line 582
    return-void

    .end local v0    # "height":I
    .end local v4    # "resizeHeight":Z
    .end local v5    # "resizeWidth":Z
    .end local v6    # "width":I
    :cond_43
    move v5, v8

    .line 565
    goto :goto_17

    .restart local v5    # "resizeWidth":Z
    :cond_45
    move v4, v8

    .line 566
    goto :goto_19

    .line 573
    .restart local v0    # "height":I
    .restart local v4    # "resizeHeight":Z
    .restart local v6    # "width":I
    :cond_47
    if-eqz v4, :cond_58

    .line 574
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-double v8, v8

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v10

    int-to-double v10, v10

    div-double/2addr v8, v10

    int-to-double v10, v6

    mul-double/2addr v8, v10

    double-to-int v0, v8

    goto :goto_2f

    .line 575
    :cond_58
    if-eqz v5, :cond_2f

    .line 576
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-double v8, v8

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v10

    int-to-double v10, v10

    div-double/2addr v8, v10

    int-to-double v10, v0

    mul-double/2addr v8, v10

    double-to-int v6, v8

    goto :goto_2f
.end method

.method protected onReady()V
    .registers 1

    .prologue
    .line 2288
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 547
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 548
    .local v0, "sCenter":Landroid/graphics/PointF;
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_17

    if-eqz v0, :cond_17

    .line 549
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 550
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 551
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 553
    :cond_17
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 33
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 590
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v27, v0

    if-eqz v27, :cond_20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v27, v0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z
    invoke-static/range {v27 .. v27}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Z

    move-result v27

    if-nez v27, :cond_20

    .line 591
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v27

    const/16 v28, 0x1

    invoke-interface/range {v27 .. v28}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 592
    const/16 v27, 0x1

    .line 821
    :goto_1f
    return v27

    .line 594
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v27, v0

    if-eqz v27, :cond_41

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v27, v0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static/range {v27 .. v27}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v27

    if-eqz v27, :cond_41

    .line 596
    :try_start_34
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v27, v0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static/range {v27 .. v27}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onInterruptedByUser()V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_41} :catch_54

    .line 601
    :cond_41
    :goto_41
    const/16 v27, 0x0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 605
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    if-nez v27, :cond_61

    .line 606
    const/16 v27, 0x1

    goto :goto_1f

    .line 597
    :catch_54
    move-exception v11

    .line 598
    .local v11, "e":Ljava/lang/Exception;
    sget-object v27, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v28, "Error thrown by animation listener"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-static {v0, v1, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_41

    .line 609
    .end local v11    # "e":Ljava/lang/Exception;
    :cond_61
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v27, v0

    if-nez v27, :cond_9c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    move-object/from16 v27, v0

    if-eqz v27, :cond_81

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v27

    if-eqz v27, :cond_9c

    .line 610
    :cond_81
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 611
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 612
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 613
    const/16 v27, 0x1

    goto :goto_1f

    .line 616
    :cond_9c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    if-nez v27, :cond_b3

    new-instance v27, Landroid/graphics/PointF;

    const/16 v28, 0x0

    const/16 v29, 0x0

    invoke-direct/range {v27 .. v29}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 617
    :cond_b3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    if-nez v27, :cond_ca

    new-instance v27, Landroid/graphics/PointF;

    const/16 v28, 0x0

    const/16 v29, 0x0

    invoke-direct/range {v27 .. v29}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 619
    :cond_ca
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v18

    .line 620
    .local v18, "touchCount":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v27

    sparse-switch v27, :sswitch_data_982

    .line 821
    :cond_d5
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v27

    goto/16 :goto_1f

    .line 624
    :sswitch_db
    const/16 v27, 0x0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 625
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v27

    const/16 v28, 0x1

    invoke-interface/range {v27 .. v28}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 626
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v27, v0

    move/from16 v0, v27

    move/from16 v1, v18

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 627
    const/16 v27, 0x2

    move/from16 v0, v18

    move/from16 v1, v27

    if-lt v0, v1, :cond_1cc

    .line 628
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    move/from16 v27, v0

    if-eqz v27, :cond_1c3

    .line 630
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    const/16 v30, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v30

    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v8

    .line 631
    .local v8, "distance":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 632
    move-object/from16 v0, p0

    iput v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 633
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 634
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v29

    add-float v28, v28, v29

    const/high16 v29, 0x40000000    # 2.0f

    div-float v28, v28, v29

    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    const/16 v30, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v30

    add-float v29, v29, v30

    const/high16 v30, 0x40000000    # 2.0f

    div-float v29, v29, v30

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 640
    .end local v8    # "distance":F
    :goto_1b4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/os/Handler;->removeMessages(I)V

    .line 649
    :cond_1bf
    :goto_1bf
    const/16 v27, 0x1

    goto/16 :goto_1f

    .line 637
    :cond_1c3
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    goto :goto_1b4

    .line 641
    :cond_1cc
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v27, v0

    if-nez v27, :cond_1bf

    .line 643
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 644
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v28

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v29

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 647
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    const-wide/16 v29, 0x258

    invoke-virtual/range {v27 .. v30}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_1bf

    .line 651
    :sswitch_214
    const/4 v6, 0x0

    .line 652
    .local v6, "consumed":Z
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v27, v0

    if-lez v27, :cond_35c

    .line 653
    const/16 v27, 0x2

    move/from16 v0, v18

    move/from16 v1, v27

    if-lt v0, v1, :cond_4a8

    .line 655
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    const/16 v30, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v30

    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v28

    move/from16 v3, v29

    move/from16 v4, v30

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v21

    .line 656
    .local v21, "vDistEnd":F
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    add-float v27, v27, v28

    const/high16 v28, 0x40000000    # 2.0f

    div-float v19, v27, v28

    .line 657
    .local v19, "vCenterEndX":F
    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v27

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    add-float v27, v27, v28

    const/high16 v28, 0x40000000    # 2.0f

    div-float v20, v27, v28

    .line 659
    .local v20, "vCenterEndY":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    move/from16 v27, v0

    if-eqz v27, :cond_35c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v19

    move/from16 v3, v28

    move/from16 v4, v20

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v27

    const/high16 v28, 0x40a00000    # 5.0f

    cmpl-float v27, v27, v28

    if-gtz v27, :cond_2dd

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    move/from16 v27, v0

    sub-float v27, v21, v27

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v27

    const/high16 v28, 0x40a00000    # 5.0f

    cmpl-float v27, v27, v28

    if-gtz v27, :cond_2dd

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v27, v0

    if-eqz v27, :cond_35c

    .line 660
    :cond_2dd
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 661
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 662
    const/4 v6, 0x1

    .line 664
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    move/from16 v28, v0

    div-float v28, v21, v28

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v29, v0

    mul-float v28, v28, v29

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->min(FF)F

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 666
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v28

    cmpg-float v27, v27, v28

    if-gtz v27, :cond_370

    .line 668
    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 669
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 670
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 671
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    invoke-virtual/range {v27 .. v28}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 691
    :goto_34a
    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 692
    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 774
    .end local v19    # "vCenterEndX":F
    .end local v20    # "vCenterEndY":F
    .end local v21    # "vDistEnd":F
    :cond_35c
    :goto_35c
    if-eqz v6, :cond_d5

    .line 775
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/os/Handler;->removeMessages(I)V

    .line 776
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 777
    const/16 v27, 0x1

    goto/16 :goto_1f

    .line 672
    .restart local v19    # "vCenterEndX":F
    .restart local v20    # "vCenterEndY":F
    .restart local v21    # "vDistEnd":F
    :cond_370
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v27, v0

    if-eqz v27, :cond_3ea

    .line 675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    sub-float v23, v27, v28

    .line 676
    .local v23, "vLeftStart":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    sub-float v25, v27, v28

    .line 677
    .local v25, "vTopStart":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v28, v0

    div-float v27, v27, v28

    mul-float v22, v23, v27

    .line 678
    .local v22, "vLeftNow":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v28, v0

    div-float v27, v27, v28

    mul-float v24, v25, v27

    .line 679
    .local v24, "vTopNow":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    sub-float v28, v19, v22

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    sub-float v28, v20, v24

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_34a

    .line 681
    .end local v22    # "vLeftNow":F
    .end local v23    # "vLeftStart":F
    .end local v24    # "vTopNow":F
    .end local v25    # "vTopStart":F
    :cond_3ea
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    if-eqz v27, :cond_44e

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 684
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_34a

    .line 687
    :cond_44e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_34a

    .line 694
    .end local v19    # "vCenterEndX":F
    .end local v20    # "vCenterEndY":F
    .end local v21    # "vDistEnd":F
    :cond_4a8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v27, v0

    if-eqz v27, :cond_6d5

    .line 697
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v28

    sub-float v27, v27, v28

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v27

    const/high16 v28, 0x40000000    # 2.0f

    mul-float v27, v27, v28

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    move/from16 v28, v0

    add-float v7, v27, v28

    .line 699
    .local v7, "dist":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v27, v0

    const/high16 v28, -0x40800000    # -1.0f

    cmpl-float v27, v27, v28

    if-nez v27, :cond_4e2

    move-object/from16 v0, p0

    iput v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 700
    :cond_4e2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    cmpl-float v27, v27, v28

    if-lez v27, :cond_60e

    const/4 v13, 0x1

    .line 701
    .local v13, "isUpwards":Z
    :goto_4f7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v29

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 703
    const/high16 v27, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v28, v0

    div-float v28, v7, v28

    sub-float v27, v27, v28

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v27

    const/high16 v28, 0x3f000000    # 0.5f

    mul-float v17, v27, v28

    .line 705
    .local v17, "spanDiff":F
    const v27, 0x3cf5c28f    # 0.03f

    cmpl-float v27, v17, v27

    if-gtz v27, :cond_529

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    move/from16 v27, v0

    if-eqz v27, :cond_5f5

    .line 706
    :cond_529
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 708
    const/high16 v16, 0x3f800000    # 1.0f

    .line 709
    .local v16, "multiplier":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v27, v0

    const/16 v28, 0x0

    cmpl-float v27, v27, v28

    if-lez v27, :cond_545

    .line 710
    if-eqz v13, :cond_611

    const/high16 v27, 0x3f800000    # 1.0f

    add-float v16, v27, v17

    .line 713
    :cond_545
    :goto_545
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v27

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    mul-float v29, v29, v16

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->min(FF)F

    move-result v28

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->max(FF)F

    move-result v27

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 715
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v27, v0

    if-eqz v27, :cond_617

    .line 716
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    sub-float v23, v27, v28

    .line 717
    .restart local v23    # "vLeftStart":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    sub-float v25, v27, v28

    .line 718
    .restart local v25    # "vTopStart":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v28, v0

    div-float v27, v27, v28

    mul-float v22, v23, v27

    .line 719
    .restart local v22    # "vLeftNow":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v28, v0

    div-float v27, v27, v28

    mul-float v24, v25, v27

    .line 720
    .restart local v24    # "vTopNow":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    sub-float v28, v28, v22

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    sub-float v28, v28, v24

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 733
    .end local v16    # "multiplier":F
    .end local v22    # "vLeftNow":F
    .end local v23    # "vLeftStart":F
    .end local v24    # "vTopNow":F
    .end local v25    # "vTopStart":F
    :cond_5f5
    :goto_5f5
    move-object/from16 v0, p0

    iput v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 735
    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 736
    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 738
    const/4 v6, 0x1

    .line 739
    goto/16 :goto_35c

    .line 700
    .end local v13    # "isUpwards":Z
    .end local v17    # "spanDiff":F
    :cond_60e
    const/4 v13, 0x0

    goto/16 :goto_4f7

    .line 710
    .restart local v13    # "isUpwards":Z
    .restart local v16    # "multiplier":F
    .restart local v17    # "spanDiff":F
    :cond_611
    const/high16 v27, 0x3f800000    # 1.0f

    sub-float v16, v27, v17

    goto/16 :goto_545

    .line 722
    :cond_617
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    if-eqz v27, :cond_67b

    .line 724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 725
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_5f5

    .line 728
    :cond_67b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 729
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v28

    div-int/lit8 v28, v28, 0x2

    move/from16 v0, v28

    int-to-float v0, v0

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v30

    div-int/lit8 v30, v30, 0x2

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v30, v0

    mul-float v29, v29, v30

    sub-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_5f5

    .line 739
    .end local v7    # "dist":F
    .end local v13    # "isUpwards":Z
    .end local v16    # "multiplier":F
    .end local v17    # "spanDiff":F
    :cond_6d5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v27, v0

    if-nez v27, :cond_35c

    .line 742
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    sub-float v27, v27, v28

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 743
    .local v9, "dx":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    sub-float v27, v27, v28

    invoke-static/range {v27 .. v27}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 744
    .local v10, "dy":F
    const/high16 v27, 0x40a00000    # 5.0f

    cmpl-float v27, v9, v27

    if-gtz v27, :cond_71d

    const/high16 v27, 0x40a00000    # 5.0f

    cmpl-float v27, v10, v27

    if-gtz v27, :cond_71d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v27, v0

    if-eqz v27, :cond_35c

    .line 745
    :cond_71d
    const/4 v6, 0x1

    .line 746
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v30, v0

    sub-float v29, v29, v30

    add-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v29

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v30, v0

    sub-float v29, v29, v30

    add-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v14, v0, Landroid/graphics/PointF;->x:F

    .line 750
    .local v14, "lastX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v15, v0, Landroid/graphics/PointF;->y:F

    .line 751
    .local v15, "lastY":F
    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    cmpl-float v27, v14, v27

    if-eqz v27, :cond_82d

    const/4 v5, 0x1

    .line 753
    .local v5, "atXEdge":Z
    :goto_7a4
    if-eqz v5, :cond_830

    cmpl-float v27, v9, v10

    if-lez v27, :cond_830

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v27, v0

    if-nez v27, :cond_830

    const/4 v12, 0x1

    .line 754
    .local v12, "edgeXSwipe":Z
    :goto_7b3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    cmpl-float v27, v15, v27

    if-nez v27, :cond_832

    const/high16 v27, 0x41700000    # 15.0f

    cmpl-float v27, v10, v27

    if-lez v27, :cond_832

    const/16 v26, 0x1

    .line 755
    .local v26, "yPan":Z
    :goto_7cb
    if-nez v12, :cond_835

    if-eqz v5, :cond_7d9

    if-nez v26, :cond_7d9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v27, v0

    if-eqz v27, :cond_835

    .line 756
    :cond_7d9
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 764
    :cond_7e1
    :goto_7e1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v27, v0

    if-nez v27, :cond_822

    .line 765
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 766
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    move/from16 v0, v28

    move-object/from16 v1, v27

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 767
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v27

    const/16 v28, 0x0

    invoke-interface/range {v27 .. v28}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 770
    :cond_822
    const/16 v27, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    goto/16 :goto_35c

    .line 752
    .end local v5    # "atXEdge":Z
    .end local v12    # "edgeXSwipe":Z
    .end local v26    # "yPan":Z
    :cond_82d
    const/4 v5, 0x0

    goto/16 :goto_7a4

    .line 753
    .restart local v5    # "atXEdge":Z
    :cond_830
    const/4 v12, 0x0

    goto :goto_7b3

    .line 754
    .restart local v12    # "edgeXSwipe":Z
    :cond_832
    const/16 v26, 0x0

    goto :goto_7cb

    .line 757
    .restart local v26    # "yPan":Z
    :cond_835
    const/high16 v27, 0x40a00000    # 5.0f

    cmpl-float v27, v9, v27

    if-lez v27, :cond_7e1

    .line 759
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 760
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/os/Handler;->removeMessages(I)V

    .line 761
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v27

    const/16 v28, 0x0

    invoke-interface/range {v27 .. v28}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_7e1

    .line 783
    .end local v5    # "atXEdge":Z
    .end local v6    # "consumed":Z
    .end local v9    # "dx":F
    .end local v10    # "dy":F
    .end local v12    # "edgeXSwipe":Z
    .end local v14    # "lastX":F
    .end local v15    # "lastY":F
    .end local v26    # "yPan":Z
    :sswitch_858
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    invoke-virtual/range {v27 .. v28}, Landroid/os/Handler;->removeMessages(I)V

    .line 784
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v27, v0

    if-eqz v27, :cond_890

    .line 785
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 786
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    move/from16 v27, v0

    if-nez v27, :cond_890

    .line 787
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 790
    :cond_890
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v27, v0

    if-lez v27, :cond_95d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v27, v0

    if-nez v27, :cond_8a8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v27, v0

    if-eqz v27, :cond_95d

    .line 791
    :cond_8a8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v27, v0

    if-eqz v27, :cond_90a

    const/16 v27, 0x2

    move/from16 v0, v18

    move/from16 v1, v27

    if-ne v0, v1, :cond_90a

    .line 793
    const/16 v27, 0x1

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 794
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 795
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v27

    const/16 v28, 0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_93f

    .line 796
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    const/16 v29, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    .line 801
    :cond_90a
    :goto_90a
    const/16 v27, 0x3

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_91a

    .line 803
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 805
    :cond_91a
    const/16 v27, 0x2

    move/from16 v0, v18

    move/from16 v1, v27

    if-ge v0, v1, :cond_932

    .line 807
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 808
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 811
    :cond_932
    const/16 v27, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 812
    const/16 v27, 0x1

    goto/16 :goto_1f

    .line 798
    :cond_93f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v28

    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    invoke-virtual/range {v27 .. v29}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_90a

    .line 814
    :cond_95d
    const/16 v27, 0x1

    move/from16 v0, v18

    move/from16 v1, v27

    if-ne v0, v1, :cond_97d

    .line 815
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 816
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 817
    const/16 v27, 0x0

    move/from16 v0, v27

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 819
    :cond_97d
    const/16 v27, 0x1

    goto/16 :goto_1f

    .line 620
    nop

    :sswitch_data_982
    .sparse-switch
        0x0 -> :sswitch_db
        0x1 -> :sswitch_858
        0x2 -> :sswitch_214
        0x5 -> :sswitch_db
        0x6 -> :sswitch_858
        0x105 -> :sswitch_db
        0x106 -> :sswitch_858
    .end sparse-switch
.end method

.method public recycle()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1853
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1854
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 1855
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    .line 1856
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 1857
    return-void
.end method

.method public final resetScaleAndCenter()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 2261
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2262
    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 2263
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 2264
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 2268
    :goto_29
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2269
    return-void

    .line 2266
    :cond_2d
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    goto :goto_29
.end method

.method public final setBitmapDecoderClass(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2108
    .local p1, "bitmapDecoderClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;>;"
    if-nez p1, :cond_a

    .line 2109
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder class cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2111
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    invoke-direct {v0, p1}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2112
    return-void
.end method

.method public final setBitmapDecoderFactory(Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2120
    .local p1, "bitmapDecoderFactory":Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;, "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;>;"
    if-nez p1, :cond_a

    .line 2121
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder factory cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2123
    :cond_a
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2124
    return-void
.end method

.method public final setDebug(Z)V
    .registers 2
    .param p1, "debug"    # Z

    .prologue
    .line 2469
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    .line 2470
    return-void
.end method

.method public final setDoubleTapZoomDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2430
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2431
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2432
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomScale(F)V

    .line 2433
    return-void
.end method

.method public final setDoubleTapZoomDuration(I)V
    .registers 3
    .param p1, "durationMs"    # I

    .prologue
    .line 2451
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomDuration:I

    .line 2452
    return-void
.end method

.method public final setDoubleTapZoomScale(F)V
    .registers 2
    .param p1, "doubleTapZoomScale"    # F

    .prologue
    .line 2420
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    .line 2421
    return-void
.end method

.method public final setDoubleTapZoomStyle(I)V
    .registers 5
    .param p1, "doubleTapZoomStyle"    # I

    .prologue
    .line 2440
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ZOOM_STYLES:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2441
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid zoom style: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2443
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    .line 2444
    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V
    .registers 3
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;

    .prologue
    const/4 v0, 0x0

    .line 333
    invoke-virtual {p0, p1, v0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 334
    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;)V
    .registers 4
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p2, "previewSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;

    .prologue
    .line 358
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 359
    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V
    .registers 15
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p2, "previewSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p3, "state"    # Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    .prologue
    const/4 v5, 0x1

    const/4 v10, 0x0

    .line 375
    if-nez p1, :cond_c

    .line 376
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "imageSource must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 379
    :cond_c
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 380
    if-eqz p3, :cond_14

    invoke-direct {p0, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->restoreState(Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 382
    :cond_14
    if-eqz p2, :cond_5d

    .line 383
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_24

    .line 384
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preview image cannot be used when a bitmap is provided for the main image"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 386
    :cond_24
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSWidth()I

    move-result v1

    if-lez v1, :cond_30

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSHeight()I

    move-result v1

    if-gtz v1, :cond_38

    .line 387
    :cond_30
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preview image cannot be used unless dimensions are provided for the main image"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 389
    :cond_38
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSWidth()I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 390
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSHeight()I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 391
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    .line 392
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_91

    .line 393
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->isCached()Z

    move-result v1

    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 394
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onPreviewLoaded(Landroid/graphics/Bitmap;)V

    .line 405
    :cond_5d
    :goto_5d
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_da

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    if-eqz v1, :cond_da

    .line 406
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    invoke-static {v1, v2, v3, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v1, v10, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded(Landroid/graphics/Bitmap;IZ)V

    .line 425
    :goto_90
    return-void

    .line 396
    :cond_91
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 397
    .local v4, "uri":Landroid/net/Uri;
    if-nez v4, :cond_ca

    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_ca

    .line 398
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "android.resource://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 400
    :cond_ca
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 401
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto :goto_5d

    .line 407
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_da
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_ec

    .line 408
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->isCached()Z

    move-result v2

    invoke-direct {p0, v1, v10, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded(Landroid/graphics/Bitmap;IZ)V

    goto :goto_90

    .line 410
    :cond_ec
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    .line 411
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getUri()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 412
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    if-nez v1, :cond_131

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_131

    .line 413
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "android.resource://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 415
    :cond_131
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getTile()Z

    move-result v1

    if-nez v1, :cond_13b

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    if-eqz v1, :cond_14d

    .line 417
    :cond_13b
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;)V

    .line 418
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto/16 :goto_90

    .line 421
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
    :cond_14d
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    move-object v5, v0

    move-object v6, p0

    invoke-direct/range {v5 .. v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 422
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto/16 :goto_90
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V
    .registers 4
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p2, "state"    # Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    .prologue
    .line 344
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 345
    return-void
.end method

.method public final setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F

    .prologue
    .line 2160
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 2161
    return-void
.end method

.method public final setMaximumDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2189
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2190
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2191
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMinScale(F)V

    .line 2192
    return-void
.end method

.method public final setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F

    .prologue
    .line 2168
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    .line 2169
    return-void
.end method

.method public final setMinimumDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2178
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2179
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2180
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMaxScale(F)V

    .line 2181
    return-void
.end method

.method public final setMinimumScaleType(I)V
    .registers 5
    .param p1, "scaleType"    # I

    .prologue
    .line 2144
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_SCALE_TYPES:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2145
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid scale type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2147
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    .line 2148
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2149
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 2150
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2152
    :cond_34
    return-void
.end method

.method public setMinimumTileDpi(I)V
    .registers 6
    .param p1, "minimumTileDpi"    # I

    .prologue
    .line 2217
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2218
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2219
    .local v0, "averageDpi":F
    int-to-float v2, p1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    .line 2220
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 2221
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 2222
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2224
    :cond_26
    return-void
.end method

.method public setOnImageEventListener(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;)V
    .registers 2
    .param p1, "onImageEventListener"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    .prologue
    .line 2484
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    .line 2485
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "onLongClickListener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 2477
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 2478
    return-void
.end method

.method public final setOrientation(I)V
    .registers 5
    .param p1, "orientation"    # I

    .prologue
    .line 319
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 320
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid orientation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    .line 323
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 324
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 325
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V

    .line 326
    return-void
.end method

.method public final setPanEnabled(Z)V
    .registers 6
    .param p1, "panEnabled"    # Z

    .prologue
    .line 2387
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    .line 2388
    if-nez p1, :cond_41

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_41

    .line 2389
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 2390
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->y:F

    .line 2391
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 2392
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 2393
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2396
    :cond_41
    return-void
.end method

.method public final setPanLimit(I)V
    .registers 5
    .param p1, "panLimit"    # I

    .prologue
    .line 2130
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_PAN_LIMITS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid pan limit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2133
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    .line 2134
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2135
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 2136
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2138
    :cond_34
    return-void
.end method

.method public setParallelLoadingEnabled(Z)V
    .registers 2
    .param p1, "parallelLoadingEnabled"    # Z

    .prologue
    .line 2462
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->parallelLoadingEnabled:Z

    .line 2463
    return-void
.end method

.method public final setQuickScaleEnabled(Z)V
    .registers 2
    .param p1, "quickScaleEnabled"    # Z

    .prologue
    .line 2373
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    .line 2374
    return-void
.end method

.method public final setRegionDecoderClass(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2082
    .local p1, "regionDecoderClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;>;"
    if-nez p1, :cond_a

    .line 2083
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder class cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2085
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    invoke-direct {v0, p1}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2086
    return-void
.end method

.method public final setRegionDecoderFactory(Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory",
            "<+",
            "Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2095
    .local p1, "regionDecoderFactory":Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;, "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;>;"
    if-nez p1, :cond_a

    .line 2096
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder factory cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2098
    :cond_a
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2099
    return-void
.end method

.method public final setScaleAndCenter(FLandroid/graphics/PointF;)V
    .registers 4
    .param p1, "scale"    # F
    .param p2, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    .line 2249
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2250
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 2251
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 2252
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 2253
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2254
    return-void
.end method

.method public final setTileBackgroundColor(I)V
    .registers 4
    .param p1, "tileBgColor"    # I

    .prologue
    .line 2403
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_d

    .line 2404
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 2410
    :goto_9
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2411
    return-void

    .line 2406
    :cond_d
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 2407
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2408
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_9
.end method

.method public final setZoomEnabled(Z)V
    .registers 2
    .param p1, "zoomEnabled"    # Z

    .prologue
    .line 2359
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    .line 2360
    return-void
.end method

.method public final sourceToViewCoord(FF)Landroid/graphics/PointF;
    .registers 4
    .param p1, "sx"    # F
    .param p2, "sy"    # F

    .prologue
    .line 1934
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public final sourceToViewCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 6
    .param p1, "sx"    # F
    .param p2, "sy"    # F
    .param p3, "vTarget"    # Landroid/graphics/PointF;

    .prologue
    .line 1948
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_6

    .line 1949
    const/4 p3, 0x0

    .line 1952
    .end local p3    # "vTarget":Landroid/graphics/PointF;
    :goto_5
    return-object p3

    .line 1951
    .restart local p3    # "vTarget":Landroid/graphics/PointF;
    :cond_6
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v0

    invoke-direct {p0, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v1

    invoke-virtual {p3, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_5
.end method

.method public final sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 5
    .param p1, "sxy"    # Landroid/graphics/PointF;

    .prologue
    .line 1927
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->y:F

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {p0, v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public final sourceToViewCoord(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 5
    .param p1, "sxy"    # Landroid/graphics/PointF;
    .param p2, "vTarget"    # Landroid/graphics/PointF;

    .prologue
    .line 1941
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, v0, v1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public final viewToSourceCoord(FF)Landroid/graphics/PointF;
    .registers 4
    .param p1, "vx"    # F
    .param p2, "vy"    # F

    .prologue
    .line 1886
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public final viewToSourceCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 6
    .param p1, "vx"    # F
    .param p2, "vy"    # F
    .param p3, "sTarget"    # Landroid/graphics/PointF;

    .prologue
    .line 1900
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_6

    .line 1901
    const/4 p3, 0x0

    .line 1904
    .end local p3    # "sTarget":Landroid/graphics/PointF;
    :goto_5
    return-object p3

    .line 1903
    .restart local p3    # "sTarget":Landroid/graphics/PointF;
    :cond_6
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v0

    invoke-direct {p0, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v1

    invoke-virtual {p3, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_5
.end method

.method public final viewToSourceCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 5
    .param p1, "vxy"    # Landroid/graphics/PointF;

    .prologue
    .line 1879
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->y:F

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual {p0, v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public final viewToSourceCoord(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 5
    .param p1, "vxy"    # Landroid/graphics/PointF;
    .param p2, "sTarget"    # Landroid/graphics/PointF;

    .prologue
    .line 1893
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, v0, v1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method
