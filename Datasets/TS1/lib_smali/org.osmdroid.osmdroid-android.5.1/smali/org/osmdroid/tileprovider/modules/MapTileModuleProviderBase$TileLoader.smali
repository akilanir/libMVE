.class public abstract Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;
.super Ljava/lang/Object;
.source "MapTileModuleProviderBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "TileLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V
    .registers 2

    .prologue
    .line 186
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
        }
    .end annotation
.end method

.method protected nextTile()Lorg/osmdroid/tileprovider/MapTileRequestState;
    .registers 8

    .prologue
    .line 209
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v4, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mQueueLockObject:Ljava/lang/Object;

    monitor-enter v4

    .line 210
    const/4 v1, 0x0

    .line 215
    .local v1, "result":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_6
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 218
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/osmdroid/tileprovider/MapTile;>;"
    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_56

    .line 219
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/osmdroid/tileprovider/MapTile;

    .line 220
    .local v2, "tile":Lorg/osmdroid/tileprovider/MapTile;
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mWorking:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 221
    sget-boolean v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v3, :cond_54

    .line 222
    const-string v3, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "TileLoader.nextTile() on provider: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {v6}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " found tile in working queue: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    :cond_54
    move-object v1, v2

    goto :goto_12

    .line 229
    .end local v2    # "tile":Lorg/osmdroid/tileprovider/MapTile;
    :cond_56
    if-eqz v1, :cond_93

    .line 230
    sget-boolean v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v3, :cond_84

    .line 231
    const-string v3, "OsmDroid"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "TileLoader.nextTile() on provider: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {v6}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " adding tile to working queue: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    :cond_84
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mWorking:Ljava/util/HashMap;

    iget-object v5, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v5, v5, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    :cond_93
    if-eqz v1, :cond_a1

    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/osmdroid/tileprovider/MapTileRequestState;

    :goto_9f
    monitor-exit v4

    return-object v3

    :cond_a1
    const/4 v3, 0x0

    goto :goto_9f

    .line 238
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/osmdroid/tileprovider/MapTile;>;"
    :catchall_a3
    move-exception v3

    monitor-exit v4
    :try_end_a5
    .catchall {:try_start_6 .. :try_end_a5} :catchall_a3

    throw v3
.end method

.method protected onTileLoaderInit()V
    .registers 1

    .prologue
    .line 201
    return-void
.end method

.method protected onTileLoaderShutdown()V
    .registers 1

    .prologue
    .line 205
    return-void
.end method

.method public final run()V
    .registers 7

    .prologue
    .line 281
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->onTileLoaderInit()V

    .line 284
    const/4 v1, 0x0

    .line 285
    .local v1, "result":Landroid/graphics/drawable/Drawable;
    :goto_4
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->nextTile()Lorg/osmdroid/tileprovider/MapTileRequestState;

    move-result-object v2

    .local v2, "state":Lorg/osmdroid/tileprovider/MapTileRequestState;
    if-eqz v2, :cond_84

    .line 286
    sget-boolean v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v3, :cond_2a

    .line 287
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "TileLoader.run() processing next tile: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    :cond_2a
    const/4 v1, 0x0

    .line 291
    :try_start_2b
    invoke-virtual {p0, v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    :try_end_2e
    .catch Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException; {:try_start_2b .. :try_end_2e} :catch_35
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2e} :catch_58

    move-result-object v1

    .line 299
    :goto_2f
    if-nez v1, :cond_76

    .line 300
    invoke-virtual {p0, v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoadedFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V

    goto :goto_4

    .line 292
    :catch_35
    move-exception v0

    .line 293
    .local v0, "e":Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tile loader can\'t continue: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 294
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    # invokes: Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->clearQueue()V
    invoke-static {v3}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    goto :goto_2f

    .line 295
    .end local v0    # "e":Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
    :catch_58
    move-exception v0

    .line 296
    .local v0, "e":Ljava/lang/Throwable;
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error downloading tile: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2f

    .line 301
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_76
    invoke-static {v1}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->isDrawableExpired(Landroid/graphics/drawable/Drawable;)Z

    move-result v3

    if-eqz v3, :cond_80

    .line 302
    invoke-virtual {p0, v2, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoadedExpired(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 304
    :cond_80
    invoke-virtual {p0, v2, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 308
    :cond_84
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->onTileLoaderShutdown()V

    .line 309
    return-void
.end method

.method protected tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 245
    sget-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v0, :cond_30

    .line 246
    const-string v0, "OsmDroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TileLoader.tileLoaded() on provider: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with tile: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :cond_30
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 250
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 251
    return-void
.end method

.method protected tileLoadedExpired(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 258
    sget-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v0, :cond_30

    .line 259
    const-string v0, "OsmDroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TileLoader.tileLoadedExpired() on provider: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with tile: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    :cond_30
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 263
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestExpiredTile(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 264
    return-void
.end method

.method protected tileLoadedFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;

    .prologue
    .line 267
    sget-boolean v0, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUG_TILE_PROVIDERS:Z

    if-eqz v0, :cond_30

    .line 268
    const-string v0, "OsmDroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "TileLoader.tileLoadedFailed() on provider: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with tile: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :cond_30
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 272
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V

    .line 273
    return-void
.end method
