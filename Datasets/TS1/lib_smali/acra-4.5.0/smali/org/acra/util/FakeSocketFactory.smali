.class public Lorg/acra/util/FakeSocketFactory;
.super Ljava/lang/Object;
.source "FakeSocketFactory.java"

# interfaces
.implements Lorg/apache/http/conn/scheme/SocketFactory;
.implements Lorg/apache/http/conn/scheme/LayeredSocketFactory;


# instance fields
.field private sslcontext:Ljavax/net/ssl/SSLContext;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/acra/util/FakeSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    return-void
.end method

.method private static createEasySSLContext()Ljavax/net/ssl/SSLContext;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    :try_start_0
    const-string v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 26
    .local v0, "context":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v4, 0x0

    new-instance v5, Lorg/acra/util/NaiveTrustManager;

    invoke-direct {v5}, Lorg/acra/util/NaiveTrustManager;-><init>()V

    aput-object v5, v3, v4

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_17

    .line 27
    return-object v0

    .line 28
    :catch_17
    move-exception v1

    .line 29
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private getSSLContext()Ljavax/net/ssl/SSLContext;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    iget-object v0, p0, Lorg/acra/util/FakeSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    if-nez v0, :cond_a

    .line 35
    invoke-static {}, Lorg/acra/util/FakeSocketFactory;->createEasySSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/util/FakeSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    .line 37
    :cond_a
    iget-object v0, p0, Lorg/acra/util/FakeSocketFactory;->sslcontext:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method


# virtual methods
.method public connectSocket(Ljava/net/Socket;Ljava/lang/String;ILjava/net/InetAddress;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;
    .registers 12
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "localAddress"    # Ljava/net/InetAddress;
    .param p5, "localPort"    # I
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-static {p6}, Lorg/apache/http/params/HttpConnectionParams;->getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 43
    .local v0, "connTimeout":I
    invoke-static {p6}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v3

    .line 45
    .local v3, "soTimeout":I
    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-direct {v2, p2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 46
    .local v2, "remoteAddress":Ljava/net/InetSocketAddress;
    if-eqz p1, :cond_28

    move-object v4, p1

    :goto_10
    check-cast v4, Ljavax/net/ssl/SSLSocket;

    .line 48
    .local v4, "sslsock":Ljavax/net/ssl/SSLSocket;
    if-nez p4, :cond_16

    if-lez p5, :cond_21

    .line 50
    :cond_16
    if-gez p5, :cond_19

    .line 51
    const/4 p5, 0x0

    .line 53
    :cond_19
    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p4, p5}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 54
    .local v1, "isa":Ljava/net/InetSocketAddress;
    invoke-virtual {v4, v1}, Ljavax/net/ssl/SSLSocket;->bind(Ljava/net/SocketAddress;)V

    .line 57
    .end local v1    # "isa":Ljava/net/InetSocketAddress;
    :cond_21
    invoke-virtual {v4, v2, v0}, Ljavax/net/ssl/SSLSocket;->connect(Ljava/net/SocketAddress;I)V

    .line 58
    invoke-virtual {v4, v3}, Ljavax/net/ssl/SSLSocket;->setSoTimeout(I)V

    .line 60
    return-object v4

    .line 46
    .end local v4    # "sslsock":Ljavax/net/ssl/SSLSocket;
    :cond_28
    invoke-virtual {p0}, Lorg/acra/util/FakeSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v4

    goto :goto_10
.end method

.method public createSocket()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/acra/util/FakeSocketFactory;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->createSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/acra/util/FakeSocketFactory;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public isSecure(Ljava/net/Socket;)Z
    .registers 3
    .param p1, "arg0"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 70
    const/4 v0, 0x1

    return v0
.end method
