.class public Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;
.super Ljava/lang/Object;
.source "BasicHttpClientConnectionManager.java"

# interfaces
.implements Lcz/msebera/android/httpclient/conn/HttpClientConnectionManager;
.implements Ljava/io/Closeable;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# instance fields
.field private conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private connConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final connFactory:Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory",
            "<",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionOperator:Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;

.field private expiry:J
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private final isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private leased:Z
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private socketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private state:Ljava/lang/Object;
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private updated:J
    .annotation build Lcz/msebera/android/httpclient/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 147
    invoke-static {}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->getDefaultRegistry()Lcz/msebera/android/httpclient/config/Registry;

    move-result-object v0

    invoke-direct {p0, v0, v1, v1, v1}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;-><init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V

    .line 148
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/config/Lookup;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "socketFactoryRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, p1, v0, v0, v0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;-><init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V

    .line 144
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory",
            "<",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "socketFactoryRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;, "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory<Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;>;"
    const/4 v0, 0x0

    .line 138
    invoke-direct {p0, p1, p2, v0, v0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;-><init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V

    .line 139
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V
    .registers 7
    .param p3, "schemePortResolver"    # Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    .param p4, "dnsResolver"    # Lcz/msebera/android/httpclient/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory",
            "<",
            "Lcz/msebera/android/httpclient/conn/routing/HttpRoute;",
            "Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;",
            ">;",
            "Lcz/msebera/android/httpclient/conn/SchemePortResolver;",
            "Lcz/msebera/android/httpclient/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 125
    .local p1, "socketFactoryRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    .local p2, "connFactory":Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;, "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory<Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 126
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;

    invoke-direct {v0, p1, p3, p4}, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;-><init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;

    .line 128
    if-eqz p2, :cond_31

    .end local p2    # "connFactory":Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;, "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory<Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;>;"
    :goto_17
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connFactory:Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;

    .line 129
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    .line 130
    sget-object v0, Lcz/msebera/android/httpclient/config/SocketConfig;->DEFAULT:Lcz/msebera/android/httpclient/config/SocketConfig;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

    .line 131
    sget-object v0, Lcz/msebera/android/httpclient/config/ConnectionConfig;->DEFAULT:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    .line 132
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 133
    return-void

    .line 128
    .restart local p2    # "connFactory":Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;, "Lcz/msebera/android/httpclient/conn/HttpConnectionFactory<Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;>;"
    :cond_31
    sget-object p2, Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/ManagedHttpClientConnectionFactory;

    goto :goto_17
.end method

.method private checkExpiry()V
    .registers 6

    .prologue
    .line 235
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-eqz v0, :cond_38

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_38

    .line 236
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 237
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connection expired @ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 239
    :cond_35
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V

    .line 241
    :cond_38
    return-void
.end method

.method private closeConnection()V
    .registers 4

    .prologue
    .line 207
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-eqz v1, :cond_13

    .line 208
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Closing connection"

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 210
    :try_start_b
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_14

    .line 216
    :cond_10
    :goto_10
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .line 218
    :cond_13
    return-void

    .line 211
    :catch_14
    move-exception v0

    .line 212
    .local v0, "iox":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 213
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "I/O exception closing connection"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_10
.end method

.method private static getDefaultRegistry()Lcz/msebera/android/httpclient/config/Registry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcz/msebera/android/httpclient/config/Registry",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    invoke-static {}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->create()Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v0

    const-string v1, "http"

    .line 115
    invoke-static {}, Lcz/msebera/android/httpclient/conn/socket/PlainConnectionSocketFactory;->getSocketFactory()Lcz/msebera/android/httpclient/conn/socket/PlainConnectionSocketFactory;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v0

    const-string v1, "https"

    .line 116
    invoke-static {}, Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;->getSocketFactory()Lcz/msebera/android/httpclient/conn/ssl/SSLConnectionSocketFactory;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->register(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/config/RegistryBuilder;

    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lcz/msebera/android/httpclient/config/RegistryBuilder;->build()Lcz/msebera/android/httpclient/config/Registry;

    move-result-object v0

    return-object v0
.end method

.method private shutdownConnection()V
    .registers 4

    .prologue
    .line 221
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-eqz v1, :cond_13

    .line 222
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "Shutting down connection"

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 224
    :try_start_b
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->shutdown()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_14

    .line 230
    :cond_10
    :goto_10
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .line 232
    :cond_13
    return-void

    .line 225
    :catch_14
    move-exception v0

    .line 226
    .local v0, "iox":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 227
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    const-string v2, "I/O exception shutting down connection"

    invoke-virtual {v1, v2, v0}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_10
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 160
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->shutdown()V

    .line 161
    return-void
.end method

.method public declared-synchronized closeExpiredConnections()V
    .registers 2

    .prologue
    .line 339
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_13

    move-result v0

    if-eqz v0, :cond_b

    .line 345
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 342
    :cond_b
    :try_start_b
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v0, :cond_9

    .line 343
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->checkExpiry()V
    :try_end_12
    .catchall {:try_start_b .. :try_end_12} :catchall_13

    goto :goto_9

    .line 339
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized closeIdleConnections(JLjava/util/concurrent/TimeUnit;)V
    .registers 10
    .param p1, "idletime"    # J
    .param p3, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 348
    monitor-enter p0

    :try_start_1
    const-string v4, "Time unit"

    invoke-static {p3, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 349
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_30

    move-result v4

    if-eqz v4, :cond_10

    .line 362
    :cond_e
    :goto_e
    monitor-exit p0

    return-void

    .line 352
    :cond_10
    :try_start_10
    iget-boolean v4, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v4, :cond_e

    .line 353
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    .line 354
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_20

    .line 355
    const-wide/16 v2, 0x0

    .line 357
    :cond_20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v2

    .line 358
    .local v0, "deadline":J
    iget-wide v4, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->updated:J

    cmp-long v4, v4, v0

    if-gtz v4, :cond_e

    .line 359
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V
    :try_end_2f
    .catchall {:try_start_10 .. :try_end_2f} :catchall_30

    goto :goto_e

    .line 348
    .end local v0    # "deadline":J
    .end local v2    # "time":J
    :catchall_30
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public connect(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;ILcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 12
    .param p1, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p2, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p3, "connectTimeout"    # I
    .param p4, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    const-string v0, "Connection"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 309
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 310
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-ne p1, v0, :cond_2e

    const/4 v0, 0x1

    :goto_f
    const-string v1, "Connection not obtained from this manager"

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 312
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v0

    if-eqz v0, :cond_30

    .line 313
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getProxyHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    .line 317
    .local v2, "host":Lcz/msebera/android/httpclient/HttpHost;
    :goto_1e
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getLocalSocketAddress()Ljava/net/InetSocketAddress;

    move-result-object v3

    .line 318
    .local v3, "localAddress":Ljava/net/InetSocketAddress;
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    iget-object v5, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;

    move v4, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->connect(Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetSocketAddress;ILcz/msebera/android/httpclient/config/SocketConfig;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 320
    return-void

    .line 310
    .end local v2    # "host":Lcz/msebera/android/httpclient/HttpHost;
    .end local v3    # "localAddress":Ljava/net/InetSocketAddress;
    :cond_2e
    const/4 v0, 0x0

    goto :goto_f

    .line 315
    :cond_30
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    .restart local v2    # "host":Lcz/msebera/android/httpclient/HttpHost;
    goto :goto_1e
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 153
    :try_start_0
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->shutdown()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    .line 155
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 157
    return-void

    .line 155
    :catchall_7
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method

.method declared-synchronized getConnection(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/HttpClientConnection;
    .registers 8
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 244
    monitor-enter p0

    :try_start_3
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_6b

    move v2, v0

    :goto_c
    const-string v3, "Connection manager has been shut down"

    invoke-static {v2, v3}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 245
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 246
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Get connection for route "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 248
    :cond_31
    iget-boolean v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    if-nez v2, :cond_6d

    :goto_35
    const-string v1, "Connection is still allocated"

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 249
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    invoke-static {v0, p1}, Lcz/msebera/android/httpclient/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    invoke-static {v0, p2}, Lcz/msebera/android/httpclient/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4d

    .line 250
    :cond_4a
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->closeConnection()V

    .line 252
    :cond_4d
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .line 253
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    .line 254
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->checkExpiry()V

    .line 255
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-nez v0, :cond_64

    .line 256
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connFactory:Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;

    invoke-interface {v0, p1, v1}, Lcz/msebera/android/httpclient/conn/HttpConnectionFactory;->create(Ljava/lang/Object;Lcz/msebera/android/httpclient/config/ConnectionConfig;)Lcz/msebera/android/httpclient/HttpConnection;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .line 258
    :cond_64
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    .line 259
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    :try_end_69
    .catchall {:try_start_3 .. :try_end_69} :catchall_6f

    monitor-exit p0

    return-object v0

    :cond_6b
    move v2, v1

    .line 244
    goto :goto_c

    :cond_6d
    move v0, v1

    .line 248
    goto :goto_35

    .line 244
    :catchall_6f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConnectionConfig()Lcz/msebera/android/httpclient/config/ConnectionConfig;
    .registers 2

    .prologue
    .line 180
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getRoute()Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    return-object v0
.end method

.method public declared-synchronized getSocketConfig()Lcz/msebera/android/httpclient/config/SocketConfig;
    .registers 2

    .prologue
    .line 172
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getState()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized releaseConnection(Lcz/msebera/android/httpclient/HttpClientConnection;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    .registers 12
    .param p1, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p2, "state"    # Ljava/lang/Object;
    .param p3, "keepalive"    # J
    .param p5, "tunit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v1, 0x0

    .line 266
    monitor-enter p0

    :try_start_4
    const-string v2, "Connection"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 267
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-ne p1, v2, :cond_e

    const/4 v1, 0x1

    :cond_e
    const-string v2, "Connection not obtained from this manager"

    invoke-static {v1, v2}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 268
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_33

    .line 269
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Releasing connection "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 271
    :cond_33
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
    :try_end_38
    .catchall {:try_start_4 .. :try_end_38} :catchall_5f

    move-result v1

    if-eqz v1, :cond_3d

    .line 301
    :goto_3b
    monitor-exit p0

    return-void

    .line 275
    :cond_3d
    :try_start_3d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->updated:J

    .line 276
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->isOpen()Z

    move-result v1

    if-nez v1, :cond_62

    .line 277
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .line 278
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->route:Lcz/msebera/android/httpclient/conn/routing/HttpRoute;

    .line 279
    const/4 v1, 0x0

    iput-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    .line 280
    const-wide v1, 0x7fffffffffffffffL

    iput-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_5b
    .catchall {:try_start_3d .. :try_end_5b} :catchall_b3

    .line 299
    :goto_5b
    const/4 v1, 0x0

    :try_start_5c
    iput-boolean v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z
    :try_end_5e
    .catchall {:try_start_5c .. :try_end_5e} :catchall_5f

    goto :goto_3b

    .line 266
    :catchall_5f
    move-exception v1

    monitor-exit p0

    throw v1

    .line 282
    :cond_62
    :try_start_62
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->state:Ljava/lang/Object;

    .line 283
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_a5

    .line 285
    cmp-long v1, p3, v4

    if-lez v1, :cond_b8

    .line 286
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 290
    .local v0, "s":Ljava/lang/String;
    :goto_8d
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Connection can be kept alive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 292
    .end local v0    # "s":Ljava/lang/String;
    :cond_a5
    cmp-long v1, p3, v4

    if-lez v1, :cond_bb

    .line 293
    iget-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->updated:J

    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_b2
    .catchall {:try_start_62 .. :try_end_b2} :catchall_b3

    goto :goto_5b

    .line 299
    :catchall_b3
    move-exception v1

    const/4 v2, 0x0

    :try_start_b5
    iput-boolean v2, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->leased:Z

    throw v1
    :try_end_b8
    .catchall {:try_start_b5 .. :try_end_b8} :catchall_5f

    .line 288
    :cond_b8
    :try_start_b8
    const-string v0, "indefinitely"

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_8d

    .line 295
    .end local v0    # "s":Ljava/lang/String;
    :cond_bb
    const-wide v1, 0x7fffffffffffffffL

    iput-wide v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->expiry:J
    :try_end_c2
    .catchall {:try_start_b8 .. :try_end_c2} :catchall_b3

    goto :goto_5b
.end method

.method public final requestConnection(Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)Lcz/msebera/android/httpclient/conn/ConnectionRequest;
    .registers 4
    .param p1, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p2, "state"    # Ljava/lang/Object;

    .prologue
    .line 190
    const-string v0, "Route"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 191
    new-instance v0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager$1;

    invoke-direct {v0, p0, p1, p2}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager$1;-><init>(Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Ljava/lang/Object;)V

    return-object v0
.end method

.method public routeComplete(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 4
    .param p1, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p2, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    return-void
.end method

.method public declared-synchronized setConnectionConfig(Lcz/msebera/android/httpclient/config/ConnectionConfig;)V
    .registers 3
    .param p1, "connConfig"    # Lcz/msebera/android/httpclient/config/ConnectionConfig;

    .prologue
    .line 184
    monitor-enter p0

    if-eqz p1, :cond_7

    .end local p1    # "connConfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :goto_3
    :try_start_3
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connConfig:Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_a

    .line 185
    monitor-exit p0

    return-void

    .line 184
    .restart local p1    # "connConfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :cond_7
    :try_start_7
    sget-object p1, Lcz/msebera/android/httpclient/config/ConnectionConfig;->DEFAULT:Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_a

    goto :goto_3

    .end local p1    # "connConfig":Lcz/msebera/android/httpclient/config/ConnectionConfig;
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSocketConfig(Lcz/msebera/android/httpclient/config/SocketConfig;)V
    .registers 3
    .param p1, "socketConfig"    # Lcz/msebera/android/httpclient/config/SocketConfig;

    .prologue
    .line 176
    monitor-enter p0

    if-eqz p1, :cond_7

    .end local p1    # "socketConfig":Lcz/msebera/android/httpclient/config/SocketConfig;
    :goto_3
    :try_start_3
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->socketConfig:Lcz/msebera/android/httpclient/config/SocketConfig;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_a

    .line 177
    monitor-exit p0

    return-void

    .line 176
    .restart local p1    # "socketConfig":Lcz/msebera/android/httpclient/config/SocketConfig;
    :cond_7
    :try_start_7
    sget-object p1, Lcz/msebera/android/httpclient/config/SocketConfig;->DEFAULT:Lcz/msebera/android/httpclient/config/SocketConfig;
    :try_end_9
    .catchall {:try_start_7 .. :try_end_9} :catchall_a

    goto :goto_3

    .end local p1    # "socketConfig":Lcz/msebera/android/httpclient/config/SocketConfig;
    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized shutdown()V
    .registers 4

    .prologue
    .line 365
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->isShutdown:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 366
    invoke-direct {p0}, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->shutdownConnection()V
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 368
    :cond_e
    monitor-exit p0

    return-void

    .line 365
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public upgrade(Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/conn/routing/HttpRoute;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 7
    .param p1, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p2, "route"    # Lcz/msebera/android/httpclient/conn/routing/HttpRoute;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    const-string v0, "Connection"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 327
    const-string v0, "HTTP route"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 328
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    if-ne p1, v0, :cond_20

    const/4 v0, 0x1

    :goto_f
    const-string v1, "Connection not obtained from this manager"

    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 329
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->connectionOperator:Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/BasicHttpClientConnectionManager;->conn:Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;

    invoke-virtual {p2}, Lcz/msebera/android/httpclient/conn/routing/HttpRoute;->getTargetHost()Lcz/msebera/android/httpclient/HttpHost;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p3}, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->upgrade(Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 330
    return-void

    .line 328
    :cond_20
    const/4 v0, 0x0

    goto :goto_f
.end method
