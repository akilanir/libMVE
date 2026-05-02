.class public Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;
.super Lorg/osmdroid/tileprovider/modules/MapTileFileStorageProviderBase;
.source "MapTileFileArchiveProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;
    }
.end annotation


# instance fields
.field private final mArchiveFiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/osmdroid/tileprovider/modules/IArchiveFile;",
            ">;"
        }
    .end annotation
.end field

.field private final mSpecificArchivesProvided:Z

.field private final mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/osmdroid/tileprovider/tilesource/ITileSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 4
    .param p1, "pRegisterReceiver"    # Lorg/osmdroid/tileprovider/IRegisterReceiver;
    .param p2, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;[Lorg/osmdroid/tileprovider/modules/IArchiveFile;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;[Lorg/osmdroid/tileprovider/modules/IArchiveFile;)V
    .registers 7
    .param p1, "pRegisterReceiver"    # Lorg/osmdroid/tileprovider/IRegisterReceiver;
    .param p2, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p3, "pArchives"    # [Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    .prologue
    .line 57
    const/16 v1, 0x8

    const/16 v2, 0x28

    invoke-direct {p0, p1, v1, v2}, Lorg/osmdroid/tileprovider/modules/MapTileFileStorageProviderBase;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;II)V

    .line 40
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    .line 42
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    .line 60
    invoke-virtual {p0, p2}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 62
    if-nez p3, :cond_21

    .line 63
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mSpecificArchivesProvided:Z

    .line 64
    invoke-direct {p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->findArchiveFiles()V

    .line 72
    :cond_20
    return-void

    .line 66
    :cond_21
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mSpecificArchivesProvided:Z

    .line 67
    array-length v1, p3

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_27
    if-ltz v0, :cond_20

    .line 68
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    aget-object v2, p3, v0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    add-int/lit8 v0, v0, -0x1

    goto :goto_27
.end method

.method static synthetic access$000(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;)Ljava/util/concurrent/atomic/AtomicReference;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    .prologue
    .line 29
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic access$100(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;Lorg/osmdroid/tileprovider/MapTile;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)Ljava/io/InputStream;
    .registers 4
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;
    .param p1, "x1"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p2, "x2"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->getInputStream(Lorg/osmdroid/tileprovider/MapTile;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method private findArchiveFiles()V
    .registers 9

    .prologue
    .line 156
    iget-object v7, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 158
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->getSdCardAvailable()Z

    move-result v7

    if-nez v7, :cond_c

    .line 173
    :cond_b
    return-void

    .line 163
    :cond_c
    sget-object v2, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    .line 164
    .local v2, "cachePaths":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 165
    .local v4, "files":[Ljava/io/File;
    if-eqz v4, :cond_b

    .line 166
    move-object v1, v4

    .local v1, "arr$":[Ljava/io/File;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_17
    if-ge v5, v6, :cond_b

    aget-object v3, v1, v5

    .line 167
    .local v3, "file":Ljava/io/File;
    invoke-static {v3}, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->getArchiveFile(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    move-result-object v0

    .line 168
    .local v0, "archiveFile":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    if-eqz v0, :cond_26

    .line 169
    iget-object v7, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    :cond_26
    add-int/lit8 v5, v5, 0x1

    goto :goto_17
.end method

.method private declared-synchronized getInputStream(Lorg/osmdroid/tileprovider/MapTile;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)Ljava/io/InputStream;
    .registers 9
    .param p1, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p2, "tileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 177
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_43

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    .line 178
    .local v0, "archiveFile":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    if-eqz v0, :cond_7

    .line 179
    invoke-interface {v0, p2, p1}, Lorg/osmdroid/tileprovider/modules/IArchiveFile;->getInputStream(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)Ljava/io/InputStream;

    move-result-object v2

    .line 180
    .local v2, "in":Ljava/io/InputStream;
    if-eqz v2, :cond_7

    .line 181
    sget-boolean v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v3, :cond_41

    .line 182
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Found tile "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_1 .. :try_end_41} :catchall_45

    .line 189
    .end local v0    # "archiveFile":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    .end local v2    # "in":Ljava/io/InputStream;
    :cond_41
    :goto_41
    monitor-exit p0

    return-object v2

    :cond_43
    const/4 v2, 0x0

    goto :goto_41

    .line 177
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_45
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method public detach()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 141
    :goto_1
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_24

    .line 142
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    .line 143
    .local v0, "t":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    if-eqz v0, :cond_1e

    .line 144
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    invoke-interface {v1}, Lorg/osmdroid/tileprovider/modules/IArchiveFile;->close()V

    .line 145
    :cond_1e
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mArchiveFiles:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 147
    .end local v0    # "t":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    :cond_24
    invoke-super {p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileStorageProviderBase;->detach()V

    .line 148
    return-void
.end method

.method public getMaximumZoomLevel()I
    .registers 3

    .prologue
    .line 115
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 116
    .local v0, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-eqz v0, :cond_f

    invoke-interface {v0}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getMaximumZoomLevel()I

    move-result v1

    :goto_e
    return v1

    :cond_f
    invoke-static {}, Lmicrosoft/mappoint/TileSystem;->getMaximumZoomLevel()I

    move-result v1

    goto :goto_e
.end method

.method public getMinimumZoomLevel()I
    .registers 3

    .prologue
    .line 109
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 110
    .local v0, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-eqz v0, :cond_f

    invoke-interface {v0}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getMinimumZoomLevel()I

    move-result v1

    :goto_e
    return v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method protected getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 94
    const-string v0, "File Archive Provider"

    return-object v0
.end method

.method protected getThreadGroupName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    const-string v0, "filearchive"

    return-object v0
.end method

.method protected getTileLoader()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 104
    new-instance v0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;

    invoke-direct {v0, p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;)V

    return-object v0
.end method

.method public getUsesDataConnection()Z
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x0

    return v0
.end method

.method protected onMediaMounted()V
    .registers 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mSpecificArchivesProvided:Z

    if-nez v0, :cond_7

    .line 123
    invoke-direct {p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->findArchiveFiles()V

    .line 125
    :cond_7
    return-void
.end method

.method protected onMediaUnmounted()V
    .registers 2

    .prologue
    .line 129
    iget-boolean v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mSpecificArchivesProvided:Z

    if-nez v0, :cond_7

    .line 130
    invoke-direct {p0}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->findArchiveFiles()V

    .line 132
    :cond_7
    return-void
.end method

.method public setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 3
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 137
    return-void
.end method
