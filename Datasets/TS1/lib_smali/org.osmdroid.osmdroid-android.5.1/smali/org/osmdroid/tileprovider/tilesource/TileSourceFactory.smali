.class public Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;
.super Ljava/lang/Object;
.source "TileSourceFactory.java"


# static fields
.field public static final BASE_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final CLOUDMADESMALLTILES:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final CLOUDMADESTANDARDTILES:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final CYCLEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final DEFAULT_TILE_SOURCE:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final FIETS_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final HIKEBIKEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final MAPNIK:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final MAPQUESTAERIAL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final MAPQUESTAERIAL_US:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final MAPQUESTOSM:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final PUBLIC_TRANSPORT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final ROADS_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final USGS_SAT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field public static final USGS_TOPO:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

.field private static mTileSources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/osmdroid/tileprovider/tilesource/ITileSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 14

    .prologue
    const/4 v13, 0x3

    const/16 v3, 0x12

    const/16 v4, 0x100

    const/4 v12, 0x1

    const/4 v2, 0x0

    .line 75
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "Mapnik"

    const-string v5, ".png"

    new-array v6, v13, [Ljava/lang/String;

    const-string v7, "http://a.tile.openstreetmap.org/"

    aput-object v7, v6, v2

    const-string v7, "http://b.tile.openstreetmap.org/"

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "http://c.tile.openstreetmap.org/"

    aput-object v8, v6, v7

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPNIK:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 81
    new-instance v5, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v6, "CycleMap"

    const/16 v8, 0x11

    const-string v10, ".png"

    new-array v11, v13, [Ljava/lang/String;

    const-string v0, "http://a.tile.opencyclemap.org/cycle/"

    aput-object v0, v11, v2

    const-string v0, "http://b.tile.opencyclemap.org/cycle/"

    aput-object v0, v11, v12

    const/4 v0, 0x2

    const-string v1, "http://c.tile.opencyclemap.org/cycle/"

    aput-object v1, v11, v0

    move v7, v2

    move v9, v4

    invoke-direct/range {v5 .. v11}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v5, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->CYCLEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 87
    new-instance v5, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v6, "OSMPublicTransport"

    const/16 v8, 0x11

    const-string v10, ".png"

    new-array v11, v12, [Ljava/lang/String;

    const-string v0, "http://openptmap.org/tiles/"

    aput-object v0, v11, v2

    move v7, v2

    move v9, v4

    invoke-direct/range {v5 .. v11}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v5, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->PUBLIC_TRANSPORT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 91
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "MapquestOSM"

    const-string v5, ".jpg"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "http://otile1.mqcdn.com/tiles/1.0.0/map/"

    aput-object v7, v6, v2

    const-string v7, "http://otile2.mqcdn.com/tiles/1.0.0/map/"

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "http://otile3.mqcdn.com/tiles/1.0.0/map/"

    aput-object v8, v6, v7

    const-string v7, "http://otile4.mqcdn.com/tiles/1.0.0/map/"

    aput-object v7, v6, v13

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPQUESTOSM:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 98
    new-instance v5, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v6, "MapquestAerial"

    const/16 v8, 0xb

    const-string v10, ".jpg"

    const/4 v0, 0x4

    new-array v11, v0, [Ljava/lang/String;

    const-string v0, "http://otile1.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v0, v11, v2

    const-string v0, "http://otile2.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v0, v11, v12

    const/4 v0, 0x2

    const-string v1, "http://otile3.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v1, v11, v0

    const-string v0, "http://otile4.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v0, v11, v13

    move v7, v2

    move v9, v4

    invoke-direct/range {v5 .. v11}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v5, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPQUESTAERIAL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 108
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "MapquestAerialUSA"

    const-string v5, ".jpg"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const-string v7, "http://otile1.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v7, v6, v2

    const-string v7, "http://otile2.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "http://otile3.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v8, v6, v7

    const-string v7, "http://otile4.mqcdn.com/tiles/1.0.0/sat/"

    aput-object v7, v6, v13

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPQUESTAERIAL_US:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 115
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPNIK:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->DEFAULT_TILE_SOURCE:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 120
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;

    const-string v1, "CloudMadeStandardTiles"

    const-string v5, ".png"

    new-array v6, v13, [Ljava/lang/String;

    const-string v7, "http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v7, v6, v2

    const-string v7, "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v8, v6, v7

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->CLOUDMADESTANDARDTILES:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 127
    new-instance v5, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;

    const-string v6, "CloudMadeSmallTiles"

    const/16 v8, 0x15

    const/16 v9, 0x40

    const-string v10, ".png"

    new-array v11, v13, [Ljava/lang/String;

    const-string v0, "http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v0, v11, v2

    const-string v0, "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v0, v11, v12

    const/4 v0, 0x2

    const-string v1, "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"

    aput-object v1, v11, v0

    move v7, v2

    invoke-direct/range {v5 .. v11}, Lorg/osmdroid/tileprovider/tilesource/CloudmadeTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v5, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->CLOUDMADESMALLTILES:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 136
    new-instance v5, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v6, "Fiets"

    const-string v10, ".png"

    new-array v11, v12, [Ljava/lang/String;

    const-string v0, "http://overlay.openstreetmap.nl/openfietskaart-overlay/"

    aput-object v0, v11, v2

    move v7, v13

    move v8, v3

    move v9, v4

    invoke-direct/range {v5 .. v11}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v5, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->FIETS_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 140
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "BaseNL"

    const-string v5, ".png"

    new-array v6, v12, [Ljava/lang/String;

    const-string v7, "http://overlay.openstreetmap.nl/basemap/"

    aput-object v7, v6, v2

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->BASE_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 144
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "RoadsNL"

    const-string v5, ".png"

    new-array v6, v12, [Ljava/lang/String;

    const-string v7, "http://overlay.openstreetmap.nl/roads/"

    aput-object v7, v6, v2

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->ROADS_OVERLAY_NL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 148
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;

    const-string v1, "HikeBikeMap"

    const-string v5, ".png"

    new-array v6, v13, [Ljava/lang/String;

    const-string v7, "http://a.tiles.wmflabs.org/hikebike/"

    aput-object v7, v6, v2

    const-string v7, "http://b.tiles.wmflabs.org/hikebike/"

    aput-object v7, v6, v12

    const/4 v7, 0x2

    const-string v8, "http://c.tiles.wmflabs.org/hikebike/"

    aput-object v8, v6, v7

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/XYTileSource;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->HIKEBIKEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 154
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory$1;

    const-string v1, "USGS National Map Topo"

    const-string v5, ""

    new-array v6, v12, [Ljava/lang/String;

    const-string v7, "http://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/"

    aput-object v7, v6, v2

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory$1;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_TOPO:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 161
    new-instance v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory$2;

    const-string v1, "USGS National Map Sat"

    const-string v5, ""

    new-array v6, v12, [Ljava/lang/String;

    const-string v7, "http://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/"

    aput-object v7, v6, v2

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory$2;-><init>(Ljava/lang/String;IIILjava/lang/String;[Ljava/lang/String;)V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_SAT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 172
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    .line 173
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPNIK:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->CYCLEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->PUBLIC_TRANSPORT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPQUESTOSM:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->MAPQUESTAERIAL:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->HIKEBIKEMAP:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_TOPO:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    sget-object v1, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->USGS_SAT:Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addTileSource(Lorg/osmdroid/tileprovider/tilesource/ITileSource;)V
    .registers 2
    .param p0, "mTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .prologue
    .line 72
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    return-void
.end method

.method public static containsTileSource(Ljava/lang/String;)Z
    .registers 4
    .param p0, "aName"    # Ljava/lang/String;

    .prologue
    .line 32
    sget-object v2, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 33
    .local v1, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    invoke-interface {v1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 34
    const/4 v2, 0x1

    .line 37
    .end local v1    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    :goto_1d
    return v2

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1d
.end method

.method public static getTileSource(I)Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .registers 6
    .param p0, "aOrdinal"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 50
    sget-object v2, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 51
    .local v1, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    invoke-interface {v1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->ordinal()I

    move-result v2

    if-ne v2, p0, :cond_6

    .line 52
    return-object v1

    .line 55
    .end local v1    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    :cond_19
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No tile source at position: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getTileSource(Ljava/lang/String;)Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .registers 6
    .param p0, "aName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 23
    sget-object v2, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/osmdroid/tileprovider/tilesource/ITileSource;

    .line 24
    .local v1, "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    invoke-interface {v1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 25
    return-object v1

    .line 28
    .end local v1    # "tileSource":Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    :cond_1d
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No such tile source: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getTileSources()Ljava/util/List;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/osmdroid/tileprovider/tilesource/ITileSource;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    sget-object v0, Lorg/osmdroid/tileprovider/tilesource/TileSourceFactory;->mTileSources:Ljava/util/List;

    return-object v0
.end method
