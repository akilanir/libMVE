.class Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;
.super Ljava/lang/Object;
.source "CPoolProxy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
.implements Lcz/msebera/android/httpclient/protocol/HttpContext;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private volatile poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;)V
    .registers 2
    .param p1, "entry"    # Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 56
    return-void
.end method

.method public static detach(Lcz/msebera/android/httpclient/HttpClientConnection;)Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    .registers 2
    .param p0, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;

    .prologue
    .line 242
    invoke-static {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getProxy(Lcz/msebera/android/httpclient/HttpClientConnection;)Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->detach()Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    move-result-object v0

    return-object v0
.end method

.method public static getPoolEntry(Lcz/msebera/android/httpclient/HttpClientConnection;)Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    .registers 3
    .param p0, "proxy"    # Lcz/msebera/android/httpclient/HttpClientConnection;

    .prologue
    .line 234
    invoke-static {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getProxy(Lcz/msebera/android/httpclient/HttpClientConnection;)Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getPoolEntry()Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    move-result-object v0

    .line 235
    .local v0, "entry":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    if-nez v0, :cond_10

    .line 236
    new-instance v1, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;-><init>()V

    throw v1

    .line 238
    :cond_10
    return-object v0
.end method

.method private static getProxy(Lcz/msebera/android/httpclient/HttpClientConnection;)Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;
    .registers 4
    .param p0, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;

    .prologue
    .line 227
    const-class v0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 228
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected connection proxy class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_25
    const-class v0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    return-object v0
.end method

.method public static newProxy(Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;)Lcz/msebera/android/httpclient/HttpClientConnection;
    .registers 2
    .param p0, "poolEntry"    # Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .prologue
    .line 223
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;

    invoke-direct {v0, p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;-><init>(Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;)V

    return-object v0
.end method


# virtual methods
.method public bind(Ljava/net/Socket;)V
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 130
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 86
    .local v0, "local":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    if-eqz v0, :cond_7

    .line 87
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->closeConnection()V

    .line 89
    :cond_7
    return-void
.end method

.method detach()Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    .registers 3

    .prologue
    .line 63
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 64
    .local v0, "local":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 65
    return-object v0
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->flush()V

    .line 162
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 186
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_f

    .line 187
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 189
    :goto_e
    return-object v1

    .restart local v0    # "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method getConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .registers 3

    .prologue
    .line 69
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 70
    .local v0, "local":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    if-nez v0, :cond_6

    .line 71
    const/4 v1, 0x0

    .line 73
    :goto_5
    return-object v1

    :cond_6
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    goto :goto_5
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 169
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getLocalPort()I
    .registers 2

    .prologue
    .line 173
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getMetrics()Lcz/msebera/android/httpclient/HttpConnectionMetrics;
    .registers 2

    .prologue
    .line 165
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getMetrics()Lcz/msebera/android/httpclient/HttpConnectionMetrics;

    move-result-object v0

    return-object v0
.end method

.method getPoolEntry()Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 2

    .prologue
    .line 177
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getRemoteAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getRemotePort()I
    .registers 2

    .prologue
    .line 181
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getRemotePort()I

    move-result v0

    return v0
.end method

.method public getSSLSession()Ljavax/net/ssl/SSLSession;
    .registers 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getSSLSession()Ljavax/net/ssl/SSLSession;

    move-result-object v0

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 133
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public getSocketTimeout()I
    .registers 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getSocketTimeout()I

    move-result v0

    return v0
.end method

.method getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .registers 3

    .prologue
    .line 77
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 78
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    if-nez v0, :cond_c

    .line 79
    new-instance v1, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/impl/conn/ConnectionShutdownException;-><init>()V

    throw v1

    .line 81
    :cond_c
    return-object v0
.end method

.method public isOpen()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 99
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 100
    .local v0, "local":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    if-eqz v0, :cond_c

    .line 101
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->isClosed()Z

    move-result v2

    if-nez v2, :cond_c

    const/4 v1, 0x1

    .line 103
    :cond_c
    return v1
.end method

.method public isResponseAvailable(I)Z
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->isResponseAvailable(I)Z

    move-result v0

    return v0
.end method

.method public isStale()Z
    .registers 3

    .prologue
    .line 108
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 109
    .local v0, "conn":Lcz/msebera/android/httpclient/HttpClientConnection;
    if-eqz v0, :cond_b

    .line 110
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->isStale()Z

    move-result v1

    .line 112
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x1

    goto :goto_a
.end method

.method public receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 158
    return-void
.end method

.method public receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 201
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 202
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_f

    .line 203
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 205
    :goto_e
    return-object v1

    .restart local v0    # "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public sendRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->sendRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 150
    return-void
.end method

.method public sendRequestHeader(Lcz/msebera/android/httpclient/HttpRequest;)V
    .registers 3
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->sendRequestHeader(Lcz/msebera/android/httpclient/HttpRequest;)V

    .line 146
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 194
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 195
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    instance-of v1, v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    if-eqz v1, :cond_d

    .line 196
    check-cast v0, Lcz/msebera/android/httpclient/protocol/HttpContext;

    .end local v0    # "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 198
    :cond_d
    return-void
.end method

.method public setSocketTimeout(I)V
    .registers 3
    .param p1, "timeout"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getValidConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->setSocketTimeout(I)V

    .line 118
    return-void
.end method

.method public shutdown()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->poolEntry:Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;

    .line 93
    .local v0, "local":Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
    if-eqz v0, :cond_7

    .line 94
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->shutdownConnection()V

    .line 96
    :cond_7
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CPoolProxy{"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 212
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolProxy;->getConnection()Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    move-result-object v0

    .line 213
    .local v0, "conn":Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    if-eqz v0, :cond_1a

    .line 214
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 218
    :goto_10
    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 219
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 216
    :cond_1a
    const-string v2, "detached"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_10
.end method
