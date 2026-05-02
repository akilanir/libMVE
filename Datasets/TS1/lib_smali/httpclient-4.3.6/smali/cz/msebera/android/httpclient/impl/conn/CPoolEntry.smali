.class Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;
.super Lcz/msebera/android/httpclient/pool/PoolEntry;
.source "CPoolEntry.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcz/msebera/android/httpclient/pool/PoolEntry",
        "<",
        "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
        "Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;",
        ">;"
    }
.end annotation


# instance fields
.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private volatile routeComplete:Z


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;Ljava/lang/String;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;JLjava/util/concurrent/TimeUnit;)V
    .registers 15
    .param p1, "log"    # Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p4, "conn"    # Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .param p5, "timeToLive"    # J
    .param p7, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 55
    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-wide v4, p5

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lcz/msebera/android/httpclient/pool/PoolEntry;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V

    .line 56
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 57
    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .prologue
    .line 95
    :try_start_0
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->closeConnection()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 99
    :goto_3
    return-void

    .line 96
    :catch_4
    move-exception v0

    .line 97
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "I/O error closing connection"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public closeConnection()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpClientConnection;

    .line 69
    .local v0, "conn":Lcz/msebera/android/httpclient/HttpClientConnection;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V

    .line 70
    return-void
.end method

.method public isClosed()Z
    .registers 3

    .prologue
    .line 88
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpClientConnection;

    .line 89
    .local v0, "conn":Lcz/msebera/android/httpclient/HttpClientConnection;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->isOpen()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isExpired(J)Z
    .registers 9
    .param p1, "now"    # J

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lcz/msebera/android/httpclient/pool/PoolEntry;->isExpired(J)Z

    move-result v0

    .line 80
    .local v0, "expired":Z
    if-eqz v0, :cond_39

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 81
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " expired @ "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->getExpiry()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 83
    :cond_39
    return v0
.end method

.method public isRouteComplete()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->routeComplete:Z

    return v0
.end method

.method public markRouteComplete()V
    .registers 2

    .prologue
    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->routeComplete:Z

    .line 61
    return-void
.end method

.method public shutdownConnection()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/CPoolEntry;->getConnection()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/HttpClientConnection;

    .line 74
    .local v0, "conn":Lcz/msebera/android/httpclient/HttpClientConnection;
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->shutdown()V

    .line 75
    return-void
.end method
