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
    .line 146
    iput-object p1, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-direct {p0, p1}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;)V

    return-void
.end method


# virtual methods
.method public loadTile(Lorg/osmdroid/tileprovider/MapTileRequestState;)Landroid/graphics/drawable/Drawable;
    .registers 18
    .param p1, "aState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;
        }
    .end annotation

    .prologue
    .line 151
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static {v13}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v13

    invoke-virtual {v13}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 152
    .local v11, "tileSource":Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
    if-nez v11, :cond_12

    .line 153
    const/4 v9, 0x0

    .line 234
    :goto_11
    return-object v9

    .line 156
    :cond_12
    const/4 v6, 0x0

    .line 157
    .local v6, "in":Ljava/io/InputStream;
    const/4 v7, 0x0

    .line 158
    .local v7, "out":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 159
    .local v2, "c":Ljava/net/HttpURLConnection;
    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v10

    .line 163
    .local v10, "tile":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_19
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static {v13}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v13

    if-eqz v13, :cond_68

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static {v13}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v13

    invoke-interface {v13}, Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;->getNetworkAvailable()Z

    move-result v13

    if-nez v13, :cond_68

    .line 165
    sget-boolean v13, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v13, :cond_5b

    .line 166
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Skipping "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-virtual {v15}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " due to NetworkAvailabliltyCheck."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5b
    .catch Ljava/net/UnknownHostException; {:try_start_19 .. :try_end_5b} :catch_140
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_19 .. :try_end_5b} :catch_178
    .catch Ljava/io/FileNotFoundException; {:try_start_19 .. :try_end_5b} :catch_1a5
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_5b} :catch_1d4
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_5b} :catch_203
    .catchall {:try_start_19 .. :try_end_5b} :catchall_16d

    .line 168
    :cond_5b
    const/4 v9, 0x0

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_62
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_66

    goto :goto_11

    .line 231
    :catch_66
    move-exception v13

    goto :goto_11

    .line 171
    :cond_68
    :try_start_68
    invoke-virtual {v11, v10}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getTileURLString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v12

    .line 173
    .local v12, "tileURLString":Ljava/lang/String;
    sget-boolean v13, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->DEBUGMODE:Z

    if-eqz v13, :cond_88

    .line 174
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Downloading Maptile from url: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    :cond_88
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_8b
    .catch Ljava/net/UnknownHostException; {:try_start_68 .. :try_end_8b} :catch_140
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_68 .. :try_end_8b} :catch_178
    .catch Ljava/io/FileNotFoundException; {:try_start_68 .. :try_end_8b} :catch_1a5
    .catch Ljava/io/IOException; {:try_start_68 .. :try_end_8b} :catch_1d4
    .catch Ljava/lang/Throwable; {:try_start_68 .. :try_end_8b} :catch_203
    .catchall {:try_start_68 .. :try_end_8b} :catchall_16d

    move-result v13

    if-eqz v13, :cond_9d

    .line 178
    const/4 v9, 0x0

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_95
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_98} :catch_9a

    goto/16 :goto_11

    .line 231
    :catch_9a
    move-exception v13

    goto/16 :goto_11

    .line 181
    :cond_9d
    :try_start_9d
    new-instance v13, Ljava/net/URL;

    invoke-direct {v13, v12}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v2, v0

    .line 182
    const/4 v13, 0x1

    invoke-virtual {v2, v13}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 183
    sget-object v13, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->USER_AGENT:Ljava/lang/String;

    invoke-static {}, Lorg/osmdroid/tileprovider/constants/OpenStreetMapTileProviderConstants;->getUserAgentValue()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->connect()V

    .line 189
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    const/16 v14, 0xc8

    if-eq v13, v14, :cond_f7

    .line 190
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Problem downloading MapTile: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " HTTP response: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e8
    .catch Ljava/net/UnknownHostException; {:try_start_9d .. :try_end_e8} :catch_140
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_9d .. :try_end_e8} :catch_178
    .catch Ljava/io/FileNotFoundException; {:try_start_9d .. :try_end_e8} :catch_1a5
    .catch Ljava/io/IOException; {:try_start_9d .. :try_end_e8} :catch_1d4
    .catch Ljava/lang/Throwable; {:try_start_9d .. :try_end_e8} :catch_203
    .catchall {:try_start_9d .. :try_end_e8} :catchall_16d

    .line 191
    const/4 v9, 0x0

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_ef
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_ef .. :try_end_f2} :catch_f4

    goto/16 :goto_11

    .line 231
    :catch_f4
    move-exception v13

    goto/16 :goto_11

    .line 195
    :cond_f7
    :try_start_f7
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .line 197
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 198
    .local v4, "dataStream":Ljava/io/ByteArrayOutputStream;
    new-instance v8, Ljava/io/BufferedOutputStream;

    const/16 v13, 0x2000

    invoke-direct {v8, v4, v13}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_107
    .catch Ljava/net/UnknownHostException; {:try_start_f7 .. :try_end_107} :catch_140
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_f7 .. :try_end_107} :catch_178
    .catch Ljava/io/FileNotFoundException; {:try_start_f7 .. :try_end_107} :catch_1a5
    .catch Ljava/io/IOException; {:try_start_f7 .. :try_end_107} :catch_1d4
    .catch Ljava/lang/Throwable; {:try_start_f7 .. :try_end_107} :catch_203
    .catchall {:try_start_f7 .. :try_end_107} :catchall_16d

    .line 199
    .end local v7    # "out":Ljava/io/OutputStream;
    .local v8, "out":Ljava/io/OutputStream;
    :try_start_107
    invoke-static {v6, v8}, Lorg/osmdroid/tileprovider/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 200
    invoke-virtual {v8}, Ljava/io/OutputStream;->flush()V

    .line 201
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 202
    .local v3, "data":[B
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 205
    .local v1, "byteStream":Ljava/io/ByteArrayInputStream;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static {v13}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v13

    if-eqz v13, :cond_12e

    .line 206
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static {v13}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v13

    invoke-interface {v13, v11, v10, v1}, Lorg/osmdroid/tileprovider/modules/IFilesystemCache;->saveFile(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;Ljava/io/InputStream;)Z

    .line 207
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 209
    :cond_12e
    invoke-virtual {v11, v1}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    :try_end_131
    .catch Ljava/net/UnknownHostException; {:try_start_107 .. :try_end_131} :catch_23f
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_107 .. :try_end_131} :catch_23b
    .catch Ljava/io/FileNotFoundException; {:try_start_107 .. :try_end_131} :catch_237
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_131} :catch_234
    .catch Ljava/lang/Throwable; {:try_start_107 .. :try_end_131} :catch_231
    .catchall {:try_start_107 .. :try_end_131} :catchall_22d

    move-result-object v9

    .line 227
    .local v9, "result":Landroid/graphics/drawable/Drawable;
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v8}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_138
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_13b
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_13b} :catch_13d

    goto/16 :goto_11

    .line 231
    :catch_13d
    move-exception v13

    goto/16 :goto_11

    .line 212
    .end local v1    # "byteStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "data":[B
    .end local v4    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .end local v8    # "out":Ljava/io/OutputStream;
    .end local v9    # "result":Landroid/graphics/drawable/Drawable;
    .end local v12    # "tileURLString":Ljava/lang/String;
    .restart local v7    # "out":Ljava/io/OutputStream;
    :catch_140
    move-exception v5

    .line 214
    .local v5, "e":Ljava/net/UnknownHostException;
    :goto_141
    :try_start_141
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "UnknownHostException downloading MapTile: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    new-instance v13, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-direct {v13, v14, v5}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v13
    :try_end_16d
    .catchall {:try_start_141 .. :try_end_16d} :catchall_16d

    .line 227
    .end local v5    # "e":Ljava/net/UnknownHostException;
    :catchall_16d
    move-exception v13

    :goto_16e
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_174
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_177
    .catch Ljava/lang/Exception; {:try_start_174 .. :try_end_177} :catch_22a

    .line 231
    :goto_177
    throw v13

    .line 216
    :catch_178
    move-exception v5

    .line 218
    .local v5, "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :goto_179
    :try_start_179
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "LowMemoryException downloading MapTile: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    new-instance v13, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-direct {v13, v14, v5}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v13

    .line 220
    .end local v5    # "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :catch_1a5
    move-exception v5

    .line 221
    .local v5, "e":Ljava/io/FileNotFoundException;
    :goto_1a6
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Tile not found: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1c8
    .catchall {:try_start_179 .. :try_end_1c8} :catchall_16d

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_1ce
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_1d1
    .catch Ljava/lang/Exception; {:try_start_1ce .. :try_end_1d1} :catch_228

    .line 234
    .end local v5    # "e":Ljava/io/FileNotFoundException;
    :goto_1d1
    const/4 v9, 0x0

    goto/16 :goto_11

    .line 222
    :catch_1d4
    move-exception v5

    .line 223
    .local v5, "e":Ljava/io/IOException;
    :goto_1d5
    :try_start_1d5
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "IOException downloading MapTile: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f7
    .catchall {:try_start_1d5 .. :try_end_1f7} :catchall_16d

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_1fd
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_200
    .catch Ljava/lang/Exception; {:try_start_1fd .. :try_end_200} :catch_201

    goto :goto_1d1

    .line 231
    :catch_201
    move-exception v13

    goto :goto_1d1

    .line 224
    .end local v5    # "e":Ljava/io/IOException;
    :catch_203
    move-exception v5

    .line 225
    .local v5, "e":Ljava/lang/Throwable;
    :goto_204
    :try_start_204
    const-string v13, "OsmDroid"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Error downloading MapTile: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_21c
    .catchall {:try_start_204 .. :try_end_21c} :catchall_16d

    .line 227
    invoke-static {v6}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 228
    invoke-static {v7}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 230
    :try_start_222
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_225
    .catch Ljava/lang/Exception; {:try_start_222 .. :try_end_225} :catch_226

    goto :goto_1d1

    .line 231
    :catch_226
    move-exception v13

    goto :goto_1d1

    .local v5, "e":Ljava/io/FileNotFoundException;
    :catch_228
    move-exception v13

    goto :goto_1d1

    .end local v5    # "e":Ljava/io/FileNotFoundException;
    :catch_22a
    move-exception v14

    goto/16 :goto_177

    .line 227
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v4    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    .restart local v12    # "tileURLString":Ljava/lang/String;
    :catchall_22d
    move-exception v13

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto/16 :goto_16e

    .line 224
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_231
    move-exception v5

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_204

    .line 222
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_234
    move-exception v5

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto :goto_1d5

    .line 220
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_237
    move-exception v5

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto/16 :goto_1a6

    .line 216
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_23b
    move-exception v5

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto/16 :goto_179

    .line 212
    .end local v7    # "out":Ljava/io/OutputStream;
    .restart local v8    # "out":Ljava/io/OutputStream;
    :catch_23f
    move-exception v5

    move-object v7, v8

    .end local v8    # "out":Ljava/io/OutputStream;
    .restart local v7    # "out":Ljava/io/OutputStream;
    goto/16 :goto_141
.end method

.method protected tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 239
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 243
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 245
    instance-of v0, p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    if-eqz v0, :cond_1e

    .line 246
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v0

    check-cast p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    .end local p2    # "pDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p2}, Lorg/osmdroid/tileprovider/BitmapPool;->returnDrawableToPool(Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;)V

    .line 247
    :cond_1e
    return-void
.end method
