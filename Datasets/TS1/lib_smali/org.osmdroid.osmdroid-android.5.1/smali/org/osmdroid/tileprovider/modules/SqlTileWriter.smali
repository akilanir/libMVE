.class public Lorg/osmdroid/tileprovider/modules/SqlTileWriter;
.super Ljava/lang/Object;
.source "SqlTileWriter.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/IFilesystemCache;


# instance fields
.field final db:Landroid/database/sqlite/SQLiteDatabase;

.field final db_file:Ljava/io/File;

.field final questimate:I


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/16 v1, 0x1f40

    iput v1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->questimate:I

    .line 37
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_PATH_BASE:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "cache.db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    .line 38
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 40
    :try_start_36
    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "CREATE TABLE tiles (key INTEGER , provider TEXT, tile BLOB, expires INTEGER, PRIMARY KEY (key, provider));"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_3d} :catch_4a

    .line 46
    :goto_3d
    new-instance v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;

    invoke-direct {v0, p0}, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;-><init>(Lorg/osmdroid/tileprovider/modules/SqlTileWriter;)V

    .line 78
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 79
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 80
    return-void

    .line 42
    .end local v0    # "t":Ljava/lang/Thread;
    :catch_4a
    move-exception v0

    .line 44
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3d
.end method


# virtual methods
.method public saveFile(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;Ljava/io/InputStream;)Z
    .registers 29
    .param p1, "pTileSourceInfo"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;
    .param p3, "pStream"    # Ljava/io/InputStream;

    .prologue
    .line 85
    :try_start_0
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 86
    .local v6, "cv":Landroid/content/ContentValues;
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v18

    move/from16 v0, v18

    int-to-long v12, v0

    .line 87
    .local v12, "x":J
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v18

    move/from16 v0, v18

    int-to-long v14, v0

    .line 88
    .local v14, "y":J
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .line 89
    .local v16, "z":J
    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v18, v0

    shl-long v18, v16, v18

    add-long v18, v18, v12

    move-wide/from16 v0, v16

    long-to-int v0, v0

    move/from16 v20, v0

    shl-long v18, v18, v20

    add-long v9, v18, v14

    .line 90
    .local v9, "index":J
    const-string v18, "provider"

    invoke-interface/range {p1 .. p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    new-instance v3, Ljava/io/BufferedInputStream;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 93
    .local v3, "bis":Ljava/io/BufferedInputStream;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .local v11, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    const/4 v5, 0x0

    .line 96
    .local v5, "current":I
    :goto_48
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->read()I

    move-result v5

    const/16 v18, -0x1

    move/from16 v0, v18

    if-eq v5, v0, :cond_91

    .line 97
    int-to-byte v0, v5

    move/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_5e
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5e} :catch_5f

    goto :goto_48

    .line 110
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .end local v5    # "current":I
    .end local v6    # "cv":Landroid/content/ContentValues;
    .end local v9    # "index":J
    .end local v11    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    .end local v12    # "x":J
    .end local v14    # "y":J
    .end local v16    # "z":J
    :catch_5f
    move-exception v7

    .line 111
    .local v7, "ex":Ljava/lang/Throwable;
    const-string v18, "OsmDroid"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Unable to store cached tile from "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-interface/range {p1 .. p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 113
    .end local v7    # "ex":Ljava/lang/Throwable;
    :goto_8e
    const/16 v18, 0x0

    return v18

    .line 100
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v5    # "current":I
    .restart local v6    # "cv":Landroid/content/ContentValues;
    .restart local v9    # "index":J
    .restart local v11    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Byte;>;"
    .restart local v12    # "x":J
    .restart local v14    # "y":J
    .restart local v16    # "z":J
    :cond_91
    :try_start_91
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    new-array v4, v0, [B

    .line 101
    .local v4, "bits":[B
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_9a
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    if-ge v8, v0, :cond_b1

    invoke-interface {v11, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Byte;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Byte;->byteValue()B

    move-result v18

    aput-byte v18, v4, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_9a

    .line 102
    :cond_b1
    const-string v18, "key"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 103
    const-string v18, "tile"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 105
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getExpires()Ljava/util/Date;

    move-result-object v18

    if-eqz v18, :cond_e0

    .line 106
    const-string v18, "expires"

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getExpires()Ljava/util/Date;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v6, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 107
    :cond_e0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v18, v0

    const-string v19, "tiles"

    const-string v20, "key=? and provider=?"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ""

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-interface/range {p1 .. p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-virtual/range {v18 .. v21}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v18, v0

    const-string v19, "tiles"

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 109
    const-string v18, "OsmDroid"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "tile inserted "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-interface/range {p1 .. p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_14d
    .catch Ljava/lang/Throwable; {:try_start_91 .. :try_end_14d} :catch_5f

    goto/16 :goto_8e
.end method
