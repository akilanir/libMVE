.class abstract Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;
.super Lorg/osmdroid/util/TileLooper;
.source "MapTileProviderBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/MapTileProviderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "ScaleTileLooper"
.end annotation


# instance fields
.field protected mDebugPaint:Landroid/graphics/Paint;

.field protected mDestRect:Landroid/graphics/Rect;

.field protected mDiff:I

.field protected final mNewTiles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/osmdroid/tileprovider/MapTile;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field protected final mOldZoomLevel:I

.field protected mSrcRect:Landroid/graphics/Rect;

.field protected mTileSize_2:I

.field final synthetic this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;I)V
    .registers 4
    .param p2, "pOldZoomLevel"    # I

    .prologue
    .line 270
    iput-object p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-direct {p0}, Lorg/osmdroid/util/TileLooper;-><init>()V

    .line 271
    iput p2, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mOldZoomLevel:I

    .line 272
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mNewTiles:Ljava/util/HashMap;

    .line 273
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mSrcRect:Landroid/graphics/Rect;

    .line 274
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mDestRect:Landroid/graphics/Rect;

    .line 275
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mDebugPaint:Landroid/graphics/Paint;

    .line 276
    return-void
.end method


# virtual methods
.method public finaliseLoop()V
    .registers 9

    .prologue
    .line 304
    :cond_0
    :goto_0
    iget-object v4, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mNewTiles:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_47

    .line 305
    iget-object v4, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mNewTiles:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/osmdroid/tileprovider/MapTile;

    .line 306
    .local v3, "tile":Lorg/osmdroid/tileprovider/MapTile;
    iget-object v4, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mNewTiles:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 307
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    invoke-direct {v1, v0}, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 308
    .local v1, "drawable":Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;
    invoke-static {v1}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->setDrawableExpired(Landroid/graphics/drawable/Drawable;)V

    .line 309
    iget-object v4, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    iget-object v4, v4, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v4, v3}, Lorg/osmdroid/tileprovider/MapTileCache;->getMapTile(Lorg/osmdroid/tileprovider/MapTile;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 310
    .local v2, "existingTile":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_38

    invoke-static {v2}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->isDrawableExpired(Landroid/graphics/drawable/Drawable;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 311
    :cond_38
    iget-object v4, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    new-instance v5, Lorg/osmdroid/tileprovider/MapTileRequestState;

    const/4 v6, 0x0

    new-array v6, v6, [Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    const/4 v7, 0x0

    invoke-direct {v5, v3, v6, v7}, Lorg/osmdroid/tileprovider/MapTileRequestState;-><init>(Lorg/osmdroid/tileprovider/MapTile;[Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Lorg/osmdroid/tileprovider/IMapTileProviderCallback;)V

    invoke-virtual {v4, v5, v1}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->putExpiredTileIntoCache(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 314
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "drawable":Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;
    .end local v2    # "existingTile":Landroid/graphics/drawable/Drawable;
    .end local v3    # "tile":Lorg/osmdroid/tileprovider/MapTile;
    :cond_47
    return-void
.end method

.method protected abstract handleTile(ILorg/osmdroid/tileprovider/MapTile;II)V
.end method

.method public handleTile(Landroid/graphics/Canvas;ILorg/osmdroid/tileprovider/MapTile;II)V
    .registers 10
    .param p1, "pCanvas"    # Landroid/graphics/Canvas;
    .param p2, "pTileSizePx"    # I
    .param p3, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p4, "pX"    # I
    .param p5, "pY"    # I

    .prologue
    .line 291
    iget-object v2, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->this$0:Lorg/osmdroid/tileprovider/MapTileProviderBase;

    invoke-virtual {v2, p3}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getMapTile(Lorg/osmdroid/tileprovider/MapTile;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 292
    .local v1, "requestedTile":Landroid/graphics/drawable/Drawable;
    if-nez v1, :cond_b

    .line 294
    :try_start_8
    invoke-virtual {p0, p2, p3, p4, p5}, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->handleTile(ILorg/osmdroid/tileprovider/MapTile;II)V
    :try_end_b
    .catch Ljava/lang/OutOfMemoryError; {:try_start_8 .. :try_end_b} :catch_c

    .line 299
    :cond_b
    :goto_b
    return-void

    .line 295
    :catch_c
    move-exception v0

    .line 296
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    const-string v2, "OsmDroid"

    const-string v3, "OutOfMemoryError rescaling cache"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b
.end method

.method public initialiseLoop(II)V
    .registers 4
    .param p1, "pZoomLevel"    # I
    .param p2, "pTileSizePx"    # I

    .prologue
    .line 280
    iget v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mOldZoomLevel:I

    sub-int v0, p1, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iput v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mDiff:I

    .line 281
    iget v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mDiff:I

    shr-int v0, p2, v0

    iput v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->mTileSize_2:I

    .line 282
    return-void
.end method
