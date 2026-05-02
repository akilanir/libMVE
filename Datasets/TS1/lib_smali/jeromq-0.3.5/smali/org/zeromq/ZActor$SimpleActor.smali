.class public Lorg/zeromq/ZActor$SimpleActor;
.super Ljava/lang/Object;
.source "ZActor.java"

# interfaces
.implements Lorg/zeromq/ZActor$Actor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZActor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleActor"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;
    .param p3, "events"    # I

    .prologue
    .line 289
    const/4 v0, 0x0

    return v0
.end method

.method public closed(Lorg/zeromq/ZMQ$Socket;)V
    .registers 2
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 311
    return-void
.end method

.method public createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZContext;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;"
        }
    .end annotation

    .prologue
    .line 267
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 317
    const/4 v0, 0x0

    return v0
.end method

.method public finished(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 324
    const/4 v0, 0x1

    return v0
.end method

.method public looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 304
    const/4 v0, 0x1

    return v0
.end method

.method public looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 281
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;
    .registers 3
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 260
    const-string v0, "?"

    return-object v0
.end method

.method public stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 6
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "poller"    # Lorg/zeromq/ZPoller;
    .param p4, "events"    # I

    .prologue
    .line 297
    const/4 v0, 0x0

    return v0
.end method

.method public start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "poller"    # Lorg/zeromq/ZPoller;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/zeromq/ZMQ$Socket;",
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZMQ$Socket;",
            ">;",
            "Lorg/zeromq/ZPoller;",
            ")V"
        }
    .end annotation

    .prologue
    .line 275
    .local p2, "sockets":Ljava/util/List;, "Ljava/util/List<Lorg/zeromq/ZMQ$Socket;>;"
    return-void
.end method
