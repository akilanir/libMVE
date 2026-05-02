.class final Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;
.super Lorg/springframework/http/client/AbstractClientHttpRequest;
.source "SimpleStreamingClientHttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/springframework/http/client/SimpleStreamingClientHttpRequest$1;,
        Lorg/springframework/http/client/SimpleStreamingClientHttpRequest$NonClosingOutputStream;
    }
.end annotation


# static fields
.field private static final olderThanFroyo:Ljava/lang/Boolean;


# instance fields
.field private body:Ljava/io/OutputStream;

.field private final chunkSize:I

.field private final connection:Ljava/net/HttpURLConnection;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 44
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-ge v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->olderThanFroyo:Ljava/lang/Boolean;

    return-void

    :cond_e
    const/4 v0, 0x0

    goto :goto_7
.end method

.method constructor <init>(Ljava/net/HttpURLConnection;I)V
    .registers 5
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "chunkSize"    # I

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/springframework/http/client/AbstractClientHttpRequest;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    .line 55
    iput p2, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->chunkSize:I

    .line 58
    sget-object v0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->olderThanFroyo:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 59
    const-string v0, "http.keepAlive"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 61
    :cond_16
    return-void
.end method

.method private shouldAllowConnectionReuse(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "headerValue"    # Ljava/lang/String;

    .prologue
    .line 119
    sget-object v0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->olderThanFroyo:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1a

    const-string v0, "Connection"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const-string v0, "Keep-Alive"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 120
    const/4 v0, 0x0

    .line 122
    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x1

    goto :goto_19
.end method

.method private writeHeaders(Lorg/springframework/http/HttpHeaders;)V
    .registers 8
    .param p1, "headers"    # Lorg/springframework/http/HttpHeaders;

    .prologue
    .line 107
    invoke-virtual {p1}, Lorg/springframework/http/HttpHeaders;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 108
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 109
    .local v1, "headerName":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_24
    :goto_24
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 110
    .local v2, "headerValue":Ljava/lang/String;
    invoke-direct {p0, v1, v2}, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->shouldAllowConnectionReuse(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_24

    .line 111
    iget-object v5, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v5, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 115
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "headerName":Ljava/lang/String;
    .end local v2    # "headerValue":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_3c
    return-void
.end method


# virtual methods
.method protected executeInternal(Lorg/springframework/http/HttpHeaders;)Lorg/springframework/http/client/ClientHttpResponse;
    .registers 4
    .param p1, "headers"    # Lorg/springframework/http/HttpHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    :try_start_0
    iget-object v0, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->body:Ljava/io/OutputStream;

    if-eqz v0, :cond_11

    .line 95
    iget-object v0, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->body:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_1a

    .line 103
    :goto_9
    new-instance v0, Lorg/springframework/http/client/SimpleClientHttpResponse;

    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-direct {v0, v1}, Lorg/springframework/http/client/SimpleClientHttpResponse;-><init>(Ljava/net/HttpURLConnection;)V

    return-object v0

    .line 97
    :cond_11
    :try_start_11
    invoke-direct {p0, p1}, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->writeHeaders(Lorg/springframework/http/HttpHeaders;)V

    .line 98
    iget-object v0, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_19} :catch_1a

    goto :goto_9

    .line 100
    :catch_1a
    move-exception v0

    goto :goto_9
.end method

.method protected getBodyInternal(Lorg/springframework/http/HttpHeaders;)Ljava/io/OutputStream;
    .registers 6
    .param p1, "headers"    # Lorg/springframework/http/HttpHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->body:Ljava/io/OutputStream;

    if-nez v1, :cond_28

    .line 78
    invoke-virtual {p1}, Lorg/springframework/http/HttpHeaders;->getContentLength()J

    move-result-wide v1

    long-to-int v0, v1

    .line 79
    .local v0, "contentLength":I
    if-ltz v0, :cond_31

    sget-object v1, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->olderThanFroyo:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_31

    .line 80
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 84
    :goto_18
    invoke-direct {p0, p1}, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->writeHeaders(Lorg/springframework/http/HttpHeaders;)V

    .line 85
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 86
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    iput-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->body:Ljava/io/OutputStream;

    .line 88
    .end local v0    # "contentLength":I
    :cond_28
    new-instance v1, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest$NonClosingOutputStream;

    iget-object v2, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->body:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest$NonClosingOutputStream;-><init>(Ljava/io/OutputStream;Lorg/springframework/http/client/SimpleStreamingClientHttpRequest$1;)V

    return-object v1

    .line 82
    .restart local v0    # "contentLength":I
    :cond_31
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    iget v2, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->chunkSize:I

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    goto :goto_18
.end method

.method public getMethod()Lorg/springframework/http/HttpMethod;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/http/HttpMethod;->valueOf(Ljava/lang/String;)Lorg/springframework/http/HttpMethod;

    move-result-object v0

    return-object v0
.end method

.method public getURI()Ljava/net/URI;
    .registers 5

    .prologue
    .line 69
    :try_start_0
    iget-object v1, p0, Lorg/springframework/http/client/SimpleStreamingClientHttpRequest;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toURI()Ljava/net/URI;
    :try_end_9
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    return-object v1

    .line 70
    :catch_b
    move-exception v0

    .line 71
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not get HttpURLConnection URI: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
