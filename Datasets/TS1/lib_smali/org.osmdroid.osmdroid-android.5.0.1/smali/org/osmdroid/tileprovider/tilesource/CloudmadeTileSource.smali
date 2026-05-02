.class public Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;
.super Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
.source "CloudmadeTileSource.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/tilesource/IStyledTileSource;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;",
        "Lorg/osmdroid/tileprovider/tilesource/IStyledTileSource",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mStyle:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V
    .registers 8
    .param p1, "pName"    # Ljava/lang/String;
    .param p2, "pZoomMinLevel"    # I
    .param p3, "pZoomMaxLevel"    # I
    .param p4, "pTileSizePixels"    # I
    .param p5, "pImageFilenameEnding"    # Ljava/lang/String;
    .param p6, "pBaseUrl"    # [Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct/range {p0 .. p6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 11
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    .line 18
    return-void
.end method


# virtual methods
.method public getStyle()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    return-object v0
.end method

.method public bridge synthetic getStyle()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 9
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->getStyle()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getTileURLString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;
    .registers 8
    .param p1, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 31
    invoke-static {}, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->getCloudmadeKey()Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_11

    .line 33
    const-string v2, "OsmDroid"

    const-string v3, "CloudMade key is not set. You should enter it in the manifest and call CloudmadeUtil.retrieveCloudmadeKey()"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :cond_11
    invoke-static {}, Lorg/osmdroid/tileprovider/util/CloudmadeUtil;->getCloudmadeToken()Ljava/lang/String;

    move-result-object v1

    .line 36
    .local v1, "token":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x8

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->getTileSizePixels()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x5

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x6

    iget-object v5, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mImageFilenameEnding:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x7

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public pathBase()Ljava/lang/String;
    .registers 3

    .prologue
    .line 22
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_10

    .line 23
    :cond_d
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mName:Ljava/lang/String;

    .line 25
    :goto_f
    return-object v0

    :cond_10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method public setStyle(Ljava/lang/Integer;)V
    .registers 2
    .param p1, "pStyle"    # Ljava/lang/Integer;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;

    .line 43
    return-void
.end method

.method public bridge synthetic setStyle(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 9
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->setStyle(Ljava/lang/Integer;)V

    return-void
.end method

.method public setStyle(Ljava/lang/String;)V
    .registers 6
    .param p1, "pStyle"    # Ljava/lang/String;

    .prologue
    .line 48
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;->mStyle:Ljava/lang/Integer;
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_a} :catch_b

    .line 52
    :goto_a
    return-void

    .line 49
    :catch_b
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v1, "OsmDroid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error setting integer style: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a
.end method
