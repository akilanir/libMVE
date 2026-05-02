.class public Lzmq/Poller;
.super Lzmq/PollerBase;
.source "Poller.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Poller$PollSet;
    }
.end annotation


# instance fields
.field private final fdTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/nio/channels/SelectableChannel;",
            "Lzmq/Poller$PollSet;",
            ">;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;

.field private final retired:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private selector:Ljava/nio/channels/Selector;

.field private volatile stopped:Z

.field private volatile stopping:Z

.field private worker:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 66
    const-string v0, "poller"

    invoke-direct {p0, v0}, Lzmq/Poller;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 70
    invoke-direct {p0}, Lzmq/PollerBase;-><init>()V

    .line 54
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lzmq/Poller;->retired:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 71
    iput-object p1, p0, Lzmq/Poller;->name:Ljava/lang/String;

    .line 72
    iput-boolean v2, p0, Lzmq/Poller;->stopping:Z

    .line 73
    iput-boolean v2, p0, Lzmq/Poller;->stopped:Z

    .line 75
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    .line 77
    :try_start_18
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v1

    iput-object v1, p0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1e} :catch_1f

    .line 82
    return-void

    .line 79
    :catch_1f
    move-exception v0

    .line 80
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lzmq/ZError$IOException;

    invoke-direct {v1, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method private rebuildSelector()V
    .registers 7

    .prologue
    .line 273
    :try_start_0
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_25

    move-result-object v2

    .line 280
    .local v2, "newSelector":Ljava/nio/channels/Selector;
    :try_start_4
    iget-object v4, p0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v4}, Ljava/nio/channels/Selector;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_33

    .line 285
    :goto_9
    iput-object v2, p0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    .line 287
    iget-object v4, p0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzmq/Poller$PollSet;

    .line 288
    .local v3, "pollSet":Lzmq/Poller$PollSet;
    const/4 v4, 0x0

    iput-object v4, v3, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    goto :goto_15

    .line 275
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "newSelector":Ljava/nio/channels/Selector;
    .end local v3    # "pollSet":Lzmq/Poller$PollSet;
    :catch_25
    move-exception v0

    .line 276
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lzmq/ZError$IOException;

    invoke-direct {v4, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v4

    .line 291
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "newSelector":Ljava/nio/channels/Selector;
    :cond_2c
    iget-object v4, p0, Lzmq/Poller;->retired:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 292
    return-void

    .line 282
    .end local v1    # "i$":Ljava/util/Iterator;
    :catch_33
    move-exception v4

    goto :goto_9
.end method

.method private final register(Ljava/nio/channels/SelectableChannel;IZ)V
    .registers 7
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "ops"    # I
    .param p3, "negate"    # Z

    .prologue
    .line 150
    iget-object v1, p0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Poller$PollSet;

    .line 152
    .local v0, "pollset":Lzmq/Poller$PollSet;
    if-eqz p3, :cond_1d

    .line 153
    iget v1, v0, Lzmq/Poller$PollSet;->ops:I

    xor-int/lit8 v2, p2, -0x1

    and-int/2addr v1, v2

    iput v1, v0, Lzmq/Poller$PollSet;->ops:I

    .line 159
    :goto_11
    iget-object v1, v0, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    if-eqz v1, :cond_23

    .line 160
    iget-object v1, v0, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    iget v2, v0, Lzmq/Poller$PollSet;->ops:I

    invoke-virtual {v1, v2}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 165
    :goto_1c
    return-void

    .line 156
    :cond_1d
    iget v1, v0, Lzmq/Poller$PollSet;->ops:I

    or-int/2addr v1, p2

    iput v1, v0, Lzmq/Poller$PollSet;->ops:I

    goto :goto_11

    .line 163
    :cond_23
    iget-object v1, p0, Lzmq/Poller;->retired:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_1c
.end method


# virtual methods
.method public final addHandle(Ljava/nio/channels/SelectableChannel;Lzmq/IPollEvents;)V
    .registers 5
    .param p1, "fd"    # Ljava/nio/channels/SelectableChannel;
    .param p2, "events"    # Lzmq/IPollEvents;

    .prologue
    .line 104
    iget-object v0, p0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    new-instance v1, Lzmq/Poller$PollSet;

    invoke-direct {v1, p2}, Lzmq/Poller$PollSet;-><init>(Lzmq/IPollEvents;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lzmq/Poller;->adjustLoad(I)V

    .line 107
    return-void
.end method

.method public bridge synthetic addTimer(JLzmq/IPollEvents;I)V
    .registers 5
    .param p1, "x0"    # J
    .param p3, "x1"    # Lzmq/IPollEvents;
    .param p4, "x2"    # I

    .prologue
    .line 33
    invoke-super {p0, p1, p2, p3, p4}, Lzmq/PollerBase;->addTimer(JLzmq/IPollEvents;I)V

    return-void
.end method

.method public bridge synthetic cancelTimer(Lzmq/IPollEvents;I)V
    .registers 3
    .param p1, "x0"    # Lzmq/IPollEvents;
    .param p2, "x1"    # I

    .prologue
    .line 33
    invoke-super {p0, p1, p2}, Lzmq/PollerBase;->cancelTimer(Lzmq/IPollEvents;I)V

    return-void
.end method

.method public destroy()V
    .registers 3

    .prologue
    .line 86
    iget-boolean v1, p0, Lzmq/Poller;->stopped:Z

    if-nez v1, :cond_9

    .line 88
    :try_start_4
    iget-object v1, p0, Lzmq/Poller;->worker:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_9} :catch_14

    .line 95
    :cond_9
    :goto_9
    :try_start_9
    iget-object v1, p0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v1}, Ljava/nio/channels/Selector;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_e} :catch_f

    .line 100
    :goto_e
    return-void

    .line 97
    :catch_f
    move-exception v0

    .line 98
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e

    .line 90
    .end local v0    # "e":Ljava/io/IOException;
    :catch_14
    move-exception v1

    goto :goto_9
.end method

.method public final removeHandle(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    const/4 v1, 0x1

    .line 111
    iget-object v0, p0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmq/Poller$PollSet;

    iput-boolean v1, v0, Lzmq/Poller$PollSet;->cancelled:Z

    .line 112
    iget-object v0, p0, Lzmq/Poller;->retired:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 115
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lzmq/Poller;->adjustLoad(I)V

    .line 116
    return-void
.end method

.method public final resetPollOn(Ljava/nio/channels/SelectableChannel;)V
    .registers 3
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    const/4 v0, 0x1

    .line 125
    invoke-direct {p0, p1, v0, v0}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 126
    return-void
.end method

.method public final resetPollOut(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 135
    const/4 v0, 0x4

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 136
    return-void
.end method

.method public run()V
    .registers 22

    .prologue
    .line 183
    const/4 v12, 0x0

    .line 185
    .local v12, "returnsImmediately":I
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lzmq/Poller;->stopping:Z

    move/from16 v17, v0

    if-nez v17, :cond_10e

    .line 187
    invoke-virtual/range {p0 .. p0}, Lzmq/Poller;->executeTimers()J

    move-result-wide v15

    .line 189
    .local v15, "timeout":J
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/Poller;->retired:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v19}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v17

    if-eqz v17, :cond_82

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/Poller;->fdTable:Ljava/util/Map;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 191
    .local v8, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;>;"
    :cond_2b
    :goto_2b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_d

    .line 192
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 193
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/channels/SelectableChannel;

    .line 194
    .local v3, "ch":Ljava/nio/channels/SelectableChannel;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lzmq/Poller$PollSet;

    .line 195
    .local v10, "pollset":Lzmq/Poller$PollSet;
    iget-object v0, v10, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    move-object/from16 v17, v0

    if-nez v17, :cond_65

    .line 197
    :try_start_49
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    move-object/from16 v17, v0

    iget v0, v10, Lzmq/Poller$PollSet;->ops:I

    move/from16 v18, v0

    iget-object v0, v10, Lzmq/Poller$PollSet;->handler:Lzmq/IPollEvents;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-virtual {v3, v0, v1, v2}, Ljava/nio/channels/SelectableChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v10, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;
    :try_end_65
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_49 .. :try_end_65} :catch_117

    .line 203
    :cond_65
    :goto_65
    iget-boolean v0, v10, Lzmq/Poller$PollSet;->cancelled:Z

    move/from16 v17, v0

    if-nez v17, :cond_71

    invoke-virtual {v3}, Ljava/nio/channels/SelectableChannel;->isOpen()Z

    move-result v17

    if-nez v17, :cond_2b

    .line 204
    :cond_71
    iget-object v0, v10, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    move-object/from16 v17, v0

    if-eqz v17, :cond_7e

    .line 205
    iget-object v0, v10, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/nio/channels/SelectionKey;->cancel()V

    .line 207
    :cond_7e
    invoke-interface {v8}, Ljava/util/Iterator;->remove()V

    goto :goto_2b

    .line 214
    .end local v3    # "ch":Ljava/nio/channels/SelectableChannel;
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;"
    .end local v8    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;>;"
    .end local v10    # "pollset":Lzmq/Poller$PollSet;
    :cond_82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    .line 216
    .local v13, "start":J
    :try_start_86
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-wide v1, v15

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/Selector;->select(J)I
    :try_end_92
    .catch Ljava/io/IOException; {:try_start_86 .. :try_end_92} :catch_b7

    move-result v11

    .line 222
    .local v11, "rc":I
    if-nez v11, :cond_c2

    .line 224
    const-wide/16 v17, 0x0

    cmp-long v17, v15, v17

    if-eqz v17, :cond_a9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v17

    sub-long v17, v17, v13

    const-wide/16 v19, 0x2

    div-long v19, v15, v19

    cmp-long v17, v17, v19

    if-gez v17, :cond_c0

    .line 226
    :cond_a9
    add-int/lit8 v12, v12, 0x1

    .line 232
    :goto_ab
    const/16 v17, 0xa

    move/from16 v0, v17

    if-le v12, v0, :cond_1

    .line 233
    invoke-direct/range {p0 .. p0}, Lzmq/Poller;->rebuildSelector()V

    .line 234
    const/4 v12, 0x0

    goto/16 :goto_1

    .line 218
    .end local v11    # "rc":I
    :catch_b7
    move-exception v4

    .line 219
    .local v4, "e":Ljava/io/IOException;
    new-instance v17, Lzmq/ZError$IOException;

    move-object/from16 v0, v17

    invoke-direct {v0, v4}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v17

    .line 229
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v11    # "rc":I
    :cond_c0
    const/4 v12, 0x0

    goto :goto_ab

    .line 239
    :cond_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 240
    .local v7, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    :cond_d0
    :goto_d0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_1

    .line 241
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/nio/channels/SelectionKey;

    .line 242
    .local v9, "key":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lzmq/IPollEvents;

    .line 243
    .local v6, "evt":Lzmq/IPollEvents;
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    .line 246
    :try_start_e5
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isReadable()Z

    move-result v17

    if-eqz v17, :cond_fa

    .line 247
    invoke-interface {v6}, Lzmq/IPollEvents;->inEvent()V

    .line 255
    :cond_ee
    :goto_ee
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 256
    invoke-interface {v6}, Lzmq/IPollEvents;->outEvent()V

    goto :goto_d0

    .line 259
    :catch_f8
    move-exception v17

    goto :goto_d0

    .line 249
    :cond_fa
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isAcceptable()Z

    move-result v17

    if-eqz v17, :cond_104

    .line 250
    invoke-interface {v6}, Lzmq/IPollEvents;->acceptEvent()V

    goto :goto_ee

    .line 252
    :cond_104
    invoke-virtual {v9}, Ljava/nio/channels/SelectionKey;->isConnectable()Z

    move-result v17

    if-eqz v17, :cond_ee

    .line 253
    invoke-interface {v6}, Lzmq/IPollEvents;->connectEvent()V
    :try_end_10d
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_e5 .. :try_end_10d} :catch_f8

    goto :goto_ee

    .line 265
    .end local v6    # "evt":Lzmq/IPollEvents;
    .end local v7    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/nio/channels/SelectionKey;>;"
    .end local v9    # "key":Ljava/nio/channels/SelectionKey;
    .end local v11    # "rc":I
    .end local v13    # "start":J
    .end local v15    # "timeout":J
    :cond_10e
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lzmq/Poller;->stopped:Z

    .line 266
    return-void

    .line 199
    .restart local v3    # "ch":Ljava/nio/channels/SelectableChannel;
    .restart local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;"
    .restart local v8    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/nio/channels/SelectableChannel;Lzmq/Poller$PollSet;>;>;"
    .restart local v10    # "pollset":Lzmq/Poller$PollSet;
    .restart local v15    # "timeout":J
    :catch_117
    move-exception v17

    goto/16 :goto_65
.end method

.method public final setPollAccept(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 145
    const/16 v0, 0x10

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 146
    return-void
.end method

.method public final setPollConnect(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 140
    const/16 v0, 0x8

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 141
    return-void
.end method

.method public final setPollIn(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 120
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 121
    return-void
.end method

.method public final setPollOut(Ljava/nio/channels/SelectableChannel;)V
    .registers 4
    .param p1, "handle"    # Ljava/nio/channels/SelectableChannel;

    .prologue
    .line 130
    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lzmq/Poller;->register(Ljava/nio/channels/SelectableChannel;IZ)V

    .line 131
    return-void
.end method

.method public start()V
    .registers 3

    .prologue
    .line 169
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lzmq/Poller;->name:Ljava/lang/String;

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lzmq/Poller;->worker:Ljava/lang/Thread;

    .line 170
    iget-object v0, p0, Lzmq/Poller;->worker:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 171
    iget-object v0, p0, Lzmq/Poller;->worker:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 172
    return-void
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 176
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Poller;->stopping:Z

    .line 177
    iget-object v0, p0, Lzmq/Poller;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->wakeup()Ljava/nio/channels/Selector;

    .line 178
    return-void
.end method
