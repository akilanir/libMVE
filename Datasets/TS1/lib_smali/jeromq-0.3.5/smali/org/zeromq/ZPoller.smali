.class public Lorg/zeromq/ZPoller;
.super Ljava/lang/Object;
.source "ZPoller.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZPoller$1;,
        Lorg/zeromq/ZPoller$SimpleCreator;,
        Lorg/zeromq/ZPoller$ZPollItem;,
        Lorg/zeromq/ZPoller$ItemCreator;,
        Lorg/zeromq/ZPoller$ItemHolder;,
        Lorg/zeromq/ZPoller$EventsHandler;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final ERR:I = 0x4

.field public static final IN:I = 0x1

.field public static final OUT:I = 0x2

.field public static final POLLERR:I = 0x4

.field public static final POLLIN:I = 0x1

.field public static final POLLOUT:I = 0x2


# instance fields
.field private final all:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final creator:Lorg/zeromq/ZPoller$ItemCreator;

.field private globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

.field private final items:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/util/Set",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;>;"
        }
    .end annotation
.end field

.field private final selector:Ljava/nio/channels/Selector;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 73
    const-class v0, Lorg/zeromq/ZPoller;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/nio/channels/Selector;)V
    .registers 4
    .param p1, "selector"    # Ljava/nio/channels/Selector;

    .prologue
    .line 264
    new-instance v0, Lorg/zeromq/ZPoller$SimpleCreator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/zeromq/ZPoller$SimpleCreator;-><init>(Lorg/zeromq/ZPoller$1;)V

    invoke-direct {p0, v0, p1}, Lorg/zeromq/ZPoller;-><init>(Lorg/zeromq/ZPoller$ItemCreator;Ljava/nio/channels/Selector;)V

    .line 265
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZPoller$ItemCreator;Ljava/nio/channels/Selector;)V
    .registers 4
    .param p1, "creator"    # Lorg/zeromq/ZPoller$ItemCreator;
    .param p2, "selector"    # Ljava/nio/channels/Selector;

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 288
    iput-object p1, p0, Lorg/zeromq/ZPoller;->creator:Lorg/zeromq/ZPoller$ItemCreator;

    .line 289
    iput-object p2, p0, Lorg/zeromq/ZPoller;->selector:Ljava/nio/channels/Selector;

    .line 290
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZPoller;->items:Ljava/util/Map;

    .line 291
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/zeromq/ZPoller;->createContainer(I)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    .line 292
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZPoller$ItemCreator;Lorg/zeromq/ZPoller;)V
    .registers 4
    .param p1, "creator"    # Lorg/zeromq/ZPoller$ItemCreator;
    .param p2, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 277
    iget-object v0, p2, Lorg/zeromq/ZPoller;->selector:Ljava/nio/channels/Selector;

    invoke-direct {p0, p1, v0}, Lorg/zeromq/ZPoller;-><init>(Lorg/zeromq/ZPoller$ItemCreator;Ljava/nio/channels/Selector;)V

    .line 278
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZPoller;)V
    .registers 4
    .param p1, "poller"    # Lorg/zeromq/ZPoller;

    .prologue
    .line 254
    iget-object v0, p1, Lorg/zeromq/ZPoller;->creator:Lorg/zeromq/ZPoller$ItemCreator;

    iget-object v1, p1, Lorg/zeromq/ZPoller;->selector:Ljava/nio/channels/Selector;

    invoke-direct {p0, v0, v1}, Lorg/zeromq/ZPoller;-><init>(Lorg/zeromq/ZPoller$ItemCreator;Ljava/nio/channels/Selector;)V

    .line 255
    return-void
.end method


# virtual methods
.method protected add(Ljava/lang/Object;Lorg/zeromq/ZPoller$ItemHolder;)Z
    .registers 8
    .param p1, "socketOrChannel"    # Ljava/lang/Object;
    .param p2, "holder"    # Lorg/zeromq/ZPoller$ItemHolder;

    .prologue
    .line 724
    if-nez p1, :cond_2c

    .line 725
    invoke-interface {p2}, Lorg/zeromq/ZPoller$ItemHolder;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v3

    .line 726
    .local v3, "socket":Lorg/zeromq/ZMQ$Socket;
    invoke-interface {p2}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v4

    invoke-virtual {v4}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v0

    .line 727
    .local v0, "ch":Ljava/nio/channels/SelectableChannel;
    if-nez v3, :cond_1d

    .line 729
    sget-boolean v4, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v4, :cond_1c

    if-nez v0, :cond_1c

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 730
    :cond_1c
    move-object p1, v0

    .line 732
    .end local p1    # "socketOrChannel":Ljava/lang/Object;
    :cond_1d
    if-nez v0, :cond_2c

    .line 734
    sget-boolean v4, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v4, :cond_2b

    if-nez v3, :cond_2b

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 735
    :cond_2b
    move-object p1, v3

    .line 738
    .end local v0    # "ch":Ljava/nio/channels/SelectableChannel;
    .end local v3    # "socket":Lorg/zeromq/ZMQ$Socket;
    :cond_2c
    sget-boolean v4, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v4, :cond_38

    if-nez p1, :cond_38

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 740
    :cond_38
    iget-object v4, p0, Lorg/zeromq/ZPoller;->items:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 741
    .local v1, "holders":Ljava/util/Set;, "Ljava/util/Set<Lorg/zeromq/ZPoller$ItemHolder;>;"
    if-nez v1, :cond_4c

    .line 742
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lorg/zeromq/ZPoller;->createContainer(I)Ljava/util/Set;

    move-result-object v1

    .line 743
    iget-object v4, p0, Lorg/zeromq/ZPoller;->items:Ljava/util/Map;

    invoke-interface {v4, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 745
    :cond_4c
    invoke-interface {v1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    .line 746
    .local v2, "rc":Z
    if-eqz v2, :cond_57

    .line 747
    iget-object v4, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    invoke-interface {v4, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 749
    :cond_57
    return v2
.end method

.method public close()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 674
    return-void
.end method

.method protected create(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
    .registers 5
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 304
    sget-boolean v0, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 305
    :cond_c
    iget-object v0, p0, Lorg/zeromq/ZPoller;->creator:Lorg/zeromq/ZPoller$ItemCreator;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZPoller$ItemCreator;->create(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;

    move-result-object v0

    return-object v0
.end method

.method protected create(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 297
    sget-boolean v0, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 298
    :cond_c
    iget-object v0, p0, Lorg/zeromq/ZPoller;->creator:Lorg/zeromq/ZPoller$ItemCreator;

    invoke-interface {v0, p1, p2, p3}, Lorg/zeromq/ZPoller$ItemCreator;->create(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;

    move-result-object v0

    return-object v0
.end method

.method protected createContainer(I)Ljava/util/Set;
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 755
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p1}, Ljava/util/HashSet;-><init>(I)V

    return-object v0
.end method

.method public destroy()V
    .registers 2

    .prologue
    .line 682
    :try_start_0
    invoke-virtual {p0}, Lorg/zeromq/ZPoller;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 687
    :goto_3
    return-void

    .line 684
    :catch_4
    move-exception v0

    .line 685
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public dispatch()Z
    .registers 3

    .prologue
    .line 532
    iget-object v0, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    iget-object v1, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/zeromq/ZPoller;->dispatch(Ljava/util/Collection;I)Z

    move-result v0

    return v0
.end method

.method protected dispatch(Ljava/util/Collection;I)Z
    .registers 15
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .local p1, "all":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/zeromq/ZPoller$ItemHolder;>;"
    const/4 v10, 0x0

    .line 490
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v11

    new-array v11, v11, [Lorg/zeromq/ZPoller$ItemHolder;

    invoke-interface {p1, v11}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/zeromq/ZPoller$ItemHolder;

    .line 492
    .local v1, "array":[Lorg/zeromq/ZPoller$ItemHolder;
    move-object v0, v1

    .local v0, "arr$":[Lorg/zeromq/ZPoller$ItemHolder;
    array-length v8, v0

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_10
    if-ge v6, v8, :cond_61

    aget-object v5, v0, v6

    .line 493
    .local v5, "holder":Lorg/zeromq/ZPoller$ItemHolder;
    invoke-interface {v5}, Lorg/zeromq/ZPoller$ItemHolder;->handler()Lorg/zeromq/ZPoller$EventsHandler;

    move-result-object v4

    .line 494
    .local v4, "handler":Lorg/zeromq/ZPoller$EventsHandler;
    if-nez v4, :cond_1c

    .line 495
    iget-object v4, p0, Lorg/zeromq/ZPoller;->globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

    .line 497
    :cond_1c
    if-nez v4, :cond_21

    .line 492
    :cond_1e
    add-int/lit8 v6, v6, 0x1

    goto :goto_10

    .line 501
    :cond_21
    invoke-interface {v5}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v7

    .line 502
    .local v7, "item":Lzmq/PollItem;
    invoke-virtual {v7}, Lzmq/PollItem;->readyOps()I

    move-result v3

    .line 504
    .local v3, "events":I
    if-lez v3, :cond_1e

    .line 508
    invoke-interface {v5}, Lorg/zeromq/ZPoller$ItemHolder;->socket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v9

    .line 509
    .local v9, "socket":Lorg/zeromq/ZMQ$Socket;
    invoke-interface {v5}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v11

    invoke-virtual {v11}, Lzmq/PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    .line 511
    .local v2, "channel":Ljava/nio/channels/SelectableChannel;
    if-eqz v9, :cond_4c

    .line 512
    sget-boolean v11, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v11, :cond_45

    if-eqz v2, :cond_45

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 514
    :cond_45
    invoke-interface {v4, v9, v3}, Lorg/zeromq/ZPoller$EventsHandler;->events(Lorg/zeromq/ZMQ$Socket;I)Z

    move-result v11

    if-nez v11, :cond_4c

    .line 526
    .end local v2    # "channel":Ljava/nio/channels/SelectableChannel;
    .end local v3    # "events":I
    .end local v4    # "handler":Lorg/zeromq/ZPoller$EventsHandler;
    .end local v5    # "holder":Lorg/zeromq/ZPoller$ItemHolder;
    .end local v7    # "item":Lzmq/PollItem;
    .end local v9    # "socket":Lorg/zeromq/ZMQ$Socket;
    :goto_4b
    return v10

    .line 518
    .restart local v2    # "channel":Ljava/nio/channels/SelectableChannel;
    .restart local v3    # "events":I
    .restart local v4    # "handler":Lorg/zeromq/ZPoller$EventsHandler;
    .restart local v5    # "holder":Lorg/zeromq/ZPoller$ItemHolder;
    .restart local v7    # "item":Lzmq/PollItem;
    .restart local v9    # "socket":Lorg/zeromq/ZMQ$Socket;
    :cond_4c
    if-eqz v2, :cond_1e

    .line 520
    sget-boolean v11, Lorg/zeromq/ZPoller;->$assertionsDisabled:Z

    if-nez v11, :cond_5a

    if-eqz v9, :cond_5a

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 521
    :cond_5a
    invoke-interface {v4, v2, v3}, Lorg/zeromq/ZPoller$EventsHandler;->events(Ljava/nio/channels/SelectableChannel;I)Z

    move-result v11

    if-nez v11, :cond_1e

    goto :goto_4b

    .line 526
    .end local v2    # "channel":Ljava/nio/channels/SelectableChannel;
    .end local v3    # "events":I
    .end local v4    # "handler":Lorg/zeromq/ZPoller$EventsHandler;
    .end local v5    # "holder":Lorg/zeromq/ZPoller$ItemHolder;
    .end local v7    # "item":Lzmq/PollItem;
    .end local v9    # "socket":Lorg/zeromq/ZMQ$Socket;
    :cond_61
    const/4 v10, 0x1

    goto :goto_4b
.end method

.method public error(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "socketOrChannel"    # Ljava/lang/Object;

    .prologue
    .line 658
    const/4 v1, 0x4

    invoke-virtual {p0, p1, v1}, Lorg/zeromq/ZPoller;->filter(Ljava/lang/Object;I)Lzmq/PollItem;

    move-result-object v0

    .line 659
    .local v0, "it":Lzmq/PollItem;
    if-nez v0, :cond_9

    .line 660
    const/4 v1, 0x0

    .line 662
    :goto_8
    return v1

    :cond_9
    invoke-virtual {v0}, Lzmq/PollItem;->isError()Z

    move-result v1

    goto :goto_8
.end method

.method public error(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 636
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->error(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public error(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 652
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->error(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected filter(Ljava/lang/Object;I)Lzmq/PollItem;
    .registers 9
    .param p1, "socketOrChannel"    # Ljava/lang/Object;
    .param p2, "events"    # I

    .prologue
    const/4 v4, 0x0

    .line 777
    if-nez p1, :cond_5

    move-object v1, v4

    .line 788
    :goto_4
    return-object v1

    .line 781
    :cond_5
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->items(Ljava/lang/Object;)Ljava/lang/Iterable;

    move-result-object v3

    .line 782
    .local v3, "items":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/zeromq/ZPoller$ItemHolder;>;"
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/zeromq/ZPoller$ItemHolder;

    .line 783
    .local v2, "item":Lorg/zeromq/ZPoller$ItemHolder;
    invoke-interface {v2}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v1

    .line 784
    .local v1, "it":Lzmq/PollItem;
    invoke-virtual {v1}, Lzmq/PollItem;->interestOps()I

    move-result v5

    and-int/2addr v5, p2

    if-lez v5, :cond_d

    goto :goto_4

    .end local v1    # "it":Lzmq/PollItem;
    .end local v2    # "item":Lorg/zeromq/ZPoller$ItemHolder;
    :cond_25
    move-object v1, v4

    .line 788
    goto :goto_4
.end method

.method public getGlobalHandler()Lorg/zeromq/ZPoller$EventsHandler;
    .registers 2

    .prologue
    .line 325
    iget-object v0, p0, Lorg/zeromq/ZPoller;->globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

    return-object v0
.end method

.method public isError(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 631
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->error(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isError(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 647
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->error(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isReadable(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 547
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->readable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isReadable(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 563
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->readable(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v0

    return v0
.end method

.method public isWritable(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 589
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->writable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isWritable(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 605
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->writable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected items(Ljava/lang/Object;)Ljava/lang/Iterable;
    .registers 4
    .param p1, "socketOrChannel"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 767
    iget-object v1, p0, Lorg/zeromq/ZPoller;->items:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 768
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Lorg/zeromq/ZPoller$ItemHolder;>;"
    if-nez v0, :cond_e

    .line 769
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    .line 771
    .end local v0    # "set":Ljava/util/Set;, "Ljava/util/Set<Lorg/zeromq/ZPoller$ItemHolder;>;"
    :cond_e
    return-object v0
.end method

.method protected items()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/zeromq/ZPoller$ItemHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 761
    iget-object v0, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    return-object v0
.end method

.method public poll(J)I
    .registers 4
    .param p1, "timeout"    # J

    .prologue
    .line 435
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/zeromq/ZPoller;->poll(JZ)I

    move-result v0

    return v0
.end method

.method protected poll(JZ)I
    .registers 10
    .param p1, "timeout"    # J
    .param p3, "dispatchEvents"    # Z

    .prologue
    .line 450
    invoke-virtual {p0}, Lorg/zeromq/ZPoller;->items()Ljava/util/Collection;

    move-result-object v0

    .line 451
    .local v0, "all":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/zeromq/ZPoller$ItemHolder;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/HashSet;-><init>(I)V

    .line 452
    .local v3, "pollItems":Ljava/util/Set;, "Ljava/util/Set<Lzmq/PollItem;>;"
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZPoller$ItemHolder;

    .line 453
    .local v1, "holder":Lorg/zeromq/ZPoller$ItemHolder;
    invoke-interface {v1}, Lorg/zeromq/ZPoller$ItemHolder;->item()Lzmq/PollItem;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 456
    .end local v1    # "holder":Lorg/zeromq/ZPoller$ItemHolder;
    :cond_25
    iget-object v5, p0, Lorg/zeromq/ZPoller;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {p0, v5, p1, p2, v3}, Lorg/zeromq/ZPoller;->poll(Ljava/nio/channels/Selector;JLjava/util/Collection;)I

    move-result v4

    .line 458
    .local v4, "rc":I
    if-nez p3, :cond_2e

    .line 468
    .end local v4    # "rc":I
    :cond_2d
    :goto_2d
    return v4

    .line 463
    .restart local v4    # "rc":I
    :cond_2e
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    invoke-virtual {p0, v0, v5}, Lorg/zeromq/ZPoller;->dispatch(Ljava/util/Collection;I)Z

    move-result v5

    if-nez v5, :cond_2d

    .line 468
    const/4 v4, -0x1

    goto :goto_2d
.end method

.method protected poll(Ljava/nio/channels/Selector;JLjava/util/Collection;)I
    .registers 7
    .param p1, "selector"    # Ljava/nio/channels/Selector;
    .param p2, "tout"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/channels/Selector;",
            "J",
            "Ljava/util/Collection",
            "<",
            "Lzmq/PollItem;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 475
    .local p4, "items":Ljava/util/Collection;, "Ljava/util/Collection<Lzmq/PollItem;>;"
    invoke-interface {p4}, Ljava/util/Collection;->size()I

    move-result v0

    .line 476
    .local v0, "size":I
    new-array v1, v0, [Lzmq/PollItem;

    invoke-interface {p4, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lzmq/PollItem;

    invoke-static {p1, v1, v0, p2, p3}, Lzmq/ZMQ;->poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;IJ)I

    move-result v1

    return v1
.end method

.method public readable(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "socketOrChannel"    # Ljava/lang/Object;

    .prologue
    .line 574
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lorg/zeromq/ZPoller;->filter(Ljava/lang/Object;I)Lzmq/PollItem;

    move-result-object v0

    .line 575
    .local v0, "it":Lzmq/PollItem;
    if-nez v0, :cond_9

    .line 576
    const/4 v1, 0x0

    .line 578
    :goto_8
    return v1

    :cond_9
    invoke-virtual {v0}, Lzmq/PollItem;->isReadable()Z

    move-result v1

    goto :goto_8
.end method

.method public readable(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 552
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->readable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public readable(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 568
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->readable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final register(Ljava/nio/channels/SelectableChannel;I)Z
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "events"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lorg/zeromq/ZPoller;->globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

    invoke-virtual {p0, p1, v0, p2}, Lorg/zeromq/ZPoller;->register(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Z

    move-result v0

    return v0
.end method

.method public final register(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;)Z
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;

    .prologue
    .line 374
    const/4 v0, 0x7

    invoke-virtual {p0, p1, p2, v0}, Lorg/zeromq/ZPoller;->register(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Z

    move-result v0

    return v0
.end method

.method public final register(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Z
    .registers 5
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 366
    if-nez p1, :cond_4

    .line 367
    const/4 v0, 0x0

    .line 369
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0, p1, p2, p3}, Lorg/zeromq/ZPoller;->create(Ljava/nio/channels/SelectableChannel;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZPoller;->add(Ljava/lang/Object;Lorg/zeromq/ZPoller$ItemHolder;)Z

    move-result v0

    goto :goto_3
.end method

.method public final register(Lorg/zeromq/ZMQ$Socket;I)Z
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "events"    # I

    .prologue
    .line 352
    iget-object v0, p0, Lorg/zeromq/ZPoller;->globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

    invoke-virtual {p0, p1, v0, p2}, Lorg/zeromq/ZPoller;->register(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Z

    move-result v0

    return v0
.end method

.method public final register(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;)Z
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;

    .prologue
    .line 347
    const/4 v0, 0x7

    invoke-virtual {p0, p1, p2, v0}, Lorg/zeromq/ZPoller;->register(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Z

    move-result v0

    return v0
.end method

.method public final register(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Z
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "handler"    # Lorg/zeromq/ZPoller$EventsHandler;
    .param p3, "events"    # I

    .prologue
    .line 339
    if-nez p1, :cond_4

    .line 340
    const/4 v0, 0x0

    .line 342
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0, p1, p2, p3}, Lorg/zeromq/ZPoller;->create(Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZPoller$EventsHandler;I)Lorg/zeromq/ZPoller$ItemHolder;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZPoller;->add(Ljava/lang/Object;Lorg/zeromq/ZPoller$ItemHolder;)Z

    move-result v0

    goto :goto_3
.end method

.method public final register(Lorg/zeromq/ZPoller$ItemHolder;)Z
    .registers 3
    .param p1, "item"    # Lorg/zeromq/ZPoller$ItemHolder;

    .prologue
    .line 390
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/zeromq/ZPoller;->add(Ljava/lang/Object;Lorg/zeromq/ZPoller$ItemHolder;)Z

    move-result v0

    return v0
.end method

.method public setGlobalHandler(Lorg/zeromq/ZPoller$EventsHandler;)V
    .registers 2
    .param p1, "globalHandler"    # Lorg/zeromq/ZPoller$EventsHandler;

    .prologue
    .line 315
    iput-object p1, p0, Lorg/zeromq/ZPoller;->globalHandler:Lorg/zeromq/ZPoller$EventsHandler;

    .line 316
    return-void
.end method

.method public final unregister(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "socketOrChannel"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 402
    if-nez p1, :cond_4

    .line 410
    :cond_3
    :goto_3
    return v1

    .line 405
    :cond_4
    iget-object v2, p0, Lorg/zeromq/ZPoller;->items:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 406
    .local v0, "items":Ljava/util/Set;, "Ljava/util/Set<Lorg/zeromq/ZPoller$ItemHolder;>;"
    if-eqz v0, :cond_f

    const/4 v1, 0x1

    .line 407
    .local v1, "rc":Z
    :cond_f
    if-eqz v1, :cond_3

    .line 408
    iget-object v2, p0, Lorg/zeromq/ZPoller;->all:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    goto :goto_3
.end method

.method public writable(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "socketOrChannel"    # Ljava/lang/Object;

    .prologue
    .line 616
    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lorg/zeromq/ZPoller;->filter(Ljava/lang/Object;I)Lzmq/PollItem;

    move-result-object v0

    .line 617
    .local v0, "it":Lzmq/PollItem;
    if-nez v0, :cond_9

    .line 618
    const/4 v1, 0x0

    .line 620
    :goto_8
    return v1

    :cond_9
    invoke-virtual {v0}, Lzmq/PollItem;->isWritable()Z

    move-result v1

    goto :goto_8
.end method

.method public writable(Ljava/nio/channels/SelectableChannel;)Z
    .registers 3
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 594
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->writable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public writable(Lorg/zeromq/ZMQ$Socket;)Z
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 610
    invoke-virtual {p0, p1}, Lorg/zeromq/ZPoller;->writable(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
