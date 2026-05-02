.class public Lorg/zeromq/ZActor$Duo;
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
    name = "Duo"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final main:Lorg/zeromq/ZActor$Actor;

.field private final shadow:Lorg/zeromq/ZActor$Actor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 333
    const-class v0, Lorg/zeromq/ZActor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZActor$Duo;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lorg/zeromq/ZActor$Actor;Lorg/zeromq/ZActor$Actor;)V
    .registers 4
    .param p1, "main"    # Lorg/zeromq/ZActor$Actor;
    .param p2, "shadow"    # Lorg/zeromq/ZActor$Actor;

    .prologue
    .line 342
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 343
    sget-boolean v0, Lorg/zeromq/ZActor$Duo;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 344
    :cond_f
    sget-boolean v0, Lorg/zeromq/ZActor$Duo;->$assertionsDisabled:Z

    if-nez v0, :cond_1b

    if-nez p2, :cond_1b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 345
    :cond_1b
    iput-object p1, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    .line 346
    iput-object p2, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    .line 347
    return-void
.end method


# virtual methods
.method public backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;
    .param p3, "events"    # I

    .prologue
    .line 383
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZActor$Actor;->backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    .line 384
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZActor$Actor;->backstage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    move-result v0

    return v0
.end method

.method public closed(Lorg/zeromq/ZMQ$Socket;)V
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 405
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->closed(Lorg/zeromq/ZMQ$Socket;)V

    .line 406
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->closed(Lorg/zeromq/ZMQ$Socket;)V

    .line 407
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
    .line 360
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;

    .line 361
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->createSockets(Lorg/zeromq/ZContext;[Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 412
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    .line 413
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->destroyed(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    move-result v0

    return v0
.end method

.method public finished(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 419
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->finished(Lorg/zeromq/ZMQ$Socket;)Z

    .line 420
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->finished(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    return v0
.end method

.method public looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z
    .registers 4
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 398
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    .line 399
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->looped(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)Z

    move-result v0

    return v0
.end method

.method public looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J
    .registers 5
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 375
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J

    .line 376
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZActor$Actor;->looping(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;)J

    move-result-wide v0

    return-wide v0
.end method

.method public premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;
    .registers 3
    .param p1, "pipe"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 352
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;

    .line 353
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1}, Lorg/zeromq/ZActor$Actor;->premiere(Lorg/zeromq/ZMQ$Socket;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z
    .registers 6
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "pipe"    # Lorg/zeromq/ZMQ$Socket;
    .param p3, "poller"    # Lorg/zeromq/ZPoller;
    .param p4, "events"    # I

    .prologue
    .line 391
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/zeromq/ZActor$Actor;->stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    .line 392
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/zeromq/ZActor$Actor;->stage(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller;I)Z

    move-result v0

    return v0
.end method

.method public start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V
    .registers 5
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
    .line 368
    .local p2, "sockets":Ljava/util/List;, "Ljava/util/List<Lorg/zeromq/ZMQ$Socket;>;"
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->shadow:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZActor$Actor;->start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V

    .line 369
    iget-object v0, p0, Lorg/zeromq/ZActor$Duo;->main:Lorg/zeromq/ZActor$Actor;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZActor$Actor;->start(Lorg/zeromq/ZMQ$Socket;Ljava/util/List;Lorg/zeromq/ZPoller;)V

    .line 370
    return-void
.end method
