.class Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;
.super Ljava/lang/Object;
.source "HttpClientConnectionOperator.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field static final SOCKET_FACTORY_REGISTRY:Ljava/lang/String; = "http.socket-factory-registry"


# instance fields
.field private final dnsResolver:Lcz/msebera/android/httpclient/conn/DnsResolver;

.field public log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

.field private final schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

.field private final socketFactoryRegistry:Lcz/msebera/android/httpclient/config/Lookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcz/msebera/android/httpclient/config/Lookup;Lcz/msebera/android/httpclient/conn/SchemePortResolver;Lcz/msebera/android/httpclient/conn/DnsResolver;)V
    .registers 6
    .param p2, "schemePortResolver"    # Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    .param p3, "dnsResolver"    # Lcz/msebera/android/httpclient/conn/DnsResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;",
            "Lcz/msebera/android/httpclient/conn/SchemePortResolver;",
            "Lcz/msebera/android/httpclient/conn/DnsResolver;",
            ")V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "socketFactoryRegistry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    .line 71
    const-string v0, "Socket factory registry"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->socketFactoryRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    .line 73
    if-eqz p2, :cond_1e

    .end local p2    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :goto_17
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    .line 75
    if-eqz p3, :cond_21

    .end local p3    # "dnsResolver":Lcz/msebera/android/httpclient/conn/DnsResolver;
    :goto_1b
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->dnsResolver:Lcz/msebera/android/httpclient/conn/DnsResolver;

    .line 77
    return-void

    .line 73
    .restart local p2    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    .restart local p3    # "dnsResolver":Lcz/msebera/android/httpclient/conn/DnsResolver;
    :cond_1e
    sget-object p2, Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/DefaultSchemePortResolver;

    goto :goto_17

    .line 75
    .end local p2    # "schemePortResolver":Lcz/msebera/android/httpclient/conn/SchemePortResolver;
    :cond_21
    sget-object p3, Lcz/msebera/android/httpclient/impl/conn/SystemDefaultDnsResolver;->INSTANCE:Lcz/msebera/android/httpclient/impl/conn/SystemDefaultDnsResolver;

    goto :goto_1b
.end method

.method private getSocketFactoryRegistry(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/config/Lookup;
    .registers 4
    .param p1, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/protocol/HttpContext;",
            ")",
            "Lcz/msebera/android/httpclient/config/Lookup",
            "<",
            "Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    const-string v1, "http.socket-factory-registry"

    invoke-interface {p1, v1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/config/Lookup;

    .line 83
    .local v0, "reg":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    if-nez v0, :cond_c

    .line 84
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->socketFactoryRegistry:Lcz/msebera/android/httpclient/config/Lookup;

    .line 86
    :cond_c
    return-object v0
.end method


# virtual methods
.method public connect(Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetSocketAddress;ILcz/msebera/android/httpclient/config/SocketConfig;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 25
    .param p1, "conn"    # Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .param p2, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p3, "localAddress"    # Ljava/net/InetSocketAddress;
    .param p4, "connectTimeout"    # I
    .param p5, "socketConfig"    # Lcz/msebera/android/httpclient/config/SocketConfig;
    .param p6, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-direct {v0, v1}, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->getSocketFactoryRegistry(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/config/Lookup;

    move-result-object v17

    .line 97
    .local v17, "registry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Lcz/msebera/android/httpclient/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;

    .line 98
    .local v2, "sf":Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;
    if-nez v2, :cond_33

    .line 99
    new-instance v3, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " protocol is not supported"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 102
    :cond_33
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getAddress()Ljava/net/InetAddress;

    move-result-object v3

    if-eqz v3, :cond_ef

    const/4 v3, 0x1

    new-array v10, v3, [Ljava/net/InetAddress;

    const/4 v3, 0x0

    .line 103
    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getAddress()Ljava/net/InetAddress;

    move-result-object v5

    aput-object v5, v10, v3

    .line 104
    .local v10, "addresses":[Ljava/net/InetAddress;
    :goto_43
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    move-object/from16 v0, p2

    invoke-interface {v3, v0}, Lcz/msebera/android/httpclient/conn/SchemePortResolver;->resolve(Lcz/msebera/android/httpclient/HttpHost;)I

    move-result v16

    .line 105
    .local v16, "port":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4e
    array-length v3, v10

    if-ge v12, v3, :cond_ee

    .line 106
    aget-object v9, v10, v12

    .line 107
    .local v9, "address":Ljava/net/InetAddress;
    array-length v3, v10

    add-int/lit8 v3, v3, -0x1

    if-ne v12, v3, :cond_fd

    const/4 v13, 0x1

    .line 109
    .local v13, "last":Z
    :goto_59
    move-object/from16 v0, p6

    invoke-interface {v2, v0}, Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;->createSocket(Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v4

    .line 110
    .local v4, "sock":Ljava/net/Socket;
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/config/SocketConfig;->getSoTimeout()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 111
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/config/SocketConfig;->isSoReuseAddress()Z

    move-result v3

    invoke-virtual {v4, v3}, Ljava/net/Socket;->setReuseAddress(Z)V

    .line 112
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/config/SocketConfig;->isTcpNoDelay()Z

    move-result v3

    invoke-virtual {v4, v3}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 113
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/config/SocketConfig;->isSoKeepAlive()Z

    move-result v3

    invoke-virtual {v4, v3}, Ljava/net/Socket;->setKeepAlive(Z)V

    .line 114
    invoke-virtual/range {p5 .. p5}, Lcz/msebera/android/httpclient/config/SocketConfig;->getSoLinger()I

    move-result v14

    .line 115
    .local v14, "linger":I
    if-ltz v14, :cond_87

    .line 116
    if-lez v14, :cond_100

    const/4 v3, 0x1

    :goto_84
    invoke-virtual {v4, v3, v14}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 118
    :cond_87
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 120
    new-instance v6, Ljava/net/InetSocketAddress;

    move/from16 v0, v16

    invoke-direct {v6, v9, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 121
    .local v6, "remoteAddress":Ljava/net/InetSocketAddress;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_b7

    .line 122
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connecting to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    :cond_b7
    move/from16 v3, p4

    move-object/from16 v5, p2

    move-object/from16 v7, p3

    move-object/from16 v8, p6

    .line 125
    :try_start_bf
    invoke-interface/range {v2 .. v8}, Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;->connectSocket(ILjava/net/Socket;Lcz/msebera/android/httpclient/HttpHost;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v4

    .line 127
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 128
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_ee

    .line 129
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connection established "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V
    :try_end_ee
    .catch Ljava/net/SocketTimeoutException; {:try_start_bf .. :try_end_ee} :catch_102
    .catch Ljava/net/ConnectException; {:try_start_bf .. :try_end_ee} :catch_10d
    .catch Ljava/net/NoRouteToHostException; {:try_start_bf .. :try_end_ee} :catch_12c

    .line 155
    .end local v4    # "sock":Ljava/net/Socket;
    .end local v6    # "remoteAddress":Ljava/net/InetSocketAddress;
    .end local v9    # "address":Ljava/net/InetAddress;
    .end local v13    # "last":Z
    .end local v14    # "linger":I
    :cond_ee
    return-void

    .line 103
    .end local v10    # "addresses":[Ljava/net/InetAddress;
    .end local v12    # "i":I
    .end local v16    # "port":I
    :cond_ef
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->dnsResolver:Lcz/msebera/android/httpclient/conn/DnsResolver;

    invoke-virtual/range {p2 .. p2}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lcz/msebera/android/httpclient/conn/DnsResolver;->resolve(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v10

    goto/16 :goto_43

    .line 107
    .restart local v9    # "address":Ljava/net/InetAddress;
    .restart local v10    # "addresses":[Ljava/net/InetAddress;
    .restart local v12    # "i":I
    .restart local v16    # "port":I
    :cond_fd
    const/4 v13, 0x0

    goto/16 :goto_59

    .line 116
    .restart local v4    # "sock":Ljava/net/Socket;
    .restart local v13    # "last":Z
    .restart local v14    # "linger":I
    :cond_100
    const/4 v3, 0x0

    goto :goto_84

    .line 132
    .restart local v6    # "remoteAddress":Ljava/net/InetSocketAddress;
    :catch_102
    move-exception v11

    .line 133
    .local v11, "ex":Ljava/net/SocketTimeoutException;
    if-eqz v13, :cond_130

    .line 134
    new-instance v3, Lcz/msebera/android/httpclient/conn/ConnectTimeoutException;

    move-object/from16 v0, p2

    invoke-direct {v3, v11, v0, v10}, Lcz/msebera/android/httpclient/conn/ConnectTimeoutException;-><init>(Ljava/io/IOException;Lcz/msebera/android/httpclient/HttpHost;[Ljava/net/InetAddress;)V

    throw v3

    .line 136
    .end local v11    # "ex":Ljava/net/SocketTimeoutException;
    :catch_10d
    move-exception v11

    .line 137
    .local v11, "ex":Ljava/net/ConnectException;
    if-eqz v13, :cond_130

    .line 138
    invoke-virtual {v11}, Ljava/net/ConnectException;->getMessage()Ljava/lang/String;

    move-result-object v15

    .line 139
    .local v15, "msg":Ljava/lang/String;
    const-string v3, "Connection timed out"

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_124

    .line 140
    new-instance v3, Lcz/msebera/android/httpclient/conn/ConnectTimeoutException;

    move-object/from16 v0, p2

    invoke-direct {v3, v11, v0, v10}, Lcz/msebera/android/httpclient/conn/ConnectTimeoutException;-><init>(Ljava/io/IOException;Lcz/msebera/android/httpclient/HttpHost;[Ljava/net/InetAddress;)V

    throw v3

    .line 142
    :cond_124
    new-instance v3, Lcz/msebera/android/httpclient/conn/HttpHostConnectException;

    move-object/from16 v0, p2

    invoke-direct {v3, v11, v0, v10}, Lcz/msebera/android/httpclient/conn/HttpHostConnectException;-><init>(Ljava/io/IOException;Lcz/msebera/android/httpclient/HttpHost;[Ljava/net/InetAddress;)V

    throw v3

    .line 145
    .end local v11    # "ex":Ljava/net/ConnectException;
    .end local v15    # "msg":Ljava/lang/String;
    :catch_12c
    move-exception v11

    .line 146
    .local v11, "ex":Ljava/net/NoRouteToHostException;
    if-eqz v13, :cond_130

    .line 147
    throw v11

    .line 150
    .end local v11    # "ex":Ljava/net/NoRouteToHostException;
    :cond_130
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    invoke-virtual {v3}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_160

    .line 151
    move-object/from16 v0, p0

    iget-object v3, v0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->log:Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connect to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " timed out. "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "Connection will be retried using another IP address"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcz/msebera/android/httpclient/extras/HttpClientAndroidLog;->debug(Ljava/lang/Object;)V

    .line 105
    :cond_160
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_4e
.end method

.method public upgrade(Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;Lcz/msebera/android/httpclient/HttpHost;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 13
    .param p1, "conn"    # Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;
    .param p2, "host"    # Lcz/msebera/android/httpclient/HttpHost;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-static {p3}, Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;->adapt(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;

    move-result-object v0

    .line 162
    .local v0, "clientContext":Lcz/msebera/android/httpclient/client/protocol/HttpClientContext;
    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->getSocketFactoryRegistry(Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/config/Lookup;

    move-result-object v3

    .line 163
    .local v3, "registry":Lcz/msebera/android/httpclient/config/Lookup;, "Lcz/msebera/android/httpclient/config/Lookup<Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;>;"
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Lcz/msebera/android/httpclient/config/Lookup;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;

    .line 164
    .local v4, "sf":Lcz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory;
    if-nez v4, :cond_31

    .line 165
    new-instance v6, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " protocol is not supported"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 168
    :cond_31
    instance-of v6, v4, Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

    if-nez v6, :cond_52

    .line 169
    new-instance v6, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcz/msebera/android/httpclient/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " protocol does not support connection upgrade"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcz/msebera/android/httpclient/conn/UnsupportedSchemeException;-><init>(Ljava/lang/String;)V

    throw v6

    :cond_52
    move-object v1, v4

    .line 172
    check-cast v1, Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;

    .line 173
    .local v1, "lsf":Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v5

    .line 174
    .local v5, "sock":Ljava/net/Socket;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator;->schemePortResolver:Lcz/msebera/android/httpclient/conn/SchemePortResolver;

    invoke-interface {v6, p2}, Lcz/msebera/android/httpclient/conn/SchemePortResolver;->resolve(Lcz/msebera/android/httpclient/HttpHost;)I

    move-result v2

    .line 175
    .local v2, "port":I
    invoke-virtual {p2}, Lcz/msebera/android/httpclient/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6, v2, p3}, Lcz/msebera/android/httpclient/conn/socket/LayeredConnectionSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILcz/msebera/android/httpclient/protocol/HttpContext;)Ljava/net/Socket;

    move-result-object v5

    .line 176
    invoke-interface {p1, v5}, Lcz/msebera/android/httpclient/conn/ManagedHttpClientConnection;->bind(Ljava/net/Socket;)V

    .line 177
    return-void
.end method
