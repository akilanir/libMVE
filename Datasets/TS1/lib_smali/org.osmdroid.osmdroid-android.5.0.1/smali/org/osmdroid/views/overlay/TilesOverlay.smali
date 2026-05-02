.class public Lorg/osmdroid/views/overlay/TilesOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "TilesOverlay.java"

# interfaces
.implements Lorg/osmdroid/views/overlay/IOverlayMenuProvider;


# static fields
.field public static final MENU_MAP_MODE:I

.field public static final MENU_OFFLINE:I

.field public static final MENU_TILE_SOURCE_STARTING_ID:I

.field static final neg:Landroid/graphics/ColorFilter;

.field static final negate:[F


# instance fields
.field private isInvert:Z

.field private mBottomRightMercator:Landroid/graphics/Point;

.field protected final mDebugPaint:Landroid/graphics/Paint;

.field private mLoadingBackgroundColor:I

.field private mLoadingLineColor:I

.field private mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

.field private mOptionsMenuEnabled:Z

.field private mOvershootTileCache:I

.field private mProjection:Lorg/osmdroid/views/Projection;

.field private final mTileLooper:Lorg/osmdroid/util/TileLooper;

.field private final mTilePoint:Landroid/graphics/Point;

.field private mTilePointMercator:Landroid/graphics/Point;

.field protected final mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

.field private final mTileRect:Landroid/graphics/Rect;

.field private mTopLeftMercator:Landroid/graphics/Point;

.field private final mViewPort:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 43
    invoke-static {}, Lorg/osmdroid/views/overlay/TilesOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_MAP_MODE:I

    .line 44
    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v0}, Lorg/osmdroid/views/overlay/TilesOverlay;->getSafeMenuIdSequence(I)I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    .line 46
    invoke-static {}, Lorg/osmdroid/views/overlay/TilesOverlay;->getSafeMenuId()I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_OFFLINE:I

    .line 74
    const/16 v0, 0x14

    new-array v0, v0, [F

    fill-array-data v0, :array_2e

    sput-object v0, Lorg/osmdroid/views/overlay/TilesOverlay;->negate:[F

    .line 80
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    sget-object v1, Lorg/osmdroid/views/overlay/TilesOverlay;->negate:[F

    invoke-direct {v0, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>([F)V

    sput-object v0, Lorg/osmdroid/views/overlay/TilesOverlay;->neg:Landroid/graphics/ColorFilter;

    return-void

    .line 74
    nop

    :array_2e
    .array-data 4
        -0x40800000    # -1.0f
        0x0
        0x0
        0x0
        0x437f0000    # 255.0f
        0x0
        -0x40800000    # -1.0f
        0x0
        0x0
        0x437f0000    # 255.0f
        0x0
        0x0
        -0x40800000    # -1.0f
        0x0
        0x437f0000    # 255.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;Landroid/content/Context;)V
    .registers 4
    .param p1, "aTileProvider"    # Lorg/osmdroid/tileprovider/MapTileProviderBase;
    .param p2, "aContext"    # Landroid/content/Context;

    .prologue
    .line 84
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v0, p2}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lorg/osmdroid/views/overlay/TilesOverlay;-><init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;Lorg/osmdroid/ResourceProxy;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;Lorg/osmdroid/ResourceProxy;)V
    .registers 7
    .param p1, "aTileProvider"    # Lorg/osmdroid/tileprovider/MapTileProviderBase;
    .param p2, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    const/16 v3, 0xd0

    const/16 v2, 0xc0

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0, p2}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mDebugPaint:Landroid/graphics/Paint;

    .line 53
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileRect:Landroid/graphics/Rect;

    .line 54
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePoint:Landroid/graphics/Point;

    .line 55
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mViewPort:Landroid/graphics/Rect;

    .line 56
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTopLeftMercator:Landroid/graphics/Point;

    .line 57
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mBottomRightMercator:Landroid/graphics/Point;

    .line 58
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePointMercator:Landroid/graphics/Point;

    .line 62
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOptionsMenuEnabled:Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

    .line 66
    const/16 v0, 0xd8

    invoke-static {v0, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    .line 67
    const/16 v0, 0xc8

    invoke-static {v0, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    iput v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingLineColor:I

    .line 70
    iput v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOvershootTileCache:I

    .line 73
    iput-boolean v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->isInvert:Z

    .line 174
    new-instance v0, Lorg/osmdroid/views/overlay/TilesOverlay$1;

    invoke-direct {v0, p0}, Lorg/osmdroid/views/overlay/TilesOverlay$1;-><init>(Lorg/osmdroid/views/overlay/TilesOverlay;)V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileLooper:Lorg/osmdroid/util/TileLooper;

    .line 89
    if-nez p1, :cond_64

    .line 90
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You must pass a valid tile provider to the tiles overlay."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_64
    iput-object p1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    .line 94
    return-void
.end method

.method static synthetic access$000(Lorg/osmdroid/views/overlay/TilesOverlay;)I
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 40
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOvershootTileCache:I

    return v0
.end method

.method static synthetic access$100(Lorg/osmdroid/views/overlay/TilesOverlay;)Landroid/graphics/drawable/Drawable;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/TilesOverlay;->getLoadingTile()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lorg/osmdroid/views/overlay/TilesOverlay;)Landroid/graphics/Point;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePoint:Landroid/graphics/Point;

    return-object v0
.end method

.method static synthetic access$300(Lorg/osmdroid/views/overlay/TilesOverlay;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/views/overlay/TilesOverlay;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method private clearLoadingTile()V
    .registers 4

    .prologue
    .line 366
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

    .line 367
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

    .line 369
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-ge v1, v2, :cond_14

    .line 370
    if-eqz v0, :cond_14

    .line 371
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 374
    :cond_14
    return-void
.end method

.method private getLoadingTile()Landroid/graphics/drawable/Drawable;
    .registers 12

    .prologue
    .line 337
    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

    if-nez v1, :cond_57

    iget v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    if-eqz v1, :cond_57

    .line 339
    :try_start_8
    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v1}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v1

    if-eqz v1, :cond_4d

    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v1}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v1

    invoke-interface {v1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileSizePixels()I

    move-result v10

    .line 341
    .local v10, "tileSize":I
    :goto_1a
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v10, v10, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 343
    .local v7, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 344
    .local v0, "canvas":Landroid/graphics/Canvas;
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 345
    .local v5, "paint":Landroid/graphics/Paint;
    iget v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 346
    iget v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingLineColor:I

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 347
    const/4 v1, 0x0

    invoke-virtual {v5, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 348
    div-int/lit8 v9, v10, 0x10

    .line 349
    .local v9, "lineSize":I
    const/4 v6, 0x0

    .local v6, "a":I
    :goto_3b
    if-ge v6, v10, :cond_50

    .line 350
    const/4 v1, 0x0

    int-to-float v2, v6

    int-to-float v3, v10

    int-to-float v4, v6

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 351
    int-to-float v1, v6

    const/4 v2, 0x0

    int-to-float v3, v6

    int-to-float v4, v10

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 349
    add-int/2addr v6, v9

    goto :goto_3b

    .line 339
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v5    # "paint":Landroid/graphics/Paint;
    .end local v6    # "a":I
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v9    # "lineSize":I
    .end local v10    # "tileSize":I
    :cond_4d
    const/16 v10, 0x100

    goto :goto_1a

    .line 353
    .restart local v0    # "canvas":Landroid/graphics/Canvas;
    .restart local v5    # "paint":Landroid/graphics/Paint;
    .restart local v6    # "a":I
    .restart local v7    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v9    # "lineSize":I
    .restart local v10    # "tileSize":I
    :cond_50
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v7}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;
    :try_end_57
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8 .. :try_end_57} :catch_5a
    .catch Ljava/lang/NullPointerException; {:try_start_8 .. :try_end_57} :catch_66

    .line 362
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v5    # "paint":Landroid/graphics/Paint;
    .end local v6    # "a":I
    .end local v7    # "bitmap":Landroid/graphics/Bitmap;
    .end local v9    # "lineSize":I
    .end local v10    # "tileSize":I
    :cond_57
    :goto_57
    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingTile:Landroid/graphics/drawable/BitmapDrawable;

    return-object v1

    .line 354
    :catch_5a
    move-exception v8

    .line 355
    .local v8, "e":Ljava/lang/OutOfMemoryError;
    const-string v1, "OsmDroid"

    const-string v2, "OutOfMemoryError getting loading tile"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_57

    .line 357
    .end local v8    # "e":Ljava/lang/OutOfMemoryError;
    :catch_66
    move-exception v8

    .line 358
    .local v8, "e":Ljava/lang/NullPointerException;
    const-string v1, "OsmDroid"

    const-string v2, "NullPointerException getting loading tile"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    invoke-static {}, Ljava/lang/System;->gc()V

    goto :goto_57
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 11
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "osmv"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 133
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getController()Lorg/osmdroid/api/IMapController;

    move-result-object v0

    invoke-interface {v0}, Lorg/osmdroid/api/IMapController;->isInvertedTiles()Z

    move-result v0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->isInvert:Z

    .line 135
    if-eqz p3, :cond_d

    .line 150
    :goto_c
    return-void

    .line 139
    :cond_d
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v2

    .line 142
    .local v2, "projection":Lorg/osmdroid/views/Projection;
    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v6

    .line 143
    .local v6, "screenRect":Landroid/graphics/Rect;
    iget v0, v6, Landroid/graphics/Rect;->left:I

    iget v1, v6, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTopLeftMercator:Landroid/graphics/Point;

    invoke-virtual {v2, v0, v1, v3}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 144
    iget v0, v6, Landroid/graphics/Rect;->right:I

    iget v1, v6, Landroid/graphics/Rect;->bottom:I

    iget-object v3, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mBottomRightMercator:Landroid/graphics/Point;

    invoke-virtual {v2, v0, v1, v3}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 145
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mViewPort:Landroid/graphics/Rect;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTopLeftMercator:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->x:I

    iget-object v3, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTopLeftMercator:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    iget-object v4, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mBottomRightMercator:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iget-object v5, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mBottomRightMercator:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 149
    invoke-virtual {v2}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v4

    iget-object v5, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mViewPort:Landroid/graphics/Rect;

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/osmdroid/views/overlay/TilesOverlay;->drawTiles(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;IILandroid/graphics/Rect;)V

    goto :goto_c
.end method

.method public drawTiles(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;IILandroid/graphics/Rect;)V
    .registers 7
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "projection"    # Lorg/osmdroid/views/Projection;
    .param p3, "zoomLevel"    # I
    .param p4, "tileSizePx"    # I
    .param p5, "viewPort"    # Landroid/graphics/Rect;

    .prologue
    .line 161
    iput-object p2, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mProjection:Lorg/osmdroid/views/Projection;

    .line 162
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileLooper:Lorg/osmdroid/util/TileLooper;

    invoke-virtual {v0, p1, p3, p4, p5}, Lorg/osmdroid/util/TileLooper;->loop(Landroid/graphics/Canvas;IILandroid/graphics/Rect;)V

    .line 172
    return-void
.end method

.method public getLoadingBackgroundColor()I
    .registers 2

    .prologue
    .line 308
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    return v0
.end method

.method public getLoadingLineColor()I
    .registers 2

    .prologue
    .line 326
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingLineColor:I

    return v0
.end method

.method public getMaximumZoomLevel()I
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getMaximumZoomLevel()I

    move-result v0

    return v0
.end method

.method public getMinimumZoomLevel()I
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getMinimumZoomLevel()I

    move-result v0

    return v0
.end method

.method public getOvershootTileCache()I
    .registers 2

    .prologue
    .line 395
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOvershootTileCache:I

    return v0
.end method

.method public isOptionsMenuEnabled()Z
    .registers 2

    .prologue
    .line 243
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOptionsMenuEnabled:Z

    return v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 14
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 249
    sget v5, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_MAP_MODE:I

    add-int/2addr v5, p2

    iget-object v6, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v7, Lorg/osmdroid/ResourceProxy$string;->map_mode:Lorg/osmdroid/ResourceProxy$string;

    invoke-interface {v6, v7}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v8, v5, v8, v6}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v5

    iget-object v6, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v7, Lorg/osmdroid/ResourceProxy$bitmap;->ic_menu_mapmode:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v6, v7}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/view/SubMenu;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/SubMenu;

    move-result-object v2

    .line 253
    .local v2, "mapMenu":Landroid/view/SubMenu;
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_1e
    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v0, v5, :cond_43

    .line 254
    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 255
    .local v3, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    sget v5, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_MAP_MODE:I

    add-int/2addr v5, p2

    sget v6, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    add-int/2addr v6, v0

    add-int/2addr v6, p2

    invoke-interface {v3}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v5, v6, v8, v7}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 253
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 258
    .end local v3    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    :cond_43
    sget v5, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_MAP_MODE:I

    add-int/2addr v5, p2

    invoke-interface {v2, v5, v9, v9}, Landroid/view/SubMenu;->setGroupCheckable(IZZ)V

    .line 260
    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->getResourceProxy()Lorg/osmdroid/ResourceProxy;

    move-result-object v6

    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->useDataConnection()Z

    move-result v5

    if-eqz v5, :cond_6e

    sget-object v5, Lorg/osmdroid/ResourceProxy$string;->offline_mode:Lorg/osmdroid/ResourceProxy$string;

    :goto_55
    invoke-interface {v6, v5}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v4

    .line 263
    .local v4, "title":Ljava/lang/String;
    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->getResourceProxy()Lorg/osmdroid/ResourceProxy;

    move-result-object v5

    sget-object v6, Lorg/osmdroid/ResourceProxy$bitmap;->ic_menu_offline:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v5, v6}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 265
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    sget v5, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_OFFLINE:I

    add-int/2addr v5, p2

    invoke-interface {p1, v8, v5, v8, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5, v1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 267
    return v9

    .line 260
    .end local v1    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v4    # "title":Ljava/lang/String;
    :cond_6e
    sget-object v5, Lorg/osmdroid/ResourceProxy$string;->online_mode:Lorg/osmdroid/ResourceProxy$string;

    goto :goto_55
.end method

.method public onDetach(Lorg/osmdroid/views/MapView;)V
    .registers 3
    .param p1, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 98
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->detach()V

    .line 99
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "pItem"    # Landroid/view/MenuItem;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 291
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    sub-int v0, v2, p2

    .line 292
    .local v0, "menuId":I
    sget v2, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    if-lt v0, v2, :cond_2b

    sget v2, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/2addr v2, v4

    if-ge v0, v2, :cond_2b

    .line 295
    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v2

    sget v4, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    sub-int v4, v0, v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    invoke-virtual {p3, v2}, Lorg/osmdroid/views/MapView;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 303
    :goto_2a
    return v3

    .line 298
    :cond_2b
    sget v2, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_OFFLINE:I

    if-ne v0, v2, :cond_3a

    .line 299
    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->useDataConnection()Z

    move-result v2

    if-nez v2, :cond_36

    move v1, v3

    .line 300
    .local v1, "useDataConnection":Z
    :cond_36
    invoke-virtual {p3, v1}, Lorg/osmdroid/views/MapView;->setUseDataConnection(Z)V

    goto :goto_2a

    .end local v1    # "useDataConnection":Z
    :cond_3a
    move v3, v1

    .line 303
    goto :goto_2a
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;ILorg/osmdroid/views/MapView;)Z
    .registers 9
    .param p1, "pMenu"    # Landroid/view/Menu;
    .param p2, "pMenuIdOffset"    # I
    .param p3, "pMapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    const/4 v4, 0x1

    .line 273
    invoke-static {}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->getTileSources()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->getTileProvider()Lorg/osmdroid/tileprovider/MapTileProviderBase;

    move-result-object v2

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 275
    .local v0, "index":I
    if-ltz v0, :cond_1e

    .line 276
    sget v1, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_TILE_SOURCE_STARTING_ID:I

    add-int/2addr v1, v0

    add-int/2addr v1, p2

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 279
    :cond_1e
    sget v1, Lorg/osmdroid/views/overlay/TilesOverlay;->MENU_OFFLINE:I

    add-int/2addr v1, p2

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->getResourceProxy()Lorg/osmdroid/ResourceProxy;

    move-result-object v3

    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->useDataConnection()Z

    move-result v1

    if-eqz v1, :cond_39

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->offline_mode:Lorg/osmdroid/ResourceProxy$string;

    :goto_31
    invoke-interface {v3, v1}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 284
    return v4

    .line 279
    :cond_39
    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->online_mode:Lorg/osmdroid/ResourceProxy$string;

    goto :goto_31
.end method

.method protected onTileReadyToDraw(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "currentMapTile"    # Landroid/graphics/drawable/Drawable;
    .param p3, "tileRect"    # Landroid/graphics/Rect;

    .prologue
    .line 228
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->isInvert:Z

    if-eqz v0, :cond_9

    .line 229
    sget-object v0, Lorg/osmdroid/views/overlay/TilesOverlay;->neg:Landroid/graphics/ColorFilter;

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 230
    :cond_9
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mProjection:Lorg/osmdroid/views/Projection;

    iget v1, p3, Landroid/graphics/Rect;->left:I

    iget v2, p3, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePointMercator:Landroid/graphics/Point;

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->toPixelsFromMercator(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 231
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePointMercator:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget-object v1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTilePointMercator:Landroid/graphics/Point;

    iget v1, v1, Landroid/graphics/Point;->y:I

    invoke-virtual {p3, v0, v1}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 232
    invoke-virtual {p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 233
    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 234
    return-void
.end method

.method public setLoadingBackgroundColor(I)V
    .registers 3
    .param p1, "pLoadingBackgroundColor"    # I

    .prologue
    .line 319
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    if-eq v0, p1, :cond_9

    .line 320
    iput p1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingBackgroundColor:I

    .line 321
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/TilesOverlay;->clearLoadingTile()V

    .line 323
    :cond_9
    return-void
.end method

.method public setLoadingLineColor(I)V
    .registers 3
    .param p1, "pLoadingLineColor"    # I

    .prologue
    .line 330
    iget v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingLineColor:I

    if-eq v0, p1, :cond_9

    .line 331
    iput p1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mLoadingLineColor:I

    .line 332
    invoke-direct {p0}, Lorg/osmdroid/views/overlay/TilesOverlay;->clearLoadingTile()V

    .line 334
    :cond_9
    return-void
.end method

.method public setOptionsMenuEnabled(Z)V
    .registers 2
    .param p1, "pOptionsMenuEnabled"    # Z

    .prologue
    .line 238
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOptionsMenuEnabled:Z

    .line 239
    return-void
.end method

.method public setOvershootTileCache(I)V
    .registers 2
    .param p1, "overshootTileCache"    # I

    .prologue
    .line 386
    iput p1, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mOvershootTileCache:I

    .line 387
    return-void
.end method

.method public setUseDataConnection(Z)V
    .registers 3
    .param p1, "aMode"    # Z

    .prologue
    .line 124
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->setUseDataConnection(Z)V

    .line 125
    return-void
.end method

.method public useDataConnection()Z
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/osmdroid/views/overlay/TilesOverlay;->mTileProvider:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->useDataConnection()Z

    move-result v0

    return v0
.end method
