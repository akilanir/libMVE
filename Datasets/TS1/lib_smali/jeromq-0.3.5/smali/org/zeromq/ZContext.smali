.class public Lorg/zeromq/ZContext;
.super Ljava/lang/Object;
.source "ZContext.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private volatile context:Lorg/zeromq/ZMQ$Context;

.field private hwm:I

.field private ioThreads:I

.field private linger:I

.field private main:Z

.field private sockets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/zeromq/ZContext;-><init>(I)V

    .line 79
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "ioThreads"    # I

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    .line 84
    iput p1, p0, Lorg/zeromq/ZContext;->ioThreads:I

    .line 85
    const/4 v0, 0x0

    iput v0, p0, Lorg/zeromq/ZContext;->linger:I

    .line 86
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/zeromq/ZContext;->main:Z

    .line 87
    return-void
.end method

.method public static shadow(Lorg/zeromq/ZContext;)Lorg/zeromq/ZContext;
    .registers 3
    .param p0, "ctx"    # Lorg/zeromq/ZContext;

    .prologue
    .line 160
    new-instance v0, Lorg/zeromq/ZContext;

    invoke-direct {v0}, Lorg/zeromq/ZContext;-><init>()V

    .line 161
    .local v0, "shadow":Lorg/zeromq/ZContext;
    invoke-virtual {p0}, Lorg/zeromq/ZContext;->getContext()Lorg/zeromq/ZMQ$Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/zeromq/ZContext;->setContext(Lorg/zeromq/ZMQ$Context;)V

    .line 162
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/zeromq/ZContext;->setMain(Z)V

    .line 164
    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 268
    invoke-virtual {p0}, Lorg/zeromq/ZContext;->destroy()V

    .line 269
    return-void
.end method

.method public createSocket(I)Lorg/zeromq/ZMQ$Socket;
    .registers 4
    .param p1, "type"    # I

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/zeromq/ZContext;->getContext()Lorg/zeromq/ZMQ$Context;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/zeromq/ZMQ$Context;->socket(I)Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    .line 124
    .local v0, "socket":Lorg/zeromq/ZMQ$Socket;
    iget-object v1, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    return-object v0
.end method

.method public destroy()V
    .registers 5

    .prologue
    .line 94
    iget-object v2, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZMQ$Socket;

    .line 96
    .local v1, "socket":Lorg/zeromq/ZMQ$Socket;
    :try_start_12
    iget v2, p0, Lorg/zeromq/ZContext;->linger:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/zeromq/ZMQ$Socket;->setLinger(J)V
    :try_end_18
    .catch Lzmq/ZError$CtxTerminatedException; {:try_start_12 .. :try_end_18} :catch_34

    .line 100
    :goto_18
    invoke-virtual {v1}, Lorg/zeromq/ZMQ$Socket;->close()V

    goto :goto_6

    .line 102
    .end local v1    # "socket":Lorg/zeromq/ZMQ$Socket;
    :cond_1c
    iget-object v2, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 105
    invoke-virtual {p0}, Lorg/zeromq/ZContext;->isMain()Z

    move-result v2

    if-eqz v2, :cond_30

    iget-object v2, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    if-eqz v2, :cond_30

    .line 106
    iget-object v2, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    invoke-virtual {v2}, Lorg/zeromq/ZMQ$Context;->term()V

    .line 109
    :cond_30
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    .line 110
    return-void

    .line 98
    .restart local v1    # "socket":Lorg/zeromq/ZMQ$Socket;
    :catch_34
    move-exception v2

    goto :goto_18
.end method

.method public destroySocket(Lorg/zeromq/ZMQ$Socket;)V
    .registers 4
    .param p1, "s"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 136
    if-nez p1, :cond_3

    .line 149
    :cond_2
    :goto_2
    return-void

    .line 140
    :cond_3
    iget-object v0, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 142
    :try_start_b
    iget v0, p0, Lorg/zeromq/ZContext;->linger:I

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Lorg/zeromq/ZMQ$Socket;->setLinger(J)V
    :try_end_11
    .catch Lzmq/ZError$CtxTerminatedException; {:try_start_b .. :try_end_11} :catch_1a

    .line 146
    :goto_11
    invoke-virtual {p1}, Lorg/zeromq/ZMQ$Socket;->close()V

    .line 147
    iget-object v0, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_2

    .line 144
    :catch_1a
    move-exception v0

    goto :goto_11
.end method

.method public getContext()Lorg/zeromq/ZMQ$Context;
    .registers 3

    .prologue
    .line 236
    iget-object v0, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    .line 237
    .local v0, "result":Lorg/zeromq/ZMQ$Context;
    if-nez v0, :cond_12

    .line 238
    monitor-enter p0

    .line 239
    :try_start_5
    iget-object v0, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    .line 240
    if-nez v0, :cond_11

    .line 241
    iget v1, p0, Lorg/zeromq/ZContext;->ioThreads:I

    invoke-static {v1}, Lorg/zeromq/ZMQ;->context(I)Lorg/zeromq/ZMQ$Context;

    move-result-object v0

    .line 242
    iput-object v0, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    .line 244
    :cond_11
    monitor-exit p0

    .line 246
    :cond_12
    return-object v0

    .line 244
    :catchall_13
    move-exception v1

    monitor-exit p0
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v1
.end method

.method public getHWM()I
    .registers 2

    .prologue
    .line 204
    iget v0, p0, Lorg/zeromq/ZContext;->hwm:I

    return v0
.end method

.method public getIoThreads()I
    .registers 2

    .prologue
    .line 172
    iget v0, p0, Lorg/zeromq/ZContext;->ioThreads:I

    return v0
.end method

.method public getLinger()I
    .registers 2

    .prologue
    .line 188
    iget v0, p0, Lorg/zeromq/ZContext;->linger:I

    return v0
.end method

.method public getSockets()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 262
    iget-object v0, p0, Lorg/zeromq/ZContext;->sockets:Ljava/util/List;

    return-object v0
.end method

.method public isMain()Z
    .registers 2

    .prologue
    .line 220
    iget-boolean v0, p0, Lorg/zeromq/ZContext;->main:Z

    return v0
.end method

.method public setContext(Lorg/zeromq/ZMQ$Context;)V
    .registers 2
    .param p1, "ctx"    # Lorg/zeromq/ZMQ$Context;

    .prologue
    .line 254
    iput-object p1, p0, Lorg/zeromq/ZContext;->context:Lorg/zeromq/ZMQ$Context;

    .line 255
    return-void
.end method

.method public setHWM(I)V
    .registers 2
    .param p1, "hwm"    # I

    .prologue
    .line 212
    iput p1, p0, Lorg/zeromq/ZContext;->hwm:I

    .line 213
    return-void
.end method

.method public setIoThreads(I)V
    .registers 2
    .param p1, "ioThreads"    # I

    .prologue
    .line 180
    iput p1, p0, Lorg/zeromq/ZContext;->ioThreads:I

    .line 181
    return-void
.end method

.method public setLinger(I)V
    .registers 2
    .param p1, "linger"    # I

    .prologue
    .line 196
    iput p1, p0, Lorg/zeromq/ZContext;->linger:I

    .line 197
    return-void
.end method

.method public setMain(Z)V
    .registers 2
    .param p1, "main"    # Z

    .prologue
    .line 228
    iput-boolean p1, p0, Lorg/zeromq/ZContext;->main:Z

    .line 229
    return-void
.end method
