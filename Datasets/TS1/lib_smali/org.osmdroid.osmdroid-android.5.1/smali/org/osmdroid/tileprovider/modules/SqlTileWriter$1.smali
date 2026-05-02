.class Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;
.super Ljava/lang/Thread;
.source "SqlTileWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/osmdroid/tileprovider/modules/SqlTileWriter;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;


# direct methods
.method constructor <init>(Lorg/osmdroid/tileprovider/modules/SqlTileWriter;)V
    .registers 2

    .prologue
    .line 46
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 18

    .prologue
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 54
    .local v3, "now":J
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v9, v9, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v10, "tiles"

    const-string v11, "expires < ?"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    invoke-virtual/range {v14 .. v16}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-virtual {v9, v10, v11, v12}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 55
    .local v5, "rows":I
    const-string v9, "OsmDroid"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Local storage cahce purged "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " expired tiles in "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long/2addr v11, v3

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "ms, cache size is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v11, v11, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "bytes"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 61
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v9, v9, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v9

    sget-wide v11, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    cmp-long v9, v9, v11

    if-lez v9, :cond_e9

    .line 62
    sget-wide v9, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->TILE_MAX_CACHE_SIZE_BYTES:J

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v11, v11, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v11

    sub-long v1, v9, v11

    .line 63
    .local v1, "diff":J
    const-wide/16 v9, 0x1f40

    div-long v7, v1, v9

    .line 65
    .local v7, "tilesToKill":J
    :try_start_96
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v9, v9, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "DELETE FROM tiles ORDER BY expires DESC LIMIT "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_b2
    .catch Ljava/lang/Throwable; {:try_start_96 .. :try_end_b2} :catch_f5

    .line 70
    :goto_b2
    const-string v9, "OsmDroid"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "purge completed in "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long/2addr v11, v3

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "ms, cache size is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/osmdroid/tileprovider/modules/SqlTileWriter$1;->this$0:Lorg/osmdroid/tileprovider/modules/SqlTileWriter;

    iget-object v11, v11, Lorg/osmdroid/tileprovider/modules/SqlTileWriter;->db_file:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "bytes"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .end local v1    # "diff":J
    .end local v7    # "tilesToKill":J
    :cond_e9
    sget-boolean v9, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v9, :cond_f4

    .line 74
    const-string v9, "OsmDroid"

    const-string v10, "Finished init thread"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :cond_f4
    return-void

    .line 67
    .restart local v1    # "diff":J
    .restart local v7    # "tilesToKill":J
    :catch_f5
    move-exception v6

    .line 68
    .local v6, "t":Ljava/lang/Throwable;
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_b2
.end method
