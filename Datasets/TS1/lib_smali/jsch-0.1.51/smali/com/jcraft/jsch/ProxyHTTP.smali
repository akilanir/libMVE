.class public Lcom/jcraft/jsch/ProxyHTTP;
.super Ljava/lang/Object;
.source "ProxyHTTP.java"

# interfaces
.implements Lcom/jcraft/jsch/Proxy;


# static fields
.field private static DEFAULTPORT:I


# instance fields
.field private in:Ljava/io/InputStream;

.field private out:Ljava/io/OutputStream;

.field private passwd:Ljava/lang/String;

.field private proxy_host:Ljava/lang/String;

.field private proxy_port:I

.field private socket:Ljava/net/Socket;

.field private user:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const/16 v0, 0x50

    sput v0, Lcom/jcraft/jsch/ProxyHTTP;->DEFAULTPORT:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "proxy_host"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x3a

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget v1, Lcom/jcraft/jsch/ProxyHTTP;->DEFAULTPORT:I

    .line 48
    .local v1, "port":I
    move-object v0, p1

    .line 49
    .local v0, "host":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2a

    .line 51
    const/4 v2, 0x0

    const/16 v3, 0x3a

    :try_start_12
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 52
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_29} :catch_2f

    move-result v1

    .line 57
    :cond_2a
    :goto_2a
    iput-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_host:Ljava/lang/String;

    .line 58
    iput v1, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_port:I

    .line 59
    return-void

    .line 54
    :catch_2f
    move-exception v2

    goto :goto_2a
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "proxy_host"    # Ljava/lang/String;
    .param p2, "proxy_port"    # I

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_host:Ljava/lang/String;

    .line 62
    iput p2, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_port:I

    .line 63
    return-void
.end method

.method public static getDefaultPort()I
    .registers 1

    .prologue
    .line 178
    sget v0, Lcom/jcraft/jsch/ProxyHTTP;->DEFAULTPORT:I

    return v0
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 167
    :try_start_1
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 168
    :cond_a
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 169
    :cond_13
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1c} :catch_23

    .line 173
    :cond_1c
    :goto_1c
    iput-object v1, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    .line 174
    iput-object v1, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    .line 175
    iput-object v1, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    .line 176
    return-void

    .line 171
    :catch_23
    move-exception v0

    goto :goto_1c
.end method

.method public connect(Lcom/jcraft/jsch/SocketFactory;Ljava/lang/String;II)V
    .registers 18
    .param p1, "socket_factory"    # Lcom/jcraft/jsch/SocketFactory;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 70
    if-nez p1, :cond_cc

    .line 71
    :try_start_2
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_host:Ljava/lang/String;

    iget v11, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_port:I

    move/from16 v0, p4

    invoke-static {v10, v11, v0}, Lcom/jcraft/jsch/Util;->createSocket(Ljava/lang/String;II)Ljava/net/Socket;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    .line 72
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    .line 73
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    .line 80
    :goto_1e
    if-lez p4, :cond_27

    .line 81
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 83
    :cond_27
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 85
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "CONNECT "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ":"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " HTTP/1.0\r\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/OutputStream;->write([B)V

    .line 87
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->user:Ljava/lang/String;

    if-eqz v10, :cond_a3

    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->passwd:Ljava/lang/String;

    if-eqz v10, :cond_a3

    .line 88
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, p0, Lcom/jcraft/jsch/ProxyHTTP;->user:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ":"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/jcraft/jsch/ProxyHTTP;->passwd:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    .line 89
    .local v2, "code":[B
    const/4 v10, 0x0

    array-length v11, v2

    invoke-static {v2, v10, v11}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v2

    .line 90
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    const-string v11, "Proxy-Authorization: Basic "

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/OutputStream;->write([B)V

    .line 91
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    invoke-virtual {v10, v2}, Ljava/io/OutputStream;->write([B)V

    .line 92
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    const-string v11, "\r\n"

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/OutputStream;->write([B)V

    .line 95
    .end local v2    # "code":[B
    :cond_a3
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    const-string v11, "\r\n"

    invoke-static {v11}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/OutputStream;->write([B)V

    .line 96
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V

    .line 98
    const/4 v5, 0x0

    .line 100
    .local v5, "foo":I
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    .line 101
    .local v9, "sb":Ljava/lang/StringBuffer;
    :cond_b9
    :goto_b9
    if-ltz v5, :cond_11d

    .line 102
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    move-result v5

    const/16 v10, 0xd

    if-eq v5, v10, :cond_113

    int-to-char v10, v5

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_c9
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_c9} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_c9} :catch_e8

    goto :goto_b9

    .line 149
    .end local v5    # "foo":I
    .end local v9    # "sb":Ljava/lang/StringBuffer;
    :catch_ca
    move-exception v4

    .line 150
    .local v4, "e":Ljava/lang/RuntimeException;
    throw v4

    .line 76
    .end local v4    # "e":Ljava/lang/RuntimeException;
    :cond_cc
    :try_start_cc
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_host:Ljava/lang/String;

    iget v11, p0, Lcom/jcraft/jsch/ProxyHTTP;->proxy_port:I

    invoke-interface {p1, v10, v11}, Lcom/jcraft/jsch/SocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    .line 77
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-interface {p1, v10}, Lcom/jcraft/jsch/SocketFactory;->getInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    .line 78
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-interface {p1, v10}, Lcom/jcraft/jsch/SocketFactory;->getOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;
    :try_end_e6
    .catch Ljava/lang/RuntimeException; {:try_start_cc .. :try_end_e6} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_cc .. :try_end_e6} :catch_e8

    goto/16 :goto_1e

    .line 152
    :catch_e8
    move-exception v4

    .line 153
    .local v4, "e":Ljava/lang/Exception;
    :try_start_e9
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    if-eqz v10, :cond_f2

    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    invoke-virtual {v10}, Ljava/net/Socket;->close()V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_e9 .. :try_end_f2} :catch_193

    .line 156
    :cond_f2
    :goto_f2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ProxyHTTP: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 157
    .local v6, "message":Ljava/lang/String;
    instance-of v10, v4, Ljava/lang/Throwable;

    if-eqz v10, :cond_18d

    .line 158
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v10, v6, v4}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 103
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v6    # "message":Ljava/lang/String;
    .restart local v5    # "foo":I
    .restart local v9    # "sb":Ljava/lang/StringBuffer;
    :cond_113
    :try_start_113
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    move-result v5

    const/16 v10, 0xa

    if-ne v5, v10, :cond_b9

    .line 106
    :cond_11d
    if-gez v5, :cond_125

    .line 107
    new-instance v10, Ljava/io/IOException;

    invoke-direct {v10}, Ljava/io/IOException;-><init>()V

    throw v10

    .line 110
    :cond_125
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 111
    .local v8, "response":Ljava/lang/String;
    const-string v7, "Unknow reason"
    :try_end_12b
    .catch Ljava/lang/RuntimeException; {:try_start_113 .. :try_end_12b} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_113 .. :try_end_12b} :catch_e8

    .line 112
    .local v7, "reason":Ljava/lang/String;
    const/4 v2, -0x1

    .line 114
    .local v2, "code":I
    const/16 v10, 0x20

    :try_start_12e
    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 115
    const/16 v10, 0x20

    add-int/lit8 v11, v5, 0x1

    invoke-virtual {v8, v10, v11}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 116
    .local v1, "bar":I
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {v8, v10, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 117
    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v8, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_149
    .catch Ljava/lang/Exception; {:try_start_12e .. :try_end_149} :catch_196
    .catch Ljava/lang/RuntimeException; {:try_start_12e .. :try_end_149} :catch_ca

    move-result-object v7

    .line 121
    .end local v1    # "bar":I
    :goto_14a
    const/16 v10, 0xc8

    if-eq v2, v10, :cond_167

    .line 122
    :try_start_14e
    new-instance v10, Ljava/io/IOException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "proxy error: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 135
    :cond_167
    const/4 v3, 0x0

    .line 137
    .local v3, "count":I
    :cond_168
    const/4 v3, 0x0

    .line 138
    :cond_169
    :goto_169
    if-ltz v5, :cond_182

    .line 139
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    move-result v5

    const/16 v10, 0xd

    if-eq v5, v10, :cond_178

    add-int/lit8 v3, v3, 0x1

    goto :goto_169

    .line 140
    :cond_178
    iget-object v10, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    move-result v5

    const/16 v10, 0xa

    if-ne v5, v10, :cond_169

    .line 143
    :cond_182
    if-gez v5, :cond_18a

    .line 144
    new-instance v10, Ljava/io/IOException;

    invoke-direct {v10}, Ljava/io/IOException;-><init>()V

    throw v10
    :try_end_18a
    .catch Ljava/lang/RuntimeException; {:try_start_14e .. :try_end_18a} :catch_ca
    .catch Ljava/lang/Exception; {:try_start_14e .. :try_end_18a} :catch_e8

    .line 146
    :cond_18a
    if-nez v3, :cond_168

    .line 161
    return-void

    .line 159
    .end local v2    # "code":I
    .end local v3    # "count":I
    .end local v5    # "foo":I
    .end local v7    # "reason":Ljava/lang/String;
    .end local v8    # "response":Ljava/lang/String;
    .end local v9    # "sb":Ljava/lang/StringBuffer;
    .restart local v4    # "e":Ljava/lang/Exception;
    .restart local v6    # "message":Ljava/lang/String;
    :cond_18d
    new-instance v10, Lcom/jcraft/jsch/JSchException;

    invoke-direct {v10, v6}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 154
    .end local v6    # "message":Ljava/lang/String;
    :catch_193
    move-exception v10

    goto/16 :goto_f2

    .line 119
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v2    # "code":I
    .restart local v5    # "foo":I
    .restart local v7    # "reason":Ljava/lang/String;
    .restart local v8    # "response":Ljava/lang/String;
    .restart local v9    # "sb":Ljava/lang/StringBuffer;
    :catch_196
    move-exception v10

    goto :goto_14a
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->in:Ljava/io/InputStream;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method public getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/jcraft/jsch/ProxyHTTP;->socket:Ljava/net/Socket;

    return-object v0
.end method

.method public setUserPasswd(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "passwd"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/jcraft/jsch/ProxyHTTP;->user:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lcom/jcraft/jsch/ProxyHTTP;->passwd:Ljava/lang/String;

    .line 67
    return-void
.end method
