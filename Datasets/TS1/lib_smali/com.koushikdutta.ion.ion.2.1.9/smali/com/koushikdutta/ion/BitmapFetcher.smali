.class Lcom/koushikdutta/ion/BitmapFetcher;
.super Ljava/lang/Object;
.source "BitmapFetcher.java"

# interfaces
.implements Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;


# static fields
.field public static final MAX_IMAGEVIEW_LOAD:I = 0x5


# instance fields
.field animateGif:Z

.field bitmapKey:Ljava/lang/String;

.field builder:Lcom/koushikdutta/ion/IonRequestBuilder;

.field decodeKey:Ljava/lang/String;

.field deepZoom:Z

.field hasTransforms:Z

.field info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

.field postProcess:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/PostProcess;",
            ">;"
        }
    .end annotation
.end field

.field sampleHeight:I

.field sampleWidth:I

.field transforms:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/koushikdutta/ion/bitmap/Transform;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private executeTransforms(Lcom/koushikdutta/ion/Ion;)V
    .registers 10
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->hasTransforms:Z

    if-nez v0, :cond_5

    .line 109
    :cond_4
    :goto_4
    return-void

    .line 106
    :cond_5
    iget-object v0, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v1, p0, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_4

    .line 107
    iget-object v6, p1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v7, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    new-instance v0, Lcom/koushikdutta/ion/TransformBitmap;

    iget-object v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    iget-object v3, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapFetcher;->transforms:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/koushikdutta/ion/BitmapFetcher;->postProcess:Ljava/util/ArrayList;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/ion/TransformBitmap;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v6, v7, v0}, Lcom/koushikdutta/async/util/HashList;->add(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4
.end method

.method private fastLoad(Ljava/lang/String;)Z
    .registers 23
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 39
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v9, v1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 40
    .local v9, "ion":Lcom/koushikdutta/ion/Ion;
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    if-eqz v1, :cond_61

    .line 41
    if-eqz p1, :cond_18

    const-string v1, "file:/"

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1a

    .line 42
    :cond_18
    const/4 v1, 0x0

    .line 72
    :goto_19
    return v1

    .line 43
    :cond_1a
    new-instance v6, Ljava/io/File;

    invoke-static/range {p1 .. p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-direct {v6, v1}, Ljava/io/File;-><init>(Ljava/net/URI;)V

    .line 44
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 45
    const/4 v1, 0x0

    goto :goto_19

    .line 46
    :cond_2b
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/koushikdutta/ion/loader/MediaFile;->getFileType(Ljava/lang/String;)Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;

    move-result-object v20

    .line 47
    .local v20, "type":Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;
    if-eqz v20, :cond_3f

    move-object/from16 v0, v20

    iget v1, v0, Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;->fileType:I

    invoke-static {v1}, Lcom/koushikdutta/ion/loader/MediaFile;->isVideoFileType(I)Z

    move-result v1

    if-nez v1, :cond_61

    .line 48
    :cond_3f
    new-instance v18, Lcom/koushikdutta/ion/LoadDeepZoom;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    const/4 v3, 0x0

    move-object/from16 v0, v18

    invoke-direct {v0, v9, v1, v2, v3}, Lcom/koushikdutta/ion/LoadDeepZoom;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZLcom/koushikdutta/async/util/FileCache;)V

    .line 49
    .local v18, "loadDeepZoom":Lcom/koushikdutta/ion/LoadDeepZoom;
    const/4 v8, 0x0

    new-instance v1, Lcom/koushikdutta/ion/Response;

    const/4 v2, 0x0

    sget-object v3, Lcom/koushikdutta/ion/ResponseServedFrom;->LOADED_FROM_CACHE:Lcom/koushikdutta/ion/ResponseServedFrom;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/koushikdutta/ion/Response;-><init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/ResponseServedFrom;Lcom/koushikdutta/ion/HeadersResponse;Ljava/lang/Exception;Ljava/lang/Object;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v8, v1}, Lcom/koushikdutta/ion/LoadDeepZoom;->onCompleted(Ljava/lang/Exception;Lcom/koushikdutta/ion/Response;)V

    .line 51
    const/4 v1, 0x1

    goto :goto_19

    .line 56
    .end local v6    # "file":Ljava/io/File;
    .end local v18    # "loadDeepZoom":Lcom/koushikdutta/ion/LoadDeepZoom;
    .end local v20    # "type":Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;
    :cond_61
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->hasTransforms:Z

    if-nez v1, :cond_bd

    const/16 v19, 0x1

    .line 58
    .local v19, "put":Z
    :goto_69
    invoke-virtual {v9}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/koushikdutta/ion/Ion$Config;->getLoaders()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :cond_75
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_c0

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/koushikdutta/ion/Loader;

    .line 59
    .local v7, "loader":Lcom/koushikdutta/ion/Loader;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder;->contextReference:Lcom/koushikdutta/ion/ContextReference;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/ContextReference;->getContext()Landroid/content/Context;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v12, v0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    move-object/from16 v0, p0

    iget v13, v0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    move-object/from16 v11, p1

    invoke-interface/range {v7 .. v14}, Lcom/koushikdutta/ion/Loader;->loadBitmap(Landroid/content/Context;Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/lang/String;IIZ)Lcom/koushikdutta/async/future/Future;

    move-result-object v16

    .line 60
    .local v16, "future":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    if-eqz v16, :cond_75

    .line 61
    new-instance v15, Lcom/koushikdutta/ion/LoadBitmapBase;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    move/from16 v0, v19

    invoke-direct {v15, v9, v1, v0}, Lcom/koushikdutta/ion/LoadBitmapBase;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Z)V

    .line 62
    .local v15, "callback":Lcom/koushikdutta/ion/BitmapCallback;
    new-instance v1, Lcom/koushikdutta/ion/BitmapFetcher$1;

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v15}, Lcom/koushikdutta/ion/BitmapFetcher$1;-><init>(Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/BitmapCallback;)V

    move-object/from16 v0, v16

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    .line 69
    const/4 v1, 0x1

    goto/16 :goto_19

    .line 56
    .end local v7    # "loader":Lcom/koushikdutta/ion/Loader;
    .end local v15    # "callback":Lcom/koushikdutta/ion/BitmapCallback;
    .end local v16    # "future":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "put":Z
    :cond_bd
    const/16 v19, 0x0

    goto :goto_69

    .line 72
    .restart local v17    # "i$":Ljava/util/Iterator;
    .restart local v19    # "put":Z
    :cond_c0
    const/4 v1, 0x0

    goto/16 :goto_19
.end method

.method public static shouldDeferImageView(Lcom/koushikdutta/ion/Ion;)Z
    .registers 8
    .param p0, "ion"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    const/4 v6, 0x5

    const/4 v4, 0x0

    .line 78
    iget-object v5, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v5}, Lcom/koushikdutta/async/util/HashList;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->size()I

    move-result v5

    if-gt v5, v6, :cond_f

    .line 89
    :cond_e
    :goto_e
    return v4

    .line 80
    :cond_f
    const/4 v2, 0x0

    .line 81
    .local v2, "loadCount":I
    iget-object v5, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v5}, Lcom/koushikdutta/async/util/HashList;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 82
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v5, v1}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 83
    .local v3, "owner":Ljava/lang/Object;
    instance-of v5, v3, Lcom/koushikdutta/ion/LoadBitmapBase;

    if-eqz v5, :cond_1a

    .line 84
    add-int/lit8 v2, v2, 0x1

    .line 85
    if-le v2, v6, :cond_1a

    .line 86
    const/4 v4, 0x1

    goto :goto_e
.end method


# virtual methods
.method public defer()Lcom/koushikdutta/ion/DeferredLoadBitmap;
    .registers 4

    .prologue
    .line 93
    new-instance v0, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    iget-object v1, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0}, Lcom/koushikdutta/ion/DeferredLoadBitmap;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Lcom/koushikdutta/ion/BitmapFetcher;)V

    .line 94
    .local v0, "ret":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    iget-object v1, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-direct {p0, v1}, Lcom/koushikdutta/ion/BitmapFetcher;->executeTransforms(Lcom/koushikdutta/ion/Ion;)V

    .line 95
    return-object v0
.end method

.method public execute()V
    .registers 13

    .prologue
    .line 117
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->ion:Lcom/koushikdutta/ion/Ion;

    .line 122
    .local v1, "ion":Lcom/koushikdutta/ion/Ion;
    iget-object v0, v1, Lcom/koushikdutta/ion/Ion;->responseCache:Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/cache/ResponseCacheMiddleware;->getFileCache()Lcom/koushikdutta/async/util/FileCache;

    move-result-object v10

    .line 123
    .local v10, "fileCache":Lcom/koushikdutta/async/util/FileCache;
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-boolean v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->noCache:Z

    if-nez v0, :cond_24

    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    invoke-virtual {v10, v0}, Lcom/koushikdutta/async/util/FileCache;->exists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-boolean v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    if-nez v0, :cond_24

    .line 124
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->postProcess:Ljava/util/ArrayList;

    invoke-static {v1, v0, v2}, Lcom/koushikdutta/ion/BitmapCallback;->getBitmapSnapshot(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 158
    :goto_23
    return-void

    .line 129
    :cond_24
    iget-object v0, v1, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_6f

    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->uri:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/BitmapFetcher;->fastLoad(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6f

    .line 130
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->setHandler(Landroid/os/Handler;)Lcom/koushikdutta/ion/IonRequestBuilder;

    .line 131
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->loadRequestCallback:Lcom/koushikdutta/ion/IonRequestBuilder$LoadRequestCallback;

    .line 133
    iget-boolean v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    if-nez v0, :cond_75

    .line 134
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    new-instance v2, Lcom/koushikdutta/async/parser/ByteBufferListParser;

    invoke-direct {v2}, Lcom/koushikdutta/async/parser/ByteBufferListParser;-><init>()V

    new-instance v3, Lcom/koushikdutta/ion/BitmapFetcher$2;

    invoke-direct {v3, p0, v1}, Lcom/koushikdutta/ion/BitmapFetcher$2;-><init>(Lcom/koushikdutta/ion/BitmapFetcher;Lcom/koushikdutta/ion/Ion;)V

    invoke-virtual {v0, v2, v3}, Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v0

    .line 145
    invoke-interface {v0}, Lcom/koushikdutta/ion/future/ResponseFuture;->withResponse()Lcom/koushikdutta/async/future/Future;

    move-result-object v7

    .line 146
    .local v7, "emitterTransform":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/Response<Lcom/koushikdutta/async/ByteBufferList;>;>;"
    new-instance v0, Lcom/koushikdutta/ion/LoadBitmap;

    iget-object v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/koushikdutta/ion/BitmapFetcher;->hasTransforms:Z

    if-nez v3, :cond_73

    const/4 v3, 0x1

    :goto_63
    iget v4, p0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    iget v5, p0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    iget-boolean v6, p0, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    invoke-direct/range {v0 .. v6}, Lcom/koushikdutta/ion/LoadBitmap;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZIIZ)V

    invoke-interface {v7, v0}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    .line 157
    .end local v7    # "emitterTransform":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/Response<Lcom/koushikdutta/async/ByteBufferList;>;>;"
    :cond_6f
    :goto_6f
    invoke-direct {p0, v1}, Lcom/koushikdutta/ion/BitmapFetcher;->executeTransforms(Lcom/koushikdutta/ion/Ion;)V

    goto :goto_23

    .line 146
    .restart local v7    # "emitterTransform":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/Response<Lcom/koushikdutta/async/ByteBufferList;>;>;"
    :cond_73
    const/4 v3, 0x0

    goto :goto_63

    .line 150
    .end local v7    # "emitterTransform":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/Response<Lcom/koushikdutta/async/ByteBufferList;>;>;"
    :cond_75
    invoke-virtual {v10}, Lcom/koushikdutta/async/util/FileCache;->getTempFile()Ljava/io/File;

    move-result-object v9

    .line 151
    .local v9, "file":Ljava/io/File;
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    invoke-virtual {v0, v9}, Lcom/koushikdutta/ion/IonRequestBuilder;->write(Ljava/io/File;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    move-result-object v0

    invoke-virtual {v0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->withResponse()Lcom/koushikdutta/async/future/Future;

    move-result-object v8

    .line 152
    .local v8, "emitterTransform":Lcom/koushikdutta/async/future/Future;, "Lcom/koushikdutta/async/future/Future<Lcom/koushikdutta/ion/Response<Ljava/io/File;>;>;"
    new-instance v11, Lcom/koushikdutta/ion/LoadDeepZoom;

    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    invoke-direct {v11, v1, v0, v2, v10}, Lcom/koushikdutta/ion/LoadDeepZoom;-><init>(Lcom/koushikdutta/ion/Ion;Ljava/lang/String;ZLcom/koushikdutta/async/util/FileCache;)V

    .line 153
    .local v11, "loadDeepZoom":Lcom/koushikdutta/ion/LoadDeepZoom;
    invoke-interface {v8, v11}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    goto :goto_6f
.end method

.method public loadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;)Z
    .registers 3
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;

    .prologue
    .line 113
    invoke-virtual {p1}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/BitmapFetcher;->fastLoad(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public recomputeDecodeKey()V
    .registers 6

    .prologue
    .line 33
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->builder:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget v1, p0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleWidth:I

    iget v2, p0, Lcom/koushikdutta/ion/BitmapFetcher;->sampleHeight:I

    iget-boolean v3, p0, Lcom/koushikdutta/ion/BitmapFetcher;->animateGif:Z

    iget-boolean v4, p0, Lcom/koushikdutta/ion/BitmapFetcher;->deepZoom:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeDecodeKey(Lcom/koushikdutta/ion/IonRequestBuilder;IIZZ)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    .line 35
    iget-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->decodeKey:Ljava/lang/String;

    iget-object v1, p0, Lcom/koushikdutta/ion/BitmapFetcher;->transforms:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lcom/koushikdutta/ion/IonBitmapRequestBuilder;->computeBitmapKey(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    .line 36
    return-void
.end method
