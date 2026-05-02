.class public Lorg/springframework/http/client/SimpleClientHttpRequestFactory;
.super Ljava/lang/Object;
.source "SimpleClientHttpRequestFactory.java"

# interfaces
.implements Lorg/springframework/http/client/ClientHttpRequestFactory;


# static fields
.field private static final DEFAULT_CHUNK_SIZE:I


# instance fields
.field private bufferRequestBody:Z

.field private chunkSize:I

.field private connectTimeout:I

.field private proxy:Ljava/net/Proxy;

.field private readTimeout:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->bufferRequestBody:Z

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->chunkSize:I

    .line 48
    iput v1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->connectTimeout:I

    .line 50
    iput v1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->readTimeout:I

    return-void
.end method


# virtual methods
.method public createRequest(Ljava/net/URI;Lorg/springframework/http/HttpMethod;)Lorg/springframework/http/client/ClientHttpRequest;
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "httpMethod"    # Lorg/springframework/http/HttpMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v1

    iget-object v2, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->proxy:Ljava/net/Proxy;

    invoke-virtual {p0, v1, v2}, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 116
    .local v0, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {p2}, Lorg/springframework/http/HttpMethod;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->prepareConnection(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    .line 117
    iget-boolean v1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->bufferRequestBody:Z

    if-eqz v1, :cond_1b

    .line 118
    new-instance v1, Lorg/springframework/http/client/SimpleBufferingClientHttpRequest;

    invoke-direct {v1, v0}, Lorg/springframework/http/client/SimpleBufferingClientHttpRequest;-><init>(Ljava/net/HttpURLConnection;)V

    .line 120
    :goto_1a
    return-object v1

    :cond_1b
    new-instance v1, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;

    iget v2, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->chunkSize:I

    invoke-direct {v1, v0, v2}, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;-><init>(Ljava/net/HttpURLConnection;I)V

    goto :goto_1a
.end method

.method protected openConnection(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;
    .registers 5
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "proxy"    # Ljava/net/Proxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    if-eqz p2, :cond_e

    invoke-virtual {p1, p2}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    .line 137
    .local v0, "urlConnection":Ljava/net/URLConnection;
    :goto_6
    const-class v1, Ljava/net/HttpURLConnection;

    invoke-static {v1, v0}, Lorg/springframework/util/Assert;->isInstanceOf(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 138
    check-cast v0, Ljava/net/HttpURLConnection;

    .end local v0    # "urlConnection":Ljava/net/URLConnection;
    return-object v0

    .line 136
    :cond_e
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    goto :goto_6
.end method

.method protected prepareConnection(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .registers 6
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "httpMethod"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 151
    iget v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->connectTimeout:I

    if-ltz v0, :cond_b

    .line 152
    iget v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->connectTimeout:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 154
    :cond_b
    iget v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->readTimeout:I

    if-ltz v0, :cond_14

    .line 155
    iget v0, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->readTimeout:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 157
    :cond_14
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 158
    const-string v0, "GET"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 159
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 163
    :goto_22
    const-string v0, "PUT"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "POST"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 164
    :cond_32
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 168
    :goto_35
    invoke-virtual {p1, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 169
    return-void

    .line 161
    :cond_39
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    goto :goto_22

    .line 166
    :cond_3d
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    goto :goto_35
.end method

.method public setBufferRequestBody(Z)V
    .registers 2
    .param p1, "bufferRequestBody"    # Z

    .prologue
    .line 73
    iput-boolean p1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->bufferRequestBody:Z

    .line 74
    return-void
.end method

.method public setChunkSize(I)V
    .registers 2
    .param p1, "chunkSize"    # I

    .prologue
    .line 86
    iput p1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->chunkSize:I

    .line 87
    return-void
.end method

.method public setConnectTimeout(I)V
    .registers 2
    .param p1, "connectTimeout"    # I

    .prologue
    .line 98
    iput p1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->connectTimeout:I

    .line 99
    return-void
.end method

.method public setProxy(Ljava/net/Proxy;)V
    .registers 2
    .param p1, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 56
    iput-object p1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->proxy:Ljava/net/Proxy;

    .line 57
    return-void
.end method

.method public setReadTimeout(I)V
    .registers 2
    .param p1, "readTimeout"    # I

    .prologue
    .line 110
    iput p1, p0, Lorg/springframework/http/client/SimpleClientHttpRequestFactory;->readTimeout:I

    .line 111
    return-void
.end method
