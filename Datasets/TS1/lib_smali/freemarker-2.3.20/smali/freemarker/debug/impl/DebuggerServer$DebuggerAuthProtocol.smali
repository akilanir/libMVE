.class Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;
.super Ljava/lang/Object;
.source "DebuggerServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/debug/impl/DebuggerServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DebuggerAuthProtocol"
.end annotation


# instance fields
.field private final s:Ljava/net/Socket;

.field private final this$0:Lfreemarker/debug/impl/DebuggerServer;


# direct methods
.method constructor <init>(Lfreemarker/debug/impl/DebuggerServer;Ljava/net/Socket;)V
    .registers 3
    .param p2, "s"    # Ljava/net/Socket;

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->this$0:Lfreemarker/debug/impl/DebuggerServer;

    .line 135
    iput-object p2, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->s:Ljava/net/Socket;

    .line 136
    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    .prologue
    .line 142
    :try_start_0
    new-instance v5, Ljava/io/ObjectOutputStream;

    iget-object v7, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->s:Ljava/net/Socket;

    invoke-virtual {v7}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 143
    .local v5, "out":Ljava/io/ObjectOutputStream;
    new-instance v3, Ljava/io/ObjectInputStream;

    iget-object v7, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->s:Ljava/net/Socket;

    invoke-virtual {v7}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 144
    .local v3, "in":Ljava/io/ObjectInputStream;
    const/16 v7, 0x200

    new-array v1, v7, [B

    .line 145
    .local v1, "challenge":[B
    invoke-static {}, Lfreemarker/debug/impl/DebuggerServer;->access$100()Ljava/util/Random;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 146
    const/16 v7, 0xdc

    invoke-virtual {v5, v7}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 147
    invoke-virtual {v5, v1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 148
    const-string v7, "SHA"

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v4

    .line 149
    .local v4, "md":Ljava/security/MessageDigest;
    iget-object v7, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->this$0:Lfreemarker/debug/impl/DebuggerServer;

    invoke-static {v7}, Lfreemarker/debug/impl/DebuggerServer;->access$200(Lfreemarker/debug/impl/DebuggerServer;)[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 150
    invoke-virtual {v4, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 151
    invoke-virtual {v3}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    move-object v0, v7

    check-cast v0, [B

    move-object v6, v0

    .line 152
    .local v6, "response":[B
    invoke-virtual {v4}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    invoke-static {v6, v7}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v7

    if-eqz v7, :cond_59

    .line 154
    iget-object v7, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->this$0:Lfreemarker/debug/impl/DebuggerServer;

    invoke-static {v7}, Lfreemarker/debug/impl/DebuggerServer;->access$300(Lfreemarker/debug/impl/DebuggerServer;)Ljava/io/Serializable;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 165
    .end local v1    # "challenge":[B
    .end local v3    # "in":Ljava/io/ObjectInputStream;
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "out":Ljava/io/ObjectOutputStream;
    .end local v6    # "response":[B
    :goto_58
    return-void

    .line 158
    .restart local v1    # "challenge":[B
    .restart local v3    # "in":Ljava/io/ObjectInputStream;
    .restart local v4    # "md":Ljava/security/MessageDigest;
    .restart local v5    # "out":Ljava/io/ObjectOutputStream;
    .restart local v6    # "response":[B
    :cond_59
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5d} :catch_5e

    goto :goto_58

    .line 161
    .end local v1    # "challenge":[B
    .end local v3    # "in":Ljava/io/ObjectInputStream;
    .end local v4    # "md":Ljava/security/MessageDigest;
    .end local v5    # "out":Ljava/io/ObjectOutputStream;
    .end local v6    # "response":[B
    :catch_5e
    move-exception v2

    .line 163
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Lfreemarker/debug/impl/DebuggerServer;->access$400()Lfreemarker/log/Logger;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Connection to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;->s:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v9

    invoke-virtual {v9}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " abruply broke"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_58
.end method
