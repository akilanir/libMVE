.class public Lorg/zeromq/ZMQ$Poller;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Poller"
.end annotation


# static fields
.field public static final POLLERR:I = 0x4

.field public static final POLLIN:I = 0x1

.field public static final POLLOUT:I = 0x2

.field private static final SIZE_DEFAULT:I = 0x20

.field private static final SIZE_INCREMENT:I = 0x10


# instance fields
.field private items:[Lorg/zeromq/ZMQ$PollItem;

.field private next:I

.field private timeout:J


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 1479
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/zeromq/ZMQ$Poller;-><init>(Lorg/zeromq/ZMQ$Context;I)V

    .line 1480
    return-void
.end method

.method protected constructor <init>(Lorg/zeromq/ZMQ$Context;)V
    .registers 3
    .param p1, "context"    # Lorg/zeromq/ZMQ$Context;

    .prologue
    .line 1505
    const/16 v0, 0x20

    invoke-direct {p0, p1, v0}, Lorg/zeromq/ZMQ$Poller;-><init>(Lorg/zeromq/ZMQ$Context;I)V

    .line 1506
    return-void
.end method

.method protected constructor <init>(Lorg/zeromq/ZMQ$Context;I)V
    .registers 5
    .param p1, "context"    # Lorg/zeromq/ZMQ$Context;
    .param p2, "size"    # I

    .prologue
    .line 1491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1492
    new-array v0, p2, [Lorg/zeromq/ZMQ$PollItem;

    iput-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    .line 1493
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/zeromq/ZMQ$Poller;->timeout:J

    .line 1494
    const/4 v0, 0x0

    iput v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    .line 1495
    return-void
.end method

.method private insert(Lorg/zeromq/ZMQ$PollItem;)I
    .registers 7
    .param p1, "item"    # Lorg/zeromq/ZMQ$PollItem;

    .prologue
    const/4 v4, 0x0

    .line 1568
    iget v1, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    .line 1569
    .local v1, "pos":I
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v2, v2

    if-ne v1, v2, :cond_1d

    .line 1570
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x10

    new-array v0, v2, [Lorg/zeromq/ZMQ$PollItem;

    .line 1571
    .local v0, "nitems":[Lorg/zeromq/ZMQ$PollItem;
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    iget-object v3, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v3, v3

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1572
    iput-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    .line 1574
    .end local v0    # "nitems":[Lorg/zeromq/ZMQ$PollItem;
    :cond_1d
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aput-object p1, v2, v1

    .line 1575
    return v1
.end method

.method private remove(I)V
    .registers 5
    .param p1, "pos"    # I

    .prologue
    .line 1614
    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    .line 1615
    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-eq p1, v0, :cond_14

    .line 1616
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    iget-object v1, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    iget v2, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    aget-object v1, v1, v2

    aput-object v1, v0, p1

    .line 1618
    :cond_14
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    iget v1, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 1619
    return-void
.end method


# virtual methods
.method public getItem(I)Lorg/zeromq/ZMQ$PollItem;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1630
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-lt p1, v0, :cond_8

    .line 1631
    :cond_6
    const/4 v0, 0x0

    .line 1633
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v0, p1

    goto :goto_7
.end method

.method public getNext()I
    .registers 2

    .prologue
    .line 1695
    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    return v0
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 1685
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v0, v0

    return v0
.end method

.method public getSocket(I)Lorg/zeromq/ZMQ$Socket;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1645
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-lt p1, v0, :cond_8

    .line 1646
    :cond_6
    const/4 v0, 0x0

    .line 1648
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    goto :goto_7
.end method

.method public getTimeout()J
    .registers 3

    .prologue
    .line 1659
    iget-wide v0, p0, Lorg/zeromq/ZMQ$Poller;->timeout:J

    return-wide v0
.end method

.method public poll()I
    .registers 7

    .prologue
    .line 1707
    const-wide/16 v0, -0x1

    .line 1708
    .local v0, "tout":J
    iget-wide v2, p0, Lorg/zeromq/ZMQ$Poller;->timeout:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-lez v2, :cond_c

    .line 1709
    iget-wide v0, p0, Lorg/zeromq/ZMQ$Poller;->timeout:J

    .line 1711
    :cond_c
    invoke-virtual {p0, v0, v1}, Lorg/zeromq/ZMQ$Poller;->poll(J)I

    move-result v2

    return v2
.end method

.method public poll(J)I
    .registers 6
    .param p1, "tout"    # J

    .prologue
    .line 1733
    iget v2, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    new-array v1, v2, [Lzmq/PollItem;

    .line 1734
    .local v1, "pollItems":[Lzmq/PollItem;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget v2, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-ge v0, v2, :cond_16

    .line 1735
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/zeromq/ZMQ$PollItem;->base()Lzmq/PollItem;

    move-result-object v2

    aput-object v2, v1, v0

    .line 1734
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 1738
    :cond_16
    iget v2, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    invoke-static {v1, v2, p1, p2}, Lzmq/ZMQ;->poll([Lzmq/PollItem;IJ)I

    move-result v2

    return v2
.end method

.method public pollerr(I)Z
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1782
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-lt p1, v0, :cond_8

    .line 1783
    :cond_6
    const/4 v0, 0x0

    .line 1786
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->isError()Z

    move-result v0

    goto :goto_7
.end method

.method public pollin(I)Z
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1750
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-lt p1, v0, :cond_8

    .line 1751
    :cond_6
    const/4 v0, 0x0

    .line 1754
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->isReadable()Z

    move-result v0

    goto :goto_7
.end method

.method public pollout(I)Z
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1766
    if-ltz p1, :cond_6

    iget v0, p0, Lorg/zeromq/ZMQ$Poller;->next:I

    if-lt p1, v0, :cond_8

    .line 1767
    :cond_6
    const/4 v0, 0x0

    .line 1770
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->isWritable()Z

    move-result v0

    goto :goto_7
.end method

.method public register(Ljava/nio/channels/SelectableChannel;I)I
    .registers 4
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "events"    # I

    .prologue
    .line 1549
    new-instance v0, Lorg/zeromq/ZMQ$PollItem;

    invoke-direct {v0, p1, p2}, Lorg/zeromq/ZMQ$PollItem;-><init>(Ljava/nio/channels/SelectableChannel;I)V

    invoke-direct {p0, v0}, Lorg/zeromq/ZMQ$Poller;->insert(Lorg/zeromq/ZMQ$PollItem;)I

    move-result v0

    return v0
.end method

.method public register(Lorg/zeromq/ZMQ$PollItem;)I
    .registers 3
    .param p1, "item"    # Lorg/zeromq/ZMQ$PollItem;

    .prologue
    .line 1563
    invoke-direct {p0, p1}, Lorg/zeromq/ZMQ$Poller;->insert(Lorg/zeromq/ZMQ$PollItem;)I

    move-result v0

    return v0
.end method

.method public register(Lorg/zeromq/ZMQ$Socket;)I
    .registers 3
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 1517
    const/4 v0, 0x7

    invoke-virtual {p0, p1, v0}, Lorg/zeromq/ZMQ$Poller;->register(Lorg/zeromq/ZMQ$Socket;I)I

    move-result v0

    return v0
.end method

.method public register(Lorg/zeromq/ZMQ$Socket;I)I
    .registers 4
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "events"    # I

    .prologue
    .line 1533
    new-instance v0, Lorg/zeromq/ZMQ$PollItem;

    invoke-direct {v0, p1, p2}, Lorg/zeromq/ZMQ$PollItem;-><init>(Lorg/zeromq/ZMQ$Socket;I)V

    invoke-direct {p0, v0}, Lorg/zeromq/ZMQ$Poller;->insert(Lorg/zeromq/ZMQ$PollItem;)I

    move-result v0

    return v0
.end method

.method public setTimeout(J)V
    .registers 5
    .param p1, "timeout"    # J

    .prologue
    .line 1671
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-gez v0, :cond_7

    .line 1676
    :goto_6
    return-void

    .line 1675
    :cond_7
    iput-wide p1, p0, Lorg/zeromq/ZMQ$Poller;->timeout:J

    goto :goto_6
.end method

.method public unregister(Ljava/nio/channels/SelectableChannel;)V
    .registers 5
    .param p1, "channel"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 1603
    const/4 v1, 0x0

    .local v1, "pos":I
    :goto_1
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v2, v2

    if-ge v1, v2, :cond_13

    .line 1604
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v2, v1

    .line 1605
    .local v0, "item":Lorg/zeromq/ZMQ$PollItem;
    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v2

    if-ne v2, p1, :cond_14

    .line 1606
    invoke-direct {p0, v1}, Lorg/zeromq/ZMQ$Poller;->remove(I)V

    .line 1610
    .end local v0    # "item":Lorg/zeromq/ZMQ$PollItem;
    :cond_13
    return-void

    .line 1603
    .restart local v0    # "item":Lorg/zeromq/ZMQ$PollItem;
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public unregister(Lorg/zeromq/ZMQ$Socket;)V
    .registers 5
    .param p1, "socket"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 1586
    const/4 v1, 0x0

    .local v1, "pos":I
    :goto_1
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    array-length v2, v2

    if-ge v1, v2, :cond_13

    .line 1587
    iget-object v2, p0, Lorg/zeromq/ZMQ$Poller;->items:[Lorg/zeromq/ZMQ$PollItem;

    aget-object v0, v2, v1

    .line 1588
    .local v0, "item":Lorg/zeromq/ZMQ$PollItem;
    invoke-virtual {v0}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    if-ne v2, p1, :cond_14

    .line 1589
    invoke-direct {p0, v1}, Lorg/zeromq/ZMQ$Poller;->remove(I)V

    .line 1593
    .end local v0    # "item":Lorg/zeromq/ZMQ$PollItem;
    :cond_13
    return-void

    .line 1586
    .restart local v0    # "item":Lorg/zeromq/ZMQ$PollItem;
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method
