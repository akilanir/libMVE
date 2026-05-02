.class public abstract Lorg/osmdroid/tileprovider/MapTileProviderBase;
.super Ljava/lang/Object;
.source "MapTileProviderBase.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/IMapTileProviderCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;,
        Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomInTileLooper;,
        Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;
    }
.end annotation


# instance fields
.field protected final mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

.field protected mTileRequestCompleteHandler:Landroid/os/Handler;

.field private mTileSource:Lorg/osmdroid/tileprovider/tilesource/ITileSource;

.field protected mUseDataConnection:Z


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 3
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Landroid/os/Handler;)V

    .line 101
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Landroid/os/Handler;)V
    .registers 4
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pDownloadFinishedListener"    # Landroid/os/Handler;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mUseDataConnection:Z

    .line 105
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->createTileCache()Lorg/osmdroid/tileprovider/MapTileCache;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    .line 106
    iput-object p2, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    .line 107
    iput-object p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileSource:Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 108
    return-void
.end method


# virtual methods
.method public clearTileCache()V
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/MapTileCache;->clear()V

    .line 201
    return-void
.end method

.method public createTileCache()Lorg/osmdroid/tileprovider/MapTileCache;
    .registers 2

    .prologue
    .line 96
    new-instance v0, Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-direct {v0}, Lorg/osmdroid/tileprovider/MapTileCache;-><init>()V

    return-object v0
.end method

.method public abstract detach()V
.end method

.method public ensureCapacity(I)V
    .registers 3
    .param p1, "pCapacity"    # I

    .prologue
    .line 196
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/MapTileCache;->ensureCapacity(I)V

    .line 197
    return-void
.end method

.method public abstract getMapTile(Lorg/osmdroid/tileprovider/MapTile;)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract getMaximumZoomLevel()I
.end method

.method public abstract getMinimumZoomLevel()I
.end method

.method public getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileSource:Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    return-object v0
.end method

.method public mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 122
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->putTileIntoCache(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 125
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    if-eqz v0, :cond_d

    .line 126
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 132
    :cond_d
    return-void
.end method

.method public mapTileRequestExpiredTile(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 165
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->putExpiredTileIntoCache(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 168
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    if-eqz v0, :cond_d

    .line 169
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 175
    :cond_d
    return-void
.end method

.method public mapTileRequestFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V
    .registers 4
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;

    .prologue
    .line 143
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    if-eqz v0, :cond_a

    .line 144
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 150
    :cond_a
    return-void
.end method

.method protected putExpiredTileIntoCache(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 185
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v0

    .line 186
    .local v0, "tile":Lorg/osmdroid/tileprovider/MapTile;
    if-eqz p2, :cond_13

    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v1, v0}, Lorg/osmdroid/tileprovider/MapTileCache;->containsTile(Lorg/osmdroid/tileprovider/MapTile;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 187
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v1, v0, p2}, Lorg/osmdroid/tileprovider/MapTileCache;->putTile(Lorg/osmdroid/tileprovider/MapTile;Landroid/graphics/drawable/Drawable;)V

    .line 189
    :cond_13
    return-void
.end method

.method protected putTileIntoCache(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 178
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v0

    .line 179
    .local v0, "tile":Lorg/osmdroid/tileprovider/MapTile;
    if-eqz p2, :cond_b

    .line 180
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileCache:Lorg/osmdroid/tileprovider/MapTileCache;

    invoke-virtual {v1, v0, p2}, Lorg/osmdroid/tileprovider/MapTileCache;->putTile(Lorg/osmdroid/tileprovider/MapTile;Landroid/graphics/drawable/Drawable;)V

    .line 182
    :cond_b
    return-void
.end method

.method public rescaleCache(Lorg/osmdroid/views/Projection;IILandroid/graphics/Rect;)V
    .registers 20
    .param p1, "pProjection"    # Lorg/osmdroid/views/Projection;
    .param p2, "pNewZoomLevel"    # I
    .param p3, "pOldZoomLevel"    # I
    .param p4, "pViewPort"    # Landroid/graphics/Rect;

    .prologue
    .line 231
    move/from16 v0, p2

    move/from16 v1, p3

    if-ne v0, v1, :cond_7

    .line 254
    :goto_6
    return-void

    .line 235
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 237
    .local v5, "startMs":J
    const-string v11, "OsmDroid"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "rescale tile cache from "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v11

    invoke-interface {v11}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileSizePixels()I

    move-result v8

    .line 241
    .local v8, "tileSize":I
    move-object/from16 v0, p4

    iget v11, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p4

    iget v12, v0, Landroid/graphics/Rect;->top:I

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12, v13}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v9

    .line 242
    .local v9, "topLeftMercator":Landroid/graphics/Point;
    move-object/from16 v0, p4

    iget v11, v0, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p4

    iget v12, v0, Landroid/graphics/Rect;->bottom:I

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12, v13}, Lorg/osmdroid/views/Projection;->toMercatorPixels(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v2

    .line 244
    .local v2, "bottomRightMercator":Landroid/graphics/Point;
    new-instance v10, Landroid/graphics/Rect;

    iget v11, v9, Landroid/graphics/Point;->x:I

    iget v12, v9, Landroid/graphics/Point;->y:I

    iget v13, v2, Landroid/graphics/Point;->x:I

    iget v14, v2, Landroid/graphics/Point;->y:I

    invoke-direct {v10, v11, v12, v13, v14}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 247
    .local v10, "viewPort":Landroid/graphics/Rect;
    move/from16 v0, p2

    move/from16 v1, p3

    if-le v0, v1, :cond_9d

    new-instance v7, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomInTileLooper;

    move/from16 v0, p3

    invoke-direct {v7, p0, v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomInTileLooper;-><init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;I)V

    .line 250
    .local v7, "tileLooper":Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;
    :goto_71
    const/4 v11, 0x0

    move/from16 v0, p2

    invoke-virtual {v7, v11, v0, v8, v10}, Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;->loop(Landroid/graphics/Canvas;IILandroid/graphics/Rect;)V

    .line 252
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 253
    .local v3, "endMs":J
    const-string v11, "OsmDroid"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Finished rescale in "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sub-long v13, v3, v5

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "ms"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    .line 247
    .end local v3    # "endMs":J
    .end local v7    # "tileLooper":Lorg/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper;
    :cond_9d
    new-instance v7, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;

    move/from16 v0, p3

    invoke-direct {v7, p0, v0}, Lorg/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper;-><init>(Lorg/osmdroid/tileprovider/MapTileProviderBase;I)V

    goto :goto_71
.end method

.method public setTileRequestCompleteHandler(Landroid/os/Handler;)V
    .registers 2
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileRequestCompleteHandler:Landroid/os/Handler;

    .line 193
    return-void
.end method

.method public setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 2
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mTileSource:Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 80
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/MapTileProviderBase;->clearTileCache()V

    .line 81
    return-void
.end method

.method public setUseDataConnection(Z)V
    .registers 2
    .param p1, "pMode"    # Z

    .prologue
    .line 219
    iput-boolean p1, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mUseDataConnection:Z

    .line 220
    return-void
.end method

.method public useDataConnection()Z
    .registers 2

    .prologue
    .line 208
    iget-boolean v0, p0, Lorg/osmdroid/tileprovider/MapTileProviderBase;->mUseDataConnection:Z

    return v0
.end method
