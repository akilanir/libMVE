.class public Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;
.super Ljava/lang/Object;
.source "DatabaseFileArchive.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/IArchiveFile;


# static fields
.field public static final TABLE:Ljava/lang/String; = "tiles"


# instance fields
.field private mDatabase:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 2
    .param p1, "pDatabase"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 35
    return-void
.end method

.method public static getDatabaseFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;
    .registers 5
    .param p0, "pFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 108
    return-void
.end method

.method public getImage(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)[B
    .registers 24
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 66
    const/4 v10, 0x0

    .line 67
    .local v10, "bits":[B
    const/4 v2, 0x1

    :try_start_2
    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "tile"

    aput-object v3, v4, v2

    .line 68
    .local v4, "tile":[Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v2

    int-to-long v15, v2

    .line 69
    .local v15, "x":J
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v2

    int-to-long v0, v2

    move-wide/from16 v17, v0

    .line 70
    .local v17, "y":J
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v2

    int-to-long v0, v2

    move-wide/from16 v19, v0

    .line 71
    .local v19, "z":J
    move-wide/from16 v0, v19

    long-to-int v2, v0

    shl-long v2, v19, v2

    add-long/2addr v2, v15

    move-wide/from16 v0, v19

    long-to-int v5, v0

    shl-long/2addr v2, v5

    add-long v13, v2, v17

    .line 72
    .local v13, "index":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v3, "tiles"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "key = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and provider = \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface/range {p1 .. p1}, Lorg/osmdroid/tileprovider/tilesource/ITileSource;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 74
    .local v11, "cur":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-eqz v2, :cond_6b

    .line 75
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 76
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v10

    .line 78
    :cond_6b
    invoke-interface {v11}, Landroid/database/Cursor;->close()V
    :try_end_6e
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_6e} :catch_71

    .line 79
    if-eqz v10, :cond_8c

    .line 86
    .end local v4    # "tile":[Ljava/lang/String;
    .end local v10    # "bits":[B
    .end local v11    # "cur":Landroid/database/Cursor;
    .end local v13    # "index":J
    .end local v15    # "x":J
    .end local v17    # "y":J
    .end local v19    # "z":J
    :goto_70
    return-object v10

    .line 82
    .restart local v10    # "bits":[B
    :catch_71
    move-exception v12

    .line 83
    .local v12, "e":Ljava/lang/Throwable;
    const-string v2, "OsmDroid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error getting db stream: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    .end local v12    # "e":Ljava/lang/Throwable;
    :cond_8c
    const/4 v10, 0x0

    goto :goto_70
.end method

.method public getInputStream(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)Ljava/io/InputStream;
    .registers 9
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 92
    const/4 v2, 0x0

    .line 93
    .local v2, "ret":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->getImage(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)[B

    move-result-object v0

    .line 94
    .local v0, "bits":[B
    if-eqz v0, :cond_c

    .line 95
    new-instance v2, Ljava/io/ByteArrayInputStream;

    .end local v2    # "ret":Ljava/io/InputStream;
    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_c} :catch_f

    .line 96
    .restart local v2    # "ret":Ljava/io/InputStream;
    :cond_c
    if-eqz v2, :cond_28

    .line 102
    .end local v0    # "bits":[B
    .end local v2    # "ret":Ljava/io/InputStream;
    :goto_e
    return-object v2

    .line 99
    :catch_f
    move-exception v1

    .line 100
    .local v1, "e":Ljava/lang/Throwable;
    const-string v3, "OsmDroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error getting db stream: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_28
    const/4 v2, 0x0

    goto :goto_e
.end method

.method public getTileSources()Ljava/util/Set;
    .registers 8
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
    .line 44
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 46
    .local v2, "ret":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v4, 0x1

    :try_start_6
    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "provider"

    aput-object v5, v3, v4

    .line 47
    .local v3, "tile":[Ljava/lang/String;
    iget-object v4, p0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "SELECT distinct provider FROM tiles"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 48
    .local v0, "cur":Landroid/database/Cursor;
    :goto_16
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 49
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_24} :catch_25

    goto :goto_16

    .line 52
    .end local v0    # "cur":Landroid/database/Cursor;
    .end local v3    # "tile":[Ljava/lang/String;
    :catch_25
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "OsmDroid"

    const-string v5, "Error getting tile sources: "

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2d
    return-object v2

    .line 51
    .restart local v0    # "cur":Landroid/database/Cursor;
    .restart local v3    # "tile":[Ljava/lang/String;
    :cond_2e
    :try_start_2e
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_31} :catch_25

    goto :goto_2d
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
    .line 60
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 61
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DatabaseFileArchive [mDatabase="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

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
