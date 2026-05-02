.class public Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;
.super Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
.source "MapBoxTileSource.java"


# static fields
.field private static final ACCESS_TOKEN:Ljava/lang/String; = "ACCESS_TOKEN"

.field private static final MAPBOX_MAPID:Ljava/lang/String; = "MAPBOX_MAPID"

.field private static final mapBoxBaseUrl:[Ljava/lang/String;


# instance fields
.field private accessToken:Ljava/lang/String;

.field private mapBoxMapId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 22
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "http://api.tiles.mapbox.com/v4/"

    aput-object v2, v0, v1

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxBaseUrl:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .prologue
    .line 34
    const-string v1, "mapbox"

    const/4 v2, 0x1

    const/16 v3, 0x12

    const/16 v4, 0x100

    const-string v5, ".png"

    sget-object v6, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxBaseUrl:[Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 9
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 44
    const-string v1, "mapbox"

    const/4 v2, 0x1

    const/16 v3, 0x12

    const/16 v4, 0x100

    const-string v5, ".png"

    sget-object v6, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxBaseUrl:[Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 45
    invoke-virtual {p0, p1}, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->retrieveAccessToken(Landroid/content/Context;)V

    .line 46
    invoke-virtual {p0, p1}, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->retrieveMapBoxMapId(Landroid/content/Context;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "zoomMinLevel"    # I
    .param p3, "zoomMaxLevel"    # I
    .param p4, "tileSizePixels"    # I
    .param p5, "imageFilenameEnding"    # Ljava/lang/String;

    .prologue
    .line 73
    sget-object v6, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxBaseUrl:[Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "zoomMinLevel"    # I
    .param p3, "zoomMaxLevel"    # I
    .param p4, "tileSizePixels"    # I
    .param p5, "imageFilenameEnding"    # Ljava/lang/String;
    .param p6, "mapBoxMapId"    # Ljava/lang/String;
    .param p7, "mapBoxVersionBaseUrl"    # Ljava/lang/String;

    .prologue
    .line 88
    const/4 v0, 0x1

    new-array v6, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p7, v6, v0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "mapboxid"    # Ljava/lang/String;
    .param p2, "accesstoken"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v1, "mapbox"

    const/4 v2, 0x1

    const/16 v3, 0x12

    const/16 v4, 0x100

    const-string v5, ".png"

    sget-object v6, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxBaseUrl:[Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 58
    iput-object p2, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->accessToken:Ljava/lang/String;

    .line 59
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 60
    return-void
.end method


# virtual methods
.method public getAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getMapBoxMapId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    return-object v0
.end method

.method public getTileURLString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;
    .registers 6
    .param p1, "aMapTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .local v1, "url":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->getMapBoxMapId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    const-string v2, ".png"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string v2, "?access_token="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->getAccessToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "res":Ljava/lang/String;
    return-object v0
.end method

.method public final retrieveAccessToken(Landroid/content/Context;)V
    .registers 3
    .param p1, "aContext"    # Landroid/content/Context;

    .prologue
    .line 107
    const-string v0, "ACCESS_TOKEN"

    invoke-static {p1, v0}, Lorg/osmdroid/tileprovider/util/ManifestUtil;->retrieveKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->accessToken:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public final retrieveMapBoxMapId(Landroid/content/Context;)V
    .registers 3
    .param p1, "aContext"    # Landroid/content/Context;

    .prologue
    .line 98
    const-string v0, "MAPBOX_MAPID"

    invoke-static {p1, v0}, Lorg/osmdroid/tileprovider/util/ManifestUtil;->retrieveKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public setAccessToken(Ljava/lang/String;)V
    .registers 2
    .param p1, "accessTokeninput"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->accessToken:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setMapboxMapid(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/osmdroid/tileprovider/tilesource/MapBoxTileSource;->mapBoxMapId:Ljava/lang/String;

    .line 112
    return-void
.end method
