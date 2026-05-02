.class public Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;
.super Ljava/lang/Object;
.source "OkHttpStreamFetcher.java"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher",
        "<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field private responseBody:Lcom/squareup/okhttp/ResponseBody;

.field private stream:Ljava/io/InputStream;

.field private final url:Lcom/bumptech/glide/load/model/GlideUrl;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/bumptech/glide/load/model/GlideUrl;)V
    .registers 3
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "url"    # Lcom/bumptech/glide/load/model/GlideUrl;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 27
    iput-object p2, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->url:Lcom/bumptech/glide/load/model/GlideUrl;

    .line 28
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 1

    .prologue
    .line 79
    return-void
.end method

.method public cleanup()V
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->stream:Ljava/io/InputStream;

    if-eqz v0, :cond_9

    .line 57
    :try_start_4
    iget-object v0, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_15

    .line 62
    :cond_9
    :goto_9
    iget-object v0, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->responseBody:Lcom/squareup/okhttp/ResponseBody;

    if-eqz v0, :cond_12

    .line 64
    :try_start_d
    iget-object v0, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->responseBody:Lcom/squareup/okhttp/ResponseBody;

    invoke-virtual {v0}, Lcom/squareup/okhttp/ResponseBody;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_13

    .line 69
    :cond_12
    :goto_12
    return-void

    .line 65
    :catch_13
    move-exception v0

    goto :goto_12

    .line 58
    :catch_15
    move-exception v0

    goto :goto_9
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->url:Lcom/bumptech/glide/load/model/GlideUrl;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/model/GlideUrl;->getCacheKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public loadData(Lcom/bumptech/glide/Priority;)Ljava/io/InputStream;
    .registers 13
    .param p1, "priority"    # Lcom/bumptech/glide/Priority;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    new-instance v8, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v8}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    iget-object v9, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->url:Lcom/bumptech/glide/load/model/GlideUrl;

    invoke-virtual {v9}, Lcom/bumptech/glide/load/model/GlideUrl;->toStringUrl()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v6

    .line 35
    .local v6, "requestBuilder":Lcom/squareup/okhttp/Request$Builder;
    iget-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->url:Lcom/bumptech/glide/load/model/GlideUrl;

    invoke-virtual {v8}, Lcom/bumptech/glide/load/model/GlideUrl;->getHeaders()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_39

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 36
    .local v2, "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 37
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v4, v8}, Lcom/squareup/okhttp/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    goto :goto_1d

    .line 40
    .end local v2    # "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "key":Ljava/lang/String;
    :cond_39
    invoke-virtual {v6}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v5

    .line 42
    .local v5, "request":Lcom/squareup/okhttp/Request;
    iget-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v8, v5}, Lcom/squareup/okhttp/OkHttpClient;->newCall(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;

    move-result-object v8

    invoke-virtual {v8}, Lcom/squareup/okhttp/Call;->execute()Lcom/squareup/okhttp/Response;

    move-result-object v7

    .line 43
    .local v7, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v8

    iput-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->responseBody:Lcom/squareup/okhttp/ResponseBody;

    .line 44
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->isSuccessful()Z

    move-result v8

    if-nez v8, :cond_70

    .line 45
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Request failed with code: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->code()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 48
    :cond_70
    iget-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->responseBody:Lcom/squareup/okhttp/ResponseBody;

    invoke-virtual {v8}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v0

    .line 49
    .local v0, "contentLength":J
    iget-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->responseBody:Lcom/squareup/okhttp/ResponseBody;

    invoke-virtual {v8}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8, v0, v1}, Lcom/bumptech/glide/util/ContentLengthInputStream;->obtain(Ljava/io/InputStream;J)Ljava/io/InputStream;

    move-result-object v8

    iput-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->stream:Ljava/io/InputStream;

    .line 50
    iget-object v8, p0, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->stream:Ljava/io/InputStream;

    return-object v8
.end method

.method public bridge synthetic loadData(Lcom/bumptech/glide/Priority;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/bumptech/glide/Priority;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/integration/okhttp/OkHttpStreamFetcher;->loadData(Lcom/bumptech/glide/Priority;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
