.class public Lorg/zeromq/ZLoop;
.super Ljava/lang/Object;
.source "ZLoop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZLoop$STimer;,
        Lorg/zeromq/ZLoop$SPoller;,
        Lorg/zeromq/ZLoop$IZLoopHandler;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private dirty:Z

.field private final newTimers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZLoop$STimer;",
            ">;"
        }
    .end annotation
.end field

.field private pollSize:I

.field private pollact:[Lorg/zeromq/ZLoop$SPoller;

.field private final pollers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZLoop$SPoller;",
            ">;"
        }
    .end annotation
.end field

.field private pollset:Lorg/zeromq/ZMQ$Poller;

.field private final timers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/zeromq/ZLoop$STimer;",
            ">;"
        }
    .end annotation
.end field

.field private verbose:Z

.field private final zombies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lorg/zeromq/ZLoop;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZLoop;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZLoop;->pollers:Ljava/util/List;

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZLoop;->zombies:Ljava/util/List;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    .line 96
    return-void
.end method

.method private rebuild()V
    .registers 6

    .prologue
    .line 109
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/zeromq/ZLoop;->pollact:[Lorg/zeromq/ZLoop$SPoller;

    .line 111
    iget-object v3, p0, Lorg/zeromq/ZLoop;->pollers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, p0, Lorg/zeromq/ZLoop;->pollSize:I

    .line 112
    new-instance v3, Lorg/zeromq/ZMQ$Poller;

    iget v4, p0, Lorg/zeromq/ZLoop;->pollSize:I

    invoke-direct {v3, v4}, Lorg/zeromq/ZMQ$Poller;-><init>(I)V

    iput-object v3, p0, Lorg/zeromq/ZLoop;->pollset:Lorg/zeromq/ZMQ$Poller;

    .line 114
    iget v3, p0, Lorg/zeromq/ZLoop;->pollSize:I

    new-array v3, v3, [Lorg/zeromq/ZLoop$SPoller;

    iput-object v3, p0, Lorg/zeromq/ZLoop;->pollact:[Lorg/zeromq/ZLoop$SPoller;

    .line 116
    const/4 v1, 0x0

    .line 117
    .local v1, "itemNbr":I
    iget-object v3, p0, Lorg/zeromq/ZLoop;->pollers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/zeromq/ZLoop$SPoller;

    .line 118
    .local v2, "poller":Lorg/zeromq/ZLoop$SPoller;
    iget-object v3, p0, Lorg/zeromq/ZLoop;->pollset:Lorg/zeromq/ZMQ$Poller;

    iget-object v4, v2, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v3, v4}, Lorg/zeromq/ZMQ$Poller;->register(Lorg/zeromq/ZMQ$PollItem;)I

    .line 119
    iget-object v3, p0, Lorg/zeromq/ZLoop;->pollact:[Lorg/zeromq/ZLoop$SPoller;

    aput-object v2, v3, v1

    .line 120
    add-int/lit8 v1, v1, 0x1

    .line 121
    goto :goto_21

    .line 122
    .end local v2    # "poller":Lorg/zeromq/ZLoop$SPoller;
    :cond_3b
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/zeromq/ZLoop;->dirty:Z

    .line 123
    return-void
.end method

.method private ticklessTimer()J
    .registers 12

    .prologue
    .line 128
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/32 v8, 0x36ee80

    add-long v1, v6, v8

    .line 129
    .local v1, "tickless":J
    iget-object v6, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/zeromq/ZLoop$STimer;

    .line 130
    .local v5, "timer":Lorg/zeromq/ZLoop$STimer;
    iget-wide v6, v5, Lorg/zeromq/ZLoop$STimer;->when:J

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-nez v6, :cond_2d

    .line 131
    iget v6, v5, Lorg/zeromq/ZLoop$STimer;->delay:I

    int-to-long v6, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    add-long/2addr v6, v8

    iput-wide v6, v5, Lorg/zeromq/ZLoop$STimer;->when:J

    .line 133
    :cond_2d
    iget-wide v6, v5, Lorg/zeromq/ZLoop$STimer;->when:J

    cmp-long v6, v1, v6

    if-lez v6, :cond_f

    .line 134
    iget-wide v1, v5, Lorg/zeromq/ZLoop$STimer;->when:J

    goto :goto_f

    .line 137
    .end local v5    # "timer":Lorg/zeromq/ZLoop$STimer;
    :cond_36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v3, v1, v6

    .line 138
    .local v3, "timeout":J
    const-wide/16 v6, 0x0

    cmp-long v6, v3, v6

    if-gez v6, :cond_44

    .line 139
    const-wide/16 v3, 0x0

    .line 141
    :cond_44
    iget-boolean v6, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v6, :cond_59

    .line 142
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "I: zloop: polling for %d msec\n"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 144
    :cond_59
    return-wide v3
.end method


# virtual methods
.method public addPoller(Lorg/zeromq/ZMQ$PollItem;Lorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)I
    .registers 11
    .param p1, "pollItem"    # Lorg/zeromq/ZMQ$PollItem;
    .param p2, "handler"    # Lorg/zeromq/ZLoop$IZLoopHandler;
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 154
    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v1

    if-nez v1, :cond_10

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v1

    if-nez v1, :cond_10

    .line 155
    const/4 v1, -0x1

    .line 167
    :goto_f
    return v1

    .line 158
    :cond_10
    new-instance v0, Lorg/zeromq/ZLoop$SPoller;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/zeromq/ZLoop$SPoller;-><init>(Lorg/zeromq/ZLoop;Lorg/zeromq/ZMQ$PollItem;Lorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)V

    .line 159
    .local v0, "poller":Lorg/zeromq/ZLoop$SPoller;
    iget-object v1, p0, Lorg/zeromq/ZLoop;->pollers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    iput-boolean v6, p0, Lorg/zeromq/ZLoop;->dirty:Z

    .line 162
    iget-boolean v1, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v1, :cond_4b

    .line 163
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "I: zloop: register %s poller (%s, %s)\n"

    const/4 v1, 0x3

    new-array v5, v1, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v1

    if-eqz v1, :cond_4d

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v1

    invoke-virtual {v1}, Lorg/zeromq/ZMQ$Socket;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_39
    aput-object v1, v5, v2

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v1

    aput-object v1, v5, v6

    const/4 v1, 0x2

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v3, v4, v5}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    :cond_4b
    move v1, v2

    .line 167
    goto :goto_f

    .line 163
    :cond_4d
    const-string v1, "RAW"

    goto :goto_39
.end method

.method public addTimer(IILorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)I
    .registers 12
    .param p1, "delay"    # I
    .param p2, "times"    # I
    .param p3, "handler"    # Lorg/zeromq/ZLoop$IZLoopHandler;
    .param p4, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    .line 201
    new-instance v0, Lorg/zeromq/ZLoop$STimer;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZLoop$STimer;-><init>(Lorg/zeromq/ZLoop;IILorg/zeromq/ZLoop$IZLoopHandler;Ljava/lang/Object;)V

    .line 206
    .local v0, "timer":Lorg/zeromq/ZLoop$STimer;
    iget-object v1, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    iget-boolean v1, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v1, :cond_2b

    .line 208
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "I: zloop: register timer delay=%d times=%d\n"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 211
    :cond_2b
    return v6
.end method

.method public destroy()V
    .registers 1

    .prologue
    .line 101
    return-void
.end method

.method public removePoller(Lorg/zeromq/ZMQ$PollItem;)V
    .registers 10
    .param p1, "pollItem"    # Lorg/zeromq/ZMQ$PollItem;

    .prologue
    const/4 v7, 0x1

    .line 177
    iget-object v2, p0, Lorg/zeromq/ZLoop;->pollers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 178
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZLoop$SPoller;>;"
    :cond_7
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 179
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/zeromq/ZLoop$SPoller;

    .line 180
    .local v1, "p":Lorg/zeromq/ZLoop$SPoller;
    iget-object v2, v1, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {p1, v2}, Lorg/zeromq/ZMQ$PollItem;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 181
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 182
    iput-boolean v7, p0, Lorg/zeromq/ZLoop;->dirty:Z

    goto :goto_7

    .line 185
    .end local v1    # "p":Lorg/zeromq/ZLoop$SPoller;
    :cond_21
    iget-boolean v2, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v2, :cond_51

    .line 186
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "I: zloop: cancel %s poller (%s, %s)"

    const/4 v2, 0x3

    new-array v5, v2, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    if-eqz v2, :cond_52

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    invoke-virtual {v2}, Lorg/zeromq/ZMQ$Socket;->getType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :goto_3f
    aput-object v2, v5, v6

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v2

    aput-object v2, v5, v7

    const/4 v2, 0x2

    invoke-virtual {p1}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v3, v4, v5}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 191
    :cond_51
    return-void

    .line 186
    :cond_52
    const-string v2, "RAW"

    goto :goto_3f
.end method

.method public removeTimer(Ljava/lang/Object;)I
    .registers 6
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 220
    sget-boolean v0, Lorg/zeromq/ZLoop;->$assertionsDisabled:Z

    if-nez v0, :cond_d

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 225
    :cond_d
    iget-object v0, p0, Lorg/zeromq/ZLoop;->zombies:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    iget-boolean v0, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v0, :cond_1f

    .line 227
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "I: zloop: cancel timer\n"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 230
    :cond_1f
    return v3
.end method

.method public start()I
    .registers 15

    .prologue
    .line 249
    const/4 v5, 0x0

    .line 251
    .local v5, "rc":I
    iget-object v9, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    iget-object v10, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    invoke-interface {v9, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 252
    iget-object v9, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->clear()V

    .line 255
    iget-object v9, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/zeromq/ZLoop$STimer;

    .line 256
    .local v6, "timer":Lorg/zeromq/ZLoop$STimer;
    iget v9, v6, Lorg/zeromq/ZLoop$STimer;->delay:I

    int-to-long v9, v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    add-long/2addr v9, v11

    iput-wide v9, v6, Lorg/zeromq/ZLoop$STimer;->when:J

    goto :goto_13

    .line 260
    .end local v6    # "timer":Lorg/zeromq/ZLoop$STimer;
    :cond_2a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v9

    if-nez v9, :cond_5e

    .line 261
    iget-boolean v9, p0, Lorg/zeromq/ZLoop;->dirty:Z

    if-eqz v9, :cond_3b

    .line 264
    invoke-direct {p0}, Lorg/zeromq/ZLoop;->rebuild()V

    .line 266
    :cond_3b
    invoke-direct {p0}, Lorg/zeromq/ZLoop;->ticklessTimer()J

    move-result-wide v7

    .line 268
    .local v7, "wait":J
    iget-object v9, p0, Lorg/zeromq/ZLoop;->pollset:Lorg/zeromq/ZMQ$Poller;

    invoke-virtual {v9, v7, v8}, Lorg/zeromq/ZMQ$Poller;->poll(J)I

    move-result v5

    .line 270
    const/4 v9, -0x1

    if-ne v5, v9, :cond_5f

    .line 271
    iget-boolean v9, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v9, :cond_5d

    .line 272
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "I: zloop: interrupted (%d)\n"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 274
    :cond_5d
    const/4 v5, 0x0

    .line 353
    .end local v7    # "wait":J
    :cond_5e
    :goto_5e
    return v5

    .line 278
    .restart local v7    # "wait":J
    :cond_5f
    iget-object v9, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 279
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/zeromq/ZLoop$STimer;>;"
    :cond_65
    :goto_65
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9a

    .line 280
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/zeromq/ZLoop$STimer;

    .line 281
    .restart local v6    # "timer":Lorg/zeromq/ZLoop$STimer;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iget-wide v11, v6, Lorg/zeromq/ZLoop$STimer;->when:J

    cmp-long v9, v9, v11

    if-ltz v9, :cond_65

    iget-wide v9, v6, Lorg/zeromq/ZLoop$STimer;->when:J

    const-wide/16 v11, -0x1

    cmp-long v9, v9, v11

    if-eqz v9, :cond_65

    .line 282
    iget-boolean v9, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v9, :cond_8e

    .line 283
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v10, "I: zloop: call timer handler"

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 285
    :cond_8e
    iget-object v9, v6, Lorg/zeromq/ZLoop$STimer;->handler:Lorg/zeromq/ZLoop$IZLoopHandler;

    const/4 v10, 0x0

    iget-object v11, v6, Lorg/zeromq/ZLoop$STimer;->arg:Ljava/lang/Object;

    invoke-interface {v9, p0, v10, v11}, Lorg/zeromq/ZLoop$IZLoopHandler;->handle(Lorg/zeromq/ZLoop;Lorg/zeromq/ZMQ$PollItem;Ljava/lang/Object;)I

    move-result v5

    .line 286
    const/4 v9, -0x1

    if-ne v5, v9, :cond_174

    .line 297
    .end local v6    # "timer":Lorg/zeromq/ZLoop$STimer;
    :cond_9a
    const/4 v9, -0x1

    if-eq v5, v9, :cond_5e

    .line 302
    const/4 v3, 0x0

    .local v3, "itemNbr":I
    :goto_9e
    iget v9, p0, Lorg/zeromq/ZLoop;->pollSize:I

    if-ge v3, v9, :cond_14a

    .line 303
    iget-object v9, p0, Lorg/zeromq/ZLoop;->pollact:[Lorg/zeromq/ZLoop$SPoller;

    aget-object v4, v9, v3

    .line 304
    .local v4, "poller":Lorg/zeromq/ZLoop$SPoller;
    iget-object v9, p0, Lorg/zeromq/ZLoop;->pollset:Lorg/zeromq/ZMQ$Poller;

    invoke-virtual {v9, v3}, Lorg/zeromq/ZMQ$Poller;->getItem(I)Lorg/zeromq/ZMQ$PollItem;

    move-result-object v9

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->isError()Z

    move-result v9

    if-eqz v9, :cond_195

    .line 305
    iget-boolean v9, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v9, :cond_eb

    .line 306
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v11, "I: zloop: can\'t poll %s socket (%s, %s)\n"

    const/4 v9, 0x3

    new-array v12, v9, [Ljava/lang/Object;

    const/4 v13, 0x0

    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v9

    if-eqz v9, :cond_191

    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v9

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$Socket;->getType()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_d4
    aput-object v9, v12, v13

    const/4 v9, 0x1

    iget-object v13, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v13}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v13

    aput-object v13, v12, v9

    const/4 v9, 0x2

    iget-object v13, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v13}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v10, v11, v12}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 312
    :cond_eb
    iget v9, v4, Lorg/zeromq/ZLoop$SPoller;->errors:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v4, Lorg/zeromq/ZLoop$SPoller;->errors:I

    if-lez v9, :cond_f8

    .line 313
    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {p0, v9}, Lorg/zeromq/ZLoop;->removePoller(Lorg/zeromq/ZMQ$PollItem;)V

    .line 320
    :cond_f8
    :goto_f8
    iget-object v9, p0, Lorg/zeromq/ZLoop;->pollset:Lorg/zeromq/ZMQ$Poller;

    invoke-virtual {v9, v3}, Lorg/zeromq/ZMQ$Poller;->getItem(I)Lorg/zeromq/ZMQ$PollItem;

    move-result-object v9

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->readyOps()I

    move-result v9

    if-lez v9, :cond_19d

    .line 321
    iget-boolean v9, p0, Lorg/zeromq/ZLoop;->verbose:Z

    if-eqz v9, :cond_13d

    .line 322
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v11, "I: zloop: call %s socket handler (%s, %s)\n"

    const/4 v9, 0x3

    new-array v12, v9, [Ljava/lang/Object;

    const/4 v13, 0x0

    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v9

    if-eqz v9, :cond_19a

    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v9

    invoke-virtual {v9}, Lorg/zeromq/ZMQ$Socket;->getType()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_126
    aput-object v9, v12, v13

    const/4 v9, 0x1

    iget-object v13, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v13}, Lorg/zeromq/ZMQ$PollItem;->getSocket()Lorg/zeromq/ZMQ$Socket;

    move-result-object v13

    aput-object v13, v12, v9

    const/4 v9, 0x2

    iget-object v13, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    invoke-virtual {v13}, Lorg/zeromq/ZMQ$PollItem;->getRawSocket()Ljava/nio/channels/SelectableChannel;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v10, v11, v12}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 326
    :cond_13d
    iget-object v9, v4, Lorg/zeromq/ZLoop$SPoller;->handler:Lorg/zeromq/ZLoop$IZLoopHandler;

    iget-object v10, v4, Lorg/zeromq/ZLoop$SPoller;->item:Lorg/zeromq/ZMQ$PollItem;

    iget-object v11, v4, Lorg/zeromq/ZLoop$SPoller;->arg:Ljava/lang/Object;

    invoke-interface {v9, p0, v10, v11}, Lorg/zeromq/ZLoop$IZLoopHandler;->handle(Lorg/zeromq/ZLoop;Lorg/zeromq/ZMQ$PollItem;Ljava/lang/Object;)I

    move-result v5

    .line 327
    const/4 v9, -0x1

    if-ne v5, v9, :cond_19d

    .line 335
    .end local v4    # "poller":Lorg/zeromq/ZLoop$SPoller;
    :cond_14a
    iget-object v9, p0, Lorg/zeromq/ZLoop;->zombies:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_150
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1a1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 336
    .local v0, "arg":Ljava/lang/Object;
    iget-object v9, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 337
    :cond_160
    :goto_160
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_150

    .line 338
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/zeromq/ZLoop$STimer;

    .line 339
    .restart local v6    # "timer":Lorg/zeromq/ZLoop$STimer;
    iget-object v9, v6, Lorg/zeromq/ZLoop$STimer;->arg:Ljava/lang/Object;

    if-ne v9, v0, :cond_160

    .line 340
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_160

    .line 289
    .end local v0    # "arg":Ljava/lang/Object;
    .end local v3    # "itemNbr":I
    :cond_174
    iget v9, v6, Lorg/zeromq/ZLoop$STimer;->times:I

    if-eqz v9, :cond_185

    iget v9, v6, Lorg/zeromq/ZLoop$STimer;->times:I

    add-int/lit8 v9, v9, -0x1

    iput v9, v6, Lorg/zeromq/ZLoop$STimer;->times:I

    if-nez v9, :cond_185

    .line 290
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_65

    .line 293
    :cond_185
    iget v9, v6, Lorg/zeromq/ZLoop$STimer;->delay:I

    int-to-long v9, v9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    add-long/2addr v9, v11

    iput-wide v9, v6, Lorg/zeromq/ZLoop$STimer;->when:J

    goto/16 :goto_65

    .line 306
    .end local v6    # "timer":Lorg/zeromq/ZLoop$STimer;
    .restart local v3    # "itemNbr":I
    .restart local v4    # "poller":Lorg/zeromq/ZLoop$SPoller;
    :cond_191
    const-string v9, "RAW"

    goto/16 :goto_d4

    .line 317
    :cond_195
    const/4 v9, 0x0

    iput v9, v4, Lorg/zeromq/ZLoop$SPoller;->errors:I

    goto/16 :goto_f8

    .line 322
    :cond_19a
    const-string v9, "RAW"

    goto :goto_126

    .line 302
    :cond_19d
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_9e

    .line 345
    .end local v4    # "poller":Lorg/zeromq/ZLoop$SPoller;
    :cond_1a1
    iget-object v9, p0, Lorg/zeromq/ZLoop;->timers:Ljava/util/List;

    iget-object v10, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    invoke-interface {v9, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 346
    iget-object v9, p0, Lorg/zeromq/ZLoop;->newTimers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->clear()V

    .line 348
    const/4 v9, -0x1

    if-ne v5, v9, :cond_2a

    goto/16 :goto_5e
.end method

.method public verbose(Z)V
    .registers 2
    .param p1, "verbose"    # Z

    .prologue
    .line 237
    iput-boolean p1, p0, Lorg/zeromq/ZLoop;->verbose:Z

    .line 238
    return-void
.end method
