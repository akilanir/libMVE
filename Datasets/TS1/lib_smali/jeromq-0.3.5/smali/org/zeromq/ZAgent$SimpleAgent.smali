.class public final Lorg/zeromq/ZAgent$SimpleAgent;
.super Ljava/lang/Object;
.source "ZAgent.java"

# interfaces
.implements Lorg/zeromq/ZAgent;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SimpleAgent"
.end annotation


# instance fields
.field private final lock:[B

.field private locked:Z

.field private final pipe:Lorg/zeromq/ZMQ$Socket;


# direct methods
.method public constructor <init>(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)V
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "lock"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    .line 148
    if-nez p2, :cond_b

    const/4 v0, 0x0

    :goto_8
    iput-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->lock:[B

    .line 149
    return-void

    .line 148
    :cond_b
    sget-object v0, Lorg/zeromq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    goto :goto_8
.end method


# virtual methods
.method public nova()V
    .registers 2

    .prologue
    .line 230
    iget-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$Socket;->close()V

    .line 231
    return-void
.end method

.method public pipe()Lorg/zeromq/ZMQ$Socket;
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    return-object v0
.end method

.method public recv()Lorg/zeromq/ZMsg;
    .registers 2

    .prologue
    .line 160
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/zeromq/ZAgent$SimpleAgent;->recv(Z)Lorg/zeromq/ZMsg;

    move-result-object v0

    return-object v0
.end method

.method public recv(Z)Lorg/zeromq/ZMsg;
    .registers 9
    .param p1, "wait"    # Z

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 166
    iget-boolean v3, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-eqz v3, :cond_8

    move-object v2, v5

    .line 182
    :cond_7
    :goto_7
    return-object v2

    .line 169
    :cond_8
    iget-object v6, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    if-eqz p1, :cond_15

    const/4 v3, 0x0

    :goto_d
    invoke-static {v6, v3}, Lorg/zeromq/ZMsg;->recvMsg(Lorg/zeromq/ZMQ$Socket;I)Lorg/zeromq/ZMsg;

    move-result-object v2

    .line 170
    .local v2, "msg":Lorg/zeromq/ZMsg;
    if-nez v2, :cond_17

    move-object v2, v5

    .line 171
    goto :goto_7

    .end local v2    # "msg":Lorg/zeromq/ZMsg;
    :cond_15
    move v3, v4

    .line 169
    goto :goto_d

    .line 174
    .restart local v2    # "msg":Lorg/zeromq/ZMsg;
    :cond_17
    invoke-virtual {v2}, Lorg/zeromq/ZMsg;->peek()Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 175
    .local v0, "frame":Lorg/zeromq/ZFrame;
    invoke-virtual {v0}, Lorg/zeromq/ZFrame;->getData()[B

    move-result-object v1

    .line 176
    .local v1, "key":[B
    iget-object v3, p0, Lorg/zeromq/ZAgent$SimpleAgent;->lock:[B

    if-eqz v3, :cond_7

    iget-object v3, p0, Lorg/zeromq/ZAgent$SimpleAgent;->lock:[B

    invoke-static {v3, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 177
    iput-boolean v4, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    .line 179
    const/4 v2, 0x0

    .line 180
    iget-object v3, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v3}, Lorg/zeromq/ZMQ$Socket;->close()V

    goto :goto_7
.end method

.method public send(Ljava/lang/String;)Z
    .registers 3
    .param p1, "word"    # Ljava/lang/String;

    .prologue
    .line 197
    iget-boolean v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-eqz v0, :cond_6

    .line 198
    const/4 v0, 0x0

    .line 200
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {v0, p1}, Lorg/zeromq/ZMQ$Socket;->send(Ljava/lang/String;)Z

    move-result v0

    goto :goto_5
.end method

.method public send(Ljava/lang/String;Z)Z
    .registers 5
    .param p1, "word"    # Ljava/lang/String;
    .param p2, "more"    # Z

    .prologue
    const/4 v0, 0x0

    .line 206
    iget-boolean v1, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-eqz v1, :cond_6

    .line 209
    :goto_5
    return v0

    :cond_6
    iget-object v1, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    if-eqz p2, :cond_b

    const/4 v0, 0x2

    :cond_b
    invoke-virtual {v1, p1, v0}, Lorg/zeromq/ZMQ$Socket;->send(Ljava/lang/String;I)Z

    move-result v0

    goto :goto_5
.end method

.method public send(Lorg/zeromq/ZMsg;)Z
    .registers 3
    .param p1, "message"    # Lorg/zeromq/ZMsg;

    .prologue
    .line 188
    iget-boolean v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-eqz v0, :cond_6

    .line 189
    const/4 v0, 0x0

    .line 191
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    goto :goto_5
.end method

.method public send(Lorg/zeromq/ZMsg;Z)Z
    .registers 4
    .param p1, "msg"    # Lorg/zeromq/ZMsg;
    .param p2, "destroy"    # Z

    .prologue
    .line 215
    iget-boolean v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-eqz v0, :cond_6

    .line 216
    const/4 v0, 0x0

    .line 218
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->pipe:Lorg/zeromq/ZMQ$Socket;

    invoke-virtual {p1, v0, p2}, Lorg/zeromq/ZMsg;->send(Lorg/zeromq/ZMQ$Socket;Z)Z

    move-result v0

    goto :goto_5
.end method

.method public sign()Z
    .registers 2

    .prologue
    .line 154
    iget-boolean v0, p0, Lorg/zeromq/ZAgent$SimpleAgent;->locked:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
