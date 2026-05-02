.class public Lorg/apache/http/impl/DefaultHttpClientConnection;
.super Lorg/apache/http/impl/SocketHttpClientConnection;
.source "DefaultHttpClientConnection.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/http/impl/SocketHttpClientConnection;-><init>()V

    .line 61
    return-void
.end method


# virtual methods
.method public bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "socket"    # Ljava/net/Socket;
    .param p2, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    if-nez p1, :cond_a

    .line 68
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Socket may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_a
    if-nez p2, :cond_14

    .line 71
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "HTTP parameters may not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 73
    :cond_14
    invoke-virtual {p0}, Lorg/apache/http/impl/DefaultHttpClientConnection;->assertNotOpen()V

    .line 74
    invoke-static {p2}, Lorg/apache/http/params/HttpConnectionParams;->getTcpNoDelay(Lorg/apache/http/params/HttpParams;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 75
    invoke-static {p2}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 76
    invoke-static {p2}, Lorg/apache/http/params/HttpConnectionParams;->getSoKeepalive(Lorg/apache/http/params/HttpParams;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 78
    invoke-static {p2}, Lorg/apache/http/params/HttpConnectionParams;->getLinger(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 79
    .local v0, "linger":I
    if-ltz v0, :cond_38

    .line 80
    if-lez v0, :cond_3c

    const/4 v1, 0x1

    :goto_35
    invoke-virtual {p1, v1, v0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 82
    :cond_38
    invoke-super {p0, p1, p2}, Lorg/apache/http/impl/SocketHttpClientConnection;->bind(Ljava/net/Socket;Lorg/apache/http/params/HttpParams;)V

    .line 83
    return-void

    .line 80
    :cond_3c
    const/4 v1, 0x0

    goto :goto_35
.end method
