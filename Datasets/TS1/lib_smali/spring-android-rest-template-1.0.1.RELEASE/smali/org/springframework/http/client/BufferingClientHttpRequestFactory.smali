.class public Lorg/springframework/http/client/BufferingClientHttpRequestFactory;
.super Lorg/springframework/http/client/AbstractClientHttpRequestFactoryWrapper;
.source "BufferingClientHttpRequestFactory.java"


# direct methods
.method public constructor <init>(Lorg/springframework/http/client/ClientHttpRequestFactory;)V
    .registers 2
    .param p1, "requestFactory"    # Lorg/springframework/http/client/ClientHttpRequestFactory;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/springframework/http/client/AbstractClientHttpRequestFactoryWrapper;-><init>(Lorg/springframework/http/client/ClientHttpRequestFactory;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected createRequest(Ljava/net/URI;Lorg/springframework/http/HttpMethod;Lorg/springframework/http/client/ClientHttpRequestFactory;)Lorg/springframework/http/client/ClientHttpRequest;
    .registers 6
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "httpMethod"    # Lorg/springframework/http/HttpMethod;
    .param p3, "requestFactory"    # Lorg/springframework/http/client/ClientHttpRequestFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-interface {p3, p1, p2}, Lorg/springframework/http/client/ClientHttpRequestFactory;->createRequest(Ljava/net/URI;Lorg/springframework/http/HttpMethod;)Lorg/springframework/http/client/ClientHttpRequest;

    move-result-object v0

    .line 42
    .local v0, "request":Lorg/springframework/http/client/ClientHttpRequest;
    invoke-virtual {p0, p1, p2}, Lorg/springframework/http/client/BufferingClientHttpRequestFactory;->shouldBuffer(Ljava/net/URI;Lorg/springframework/http/HttpMethod;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 43
    new-instance v1, Lorg/springframework/http/client/BufferingClientHttpRequestWrapper;

    invoke-direct {v1, v0}, Lorg/springframework/http/client/BufferingClientHttpRequestWrapper;-><init>(Lorg/springframework/http/client/ClientHttpRequest;)V

    move-object v0, v1

    .line 46
    .end local v0    # "request":Lorg/springframework/http/client/ClientHttpRequest;
    :cond_10
    return-object v0
.end method

.method protected shouldBuffer(Ljava/net/URI;Lorg/springframework/http/HttpMethod;)Z
    .registers 4
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "httpMethod"    # Lorg/springframework/http/HttpMethod;

    .prologue
    .line 61
    const/4 v0, 0x1

    return v0
.end method
