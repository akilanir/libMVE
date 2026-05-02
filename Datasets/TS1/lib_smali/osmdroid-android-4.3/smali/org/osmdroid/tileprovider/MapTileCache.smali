.class public Lorg/osmdroid/tileprovider/MapTileCache;
.super Ljava/lang/Object;
.source "MapTileCache.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;


# instance fields
.field protected mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

.field protected final mCachedTilesLockObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    const/16 v0, 0x9

    invoke-direct {p0, v0}, Lorg/osmdroid/tileprovider/MapTileCache;-><init>(I)V

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "aMaximumCacheSize"    # I

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    .line 38
    new-instance v0, Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-direct {v0, p1}, Lorg/osmdroid/tileprovider/LRUMapTileCache;-><init>(I)V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    .line 39
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    .line 80
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    monitor-enter v1

    .line 81
    :try_start_3
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->clear()V

    .line 82
    monitor-exit v1

    .line 83
    return-void

    .line 82
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public containsTile(Lorg/osmdroid/tileprovider/MapTile;)Z
    .registers 4
    .param p1, "aTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 74
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    monitor-enter v1

    .line 75
    :try_start_3
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 76
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public ensureCapacity(I)V
    .registers 4
    .param p1, "aCapacity"    # I

    .prologue
    .line 46
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    monitor-enter v1

    .line 47
    :try_start_3
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->ensureCapacity(I)V

    .line 48
    monitor-exit v1

    .line 49
    return-void

    .line 48
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public getMapTile(Lorg/osmdroid/tileprovider/MapTile;)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "aTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 52
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    monitor-enter v1

    .line 53
    :try_start_3
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v0, p1}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    monitor-exit v1

    return-object v0

    .line 54
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public putTile(Lorg/osmdroid/tileprovider/MapTile;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "aTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p2, "aDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 58
    if-eqz p2, :cond_b

    .line 59
    iget-object v1, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTilesLockObject:Ljava/lang/Object;

    monitor-enter v1

    .line 60
    :try_start_5
    iget-object v0, p0, Lorg/osmdroid/tileprovider/MapTileCache;->mCachedTiles:Lorg/osmdroid/tileprovider/LRUMapTileCache;

    invoke-virtual {v0, p1, p2}, Lorg/osmdroid/tileprovider/LRUMapTileCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    monitor-exit v1

    .line 63
    :cond_b
    return-void

    .line 61
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_c

    throw v0
.end method
