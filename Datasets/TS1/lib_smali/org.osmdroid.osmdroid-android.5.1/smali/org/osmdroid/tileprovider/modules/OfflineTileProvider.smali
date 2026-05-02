.class public Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;
.super Lorg/osmdroid/tileprovider/MapTileProviderArray;
.source "OfflineTileProvider.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/IMapTileProviderCallback;


# instance fields
.field archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;[Ljava/io/File;)V
    .registers 10
    .param p1, "pRegisterReceiver"    # Lorg/osmdroid/tileprovider/IRegisterReceiver;
    .param p2, "source"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    const/4 v3, 0x0

    aget-object v3, p2, v3

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/osmdroid/tileprovider/tilesource/FileBasedTileSource;->getSource(Ljava/lang/String;)Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lorg/osmdroid/tileprovider/MapTileProviderArray;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/IRegisterReceiver;)V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v0, "files":Ljava/util/List;, "Ljava/util/List<Lorg/osmdroid/tileprovider/modules/IArchiveFile;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v3, p2

    if-ge v1, v3, :cond_46

    .line 36
    aget-object v3, p2, v1

    invoke-static {v3}, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->getArchiveFile(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    move-result-object v2

    .line 37
    .local v2, "temp":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    if-eqz v2, :cond_25

    .line 38
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 40
    :cond_25
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Skipping "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p2, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", no tile provider is registered to handle the file extension"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_22

    .line 43
    .end local v2    # "temp":Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    :cond_46
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    iput-object v3, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    .line 44
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    iput-object v3, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    .line 46
    iget-object v3, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->mTileProviderList:Ljava/util/List;

    new-instance v4, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    move-result-object v5

    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    invoke-direct {v4, p1, v5, v6}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;[Lorg/osmdroid/tileprovider/modules/IArchiveFile;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method


# virtual methods
.method public getArchives()[Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/OfflineTileProvider;->archives:[Lorg/osmdroid/tileprovider/modules/IArchiveFile;

    return-object v0
.end method
