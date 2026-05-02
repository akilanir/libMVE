.class public Lorg/osmdroid/views/MapView;
.super Landroid/view/ViewGroup;
.source "MapView.java"

# interfaces
.implements Lorg/osmdroid/api/IMapView;
.implements Lorg/osmdroid/views/util/constants/MapViewConstants;
.implements Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/MapView$1;,
        Lorg/osmdroid/views/MapView$LayoutParams;,
        Lorg/osmdroid/views/MapView$MapViewZoomListener;,
        Lorg/osmdroid/views/MapView$MapViewDoubleClickListener;,
        Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;,
        Lorg/osmdroid/views/MapView$OnFirstLayoutListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/view/ViewGroup;",
        "Lorg/osmdroid/api/IMapView;",
        "Lorg/osmdroid/views/util/constants/MapViewConstants;",
        "Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final ZOOM_LOG_BASE_INV:D

.field private static final ZOOM_SENSITIVITY:D = 1.0

.field private static final logger:Lorg/slf4j/Logger;

.field private static sMotionEventTransformMethod:Ljava/lang/reflect/Method;


# instance fields
.field private final mController:Lorg/osmdroid/views/MapController;

.field private mEnableZoomController:Z

.field private final mGestureDetector:Landroid/view/GestureDetector;

.field private final mInvalidateRect:Landroid/graphics/Rect;

.field protected final mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected mIsFlinging:Z

.field private mLayoutOccurred:Z

.field private final mLayoutPoint:Landroid/graphics/Point;

.field protected mListener:Lorg/osmdroid/events/MapListener;

.field private final mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

.field protected mMaximumZoomLevel:Ljava/lang/Integer;

.field protected mMinimumZoomLevel:Ljava/lang/Integer;

.field private mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/metalev/multitouch/controller/MultiTouchController",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected mMultiTouchScale:F

.field protected mMultiTouchScalePoint:Landroid/graphics/PointF;

.field private final mOnFirstLayoutListeners:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/osmdroid/views/MapView$OnFirstLayoutListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mOverlayManager:Lorg/osmdroid/views/overlay/OverlayManager;

.field private mProjection:Lorg/osmdroid/views/Projection;

.field private final mResourceProxy:Lorg/osmdroid/ResourceProxy;

.field final mRotateScaleMatrix:Landroid/graphics/Matrix;

.field final mRotateScalePoint:Landroid/graphics/Point;

.field protected mScrollableAreaBoundingBox:Lorg/osmdroid/util/BoundingBoxE6;

.field protected mScrollableAreaLimit:Landroid/graphics/Rect;

.field private final mScroller:Landroid/widget/Scroller;

.field protected final mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

.field private final mTileRequestCompleteHandler:Landroid/os/Handler;

.field private mTilesScaledToDpi:Z

.field private final mZoomController:Landroid/widget/ZoomButtonsController;

.field private mZoomLevel:I

.field private mapOrientation:F


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 69
    const-class v0, Lorg/osmdroid/views/MapView;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    .line 72
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    sput-wide v0, Lorg/osmdroid/views/MapView;->ZOOM_LOG_BASE_INV:D

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tileSizePixels"    # I

    .prologue
    .line 188
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v0, p1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, p2, v0}, Lorg/osmdroid/views/MapView;-><init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;)V

    .line 189
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tileSizePixels"    # I
    .param p3, "resourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/osmdroid/views/MapView;-><init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;)V

    .line 194
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tileSizePixels"    # I
    .param p3, "resourceProxy"    # Lorg/osmdroid/ResourceProxy;
    .param p4, "aTileProvider"    # Lorg/osmdroid/tileprovider/MapTileProviderBase;

    .prologue
    .line 198
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapView;-><init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/os/Handler;)V

    .line 199
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/os/Handler;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tileSizePixels"    # I
    .param p3, "resourceProxy"    # Lorg/osmdroid/ResourceProxy;
    .param p4, "aTileProvider"    # Lorg/osmdroid/tileprovider/MapTileProviderBase;
    .param p5, "tileRequestCompleteHandler"    # Landroid/os/Handler;

    .prologue
    .line 204
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/MapView;-><init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/os/Handler;Landroid/util/AttributeSet;)V

    .line 206
    return-void
.end method

.method protected constructor <init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/os/Handler;Landroid/util/AttributeSet;)V
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tileSizePixels"    # I
    .param p3, "resourceProxy"    # Lorg/osmdroid/ResourceProxy;
    .param p4, "tileProvider"    # Lorg/osmdroid/tileprovider/MapTileProviderBase;
    .param p5, "tileRequestCompleteHandler"    # Landroid/os/Handler;
    .param p6, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 145
    invoke-direct {p0, p1, p6}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 80
    iput v2, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    .line 94
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 95
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 103
    iput-boolean v2, p0, Lorg/osmdroid/views/MapView;->mEnableZoomController:Z

    .line 108
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 109
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    .line 114
    const/4 v1, 0x0

    iput v1, p0, Lorg/osmdroid/views/MapView;->mapOrientation:F

    .line 115
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    .line 122
    iput-boolean v2, p0, Lorg/osmdroid/views/MapView;->mTilesScaledToDpi:Z

    .line 124
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mRotateScaleMatrix:Landroid/graphics/Matrix;

    .line 125
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    .line 128
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    .line 131
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mOnFirstLayoutListeners:Ljava/util/LinkedList;

    .line 132
    iput-boolean v2, p0, Lorg/osmdroid/views/MapView;->mLayoutOccurred:Z

    .line 146
    iput-object p3, p0, Lorg/osmdroid/views/MapView;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    .line 147
    new-instance v1, Lorg/osmdroid/views/MapController;

    invoke-direct {v1, p0}, Lorg/osmdroid/views/MapController;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mController:Lorg/osmdroid/views/MapController;

    .line 148
    new-instance v1, Landroid/widget/Scroller;

    invoke-direct {v1, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    .line 150
    if-nez p4, :cond_6f

    .line 151
    invoke-direct {p0, p6}, Lorg/osmdroid/views/MapView;->getTileSourceFromAttributes(Landroid/util/AttributeSet;)Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v0

    .line 152
    .local v0, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_b4

    new-instance p4, Lorg/osmdroid/tileprovider/MapTileProviderArray;

    .end local p4    # "tileProvider":Lorg/osmdroid/tileprovider/MapTileProviderBase;
    new-array v1, v2, [Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-direct {p4, v0, v4, v1}, Lorg/osmdroid/tileprovider/MapTileProviderArray;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/IRegisterReceiver;[Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    .line 157
    .end local v0    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .restart local p4    # "tileProvider":Lorg/osmdroid/tileprovider/MapTileProviderBase;
    :cond_6f
    :goto_6f
    if-nez p5, :cond_76

    new-instance p5, Lorg/osmdroid/tileprovider/util/SimpleInvalidationHandler;

    .end local p5    # "tileRequestCompleteHandler":Landroid/os/Handler;
    invoke-direct {p5, p0}, Lorg/osmdroid/tileprovider/util/SimpleInvalidationHandler;-><init>(Landroid/view/View;)V

    :cond_76
    iput-object p5, p0, Lorg/osmdroid/views/MapView;->mTileRequestCompleteHandler:Landroid/os/Handler;

    .line 160
    iput-object p4, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    .line 161
    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mTileRequestCompleteHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->setTileRequestCompleteHandler(Landroid/os/Handler;)V

    .line 163
    new-instance v1, Lorg/osmdroid/views/overlay/TilesOverlay;

    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    invoke-direct {v1, v2, v3}, Lorg/osmdroid/views/overlay/TilesOverlay;-><init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;Lorg/osmdroid/ResourceProxy;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    .line 164
    new-instance v1, Lorg/osmdroid/views/overlay/OverlayManager;

    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-direct {v1, v2}, Lorg/osmdroid/views/overlay/OverlayManager;-><init>(Lorg/osmdroid/views/overlay/TilesOverlay;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mOverlayManager:Lorg/osmdroid/views/overlay/OverlayManager;

    .line 166
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_ba

    .line 167
    iput-object v4, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    .line 173
    :goto_9d
    new-instance v1, Landroid/view/GestureDetector;

    new-instance v2, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;

    invoke-direct {v2, p0, v4}, Lorg/osmdroid/views/MapView$MapViewGestureDetectorListener;-><init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/views/MapView$1;)V

    invoke-direct {v1, p1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 174
    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v2, Lorg/osmdroid/views/MapView$MapViewDoubleClickListener;

    invoke-direct {v2, p0, v4}, Lorg/osmdroid/views/MapView$MapViewDoubleClickListener;-><init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/views/MapView$1;)V

    invoke-virtual {v1, v2}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    .line 175
    return-void

    .line 152
    .restart local v0    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .restart local p5    # "tileRequestCompleteHandler":Landroid/os/Handler;
    :cond_b4
    new-instance p4, Lorg/osmdroid/tileprovider/MapTileProviderBasic;

    .end local p4    # "tileProvider":Lorg/osmdroid/tileprovider/MapTileProviderBase;
    invoke-direct {p4, p1, v0}, Lorg/osmdroid/tileprovider/MapTileProviderBasic;-><init>(Landroid/content/Context;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    goto :goto_6f

    .line 169
    .end local v0    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .end local p5    # "tileRequestCompleteHandler":Landroid/os/Handler;
    .restart local p4    # "tileProvider":Lorg/osmdroid/tileprovider/MapTileProviderBase;
    :cond_ba
    new-instance v1, Landroid/widget/ZoomButtonsController;

    invoke-direct {v1, p0}, Landroid/widget/ZoomButtonsController;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    .line 170
    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    new-instance v2, Lorg/osmdroid/views/MapView$MapViewZoomListener;

    invoke-direct {v2, p0, v4}, Lorg/osmdroid/views/MapView$MapViewZoomListener;-><init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/views/MapView$1;)V

    invoke-virtual {v1, v2}, Landroid/widget/ZoomButtonsController;->setOnZoomListener(Landroid/widget/ZoomButtonsController$OnZoomListener;)V

    goto :goto_9d
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 181
    const/16 v2, 0x100

    new-instance v3, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v3, p1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    move-object v0, p0

    move-object v1, p1

    move-object v5, v4

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/MapView;-><init>(Landroid/content/Context;ILorg/osmdroid/ResourceProxy;Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/os/Handler;Landroid/util/AttributeSet;)V

    .line 182
    return-void
.end method

.method static synthetic access$300(Lorg/osmdroid/views/MapView;)Landroid/widget/Scroller;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    return-object v0
.end method

.method static synthetic access$400(Lorg/osmdroid/views/MapView;)Z
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 62
    iget-boolean v0, p0, Lorg/osmdroid/views/MapView;->mEnableZoomController:Z

    return v0
.end method

.method static synthetic access$500(Lorg/osmdroid/views/MapView;)Landroid/widget/ZoomButtonsController;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    return-object v0
.end method

.method static synthetic access$600(Lorg/osmdroid/views/MapView;)Lorg/metalev/multitouch/controller/MultiTouchController;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;

    return-object v0
.end method

.method private checkZoomButtons()V
    .registers 3

    .prologue
    .line 1100
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ZoomButtonsController;->setZoomInEnabled(Z)V

    .line 1101
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ZoomButtonsController;->setZoomOutEnabled(Z)V

    .line 1102
    return-void
.end method

.method private getTileSourceFromAttributes(Landroid/util/AttributeSet;)Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .registers 11
    .param p1, "aAttributeSet"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v8, 0x0

    .line 1115
    sget-object v3, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->DEFAULT_TILE_SOURCE:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 1117
    .local v3, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-eqz p1, :cond_2a

    .line 1118
    const-string v5, "tilesource"

    invoke-interface {p1, v8, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1119
    .local v4, "tileSourceAttr":Ljava/lang/String;
    if-eqz v4, :cond_2a

    .line 1121
    :try_start_d
    invoke-static {v4}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSource(Ljava/lang/String;)Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v1

    .line 1122
    .local v1, "r":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    sget-object v5, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using tile source specified in layout attributes: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_29} :catch_58

    .line 1123
    move-object v3, v1

    .line 1130
    .end local v1    # "r":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .end local v4    # "tileSourceAttr":Ljava/lang/String;
    :cond_2a
    :goto_2a
    if-eqz p1, :cond_3f

    instance-of v5, v3, Lorg/osmdroid/tileprovider/tilesource/IStyledTileSource;

    if-eqz v5, :cond_3f

    .line 1131
    const-string v5, "style"

    invoke-interface {p1, v8, v5}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1132
    .local v2, "style":Ljava/lang/String;
    if-nez v2, :cond_72

    .line 1133
    sget-object v5, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    const-string v6, "Using default style: 1"

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 1140
    .end local v2    # "style":Ljava/lang/String;
    :cond_3f
    :goto_3f
    sget-object v5, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using tile source: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 1141
    return-object v3

    .line 1124
    .restart local v4    # "tileSourceAttr":Ljava/lang/String;
    :catch_58
    move-exception v0

    .line 1125
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v5, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid tile source specified in layout attributes: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_2a

    .line 1135
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v4    # "tileSourceAttr":Ljava/lang/String;
    .restart local v2    # "style":Ljava/lang/String;
    :cond_72
    sget-object v5, Lorg/osmdroid/views/MapView;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Using style specified in layout attributes: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    move-object v5, v3

    .line 1136
    check-cast v5, Lorg/osmdroid/tileprovider/tilesource/IStyledTileSource;

    invoke-interface {v5, v2}, Lorg/osmdroid/tileprovider/tilesource/IStyledTileSource;->setStyle(Ljava/lang/String;)V

    goto :goto_3f
.end method

.method private invalidateMapCoordinates(IIIIZ)V
    .registers 12
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I
    .param p5, "post"    # Z

    .prologue
    .line 605
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 606
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v3

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 608
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v2

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int v0, v2, v3

    .line 609
    .local v0, "centerX":I
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v2

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int v1, v2, v3

    .line 611
    .local v1, "centerY":I
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_41

    .line 612
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v3

    const/high16 v4, 0x43340000    # 180.0f

    add-float/2addr v3, v4

    iget-object v4, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    invoke-static {v2, v0, v1, v3, v4}, Lorg/osmdroid/util/GeometryMath;->getBoundingBoxForRotatatedRectangle(Landroid/graphics/Rect;IIFLandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 615
    :cond_41
    if-eqz p5, :cond_57

    .line 616
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    iget-object v4, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    iget-object v5, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    invoke-super {p0, v2, v3, v4, v5}, Landroid/view/ViewGroup;->postInvalidate(IIII)V

    .line 620
    :goto_56
    return-void

    .line 619
    :cond_57
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mInvalidateRect:Landroid/graphics/Rect;

    invoke-super {p0, v2}, Landroid/view/ViewGroup;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_56
.end method

.method private rotateTouchEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    .registers 9
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 840
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_a

    .line 869
    .end local p1    # "ev":Landroid/view/MotionEvent;
    :goto_9
    return-object p1

    .line 843
    .restart local p1    # "ev":Landroid/view/MotionEvent;
    :cond_a
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    .line 844
    .local v1, "rotatedEvent":Landroid/view/MotionEvent;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_36

    .line 845
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    iget-object v5, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    invoke-virtual {v2, v3, v4, v5}, Lorg/osmdroid/views/Projection;->unrotateAndScalePoint(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 847
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/view/MotionEvent;->setLocation(FF)V

    :goto_34
    move-object p1, v1

    .line 869
    goto :goto_9

    .line 851
    :cond_36
    :try_start_36
    sget-object v2, Lorg/osmdroid/views/MapView;->sMotionEventTransformMethod:Ljava/lang/reflect/Method;

    if-nez v2, :cond_4c

    .line 852
    const-class v2, Landroid/view/MotionEvent;

    const-string v3, "transform"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/graphics/Matrix;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Lorg/osmdroid/views/MapView;->sMotionEventTransformMethod:Ljava/lang/reflect/Method;

    .line 855
    :cond_4c
    sget-object v2, Lorg/osmdroid/views/MapView;->sMotionEventTransformMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v5

    invoke-virtual {v5}, Lorg/osmdroid/views/Projection;->getInvertedScaleRotateCanvasMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5f
    .catch Ljava/lang/SecurityException; {:try_start_36 .. :try_end_5f} :catch_60
    .catch Ljava/lang/NoSuchMethodException; {:try_start_36 .. :try_end_5f} :catch_65
    .catch Ljava/lang/IllegalArgumentException; {:try_start_36 .. :try_end_5f} :catch_6a
    .catch Ljava/lang/IllegalAccessException; {:try_start_36 .. :try_end_5f} :catch_6f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_36 .. :try_end_5f} :catch_74

    goto :goto_34

    .line 857
    :catch_60
    move-exception v0

    .line 858
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_34

    .line 859
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_65
    move-exception v0

    .line 860
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_34

    .line 861
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_6a
    move-exception v0

    .line 862
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_34

    .line 863
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_6f
    move-exception v0

    .line 864
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_34

    .line 865
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_74
    move-exception v0

    .line 866
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_34
.end method

.method private updateTileSizeForDensity(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 4
    .param p1, "aTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 310
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isTilesScaledToDpi()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 311
    .local v0, "density":F
    :goto_10
    invoke-interface {p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileSizePixels()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    float-to-int v1, v1

    invoke-static {v1}, Lmicrosoft/mappoint/TileSystem;->setTileSize(I)V

    .line 312
    return-void

    .line 310
    .end local v0    # "density":F
    :cond_1b
    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_10
.end method


# virtual methods
.method public addOnFirstLayoutListener(Lorg/osmdroid/views/MapView$OnFirstLayoutListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/osmdroid/views/MapView$OnFirstLayoutListener;

    .prologue
    .line 737
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v0

    if-nez v0, :cond_b

    .line 738
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mOnFirstLayoutListeners:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 739
    :cond_b
    return-void
.end method

.method public canZoomIn()Z
    .registers 3

    .prologue
    .line 468
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v0

    .line 469
    .local v0, "maxZoomLevel":I
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    :goto_10
    if-lt v1, v0, :cond_17

    .line 470
    const/4 v1, 0x0

    .line 472
    :goto_13
    return v1

    .line 469
    :cond_14
    iget v1, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    goto :goto_10

    .line 472
    :cond_17
    const/4 v1, 0x1

    goto :goto_13
.end method

.method public canZoomOut()Z
    .registers 3

    .prologue
    .line 476
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMinZoomLevel()I

    move-result v0

    .line 477
    .local v0, "minZoomLevel":I
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v1

    if-eqz v1, :cond_14

    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    :goto_10
    if-gt v1, v0, :cond_17

    .line 478
    const/4 v1, 0x0

    .line 480
    :goto_13
    return v1

    .line 477
    :cond_14
    iget v1, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    goto :goto_10

    .line 480
    :cond_17
    const/4 v1, 0x1

    goto :goto_13
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 642
    instance-of v0, p1, Lorg/osmdroid/views/MapView$LayoutParams;

    return v0
.end method

.method public computeScroll()V
    .registers 3

    .prologue
    .line 874
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 875
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 877
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    .line 879
    iget v0, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    .line 880
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 885
    :goto_27
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 887
    :cond_2a
    return-void

    .line 882
    :cond_2b
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iget-object v1, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    goto :goto_27
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    .line 961
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 964
    .local v0, "startMs":J
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 966
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mRotateScaleMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 969
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getScrollY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 972
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mRotateScaleMatrix:Landroid/graphics/Matrix;

    iget v3, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    iget v4, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    iget-object v5, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    iget v5, v5, Landroid/graphics/PointF;->x:F

    iget-object v6, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    iget v6, v6, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    .line 976
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mRotateScaleMatrix:Landroid/graphics/Matrix;

    iget v3, p0, Lorg/osmdroid/views/MapView;->mapOrientation:F

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    .line 979
    iget-object v2, p0, Lorg/osmdroid/views/MapView;->mRotateScaleMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 982
    new-instance v2, Lorg/osmdroid/views/Projection;

    invoke-direct {v2, p0}, Lorg/osmdroid/views/Projection;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v2, p0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    .line 988
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v2

    invoke-virtual {v2, p1, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onDraw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;)V

    .line 991
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 993
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 999
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 787
    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    invoke-virtual {v3}, Landroid/widget/ZoomButtonsController;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_12

    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    invoke-virtual {v3, p0, p1}, Landroid/widget/ZoomButtonsController;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 831
    :cond_11
    :goto_11
    return v2

    .line 792
    :cond_12
    invoke-direct {p0, p1}, Lorg/osmdroid/views/MapView;->rotateTouchEvent(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    .line 795
    .local v1, "rotatedEvent":Landroid/view/MotionEvent;
    :try_start_16
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_58

    move-result v3

    if-eqz v3, :cond_22

    .line 824
    if-eq v1, p1, :cond_11

    .line 825
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_11

    .line 802
    :cond_22
    :try_start_22
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v3

    invoke-virtual {v3, v1, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onTouchEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z
    :try_end_29
    .catchall {:try_start_22 .. :try_end_29} :catchall_58

    move-result v3

    if-eqz v3, :cond_32

    .line 824
    if-eq v1, p1, :cond_11

    .line 825
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_11

    .line 806
    :cond_32
    const/4 v0, 0x0

    .line 807
    .local v0, "handled":Z
    :try_start_33
    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;

    if-eqz v3, :cond_40

    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;

    invoke-virtual {v3, p1}, Lorg/metalev/multitouch/controller/MultiTouchController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-eqz v3, :cond_40

    .line 811
    const/4 v0, 0x1

    .line 814
    :cond_40
    iget-object v3, p0, Lorg/osmdroid/views/MapView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_45
    .catchall {:try_start_33 .. :try_end_45} :catchall_58

    move-result v3

    if-eqz v3, :cond_49

    .line 818
    const/4 v0, 0x1

    .line 821
    :cond_49
    if-eqz v0, :cond_51

    .line 824
    if-eq v1, p1, :cond_11

    .line 825
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_11

    .line 824
    :cond_51
    if-eq v1, p1, :cond_56

    .line 825
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 831
    :cond_56
    const/4 v2, 0x0

    goto :goto_11

    .line 824
    .end local v0    # "handled":Z
    :catchall_58
    move-exception v2

    if-eq v1, p1, :cond_5e

    .line 825
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_5e
    throw v2
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 8

    .prologue
    const/4 v5, 0x0

    const/4 v1, -0x2

    .line 630
    new-instance v0, Lorg/osmdroid/views/MapView$LayoutParams;

    const/4 v3, 0x0

    const/16 v4, 0x8

    move v2, v1

    move v6, v5

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/MapView$LayoutParams;-><init>(IILorg/osmdroid/api/IGeoPoint;III)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 636
    new-instance v0, Lorg/osmdroid/views/MapView$LayoutParams;

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/osmdroid/views/MapView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 647
    new-instance v0, Lorg/osmdroid/views/MapView$LayoutParams;

    invoke-direct {v0, p1}, Lorg/osmdroid/views/MapView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;
    .registers 2

    .prologue
    .line 252
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    invoke-virtual {v0}, Lorg/osmdroid/views/Projection;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    return-object v0
.end method

.method public getController()Lorg/osmdroid/api/IMapController;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mController:Lorg/osmdroid/views/MapController;

    return-object v0
.end method

.method public getDraggableObjectAtPoint(Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)Ljava/lang/Object;
    .registers 4
    .param p1, "pt"    # Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .prologue
    .line 1028
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1031
    const/4 p0, 0x0

    .line 1035
    .end local p0    # "this":Lorg/osmdroid/views/MapView;
    :goto_7
    return-object p0

    .line 1033
    .restart local p0    # "this":Lorg/osmdroid/views/MapView;
    :cond_8
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    invoke-virtual {p1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getX()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->x:F

    .line 1034
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    invoke-virtual {p1}, Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;->getY()F

    move-result v1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    goto :goto_7
.end method

.method public getIntrinsicScreenRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 6
    .param p1, "reuse"    # Landroid/graphics/Rect;

    .prologue
    const/4 v3, 0x0

    .line 268
    if-nez p1, :cond_14

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 269
    .local v0, "out":Landroid/graphics/Rect;
    :goto_8
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 270
    return-object v0

    .end local v0    # "out":Landroid/graphics/Rect;
    :cond_14
    move-object v0, p1

    .line 268
    goto :goto_8
.end method

.method public getLatitudeSpan()I
    .registers 2

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v0

    return v0
.end method

.method public getLongitudeSpan()I
    .registers 2

    .prologue
    .line 248
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v0

    return v0
.end method

.method public getMapCenter()Lorg/osmdroid/api/IGeoPoint;
    .registers 5

    .prologue
    .line 522
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v0

    return-object v0
.end method

.method public getMapOrientation()F
    .registers 2

    .prologue
    .line 537
    iget v0, p0, Lorg/osmdroid/views/MapView;->mapOrientation:F

    return v0
.end method

.method public getMaxZoomLevel()I
    .registers 2

    .prologue
    .line 448
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMaximumZoomLevel:Ljava/lang/Integer;

    if-nez v0, :cond_b

    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/TilesOverlay;->getMaximumZoomLevel()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMaximumZoomLevel:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_a
.end method

.method public getMinZoomLevel()I
    .registers 2

    .prologue
    .line 440
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMinimumZoomLevel:Ljava/lang/Integer;

    if-nez v0, :cond_b

    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/TilesOverlay;->getMinimumZoomLevel()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMinimumZoomLevel:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_a
.end method

.method public getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mOverlayManager:Lorg/osmdroid/views/overlay/OverlayManager;

    return-object v0
.end method

.method public getOverlays()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/osmdroid/views/overlay/Overlay;",
            ">;"
        }
    .end annotation

    .prologue
    .line 222
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    return-object v0
.end method

.method public getPositionAndScale(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;)V
    .registers 13
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "objPosAndScaleOut"    # Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 1041
    const/4 v3, 0x1

    iget v4, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    move-object v0, p2

    move v2, v1

    move v6, v1

    move v7, v1

    move v8, v5

    move v9, v1

    invoke-virtual/range {v0 .. v9}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->set(FFZFZFFZF)V

    .line 1042
    return-void
.end method

.method public bridge synthetic getProjection()Lorg/osmdroid/api/IProjection;
    .registers 2

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v0

    return-object v0
.end method

.method public getProjection()Lorg/osmdroid/views/Projection;
    .registers 2

    .prologue
    .line 283
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    if-nez v0, :cond_b

    .line 284
    new-instance v0, Lorg/osmdroid/views/Projection;

    invoke-direct {v0, p0}, Lorg/osmdroid/views/Projection;-><init>(Lorg/osmdroid/views/MapView;)V

    iput-object v0, p0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    .line 286
    :cond_b
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    return-object v0
.end method

.method public getResourceProxy()Lorg/osmdroid/ResourceProxy;
    .registers 2

    .prologue
    .line 526
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    return-object v0
.end method

.method public getScreenRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 6
    .param p1, "reuse"    # Landroid/graphics/Rect;

    .prologue
    .line 259
    invoke-virtual {p0, p1}, Lorg/osmdroid/views/MapView;->getIntrinsicScreenRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v0

    .line 260
    .local v0, "out":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_26

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v1

    const/high16 v2, 0x43340000    # 180.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_26

    .line 261
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v3

    invoke-static {v0, v1, v2, v3, v0}, Lorg/osmdroid/util/GeometryMath;->getBoundingBoxForRotatatedRectangle(Landroid/graphics/Rect;IIFLandroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 264
    :cond_26
    return-object v0
.end method

.method public getScrollableAreaLimit()Lorg/osmdroid/util/BoundingBoxE6;
    .registers 2

    .prologue
    .line 589
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScrollableAreaBoundingBox:Lorg/osmdroid/util/BoundingBoxE6;

    return-object v0
.end method

.method public getScroller()Landroid/widget/Scroller;
    .registers 2

    .prologue
    .line 234
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    return-object v0
.end method

.method public getTileProvider()Lorg/osmdroid/tileprovider/MapTileProviderBase;
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    return-object v0
.end method

.method public getTileRequestCompleteHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 238
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mTileRequestCompleteHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getZoomLevel()I
    .registers 2

    .prologue
    .line 417
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v0

    return v0
.end method

.method public getZoomLevel(Z)I
    .registers 3
    .param p1, "aPending"    # Z

    .prologue
    .line 429
    if-eqz p1, :cond_f

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 430
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mTargetZoomLevel:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 432
    :goto_e
    return v0

    :cond_f
    iget v0, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    goto :goto_e
.end method

.method public invalidateMapCoordinates(IIII)V
    .registers 11
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 597
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapView;->invalidateMapCoordinates(IIIIZ)V

    .line 598
    return-void
.end method

.method public invalidateMapCoordinates(Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "dirty"    # Landroid/graphics/Rect;

    .prologue
    .line 593
    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->bottom:I

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapView;->invalidateMapCoordinates(IIIIZ)V

    .line 594
    return-void
.end method

.method public isAnimating()Z
    .registers 2

    .prologue
    .line 1019
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mIsAnimating:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public isLayoutOccurred()Z
    .registers 2

    .prologue
    .line 746
    iget-boolean v0, p0, Lorg/osmdroid/views/MapView;->mLayoutOccurred:Z

    return v0
.end method

.method public isTilesScaledToDpi()Z
    .registers 2

    .prologue
    .line 301
    iget-boolean v0, p0, Lorg/osmdroid/views/MapView;->mTilesScaledToDpi:Z

    return v0
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 750
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onDetach(Lorg/osmdroid/views/MapView;)V

    .line 751
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->detach()V

    .line 752
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 1003
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mZoomController:Landroid/widget/ZoomButtonsController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ZoomButtonsController;->setVisible(Z)V

    .line 1004
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->onDetach()V

    .line 1005
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 1006
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 756
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onKeyDown(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    .line 758
    .local v0, "result":Z
    if-nez v0, :cond_10

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_12

    :cond_10
    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 763
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onKeyUp(ILandroid/view/KeyEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    .line 765
    .local v0, "result":Z
    if-nez v0, :cond_10

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_12

    :cond_10
    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method protected onLayout(ZIIII)V
    .registers 25
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 661
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getChildCount()I

    move-result v12

    .line 663
    .local v12, "count":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_5
    if-ge v13, v12, :cond_13f

    .line 664
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/osmdroid/views/MapView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 665
    .local v7, "child":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_9f

    .line 667
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Lorg/osmdroid/views/MapView$LayoutParams;

    .line 668
    .local v15, "lp":Lorg/osmdroid/views/MapView$LayoutParams;
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    .line 669
    .local v8, "childHeight":I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v11

    .line 670
    .local v11, "childWidth":I
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    iget-object v3, v15, Lorg/osmdroid/views/MapView$LayoutParams;->geoPoint:Lorg/osmdroid/api/IGeoPoint;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    invoke-virtual {v2, v3, v4}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 672
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_62

    .line 673
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lorg/osmdroid/views/Projection;->rotateAndScalePoint(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v16

    .line 675
    .local v16, "p":Landroid/graphics/Point;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->x:I

    iput v3, v2, Landroid/graphics/Point;->x:I

    .line 676
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    move-object/from16 v0, v16

    iget v3, v0, Landroid/graphics/Point;->y:I

    iput v3, v2, Landroid/graphics/Point;->y:I

    .line 678
    .end local v16    # "p":Landroid/graphics/Point;
    :cond_62
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    invoke-virtual {v2, v3, v4, v5}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 679
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v0, v2, Landroid/graphics/Point;->x:I

    move/from16 v17, v0

    .line 680
    .local v17, "x":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mLayoutPoint:Landroid/graphics/Point;

    iget v0, v2, Landroid/graphics/Point;->y:I

    move/from16 v18, v0

    .line 681
    .local v18, "y":I
    move/from16 v9, v17

    .line 682
    .local v9, "childLeft":I
    move/from16 v10, v18

    .line 683
    .local v10, "childTop":I
    iget v2, v15, Lorg/osmdroid/views/MapView$LayoutParams;->alignment:I

    packed-switch v2, :pswitch_data_17a

    .line 721
    :goto_92
    iget v2, v15, Lorg/osmdroid/views/MapView$LayoutParams;->offsetX:I

    add-int/2addr v9, v2

    .line 722
    iget v2, v15, Lorg/osmdroid/views/MapView$LayoutParams;->offsetY:I

    add-int/2addr v10, v2

    .line 723
    add-int v2, v9, v11

    add-int v3, v10, v8

    invoke-virtual {v7, v9, v10, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 663
    .end local v8    # "childHeight":I
    .end local v9    # "childLeft":I
    .end local v10    # "childTop":I
    .end local v11    # "childWidth":I
    .end local v15    # "lp":Lorg/osmdroid/views/MapView$LayoutParams;
    .end local v17    # "x":I
    .end local v18    # "y":I
    :cond_9f
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_5

    .line 685
    .restart local v8    # "childHeight":I
    .restart local v9    # "childLeft":I
    .restart local v10    # "childTop":I
    .restart local v11    # "childWidth":I
    .restart local v15    # "lp":Lorg/osmdroid/views/MapView$LayoutParams;
    .restart local v17    # "x":I
    .restart local v18    # "y":I
    :pswitch_a3
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v9, v2, v17

    .line 686
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v10, v2, v18

    .line 687
    goto :goto_92

    .line 689
    :pswitch_b0
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    div-int/lit8 v3, v11, 0x2

    sub-int v9, v2, v3

    .line 690
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v10, v2, v18

    .line 691
    goto :goto_92

    .line 693
    :pswitch_c1
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    sub-int v9, v2, v11

    .line 694
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v10, v2, v18

    .line 695
    goto :goto_92

    .line 697
    :pswitch_d0
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v9, v2, v17

    .line 698
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    div-int/lit8 v3, v8, 0x2

    sub-int v10, v2, v3

    .line 699
    goto :goto_92

    .line 701
    :pswitch_e1
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    div-int/lit8 v3, v11, 0x2

    sub-int v9, v2, v3

    .line 702
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    div-int/lit8 v3, v8, 0x2

    sub-int v10, v2, v3

    .line 703
    goto :goto_92

    .line 705
    :pswitch_f6
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    sub-int v9, v2, v11

    .line 706
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    div-int/lit8 v3, v8, 0x2

    sub-int v10, v2, v3

    .line 707
    goto :goto_92

    .line 709
    :pswitch_109
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v9, v2, v17

    .line 710
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    sub-int v10, v2, v8

    .line 711
    goto/16 :goto_92

    .line 713
    :pswitch_119
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    div-int/lit8 v3, v11, 0x2

    sub-int v9, v2, v3

    .line 714
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    sub-int v10, v2, v8

    .line 715
    goto/16 :goto_92

    .line 717
    :pswitch_12d
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingLeft()I

    move-result v2

    add-int v2, v2, v17

    sub-int v9, v2, v11

    .line 718
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getPaddingTop()I

    move-result v2

    add-int v2, v2, v18

    sub-int v10, v2, v8

    goto/16 :goto_92

    .line 726
    .end local v7    # "child":Landroid/view/View;
    .end local v8    # "childHeight":I
    .end local v9    # "childLeft":I
    .end local v10    # "childTop":I
    .end local v11    # "childWidth":I
    .end local v15    # "lp":Lorg/osmdroid/views/MapView$LayoutParams;
    .end local v17    # "x":I
    .end local v18    # "y":I
    :cond_13f
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v2

    if-nez v2, :cond_173

    .line 727
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lorg/osmdroid/views/MapView;->mLayoutOccurred:Z

    .line 728
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mOnFirstLayoutListeners:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_152
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/views/MapView$OnFirstLayoutListener;

    .local v1, "listener":Lorg/osmdroid/views/MapView$OnFirstLayoutListener;
    move-object/from16 v2, p0

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    .line 729
    invoke-interface/range {v1 .. v6}, Lorg/osmdroid/views/MapView$OnFirstLayoutListener;->onFirstLayout(Landroid/view/View;IIII)V

    goto :goto_152

    .line 730
    .end local v1    # "listener":Lorg/osmdroid/views/MapView$OnFirstLayoutListener;
    :cond_16c
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/views/MapView;->mOnFirstLayoutListeners:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 732
    .end local v14    # "i$":Ljava/util/Iterator;
    :cond_173
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    .line 733
    return-void

    .line 683
    nop

    :pswitch_data_17a
    .packed-switch 0x1
        :pswitch_a3
        :pswitch_b0
        :pswitch_c1
        :pswitch_d0
        :pswitch_e1
        :pswitch_f6
        :pswitch_109
        :pswitch_119
        :pswitch_12d
    .end packed-switch
.end method

.method protected onMeasure(II)V
    .registers 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 653
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/views/MapView;->measureChildren(II)V

    .line 655
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    .line 656
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 836
    const/4 v0, 0x0

    return v0
.end method

.method public onTrackballEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/high16 v2, 0x41c80000    # 25.0f

    .line 771
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v0

    invoke-virtual {v0, p1, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onTrackballEvent(Landroid/view/MotionEvent;Lorg/osmdroid/views/MapView;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 772
    const/4 v0, 0x1

    .line 777
    :goto_d
    return v0

    .line 775
    :cond_e
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    mul-float/2addr v0, v2

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/MapView;->scrollBy(II)V

    .line 777
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_d
.end method

.method public postInvalidateMapCoordinates(IIII)V
    .registers 11
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 601
    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/views/MapView;->invalidateMapCoordinates(IIIIZ)V

    .line 602
    return-void
.end method

.method public removeOnFirstLayoutListener(Lorg/osmdroid/views/MapView$OnFirstLayoutListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/osmdroid/views/MapView$OnFirstLayoutListener;

    .prologue
    .line 742
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mOnFirstLayoutListeners:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 743
    return-void
.end method

.method public scrollTo(II)V
    .registers 23
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 891
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v3

    invoke-static {v3}, Lmicrosoft/mappoint/TileSystem;->MapSize(I)I

    move-result v18

    .line 892
    .local v18, "worldSize":I
    :goto_b
    if-gez p1, :cond_10

    .line 893
    add-int p1, p1, v18

    goto :goto_b

    .line 895
    :cond_10
    :goto_10
    move/from16 v0, p1

    move/from16 v1, v18

    if-lt v0, v1, :cond_19

    .line 896
    sub-int p1, p1, v18

    goto :goto_10

    .line 898
    :cond_19
    :goto_19
    if-gez p2, :cond_1e

    .line 899
    add-int p2, p2, v18

    goto :goto_19

    .line 901
    :cond_1e
    :goto_1e
    move/from16 v0, p2

    move/from16 v1, v18

    if-lt v0, v1, :cond_27

    .line 902
    sub-int p2, p2, v18

    goto :goto_1e

    .line 905
    :cond_27
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    if-eqz v3, :cond_7a

    .line 906
    invoke-static {}, Lmicrosoft/mappoint/TileSystem;->getMaximumZoomLevel()I

    move-result v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/osmdroid/views/MapView;->getZoomLevel(Z)I

    move-result v4

    sub-int v19, v3, v4

    .line 908
    .local v19, "zoomDiff":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    shr-int v13, v3, v19

    .line 909
    .local v13, "minX":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    shr-int v14, v3, v19

    .line 910
    .local v14, "minY":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    shr-int v11, v3, v19

    .line 911
    .local v11, "maxX":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    shr-int v12, v3, v19

    .line 913
    .local v12, "maxY":I
    sub-int v16, v11, v13

    .line 914
    .local v16, "scrollableWidth":I
    sub-int v15, v12, v14

    .line 915
    .local v15, "scrollableHeight":I
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v17

    .line 916
    .local v17, "width":I
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v10

    .line 919
    .local v10, "height":I
    move/from16 v0, v16

    move/from16 v1, v17

    if-gt v0, v1, :cond_c1

    .line 920
    move/from16 v0, p1

    if-le v0, v13, :cond_ba

    .line 921
    move/from16 p1, v13

    .line 929
    :cond_72
    :goto_72
    if-gt v15, v10, :cond_d6

    .line 930
    move/from16 v0, p2

    if-le v0, v14, :cond_cf

    .line 931
    move/from16 p2, v14

    .line 939
    .end local v10    # "height":I
    .end local v11    # "maxX":I
    .end local v12    # "maxY":I
    .end local v13    # "minX":I
    .end local v14    # "minY":I
    .end local v15    # "scrollableHeight":I
    .end local v16    # "scrollableWidth":I
    .end local v17    # "width":I
    .end local v19    # "zoomDiff":I
    :cond_7a
    :goto_7a
    invoke-super/range {p0 .. p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 940
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    .line 943
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_a1

    .line 944
    const/4 v4, 0x1

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getLeft()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getTop()I

    move-result v6

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getRight()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/MapView;->getBottom()I

    move-result v8

    move-object/from16 v3, p0

    invoke-virtual/range {v3 .. v8}, Lorg/osmdroid/views/MapView;->onLayout(ZIIII)V

    .line 947
    :cond_a1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v3, :cond_b9

    .line 948
    new-instance v9, Lorg/osmdroid/events/ScrollEvent;

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-direct {v9, v0, v1, v2}, Lorg/osmdroid/events/ScrollEvent;-><init>(Lorg/osmdroid/views/MapView;II)V

    .line 949
    .local v9, "event":Lorg/osmdroid/events/ScrollEvent;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    invoke-interface {v3, v9}, Lorg/osmdroid/events/MapListener;->onScroll(Lorg/osmdroid/events/ScrollEvent;)Z

    .line 951
    .end local v9    # "event":Lorg/osmdroid/events/ScrollEvent;
    :cond_b9
    return-void

    .line 922
    .restart local v10    # "height":I
    .restart local v11    # "maxX":I
    .restart local v12    # "maxY":I
    .restart local v13    # "minX":I
    .restart local v14    # "minY":I
    .restart local v15    # "scrollableHeight":I
    .restart local v16    # "scrollableWidth":I
    .restart local v17    # "width":I
    .restart local v19    # "zoomDiff":I
    :cond_ba
    add-int v3, p1, v17

    if-ge v3, v11, :cond_72

    .line 923
    sub-int p1, v11, v17

    goto :goto_72

    .line 924
    :cond_c1
    move/from16 v0, p1

    if-ge v0, v13, :cond_c8

    .line 925
    move/from16 p1, v13

    goto :goto_72

    .line 926
    :cond_c8
    add-int v3, p1, v17

    if-le v3, v11, :cond_72

    .line 927
    sub-int p1, v11, v17

    goto :goto_72

    .line 932
    :cond_cf
    add-int v3, p2, v10

    if-ge v3, v12, :cond_7a

    .line 933
    sub-int p2, v12, v10

    goto :goto_7a

    .line 934
    :cond_d6
    add-int/lit8 v3, p2, 0x0

    if-ge v3, v14, :cond_dd

    .line 935
    add-int/lit8 p2, v14, 0x0

    goto :goto_7a

    .line 936
    :cond_dd
    add-int v3, p2, v10

    if-le v3, v12, :cond_7a

    .line 937
    sub-int p2, v12, v10

    goto :goto_7a
.end method

.method public selectObject(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)V
    .registers 12
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "pt"    # Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .prologue
    const/high16 v8, 0x3f800000    # 1.0f

    .line 1048
    if-nez p1, :cond_60

    iget v4, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    cmpl-float v4, v4, v8

    if-eqz v4, :cond_60

    .line 1049
    iget v4, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    sget-wide v6, Lorg/osmdroid/views/MapView;->ZOOM_LOG_BASE_INV:D

    mul-double/2addr v4, v6

    double-to-float v1, v4

    .line 1050
    .local v1, "scaleDiffFloat":F
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 1053
    .local v2, "scaleDiffInt":I
    if-eqz v2, :cond_5a

    .line 1054
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v4

    invoke-virtual {v4}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v3

    .line 1055
    .local v3, "screenRect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v4

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    iget-object v7, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    invoke-virtual {v4, v5, v6, v7}, Lorg/osmdroid/views/Projection;->unrotateAndScalePoint(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 1057
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v4

    iget-object v5, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->x:I

    iget-object v6, p0, Lorg/osmdroid/views/MapView;->mRotateScalePoint:Landroid/graphics/Point;

    iget v6, v6, Landroid/graphics/Point;->y:I

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 1059
    .local v0, "p":Landroid/graphics/Point;
    iget v4, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int/2addr v4, v5

    iget v5, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    sub-int/2addr v5, v6

    invoke-virtual {p0, v4, v5}, Lorg/osmdroid/views/MapView;->scrollTo(II)V

    .line 1063
    .end local v0    # "p":Landroid/graphics/Point;
    .end local v3    # "screenRect":Landroid/graphics/Rect;
    :cond_5a
    iget v4, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    add-int/2addr v4, v2

    invoke-virtual {p0, v4}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    .line 1067
    .end local v1    # "scaleDiffFloat":F
    .end local v2    # "scaleDiffInt":I
    :cond_60
    iput v8, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 1068
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "pColor"    # I

    .prologue
    .line 955
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/TilesOverlay;->setLoadingBackgroundColor(I)V

    .line 956
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 957
    return-void
.end method

.method public setBuiltInZoomControls(Z)V
    .registers 2
    .param p1, "on"    # Z

    .prologue
    .line 1105
    iput-boolean p1, p0, Lorg/osmdroid/views/MapView;->mEnableZoomController:Z

    .line 1106
    invoke-direct {p0}, Lorg/osmdroid/views/MapView;->checkZoomButtons()V

    .line 1107
    return-void
.end method

.method setMapCenter(II)V
    .registers 4
    .param p1, "aLatitudeE6"    # I
    .param p2, "aLongitudeE6"    # I

    .prologue
    .line 297
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v0, p1, p2}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapView;->setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 298
    return-void
.end method

.method setMapCenter(Lorg/osmdroid/api/IGeoPoint;)V
    .registers 3
    .param p1, "aCenter"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 290
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/osmdroid/api/IMapController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 291
    return-void
.end method

.method public setMapListener(Lorg/osmdroid/events/MapListener;)V
    .registers 2
    .param p1, "ml"    # Lorg/osmdroid/events/MapListener;

    .prologue
    .line 1092
    iput-object p1, p0, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    .line 1093
    return-void
.end method

.method public setMapOrientation(F)V
    .registers 3
    .param p1, "degrees"    # F

    .prologue
    .line 530
    const/high16 v0, 0x43b40000    # 360.0f

    rem-float v0, p1, v0

    iput v0, p0, Lorg/osmdroid/views/MapView;->mapOrientation:F

    .line 532
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->requestLayout()V

    .line 533
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 534
    return-void
.end method

.method public setMaxZoomLevel(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "zoomLevel"    # Ljava/lang/Integer;

    .prologue
    .line 464
    iput-object p1, p0, Lorg/osmdroid/views/MapView;->mMaximumZoomLevel:Ljava/lang/Integer;

    .line 465
    return-void
.end method

.method public setMinZoomLevel(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "zoomLevel"    # Ljava/lang/Integer;

    .prologue
    .line 456
    iput-object p1, p0, Lorg/osmdroid/views/MapView;->mMinimumZoomLevel:Ljava/lang/Integer;

    .line 457
    return-void
.end method

.method public setMultiTouchControls(Z)V
    .registers 4
    .param p1, "on"    # Z

    .prologue
    .line 1110
    if-eqz p1, :cond_b

    new-instance v0, Lorg/metalev/multitouch/controller/MultiTouchController;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/metalev/multitouch/controller/MultiTouchController;-><init>(Lorg/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas;Z)V

    :goto_8
    iput-object v0, p0, Lorg/osmdroid/views/MapView;->mMultiTouchController:Lorg/metalev/multitouch/controller/MultiTouchController;

    .line 1111
    return-void

    .line 1110
    :cond_b
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setPositionAndScale(Ljava/lang/Object;Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "aNewObjPosAndScale"    # Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;
    .param p3, "aTouchPoint"    # Lorg/metalev/multitouch/controller/MultiTouchController$PointInfo;

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 1073
    invoke-virtual {p2}, Lorg/metalev/multitouch/controller/MultiTouchController$PositionAndScale;->getScale()F

    move-result v0

    .line 1075
    .local v0, "multiTouchScale":F
    cmpl-float v1, v0, v2

    if-lez v1, :cond_12

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->canZoomIn()Z

    move-result v1

    if-nez v1, :cond_12

    .line 1076
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1078
    :cond_12
    cmpg-float v1, v0, v2

    if-gez v1, :cond_1e

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->canZoomOut()Z

    move-result v1

    if-nez v1, :cond_1e

    .line 1079
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1081
    :cond_1e
    iput v0, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScale:F

    .line 1083
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->requestLayout()V

    .line 1084
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->invalidate()V

    .line 1085
    const/4 v1, 0x1

    return v1
.end method

.method public setScrollableAreaLimit(Lorg/osmdroid/util/BoundingBoxE6;)V
    .registers 12
    .param p1, "boundingBox"    # Lorg/osmdroid/util/BoundingBoxE6;

    .prologue
    const/4 v5, 0x0

    const-wide v8, 0x412e848000000000L    # 1000000.0

    .line 568
    iput-object p1, p0, Lorg/osmdroid/views/MapView;->mScrollableAreaBoundingBox:Lorg/osmdroid/util/BoundingBoxE6;

    .line 571
    if-nez p1, :cond_d

    .line 572
    iput-object v5, p0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    .line 586
    :goto_c
    return-void

    .line 577
    :cond_d
    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatNorthE6()I

    move-result v0

    int-to-double v0, v0

    div-double/2addr v0, v8

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLonWestE6()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v8

    invoke-static {}, Lmicrosoft/mappoint/TileSystem;->getMaximumZoomLevel()I

    move-result v4

    invoke-static/range {v0 .. v5}, Lmicrosoft/mappoint/TileSystem;->LatLongToPixelXY(DDILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v7

    .line 582
    .local v7, "upperLeft":Landroid/graphics/Point;
    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatSouthE6()I

    move-result v0

    int-to-double v0, v0

    div-double/2addr v0, v8

    invoke-virtual {p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLonEastE6()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v2, v8

    invoke-static {}, Lmicrosoft/mappoint/TileSystem;->getMaximumZoomLevel()I

    move-result v4

    invoke-static/range {v0 .. v5}, Lmicrosoft/mappoint/TileSystem;->LatLongToPixelXY(DDILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v6

    .line 585
    .local v6, "lowerRight":Landroid/graphics/Point;
    new-instance v0, Landroid/graphics/Rect;

    iget v1, v7, Landroid/graphics/Point;->x:I

    iget v2, v7, Landroid/graphics/Point;->y:I

    iget v3, v6, Landroid/graphics/Point;->x:I

    iget v4, v6, Landroid/graphics/Point;->y:I

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lorg/osmdroid/views/MapView;->mScrollableAreaLimit:Landroid/graphics/Rect;

    goto :goto_c
.end method

.method public setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 3
    .param p1, "aTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 315
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 316
    invoke-direct {p0, p1}, Lorg/osmdroid/views/MapView;->updateTileSizeForDensity(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 317
    invoke-direct {p0}, Lorg/osmdroid/views/MapView;->checkZoomButtons()V

    .line 318
    iget v0, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/MapView;->setZoomLevel(I)I

    .line 319
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 320
    return-void
.end method

.method public setTilesScaledToDpi(Z)V
    .registers 3
    .param p1, "tilesScaledToDpi"    # Z

    .prologue
    .line 305
    iput-boolean p1, p0, Lorg/osmdroid/views/MapView;->mTilesScaledToDpi:Z

    .line 306
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getTileProvider()Lorg/osmdroid/tileprovider/MapTileProviderBase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/osmdroid/views/MapView;->updateTileSizeForDensity(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 307
    return-void
.end method

.method public setUseDataConnection(Z)V
    .registers 3
    .param p1, "aMode"    # Z

    .prologue
    .line 555
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v0, p1}, Lorg/osmdroid/views/overlay/TilesOverlay;->setUseDataConnection(Z)V

    .line 556
    return-void
.end method

.method setZoomLevel(I)I
    .registers 15
    .param p1, "aZoomLevel"    # I

    .prologue
    const/4 v12, 0x0

    .line 327
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMinZoomLevel()I

    move-result v5

    .line 328
    .local v5, "minZoomLevel":I
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v4

    .line 330
    .local v4, "maxZoomLevel":I
    invoke-static {v4, p1}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 331
    .local v6, "newZoomLevel":I
    iget v1, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    .line 333
    .local v1, "curZoomLevel":I
    if-eq v6, v1, :cond_1e

    .line 334
    iget-object v9, p0, Lorg/osmdroid/views/MapView;->mScroller:Landroid/widget/Scroller;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/Scroller;->forceFinished(Z)V

    .line 335
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/osmdroid/views/MapView;->mIsFlinging:Z

    .line 339
    :cond_1e
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMapCenter()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v0

    .line 341
    .local v0, "centerGeoPoint":Lorg/osmdroid/api/IGeoPoint;
    iput v6, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    .line 342
    iput-object v12, p0, Lorg/osmdroid/views/MapView;->mProjection:Lorg/osmdroid/views/Projection;

    .line 343
    invoke-direct {p0}, Lorg/osmdroid/views/MapView;->checkZoomButtons()V

    .line 345
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->isLayoutOccurred()Z

    move-result v9

    if-eqz v9, :cond_6b

    .line 346
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v9

    invoke-interface {v9, v0}, Lorg/osmdroid/api/IMapController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 349
    new-instance v8, Landroid/graphics/Point;

    invoke-direct {v8}, Landroid/graphics/Point;-><init>()V

    .line 350
    .local v8, "snapPoint":Landroid/graphics/Point;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v7

    .line 351
    .local v7, "pj":Lorg/osmdroid/views/Projection;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getOverlayManager()Lorg/osmdroid/views/overlay/OverlayManager;

    move-result-object v9

    iget-object v10, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->x:F

    float-to-int v10, v10

    iget-object v11, p0, Lorg/osmdroid/views/MapView;->mMultiTouchScalePoint:Landroid/graphics/PointF;

    iget v11, v11, Landroid/graphics/PointF;->y:F

    float-to-int v11, v11

    invoke-virtual {v9, v10, v11, v8, p0}, Lorg/osmdroid/views/overlay/OverlayManager;->onSnapToItem(IILandroid/graphics/Point;Lorg/osmdroid/api/IMapView;)Z

    move-result v9

    if-eqz v9, :cond_62

    .line 353
    iget v9, v8, Landroid/graphics/Point;->x:I

    iget v10, v8, Landroid/graphics/Point;->y:I

    invoke-virtual {v7, v9, v10, v12}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v3

    .line 354
    .local v3, "geoPoint":Lorg/osmdroid/api/IGeoPoint;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v9

    invoke-interface {v9, v3}, Lorg/osmdroid/api/IMapController;->animateTo(Lorg/osmdroid/api/IGeoPoint;)V

    .line 357
    .end local v3    # "geoPoint":Lorg/osmdroid/api/IGeoPoint;
    :cond_62
    iget-object v9, p0, Lorg/osmdroid/views/MapView;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {p0, v12}, Lorg/osmdroid/views/MapView;->getScreenRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v10

    invoke-virtual {v9, v7, v6, v1, v10}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->rescaleCache(Lorg/osmdroid/views/Projection;IILandroid/graphics/Rect;)V

    .line 361
    .end local v7    # "pj":Lorg/osmdroid/views/Projection;
    .end local v8    # "snapPoint":Landroid/graphics/Point;
    :cond_6b
    if-eq v6, v1, :cond_7b

    iget-object v9, p0, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    if-eqz v9, :cond_7b

    .line 362
    new-instance v2, Lorg/osmdroid/events/ZoomEvent;

    invoke-direct {v2, p0, v6}, Lorg/osmdroid/events/ZoomEvent;-><init>(Lorg/osmdroid/views/MapView;I)V

    .line 363
    .local v2, "event":Lorg/osmdroid/events/ZoomEvent;
    iget-object v9, p0, Lorg/osmdroid/views/MapView;->mListener:Lorg/osmdroid/events/MapListener;

    invoke-interface {v9, v2}, Lorg/osmdroid/events/MapListener;->onZoom(Lorg/osmdroid/events/ZoomEvent;)Z

    .line 366
    .end local v2    # "event":Lorg/osmdroid/events/ZoomEvent;
    :cond_7b
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->requestLayout()V

    .line 367
    iget v9, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    return v9
.end method

.method public useDataConnection()Z
    .registers 2

    .prologue
    .line 544
    iget-object v0, p0, Lorg/osmdroid/views/MapView;->mMapOverlay:Lorg/osmdroid/views/overlay/TilesOverlay;

    invoke-virtual {v0}, Lorg/osmdroid/views/overlay/TilesOverlay;->useDataConnection()Z

    move-result v0

    return v0
.end method

.method zoomIn()Z
    .registers 2

    .prologue
    .line 487
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IMapController;->zoomIn()Z

    move-result v0

    return v0
.end method

.method zoomInFixing(II)Z
    .registers 4
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    .line 496
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/api/IMapController;->zoomInFixing(II)Z

    move-result v0

    return v0
.end method

.method zoomInFixing(Lorg/osmdroid/api/IGeoPoint;)Z
    .registers 6
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 491
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 492
    .local v0, "coords":Landroid/graphics/Point;
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v1

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-interface {v1, v2, v3}, Lorg/osmdroid/api/IMapController;->zoomInFixing(II)Z

    move-result v1

    return v1
.end method

.method zoomOut()Z
    .registers 2

    .prologue
    .line 503
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IMapController;->zoomOut()Z

    move-result v0

    return v0
.end method

.method zoomOutFixing(II)Z
    .registers 4
    .param p1, "xPixel"    # I
    .param p2, "yPixel"    # I

    .prologue
    .line 512
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/api/IMapController;->zoomOutFixing(II)Z

    move-result v0

    return v0
.end method

.method zoomOutFixing(Lorg/osmdroid/api/IGeoPoint;)Z
    .registers 5
    .param p1, "point"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 507
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 508
    .local v0, "coords":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, v1, v2}, Lorg/osmdroid/views/MapView;->zoomOutFixing(II)Z

    move-result v1

    return v1
.end method

.method public zoomToBoundingBox(Lorg/osmdroid/util/BoundingBoxE6;)V
    .registers 17
    .param p1, "boundingBox"    # Lorg/osmdroid/util/BoundingBoxE6;

    .prologue
    .line 377
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getBoundingBox()Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    .line 380
    .local v0, "currentBox":Lorg/osmdroid/util/BoundingBoxE6;
    iget v9, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v10

    if-ne v9, v10, :cond_7f

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v9

    int-to-double v1, v9

    .line 384
    .local v1, "maxZoomLatitudeSpan":D
    :goto_11
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v9

    int-to-double v9, v9

    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v11

    int-to-double v11, v11

    div-double/2addr v11, v1

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v11

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    invoke-static {v13, v14}, Ljava/lang/Math;->log(D)D

    move-result-wide v13

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    sub-double v5, v9, v11

    .line 390
    .local v5, "requiredLatitudeZoom":D
    iget v9, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v10

    if-ne v9, v10, :cond_96

    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v9

    int-to-double v3, v9

    .line 394
    .local v3, "maxZoomLongitudeSpan":D
    :goto_3a
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v9

    int-to-double v9, v9

    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v11

    int-to-double v11, v11

    div-double/2addr v11, v3

    invoke-static {v11, v12}, Ljava/lang/Math;->log(D)D

    move-result-wide v11

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    invoke-static {v13, v14}, Ljava/lang/Math;->log(D)D

    move-result-wide v13

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    sub-double v7, v9, v11

    .line 400
    .local v7, "requiredLongitudeZoom":D
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v9

    cmpg-double v10, v5, v7

    if-gez v10, :cond_ac

    .end local v5    # "requiredLatitudeZoom":D
    :goto_5e
    double-to-int v10, v5

    invoke-interface {v9, v10}, Lorg/osmdroid/api/IMapController;->setZoom(I)I

    .line 404
    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v9

    new-instance v10, Lorg/osmdroid/util/GeoPoint;

    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/util/BoundingBoxE6;->getCenter()Lorg/osmdroid/util/GeoPoint;

    move-result-object v11

    invoke-virtual {v11}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/util/BoundingBoxE6;->getCenter()Lorg/osmdroid/util/GeoPoint;

    move-result-object v12

    invoke-virtual {v12}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v12

    invoke-direct {v10, v11, v12}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-interface {v9, v10}, Lorg/osmdroid/api/IMapController;->setCenter(Lorg/osmdroid/api/IGeoPoint;)V

    .line 407
    return-void

    .line 380
    .end local v1    # "maxZoomLatitudeSpan":D
    .end local v3    # "maxZoomLongitudeSpan":D
    .end local v7    # "requiredLongitudeZoom":D
    :cond_7f
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v9

    int-to-double v9, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v13

    iget v14, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    sub-int/2addr v13, v14

    int-to-double v13, v13

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    div-double v1, v9, v11

    goto/16 :goto_11

    .line 390
    .restart local v1    # "maxZoomLatitudeSpan":D
    .restart local v5    # "requiredLatitudeZoom":D
    :cond_96
    invoke-virtual {v0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v9

    int-to-double v9, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    invoke-virtual {p0}, Lorg/osmdroid/views/MapView;->getMaxZoomLevel()I

    move-result v13

    iget v14, p0, Lorg/osmdroid/views/MapView;->mZoomLevel:I

    sub-int/2addr v13, v14

    int-to-double v13, v13

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v11

    div-double v3, v9, v11

    goto :goto_3a

    .restart local v3    # "maxZoomLongitudeSpan":D
    .restart local v7    # "requiredLongitudeZoom":D
    :cond_ac
    move-wide v5, v7

    .line 400
    goto :goto_5e
.end method
