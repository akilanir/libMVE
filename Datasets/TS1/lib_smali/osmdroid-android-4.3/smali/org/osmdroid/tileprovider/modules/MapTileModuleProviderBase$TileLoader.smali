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
    .line 188
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
    .registers 7

    .prologue
    .line 211
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v4, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mQueueLockObject:Ljava/lang/Object;

    monitor-enter v4

    .line 212
    const/4 v1, 0x0

    .line 217
    .local v1, "result":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_6
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 220
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/osmdroid/tileprovider/MapTile;>;"
    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 221
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/osmdroid/tileprovider/MapTile;

    .line 222
    .local v2, "tile":Lorg/osmdroid/tileprovider/MapTile;
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mWorking:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    .line 227
    move-object v1, v2

    goto :goto_12

    .line 231
    .end local v2    # "tile":Lorg/osmdroid/tileprovider/MapTile;
    :cond_2a
    if-eqz v1, :cond_3b

    .line 236
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mWorking:Ljava/util/HashMap;

    iget-object v5, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v5, v5, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    :cond_3b
    if-eqz v1, :cond_49

    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    iget-object v3, v3, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->mPending:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/osmdroid/tileprovider/MapTileRequestState;

    :goto_47
    monitor-exit v4

    return-object v3

    :cond_49
    const/4 v3, 0x0

    goto :goto_47

    .line 240
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/osmdroid/tileprovider/MapTile;>;"
    :catchall_4b
    move-exception v3

    monitor-exit v4
    :try_end_4d
    .catchall {:try_start_6 .. :try_end_4d} :catchall_4b

    throw v3
.end method

.method protected onTileLoaderInit()V
    .registers 1

    .prologue
    .line 203
    return-void
.end method

.method protected onTileLoaderShutdown()V
    .registers 1

    .prologue
    .line 207
    return-void
.end method

.method public final run()V
    .registers 7

    .prologue
    .line 283
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->onTileLoaderInit()V

    .line 286
    const/4 v1, 0x0

    .line 287
    .local v1, "result":Landroid/graphics/drawable/Drawable;
    :goto_4
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->nextTile()Lorg/osmdroid/tileprovider/MapTileRequestState;

    move-result-object v2

    .local v2, "state":Lorg/osmdroid/tileprovider/MapTileRequestState;
    if-eqz v2, :cond_68

    .line 292
    const/4 v1, 0x0

    .line 293
    :try_start_b
    invoke-virtual {p0, v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    :try_end_e
    .catch Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException; {:try_start_b .. :try_end_e} :catch_15
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_e} :catch_3a

    move-result-object v1

    .line 301
    :goto_f
    if-nez v1, :cond_5a

    .line 302
    invoke-virtual {p0, v2}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoadedFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V

    goto :goto_4

    .line 294
    :catch_15
    move-exception v0

    .line 295
    .local v0, "e":Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->access$000()Lorg/slf4j/Logger;

    move-result-object v3

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

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 296
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    # invokes: Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->clearQueue()V
    invoke-static {v3}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    goto :goto_f

    .line 297
    .end local v0    # "e":Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
    :catch_3a
    move-exception v0

    .line 298
    .local v0, "e":Ljava/lang/Throwable;
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->access$000()Lorg/slf4j/Logger;

    move-result-object v3

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

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_f

    .line 303
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_5a
    invoke-static {v1}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->isDrawableExpired(Landroid/graphics/drawable/Drawable;)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 304
    invoke-virtual {p0, v2, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoadedExpired(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 306
    :cond_64
    invoke-virtual {p0, v2, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    goto :goto_4

    .line 310
    :cond_68
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->onTileLoaderShutdown()V

    .line 311
    return-void
.end method

.method protected tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 251
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 252
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 253
    return-void
.end method

.method protected tileLoadedExpired(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 264
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 265
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestExpiredTile(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 266
    return-void
.end method

.method protected tileLoadedFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V
    .registers 4
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;

    .prologue
    .line 273
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 274
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestFailed(Lorg/osmdroid/tileprovider/MapTileRequestState;)V

    .line 275
    return-void
.end method
