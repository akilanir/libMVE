.class final Lorg/zeromq/ZActor$Double;
.super Ljava/lang/Object;
.source "ZActor.java"

# interfaces
.implements Lorg/zeromq/ZPoller$EventsHandler;
.implements Lorg/zeromq/ZStar$Star;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZActor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Double"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final actor:Lorg/zeromq/ZActor$Actor;

.field private final pipe:Lorg/zeromq/ZMQ$Socket;

.field private final poller:Lorg/zeromq/ZPoller;

.field private final sockets:Ljava/util/List;
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
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 511
    const-class v0, Lorg/zeromq/ZActor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZActor$Double;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;Ljava/nio/channels/Selector;Lorg/zeromq/ZActor$Actor;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "selector"    # Ljava/nio/channels/Selector;
    .param p4, "actor"    # Lorg/zeromq/ZActor$Actor;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 530
    iput-object p2, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    .line 531
    iput-object p4, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    .line 533
    invoke-interface {p4, p1, p5}, Lorg/zeromq/ZActor$Actor;->createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 534
    .local v0, "created":Ljava/util/List;, "Ljava/util/List<Lorg/zeromq/ZMQ$Socket;>;"
    sget-boolean v1, Lorg/zeromq/ZActor$Double;->$assertionsDisabled:Z

    if-nez v1, :cond_17

    if-nez v0, :cond_17

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 536
    :cond_17
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lorg/zeromq/ZActor$Double;->sockets:Ljava/util/List;

    .line 538
    new-instance v1, Lorg/zeromq/ZPoller;

    invoke-direct {v1, p3}, Lorg/zeromq/ZPoller;-><init>(Ljava/nio/channels/Selector;)V

    iput-object v1, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    .line 539
    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-virtual {v1, p0}, Lorg/zeromq/ZPoller;->setGlobalHandler(Lorg/zeromq/ZPoller$EventsHandler;)V

    .line 540
    return-void
.end method


# virtual methods
.method public act(I)Z
    .registers 3
    .param p1, "events"    # I

    .prologue
    .line 564
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public breathe()I
    .registers 6

    .prologue
    .line 554
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v3, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v4, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v2, v3, v4}, Lorg/zeromq/ZActor$Actor;->looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J

    move-result-wide v0

    .line 555
    .local v0, "timeout":J
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-virtual {v2, v0, v1}, Lorg/zeromq/ZPoller;->poll(J)I

    move-result v2

    return v2
.end method

.method public entract()Z
    .registers 4

    .prologue
    .line 571
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v0, v1, v2}, Lorg/zeromq/ZActor$Actor;->looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    move-result v0

    return v0
.end method

.method public events(Ljava/nio/channels/SelectableChannel;I)Z
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "events"    # I

    .prologue
    .line 598
    const/4 v0, 0x1

    return v0
.end method

.method public events(Lorg/zeromq/ZMQ$Socket;I)Z
    .registers 6
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "events"    # I

    .prologue
    .line 605
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    if-eq p1, v0, :cond_f

    .line 607
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v0, p1, v1, v2, p2}, Lorg/zeromq/ZActor$Actor;->stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    move-result v0

    .line 611
    :goto_e
    return v0

    :cond_f
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v0, v1, v2, p2}, Lorg/zeromq/ZActor$Actor;->backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    move-result v0

    goto :goto_e
.end method

.method public prepare()V
    .registers 5

    .prologue
    .line 546
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/zeromq/ZPoller;->register(Lorg/zeromq/ZMQ$Socket;I)Z

    .line 547
    iget-object v0, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v1, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->sockets:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v0, v1, v2, v3}, Lorg/zeromq/ZActor$Actor;->start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V

    .line 548
    return-void
.end method

.method public renews()Z
    .registers 6

    .prologue
    .line 579
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->sockets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 580
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZMQ$Socket;>;"
    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 581
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZMQ$Socket;

    .line 582
    .local v1, "socket":Lorg/zeromq/ZMQ$Socket;
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 583
    if-eqz v1, :cond_6

    .line 584
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-virtual {v2, v1}, Lorg/zeromq/ZPoller;->unregister(Ljava/lang/Object;)Z

    .line 585
    invoke-virtual {v1}, Lorg/zeromq/ZMQ$Socket;->close()V

    .line 587
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v2, v1}, Lorg/zeromq/ZActor$Actor;->closed(Lorg/zeromq/ZMQ$Socket;)V

    goto :goto_6

    .line 591
    .end local v1    # "socket":Lorg/zeromq/ZMQ$Socket;
    :cond_25
    iget-object v2, p0, Lorg/zeromq/ZActor$Double;->actor:Lorg/zeromq/ZActor$Actor;

    iget-object v3, p0, Lorg/zeromq/ZActor$Double;->pipe:Lorg/zeromq/ZMQ$Socket;

    iget-object v4, p0, Lorg/zeromq/ZActor$Double;->poller:Lorg/zeromq/ZPoller;

    invoke-interface {v2, v3, v4}, Lorg/zeromq/ZActor$Actor;->destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    move-result v2

    return v2
.end method
