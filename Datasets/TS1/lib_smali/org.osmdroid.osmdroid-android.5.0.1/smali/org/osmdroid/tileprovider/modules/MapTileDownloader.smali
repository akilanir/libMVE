.class public Lorg/osmdroid/tileprovider/modules/MapTileDownloader;
.super Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;
.source "MapTileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;
    }
.end annotation


# instance fields
.field private final mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

.field private final mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

.field private final mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 3
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, p1, v0, v0}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;)V
    .registers 4
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pFilesystemCache"    # Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;)V
    .registers 10
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pFilesystemCache"    # Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    .param p3, "pNetworkAvailablityCheck"    # Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    .prologue
    .line 70
    const/4 v4, 0x2

    const/16 v5, 0x28

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;-><init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;II)V

    .line 73
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/modules/IFilesystemCache;Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;II)V
    .registers 7
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pFilesystemCache"    # Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    .param p3, "pNetworkAvailablityCheck"    # Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    .param p4, "pThreadPoolSize"    # I
    .param p5, "pPendingQueueSize"    # I

    .prologue
    .line 79
    invoke-direct {p0, p4, p5}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;-><init>(II)V

    .line 51
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    .line 81
    iput-object p2, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    .line 82
    iput-object p3, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    .line 83
    invoke-virtual {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V

    .line 84
    return-void
.end method

.method static synthetic access$000(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Ljava/util/concurrent/atomic/AtomicReference;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    return-object v0
.end method

.method static synthetic access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    return-object v0
.end method

.method static synthetic access$200(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    .registers 2
    .param p0, "x0"    # Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    return-object v0
.end method


# virtual methods
.method public getMaximumZoomLevel()I
    .registers 3

    .prologue
    .line 126
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 127
    .local v0, "tileSource":Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getMaximumZoomLevel()I

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
    .line 120
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 121
    .local v0, "tileSource":Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getMinimumZoomLevel()I

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
    .line 105
    const-string v0, "Online Tile Download Provider"

    return-object v0
.end method

.method protected getThreadGroupName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    const-string v0, "downloader"

    return-object v0
.end method

.method protected getTileLoader()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 115
    new-instance v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;

    invoke-direct {v0, p0}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)V

    return-object v0
.end method

.method public getTileSource()Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    return-object v0
.end method

.method public getUsesDataConnection()Z
    .registers 2

    .prologue
    .line 100
    const/4 v0, 0x1

    return v0
.end method

.method public setTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 4
    .param p1, "tileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 134
    instance-of v0, p1, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    if-eqz v0, :cond_c

    .line 135
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    check-cast p1, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .end local p1    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 140
    :goto_b
    return-void

    .line 138
    .restart local p1    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    :cond_c
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    goto :goto_b
.end method
