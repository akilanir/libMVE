.class public Lorg/osmdroid/tileprovider/MapTileProviderBasic;
.super Lorg/osmdroid/tileprovider/MapTileProviderArray;
.source "MapTileProviderBasic.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/IMapTileProviderCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "pContext"    # Landroid/content/Context;

    .prologue
    .line 32
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->DEFAULT_TILE_SOURCE:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-direct {p0, p1, v0}, Lorg/osmdroid/tileprovider/MapTileProviderBasic;-><init>(Landroid/content/Context;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 5
    .param p1, "pContext"    # Landroid/content/Context;
    .param p2, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 39
    new-instance v0, Lorg/osmdroid/tileprovider/util/SimpleRegisterReceiver;

    invoke-direct {v0, p1}, Lorg/osmdroid/tileprovider/util/SimpleRegisterReceiver;-><init>(Landroid/content/Context;)V

    new-instance v1, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;

    invoke-direct {v1, p1}, Lorg/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, v1, p2, p1}, Lorg/osmdroid/tileprovider/MapTileProviderBasic;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;Lorg/osmdroid/tileprovider/tilesource/ITileSource;Landroid/content/Context;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;Lorg/osmdroid/tileprovider/tilesource/ITileSource;Landroid/content/Context;)V
    .registers 11
    .param p1, "pRegisterReceiver"    # Lorg/osmdroid/tileprovider/IRegisterReceiver;
    .param p2, "aNetworkAvailablityCheck"    # Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    .param p3, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p4, "pContext"    # Landroid/content/Context;

    .prologue
    .line 49
    invoke-direct {p0, p3, p1}, Lorg/osmdroid/tileprovider/MapTileProviderArray;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/IRegisterReceiver;)V

    .line 51
    new-instance v4, Lorg/osmdroid/tileprovider/modules/TileWriter;

    invoke-direct {v4}, Lorg/osmdroid/tileprovider/modules/TileWriter;-><init>()V

    .line 53
    .local v4, "tileWriter":Lorg/osmdroid/tileprovider/modules/TileWriter;
    new-instance v1, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;

    invoke-virtual {p4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    invoke-direct {v1, p1, v5, p3}, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Landroid/content/res/AssetManager;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 55
    .local v1, "assetsProvider":Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;
    iget-object v5, p0, Lorg/osmdroid/tileprovider/MapTileProviderBasic;->mTileProviderList:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    new-instance v3, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;

    invoke-direct {v3, p1, p3}, Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 59
    .local v3, "fileSystemProvider":Lorg/osmdroid/tileprovider/modules/MapTileFilesystemProvider;
    iget-object v5, p0, Lorg/osmdroid/tileprovider/MapTileProviderBasic;->mTileProviderList:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    new-instance v0, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;

    invoke-direct {v0, p1, p3}, Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;-><init>(Lorg/osmdroid/tileprovider/IRegisterReceiver;Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 63
    .local v0, "archiveProvider":Lorg/osmdroid/tileprovider/modules/MapTileFileArchiveProvider;
    iget-object v5, p0, Lorg/osmdroid/tileprovider/MapTileProviderBasic;->mTileProviderList:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    new-instance v2, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-direct {v2, p3, v4, p2}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;)V

    .line 67
    .local v2, "downloaderProvider":Lorg/osmdroid/tileprovider/modules/MapTileDownloader;
    iget-object v5, p0, Lorg/osmdroid/tileprovider/MapTileProviderBasic;->mTileProviderList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    return-void
.end method
