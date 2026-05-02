.class public Lorg/zeromq/ZMQ$Context;
.super Ljava/lang/Object;
.source "ZMQ.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Context"
.end annotation


# instance fields
.field private final ctx:Lzmq/Ctx;


# direct methods
.method protected constructor <init>(I)V
    .registers 3
    .param p1, "ioThreads"    # I

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    invoke-static {p1}, Lzmq/ZMQ;->init(I)Lzmq/Ctx;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    .line 271
    return-void
.end method

.method static synthetic access$000(Lorg/zeromq/ZMQ$Context;)Lzmq/Ctx;
    .registers 2
    .param p0, "x0"    # Lorg/zeromq/ZMQ$Context;

    .prologue
    .line 258
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    invoke-virtual {v0}, Lzmq/Ctx;->terminate()V

    .line 365
    return-void
.end method

.method public getBlocky()Z
    .registers 3

    .prologue
    .line 307
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/16 v1, 0x46

    invoke-virtual {v0, v1}, Lzmq/Ctx;->get(I)I

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getIOThreads()I
    .registers 3

    .prologue
    .line 278
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lzmq/Ctx;->get(I)I

    move-result v0

    return v0
.end method

.method public getMaxSockets()I
    .registers 3

    .prologue
    .line 294
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lzmq/Ctx;->get(I)I

    move-result v0

    return v0
.end method

.method public poller()Lorg/zeromq/ZMQ$Poller;
    .registers 2

    .prologue
    .line 345
    new-instance v0, Lorg/zeromq/ZMQ$Poller;

    invoke-direct {v0, p0}, Lorg/zeromq/ZMQ$Poller;-><init>(Lorg/zeromq/ZMQ$Context;)V

    return-object v0
.end method

.method public poller(I)Lorg/zeromq/ZMQ$Poller;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 358
    new-instance v0, Lorg/zeromq/ZMQ$Poller;

    invoke-direct {v0, p0, p1}, Lorg/zeromq/ZMQ$Poller;-><init>(Lorg/zeromq/ZMQ$Context;I)V

    return-object v0
.end method

.method public setBlocky(Z)Z
    .registers 5
    .param p1, "block"    # Z

    .prologue
    .line 312
    iget-object v1, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/16 v2, 0x46

    if-eqz p1, :cond_c

    const/4 v0, 0x1

    :goto_7
    invoke-virtual {v1, v2, v0}, Lzmq/Ctx;->set(II)Z

    move-result v0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIOThreads(I)Z
    .registers 4
    .param p1, "ioThreads"    # I

    .prologue
    .line 286
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lzmq/Ctx;->set(II)Z

    move-result v0

    return v0
.end method

.method public setMaxSockets(I)Z
    .registers 4
    .param p1, "maxSockets"    # I

    .prologue
    .line 302
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lzmq/Ctx;->set(II)Z

    move-result v0

    return v0
.end method

.method public socket(I)Lorg/zeromq/ZMQ$Socket;
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 334
    new-instance v0, Lorg/zeromq/ZMQ$Socket;

    invoke-direct {v0, p0, p1}, Lorg/zeromq/ZMQ$Socket;-><init>(Lorg/zeromq/ZMQ$Context;I)V

    return-object v0
.end method

.method public term()V
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/zeromq/ZMQ$Context;->ctx:Lzmq/Ctx;

    invoke-virtual {v0}, Lzmq/Ctx;->terminate()V

    .line 323
    return-void
.end method
