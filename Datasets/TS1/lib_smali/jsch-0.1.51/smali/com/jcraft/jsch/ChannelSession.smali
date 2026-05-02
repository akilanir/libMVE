.class Lcom/jcraft/jsch/ChannelSession;
.super Lcom/jcraft/jsch/Channel;
.source "ChannelSession.java"


# static fields
.field private static _session:[B


# instance fields
.field protected agent_forwarding:Z

.field protected env:Ljava/util/Hashtable;

.field protected pty:Z

.field protected tcol:I

.field protected terminal_mode:[B

.field protected thp:I

.field protected trow:I

.field protected ttype:Ljava/lang/String;

.field protected twp:I

.field protected xforwading:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-string v0, "session"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/ChannelSession;->_session:[B

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel;-><init>()V

    .line 37
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSession;->agent_forwarding:Z

    .line 38
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSession;->xforwading:Z

    .line 39
    iput-object v1, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    .line 41
    iput-boolean v0, p0, Lcom/jcraft/jsch/ChannelSession;->pty:Z

    .line 43
    const-string v0, "vt100"

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->ttype:Ljava/lang/String;

    .line 44
    const/16 v0, 0x50

    iput v0, p0, Lcom/jcraft/jsch/ChannelSession;->tcol:I

    .line 45
    const/16 v0, 0x18

    iput v0, p0, Lcom/jcraft/jsch/ChannelSession;->trow:I

    .line 46
    const/16 v0, 0x280

    iput v0, p0, Lcom/jcraft/jsch/ChannelSession;->twp:I

    .line 47
    const/16 v0, 0x1e0

    iput v0, p0, Lcom/jcraft/jsch/ChannelSession;->thp:I

    .line 48
    iput-object v1, p0, Lcom/jcraft/jsch/ChannelSession;->terminal_mode:[B

    .line 52
    sget-object v0, Lcom/jcraft/jsch/ChannelSession;->_session:[B

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->type:[B

    .line 53
    new-instance v0, Lcom/jcraft/jsch/IO;

    invoke-direct {v0}, Lcom/jcraft/jsch/IO;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->io:Lcom/jcraft/jsch/IO;

    .line 54
    return-void
.end method

.method private getEnv()Ljava/util/Hashtable;
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    if-nez v0, :cond_b

    .line 116
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    .line 117
    :cond_b
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    return-object v0
.end method

.method private toByteArray(Ljava/lang/Object;)[B
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 228
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 229
    check-cast p1, Ljava/lang/String;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object p1

    .line 231
    :goto_a
    return-object p1

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_b
    check-cast p1, [B

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [B

    goto :goto_a
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 237
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    iget v4, p0, Lcom/jcraft/jsch/ChannelSession;->rmpsize:I

    invoke-direct {v1, v4}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    .line 238
    .local v1, "buf":Lcom/jcraft/jsch/Buffer;
    new-instance v3, Lcom/jcraft/jsch/Packet;

    invoke-direct {v3, v1}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    .line 239
    .local v3, "packet":Lcom/jcraft/jsch/Packet;
    const/4 v2, -0x1

    .line 244
    .local v2, "i":I
    :cond_d
    :goto_d
    :try_start_d
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_3c

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSession;->thread:Ljava/lang/Thread;

    if-eqz v4, :cond_3c

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSession;->io:Lcom/jcraft/jsch/IO;

    if-eqz v4, :cond_3c

    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSession;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    if-eqz v4, :cond_3c

    .line 245
    iget-object v4, p0, Lcom/jcraft/jsch/ChannelSession;->io:Lcom/jcraft/jsch/IO;

    iget-object v4, v4, Lcom/jcraft/jsch/IO;->in:Ljava/io/InputStream;

    iget-object v5, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    const/16 v6, 0xe

    iget-object v7, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    array-length v7, v7

    add-int/lit8 v7, v7, -0xe

    add-int/lit8 v7, v7, -0x54

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 250
    if-eqz v2, :cond_d

    .line 251
    const/4 v4, -0x1

    if-ne v2, v4, :cond_49

    .line 252
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->eof()V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_3c} :catch_68

    .line 269
    :cond_3c
    :goto_3c
    iget-object v0, p0, Lcom/jcraft/jsch/ChannelSession;->thread:Ljava/lang/Thread;

    .line 270
    .local v0, "_thread":Ljava/lang/Thread;
    if-eqz v0, :cond_45

    .line 271
    monitor-enter v0

    :try_start_41
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0
    :try_end_45
    .catchall {:try_start_41 .. :try_end_45} :catchall_6a

    .line 273
    :cond_45
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/jcraft/jsch/ChannelSession;->thread:Ljava/lang/Thread;

    .line 275
    return-void

    .line 255
    .end local v0    # "_thread":Ljava/lang/Thread;
    :cond_49
    :try_start_49
    iget-boolean v4, p0, Lcom/jcraft/jsch/ChannelSession;->close:Z

    if-nez v4, :cond_3c

    .line 257
    invoke-virtual {v3}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 258
    const/16 v4, 0x5e

    invoke-virtual {v1, v4}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 259
    iget v4, p0, Lcom/jcraft/jsch/ChannelSession;->recipient:I

    invoke-virtual {v1, v4}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 260
    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 261
    invoke-virtual {v1, v2}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 262
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v4

    invoke-virtual {v4, v3, p0, v2}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_67} :catch_68

    goto :goto_d

    .line 265
    :catch_68
    move-exception v4

    goto :goto_3c

    .line 271
    .restart local v0    # "_thread":Ljava/lang/Thread;
    :catchall_6a
    move-exception v4

    :try_start_6b
    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6a

    throw v4
.end method

.method protected sendRequests()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v1

    .line 195
    .local v1, "_session":Lcom/jcraft/jsch/Session;
    iget-boolean v5, p0, Lcom/jcraft/jsch/ChannelSession;->agent_forwarding:Z

    if-eqz v5, :cond_10

    .line 196
    new-instance v3, Lcom/jcraft/jsch/RequestAgentForwarding;

    invoke-direct {v3}, Lcom/jcraft/jsch/RequestAgentForwarding;-><init>()V

    .line 197
    .local v3, "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {v3, v1, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 200
    .end local v3    # "request":Lcom/jcraft/jsch/Request;
    :cond_10
    iget-boolean v5, p0, Lcom/jcraft/jsch/ChannelSession;->xforwading:Z

    if-eqz v5, :cond_1c

    .line 201
    new-instance v3, Lcom/jcraft/jsch/RequestX11;

    invoke-direct {v3}, Lcom/jcraft/jsch/RequestX11;-><init>()V

    .line 202
    .restart local v3    # "request":Lcom/jcraft/jsch/Request;
    invoke-virtual {v3, v1, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 205
    .end local v3    # "request":Lcom/jcraft/jsch/Request;
    :cond_1c
    iget-boolean v5, p0, Lcom/jcraft/jsch/ChannelSession;->pty:Z

    if-eqz v5, :cond_4a

    .line 206
    new-instance v3, Lcom/jcraft/jsch/RequestPtyReq;

    invoke-direct {v3}, Lcom/jcraft/jsch/RequestPtyReq;-><init>()V

    .restart local v3    # "request":Lcom/jcraft/jsch/Request;
    move-object v5, v3

    .line 207
    check-cast v5, Lcom/jcraft/jsch/RequestPtyReq;

    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSession;->ttype:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/jcraft/jsch/RequestPtyReq;->setTType(Ljava/lang/String;)V

    move-object v5, v3

    .line 208
    check-cast v5, Lcom/jcraft/jsch/RequestPtyReq;

    iget v6, p0, Lcom/jcraft/jsch/ChannelSession;->tcol:I

    iget v7, p0, Lcom/jcraft/jsch/ChannelSession;->trow:I

    iget v8, p0, Lcom/jcraft/jsch/ChannelSession;->twp:I

    iget v9, p0, Lcom/jcraft/jsch/ChannelSession;->thp:I

    invoke-virtual {v5, v6, v7, v8, v9}, Lcom/jcraft/jsch/RequestPtyReq;->setTSize(IIII)V

    .line 209
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSession;->terminal_mode:[B

    if-eqz v5, :cond_47

    move-object v5, v3

    .line 210
    check-cast v5, Lcom/jcraft/jsch/RequestPtyReq;

    iget-object v6, p0, Lcom/jcraft/jsch/ChannelSession;->terminal_mode:[B

    invoke-virtual {v5, v6}, Lcom/jcraft/jsch/RequestPtyReq;->setTerminalMode([B)V

    .line 212
    :cond_47
    invoke-virtual {v3, v1, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    .line 215
    .end local v3    # "request":Lcom/jcraft/jsch/Request;
    :cond_4a
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    if-eqz v5, :cond_7b

    .line 216
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "_env":Ljava/util/Enumeration;
    :goto_54
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_7b

    .line 217
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 218
    .local v2, "name":Ljava/lang/Object;
    iget-object v5, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    invoke-virtual {v5, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 219
    .local v4, "value":Ljava/lang/Object;
    new-instance v3, Lcom/jcraft/jsch/RequestEnv;

    invoke-direct {v3}, Lcom/jcraft/jsch/RequestEnv;-><init>()V

    .restart local v3    # "request":Lcom/jcraft/jsch/Request;
    move-object v5, v3

    .line 220
    check-cast v5, Lcom/jcraft/jsch/RequestEnv;

    invoke-direct {p0, v2}, Lcom/jcraft/jsch/ChannelSession;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v6

    invoke-direct {p0, v4}, Lcom/jcraft/jsch/ChannelSession;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lcom/jcraft/jsch/RequestEnv;->setEnv([B[B)V

    .line 222
    invoke-virtual {v3, v1, p0}, Lcom/jcraft/jsch/Request;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V

    goto :goto_54

    .line 225
    .end local v0    # "_env":Ljava/util/Enumeration;
    .end local v2    # "name":Ljava/lang/Object;
    .end local v3    # "request":Lcom/jcraft/jsch/Request;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_7b
    return-void
.end method

.method public setAgentForwarding(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSession;->agent_forwarding:Z

    .line 63
    return-void
.end method

.method public setEnv(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/jcraft/jsch/ChannelSession;->setEnv([B[B)V

    .line 98
    return-void
.end method

.method public setEnv(Ljava/util/Hashtable;)V
    .registers 3
    .param p1, "env"    # Ljava/util/Hashtable;

    .prologue
    .line 81
    monitor-enter p0

    .line 82
    :try_start_1
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSession;->env:Ljava/util/Hashtable;

    .line 83
    monitor-exit p0

    .line 84
    return-void

    .line 83
    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public setEnv([B[B)V
    .registers 4
    .param p1, "name"    # [B
    .param p2, "value"    # [B

    .prologue
    .line 109
    monitor-enter p0

    .line 110
    :try_start_1
    invoke-direct {p0}, Lcom/jcraft/jsch/ChannelSession;->getEnv()Ljava/util/Hashtable;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    monitor-exit p0

    .line 112
    return-void

    .line 111
    :catchall_a
    move-exception v0

    monitor-exit p0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public setPty(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSession;->pty:Z

    .line 128
    return-void
.end method

.method public setPtySize(IIII)V
    .registers 12
    .param p1, "col"    # I
    .param p2, "row"    # I
    .param p3, "wp"    # I
    .param p4, "hp"    # I

    .prologue
    .line 149
    iget-object v1, p0, Lcom/jcraft/jsch/ChannelSession;->ttype:Ljava/lang/String;

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    .line 150
    iget-boolean v0, p0, Lcom/jcraft/jsch/ChannelSession;->pty:Z

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->isConnected()Z

    move-result v0

    if-nez v0, :cond_15

    .line 161
    :cond_14
    :goto_14
    return-void

    .line 154
    :cond_15
    :try_start_15
    new-instance v6, Lcom/jcraft/jsch/RequestWindowChange;

    invoke-direct {v6}, Lcom/jcraft/jsch/RequestWindowChange;-><init>()V

    .line 155
    .local v6, "request":Lcom/jcraft/jsch/RequestWindowChange;
    invoke-virtual {v6, p1, p2, p3, p4}, Lcom/jcraft/jsch/RequestWindowChange;->setSize(IIII)V

    .line 156
    invoke-virtual {p0}, Lcom/jcraft/jsch/ChannelSession;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v0

    invoke-virtual {v6, v0, p0}, Lcom/jcraft/jsch/RequestWindowChange;->request(Lcom/jcraft/jsch/Session;Lcom/jcraft/jsch/Channel;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_24} :catch_25

    goto :goto_14

    .line 158
    .end local v6    # "request":Lcom/jcraft/jsch/RequestWindowChange;
    :catch_25
    move-exception v0

    goto :goto_14
.end method

.method public setPtyType(Ljava/lang/String;)V
    .registers 8
    .param p1, "ttype"    # Ljava/lang/String;

    .prologue
    .line 171
    const/16 v2, 0x50

    const/16 v3, 0x18

    const/16 v4, 0x280

    const/16 v5, 0x1e0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/jcraft/jsch/ChannelSession;->setPtyType(Ljava/lang/String;IIII)V

    .line 172
    return-void
.end method

.method public setPtyType(Ljava/lang/String;IIII)V
    .registers 6
    .param p1, "ttype"    # Ljava/lang/String;
    .param p2, "col"    # I
    .param p3, "row"    # I
    .param p4, "wp"    # I
    .param p5, "hp"    # I

    .prologue
    .line 185
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSession;->ttype:Ljava/lang/String;

    .line 186
    iput p2, p0, Lcom/jcraft/jsch/ChannelSession;->tcol:I

    .line 187
    iput p3, p0, Lcom/jcraft/jsch/ChannelSession;->trow:I

    .line 188
    iput p4, p0, Lcom/jcraft/jsch/ChannelSession;->twp:I

    .line 189
    iput p5, p0, Lcom/jcraft/jsch/ChannelSession;->thp:I

    .line 190
    return-void
.end method

.method public setTerminalMode([B)V
    .registers 2
    .param p1, "terminal_mode"    # [B

    .prologue
    .line 136
    iput-object p1, p0, Lcom/jcraft/jsch/ChannelSession;->terminal_mode:[B

    .line 137
    return-void
.end method

.method public setXForwarding(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/jcraft/jsch/ChannelSession;->xforwading:Z

    .line 73
    return-void
.end method
