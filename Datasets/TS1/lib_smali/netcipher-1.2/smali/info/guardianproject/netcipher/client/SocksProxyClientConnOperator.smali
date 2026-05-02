.class public Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;
.super Lch/boye/httpclientandroidlib/impl/conn/DefaultClientConnectionOperator;
.source "SocksProxyClientConnOperator.java"


# static fields
.field private static final CONNECT_TIMEOUT_MILLISECONDS:I = 0xea60

.field private static final READ_TIMEOUT_MILLISECONDS:I = 0xea60


# instance fields
.field private mProxyHost:Ljava/lang/String;

.field private mProxyPort:I


# direct methods
.method public constructor <init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;Ljava/lang/String;I)V
    .registers 4
    .param p1, "registry"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;
    .param p2, "proxyHost"    # Ljava/lang/String;
    .param p3, "proxyPort"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lch/boye/httpclientandroidlib/impl/conn/DefaultClientConnectionOperator;-><init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    .line 34
    iput-object p2, p0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->mProxyHost:Ljava/lang/String;

    .line 35
    iput p3, p0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->mProxyPort:I

    .line 36
    return-void
.end method


# virtual methods
.method public openConnection(Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;Lch/boye/httpclientandroidlib/HttpHost;Ljava/net/InetAddress;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V
    .registers 21
    .param p1, "conn"    # Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;
    .param p2, "target"    # Lch/boye/httpclientandroidlib/HttpHost;
    .param p3, "local"    # Ljava/net/InetAddress;
    .param p4, "context"    # Lch/boye/httpclientandroidlib/protocol/HttpContext;
    .param p5, "params"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    const/4 v9, 0x0

    .line 47
    .local v9, "socket":Ljava/net/Socket;
    const/4 v11, 0x0

    .line 49
    .local v11, "sslSocket":Ljava/net/Socket;
    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    if-nez p5, :cond_1c

    .line 50
    :cond_8
    :try_start_8
    new-instance v12, Ljava/lang/IllegalArgumentException;

    const-string v13, "Required argument may not be null"

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_10} :catch_10

    .line 119
    :catch_10
    move-exception v2

    .line 121
    .local v2, "e":Ljava/io/IOException;
    :goto_11
    if-eqz v11, :cond_16

    .line 122
    :try_start_13
    invoke-virtual {v11}, Ljava/net/Socket;->close()V

    .line 124
    :cond_16
    if-eqz v9, :cond_1b

    .line 125
    invoke-virtual {v9}, Ljava/net/Socket;->close()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1b} :catch_104

    .line 128
    :cond_1b
    :goto_1b
    throw v2

    .line 52
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1c
    :try_start_1c
    invoke-interface/range {p1 .. p1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->isOpen()Z

    move-result v12

    if-eqz v12, :cond_2a

    .line 53
    new-instance v12, Ljava/lang/IllegalStateException;

    const-string v13, "Connection must not be open"

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 56
    :cond_2a
    iget-object v12, p0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->schemeRegistry:Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    invoke-virtual/range {p2 .. p2}, Lch/boye/httpclientandroidlib/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lch/boye/httpclientandroidlib/conn/scheme/Scheme;

    move-result-object v7

    .line 57
    .local v7, "scheme":Lch/boye/httpclientandroidlib/conn/scheme/Scheme;
    invoke-virtual {v7}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;->getSchemeSocketFactory()Lch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;

    move-result-object v8

    .line 59
    .local v8, "schemeSocketFactory":Lch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;
    invoke-virtual/range {p2 .. p2}, Lch/boye/httpclientandroidlib/HttpHost;->getPort()I

    move-result v12

    invoke-virtual {v7, v12}, Lch/boye/httpclientandroidlib/conn/scheme/Scheme;->resolvePort(I)I

    move-result v6

    .line 60
    .local v6, "port":I
    invoke-virtual/range {p2 .. p2}, Lch/boye/httpclientandroidlib/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    .line 82
    .local v3, "host":Ljava/lang/String;
    new-instance v10, Ljava/net/Socket;

    invoke-direct {v10}, Ljava/net/Socket;-><init>()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_49} :catch_10

    .line 83
    .end local v9    # "socket":Ljava/net/Socket;
    .local v10, "socket":Ljava/net/Socket;
    :try_start_49
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v10, v1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lch/boye/httpclientandroidlib/HttpHost;)V

    .line 84
    const v12, 0xea60

    invoke-virtual {v10, v12}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 85
    new-instance v12, Ljava/net/InetSocketAddress;

    iget-object v13, p0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->mProxyHost:Ljava/lang/String;

    iget v14, p0, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->mProxyPort:I

    invoke-direct {v12, v13, v14}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const v13, 0xea60

    invoke-virtual {v10, v12, v13}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 87
    new-instance v5, Ljava/io/DataOutputStream;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v12

    invoke-direct {v5, v12}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 88
    .local v5, "outputStream":Ljava/io/DataOutputStream;
    const/4 v12, 0x4

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->write(I)V

    .line 89
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->write(I)V

    .line 90
    int-to-short v12, v6

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 91
    const/4 v12, 0x1

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 92
    const/4 v12, 0x0

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->write(I)V

    .line 93
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->write([B)V

    .line 94
    const/4 v12, 0x0

    invoke-virtual {v5, v12}, Ljava/io/DataOutputStream;->write(I)V

    .line 96
    new-instance v4, Ljava/io/DataInputStream;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v4, v12}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 97
    .local v4, "inputStream":Ljava/io/DataInputStream;
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readByte()B

    move-result v12

    if-nez v12, :cond_a4

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readByte()B

    move-result v12

    const/16 v13, 0x5a

    if-eq v12, v13, :cond_b0

    .line 98
    :cond_a4
    new-instance v12, Ljava/io/IOException;

    const-string v13, "SOCKS4a connect failed"

    invoke-direct {v12, v13}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 119
    .end local v4    # "inputStream":Ljava/io/DataInputStream;
    .end local v5    # "outputStream":Ljava/io/DataOutputStream;
    :catch_ac
    move-exception v2

    move-object v9, v10

    .end local v10    # "socket":Ljava/net/Socket;
    .restart local v9    # "socket":Ljava/net/Socket;
    goto/16 :goto_11

    .line 100
    .end local v9    # "socket":Ljava/net/Socket;
    .restart local v4    # "inputStream":Ljava/io/DataInputStream;
    .restart local v5    # "outputStream":Ljava/io/DataOutputStream;
    .restart local v10    # "socket":Ljava/net/Socket;
    :cond_b0
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readShort()S

    .line 101
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    .line 103
    instance-of v12, v8, Lch/boye/httpclientandroidlib/conn/ssl/SSLSocketFactory;

    if-eqz v12, :cond_e4

    .line 105
    move-object v0, v8

    check-cast v0, Lch/boye/httpclientandroidlib/conn/ssl/SSLSocketFactory;

    move-object v12, v0

    move-object/from16 v0, p5

    invoke-virtual {v12, v10, v3, v6, v0}, Lch/boye/httpclientandroidlib/conn/ssl/SSLSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILch/boye/httpclientandroidlib/params/HttpParams;)Ljava/net/Socket;

    move-result-object v11

    .line 106
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v11, v1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lch/boye/httpclientandroidlib/HttpHost;)V

    .line 107
    const v12, 0xea60

    invoke-virtual {v11, v12}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 108
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {p0, v11, v0, v1}, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->prepareSocket(Ljava/net/Socket;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V

    .line 109
    invoke-interface {v8, v11}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v12

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    invoke-interface {v0, v12, v1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->openCompleted(ZLch/boye/httpclientandroidlib/params/HttpParams;)V

    .line 130
    :goto_e3
    return-void

    .line 113
    :cond_e4
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v10, v1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lch/boye/httpclientandroidlib/HttpHost;)V

    .line 114
    const v12, 0xea60

    invoke-virtual {v10, v12}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 115
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {p0, v10, v0, v1}, Linfo/guardianproject/netcipher/client/SocksProxyClientConnOperator;->prepareSocket(Ljava/net/Socket;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V

    .line 116
    invoke-interface {v8, v10}, Lch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v12

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    invoke-interface {v0, v12, v1}, Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;->openCompleted(ZLch/boye/httpclientandroidlib/params/HttpParams;)V
    :try_end_103
    .catch Ljava/io/IOException; {:try_start_49 .. :try_end_103} :catch_ac

    goto :goto_e3

    .line 127
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "inputStream":Ljava/io/DataInputStream;
    .end local v5    # "outputStream":Ljava/io/DataOutputStream;
    .end local v6    # "port":I
    .end local v7    # "scheme":Lch/boye/httpclientandroidlib/conn/scheme/Scheme;
    .end local v8    # "schemeSocketFactory":Lch/boye/httpclientandroidlib/conn/scheme/SchemeSocketFactory;
    .end local v10    # "socket":Ljava/net/Socket;
    .restart local v2    # "e":Ljava/io/IOException;
    .restart local v9    # "socket":Ljava/net/Socket;
    :catch_104
    move-exception v12

    goto/16 :goto_1b
.end method

.method protected resolveHostname(Ljava/lang/String;)[Ljava/net/InetAddress;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public updateSecureConnection(Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;Lch/boye/httpclientandroidlib/HttpHost;Lch/boye/httpclientandroidlib/protocol/HttpContext;Lch/boye/httpclientandroidlib/params/HttpParams;)V
    .registers 7
    .param p1, "conn"    # Lch/boye/httpclientandroidlib/conn/OperatedClientConnection;
    .param p2, "target"    # Lch/boye/httpclientandroidlib/HttpHost;
    .param p3, "context"    # Lch/boye/httpclientandroidlib/protocol/HttpContext;
    .param p4, "params"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
