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
    .line 150
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
    .line 155
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mTileSource:Ljava/util/concurrent/atomic/AtomicReference;
    invoke-static/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$000(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;

    .line 156
    .local v16, "tileSource":Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;
    if-nez v16, :cond_14

    .line 157
    const/4 v14, 0x0

    .line 236
    :goto_13
    return-object v14

    .line 160
    :cond_14
    const/4 v9, 0x0

    .line 161
    .local v9, "in":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 162
    .local v11, "out":Ljava/io/OutputStream;
    invoke-virtual/range {p1 .. p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v15

    .line 166
    .local v15, "tile":Lorg/osmdroid/tileprovider/MapTile;
    :try_start_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v18

    if-eqz v18, :cond_3e

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mNetworkAvailablityCheck:Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;
    invoke-static/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$100(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/INetworkAvailablityCheck;->getNetworkAvailable()Z
    :try_end_33
    .catch Ljava/net/UnknownHostException; {:try_start_1a .. :try_end_33} :catch_11c
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_1a .. :try_end_33} :catch_15d
    .catch Ljava/io/FileNotFoundException; {:try_start_1a .. :try_end_33} :catch_196
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_33} :catch_1c8
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_33} :catch_1f8
    .catchall {:try_start_1a .. :try_end_33} :catchall_155

    move-result v18

    if-nez v18, :cond_3e

    .line 171
    const/4 v14, 0x0

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_13

    .line 174
    :cond_3e
    :try_start_3e
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getTileURLString(Lorg/osmdroid/tileprovider/MapTile;)Ljava/lang/String;

    move-result-object v17

    .line 180
    .local v17, "tileURLString":Ljava/lang/String;
    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_47
    .catch Ljava/net/UnknownHostException; {:try_start_3e .. :try_end_47} :catch_11c
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_3e .. :try_end_47} :catch_15d
    .catch Ljava/io/FileNotFoundException; {:try_start_3e .. :try_end_47} :catch_196
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_47} :catch_1c8
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_47} :catch_1f8
    .catchall {:try_start_3e .. :try_end_47} :catchall_155

    move-result v18

    if-eqz v18, :cond_52

    .line 181
    const/4 v14, 0x0

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_13

    .line 184
    :cond_52
    :try_start_52
    invoke-static {}, Lorg/osmdroid/http/HttpClientFactory;->createHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v3

    .line 185
    .local v3, "client":Lorg/apache/http/client/HttpClient;
    new-instance v8, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v17

    invoke-direct {v8, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 186
    .local v8, "head":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-interface {v3, v8}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    .line 189
    .local v13, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v10

    .line 190
    .local v10, "line":Lorg/apache/http/StatusLine;
    invoke-interface {v10}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v18

    const/16 v19, 0xc8

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_a2

    .line 191
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Problem downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " HTTP response: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_99
    .catch Ljava/net/UnknownHostException; {:try_start_52 .. :try_end_99} :catch_11c
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_52 .. :try_end_99} :catch_15d
    .catch Ljava/io/FileNotFoundException; {:try_start_52 .. :try_end_99} :catch_196
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_99} :catch_1c8
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_99} :catch_1f8
    .catchall {:try_start_52 .. :try_end_99} :catchall_155

    .line 192
    const/4 v14, 0x0

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto/16 :goto_13

    .line 195
    :cond_a2
    :try_start_a2
    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 196
    .local v7, "entity":Lorg/apache/http/HttpEntity;
    if-nez v7, :cond_cd

    .line 197
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "No content downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_c4
    .catch Ljava/net/UnknownHostException; {:try_start_a2 .. :try_end_c4} :catch_11c
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_a2 .. :try_end_c4} :catch_15d
    .catch Ljava/io/FileNotFoundException; {:try_start_a2 .. :try_end_c4} :catch_196
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_c4} :catch_1c8
    .catch Ljava/lang/Throwable; {:try_start_a2 .. :try_end_c4} :catch_1f8
    .catchall {:try_start_a2 .. :try_end_c4} :catchall_155

    .line 198
    const/4 v14, 0x0

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto/16 :goto_13

    .line 200
    :cond_cd
    :try_start_cd
    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v9

    .line 202
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 203
    .local v5, "dataStream":Ljava/io/ByteArrayOutputStream;
    new-instance v12, Ljava/io/BufferedOutputStream;

    const/16 v18, 0x2000

    move/from16 v0, v18

    invoke-direct {v12, v5, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_df
    .catch Ljava/net/UnknownHostException; {:try_start_cd .. :try_end_df} :catch_11c
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_cd .. :try_end_df} :catch_15d
    .catch Ljava/io/FileNotFoundException; {:try_start_cd .. :try_end_df} :catch_196
    .catch Ljava/io/IOException; {:try_start_cd .. :try_end_df} :catch_1c8
    .catch Ljava/lang/Throwable; {:try_start_cd .. :try_end_df} :catch_1f8
    .catchall {:try_start_cd .. :try_end_df} :catchall_155

    .line 204
    .end local v11    # "out":Ljava/io/OutputStream;
    .local v12, "out":Ljava/io/OutputStream;
    :try_start_df
    invoke-static {v9, v12}, Lorg/osmdroid/tileprovider/util/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 205
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V

    .line 206
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    .line 207
    .local v4, "data":[B
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 210
    .local v2, "byteStream":Ljava/io/ByteArrayInputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$300(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v18

    if-eqz v18, :cond_10e

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v18, v0

    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->mFilesystemCache:Lorg/osmdroid/tileprovider/modules/IFilesystemCache;
    invoke-static/range {v18 .. v18}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$300(Lorg/osmdroid/tileprovider/modules/MapTileDownloader;)Lorg/osmdroid/tileprovider/modules/IFilesystemCache;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1, v15, v2}, Lorg/osmdroid/tileprovider/modules/IFilesystemCache;->saveFile(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;Ljava/io/InputStream;)Z

    .line 212
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 214
    :cond_10e
    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/osmdroid/tileprovider/tilesource/OnlineTileSourceBase;->getDrawable(Ljava/io/InputStream;)Landroid/graphics/drawable/Drawable;
    :try_end_113
    .catch Ljava/net/UnknownHostException; {:try_start_df .. :try_end_113} :catch_232
    .catch Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException; {:try_start_df .. :try_end_113} :catch_22e
    .catch Ljava/io/FileNotFoundException; {:try_start_df .. :try_end_113} :catch_22a
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_113} :catch_227
    .catch Ljava/lang/Throwable; {:try_start_df .. :try_end_113} :catch_224
    .catchall {:try_start_df .. :try_end_113} :catchall_220

    move-result-object v14

    .line 232
    .local v14, "result":Landroid/graphics/drawable/Drawable;
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v12}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto/16 :goto_13

    .line 217
    .end local v2    # "byteStream":Ljava/io/ByteArrayInputStream;
    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .end local v4    # "data":[B
    .end local v5    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    .end local v8    # "head":Lorg/apache/http/client/methods/HttpUriRequest;
    .end local v10    # "line":Lorg/apache/http/StatusLine;
    .end local v12    # "out":Ljava/io/OutputStream;
    .end local v13    # "response":Lorg/apache/http/HttpResponse;
    .end local v14    # "result":Landroid/graphics/drawable/Drawable;
    .end local v17    # "tileURLString":Ljava/lang/String;
    .restart local v11    # "out":Ljava/io/OutputStream;
    :catch_11c
    move-exception v6

    .line 219
    .local v6, "e":Ljava/net/UnknownHostException;
    :goto_11d
    :try_start_11d
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "UnknownHostException downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 220
    new-instance v18, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v18
    :try_end_155
    .catchall {:try_start_11d .. :try_end_155} :catchall_155

    .line 232
    .end local v6    # "e":Ljava/net/UnknownHostException;
    :catchall_155
    move-exception v18

    :goto_156
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    throw v18

    .line 221
    :catch_15d
    move-exception v6

    .line 223
    .local v6, "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :goto_15e
    :try_start_15e
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "LowMemoryException downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 224
    new-instance v18, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v6}, Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException;-><init>(Lorg/osmdroid/tileprovider/modules/MapTileModuleProviderBase;Ljava/lang/Throwable;)V

    throw v18

    .line 225
    .end local v6    # "e":Lorg/osmdroid/tileprovider/tilesource/BitmapTileSourceBase$LowMemoryException;
    :catch_196
    move-exception v6

    .line 226
    .local v6, "e":Ljava/io/FileNotFoundException;
    :goto_197
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Tile not found: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_1bf
    .catchall {:try_start_15e .. :try_end_1bf} :catchall_155

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 236
    .end local v6    # "e":Ljava/io/FileNotFoundException;
    :goto_1c5
    const/4 v14, 0x0

    goto/16 :goto_13

    .line 227
    :catch_1c8
    move-exception v6

    .line 228
    .local v6, "e":Ljava/io/IOException;
    :goto_1c9
    :try_start_1c9
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "IOException downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_1f1
    .catchall {:try_start_1c9 .. :try_end_1f1} :catchall_155

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_1c5

    .line 229
    .end local v6    # "e":Ljava/io/IOException;
    :catch_1f8
    move-exception v6

    .line 230
    .local v6, "e":Ljava/lang/Throwable;
    :goto_1f9
    :try_start_1f9
    # getter for: Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->logger:Lorg/slf4j/Logger;
    invoke-static {}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->access$200()Lorg/slf4j/Logger;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error downloading MapTile: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v0, v1, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_219
    .catchall {:try_start_1f9 .. :try_end_219} :catchall_155

    .line 232
    invoke-static {v9}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 233
    invoke-static {v11}, Lorg/osmdroid/tileprovider/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    goto :goto_1c5

    .line 232
    .end local v6    # "e":Ljava/lang/Throwable;
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v5    # "dataStream":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v8    # "head":Lorg/apache/http/client/methods/HttpUriRequest;
    .restart local v10    # "line":Lorg/apache/http/StatusLine;
    .restart local v12    # "out":Ljava/io/OutputStream;
    .restart local v13    # "response":Lorg/apache/http/HttpResponse;
    .restart local v17    # "tileURLString":Ljava/lang/String;
    :catchall_220
    move-exception v18

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_156

    .line 229
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_224
    move-exception v6

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto :goto_1f9

    .line 227
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_227
    move-exception v6

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto :goto_1c9

    .line 225
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_22a
    move-exception v6

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_197

    .line 221
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_22e
    move-exception v6

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_15e

    .line 217
    .end local v11    # "out":Ljava/io/OutputStream;
    .restart local v12    # "out":Ljava/io/OutputStream;
    :catch_232
    move-exception v6

    move-object v11, v12

    .end local v12    # "out":Ljava/io/OutputStream;
    .restart local v11    # "out":Ljava/io/OutputStream;
    goto/16 :goto_11d
.end method

.method protected tileLoaded(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V
    .registers 5
    .param p1, "pState"    # Lorg/osmdroid/tileprovider/MapTileRequestState;
    .param p2, "pDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 241
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader;->this$0:Lorg/osmdroid/tileprovider/modules/MapTileDownloader;

    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getMapTile()Lorg/osmdroid/tileprovider/MapTile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/osmdroid/tileprovider/modules/MapTileDownloader;->removeTileFromQueues(Lorg/osmdroid/tileprovider/MapTile;)V

    .line 245
    invoke-virtual {p1}, Lorg/osmdroid/tileprovider/MapTileRequestState;->getCallback()Lorg/osmdroid/tileprovider/IMapTileProviderCallback;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lorg/osmdroid/tileprovider/IMapTileProviderCallback;->mapTileRequestCompleted(Lorg/osmdroid/tileprovider/MapTileRequestState;Landroid/graphics/drawable/Drawable;)V

    .line 247
    instance-of v0, p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    if-eqz v0, :cond_1e

    .line 248
    invoke-static {}, Lorg/osmdroid/tileprovider/BitmapPool;->getInstance()Lorg/osmdroid/tileprovider/BitmapPool;

    move-result-object v0

    check-cast p2, Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;

    .end local p2    # "pDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p2}, Lorg/osmdroid/tileprovider/BitmapPool;->returnDrawableToPool(Lorg/osmdroid/tileprovider/ReusableBitmapDrawable;)V

    .line 249
    :cond_1e
    return-void
.end method
