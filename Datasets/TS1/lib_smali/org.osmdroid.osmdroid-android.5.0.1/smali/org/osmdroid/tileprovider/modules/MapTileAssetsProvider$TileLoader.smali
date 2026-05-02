.class public Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;
.super Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;
.source "MapTileAssetsProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "TileLoader"
.end annotation


# instance fields
.field private mAssets:Landroid/content/res/AssetManager;

.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;


# direct methods
.method public constructor <init>(Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;Landroid/content/res/AssetManager;)V
    .registers 4
    .param p2, "pAssets"    # Landroid/content/res/AssetManager;

    .prologue
    .line 125
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;

    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->mAssets:Landroid/content/res/AssetManager;

    .line 126
    iput-object p2, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->mAssets:Landroid/content/res/AssetManager;

    .line 127
    return-void
.end method


# virtual methods
.method public loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 131
    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v6}, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 132
    .local v4, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    if-nez v4, :cond_11

    move-object v0, v5

    .line 151
    :cond_10
    :goto_10
    return-object v0

    .line 136
    :cond_11
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v3

    .line 139
    .local v3, "tile":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_15
    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->mAssets:Landroid/content/res/AssetManager;

    invoke-interface {v4, v3}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getTileRelativeFilenameString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 140
    .local v2, "is":Ljava/io/InputStream;
    invoke-interface {v4, v2}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 141
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_10

    .line 142
    invoke-static {v0}, Lorg/osmdroid/tileprovider/ExpirableBitmapDrawable;->setDrawableExpired(Landroid/graphics/drawable/Drawable;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_28} :catch_29
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_15 .. :try_end_28} :catch_2c

    goto :goto_10

    .line 145
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v2    # "is":Ljava/io/InputStream;
    :catch_29
    move-exception v6

    move-object v0, v5

    .line 151
    goto :goto_10

    .line 146
    :catch_2c
    move-exception v1

    .line 147
    .local v1, "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    new-instance v5, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    iget-object v6, p0, Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileAssetsProvider;

    invoke-direct {v5, v6, v1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v5
.end method
