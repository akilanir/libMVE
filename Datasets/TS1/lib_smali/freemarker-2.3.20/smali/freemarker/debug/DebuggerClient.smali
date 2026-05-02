.class public Lfreemarker/debug/DebuggerClient;
.super Ljava/lang/Object;
.source "DebuggerClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method

.method public static getDebugger(Ljava/net/InetAddress;ILjava/lang/String;)Lfreemarker/debug/Debugger;
    .registers 14
    .param p0, "host"    # Ljava/net/InetAddress;
    .param p1, "port"    # I
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    new-instance v7, Ljava/net/Socket;

    invoke-direct {v7, p0, p1}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_43
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_77

    .line 105
    .local v7, "s":Ljava/net/Socket;
    :try_start_5
    new-instance v5, Ljava/io/ObjectOutputStream;

    invoke-virtual {v7}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 106
    .local v5, "out":Ljava/io/ObjectOutputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    invoke-virtual {v7}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v3, v8}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 107
    .local v3, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v6

    .line 108
    .local v6, "protocolVersion":I
    const/16 v8, 0xdc

    if-le v6, v8, :cond_45

    .line 110
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Incompatible protocol version "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ". At most 220 was expected."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_3e
    .catchall {:try_start_5 .. :try_end_3e} :catchall_3e

    .line 124
    .end local v3    # "in":Ljava/io/ObjectInputStream;
    .end local v5    # "out":Ljava/io/ObjectOutputStream;
    .end local v6    # "protocolVersion":I
    :catchall_3e
    move-exception v8

    :try_start_3f
    invoke-virtual {v7}, Ljava/net/Socket;->close()V

    throw v8
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_43} :catch_43
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_43} :catch_77

    .line 127
    .end local v7    # "s":Ljava/net/Socket;
    :catch_43
    move-exception v2

    .line 129
    .local v2, "e":Ljava/io/IOException;
    throw v2

    .line 114
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v3    # "in":Ljava/io/ObjectInputStream;
    .restart local v5    # "out":Ljava/io/ObjectOutputStream;
    .restart local v6    # "protocolVersion":I
    .restart local v7    # "s":Ljava/net/Socket;
    :cond_45
    :try_start_45
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    move-object v0, v8

    check-cast v0, [B

    move-object v1, v0

    .line 115
    .local v1, "challenge":[B
    const-string v8, "SHA"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    .line 116
    .local v4, "md":Ljava/security/MessageDigest;
    const-string v8, "UTF-8"

    invoke-virtual {p2, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/security/MessageDigest;->update([B)V

    .line 117
    invoke-virtual {v4, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 118
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 119
    new-instance v9, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;

    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfreemarker/debug/Debugger;

    invoke-direct {v9, v8}, Lfreemarker/debug/DebuggerClient$LocalDebuggerProxy;-><init>(Lfreemarker/debug/Debugger;)V
    :try_end_73
    .catchall {:try_start_45 .. :try_end_73} :catchall_3e

    .line 124
    :try_start_73
    invoke-virtual {v7}, Ljava/net/Socket;->close()V
    :try_end_76
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_76} :catch_43
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_76} :catch_77

    return-object v9

    .line 131
    .end local v1    # "challenge":[B
    .end local v3    # "in":Ljava/io/ObjectInputStream;
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "out":Ljava/io/ObjectOutputStream;
    .end local v6    # "protocolVersion":I
    .end local v7    # "s":Ljava/net/Socket;
    :catch_77
    move-exception v2

    .line 133
    .local v2, "e":Ljava/lang/Exception;
    new-instance v8, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v8, v2}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v8
.end method
