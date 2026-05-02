.class public Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;
.super Ljavax/net/SocketFactory;
.source "Socks4ProxySocketFactory.java"


# instance fields
.field private proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .registers 2
    .param p1, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    .line 22
    invoke-direct {p0}, Ljavax/net/SocketFactory;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .line 24
    return-void
.end method

.method private socks4ProxifiedSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 31
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    const/16 v19, 0x0

    .line 58
    .local v19, "socket":Ljava/net/Socket;
    const/4 v9, 0x0

    .line 59
    .local v9, "in":Ljava/io/InputStream;
    const/4 v14, 0x0

    .line 60
    .local v14, "out":Ljava/io/OutputStream;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getProxyAddress()Ljava/lang/String;

    move-result-object v16

    .line 61
    .local v16, "proxy_host":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getProxyPort()I

    move-result v17

    .line 62
    .local v17, "proxy_port":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getProxyUsername()Ljava/lang/String;

    move-result-object v23

    .line 63
    .local v23, "user":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getProxyPassword()Ljava/lang/String;

    move-result-object v15

    .line 67
    .local v15, "passwd":Ljava/lang/String;
    :try_start_2c
    new-instance v20, Ljava/net/Socket;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_37
    .catch Ljava/lang/RuntimeException; {:try_start_2c .. :try_end_37} :catch_17b
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_37} :catch_178

    .line 68
    .end local v19    # "socket":Ljava/net/Socket;
    .local v20, "socket":Ljava/net/Socket;
    :try_start_37
    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 69
    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v14

    .line 70
    const/16 v24, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 72
    const/16 v24, 0x400

    move/from16 v0, v24

    new-array v5, v0, [B

    .line 73
    .local v5, "buf":[B
    const/4 v10, 0x0

    .line 93
    .local v10, "index":I
    const/4 v10, 0x0

    .line 94
    add-int/lit8 v11, v10, 0x1

    .end local v10    # "index":I
    .local v11, "index":I
    const/16 v24, 0x4

    aput-byte v24, v5, v10

    .line 95
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "index":I
    .restart local v10    # "index":I
    const/16 v24, 0x1

    aput-byte v24, v5, v11

    .line 97
    add-int/lit8 v11, v10, 0x1

    .end local v10    # "index":I
    .restart local v11    # "index":I
    ushr-int/lit8 v24, p2, 0x8

    move/from16 v0, v24

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v5, v10

    .line 98
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "index":I
    .restart local v10    # "index":I
    move/from16 v0, p2

    and-int/lit16 v0, v0, 0xff

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-byte v0, v0

    move/from16 v24, v0

    aput-byte v24, v5, v11
    :try_end_76
    .catch Ljava/lang/RuntimeException; {:try_start_37 .. :try_end_76} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_76} :catch_f0

    .line 102
    :try_start_76
    invoke-static/range {p1 .. p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v4

    .line 103
    .local v4, "addr":Ljava/net/InetAddress;
    invoke-virtual {v4}, Ljava/net/InetAddress;->getAddress()[B
    :try_end_7d
    .catch Ljava/net/UnknownHostException; {:try_start_76 .. :try_end_7d} :catch_91
    .catch Ljava/lang/RuntimeException; {:try_start_76 .. :try_end_7d} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_76 .. :try_end_7d} :catch_f0

    move-result-object v6

    .line 104
    .local v6, "byteAddress":[B
    const/4 v8, 0x0

    .local v8, "i":I
    move v11, v10

    .end local v10    # "index":I
    .restart local v11    # "index":I
    :goto_80
    :try_start_80
    array-length v0, v6

    move/from16 v24, v0
    :try_end_83
    .catch Ljava/net/UnknownHostException; {:try_start_80 .. :try_end_83} :catch_17e
    .catch Ljava/lang/RuntimeException; {:try_start_80 .. :try_end_83} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_80 .. :try_end_83} :catch_f0

    move/from16 v0, v24

    if-ge v8, v0, :cond_aa

    .line 106
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "index":I
    .restart local v10    # "index":I
    :try_start_89
    aget-byte v24, v6, v8

    aput-byte v24, v5, v11
    :try_end_8d
    .catch Ljava/net/UnknownHostException; {:try_start_89 .. :try_end_8d} :catch_91
    .catch Ljava/lang/RuntimeException; {:try_start_89 .. :try_end_8d} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_8d} :catch_f0

    .line 104
    add-int/lit8 v8, v8, 0x1

    move v11, v10

    .end local v10    # "index":I
    .restart local v11    # "index":I
    goto :goto_80

    .line 109
    .end local v4    # "addr":Ljava/net/InetAddress;
    .end local v6    # "byteAddress":[B
    .end local v8    # "i":I
    .end local v11    # "index":I
    .restart local v10    # "index":I
    :catch_91
    move-exception v22

    .line 111
    .local v22, "uhe":Ljava/net/UnknownHostException;
    :goto_92
    :try_start_92
    new-instance v24, Lorg/jivesoftware/smack/proxy/ProxyException;

    sget-object v25, Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;->SOCKS4:Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;

    invoke-virtual/range {v22 .. v22}, Ljava/net/UnknownHostException;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smack/proxy/ProxyException;-><init>(Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24
    :try_end_a6
    .catch Ljava/lang/RuntimeException; {:try_start_92 .. :try_end_a6} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_a6} :catch_f0

    .line 183
    .end local v5    # "buf":[B
    .end local v10    # "index":I
    .end local v22    # "uhe":Ljava/net/UnknownHostException;
    :catch_a6
    move-exception v7

    move-object/from16 v19, v20

    .line 185
    .end local v20    # "socket":Ljava/net/Socket;
    .local v7, "e":Ljava/lang/RuntimeException;
    .restart local v19    # "socket":Ljava/net/Socket;
    :goto_a9
    throw v7

    .line 115
    .end local v7    # "e":Ljava/lang/RuntimeException;
    .end local v19    # "socket":Ljava/net/Socket;
    .restart local v4    # "addr":Ljava/net/InetAddress;
    .restart local v5    # "buf":[B
    .restart local v6    # "byteAddress":[B
    .restart local v8    # "i":I
    .restart local v11    # "index":I
    .restart local v20    # "socket":Ljava/net/Socket;
    :cond_aa
    if-eqz v23, :cond_c6

    .line 117
    :try_start_ac
    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->getBytes()[B

    move-result-object v24

    const/16 v25, 0x0

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v26

    move-object/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    invoke-static {v0, v1, v5, v11, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 118
    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v24

    add-int v10, v11, v24

    .end local v11    # "index":I
    .restart local v10    # "index":I
    move v11, v10

    .line 120
    .end local v10    # "index":I
    .restart local v11    # "index":I
    :cond_c6
    add-int/lit8 v10, v11, 0x1

    .end local v11    # "index":I
    .restart local v10    # "index":I
    const/16 v24, 0x0

    aput-byte v24, v5, v11

    .line 121
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v5, v0, v10}, Ljava/io/OutputStream;->write([BII)V

    .line 150
    const/4 v12, 0x6

    .line 151
    .local v12, "len":I
    const/16 v18, 0x0

    .line 152
    .local v18, "s":I
    :goto_d6
    move/from16 v0, v18

    if-ge v0, v12, :cond_107

    .line 154
    sub-int v24, v12, v18

    move/from16 v0, v18

    move/from16 v1, v24

    invoke-virtual {v9, v5, v0, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v8

    .line 155
    if-gtz v8, :cond_104

    .line 157
    new-instance v24, Lorg/jivesoftware/smack/proxy/ProxyException;

    sget-object v25, Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;->SOCKS4:Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;

    const-string v26, "stream is closed"

    invoke-direct/range {v24 .. v26}, Lorg/jivesoftware/smack/proxy/ProxyException;-><init>(Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;Ljava/lang/String;)V

    throw v24
    :try_end_f0
    .catch Ljava/lang/RuntimeException; {:try_start_ac .. :try_end_f0} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_ac .. :try_end_f0} :catch_f0

    .line 187
    .end local v4    # "addr":Ljava/net/InetAddress;
    .end local v5    # "buf":[B
    .end local v6    # "byteAddress":[B
    .end local v8    # "i":I
    .end local v10    # "index":I
    .end local v12    # "len":I
    .end local v18    # "s":I
    :catch_f0
    move-exception v7

    move-object/from16 v19, v20

    .line 191
    .end local v20    # "socket":Ljava/net/Socket;
    .local v7, "e":Ljava/lang/Exception;
    .restart local v19    # "socket":Ljava/net/Socket;
    :goto_f3
    if-eqz v19, :cond_f8

    :try_start_f5
    invoke-virtual/range {v19 .. v19}, Ljava/net/Socket;->close()V
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_f8} :catch_176

    .line 196
    :cond_f8
    :goto_f8
    new-instance v24, Lorg/jivesoftware/smack/proxy/ProxyException;

    sget-object v25, Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;->SOCKS4:Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;

    invoke-virtual {v7}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/jivesoftware/smack/proxy/ProxyException;-><init>(Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;Ljava/lang/String;)V

    throw v24

    .line 160
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v19    # "socket":Ljava/net/Socket;
    .restart local v4    # "addr":Ljava/net/InetAddress;
    .restart local v5    # "buf":[B
    .restart local v6    # "byteAddress":[B
    .restart local v8    # "i":I
    .restart local v10    # "index":I
    .restart local v12    # "len":I
    .restart local v18    # "s":I
    .restart local v20    # "socket":Ljava/net/Socket;
    :cond_104
    add-int v18, v18, v8

    .line 161
    goto :goto_d6

    .line 162
    :cond_107
    const/16 v24, 0x0

    :try_start_109
    aget-byte v24, v5, v24

    if-eqz v24, :cond_12c

    .line 164
    new-instance v24, Lorg/jivesoftware/smack/proxy/ProxyException;

    sget-object v25, Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;->SOCKS4:Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "server returns VN "

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const/16 v27, 0x0

    aget-byte v27, v5, v27

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/jivesoftware/smack/proxy/ProxyException;-><init>(Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;Ljava/lang/String;)V

    throw v24

    .line 167
    :cond_12c
    const/16 v24, 0x1

    aget-byte v24, v5, v24
    :try_end_130
    .catch Ljava/lang/RuntimeException; {:try_start_109 .. :try_end_130} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_109 .. :try_end_130} :catch_f0

    const/16 v25, 0x5a

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_15e

    .line 171
    :try_start_138
    invoke-virtual/range {v20 .. v20}, Ljava/net/Socket;->close()V
    :try_end_13b
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_13b} :catch_174
    .catch Ljava/lang/RuntimeException; {:try_start_138 .. :try_end_13b} :catch_a6

    .line 176
    :goto_13b
    :try_start_13b
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "ProxySOCKS4: server returns CD "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const/16 v25, 0x1

    aget-byte v25, v5, v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 177
    .local v13, "message":Ljava/lang/String;
    new-instance v24, Lorg/jivesoftware/smack/proxy/ProxyException;

    sget-object v25, Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;->SOCKS4:Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v13}, Lorg/jivesoftware/smack/proxy/ProxyException;-><init>(Lorg/jivesoftware/smack/proxy/ProxyInfo$ProxyType;Ljava/lang/String;)V

    throw v24

    .line 179
    .end local v13    # "message":Ljava/lang/String;
    :cond_15e
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 180
    .local v21, "temp":[B
    const/16 v24, 0x0

    const/16 v25, 0x2

    move-object/from16 v0, v21

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v9, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I
    :try_end_173
    .catch Ljava/lang/RuntimeException; {:try_start_13b .. :try_end_173} :catch_a6
    .catch Ljava/lang/Exception; {:try_start_13b .. :try_end_173} :catch_f0

    .line 181
    return-object v20

    .line 173
    .end local v21    # "temp":[B
    :catch_174
    move-exception v24

    goto :goto_13b

    .line 193
    .end local v4    # "addr":Ljava/net/InetAddress;
    .end local v5    # "buf":[B
    .end local v6    # "byteAddress":[B
    .end local v8    # "i":I
    .end local v10    # "index":I
    .end local v12    # "len":I
    .end local v18    # "s":I
    .end local v20    # "socket":Ljava/net/Socket;
    .restart local v7    # "e":Ljava/lang/Exception;
    .restart local v19    # "socket":Ljava/net/Socket;
    :catch_176
    move-exception v24

    goto :goto_f8

    .line 187
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_178
    move-exception v7

    goto/16 :goto_f3

    .line 183
    :catch_17b
    move-exception v7

    goto/16 :goto_a9

    .line 109
    .end local v19    # "socket":Ljava/net/Socket;
    .restart local v4    # "addr":Ljava/net/InetAddress;
    .restart local v5    # "buf":[B
    .restart local v6    # "byteAddress":[B
    .restart local v8    # "i":I
    .restart local v11    # "index":I
    .restart local v20    # "socket":Ljava/net/Socket;
    :catch_17e
    move-exception v22

    move v10, v11

    .end local v11    # "index":I
    .restart local v10    # "index":I
    goto/16 :goto_92
.end method


# virtual methods
.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->socks4ProxifiedSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localHost"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->socks4ProxifiedSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->socks4ProxifiedSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/jivesoftware/smack/proxy/Socks4ProxySocketFactory;->socks4ProxifiedSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method
