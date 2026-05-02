.class public Lorg/apache/http/impl/pool/BasicConnFactory;
.super Ljava/lang/Object;
.source "BasicConnFactory.java"

# interfaces
.implements Lorg/apache/http/pool/ConnFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/pool/ConnFactory",
        "<",
        "Lorg/apache/http/HttpHost;",
        "Lorg/apache/http/HttpClientConnection;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final params:Lorg/apache/http/params/HttpParams;

.field private final sslfactory:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;Lorg/apache/http/params/HttpParams;)V
    .registers 5
    .param p1, "sslfactory"    # Ljavax/net/ssl/SSLSocketFactory;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    if-nez p2, :cond_d

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "HTTP params may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_d
    iput-object p1, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 73
    iput-object p2, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->params:Lorg/apache/http/params/HttpParams;

    .line 74
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .registers 3
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/pool/BasicConnFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;Lorg/apache/http/params/HttpParams;)V

    .line 78
    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    check-cast p1, Lorg/apache/http/HttpHost;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/pool/BasicConnFactory;->create(Lorg/apache/http/HttpHost;)Lorg/apache/http/HttpClientConnection;

    move-result-object v0

    return-object v0
.end method

.method protected create(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/HttpClientConnection;
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Lorg/apache/http/impl/DefaultHttpClientConnection;

    invoke-direct {v0}, Lorg/apache/http/impl/DefaultHttpClientConnection;-><init>()V

    .line 82
    .local v0, "conn":Lorg/apache/http/impl/DefaultHttpClientConnection;
    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/DefaultHttpClientConnection;->bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V

    .line 83
    return-object v0
.end method

.method public create(Lorg/apache/http/HttpHost;)Lorg/apache/http/HttpClientConnection;
    .registers 9
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "scheme":Ljava/lang/String;
    const/4 v3, 0x0

    .line 89
    .local v3, "socket":Ljava/net/Socket;
    const-string v4, "http"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 90
    new-instance v3, Ljava/net/Socket;

    .end local v3    # "socket":Ljava/net/Socket;
    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    .line 91
    .restart local v3    # "socket":Ljava/net/Socket;
    :cond_12
    const-string v4, "https"

    invoke-virtual {v4, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 92
    iget-object v4, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v4, :cond_24

    .line 93
    iget-object v4, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->sslfactory:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v3

    .line 96
    :cond_24
    if-nez v3, :cond_3f

    .line 97
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " scheme is not supported"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 99
    :cond_3f
    iget-object v4, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v4}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 100
    .local v0, "connectTimeout":I
    iget-object v4, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v4}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v2

    .line 102
    .local v2, "soTimeout":I
    invoke-virtual {v3, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 103
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v6

    invoke-direct {v4, v5, v6}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 104
    iget-object v4, p0, Lorg/apache/http/impl/pool/BasicConnFactory;->params:Lorg/apache/http/params/HttpParams;

    invoke-virtual {p0, v3, v4}, Lorg/apache/http/impl/pool/BasicConnFactory;->create(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)Lorg/apache/http/HttpClientConnection;

    move-result-object v4

    return-object v4
.end method
