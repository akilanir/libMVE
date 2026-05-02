.class public Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;
.super Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;
.source "MapTileDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/osmdroid/tileprovider/modules/MapTileDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "TileLoader"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;


# direct methods
.method protected constructor <init>(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)V
    .registers 2

    .prologue
    .line 153
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    return-void
.end method


# virtual methods
.method public loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .registers 23
    .param p1, "aState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
        }
    .end annotation

    .prologue
    .line 158
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v17, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 159
    .local v15, "tileSource":Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
    if-nez v15, :cond_14

    .line 160
    const/4 v13, 0x0

    .line 252
    :goto_13
    return-object v13

    .line 163
    :cond_14
    const/4 v10, 0x0

    .line 164
    .local v10, "in":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 165
    .local v11, "out":Ljava/io/OutputStream;
    const/4 v3, 0x0

    .line 166
    .local v3, "c":Ljava/net/HttpURLConnection;
    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v14

    .line 170
    .local v14, "tile":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v17, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v17

    if-eqz v17, :cond_70

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v17, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;->getNetworkAvailable()Z

    move-result v17

    if-nez v17, :cond_70

    .line 172
    sget-boolean v17, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v17, :cond_63

    .line 173
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Skipping "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " due to NetworkAvailabliltyCheck."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_63
    .catch Ljava/net/UnknownHostException; {:try_start_1b .. :try_end_63} :catch_2d6
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_1b .. :try_end_63} :catch_1f7
    .catch Ljava/io/FileNotFoundException; {:try_start_1b .. :try_end_63} :catch_22e
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_63} :catch_261
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_63} :catch_294
    .catchall {:try_start_1b .. :try_end_63} :catchall_1ec

    .line 175
    :cond_63
    const/4 v13, 0x0

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_6a
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6d} :catch_6e

    goto :goto_13

    .line 249
    :catch_6e
    move-exception v17

    goto :goto_13

    .line 178
    :cond_70
    :try_start_70
    invoke-virtual {v15, v14}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getTileURLString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v16

    .line 180
    .local v16, "tileURLString":Ljava/lang/String;
    sget-boolean v17, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v17, :cond_94

    .line 181
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Downloading Maptile from url: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_94
    invoke-static/range {v16 .. v16}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_97
    .catch Ljava/net/UnknownHostException; {:try_start_70 .. :try_end_97} :catch_2d6
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_70 .. :try_end_97} :catch_1f7
    .catch Ljava/io/FileNotFoundException; {:try_start_70 .. :try_end_97} :catch_22e
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_97} :catch_261
    .catch Ljava/lang/Throwable; {:try_start_70 .. :try_end_97} :catch_294
    .catchall {:try_start_70 .. :try_end_97} :catchall_1ec

    move-result v17

    if-eqz v17, :cond_a9

    .line 185
    const/4 v13, 0x0

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_a1
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_a4} :catch_a6

    goto/16 :goto_13

    .line 249
    :catch_a6
    move-exception v17

    goto/16 :goto_13

    .line 188
    :cond_a9
    :try_start_a9
    new-instance v17, Ljava/net/URL;

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v17

    move-object/from16 v0, v17

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v3, v0

    .line 189
    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 190
    sget-object v17, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT:Ljava/lang/String;

    invoke-static {}, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->getUserAgentValue()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v3, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->connect()V

    .line 196
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v17

    const/16 v18, 0xc8

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_115

    .line 197
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Problem downloading MapTile: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " HTTP response: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_106
    .catch Ljava/net/UnknownHostException; {:try_start_a9 .. :try_end_106} :catch_2d6
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_a9 .. :try_end_106} :catch_1f7
    .catch Ljava/io/FileNotFoundException; {:try_start_a9 .. :try_end_106} :catch_22e
    .catch Ljava/io/IOException; {:try_start_a9 .. :try_end_106} :catch_261
    .catch Ljava/lang/Throwable; {:try_start_a9 .. :try_end_106} :catch_294
    .catchall {:try_start_a9 .. :try_end_106} :catchall_1ec

    .line 198
    const/4 v13, 0x0

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_10d
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_110
    .catch Ljava/lang/Exception; {:try_start_10d .. :try_end_110} :catch_112

    goto/16 :goto_13

    .line 249
    :catch_112
    move-exception v17

    goto/16 :goto_13

    .line 202
    :cond_115
    :try_start_115
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    .line 204
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 205
    .local v5, "dataStream":Ljava/io/ByteArrayOutputStream;
    new-instance v12, Ljava/io/BufferedOutputStream;

    const/16 v17, 0x2000

    move/from16 v0, v17

    invoke-direct {v12, v5, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_127
    .catch Ljava/net/UnknownHostException; {:try_start_115 .. :try_end_127} :catch_2d6
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_115 .. :try_end_127} :catch_1f7
    .catch Ljava/io/FileNotFoundException; {:try_start_115 .. :try_end_127} :catch_22e
    .catch Ljava/io/IOException; {:try_start_115 .. :try_end_127} :catch_261
    .catch Ljava/lang/Throwable; {:try_start_115 .. :try_end_127} :catch_294
    .catchall {:try_start_115 .. :try_end_127} :catchall_1ec

    .line 206
    .end local v11    # "out":Ljava/io/OutputStream;
    .local v12, "out":Ljava/io/OutputStream;
    :try_start_127
    new-instance v6, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    sget-wide v19, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->MAX_CACHED_TILE_AGE:J

    add-long v17, v17, v19

    move-wide/from16 v0, v17

    invoke-direct {v6, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 207
    .local v6, "dateExpires":Ljava/util/Date;
    const-string v17, "Expires"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 208
    .local v9, "expires":Ljava/lang/String;
    if-eqz v9, :cond_14e

    invoke-virtual {v9}, Ljava/lang/String;->length()I
    :try_end_143
    .catch Ljava/net/UnknownHostException; {:try_start_127 .. :try_end_143} :catch_1b4
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_127 .. :try_end_143} :catch_2d2
    .catch Ljava/io/FileNotFoundException; {:try_start_127 .. :try_end_143} :catch_2ce
    .catch Ljava/io/IOException; {:try_start_127 .. :try_end_143} :catch_2cb
    .catch Ljava/lang/Throwable; {:try_start_127 .. :try_end_143} :catch_2c8
    .catchall {:try_start_127 .. :try_end_143} :catchall_2c4

    move-result v17

    if-lez v17, :cond_14e

    .line 210
    :try_start_146
    sget-object v17, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->HTTP_HEADER_SDF:Ljava/text/SimpleDateFormat;

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_14d
    .catch Ljava/lang/Exception; {:try_start_146 .. :try_end_14d} :catch_190
    .catch Ljava/net/UnknownHostException; {:try_start_146 .. :try_end_14d} :catch_1b4
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_146 .. :try_end_14d} :catch_2d2
    .catch Ljava/io/FileNotFoundException; {:try_start_146 .. :try_end_14d} :catch_2ce
    .catch Ljava/io/IOException; {:try_start_146 .. :try_end_14d} :catch_2cb
    .catch Ljava/lang/Throwable; {:try_start_146 .. :try_end_14d} :catch_2c8
    .catchall {:try_start_146 .. :try_end_14d} :catchall_2c4

    move-result-object v6

    .line 216
    :cond_14e
    :goto_14e
    :try_start_14e
    invoke-virtual {v14, v6}, Lorg/osmdroid/tileprovider/MapTile;->setExpires(Ljava/util/Date;)V

    .line 217
    invoke-static {v10, v12}, Lorg/osmdroid/tileprovider/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 218
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V

    .line 219
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 220
    .local v4, "data":[B
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 223
    .local v2, "byteStream":Ljava/io/ByteArrayInputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v17, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v17

    if-eqz v17, :cond_17e

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v17, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static/range {v17 .. v17}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v0, v15, v14, v2}, Lorg/osmdroid/tileprovider/modules/IFilesystemCache;->saveFile(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;Ljava/io/InputStream;)Z

    .line 225
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 227
    :cond_17e
    invoke-virtual {v15, v2}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    :try_end_181
    .catch Ljava/net/UnknownHostException; {:try_start_14e .. :try_end_181} :catch_1b4
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_14e .. :try_end_181} :catch_2d2
    .catch Ljava/io/FileNotFoundException; {:try_start_14e .. :try_end_181} :catch_2ce
    .catch Ljava/io/IOException; {:try_start_14e .. :try_end_181} :catch_2cb
    .catch Ljava/lang/Throwable; {:try_start_14e .. :try_end_181} :catch_2c8
    .catchall {:try_start_14e .. :try_end_181} :catchall_2c4

    move-result-object v13

    .line 245
    .local v13, "result":Landroid/graphics/drawable/Drawable;
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v12}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_188
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_18b
    .catch Ljava/lang/Exception; {:try_start_188 .. :try_end_18b} :catch_18d

    goto/16 :goto_13

    .line 249
    :catch_18d
    move-exception v17

    goto/16 :goto_13

    .line 211
    .end local v2    # "byteStream":Ljava/io/ByteArrayInputStream;
    .end local v4    # "data":[B
    .end local v13    # "result":Landroid/graphics/drawable/Drawable;
    :catch_190
    move-exception v8

    .line 212
    .local v8, "ex":Ljava/lang/Exception;
    :try_start_191
    sget-boolean v17, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->DEBUG:Z

    if-eqz v17, :cond_14e

    .line 213
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unable to parse expiration tag for tile, using default, server returned "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1b3
    .catch Ljava/net/UnknownHostException; {:try_start_191 .. :try_end_1b3} :catch_1b4
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_191 .. :try_end_1b3} :catch_2d2
    .catch Ljava/io/FileNotFoundException; {:try_start_191 .. :try_end_1b3} :catch_2ce
    .catch Ljava/io/IOException; {:try_start_191 .. :try_end_1b3} :catch_2cb
    .catch Ljava/lang/Throwable; {:try_start_191 .. :try_end_1b3} :catch_2c8
    .catchall {:try_start_191 .. :try_end_1b3} :catchall_2c4

    goto :goto_14e

    .line 230
    .end local v6    # "dateExpires":Ljava/util/Date;
    .end local v8    # "ex":Ljava/lang/Exception;
    .end local v9    # "expires":Ljava/lang/String;
    :catch_1b4
    move-exception v7

    move-object v11, v12

    .line 232
    .end local v5    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "out":Ljava/io/OutputStream;
    .end local v16    # "tileURLString":Ljava/lang/String;
    .local v7, "e":Ljava/net/UnknownHostException;
    .restart local v11    # "out":Ljava/io/OutputStream;
    :goto_1b6
    :try_start_1b6
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "UnknownHostException downloading MapTile: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    new-instance v17, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v7}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v17
    :try_end_1ec
    .catchall {:try_start_1b6 .. :try_end_1ec} :catchall_1ec

    .line 245
    .end local v7    # "e":Ljava/net/UnknownHostException;
    :catchall_1ec
    move-exception v17

    :goto_1ed
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_1f3
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1f6
    .catch Ljava/lang/Exception; {:try_start_1f3 .. :try_end_1f6} :catch_2c1

    .line 249
    :goto_1f6
    throw v17

    .line 234
    :catch_1f7
    move-exception v7

    .line 236
    .local v7, "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :goto_1f8
    :try_start_1f8
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "LowMemoryException downloading MapTile: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    new-instance v17, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v7}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v17

    .line 238
    .end local v7    # "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :catch_22e
    move-exception v7

    .line 239
    .local v7, "e":Ljava/io/FileNotFoundException;
    :goto_22f
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Tile not found: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_255
    .catchall {:try_start_1f8 .. :try_end_255} :catchall_1ec

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_25b
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_25e
    .catch Ljava/lang/Exception; {:try_start_25b .. :try_end_25e} :catch_2bf

    .line 252
    .end local v7    # "e":Ljava/io/FileNotFoundException;
    :goto_25e
    const/4 v13, 0x0

    goto/16 :goto_13

    .line 240
    :catch_261
    move-exception v7

    .line 241
    .local v7, "e":Ljava/io/IOException;
    :goto_262
    :try_start_262
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "IOException downloading MapTile: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " : "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_288
    .catchall {:try_start_262 .. :try_end_288} :catchall_1ec

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_28e
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_291
    .catch Ljava/lang/Exception; {:try_start_28e .. :try_end_291} :catch_292

    goto :goto_25e

    .line 249
    :catch_292
    move-exception v17

    goto :goto_25e

    .line 242
    .end local v7    # "e":Ljava/io/IOException;
    :catch_294
    move-exception v7

    .line 243
    .local v7, "e":Ljava/lang/Throwable;
    :goto_295
    :try_start_295
    const-string v17, "OsmDroid"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Error downloading MapTile: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2b3
    .catchall {:try_start_295 .. :try_end_2b3} :catchall_1ec

    .line 245
    invoke-static {v10}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 246
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 248
    :try_start_2b9
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2bc
    .catch Ljava/lang/Exception; {:try_start_2b9 .. :try_end_2bc} :catch_2bd

    goto :goto_25e

    .line 249
    :catch_2bd
    move-exception v17

    goto :goto_25e

    .local v7, "e":Ljava/io/FileNotFoundException;
    :catch_2bf
    move-exception v17

    goto :goto_25e

    .end local v7    # "e":Ljava/io/FileNotFoundException;
    :catch_2c1
    move-exception v18

    goto/16 :goto_1f6

    .line 245
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v5    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    .restart local v16    # "tileURLString":Ljava/lang/String;
    :catchall_2c4
    move-exception v17

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_1ed

    .line 242
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_2c8
    move-exception v7

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto :goto_295

    .line 240
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_2cb
    move-exception v7

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto :goto_262

    .line 238
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_2ce
    move-exception v7

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_22f

    .line 234
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_2d2
    move-exception v7

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_1f8

    .line 230
    .end local v5    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .end local v16    # "tileURLString":Ljava/lang/String;
    :catch_2d6
    move-exception v7

    goto/16 :goto_1b6
.end method

.method protected tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 257
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 261
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 263
    instance-of v0, p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    if-eqz v0, :cond_1e

    .line 264
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v0

    check-cast p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    .end local p2    # "pDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p2}, Lorg/osmdroid/tileprovider/BitmapPool;->returnDrawableToPool(Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;)V

    .line 265
    :cond_1e
    return-void
.end method
