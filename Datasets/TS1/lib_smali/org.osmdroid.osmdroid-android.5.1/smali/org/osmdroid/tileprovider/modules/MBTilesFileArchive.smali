.class public Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;
.super Ljava/lang/Object;
.source "MBTilesFileArchive.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/IArchiveFile;


# static fields
.field public static final COL_TILES_TILE_COLUMN:Ljava/lang/String; = "tile_column"

.field public static final COL_TILES_TILE_DATA:Ljava/lang/String; = "tile_data"

.field public static final COL_TILES_TILE_ROW:Ljava/lang/String; = "tile_row"

.field public static final COL_TILES_ZOOM_LEVEL:Ljava/lang/String; = "zoom_level"

.field public static final TABLE_TILES:Ljava/lang/String; = "tiles"


# instance fields
.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 2
    .param p1, "pDatabase"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 34
    return-void
.end method

.method public static getDatabaseFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;
    .registers 5
    .param p0, "pFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x11

    invoke-static {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 88
    return-void
.end method

.method public getInputStream(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)Ljava/io/InputStream;
    .registers 18
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 55
    const/4 v11, 0x0

    .line 56
    .local v11, "ret":Ljava/io/InputStream;
    const/4 v1, 0x1

    :try_start_2
    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "tile_data"

    aput-object v2, v3, v1

    .line 57
    .local v3, "tile":[Ljava/lang/String;
    const/4 v1, 0x3

    new-array v5, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v1

    const/4 v1, 0x1

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v2

    int-to-double v13, v2

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v2

    int-to-double v13, v2

    sub-double/2addr v6, v13

    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v6, v13

    invoke-static {v6, v7}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v1

    const/4 v1, 0x2

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v1

    .line 63
    .local v5, "xyz":[Ljava/lang/String;
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "tiles"

    const-string v4, "tile_column=? and tile_row=? and zoom_level=?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 65
    .local v9, "cur":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-eqz v1, :cond_5e

    .line 66
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 67
    new-instance v12, Ljava/io/ByteArrayInputStream;

    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-direct {v12, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .end local v11    # "ret":Ljava/io/InputStream;
    .local v12, "ret":Ljava/io/InputStream;
    move-object v11, v12

    .line 69
    .end local v12    # "ret":Ljava/io/InputStream;
    .restart local v11    # "ret":Ljava/io/InputStream;
    :cond_5e
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_61} :catch_64

    .line 70
    if-eqz v11, :cond_7f

    .line 77
    .end local v3    # "tile":[Ljava/lang/String;
    .end local v5    # "xyz":[Ljava/lang/String;
    .end local v9    # "cur":Landroid/database/Cursor;
    .end local v11    # "ret":Ljava/io/InputStream;
    :goto_63
    return-object v11

    .line 73
    .restart local v11    # "ret":Ljava/io/InputStream;
    :catch_64
    move-exception v10

    .line 74
    .local v10, "e":Ljava/lang/Throwable;
    const-string v1, "OsmDroid"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error getting db stream: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    .end local v10    # "e":Ljava/lang/Throwable;
    :cond_7f
    const/4 v11, 0x0

    goto :goto_63
.end method

.method public getTileSources()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    return-object v0
.end method

.method public init(Ljava/io/File;)V
    .registers 5
    .param p1, "pFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x11

    invoke-static {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DatabaseFileArchive [mDatabase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
