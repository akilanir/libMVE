.class public Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;
.super Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;
.source "MapTileFileArchiveProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "TileLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;)V
    .registers 2

    .prologue
    .line 196
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    return-void
.end method


# virtual methods
.method public loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;

    .prologue
    const/4 v0, 0x0

    .line 201
    iget-object v5, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v5}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 202
    .local v4, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-nez v4, :cond_10

    .line 238
    :cond_f
    :goto_f
    return-object v0

    .line 206
    :cond_10
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v3

    .line 209
    .local v3, "pTile":Lorg/osmdroid/tileprovider/MapTile;
    iget-object v5, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    invoke-virtual {v5}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->getSdCardAvailable()Z

    move-result v5

    if-nez v5, :cond_39

    .line 210
    sget-boolean v5, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v5, :cond_f

    .line 211
    const-string v5, "OsmDroid"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No sdcard - do nothing for tile: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f

    .line 216
    :cond_39
    const/4 v2, 0x0

    .line 218
    .local v2, "inputStream":Ljava/io/InputStream;
    :try_start_3a
    sget-boolean v5, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v5, :cond_56

    .line 219
    const-string v5, "OsmDroid"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Tile doesn\'t exist: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    :cond_56
    iget-object v5, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    # invokes: Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->getInputStream(Lorg/osmdroid/tileprovider/MapTile;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)Ljava/io/InputStream;
    invoke-static {v5, v3, v4}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;Lorg/osmdroid/tileprovider/MapTile;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)Ljava/io/InputStream;

    move-result-object v2

    .line 223
    if-eqz v2, :cond_84

    .line 224
    sget-boolean v5, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v5, :cond_7a

    .line 225
    const-string v5, "OsmDroid"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Use tile from archive: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    :cond_7a
    invoke-interface {v4, v2}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    :try_end_7d
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_7d} :catch_8a
    .catchall {:try_start_3a .. :try_end_7d} :catchall_99

    move-result-object v0

    .line 233
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_f

    .line 234
    invoke-static {v2}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_f

    .line 233
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_84
    if-eqz v2, :cond_f

    .line 234
    invoke-static {v2}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_f

    .line 230
    :catch_8a
    move-exception v1

    .line 231
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_8b
    const-string v5, "OsmDroid"

    const-string v6, "Error loading tile"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_92
    .catchall {:try_start_8b .. :try_end_92} :catchall_99

    .line 233
    if-eqz v2, :cond_f

    .line 234
    invoke-static {v2}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto/16 :goto_f

    .line 233
    .end local v1    # "e":Ljava/lang/Throwable;
    :catchall_99
    move-exception v5

    if-eqz v2, :cond_9f

    .line 234
    invoke-static {v2}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    :cond_9f
    throw v5
.end method
