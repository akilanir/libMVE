.class public Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;
.super Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;
.source "MapTileFilesystemProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "TileLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;)V
    .registers 2

    .prologue
    .line 131
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    return-void
.end method


# virtual methods
.method public loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .registers 15
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 136
    iget-object v10, p0, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v10}, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 137
    .local v9, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-nez v9, :cond_10

    .line 181
    :cond_f
    :goto_f
    return-object v0

    .line 141
    :cond_10
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v8

    .line 144
    .local v8, "tile":Lorg/osmdroid/tileprovider/MapTile;
    iget-object v10, p0, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    invoke-virtual {v10}, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;->getSdCardAvailable()Z

    move-result v10

    if-nez v10, :cond_39

    .line 145
    sget-boolean v10, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v10, :cond_f

    .line 146
    const-string v10, "OsmDroid"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "No sdcard - do nothing for tile: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f

    .line 153
    :cond_39
    new-instance v2, Ljava/io/File;

    sget-object v10, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v9, v8}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileRelativeFilenameString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".tile"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v2, v10, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 155
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_f

    .line 158
    :try_start_5d
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getDrawable(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 161
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 162
    .local v6, "now":J
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .line 163
    .local v4, "lastModified":J
    iget-object v10, p0, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;->mMaximumCachedFileAge:J
    invoke-static {v10}, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;)J

    move-result-wide v10

    sub-long v10, v6, v10

    cmp-long v10, v4, v10

    if-gez v10, :cond_ca

    const/4 v3, 0x1

    .line 165
    .local v3, "fileExpired":Z
    :goto_7a
    if-eqz v3, :cond_f

    if-eqz v0, :cond_f

    .line 166
    sget-boolean v10, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v10, :cond_9a

    .line 167
    const-string v10, "OsmDroid"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Tile expired: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_9a
    invoke-static {v0}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->setDrawableExpired(Landroid/graphics/drawable/Drawable;)V
    :try_end_9d
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_5d .. :try_end_9d} :catch_9f

    goto/16 :goto_f

    .line 173
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v3    # "fileExpired":Z
    .end local v4    # "lastModified":J
    .end local v6    # "now":J
    :catch_9f
    move-exception v1

    .line 175
    .local v1, "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    const-string v10, "OsmDroid"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "LowMemoryException downloading MapTile: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    new-instance v10, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    iget-object v11, p0, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    invoke-direct {v10, v11, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v10

    .line 163
    .end local v1    # "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    .restart local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v4    # "lastModified":J
    .restart local v6    # "now":J
    :cond_ca
    const/4 v3, 0x0

    goto :goto_7a
.end method
