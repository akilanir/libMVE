.class public Lorg/osmdroid/views/overlay/compass/CompassOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "CompassOverlay.java"

# interfaces
.implements Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
.implements Lorg/osmdroid/views/overlay/compass/IOrientationConsumer;


# static fields
.field public static final MENU_COMPASS:I

.field private static final sSmoothPaint:Landroid/graphics/Paint;


# instance fields
.field private mAzimuth:F

.field private mCompassCenterX:F

.field private mCompassCenterY:F

.field protected mCompassFrameBitmap:Landroid/graphics/Bitmap;

.field protected final mCompassFrameCenterX:F

.field protected final mCompassFrameCenterY:F

.field private final mCompassMatrix:Landroid/graphics/Matrix;

.field private final mCompassRadius:F

.field protected mCompassRoseBitmap:Landroid/graphics/Bitmap;

.field protected final mCompassRoseCenterX:F

.field protected final mCompassRoseCenterY:F

.field private final mDisplay:Landroid/view/Display;

.field private mIsCompassEnabled:Z

.field protected final mMapView:Lorg/osmdroid/views/MapView;

.field private mOptionsMenuEnabled:Z

.field public mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 35
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->sSmoothPaint:Landroid/graphics/Paint;

    .line 60
    invoke-static {}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->MENU_COMPASS:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/MapView;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 69
    new-instance v0, Lorg/osmdroid/views/overlay/compass/InternalCompassOrientationProvider;

    invoke-direct {v0, p1}, Lorg/osmdroid/views/overlay/compass/InternalCompassOrientationProvider;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0, p2}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;-><init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/compass/IOrientationProvider;Lorg/osmdroid/views/MapView;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/compass/IOrientationProvider;Lorg/osmdroid/views/MapView;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orientationProvider"    # Lorg/osmdroid/views/overlay/compass/IOrientationProvider;
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 73
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v0, p1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;-><init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/compass/IOrientationProvider;Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/compass/IOrientationProvider;Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "orientationProvider"    # Lorg/osmdroid/views/overlay/compass/IOrientationProvider;
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p4, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    const/high16 v3, 0x420c0000    # 35.0f

    const/high16 v2, 0x3f000000    # 0.5f

    .line 78
    invoke-direct {p0, p4}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 43
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    .line 49
    const/high16 v1, 0x7fc00000    # Float.NaN

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    .line 51
    iput v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterX:F

    .line 52
    iput v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterY:F

    .line 53
    const/high16 v1, 0x41a00000    # 20.0f

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRadius:F

    .line 62
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOptionsMenuEnabled:Z

    .line 80
    iput-object p3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    .line 81
    const-string v1, "window"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 83
    .local v0, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    iput-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mDisplay:Landroid/view/Display;

    .line 85
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->createCompassFramePicture()V

    .line 86
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->createCompassRosePicture()V

    .line 88
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v1, v2

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterX:F

    .line 89
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v1, v2

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterY:F

    .line 90
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v1, v2

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterX:F

    .line 91
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    sub-float/2addr v1, v2

    iput v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterY:F

    .line 93
    invoke-virtual {p0, p2}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->setOrientationProvider(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)V

    .line 94
    return-void
.end method

.method private calculatePointOnCircle(FFFF)Landroid/graphics/Point;
    .registers 13
    .param p1, "centerX"    # F
    .param p2, "centerY"    # F
    .param p3, "radius"    # F
    .param p4, "degrees"    # F

    .prologue
    .line 307
    neg-float v4, p4

    const/high16 v5, 0x42b40000    # 90.0f

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    .line 309
    .local v0, "dblRadians":D
    float-to-double v4, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    double-to-int v2, v4

    .line 310
    .local v2, "intX":I
    float-to-double v4, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    double-to-int v3, v4

    .line 312
    .local v3, "intY":I
    new-instance v4, Landroid/graphics/Point;

    float-to-int v5, p1

    add-int/2addr v5, v2

    float-to-int v6, p2

    sub-int/2addr v6, v3

    invoke-direct {v4, v5, v6}, Landroid/graphics/Point;-><init>(II)V

    return-object v4
.end method

.method private createCompassFramePicture()V
    .registers 12

    .prologue
    const/16 v3, 0xc8

    const/4 v2, 0x1

    const/high16 v10, 0x41a00000    # 20.0f

    .line 344
    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8}, Landroid/graphics/Paint;-><init>()V

    .line 345
    .local v8, "innerPaint":Landroid/graphics/Paint;
    const/4 v0, -0x1

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 346
    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 347
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 348
    invoke-virtual {v8, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 351
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 352
    .local v6, "outerPaint":Landroid/graphics/Paint;
    const v0, -0x777778

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 353
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 354
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 355
    const/high16 v0, 0x40000000    # 2.0f

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 356
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 358
    const/high16 v0, 0x42480000    # 50.0f

    iget v2, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v0, v2

    float-to-int v9, v0

    .line 359
    .local v9, "picBorderWidthAndHeight":I
    div-int/lit8 v7, v9, 0x2

    .line 361
    .local v7, "center":I
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v9, v9, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameBitmap:Landroid/graphics/Bitmap;

    .line 363
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 366
    .local v1, "canvas":Landroid/graphics/Canvas;
    int-to-float v0, v7

    int-to-float v2, v7

    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v3, v10

    invoke-virtual {v1, v0, v2, v3, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 367
    int-to-float v0, v7

    int-to-float v2, v7

    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v3, v10

    invoke-virtual {v1, v0, v2, v3, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 372
    int-to-float v2, v7

    int-to-float v3, v7

    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v4, v10, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->drawTriangle(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 373
    int-to-float v2, v7

    int-to-float v3, v7

    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v4, v10, v0

    const/high16 v5, 0x42b40000    # 90.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->drawTriangle(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 374
    int-to-float v2, v7

    int-to-float v3, v7

    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v4, v10, v0

    const/high16 v5, 0x43340000    # 180.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->drawTriangle(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 375
    int-to-float v2, v7

    int-to-float v3, v7

    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v4, v10, v0

    const/high16 v5, 0x43870000    # 270.0f

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->drawTriangle(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V

    .line 376
    return-void
.end method

.method private createCompassRosePicture()V
    .registers 14

    .prologue
    const/16 v10, 0xdc

    const/4 v9, 0x1

    const/high16 v12, 0x41880000    # 17.0f

    const/high16 v11, 0x40800000    # 4.0f

    .line 380
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 381
    .local v3, "northPaint":Landroid/graphics/Paint;
    const/high16 v8, -0x600000

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 382
    invoke-virtual {v3, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 383
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 384
    invoke-virtual {v3, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 387
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 388
    .local v7, "southPaint":Landroid/graphics/Paint;
    const/high16 v8, -0x1000000

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 389
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 390
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 391
    invoke-virtual {v7, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 394
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 395
    .local v2, "centerPaint":Landroid/graphics/Paint;
    const/4 v8, -0x1

    invoke-virtual {v2, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 396
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 397
    sget-object v8, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v8}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 398
    invoke-virtual {v2, v10}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 400
    const/high16 v8, 0x42480000    # 50.0f

    iget v9, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v8, v9

    float-to-int v6, v8

    .line 401
    .local v6, "picBorderWidthAndHeight":I
    div-int/lit8 v1, v6, 0x2

    .line 403
    .local v1, "center":I
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    iput-object v8, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseBitmap:Landroid/graphics/Bitmap;

    .line 405
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v8, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 408
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    .line 409
    .local v4, "pathNorth":Landroid/graphics/Path;
    int-to-float v8, v1

    int-to-float v9, v1

    iget v10, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v10, v12

    sub-float/2addr v9, v10

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    .line 410
    int-to-float v8, v1

    iget v9, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v9, v11

    add-float/2addr v8, v9

    int-to-float v9, v1

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 411
    int-to-float v8, v1

    iget v9, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v9, v11

    sub-float/2addr v8, v9

    int-to-float v9, v1

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 412
    int-to-float v8, v1

    int-to-float v9, v1

    iget v10, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v10, v12

    sub-float/2addr v9, v10

    invoke-virtual {v4, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 413
    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    .line 414
    invoke-virtual {v0, v4, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 417
    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 418
    .local v5, "pathSouth":Landroid/graphics/Path;
    int-to-float v8, v1

    int-to-float v9, v1

    iget v10, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v10, v12

    add-float/2addr v9, v10

    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    .line 419
    int-to-float v8, v1

    iget v9, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v9, v11

    add-float/2addr v8, v9

    int-to-float v9, v1

    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 420
    int-to-float v8, v1

    iget v9, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v9, v11

    sub-float/2addr v8, v9

    int-to-float v9, v1

    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 421
    int-to-float v8, v1

    int-to-float v9, v1

    iget v10, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v10, v12

    add-float/2addr v9, v10

    invoke-virtual {v5, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    .line 422
    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    .line 423
    invoke-virtual {v0, v5, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 426
    int-to-float v8, v1

    int-to-float v9, v1

    const/high16 v10, 0x40000000    # 2.0f

    invoke-virtual {v0, v8, v9, v10, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 427
    return-void
.end method

.method private drawTriangle(Landroid/graphics/Canvas;FFFFLandroid/graphics/Paint;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # F
    .param p3, "y"    # F
    .param p4, "radius"    # F
    .param p5, "degrees"    # F
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 317
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 318
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->calculatePointOnCircle(FFFF)Landroid/graphics/Point;

    move-result-object v1

    .line 319
    .local v1, "point":Landroid/graphics/Point;
    iget v2, v1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {p1, p5, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 320
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 321
    .local v0, "p":Landroid/graphics/Path;
    iget v2, v1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    iget v3, v1, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 322
    iget v2, v1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v3, v1, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 323
    iget v2, v1, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    const/high16 v4, 0x40a00000    # 5.0f

    iget v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 324
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 325
    invoke-virtual {p1, v0, p6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 326
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 327
    return-void
.end method

.method private getDisplayOrientation()I
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getOrientation()I

    move-result v0

    packed-switch v0, :pswitch_data_14

    .line 338
    const/4 v0, 0x0

    :goto_a
    return v0

    .line 332
    :pswitch_b
    const/16 v0, 0x5a

    goto :goto_a

    .line 334
    :pswitch_e
    const/16 v0, 0xb4

    goto :goto_a

    .line 336
    :pswitch_11
    const/16 v0, 0x10e

    goto :goto_a

    .line 330
    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_b
        :pswitch_e
        :pswitch_11
    .end packed-switch
.end method

.method private invalidateCompass()V
    .registers 11

    .prologue
    .line 103
    iget-object v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v5

    invoke-virtual {v5}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v4

    .line 104
    .local v4, "screenRect":Landroid/graphics/Rect;
    iget v5, v4, Landroid/graphics/Rect;->left:I

    iget v6, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterX:F

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterX:F

    sub-float/2addr v6, v7

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    add-int v1, v5, v6

    .line 106
    .local v1, "frameLeft":I
    iget v5, v4, Landroid/graphics/Rect;->top:I

    iget v6, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterY:F

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterY:F

    sub-float/2addr v6, v7

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    add-int v3, v5, v6

    .line 108
    .local v3, "frameTop":I
    iget v5, v4, Landroid/graphics/Rect;->left:I

    iget v6, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterX:F

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterX:F

    add-float/2addr v6, v7

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    add-int v2, v5, v6

    .line 110
    .local v2, "frameRight":I
    iget v5, v4, Landroid/graphics/Rect;->top:I

    iget v6, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterY:F

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterY:F

    add-float/2addr v6, v7

    iget v7, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float/2addr v6, v7

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    add-int v0, v5, v6

    .line 114
    .local v0, "frameBottom":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    add-int/lit8 v6, v1, -0x2

    add-int/lit8 v7, v3, -0x2

    add-int/lit8 v8, v2, 0x2

    add-int/lit8 v9, v0, 0x2

    invoke-virtual {v5, v6, v7, v8, v9}, Lorg/osmdroid/views/MapView;->postInvalidateMapCoordinates(IIII)V

    .line 116
    return-void
.end method


# virtual methods
.method public disableCompass()V
    .registers 2

    .prologue
    .line 271
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mIsCompassEnabled:Z

    .line 273
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    if-eqz v0, :cond_c

    .line 274
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    invoke-interface {v0}, Lorg/osmdroid/views/overlay/compass/IOrientationProvider;->stopOrientationProvider()V

    .line 278
    :cond_c
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    .line 281
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    if-eqz v0, :cond_17

    .line 282
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->invalidateCompass()V

    .line 284
    :cond_17
    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 6
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 173
    if-eqz p3, :cond_3

    .line 181
    :cond_2
    :goto_2
    return-void

    .line 177
    :cond_3
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->isCompassEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_2

    .line 178
    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->getDisplayOrientation()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    invoke-virtual {v1}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->drawCompass(Landroid/graphics/Canvas;FLandroid/graphics/Rect;)V

    goto :goto_2
.end method

.method protected drawCompass(Landroid/graphics/Canvas;FLandroid/graphics/Rect;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "bearing"    # F
    .param p3, "screenRect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v7, 0x0

    .line 143
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v3}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    .line 144
    .local v2, "proj":Lorg/osmdroid/views/Projection;
    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterX:F

    iget v4, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v0, v3, v4

    .line 145
    .local v0, "centerX":F
    iget v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterY:F

    iget v4, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mScale:F

    mul-float v1, v3, v4

    .line 147
    .local v1, "centerY":F
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    iget v4, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterX:F

    neg-float v4, v4

    iget v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameCenterY:F

    neg-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 148
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 150
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 151
    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getInvertedScaleRotateCanvasMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 152
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 153
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassFrameBitmap:Landroid/graphics/Bitmap;

    sget-object v4, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->sSmoothPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v7, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 154
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 156
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    neg-float v4, p2

    iget v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterX:F

    iget v6, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterY:F

    invoke-virtual {v3, v4, v5, v6}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 157
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    iget v4, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterX:F

    neg-float v4, v4

    iget v5, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseCenterY:F

    neg-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 158
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 160
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 161
    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getInvertedScaleRotateCanvasMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 162
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 163
    iget-object v3, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassRoseBitmap:Landroid/graphics/Bitmap;

    sget-object v4, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->sSmoothPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v7, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 164
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 165
    return-void
.end method

.method public enableCompass()Z
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->enableCompass(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)Z

    move-result v0

    return v0
.end method

.method public enableCompass(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)Z
    .registers 4
    .param p1, "orientationProvider"    # Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    .prologue
    .line 243
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->setOrientationProvider(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)V

    .line 245
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    invoke-interface {v1, p0}, Lorg/osmdroid/views/overlay/compass/IOrientationProvider;->startOrientationProvider(Lorg/osmdroid/views/overlay/compass/IOrientationConsumer;)Z

    move-result v0

    .line 246
    .local v0, "success":Z
    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mIsCompassEnabled:Z

    .line 249
    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    if-eqz v1, :cond_12

    .line 250
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->invalidateCompass()V

    .line 253
    :cond_12
    return v0
.end method

.method public getOrientation()F
    .registers 2

    .prologue
    .line 296
    iget v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    return v0
.end method

.method public getOrientationProvider()Lorg/osmdroid/views/overlay/compass/IOrientationProvider;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    return-object v0
.end method

.method public isCompassEnabled()Z
    .registers 2

    .prologue
    .line 292
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mIsCompassEnabled:Z

    return v0
.end method

.method public isOptionsMenuEnabled()Z
    .registers 2

    .prologue
    .line 194
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOptionsMenuEnabled:Z

    return v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 200
    sget v0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->MENU_COMPASS:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v2, Lorg/osmdroid/ResourceProxy$string;->compass:Lorg/osmdroid/ResourceProxy$string;

    invoke-interface {v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v3, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v2, Lorg/osmdroid/ResourceProxy$bitmap;->ic_menu_compass:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v1, v2}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 205
    return v4
.end method

.method public onDetach(Lorg/osmdroid/views/MapView;)V
    .registers 2
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->disableCompass()V

    .line 99
    invoke-super {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;->onDetach(Lorg/osmdroid/views/MapView;)V

    .line 100
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pItem"    # Landroid/view/MenuItem;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 218
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sub-int v0, v1, p2

    .line 219
    .local v0, "menuId":I
    sget v1, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->MENU_COMPASS:I

    if-ne v0, v1, :cond_19

    .line 220
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->isCompassEnabled()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 221
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->disableCompass()V

    .line 225
    :goto_13
    const/4 v1, 0x1

    .line 227
    :goto_14
    return v1

    .line 223
    :cond_15
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->enableCompass()Z

    goto :goto_13

    .line 227
    :cond_19
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public onOrientationChanged(FLorg/osmdroid/views/overlay/compass/IOrientationProvider;)V
    .registers 3
    .param p1, "orientation"    # F
    .param p2, "source"    # Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    .prologue
    .line 237
    iput p1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mAzimuth:F

    .line 238
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->invalidateCompass()V

    .line 239
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 211
    sget v0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->MENU_COMPASS:I

    add-int/2addr v0, p2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->isCompassEnabled()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 212
    const/4 v0, 0x0

    return v0
.end method

.method public setCompassCenter(FF)V
    .registers 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 123
    iput p1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterX:F

    .line 124
    iput p2, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mCompassCenterY:F

    .line 125
    return-void
.end method

.method public setOptionsMenuEnabled(Z)V
    .registers 2
    .param p1, "pOptionsMenuEnabled"    # Z

    .prologue
    .line 189
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOptionsMenuEnabled:Z

    .line 190
    return-void
.end method

.method protected setOrientationProvider(Lorg/osmdroid/views/overlay/compass/IOrientationProvider;)V
    .registers 4
    .param p1, "orientationProvider"    # Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    .prologue
    .line 132
    if-nez p1, :cond_a

    .line 133
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "You must pass an IOrientationProvider to setOrientationProvider()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_a
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->isCompassEnabled()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 137
    iget-object v0, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    invoke-interface {v0}, Lorg/osmdroid/views/overlay/compass/IOrientationProvider;->stopOrientationProvider()V

    .line 139
    :cond_15
    iput-object p1, p0, Lorg/osmdroid/views/overlay/compass/CompassOverlay;->mOrientationProvider:Lorg/osmdroid/views/overlay/compass/IOrientationProvider;

    .line 140
    return-void
.end method
