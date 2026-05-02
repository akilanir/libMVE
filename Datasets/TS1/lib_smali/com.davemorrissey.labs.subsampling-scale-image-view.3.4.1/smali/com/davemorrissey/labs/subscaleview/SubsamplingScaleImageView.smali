.class public Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.super Landroid/view/View;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$DefaultOnImageEventListener;,
        Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;,
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
    .line 310
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 311
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

    .line 261
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

    .line 215
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    .line 216
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 217
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    const-class v4, Lcom/davemorrissey/labs/subscaleview/decoder/SkiaImageRegionDecoder;

    invoke-direct {v3, v4}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 257
    const/16 v3, 0x8

    new-array v3, v3, [F

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    .line 258
    const/16 v3, 0x8

    new-array v3, v3, [F

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    .line 262
    const/16 v3, 0xa0

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMinimumDpi(I)V

    .line 263
    const/16 v3, 0xa0

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomDpi(I)V

    .line 264
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 265
    new-instance v3, Landroid/os/Handler;

    new-instance v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    invoke-direct {v4, p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    .line 277
    if-eqz p2, :cond_e2

    .line 278
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/davemorrissey/labs/subscaleview/R$styleable;->SubsamplingScaleImageView:[I

    invoke-virtual {v3, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 279
    .local v2, "typedAttr":Landroid/content/res/TypedArray;
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_8e

    .line 280
    invoke-virtual {v2, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "assetName":Ljava/lang/String;
    if-eqz v0, :cond_8e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_8e

    .line 282
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->asset(Ljava/lang/String;)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {v3}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tilingEnabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 285
    .end local v0    # "assetName":Ljava/lang/String;
    :cond_8e
    invoke-virtual {v2, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_a5

    .line 286
    invoke-virtual {v2, v6, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 287
    .local v1, "resId":I
    if-lez v1, :cond_a5

    .line 288
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource(I)Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {v3}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tilingEnabled()Lcom/davemorrissey/labs/subscaleview/ImageSource;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V

    .line 291
    .end local v1    # "resId":I
    :cond_a5
    invoke-virtual {v2, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_b2

    .line 292
    invoke-virtual {v2, v7, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setPanEnabled(Z)V

    .line 294
    :cond_b2
    invoke-virtual {v2, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_bf

    .line 295
    invoke-virtual {v2, v8, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setZoomEnabled(Z)V

    .line 297
    :cond_bf
    invoke-virtual {v2, v9}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_cc

    .line 298
    invoke-virtual {v2, v9, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setQuickScaleEnabled(Z)V

    .line 300
    :cond_cc
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_df

    .line 301
    const/4 v3, 0x5

    invoke-static {v6, v6, v6, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setTileBackgroundColor(I)V

    .line 303
    :cond_df
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 306
    .end local v2    # "typedAttr":Landroid/content/res/TypedArray;
    :cond_e2
    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v5, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    iput v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    .line 307
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

.method static synthetic access$4700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)I
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getExifOrientation(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$4800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$4900()Ljava/lang/String;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;III)V
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

.method static synthetic access$5100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/Rect;
    .param p2, "x2"    # Landroid/graphics/Rect;

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fileSRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method

.method static synthetic access$5400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)V
    .registers 1
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onTileLoaded()V

    return-void
.end method

.method static synthetic access$5500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;)V
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onPreviewLoaded(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$5600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/Bitmap;IZ)V
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

.method static synthetic access$5800()Ljava/util/List;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # F

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    return v0
.end method

.method static synthetic access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;
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

.method static synthetic access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    return-object v0
.end method

.method static synthetic access$6102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p1, "x1"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    return-object p1
.end method

.method static synthetic access$6300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
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
    .line 1213
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    if-lez v8, :cond_1a

    .line 1214
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 1215
    .local v3, "metrics":Landroid/util/DisplayMetrics;
    iget v8, v3, Landroid/util/DisplayMetrics;->xdpi:F

    iget v9, v3, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v8, v9

    const/high16 v9, 0x40000000    # 2.0f

    div-float v0, v8, v9

    .line 1216
    .local v0, "averageDpi":F
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    int-to-float v8, v8

    div-float/2addr v8, v0

    mul-float/2addr p1, v8

    .line 1219
    .end local v0    # "averageDpi":F
    .end local v3    # "metrics":Landroid/util/DisplayMetrics;
    :cond_1a
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, p1

    float-to-int v6, v8

    .line 1220
    .local v6, "reqWidth":I
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, p1

    float-to-int v5, v8

    .line 1223
    .local v5, "reqHeight":I
    const/4 v2, 0x1

    .line 1224
    .local v2, "inSampleSize":I
    if-eqz v6, :cond_2d

    if-nez v5, :cond_30

    .line 1225
    :cond_2d
    const/16 v4, 0x20

    .line 1246
    :cond_2f
    return v4

    .line 1228
    :cond_30
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    if-gt v8, v5, :cond_3c

    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    if-le v8, v6, :cond_55

    .line 1231
    :cond_3c
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v5

    div-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 1232
    .local v1, "heightRatio":I
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v6

    div-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 1237
    .local v7, "widthRatio":I
    if-ge v1, v7, :cond_5d

    move v2, v1

    .line 1241
    .end local v1    # "heightRatio":I
    .end local v7    # "widthRatio":I
    :cond_55
    :goto_55
    const/4 v4, 0x1

    .line 1242
    .local v4, "power":I
    :goto_56
    mul-int/lit8 v8, v4, 0x2

    if-ge v8, v2, :cond_2f

    .line 1243
    mul-int/lit8 v4, v4, 0x2

    goto :goto_56

    .end local v4    # "power":I
    .restart local v1    # "heightRatio":I
    .restart local v7    # "widthRatio":I
    :cond_5d
    move v2, v7

    .line 1237
    goto :goto_55
.end method

.method private checkImageLoaded()Z
    .registers 3

    .prologue
    .line 1059
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    .line 1060
    .local v0, "imageLoaded":Z
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-nez v1, :cond_1c

    if-eqz v0, :cond_1c

    .line 1061
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 1062
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    .line 1063
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded()V

    .line 1064
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    if-eqz v1, :cond_1c

    .line 1065
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;->onImageLoaded()V

    .line 1068
    :cond_1c
    return v0
.end method

.method private checkReady()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 1042
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

    .line 1043
    .local v0, "ready":Z
    :goto_20
    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-nez v2, :cond_37

    if-eqz v0, :cond_37

    .line 1044
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 1045
    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    .line 1046
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onReady()V

    .line 1047
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    if-eqz v1, :cond_37

    .line 1048
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;->onReady()V

    .line 1051
    :cond_37
    return v0

    .line 1042
    .end local v0    # "ready":Z
    :cond_38
    const/4 v0, 0x0

    goto :goto_20
.end method

.method private createPaints()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 1075
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_1b

    .line 1076
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 1077
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1078
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1079
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 1081
    :cond_1b
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_40

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v0, :cond_40

    .line 1082
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    .line 1083
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1084
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    const v1, -0xff01

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1085
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1087
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
    .line 1820
    sub-float v0, p1, p2

    .line 1821
    .local v0, "x":F
    sub-float v1, p3, p4

    .line 1822
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

    .line 821
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_17

    .line 822
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    if-eqz v1, :cond_3d

    .line 824
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 825
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iput v1, p1, Landroid/graphics/PointF;->y:F

    .line 832
    :cond_17
    :goto_17
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    iget v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 833
    .local v6, "doubleTapZoomScale":F
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    float-to-double v3, v1

    float-to-double v9, v6

    const-wide v11, 0x3feccccccccccccdL    # 0.9

    mul-double/2addr v9, v11

    cmpg-double v1, v3, v9

    if-gtz v1, :cond_50

    move v7, v0

    .line 834
    .local v7, "zoomIn":Z
    :goto_2e
    if-eqz v7, :cond_52

    move v2, v6

    .line 835
    .local v2, "targetScale":F
    :goto_31
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/4 v3, 0x3

    if-ne v1, v3, :cond_57

    .line 836
    invoke-virtual {p0, v2, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setScaleAndCenter(FLandroid/graphics/PointF;)V

    .line 842
    :cond_39
    :goto_39
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 843
    return-void

    .line 828
    .end local v2    # "targetScale":F
    .end local v6    # "doubleTapZoomScale":F
    .end local v7    # "zoomIn":Z
    :cond_3d
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 829
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iput v1, p1, Landroid/graphics/PointF;->y:F

    goto :goto_17

    .restart local v6    # "doubleTapZoomScale":F
    :cond_50
    move v7, v8

    .line 833
    goto :goto_2e

    .line 834
    .restart local v7    # "zoomIn":Z
    :cond_52
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v2

    goto :goto_31

    .line 837
    .restart local v2    # "targetScale":F
    :cond_57
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_62

    if-eqz v7, :cond_62

    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    if-nez v1, :cond_6f

    .line 838
    :cond_62
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    invoke-direct {v0, p0, v2, p1, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    invoke-virtual {v0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->start()V

    goto :goto_39

    .line 839
    :cond_6f
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    if-ne v1, v0, :cond_39

    .line 840
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    invoke-virtual {v0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

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
    .line 2011
    packed-switch p1, :pswitch_data_30

    .line 2017
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

    .line 2013
    invoke-direct/range {v0 .. v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->easeInOutQuad(JFFJ)F

    move-result v0

    .line 2015
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

    .line 2011
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

    .line 2043
    long-to-float v1, p1

    long-to-float v2, p5

    div-float/2addr v2, v3

    div-float v0, v1, v2

    .line 2044
    .local v0, "timeF":F
    cmpg-float v1, v0, v4

    if-gez v1, :cond_13

    .line 2045
    div-float v1, p4, v3

    mul-float/2addr v1, v0

    mul-float/2addr v1, v0

    add-float/2addr v1, p3

    .line 2048
    :goto_12
    return v1

    .line 2047
    :cond_13
    sub-float/2addr v0, v4

    .line 2048
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
    .line 2030
    long-to-float v1, p1

    long-to-float v2, p5

    div-float v0, v1, v2

    .line 2031
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

    .line 1681
    iget-boolean v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->parallelLoadingEnabled:Z

    if-eqz v4, :cond_45

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_45

    .line 1683
    :try_start_b
    const-class v4, Landroid/os/AsyncTask;

    const-string v5, "THREAD_POOL_EXECUTOR"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 1684
    .local v3, "executorField":Ljava/lang/reflect/Field;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 1685
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

    .line 1686
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

    .line 1693
    .end local v1    # "executeMethod":Ljava/lang/reflect/Method;
    .end local v2    # "executor":Ljava/util/concurrent/Executor;
    .end local v3    # "executorField":Ljava/lang/reflect/Field;
    :goto_3c
    return-void

    .line 1688
    :catch_3d
    move-exception v0

    .line 1689
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v5, "Failed to execute AsyncTask on thread pool executor, falling back to single threaded executor"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1692
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
    .line 1794
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    if-nez v0, :cond_a

    .line 1795
    invoke-virtual {p2, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 1803
    :goto_9
    return-void

    .line 1796
    :cond_a
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_24

    .line 1797
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

    .line 1798
    :cond_24
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    const/16 v1, 0xb4

    if-ne v0, v1, :cond_44

    .line 1799
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

    .line 1801
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

    .line 1306
    const/4 v0, 0x0

    .line 1307
    .local v0, "init":Z
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v1, :cond_e

    .line 1308
    const/4 v0, 0x1

    .line 1309
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 1311
    :cond_e
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v1, :cond_1f

    .line 1312
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v4, v4}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v3, 0x0

    invoke-direct {v1, v4, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 1314
    :cond_1f
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1315
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 1316
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, p1, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1317
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 1318
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 1319
    if-eqz v0, :cond_64

    .line 1320
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

    .line 1322
    :cond_64
    return-void
.end method

.method private fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    .registers 14
    .param p1, "center"    # Z
    .param p2, "sat"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .prologue
    .line 1257
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_c

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_c

    .line 1258
    const/4 p1, 0x0

    .line 1261
    :cond_c
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v5

    .line 1262
    .local v5, "vTranslate":Landroid/graphics/PointF;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v8

    invoke-direct {p0, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v2

    .line 1263
    .local v2, "scale":F
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float v4, v2, v8

    .line 1264
    .local v4, "scaleWidth":F
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float v3, v2, v8

    .line 1266
    .local v3, "scaleHeight":F
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_c2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_c2

    .line 1267
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    sub-float/2addr v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1268
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    sub-float/2addr v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    .line 1278
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

    .line 1279
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

    .line 1283
    .local v7, "yPaddingRatio":F
    :goto_8b
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    const/4 v9, 0x3

    if-ne v8, v9, :cond_fd

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v8

    if-eqz v8, :cond_fd

    .line 1284
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v0, v8

    .line 1285
    .local v0, "maxTx":F
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v1, v8

    .line 1294
    .local v1, "maxTy":F
    :goto_ae
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-static {v8, v0}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1295
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-static {v8, v1}, Ljava/lang/Math;->min(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    .line 1297
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {p2, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1298
    return-void

    .line 1269
    .end local v0    # "maxTx":F
    .end local v1    # "maxTy":F
    .end local v6    # "xPaddingRatio":F
    .end local v7    # "yPaddingRatio":F
    :cond_c2
    if-eqz p1, :cond_e2

    .line 1270
    iget v8, v5, Landroid/graphics/PointF;->x:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1271
    iget v8, v5, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    goto/16 :goto_51

    .line 1273
    :cond_e2
    iget v8, v5, Landroid/graphics/PointF;->x:F

    neg-float v9, v4

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->x:F

    .line 1274
    iget v8, v5, Landroid/graphics/PointF;->y:F

    neg-float v9, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    iput v8, v5, Landroid/graphics/PointF;->y:F

    goto/16 :goto_51

    .line 1278
    :cond_f6
    const/high16 v6, 0x3f000000    # 0.5f

    goto/16 :goto_6e

    .line 1279
    .restart local v6    # "xPaddingRatio":F
    :cond_fa
    const/high16 v7, 0x3f000000    # 0.5f

    goto :goto_8b

    .line 1286
    .restart local v7    # "yPaddingRatio":F
    :cond_fd
    if-eqz p1, :cond_118

    .line 1287
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v4

    mul-float/2addr v9, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 1288
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

    .line 1290
    .end local v0    # "maxTx":F
    .end local v1    # "maxTy":F
    :cond_118
    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    int-to-float v0, v8

    .line 1291
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

    .line 1639
    const/4 v9, 0x0

    .line 1640
    .local v9, "exifOrientation":I
    const-string v0, "content"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_68

    .line 1642
    const/4 v0, 0x1

    :try_start_b
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "orientation"

    aput-object v1, v2, v0

    .line 1643
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

    .line 1644
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_45

    .line 1645
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 1646
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 1647
    .local v10, "orientation":I
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    const/4 v0, -0x1

    if-eq v10, v0, :cond_46

    .line 1648
    move v9, v10

    .line 1653
    .end local v10    # "orientation":I
    :cond_42
    :goto_42
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1677
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_45
    :goto_45
    return v9

    .line 1650
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

    .line 1655
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    .end local v10    # "orientation":I
    :catch_5f
    move-exception v7

    .line 1656
    .local v7, "e":Ljava/lang/Exception;
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;

    const-string v1, "Could not get orientation of image from media store"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_45

    .line 1658
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

    .line 1660
    :try_start_78
    new-instance v8, Landroid/media/ExifInterface;

    const-string v0, "file:///"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 1661
    .local v8, "exifInterface":Landroid/media/ExifInterface;
    const-string v0, "Orientation"

    const/4 v1, 0x1

    invoke-virtual {v8, v0, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v11

    .line 1662
    .local v11, "orientationAttr":I
    if-eq v11, v3, :cond_94

    if-nez v11, :cond_96

    .line 1663
    :cond_94
    const/4 v9, 0x0

    goto :goto_45

    .line 1664
    :cond_96
    const/4 v0, 0x6

    if-ne v11, v0, :cond_9c

    .line 1665
    const/16 v9, 0x5a

    goto :goto_45

    .line 1666
    :cond_9c
    const/4 v0, 0x3

    if-ne v11, v0, :cond_a2

    .line 1667
    const/16 v9, 0xb4

    goto :goto_45

    .line 1668
    :cond_a2
    const/16 v0, 0x8

    if-ne v11, v0, :cond_a9

    .line 1669
    const/16 v9, 0x10e

    goto :goto_45

    .line 1671
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

    .line 1673
    .end local v8    # "exifInterface":Landroid/media/ExifInterface;
    .end local v11    # "orientationAttr":I
    :catch_c2
    move-exception v7

    .line 1674
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

    .line 1750
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v2, v3, :cond_3f

    .line 1752
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

    .line 1753
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

    .line 1754
    .local v0, "maxHeight":I
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v1, v0}, Landroid/graphics/Point;-><init>(II)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3d} :catch_3e

    .line 1759
    .end local v0    # "maxHeight":I
    .end local v1    # "maxWidth":I
    :goto_3d
    return-object v2

    .line 1755
    :catch_3e
    move-exception v2

    .line 1759
    :cond_3f
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, v5, v5}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_3d
.end method

.method private getRequiredRotation()I
    .registers 3

    .prologue
    .line 1809
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_8

    .line 1810
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1812
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

    .line 1095
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

    .line 1096
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1100
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F

    move-result v1

    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1101
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-le v1, v9, :cond_2e

    .line 1102
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1105
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

    .line 1109
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-interface {v1}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 1110
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 1111
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 1112
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V
    :try_end_60
    .catchall {:try_start_2 .. :try_end_60} :catchall_8e

    .line 1127
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    :goto_60
    monitor-exit p0

    return-void

    .line 1116
    :cond_62
    :try_start_62
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseTileMap(Landroid/graphics/Point;)V

    .line 1118
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 1119
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

    .line 1120
    .local v7, "baseTile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v0, p0, v1, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 1121
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V
    :try_end_8d
    .catchall {:try_start_62 .. :try_end_8d} :catchall_8e

    goto :goto_77

    .line 1095
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    .end local v6    # "baseGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    .end local v7    # "baseTile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v8    # "i$":Ljava/util/Iterator;
    :catchall_8e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1123
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
    .line 1328
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 1329
    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 1330
    .local v3, "sampleSize":I
    const/4 v9, 0x1

    .line 1331
    .local v9, "xTiles":I
    const/4 v11, 0x1

    .line 1333
    .local v11, "yTiles":I
    :goto_f
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v12

    div-int v2, v12, v9

    .line 1334
    .local v2, "sTileWidth":I
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v12

    div-int v1, v12, v11

    .line 1335
    .local v1, "sTileHeight":I
    div-int v5, v2, v3

    .line 1336
    .local v5, "subTileWidth":I
    div-int v4, v1, v3

    .line 1337
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

    .line 1338
    :cond_3d
    add-int/lit8 v9, v9, 0x1

    .line 1339
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v12

    div-int v2, v12, v9

    .line 1340
    div-int v5, v2, v3

    goto :goto_1f

    .line 1342
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

    .line 1343
    :cond_66
    add-int/lit8 v11, v11, 0x1

    .line 1344
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v12

    div-int v1, v12, v11

    .line 1345
    div-int v4, v1, v3

    goto :goto_48

    .line 1347
    :cond_71
    new-instance v7, Ljava/util/ArrayList;

    mul-int v12, v9, v11

    invoke-direct {v7, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 1348
    .local v7, "tileGrid":Ljava/util/List;, "Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;"
    const/4 v8, 0x0

    .local v8, "x":I
    :goto_79
    if-ge v8, v9, :cond_dd

    .line 1349
    const/4 v10, 0x0

    .local v10, "y":I
    :goto_7c
    if-ge v10, v11, :cond_da

    .line 1350
    new-instance v6, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    const/4 v12, 0x0

    invoke-direct {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 1351
    .local v6, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v6, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;I)I

    .line 1352
    move-object/from16 v0, p0

    iget v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v3, v12, :cond_cf

    const/4 v12, 0x1

    :goto_8e
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1353
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
    invoke-static {v6, v14}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1359
    new-instance v12, Landroid/graphics/Rect;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v12 .. v16}, Landroid/graphics/Rect;-><init>(IIII)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1360
    new-instance v12, Landroid/graphics/Rect;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;
    invoke-static {v6, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$4602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 1361
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1349
    add-int/lit8 v10, v10, 0x1

    goto :goto_7c

    .line 1352
    :cond_cf
    const/4 v12, 0x0

    goto :goto_8e

    .line 1353
    :cond_d1
    add-int/lit8 v12, v8, 0x1

    mul-int/2addr v12, v2

    move v13, v12

    goto :goto_a0

    :cond_d6
    add-int/lit8 v12, v10, 0x1

    mul-int/2addr v12, v1

    goto :goto_a8

    .line 1348
    .end local v6    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    :cond_da
    add-int/lit8 v8, v8, 0x1

    goto :goto_79

    .line 1364
    .end local v10    # "y":I
    :cond_dd
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v12, v13, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1365
    const/4 v12, 0x1

    if-ne v3, v12, :cond_ec

    .line 1371
    return-void

    .line 1368
    :cond_ec
    div-int/lit8 v3, v3, 0x2

    .line 1370
    goto/16 :goto_f
.end method

.method private isBaseLayerReady()Z
    .registers 8

    .prologue
    .line 1018
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_a

    iget-boolean v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-nez v5, :cond_a

    .line 1019
    const/4 v0, 0x1

    .line 1033
    :cond_9
    :goto_9
    return v0

    .line 1020
    :cond_a
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v5, :cond_57

    .line 1021
    const/4 v0, 0x1

    .line 1022
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

    .line 1023
    .local v4, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iget v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v5, v6, :cond_19

    .line 1024
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

    .line 1025
    .local v3, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v5

    if-nez v5, :cond_55

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v5

    if-nez v5, :cond_3d

    .line 1026
    :cond_55
    const/4 v0, 0x0

    goto :goto_3d

    .line 1033
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
    .line 1968
    invoke-direct {p0, p1, p2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateForSCenter(FFF)Landroid/graphics/PointF;

    move-result-object v2

    .line 1969
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

    .line 1970
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

    .line 1971
    .local v4, "vyCenter":I
    int-to-float v5, v3

    iget v6, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v6

    div-float v0, v5, p3

    .line 1972
    .local v0, "sx":F
    int-to-float v5, v4

    iget v6, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v5, v6

    div-float v1, v5, p3

    .line 1973
    .local v1, "sy":F
    invoke-virtual {p4, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 1974
    return-object p4
.end method

.method private limitedScale(F)F
    .registers 3
    .param p1, "targetScale"    # F

    .prologue
    .line 1996
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 1997
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 1998
    return p1
.end method

.method private minScale()F
    .registers 6

    .prologue
    .line 1981
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v3

    add-int v1, v2, v3

    .line 1982
    .local v1, "vPadding":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v3

    add-int v0, v2, v3

    .line 1983
    .local v0, "hPadding":I
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_36

    .line 1984
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

    .line 1988
    :goto_35
    return v2

    .line 1985
    :cond_36
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_45

    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_45

    .line 1986
    iget v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    goto :goto_35

    .line 1988
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
    .line 1614
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

    .line 1615
    :cond_19
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1617
    :cond_1d
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_2a

    iget-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v2, :cond_2a

    .line 1618
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 1620
    :cond_2a
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1621
    iput-boolean p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1622
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1623
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1624
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1625
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1626
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v1

    .line 1627
    .local v1, "ready":Z
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    move-result v0

    .line 1628
    .local v0, "imageLoaded":Z
    if-nez v1, :cond_4b

    if-eqz v0, :cond_51

    .line 1629
    :cond_4b
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1630
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_51
    .catchall {:try_start_1 .. :try_end_51} :catchall_53

    .line 1632
    :cond_51
    monitor-exit p0

    return-void

    .line 1614
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
    .line 1593
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    if-eqz v0, :cond_e

    .line 1594
    :cond_9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_3c

    .line 1607
    :cond_c
    :goto_c
    monitor-exit p0

    return-void

    .line 1597
    :cond_e
    :try_start_e
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    if-eqz v0, :cond_3f

    .line 1598
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

    .line 1602
    :goto_2c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1603
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1604
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1605
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_3b
    .catchall {:try_start_e .. :try_end_3b} :catchall_3c

    goto :goto_c

    .line 1593
    :catchall_3c
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1600
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
    .line 1517
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    .line 1518
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    .line 1519
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_23

    .line 1520
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v0, :cond_1a

    .line 1521
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1523
    :cond_1a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1524
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1525
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1527
    :cond_23
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V
    :try_end_26
    .catchall {:try_start_1 .. :try_end_26} :catchall_28

    .line 1528
    monitor-exit p0

    return-void

    .line 1517
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
    .line 1435
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

    .line 1436
    :cond_11
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1437
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2b

    .line 1438
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v0, :cond_22

    .line 1439
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1441
    :cond_22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 1442
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 1443
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 1446
    :cond_2b
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 1447
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1448
    iput p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1449
    iput p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 1450
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    .line 1451
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkImageLoaded()Z

    .line 1452
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1453
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V
    :try_end_3f
    .catchall {:try_start_1 .. :try_end_3f} :catchall_41

    .line 1454
    monitor-exit p0

    return-void

    .line 1435
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

    .line 1187
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

    .line 1207
    :cond_16
    :goto_16
    return-void

    .line 1192
    :cond_17
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    if-eqz v0, :cond_62

    .line 1193
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 1194
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_32

    .line 1195
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 1197
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

    .line 1198
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

    .line 1199
    iput-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 1200
    iput-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 1201
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 1202
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 1206
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

    .line 1135
    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v6, :cond_b

    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v6, :cond_c

    .line 1170
    :cond_b
    return-void

    .line 1137
    :cond_c
    iget v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-direct {p0, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 1141
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

    .line 1142
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

    .line 1143
    .local v4, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-lt v6, v2, :cond_58

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-le v6, v2, :cond_6b

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v6, v7, :cond_6b

    .line 1144
    :cond_58
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1145
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_6b

    .line 1146
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 1147
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 1150
    :cond_6b
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    if-ne v6, v2, :cond_af

    .line 1151
    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileVisible(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v6

    if-eqz v6, :cond_93

    .line 1152
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1153
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v6

    if-nez v6, :cond_38

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-nez v6, :cond_38

    if-eqz p1, :cond_38

    .line 1154
    new-instance v3, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;

    iget-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-direct {v3, p0, v6, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)V

    .line 1155
    .local v3, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    invoke-direct {p0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto :goto_38

    .line 1157
    .end local v3    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TileLoadTask;
    :cond_93
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-eq v6, v7, :cond_38

    .line 1158
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v4, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 1159
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_38

    .line 1160
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    .line 1161
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v4, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    goto :goto_38

    .line 1164
    :cond_af
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static {v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v6

    iget v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    if-ne v6, v7, :cond_38

    .line 1165
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

    .line 430
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 431
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 432
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    .line 433
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 434
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iput-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 435
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 436
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 437
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 438
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 439
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 440
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 441
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    .line 442
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 443
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 444
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    .line 445
    iput v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 446
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    .line 447
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 448
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 449
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 450
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 451
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    .line 452
    if-eqz p1, :cond_68

    .line 453
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 454
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v4, :cond_47

    .line 455
    iget-object v5, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoderLock:Ljava/lang/Object;

    monitor-enter v5

    .line 456
    :try_start_3e
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    invoke-interface {v4}, Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;->recycle()V

    .line 457
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    .line 458
    monitor-exit v5
    :try_end_47
    .catchall {:try_start_3e .. :try_end_47} :catchall_ac

    .line 460
    :cond_47
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_54

    iget-boolean v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    if-nez v4, :cond_54

    .line 461
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 463
    :cond_54
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 464
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 465
    iput v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sOrientation:I

    .line 466
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    .line 467
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    .line 468
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    .line 469
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    .line 470
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    .line 471
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    .line 472
    iput-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 474
    :cond_68
    iget-object v4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v4, :cond_b1

    .line 475
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

    .line 476
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

    .line 477
    .local v2, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static {v2, v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z

    .line 478
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_8c

    .line 479
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    .line 480
    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static {v2, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    goto :goto_8c

    .line 458
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

    .line 484
    :cond_af
    iput-object v6, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    .line 486
    :cond_b1
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setGestureDetector(Landroid/content/Context;)V

    .line 487
    return-void
.end method

.method private restoreState(Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V
    .registers 4
    .param p1, "state"    # Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    .prologue
    .line 1738
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

    .line 1739
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getOrientation()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    .line 1740
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getScale()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 1741
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 1742
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 1744
    :cond_31
    return-void
.end method

.method private sHeight()I
    .registers 3

    .prologue
    .line 1780
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    .line 1781
    .local v0, "rotation":I
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_c

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_f

    .line 1782
    :cond_c
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 1784
    :goto_e
    return v1

    :cond_f
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    goto :goto_e
.end method

.method private sWidth()I
    .registers 3

    .prologue
    .line 1767
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    .line 1768
    .local v0, "rotation":I
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_c

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_f

    .line 1769
    :cond_c
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 1771
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
    .line 490
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;

    invoke-direct {v1, p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$2;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    .line 539
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
    .line 1004
    const/4 v0, 0x0

    aput p2, p1, v0

    .line 1005
    const/4 v0, 0x1

    aput p3, p1, v0

    .line 1006
    const/4 v0, 0x2

    aput p4, p1, v0

    .line 1007
    const/4 v0, 0x3

    aput p5, p1, v0

    .line 1008
    const/4 v0, 0x4

    aput p6, p1, v0

    .line 1009
    const/4 v0, 0x5

    aput p7, p1, v0

    .line 1010
    const/4 v0, 0x6

    aput p8, p1, v0

    .line 1011
    const/4 v0, 0x7

    aput p9, p1, v0

    .line 1012
    return-void
.end method

.method private sourceToViewRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 7
    .param p1, "sRect"    # Landroid/graphics/Rect;
    .param p2, "vTarget"    # Landroid/graphics/Rect;

    .prologue
    .line 1937
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

    .line 1943
    return-object p2
.end method

.method private sourceToViewX(F)F
    .registers 4
    .param p1, "sx"    # F

    .prologue
    .line 1889
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1890
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
    .line 1897
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1898
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

    .line 1176
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v1

    .line 1177
    .local v1, "sVisLeft":F
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceX(F)F

    move-result v2

    .line 1178
    .local v2, "sVisRight":F
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v3

    .line 1179
    .local v3, "sVisTop":F
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {p0, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceY(F)F

    move-result v0

    .line 1180
    .local v0, "sVisBottom":F
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    cmpl-float v4, v1, v4

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    cmpl-float v4, v4, v2

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    cmpl-float v4, v3, v4

    if-gtz v4, :cond_49

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

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

    .line 1952
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

    .line 1953
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

    .line 1954
    .local v1, "vyCenter":I
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    if-nez v2, :cond_3e

    .line 1955
    new-instance v2, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v3, Landroid/graphics/PointF;

    invoke-direct {v3, v5, v5}, Landroid/graphics/PointF;-><init>(FF)V

    const/4 v4, 0x0

    invoke-direct {v2, v5, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    iput-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .line 1957
    :cond_3e
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F
    invoke-static {v2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F

    .line 1958
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    int-to-float v3, v0

    mul-float v4, p1, p3

    sub-float/2addr v3, v4

    int-to-float v4, v1

    mul-float v5, p2, p3

    sub-float/2addr v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/graphics/PointF;->set(FF)V

    .line 1959
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    invoke-direct {p0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 1960
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->satTemp:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v2

    return-object v2
.end method

.method private viewToSourceX(F)F
    .registers 4
    .param p1, "vx"    # F

    .prologue
    .line 1841
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1842
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
    .line 1849
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_7

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 1850
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

    .line 2466
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2469
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

    .line 2479
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2482
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

    .line 2492
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v1

    if-nez v1, :cond_8

    .line 2495
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
    .line 2312
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v0

    return v0
.end method

.method public final getCenter()Landroid/graphics/PointF;
    .registers 5

    .prologue
    .line 2208
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 2209
    .local v0, "mX":I
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v2

    div-int/lit8 v1, v2, 0x2

    .line 2210
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
    .line 2176
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    return v0
.end method

.method public final getMinScale()F
    .registers 2

    .prologue
    .line 2183
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v0

    return v0
.end method

.method public final getOrientation()I
    .registers 2

    .prologue
    .line 2304
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    return v0
.end method

.method public final getSHeight()I
    .registers 2

    .prologue
    .line 2296
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    return v0
.end method

.method public final getSWidth()I
    .registers 2

    .prologue
    .line 2288
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    return v0
.end method

.method public final getScale()F
    .registers 2

    .prologue
    .line 2217
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    return v0
.end method

.method public final getState()Lcom/davemorrissey/labs/subscaleview/ImageViewState;
    .registers 5

    .prologue
    .line 2320
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_1e

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v0, :cond_1e

    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v0, :cond_1e

    .line 2321
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getScale()F

    move-result v1

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v2

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getOrientation()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/davemorrissey/labs/subscaleview/ImageViewState;-><init>(FLandroid/graphics/PointF;I)V

    .line 2323
    :goto_1d
    return-object v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public final isImageLoaded()Z
    .registers 2

    .prologue
    .line 2273
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->imageLoadedSent:Z

    return v0
.end method

.method public final isPanEnabled()Z
    .registers 2

    .prologue
    .line 2358
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    return v0
.end method

.method public final isQuickScaleEnabled()Z
    .registers 2

    .prologue
    .line 2344
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    return v0
.end method

.method public final isReady()Z
    .registers 2

    .prologue
    .line 2256
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    return v0
.end method

.method public final isZoomEnabled()Z
    .registers 2

    .prologue
    .line 2330
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 33
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 851
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 852
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->createPaints()V

    .line 855
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

    .line 998
    :cond_1e
    :goto_1e
    return-void

    .line 860
    :cond_1f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-nez v2, :cond_34

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->decoder:Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;

    if-eqz v2, :cond_34

    .line 861
    invoke-direct/range {p0 .. p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getMaxBitmapDimensions(Landroid/graphics/Canvas;)Landroid/graphics/Point;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->initialiseBaseLayer(Landroid/graphics/Point;)V

    .line 867
    :cond_34
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->checkReady()Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 872
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->preDraw()V

    .line 875
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    if-eqz v2, :cond_16e

    .line 876
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v6

    sub-long v4, v2, v6

    .line 877
    .local v4, "scaleElapsed":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v2

    cmp-long v2, v4, v2

    if-lez v2, :cond_1df

    const/16 v17, 0x1

    .line 878
    .local v17, "finished":Z
    :goto_5f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v2

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 879
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v6

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v7

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 882
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v6, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/PointF;->x:F

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v27

    .line 883
    .local v27, "vFocusNowX":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I

    move-result v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v6, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/PointF;->y:F

    sub-float v7, v2, v7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J

    move-result-wide v8

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->ease(IJFFJ)F

    move-result v28

    .line 885
    .local v28, "vFocusNowY":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewX(F)F

    move-result v6

    sub-float v6, v6, v27

    sub-float/2addr v3, v6

    iput v3, v2, Landroid/graphics/PointF;->x:F

    .line 886
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v6

    iget v6, v6, Landroid/graphics/PointF;->y:F

    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewY(F)F

    move-result v6

    sub-float v6, v6, v28

    sub-float/2addr v3, v6

    iput v3, v2, Landroid/graphics/PointF;->y:F

    .line 889
    if-nez v17, :cond_157

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F

    move-result v3

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1e3

    :cond_157
    const/4 v2, 0x1

    :goto_158
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 890
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 891
    if-eqz v17, :cond_16b

    .line 892
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 894
    :cond_16b
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 897
    .end local v4    # "scaleElapsed":J
    .end local v17    # "finished":Z
    .end local v27    # "vFocusNowX":F
    .end local v28    # "vFocusNowY":F
    :cond_16e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    if-eqz v2, :cond_60a

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isBaseLayerReady()Z

    move-result v2

    if-eqz v2, :cond_60a

    .line 900
    move-object/from16 v0, p0

    iget v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fullImageSampleSize:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->calculateInSampleSize(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v21

    .line 903
    .local v21, "sampleSize":I
    const/16 v18, 0x0

    .line 904
    .local v18, "hasMissingTiles":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_19a
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e6

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Map$Entry;

    .line 905
    .local v23, "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move/from16 v0, v21

    if-ne v2, v0, :cond_19a

    .line 906
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .local v20, "i$":Ljava/util/Iterator;
    :cond_1be
    :goto_1be
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19a

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 907
    .local v22, "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_1be

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-nez v2, :cond_1dc

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_1be

    .line 908
    :cond_1dc
    const/16 v18, 0x1

    goto :goto_1be

    .line 877
    .end local v18    # "hasMissingTiles":Z
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v21    # "sampleSize":I
    .end local v22    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v23    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    .restart local v4    # "scaleElapsed":J
    :cond_1df
    const/16 v17, 0x0

    goto/16 :goto_5f

    .line 889
    .restart local v17    # "finished":Z
    .restart local v27    # "vFocusNowX":F
    .restart local v28    # "vFocusNowY":F
    :cond_1e3
    const/4 v2, 0x0

    goto/16 :goto_158

    .line 915
    .end local v4    # "scaleElapsed":J
    .end local v17    # "finished":Z
    .end local v27    # "vFocusNowX":F
    .end local v28    # "vFocusNowY":F
    .restart local v18    # "hasMissingTiles":Z
    .restart local v21    # "sampleSize":I
    :cond_1e6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_1f2
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a0

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Map$Entry;

    .line 916
    .restart local v23    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    move/from16 v0, v21

    if-eq v2, v0, :cond_20e

    if-eqz v18, :cond_1f2

    .line 917
    :cond_20e
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v20

    .restart local v20    # "i$":Ljava/util/Iterator;
    :cond_218
    :goto_218
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f2

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .line 918
    .restart local v22    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 919
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-nez v2, :cond_475

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_475

    .line 920
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_250

    .line 921
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 923
    :cond_250
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v2, :cond_25f

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 924
    :cond_25f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 925
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->srcArray:[F

    const/4 v8, 0x0

    const/4 v9, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v10, v2

    const/4 v11, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v13, v2

    const/4 v14, 0x0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 926
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    if-nez v2, :cond_394

    .line 927
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    .line 935
    :cond_2de
    :goto_2de
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

    .line 936
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 937
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_314

    .line 938
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 943
    :cond_314
    :goto_314
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_218

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_218

    .line 944
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ISS "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " RECT "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v3, 0x5

    int-to-float v3, v3

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/lit8 v6, v6, 0xf

    int-to-float v6, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_218

    .line 928
    :cond_394
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_3df

    .line 929
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2de

    .line 930
    :cond_3df
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_42a

    .line 931
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2de

    .line 932
    :cond_42a
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_2de

    .line 933
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->dstArray:[F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v8, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v10, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v11, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v12, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v13, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v14, v2

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v2

    move-object/from16 v6, p0

    invoke-direct/range {v6 .. v15}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMatrixArray([FFFFFFFFF)V

    goto/16 :goto_2de

    .line 940
    :cond_475
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z

    move-result v2

    if-eqz v2, :cond_314

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_314

    .line 941
    const-string v2, "LOADING"

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v3, 0x5

    int-to-float v3, v3

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;
    invoke-static/range {v22 .. v22}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->top:I

    add-int/lit8 v6, v6, 0x23

    int-to-float v6, v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_314

    .line 950
    .end local v20    # "i$":Ljava/util/Iterator;
    .end local v22    # "tile":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .end local v23    # "tileMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/List<Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;>;>;"
    :cond_4a0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    if-eqz v2, :cond_1e

    .line 951
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Scale: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%.2f"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

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

    .line 952
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Translate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%.2f"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%.2f"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

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

    .line 953
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v16

    .line 954
    .local v16, "center":Landroid/graphics/PointF;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Source center: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%.2f"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, v16

    iget v8, v0, Landroid/graphics/PointF;->x:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "%.2f"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, v16

    iget v8, v0, Landroid/graphics/PointF;->y:F

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

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

    .line 956
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    if-eqz v2, :cond_1e

    .line 957
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v26

    .line 958
    .local v26, "vCenterStart":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v25

    .line 959
    .local v25, "vCenterEndRequested":Landroid/graphics/PointF;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v24

    .line 960
    .local v24, "vCenterEnd":Landroid/graphics/PointF;
    move-object/from16 v0, v26

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v26

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41200000    # 10.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 961
    move-object/from16 v0, v25

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v25

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41a00000    # 20.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 962
    move-object/from16 v0, v24

    iget v2, v0, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, v24

    iget v3, v0, Landroid/graphics/PointF;->y:F

    const/high16 v6, 0x41c80000    # 25.0f

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 963
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

    .line 967
    .end local v16    # "center":Landroid/graphics/PointF;
    .end local v18    # "hasMissingTiles":Z
    .end local v21    # "sampleSize":I
    .end local v24    # "vCenterEnd":Landroid/graphics/PointF;
    .end local v25    # "vCenterEndRequested":Landroid/graphics/PointF;
    .end local v26    # "vCenterStart":Landroid/graphics/PointF;
    :cond_60a
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1e

    .line 969
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v29, v0

    .local v29, "xScale":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v30, v0

    .line 970
    .local v30, "yScale":F
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsPreview:Z

    if-eqz v2, :cond_64c

    .line 971
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

    mul-float v29, v2, v3

    .line 972
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

    mul-float v30, v2, v3

    .line 975
    :cond_64c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    if-nez v2, :cond_65b

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    .line 976
    :cond_65b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 977
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move/from16 v0, v29

    move/from16 v1, v30

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 978
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 979
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 981
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0xb4

    if-ne v2, v3, :cond_702

    .line 982
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

    .line 989
    :cond_6af
    :goto_6af
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_6ef

    .line 990
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    if-nez v2, :cond_6c4

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    .line 991
    :cond_6c4
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

    .line 992
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 993
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 995
    :cond_6ef
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->matrix:Landroid/graphics/Matrix;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto/16 :goto_1e

    .line 983
    :cond_702
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x5a

    if-ne v2, v3, :cond_71d

    .line 984
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

    goto :goto_6af

    .line 985
    :cond_71d
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getRequiredRotation()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_6af

    .line 986
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

    goto/16 :goto_6af
.end method

.method protected onImageLoaded()V
    .registers 1

    .prologue
    .line 2281
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

    .line 560
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v7

    .line 561
    .local v7, "widthSpecMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 562
    .local v1, "heightSpecMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 563
    .local v3, "parentWidth":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 564
    .local v2, "parentHeight":I
    if-eq v7, v9, :cond_43

    move v5, v4

    .line 565
    .local v5, "resizeWidth":Z
    :goto_17
    if-eq v1, v9, :cond_45

    .line 566
    .local v4, "resizeHeight":Z
    :goto_19
    move v6, v3

    .line 567
    .local v6, "width":I
    move v0, v2

    .line 568
    .local v0, "height":I
    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    if-lez v8, :cond_2f

    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    if-lez v8, :cond_2f

    .line 569
    if-eqz v5, :cond_47

    if-eqz v4, :cond_47

    .line 570
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v6

    .line 571
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v0

    .line 578
    :cond_2f
    :goto_2f
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getSuggestedMinimumWidth()I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 579
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getSuggestedMinimumHeight()I

    move-result v8

    invoke-static {v0, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 580
    invoke-virtual {p0, v6, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMeasuredDimension(II)V

    .line 581
    return-void

    .end local v0    # "height":I
    .end local v4    # "resizeHeight":Z
    .end local v5    # "resizeWidth":Z
    .end local v6    # "width":I
    :cond_43
    move v5, v8

    .line 564
    goto :goto_17

    .restart local v5    # "resizeWidth":Z
    :cond_45
    move v4, v8

    .line 565
    goto :goto_19

    .line 572
    .restart local v0    # "height":I
    .restart local v4    # "resizeHeight":Z
    .restart local v6    # "width":I
    :cond_47
    if-eqz v4, :cond_58

    .line 573
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

    .line 574
    :cond_58
    if-eqz v5, :cond_2f

    .line 575
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
    .line 2266
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 7
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 546
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    .line 547
    .local v0, "sCenter":Landroid/graphics/PointF;
    iget-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->readySent:Z

    if-eqz v1, :cond_17

    if-eqz v0, :cond_17

    .line 548
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 549
    iget v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 550
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 552
    :cond_17
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 32
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v26, v0

    if-eqz v26, :cond_20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-object/from16 v26, v0

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z
    invoke-static/range {v26 .. v26}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Z

    move-result v26

    if-nez v26, :cond_20

    .line 590
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v26

    const/16 v27, 0x1

    invoke-interface/range {v26 .. v27}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 591
    const/16 v26, 0x1

    .line 813
    :goto_1f
    return v26

    .line 593
    :cond_20
    const/16 v26, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 597
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    if-nez v26, :cond_33

    .line 598
    const/16 v26, 0x1

    goto :goto_1f

    .line 601
    :cond_33
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v26, v0

    if-nez v26, :cond_6e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    move-object/from16 v26, v0

    if-eqz v26, :cond_53

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->detector:Landroid/view/GestureDetector;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v26

    if-eqz v26, :cond_6e

    .line 602
    :cond_53
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 603
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 604
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 605
    const/16 v26, 0x1

    goto :goto_1f

    .line 608
    :cond_6e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    if-nez v26, :cond_85

    new-instance v26, Landroid/graphics/PointF;

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v26 .. v28}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    .line 609
    :cond_85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    if-nez v26, :cond_9c

    new-instance v26, Landroid/graphics/PointF;

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-direct/range {v26 .. v28}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    .line 611
    :cond_9c
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v17

    .line 612
    .local v17, "touchCount":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v26

    sparse-switch v26, :sswitch_data_954

    .line 813
    :cond_a7
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v26

    goto/16 :goto_1f

    .line 616
    :sswitch_ad
    const/16 v26, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 617
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v26

    const/16 v27, 0x1

    invoke-interface/range {v26 .. v27}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 618
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v26, v0

    move/from16 v0, v26

    move/from16 v1, v17

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 619
    const/16 v26, 0x2

    move/from16 v0, v17

    move/from16 v1, v26

    if-lt v0, v1, :cond_19e

    .line 620
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    move/from16 v26, v0

    if-eqz v26, :cond_195

    .line 622
    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v26

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v8

    .line 623
    .local v8, "distance":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 624
    move-object/from16 v0, p0

    iput v8, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 625
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 626
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

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

    div-float v27, v27, v28

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    add-float v28, v28, v29

    const/high16 v29, 0x40000000    # 2.0f

    div-float v28, v28, v29

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 632
    .end local v8    # "distance":F
    :goto_186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Landroid/os/Handler;->removeMessages(I)V

    .line 641
    :cond_191
    :goto_191
    const/16 v26, 0x1

    goto/16 :goto_1f

    .line 629
    :cond_195
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    goto :goto_186

    .line 633
    :cond_19e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v26, v0

    if-nez v26, :cond_191

    .line 635
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v27

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v28

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 639
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    const-wide/16 v28, 0x258

    invoke-virtual/range {v26 .. v29}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_191

    .line 643
    :sswitch_1e6
    const/4 v6, 0x0

    .line 644
    .local v6, "consumed":Z
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v26, v0

    if-lez v26, :cond_32e

    .line 645
    const/16 v26, 0x2

    move/from16 v0, v17

    move/from16 v1, v26

    if-lt v0, v1, :cond_47a

    .line 647
    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v26

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v29

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v20

    .line 648
    .local v20, "vDistEnd":F
    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v26

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    add-float v26, v26, v27

    const/high16 v27, 0x40000000    # 2.0f

    div-float v18, v26, v27

    .line 649
    .local v18, "vCenterEndX":F
    const/16 v26, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v26

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v27

    add-float v26, v26, v27

    const/high16 v27, 0x40000000    # 2.0f

    div-float v19, v26, v27

    .line 651
    .local v19, "vCenterEndY":F
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    move/from16 v26, v0

    if-eqz v26, :cond_32e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v18

    move/from16 v3, v27

    move/from16 v4, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->distance(FFFF)F

    move-result v26

    const/high16 v27, 0x40a00000    # 5.0f

    cmpl-float v26, v26, v27

    if-gtz v26, :cond_2af

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    move/from16 v26, v0

    sub-float v26, v20, v26

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v26

    const/high16 v27, 0x40a00000    # 5.0f

    cmpl-float v26, v26, v27

    if-gtz v26, :cond_2af

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v26, v0

    if-eqz v26, :cond_32e

    .line 652
    :cond_2af
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 653
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 654
    const/4 v6, 0x1

    .line 656
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    move/from16 v27, v0

    div-float v27, v20, v27

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v28, v0

    mul-float v27, v27, v28

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->min(FF)F

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 658
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v27

    cmpg-float v26, v26, v27

    if-gtz v26, :cond_342

    .line 660
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vDistStart:F

    .line 661
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    .line 662
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 663
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    invoke-virtual/range {v26 .. v27}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    .line 683
    :goto_31c
    const/16 v26, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 684
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 766
    .end local v18    # "vCenterEndX":F
    .end local v19    # "vCenterEndY":F
    .end local v20    # "vDistEnd":F
    :cond_32e
    :goto_32e
    if-eqz v6, :cond_a7

    .line 767
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Landroid/os/Handler;->removeMessages(I)V

    .line 768
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 769
    const/16 v26, 0x1

    goto/16 :goto_1f

    .line 664
    .restart local v18    # "vCenterEndX":F
    .restart local v19    # "vCenterEndY":F
    .restart local v20    # "vDistEnd":F
    :cond_342
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v26, v0

    if-eqz v26, :cond_3bc

    .line 667
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    sub-float v22, v26, v27

    .line 668
    .local v22, "vLeftStart":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    sub-float v24, v26, v27

    .line 669
    .local v24, "vTopStart":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v27, v0

    div-float v26, v26, v27

    mul-float v21, v22, v26

    .line 670
    .local v21, "vLeftNow":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v27, v0

    div-float v26, v26, v27

    mul-float v23, v24, v26

    .line 671
    .local v23, "vTopNow":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    sub-float v27, v18, v21

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 672
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    sub-float v27, v19, v23

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_31c

    .line 673
    .end local v21    # "vLeftNow":F
    .end local v22    # "vLeftStart":F
    .end local v23    # "vTopNow":F
    .end local v24    # "vTopStart":F
    :cond_3bc
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    if-eqz v26, :cond_420

    .line 675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_31c

    .line 679
    :cond_420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v29

    div-int/lit8 v29, v29, 0x2

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 680
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v29

    div-int/lit8 v29, v29, 0x2

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_31c

    .line 686
    .end local v18    # "vCenterEndX":F
    .end local v19    # "vCenterEndY":F
    .end local v20    # "vDistEnd":F
    :cond_47a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v26, v0

    if-eqz v26, :cond_6a7

    .line 689
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v26, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v27

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v26

    const/high16 v27, 0x40000000    # 2.0f

    mul-float v26, v26, v27

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleThreshold:F

    move/from16 v27, v0

    add-float v7, v26, v27

    .line 691
    .local v7, "dist":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v26, v0

    const/high16 v27, -0x40800000    # -1.0f

    cmpl-float v26, v26, v27

    if-nez v26, :cond_4b4

    move-object/from16 v0, p0

    iput v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 692
    :cond_4b4
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    cmpl-float v26, v26, v27

    if-lez v26, :cond_5e0

    const/4 v12, 0x1

    .line 693
    .local v12, "isUpwards":Z
    :goto_4c9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastPoint:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v28

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 695
    const/high16 v26, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v27, v0

    div-float v27, v7, v27

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v26

    const/high16 v27, 0x3f000000    # 0.5f

    mul-float v16, v26, v27

    .line 697
    .local v16, "spanDiff":F
    const v26, 0x3cf5c28f    # 0.03f

    cmpl-float v26, v16, v26

    if-gtz v26, :cond_4fb

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    move/from16 v26, v0

    if-eqz v26, :cond_5c7

    .line 698
    :cond_4fb
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    .line 700
    const/high16 v15, 0x3f800000    # 1.0f

    .line 701
    .local v15, "multiplier":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    move/from16 v26, v0

    const/16 v27, 0x0

    cmpl-float v26, v26, v27

    if-lez v26, :cond_517

    .line 702
    if-eqz v12, :cond_5e3

    const/high16 v26, 0x3f800000    # 1.0f

    add-float v15, v26, v16

    .line 705
    :cond_517
    :goto_517
    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale()F

    move-result v26

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    mul-float v28, v28, v15

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->min(FF)F

    move-result v27

    invoke-static/range {v26 .. v27}, Ljava/lang/Math;->max(FF)F

    move-result v26

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    .line 707
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v26, v0

    if-eqz v26, :cond_5e9

    .line 708
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    sub-float v22, v26, v27

    .line 709
    .restart local v22    # "vLeftStart":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    sub-float v24, v26, v27

    .line 710
    .restart local v24    # "vTopStart":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v27, v0

    div-float v26, v26, v27

    mul-float v21, v22, v26

    .line 711
    .restart local v21    # "vLeftNow":F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scaleStart:F

    move/from16 v27, v0

    div-float v26, v26, v27

    mul-float v23, v24, v26

    .line 712
    .restart local v23    # "vTopNow":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    sub-float v27, v27, v21

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 713
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    sub-float v27, v27, v23

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 725
    .end local v15    # "multiplier":F
    .end local v21    # "vLeftNow":F
    .end local v22    # "vLeftStart":F
    .end local v23    # "vTopNow":F
    .end local v24    # "vTopStart":F
    :cond_5c7
    :goto_5c7
    move-object/from16 v0, p0

    iput v7, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleLastDistance:F

    .line 727
    const/16 v26, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 728
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 730
    const/4 v6, 0x1

    .line 731
    goto/16 :goto_32e

    .line 692
    .end local v12    # "isUpwards":Z
    .end local v16    # "spanDiff":F
    :cond_5e0
    const/4 v12, 0x0

    goto/16 :goto_4c9

    .line 702
    .restart local v12    # "isUpwards":Z
    .restart local v15    # "multiplier":F
    .restart local v16    # "spanDiff":F
    :cond_5e3
    const/high16 v26, 0x3f800000    # 1.0f

    sub-float v15, v26, v16

    goto/16 :goto_517

    .line 714
    :cond_5e9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    if-eqz v26, :cond_64d

    .line 716
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 717
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_5c7

    .line 720
    :cond_64d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth()I

    move-result v29

    div-int/lit8 v29, v29, 0x2

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 721
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v27

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F

    move/from16 v28, v0

    invoke-direct/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight()I

    move-result v29

    div-int/lit8 v29, v29, 0x2

    move/from16 v0, v29

    int-to-float v0, v0

    move/from16 v29, v0

    mul-float v28, v28, v29

    sub-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    goto/16 :goto_5c7

    .line 731
    .end local v7    # "dist":F
    .end local v12    # "isUpwards":Z
    .end local v15    # "multiplier":F
    .end local v16    # "spanDiff":F
    :cond_6a7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v26, v0

    if-nez v26, :cond_32e

    .line 734
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 735
    .local v9, "dx":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v26

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    sub-float v26, v26, v27

    invoke-static/range {v26 .. v26}, Ljava/lang/Math;->abs(F)F

    move-result v10

    .line 736
    .local v10, "dy":F
    const/high16 v26, 0x40a00000    # 5.0f

    cmpl-float v26, v9, v26

    if-gtz v26, :cond_6ef

    const/high16 v26, 0x40a00000    # 5.0f

    cmpl-float v26, v10, v26

    if-gtz v26, :cond_6ef

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v26, v0

    if-eqz v26, :cond_32e

    .line 737
    :cond_6ef
    const/4 v6, 0x1

    .line 738
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v29, v0

    sub-float v28, v28, v29

    add-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 739
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v29, v0

    sub-float v28, v28, v29

    add-float v27, v27, v28

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v13, v0, Landroid/graphics/PointF;->x:F

    .line 742
    .local v13, "lastX":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v14, v0, Landroid/graphics/PointF;->y:F

    .line 743
    .local v14, "lastY":F
    const/16 v26, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 744
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v26, v0

    cmpl-float v26, v13, v26

    if-eqz v26, :cond_7ff

    const/4 v5, 0x1

    .line 745
    .local v5, "atXEdge":Z
    :goto_776
    if-eqz v5, :cond_802

    cmpl-float v26, v9, v10

    if-lez v26, :cond_802

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v26, v0

    if-nez v26, :cond_802

    const/4 v11, 0x1

    .line 746
    .local v11, "edgeXSwipe":Z
    :goto_785
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v26, v0

    cmpl-float v26, v14, v26

    if-nez v26, :cond_804

    const/high16 v26, 0x41700000    # 15.0f

    cmpl-float v26, v10, v26

    if-lez v26, :cond_804

    const/16 v25, 0x1

    .line 747
    .local v25, "yPan":Z
    :goto_79d
    if-nez v11, :cond_807

    if-eqz v5, :cond_7ab

    if-nez v25, :cond_7ab

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v26, v0

    if-eqz v26, :cond_807

    .line 748
    :cond_7ab
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 756
    :cond_7b3
    :goto_7b3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    move/from16 v26, v0

    if-nez v26, :cond_7f4

    .line 757
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->x:F

    .line 758
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v27, v0

    move/from16 v0, v27

    move-object/from16 v1, v26

    iput v0, v1, Landroid/graphics/PointF;->y:F

    .line 759
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v26

    const/16 v27, 0x0

    invoke-interface/range {v26 .. v27}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 762
    :cond_7f4
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    goto/16 :goto_32e

    .line 744
    .end local v5    # "atXEdge":Z
    .end local v11    # "edgeXSwipe":Z
    .end local v25    # "yPan":Z
    :cond_7ff
    const/4 v5, 0x0

    goto/16 :goto_776

    .line 745
    .restart local v5    # "atXEdge":Z
    :cond_802
    const/4 v11, 0x0

    goto :goto_785

    .line 746
    .restart local v11    # "edgeXSwipe":Z
    :cond_804
    const/16 v25, 0x0

    goto :goto_79d

    .line 749
    .restart local v25    # "yPan":Z
    :cond_807
    const/high16 v26, 0x40a00000    # 5.0f

    cmpl-float v26, v9, v26

    if-lez v26, :cond_7b3

    .line 751
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 752
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Landroid/os/Handler;->removeMessages(I)V

    .line 753
    invoke-virtual/range {p0 .. p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v26

    const/16 v27, 0x0

    invoke-interface/range {v26 .. v27}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_7b3

    .line 775
    .end local v5    # "atXEdge":Z
    .end local v6    # "consumed":Z
    .end local v9    # "dx":F
    .end local v10    # "dy":F
    .end local v11    # "edgeXSwipe":Z
    .end local v13    # "lastX":F
    .end local v14    # "lastY":F
    .end local v25    # "yPan":Z
    :sswitch_82a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->handler:Landroid/os/Handler;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Landroid/os/Handler;->removeMessages(I)V

    .line 776
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    move/from16 v26, v0

    if-eqz v26, :cond_862

    .line 777
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isQuickScaling:Z

    .line 778
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleMoved:Z

    move/from16 v26, v0

    if-nez v26, :cond_862

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleCenter:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoom(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    .line 782
    :cond_862
    move-object/from16 v0, p0

    iget v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    move/from16 v26, v0

    if-lez v26, :cond_92f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v26, v0

    if-nez v26, :cond_87a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    move/from16 v26, v0

    if-eqz v26, :cond_92f

    .line 783
    :cond_87a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    move/from16 v26, v0

    if-eqz v26, :cond_8dc

    const/16 v26, 0x2

    move/from16 v0, v17

    move/from16 v1, v26

    if-ne v0, v1, :cond_8dc

    .line 785
    const/16 v26, 0x1

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 786
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslateStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    iget v0, v0, Landroid/graphics/PointF;->x:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    move-object/from16 v28, v0

    move-object/from16 v0, v28

    iget v0, v0, Landroid/graphics/PointF;->y:F

    move/from16 v28, v0

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 787
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v26

    const/16 v27, 0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_911

    .line 788
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    .line 793
    :cond_8dc
    :goto_8dc
    const/16 v26, 0x3

    move/from16 v0, v17

    move/from16 v1, v26

    if-ge v0, v1, :cond_8ec

    .line 795
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 797
    :cond_8ec
    const/16 v26, 0x2

    move/from16 v0, v17

    move/from16 v1, v26

    if-ge v0, v1, :cond_904

    .line 799
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 800
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 803
    :cond_904
    const/16 v26, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 804
    const/16 v26, 0x1

    goto/16 :goto_1f

    .line 790
    :cond_911
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vCenterStart:Landroid/graphics/PointF;

    move-object/from16 v26, v0

    const/16 v27, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v27

    const/16 v28, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v28

    invoke-virtual/range {v26 .. v28}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_8dc

    .line 806
    :cond_92f
    const/16 v26, 0x1

    move/from16 v0, v17

    move/from16 v1, v26

    if-ne v0, v1, :cond_94f

    .line 807
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isZooming:Z

    .line 808
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isPanning:Z

    .line 809
    const/16 v26, 0x0

    move/from16 v0, v26

    move-object/from16 v1, p0

    iput v0, v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxTouchCount:I

    .line 811
    :cond_94f
    const/16 v26, 0x1

    goto/16 :goto_1f

    .line 612
    nop

    :sswitch_data_954
    .sparse-switch
        0x0 -> :sswitch_ad
        0x1 -> :sswitch_82a
        0x2 -> :sswitch_1e6
        0x5 -> :sswitch_ad
        0x6 -> :sswitch_82a
        0x105 -> :sswitch_ad
        0x106 -> :sswitch_82a
    .end sparse-switch
.end method

.method public recycle()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 1831
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 1832
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapPaint:Landroid/graphics/Paint;

    .line 1833
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debugPaint:Landroid/graphics/Paint;

    .line 1834
    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 1835
    return-void
.end method

.method public final resetScaleAndCenter()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 2239
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2240
    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 2241
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 2242
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

    .line 2246
    :goto_29
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2247
    return-void

    .line 2244
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
    .line 2086
    .local p1, "bitmapDecoderClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;>;"
    if-nez p1, :cond_a

    .line 2087
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder class cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2089
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    invoke-direct {v0, p1}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2090
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
    .line 2098
    .local p1, "bitmapDecoderFactory":Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;, "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageDecoder;>;"
    if-nez p1, :cond_a

    .line 2099
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder factory cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2101
    :cond_a
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2102
    return-void
.end method

.method public final setDebug(Z)V
    .registers 2
    .param p1, "debug"    # Z

    .prologue
    .line 2439
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->debug:Z

    .line 2440
    return-void
.end method

.method public final setDoubleTapZoomDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2408
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2409
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2410
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomScale(F)V

    .line 2411
    return-void
.end method

.method public final setDoubleTapZoomScale(F)V
    .registers 2
    .param p1, "doubleTapZoomScale"    # F

    .prologue
    .line 2398
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomScale:F

    .line 2399
    return-void
.end method

.method public final setDoubleTapZoomStyle(I)V
    .registers 5
    .param p1, "doubleTapZoomStyle"    # I

    .prologue
    .line 2418
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ZOOM_STYLES:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2419
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

    .line 2421
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->doubleTapZoomStyle:I

    .line 2422
    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;)V
    .registers 3
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;

    .prologue
    const/4 v0, 0x0

    .line 332
    invoke-virtual {p0, p1, v0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 333
    return-void
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;)V
    .registers 4
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p2, "previewSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;

    .prologue
    .line 357
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 358
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

    .line 374
    if-nez p1, :cond_c

    .line 375
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "imageSource must not be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 378
    :cond_c
    invoke-direct {p0, v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 379
    if-eqz p3, :cond_14

    invoke-direct {p0, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->restoreState(Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 381
    :cond_14
    if-eqz p2, :cond_5d

    .line 382
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_24

    .line 383
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preview image cannot be used when a bitmap is provided for the main image"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 385
    :cond_24
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSWidth()I

    move-result v1

    if-lez v1, :cond_30

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSHeight()I

    move-result v1

    if-gtz v1, :cond_38

    .line 386
    :cond_30
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Preview image cannot be used unless dimensions are provided for the main image"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 388
    :cond_38
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSWidth()I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sWidth:I

    .line 389
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSHeight()I

    move-result v1

    iput v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sHeight:I

    .line 390
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pRegion:Landroid/graphics/Rect;

    .line 391
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_91

    .line 392
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->isCached()Z

    move-result v1

    iput-boolean v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapIsCached:Z

    .line 393
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onPreviewLoaded(Landroid/graphics/Bitmap;)V

    .line 404
    :cond_5d
    :goto_5d
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_da

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    if-eqz v1, :cond_da

    .line 405
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

    .line 424
    :goto_90
    return-void

    .line 395
    :cond_91
    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 396
    .local v4, "uri":Landroid/net/Uri;
    if-nez v4, :cond_ca

    invoke-virtual {p2}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_ca

    .line 397
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

    .line 399
    :cond_ca
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->bitmapDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;Z)V

    .line 400
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto :goto_5d

    .line 406
    .end local v0    # "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    .end local v4    # "uri":Landroid/net/Uri;
    :cond_da
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_ec

    .line 407
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->isCached()Z

    move-result v2

    invoke-direct {p0, v1, v10, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageLoaded(Landroid/graphics/Bitmap;IZ)V

    goto :goto_90

    .line 409
    :cond_ec
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getSRegion()Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    .line 410
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getUri()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    .line 411
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    if-nez v1, :cond_131

    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getResource()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_131

    .line 412
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

    .line 414
    :cond_131
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/ImageSource;->getTile()Z

    move-result v1

    if-nez v1, :cond_13b

    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRegion:Landroid/graphics/Rect;

    if-eqz v1, :cond_14d

    .line 416
    :cond_13b
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;

    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    iget-object v3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->uri:Landroid/net/Uri;

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/content/Context;Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;Landroid/net/Uri;)V

    .line 417
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$TilesInitTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto/16 :goto_90

    .line 420
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

    .line 421
    .local v0, "task":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$BitmapLoadTask;
    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->execute(Landroid/os/AsyncTask;)V

    goto/16 :goto_90
.end method

.method public final setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V
    .registers 4
    .param p1, "imageSource"    # Lcom/davemorrissey/labs/subscaleview/ImageSource;
    .param p2, "state"    # Lcom/davemorrissey/labs/subscaleview/ImageViewState;

    .prologue
    .line 343
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setImage(Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageSource;Lcom/davemorrissey/labs/subscaleview/ImageViewState;)V

    .line 344
    return-void
.end method

.method public final setMaxScale(F)V
    .registers 2
    .param p1, "maxScale"    # F

    .prologue
    .line 2138
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->maxScale:F

    .line 2139
    return-void
.end method

.method public final setMaximumDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2167
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2168
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2169
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMinScale(F)V

    .line 2170
    return-void
.end method

.method public final setMinScale(F)V
    .registers 2
    .param p1, "minScale"    # F

    .prologue
    .line 2146
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minScale:F

    .line 2147
    return-void
.end method

.method public final setMinimumDpi(I)V
    .registers 6
    .param p1, "dpi"    # I

    .prologue
    .line 2156
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2157
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2158
    .local v0, "averageDpi":F
    int-to-float v2, p1

    div-float v2, v0, v2

    invoke-virtual {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->setMaxScale(F)V

    .line 2159
    return-void
.end method

.method public final setMinimumScaleType(I)V
    .registers 5
    .param p1, "scaleType"    # I

    .prologue
    .line 2122
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_SCALE_TYPES:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2123
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

    .line 2125
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumScaleType:I

    .line 2126
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2127
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 2128
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2130
    :cond_34
    return-void
.end method

.method public setMinimumTileDpi(I)V
    .registers 6
    .param p1, "minimumTileDpi"    # I

    .prologue
    .line 2195
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 2196
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iget v3, v1, Landroid/util/DisplayMetrics;->ydpi:F

    add-float/2addr v2, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 2197
    .local v0, "averageDpi":F
    int-to-float v2, p1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->minimumTileDpi:I

    .line 2198
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 2199
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 2200
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2202
    :cond_26
    return-void
.end method

.method public setOnImageEventListener(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;)V
    .registers 2
    .param p1, "onImageEventListener"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    .prologue
    .line 2454
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onImageEventListener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnImageEventListener;

    .line 2455
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .registers 2
    .param p1, "onLongClickListener"    # Landroid/view/View$OnLongClickListener;

    .prologue
    .line 2447
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->onLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 2448
    return-void
.end method

.method public final setOrientation(I)V
    .registers 5
    .param p1, "orientation"    # I

    .prologue
    .line 318
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_ORIENTATIONS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 319
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

    .line 321
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->orientation:I

    .line 322
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->reset(Z)V

    .line 323
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 324
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->requestLayout()V

    .line 325
    return-void
.end method

.method public final setPanEnabled(Z)V
    .registers 6
    .param p1, "panEnabled"    # Z

    .prologue
    .line 2365
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panEnabled:Z

    .line 2366
    if-nez p1, :cond_41

    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-eqz v0, :cond_41

    .line 2367
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

    .line 2368
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

    .line 2369
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_41

    .line 2370
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->refreshRequiredTiles(Z)V

    .line 2371
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2374
    :cond_41
    return-void
.end method

.method public final setPanLimit(I)V
    .registers 5
    .param p1, "panLimit"    # I

    .prologue
    .line 2108
    sget-object v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_PAN_LIMITS:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 2109
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

    .line 2111
    :cond_25
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->panLimit:I

    .line 2112
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->isReady()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 2113
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(Z)V

    .line 2114
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2116
    :cond_34
    return-void
.end method

.method public setParallelLoadingEnabled(Z)V
    .registers 2
    .param p1, "parallelLoadingEnabled"    # Z

    .prologue
    .line 2432
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->parallelLoadingEnabled:Z

    .line 2433
    return-void
.end method

.method public final setQuickScaleEnabled(Z)V
    .registers 2
    .param p1, "quickScaleEnabled"    # Z

    .prologue
    .line 2351
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->quickScaleEnabled:Z

    .line 2352
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
    .line 2060
    .local p1, "regionDecoderClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;>;"
    if-nez p1, :cond_a

    .line 2061
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder class cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2063
    :cond_a
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;

    invoke-direct {v0, p1}, Lcom/davemorrissey/labs/subscaleview/decoder/CompatDecoderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2064
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
    .line 2073
    .local p1, "regionDecoderFactory":Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;, "Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory<+Lcom/davemorrissey/labs/subscaleview/decoder/ImageRegionDecoder;>;"
    if-nez p1, :cond_a

    .line 2074
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Decoder factory cannot be set to null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2076
    :cond_a
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->regionDecoderFactory:Lcom/davemorrissey/labs/subscaleview/decoder/DecoderFactory;

    .line 2077
    return-void
.end method

.method public final setScaleAndCenter(FLandroid/graphics/PointF;)V
    .registers 4
    .param p1, "scale"    # F
    .param p2, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    .line 2227
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2228
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->pendingScale:Ljava/lang/Float;

    .line 2229
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sPendingCenter:Landroid/graphics/PointF;

    .line 2230
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sRequestedCenter:Landroid/graphics/PointF;

    .line 2231
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2232
    return-void
.end method

.method public final setTileBackgroundColor(I)V
    .registers 4
    .param p1, "tileBgColor"    # I

    .prologue
    .line 2381
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_d

    .line 2382
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 2388
    :goto_9
    invoke-virtual {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2389
    return-void

    .line 2384
    :cond_d
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    .line 2385
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 2386
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->tileBgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_9
.end method

.method public final setZoomEnabled(Z)V
    .registers 2
    .param p1, "zoomEnabled"    # Z

    .prologue
    .line 2337
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->zoomEnabled:Z

    .line 2338
    return-void
.end method

.method public final sourceToViewCoord(FF)Landroid/graphics/PointF;
    .registers 4
    .param p1, "sx"    # F
    .param p2, "sy"    # F

    .prologue
    .line 1912
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
    .line 1926
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_6

    .line 1927
    const/4 p3, 0x0

    .line 1930
    .end local p3    # "vTarget":Landroid/graphics/PointF;
    :goto_5
    return-object p3

    .line 1929
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
    .line 1905
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
    .line 1919
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
    .line 1864
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
    .line 1878
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->vTranslate:Landroid/graphics/PointF;

    if-nez v0, :cond_6

    .line 1879
    const/4 p3, 0x0

    .line 1882
    .end local p3    # "sTarget":Landroid/graphics/PointF;
    :goto_5
    return-object p3

    .line 1881
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
    .line 1857
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
    .line 1871
    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0, v0, v1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->viewToSourceCoord(FFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method
