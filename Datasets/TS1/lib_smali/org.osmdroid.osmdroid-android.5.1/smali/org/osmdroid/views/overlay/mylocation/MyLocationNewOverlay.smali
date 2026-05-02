.class public Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "MyLocationNewOverlay.java"

# interfaces
.implements Lorg/osmdroid/views/overlay/mylocation/IMyLocationConsumer;
.implements Lorg/osmdroid/views/overlay/IOverlayMenuProvider;
.implements Lorg/osmdroid/views/overlay/Overlay$Snappable;


# static fields
.field public static final MENU_MY_LOCATION:I


# instance fields
.field protected final mCirclePaint:Landroid/graphics/Paint;

.field protected final mDirectionArrowBitmap:Landroid/graphics/Bitmap;

.field protected final mDirectionArrowCenterX:F

.field protected final mDirectionArrowCenterY:F

.field protected mDrawAccuracyEnabled:Z

.field private final mGeoPoint:Lorg/osmdroid/util/GeoPoint;

.field private final mHandler:Landroid/os/Handler;

.field private final mHandlerToken:Ljava/lang/Object;

.field protected mIsFollowing:Z

.field private mIsLocationEnabled:Z

.field private mLocation:Landroid/location/Location;

.field private final mMapController:Lorg/osmdroid/api/IMapController;

.field private final mMapCoordsProjected:Landroid/graphics/Point;

.field private final mMapCoordsTranslated:Landroid/graphics/Point;

.field protected final mMapView:Lorg/osmdroid/views/MapView;

.field private final mMatrix:Landroid/graphics/Matrix;

.field private final mMatrixValues:[F

.field private final mMyLocationPreviousRect:Landroid/graphics/Rect;

.field public mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

.field private final mMyLocationRect:Landroid/graphics/Rect;

.field private mOptionsMenuEnabled:Z

.field protected final mPaint:Landroid/graphics/Paint;

.field protected mPersonBitmap:Landroid/graphics/Bitmap;

.field protected final mPersonHotspot:Landroid/graphics/PointF;

.field private final mRunOnFirstFix:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 80
    invoke-static {}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->MENU_MY_LOCATION:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/MapView;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 95
    new-instance v0, Lorg/osmdroid/views/overlay/mylocation/GpsMyLocationProvider;

    invoke-direct {v0, p1}, Lorg/osmdroid/views/overlay/mylocation/GpsMyLocationProvider;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0, p2}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;-><init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;Lorg/osmdroid/views/MapView;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;Lorg/osmdroid/views/MapView;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "myLocationProvider"    # Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 100
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v0, p1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p2, p3, v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;-><init>(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V

    .line 101
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V
    .registers 11
    .param p1, "myLocationProvider"    # Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "resourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    const/16 v6, 0x64

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v2, 0x0

    .line 105
    invoke-direct {p0, p3}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPaint:Landroid/graphics/Paint;

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    .line 62
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mRunOnFirstFix:Ljava/util/LinkedList;

    .line 63
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsProjected:Landroid/graphics/Point;

    .line 64
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandlerToken:Ljava/lang/Object;

    .line 69
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v0, v2, v2}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mGeoPoint:Lorg/osmdroid/util/GeoPoint;

    .line 70
    iput-boolean v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsLocationEnabled:Z

    .line 71
    iput-boolean v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsFollowing:Z

    .line 72
    iput-boolean v3, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDrawAccuracyEnabled:Z

    .line 82
    iput-boolean v3, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mOptionsMenuEnabled:Z

    .line 85
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    .line 86
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrix:Landroid/graphics/Matrix;

    .line 87
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    .line 88
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationPreviousRect:Landroid/graphics/Rect;

    .line 107
    iput-object p2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    .line 108
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapController:Lorg/osmdroid/api/IMapController;

    .line 109
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v2, v6, v6, v1}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 110
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 111
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 113
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$bitmap;->person:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v0, v1}, Lorg/osmdroid/ResourceProxy;->getBitmap(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonBitmap:Landroid/graphics/Bitmap;

    .line 114
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$bitmap;->direction_arrow:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v0, v1}, Lorg/osmdroid/ResourceProxy;->getBitmap(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    .line 116
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v5

    sub-float/2addr v0, v4

    iput v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowCenterX:F

    .line 117
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v5

    sub-float/2addr v0, v4

    iput v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowCenterY:F

    .line 120
    new-instance v0, Landroid/graphics/PointF;

    const/high16 v1, 0x41c00000    # 24.0f

    iget v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mScale:F

    mul-float/2addr v1, v2

    add-float/2addr v1, v4

    const/high16 v2, 0x421c0000    # 39.0f

    iget v3, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mScale:F

    mul-float/2addr v2, v3

    add-float/2addr v2, v4

    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    .line 122
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandler:Landroid/os/Handler;

    .line 123
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setMyLocationProvider(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)V

    .line 124
    return-void
.end method

.method static synthetic access$000(Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;)Ljava/util/LinkedList;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mRunOnFirstFix:Ljava/util/LinkedList;

    return-object v0
.end method


# virtual methods
.method public disableFollowLocation()V
    .registers 2

    .prologue
    .line 411
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsFollowing:Z

    .line 412
    return-void
.end method

.method public disableMyLocation()V
    .registers 2

    .prologue
    .line 518
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsLocationEnabled:Z

    .line 520
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->stopLocationProvider()V

    .line 523
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    if-eqz v0, :cond_f

    .line 524
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 526
    :cond_f
    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 5
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 280
    if-eqz p3, :cond_3

    .line 286
    :cond_2
    :goto_2
    return-void

    .line 283
    :cond_3
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isMyLocationEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 284
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-virtual {p0, p1, p2, v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->drawMyLocation(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Landroid/location/Location;)V

    goto :goto_2
.end method

.method protected drawMyLocation(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Landroid/location/Location;)V
    .registers 12
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "lastFix"    # Landroid/location/Location;

    .prologue
    .line 175
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    .line 176
    .local v0, "pj":Lorg/osmdroid/views/Projection;
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsProjected:Landroid/graphics/Point;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    invoke-virtual {v0, v4, v5}, Lorg/osmdroid/views/Projection;->toPixelsFromProjected(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 178
    iget-boolean v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDrawAccuracyEnabled:Z

    if-eqz v4, :cond_5c

    .line 179
    invoke-virtual {p3}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    invoke-virtual {p3}, Landroid/location/Location;->getLatitude()D

    move-result-wide v5

    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v7

    invoke-static {v5, v6, v7}, Lorg/osmdroid/util/TileSystem;->GroundResolution(DI)D

    move-result-wide v5

    double-to-float v5, v5

    div-float v1, v4, v5

    .line 183
    .local v1, "radius":F
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    const/16 v5, 0x32

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 184
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 185
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v1, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 187
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    const/16 v5, 0x96

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 188
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 189
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v1, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 192
    .end local v1    # "radius":F
    :cond_5c
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->getMatrix(Landroid/graphics/Matrix;)V

    .line 193
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->getValues([F)V

    .line 207
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v5, 0x0

    aget v4, v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v6, 0x0

    aget v5, v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v6, 0x3

    aget v5, v5, v6

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v2, v4

    .line 210
    .local v2, "scaleX":F
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v5, 0x4

    aget v4, v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v6, 0x4

    aget v5, v5, v6

    mul-float/2addr v4, v5

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v6, 0x1

    aget v5, v5, v6

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMatrixValues:[F

    const/4 v7, 0x1

    aget v6, v6, v7

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    double-to-float v3, v4

    .line 213
    .local v3, "scaleY":F
    invoke-virtual {p3}, Landroid/location/Location;->hasBearing()Z

    move-result v4

    if-eqz v4, :cond_ea

    .line 214
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 216
    invoke-virtual {p3}, Landroid/location/Location;->getBearing()F

    move-result v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    int-to-float v5, v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    int-to-float v6, v6

    invoke-virtual {p1, v4, v5, v6}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 218
    const/high16 v4, 0x3f800000    # 1.0f

    div-float/2addr v4, v2

    const/high16 v5, 0x3f800000    # 1.0f

    div-float/2addr v5, v3

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    int-to-float v6, v6

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    int-to-float v7, v7

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 220
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    int-to-float v5, v5

    iget v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowCenterX:F

    sub-float/2addr v5, v6

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    int-to-float v6, v6

    iget v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowCenterY:F

    sub-float/2addr v6, v7

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 223
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 236
    :goto_e9
    return-void

    .line 225
    :cond_ea
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 227
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v4}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v4

    neg-float v4, v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    int-to-float v5, v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    int-to-float v6, v6

    invoke-virtual {p1, v4, v5, v6}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 230
    const/high16 v4, 0x3f800000    # 1.0f

    div-float/2addr v4, v2

    const/high16 v5, 0x3f800000    # 1.0f

    div-float/2addr v5, v3

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    int-to-float v6, v6

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    int-to-float v7, v7

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 232
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonBitmap:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    int-to-float v5, v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->x:F

    sub-float/2addr v5, v6

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    int-to-float v6, v6

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    sub-float/2addr v6, v7

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 234
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_e9
.end method

.method public enableFollowLocation()V
    .registers 3

    .prologue
    .line 391
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsFollowing:Z

    .line 394
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isMyLocationEnabled()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 395
    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    invoke-interface {v1}, Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    .line 396
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_14

    .line 397
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setLocation(Landroid/location/Location;)V

    .line 402
    .end local v0    # "location":Landroid/location/Location;
    :cond_14
    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    if-eqz v1, :cond_1d

    .line 403
    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v1}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 405
    :cond_1d
    return-void
.end method

.method public enableMyLocation()Z
    .registers 2

    .prologue
    .line 511
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->enableMyLocation(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)Z

    move-result v0

    return v0
.end method

.method public enableMyLocation(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)Z
    .registers 5
    .param p1, "myLocationProvider"    # Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    .prologue
    .line 482
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setMyLocationProvider(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)V

    .line 484
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    invoke-interface {v2, p0}, Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;->startLocationProvider(Lorg/osmdroid/views/overlay/mylocation/IMyLocationConsumer;)Z

    move-result v1

    .line 485
    .local v1, "success":Z
    iput-boolean v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsLocationEnabled:Z

    .line 488
    if-eqz v1, :cond_18

    .line 489
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    invoke-interface {v2}, Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;->getLastKnownLocation()Landroid/location/Location;

    move-result-object v0

    .line 490
    .local v0, "location":Landroid/location/Location;
    if-eqz v0, :cond_18

    .line 491
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->setLocation(Landroid/location/Location;)V

    .line 496
    .end local v0    # "location":Landroid/location/Location;
    :cond_18
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    if-eqz v2, :cond_21

    .line 497
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v2}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 500
    :cond_21
    return v1
.end method

.method public getLastFix()Landroid/location/Location;
    .registers 2

    .prologue
    .line 383
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    return-object v0
.end method

.method public getMyLocation()Lorg/osmdroid/util/GeoPoint;
    .registers 3

    .prologue
    .line 375
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    if-nez v0, :cond_6

    .line 376
    const/4 v0, 0x0

    .line 378
    :goto_5
    return-object v0

    :cond_6
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-direct {v0, v1}, Lorg/osmdroid/util/GeoPoint;-><init>(Landroid/location/Location;)V

    goto :goto_5
.end method

.method protected getMyLocationDrawingBounds(ILandroid/location/Location;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 14
    .param p1, "zoomLevel"    # I
    .param p2, "lastFix"    # Landroid/location/Location;
    .param p3, "reuse"    # Landroid/graphics/Rect;

    .prologue
    const/high16 v9, 0x3f000000    # 0.5f

    .line 239
    if-nez p3, :cond_9

    .line 240
    new-instance p3, Landroid/graphics/Rect;

    .end local p3    # "reuse":Landroid/graphics/Rect;
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 242
    .restart local p3    # "reuse":Landroid/graphics/Rect;
    :cond_9
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v4}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    .line 243
    .local v0, "pj":Lorg/osmdroid/views/Projection;
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsProjected:Landroid/graphics/Point;

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    invoke-virtual {v0, v4, v5}, Lorg/osmdroid/views/Projection;->toPixelsFromProjected(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 246
    invoke-virtual {p2}, Landroid/location/Location;->hasBearing()Z

    move-result v4

    if-eqz v4, :cond_9e

    .line 249
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDirectionArrowBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-double v4, v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v6, v7}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v3, v4

    .line 251
    .local v3, "widestEdge":I
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    add-int/2addr v6, v3

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    add-int/2addr v7, v3

    invoke-virtual {p3, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 253
    neg-int v4, v3

    div-int/lit8 v4, v4, 0x2

    neg-int v5, v3

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {p3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 261
    .end local v3    # "widestEdge":I
    :goto_57
    iget-boolean v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDrawAccuracyEnabled:Z

    if-eqz v4, :cond_9d

    .line 262
    invoke-virtual {p2}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    invoke-virtual {p2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v5

    invoke-static {v5, v6, p1}, Lorg/osmdroid/util/TileSystem;->GroundResolution(DI)D

    move-result-wide v5

    double-to-float v5, v5

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v1, v4

    .line 264
    .local v1, "radius":I
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    sub-int/2addr v4, v1

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    sub-int/2addr v5, v1

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    add-int/2addr v6, v1

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    add-int/2addr v7, v1

    invoke-virtual {p3, v4, v5, v6, v7}, Landroid/graphics/Rect;->union(IIII)V

    .line 266
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v4

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-nez v4, :cond_d1

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    :goto_93
    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v2, v4

    .line 268
    .local v2, "strokeWidth":I
    neg-int v4, v2

    neg-int v5, v2

    invoke-virtual {p3, v4, v5}, Landroid/graphics/Rect;->inset(II)V

    .line 271
    .end local v1    # "radius":I
    .end local v2    # "strokeWidth":I
    :cond_9d
    return-object p3

    .line 255
    :cond_9e
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v7, v7, Landroid/graphics/Point;->y:I

    iget-object v8, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p3, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 257
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    neg-float v4, v4

    add-float/2addr v4, v9

    float-to-int v4, v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->y:F

    neg-float v5, v5

    add-float/2addr v5, v9

    float-to-int v5, v5

    invoke-virtual {p3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_57

    .line 266
    .restart local v1    # "radius":I
    :cond_d1
    iget-object v4, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v4

    float-to-double v4, v4

    goto :goto_93
.end method

.method public getMyLocationProvider()Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    return-object v0
.end method

.method public isDrawAccuracyEnabled()Z
    .registers 2

    .prologue
    .line 152
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDrawAccuracyEnabled:Z

    return v0
.end method

.method public isFollowLocationEnabled()Z
    .registers 2

    .prologue
    .line 421
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsFollowing:Z

    return v0
.end method

.method public isMyLocationEnabled()Z
    .registers 2

    .prologue
    .line 541
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsLocationEnabled:Z

    return v0
.end method

.method public isOptionsMenuEnabled()Z
    .registers 2

    .prologue
    .line 328
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mOptionsMenuEnabled:Z

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

    .line 334
    sget v0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->MENU_MY_LOCATION:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v2, Lorg/osmdroid/ResourceProxy$string;->my_location:Lorg/osmdroid/ResourceProxy$string;

    invoke-interface {v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v3, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v2, Lorg/osmdroid/ResourceProxy$bitmap;->ic_menu_mylocation:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v1, v2}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 339
    return v4
.end method

.method public onDetach(Lorg/osmdroid/views/MapView;)V
    .registers 2
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 128
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->disableMyLocation()V

    .line 129
    invoke-super {p0, p1}, Lorg/osmdroid/views/overlay/Overlay;->onDetach(Lorg/osmdroid/views/MapView;)V

    .line 130
    return-void
.end method

.method public onLocationChanged(Landroid/location/Location;Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)V
    .registers 8
    .param p1, "location"    # Landroid/location/Location;
    .param p2, "source"    # Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    .prologue
    .line 427
    if-eqz p1, :cond_10

    .line 429
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;

    invoke-direct {v1, p0, p1}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay$1;-><init>(Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;Landroid/location/Location;)V

    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandlerToken:Ljava/lang/Object;

    const-wide/16 v3, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 441
    :cond_10
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pItem"    # Landroid/view/MenuItem;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 352
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sub-int v0, v1, p2

    .line 353
    .local v0, "menuId":I
    sget v1, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->MENU_MY_LOCATION:I

    if-ne v0, v1, :cond_1f

    .line 354
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isMyLocationEnabled()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 355
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->disableFollowLocation()V

    .line 356
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->disableMyLocation()V

    .line 361
    :goto_16
    const/4 v1, 0x1

    .line 363
    :goto_17
    return v1

    .line 358
    :cond_18
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->enableFollowLocation()V

    .line 359
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->enableMyLocation()Z

    goto :goto_16

    .line 363
    :cond_1f
    const/4 v1, 0x0

    goto :goto_17
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 6
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 345
    sget v0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->MENU_MY_LOCATION:I

    add-int/2addr v0, p2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isMyLocationEnabled()Z

    move-result v1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 346
    const/4 v0, 0x0

    return v0
.end method

.method public onSnapToItem(IILandroid/graphics/Point;Lorg/osmdroid/api/IMapView;)Z
    .registers 15
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "snapPoint"    # Landroid/graphics/Point;
    .param p4, "mapView"    # Lorg/osmdroid/api/IMapView;

    .prologue
    const/4 v1, 0x0

    .line 291
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    if-eqz v6, :cond_38

    .line 292
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v6}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    .line 293
    .local v0, "pj":Lorg/osmdroid/views/Projection;
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsProjected:Landroid/graphics/Point;

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    invoke-virtual {v0, v6, v7}, Lorg/osmdroid/views/Projection;->toPixelsFromProjected(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 294
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    iput v6, p3, Landroid/graphics/Point;->x:I

    .line 295
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    iput v6, p3, Landroid/graphics/Point;->y:I

    .line 296
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->x:I

    sub-int v6, p1, v6

    int-to-double v2, v6

    .line 297
    .local v2, "xDiff":D
    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsTranslated:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    sub-int v6, p2, v6

    int-to-double v4, v6

    .line 298
    .local v4, "yDiff":D
    mul-double v6, v2, v2

    mul-double v8, v4, v4

    add-double/2addr v6, v8

    const-wide/high16 v8, 0x4050000000000000L    # 64.0

    cmpg-double v6, v6, v8

    if-gez v6, :cond_38

    const/4 v1, 0x1

    .line 304
    .end local v0    # "pj":Lorg/osmdroid/views/Projection;
    .end local v2    # "xDiff":D
    .end local v4    # "yDiff":D
    :cond_38
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 310
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_a

    .line 311
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->disableFollowLocation()V

    .line 314
    :cond_a
    invoke-super {p0, p1, p2}, Lorg/osmdroid/views/overlay/Overlay;->onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    return v0
.end method

.method public runOnFirstFix(Ljava/lang/Runnable;)Z
    .registers 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 550
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    if-eqz v0, :cond_12

    .line 551
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 552
    const/4 v0, 0x1

    .line 555
    :goto_11
    return v0

    .line 554
    :cond_12
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mRunOnFirstFix:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 555
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public setDrawAccuracyEnabled(Z)V
    .registers 2
    .param p1, "drawAccuracyEnabled"    # Z

    .prologue
    .line 143
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mDrawAccuracyEnabled:Z

    .line 144
    return-void
.end method

.method protected setLocation(Landroid/location/Location;)V
    .registers 13
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    const-wide v9, 0x412e848000000000L    # 1000000.0

    .line 445
    iget-object v2, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    .line 446
    .local v2, "oldLocation":Landroid/location/Location;
    if-eqz v2, :cond_14

    .line 447
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationPreviousRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v5, v2, v6}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->getMyLocationDrawingBounds(ILandroid/location/Location;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 451
    :cond_14
    iput-object p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    .line 454
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-virtual {v6}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    mul-double/2addr v6, v9

    double-to-int v6, v6

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-virtual {v7}, Landroid/location/Location;->getLongitude()D

    move-result-wide v7

    mul-double/2addr v7, v9

    double-to-int v7, v7

    iget-object v8, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapCoordsProjected:Landroid/graphics/Point;

    invoke-virtual {v5, v6, v7, v8}, Lorg/osmdroid/views/Projection;->toProjectedPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 457
    iget-boolean v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mIsFollowing:Z

    if-eqz v5, :cond_57

    .line 458
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mGeoPoint:Lorg/osmdroid/util/GeoPoint;

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-virtual {v6}, Landroid/location/Location;->getLatitude()D

    move-result-wide v6

    mul-double/2addr v6, v9

    double-to-int v6, v6

    invoke-virtual {v5, v6}, Lorg/osmdroid/util/GeoPoint;->setLatitudeE6(I)V

    .line 459
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mGeoPoint:Lorg/osmdroid/util/GeoPoint;

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    invoke-virtual {v6}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    mul-double/2addr v6, v9

    double-to-int v6, v6

    invoke-virtual {v5, v6}, Lorg/osmdroid/util/GeoPoint;->setLongitudeE6(I)V

    .line 460
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapController:Lorg/osmdroid/api/IMapController;

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mGeoPoint:Lorg/osmdroid/util/GeoPoint;

    invoke-interface {v5, v6}, Lorg/osmdroid/api/IMapController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 478
    :goto_56
    return-void

    .line 463
    :cond_57
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mLocation:Landroid/location/Location;

    iget-object v7, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v5, v6, v7}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->getMyLocationDrawingBounds(ILandroid/location/Location;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 466
    if-eqz v2, :cond_6d

    .line 467
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    iget-object v6, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationPreviousRect:Landroid/graphics/Rect;

    invoke-virtual {v5, v6}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 470
    :cond_6d
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    iget v1, v5, Landroid/graphics/Rect;->left:I

    .line 471
    .local v1, "left":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    iget v4, v5, Landroid/graphics/Rect;->top:I

    .line 472
    .local v4, "top":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    iget v3, v5, Landroid/graphics/Rect;->right:I

    .line 473
    .local v3, "right":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationRect:Landroid/graphics/Rect;

    iget v0, v5, Landroid/graphics/Rect;->bottom:I

    .line 476
    .local v0, "bottom":I
    iget-object v5, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    invoke-virtual {v5, v1, v4, v3, v0}, Lorg/osmdroid/views/MapView;->invalidateMapCoordinates(IIII)V

    goto :goto_56
.end method

.method protected setMyLocationProvider(Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;)V
    .registers 4
    .param p1, "myLocationProvider"    # Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    .prologue
    .line 160
    if-nez p1, :cond_a

    .line 161
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "You must pass an IMyLocationProvider to setMyLocationProvider()"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_a
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->isMyLocationEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 165
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->stopLocationProvider()V

    .line 167
    :cond_13
    iput-object p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    .line 168
    return-void
.end method

.method public setOptionsMenuEnabled(Z)V
    .registers 2
    .param p1, "pOptionsMenuEnabled"    # Z

    .prologue
    .line 323
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mOptionsMenuEnabled:Z

    .line 324
    return-void
.end method

.method public setPersonHotspot(FF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 171
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonHotspot:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    .line 172
    return-void
.end method

.method public setPersonIcon(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 566
    iput-object p1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mPersonBitmap:Landroid/graphics/Bitmap;

    .line 567
    return-void
.end method

.method protected stopLocationProvider()V
    .registers 3

    .prologue
    .line 529
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    if-eqz v0, :cond_9

    .line 530
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mMyLocationProvider:Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;

    invoke-interface {v0}, Lorg/osmdroid/views/overlay/mylocation/IMyLocationProvider;->stopLocationProvider()V

    .line 532
    :cond_9
    iget-object v0, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/mylocation/MyLocationNewOverlay;->mHandlerToken:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 533
    return-void
.end method
