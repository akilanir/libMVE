.class public Lzmq/ZMQ;
.super Ljava/lang/Object;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/ZMQ$PollSelector;,
        Lzmq/ZMQ$Event;
    }
.end annotation


# static fields
.field public static final CHARSET:Ljava/nio/charset/Charset;

.field public static final MESSAGE_SEPARATOR:[B

.field private static final POLL_SELECTOR:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lzmq/ZMQ$PollSelector;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUBSCRIPTION_ALL:[B

.field public static final ZMQ_AFFINITY:I = 0x4

.field public static final ZMQ_BACKLOG:I = 0x13

.field public static final ZMQ_BLOCKY:I = 0x46

.field public static final ZMQ_DEALER:I = 0x5

.field public static final ZMQ_DECODER:I = 0x3ea

.field public static final ZMQ_DELAY_ATTACH_ON_CONNECT:I = 0x27

.field public static final ZMQ_DONTWAIT:I = 0x1

.field public static final ZMQ_ENCODER:I = 0x3e9

.field public static final ZMQ_EVENTS:I = 0xf

.field public static final ZMQ_EVENT_ACCEPTED:I = 0x20

.field public static final ZMQ_EVENT_ACCEPT_FAILED:I = 0x40

.field public static final ZMQ_EVENT_ALL:I = 0x7ff

.field public static final ZMQ_EVENT_BIND_FAILED:I = 0x10

.field public static final ZMQ_EVENT_CLOSED:I = 0x80

.field public static final ZMQ_EVENT_CLOSE_FAILED:I = 0x100

.field public static final ZMQ_EVENT_CONNECTED:I = 0x1

.field public static final ZMQ_EVENT_CONNECT_DELAYED:I = 0x2

.field public static final ZMQ_EVENT_CONNECT_RETRIED:I = 0x4

.field public static final ZMQ_EVENT_DISCONNECTED:I = 0x200

.field public static final ZMQ_EVENT_LISTENING:I = 0x8

.field public static final ZMQ_EVENT_MONITOR_STOPPED:I = 0x400

.field public static final ZMQ_FAIL_UNROUTABLE:I = 0x21

.field public static final ZMQ_FD:I = 0xe

.field public static final ZMQ_FORWARDER:I = 0x2

.field public static final ZMQ_IDENTITY:I = 0x5

.field public static final ZMQ_IO_THREADS:I = 0x1

.field public static final ZMQ_IO_THREADS_DFLT:I = 0x1

.field public static final ZMQ_IPV4ONLY:I = 0x1f

.field public static final ZMQ_LAST_ENDPOINT:I = 0x20

.field public static final ZMQ_LINGER:I = 0x11

.field public static final ZMQ_MAXMSGSIZE:I = 0x16

.field public static final ZMQ_MAX_SOCKETS:I = 0x2

.field public static final ZMQ_MAX_SOCKETS_DFLT:I = 0x400

.field public static final ZMQ_MORE:I = 0x1

.field public static final ZMQ_MULTICAST_HOPS:I = 0x19

.field public static final ZMQ_NOBLOCK:I = 0x1

.field public static final ZMQ_PAIR:I = 0x0

.field public static final ZMQ_POLLERR:I = 0x4

.field public static final ZMQ_POLLIN:I = 0x1

.field public static final ZMQ_POLLOUT:I = 0x2

.field public static final ZMQ_PUB:I = 0x1

.field public static final ZMQ_PULL:I = 0x7

.field public static final ZMQ_PUSH:I = 0x8

.field public static final ZMQ_QUEUE:I = 0x3

.field public static final ZMQ_RATE:I = 0x8

.field public static final ZMQ_RCVBUF:I = 0xc

.field public static final ZMQ_RCVHWM:I = 0x18

.field public static final ZMQ_RCVMORE:I = 0xd

.field public static final ZMQ_RCVTIMEO:I = 0x1b

.field public static final ZMQ_RECONNECT_IVL:I = 0x12

.field public static final ZMQ_RECONNECT_IVL_MAX:I = 0x15

.field public static final ZMQ_RECOVERY_IVL:I = 0x9

.field public static final ZMQ_REP:I = 0x4

.field public static final ZMQ_REQ:I = 0x3

.field public static final ZMQ_ROUTER:I = 0x6

.field public static final ZMQ_ROUTER_BEHAVIOR:I = 0x21

.field public static final ZMQ_ROUTER_HANDOVER:I = 0x38

.field public static final ZMQ_ROUTER_MANDATORY:I = 0x21

.field public static final ZMQ_SNDBUF:I = 0xb

.field public static final ZMQ_SNDHWM:I = 0x17

.field public static final ZMQ_SNDMORE:I = 0x2

.field public static final ZMQ_SNDTIMEO:I = 0x1c

.field public static final ZMQ_STREAMER:I = 0x1

.field public static final ZMQ_SUB:I = 0x2

.field public static final ZMQ_SUBSCRIBE:I = 0x6

.field public static final ZMQ_TCP_ACCEPT_FILTER:I = 0x26

.field public static final ZMQ_TCP_KEEPALIVE:I = 0x22

.field public static final ZMQ_TCP_KEEPALIVE_CNT:I = 0x23

.field public static final ZMQ_TCP_KEEPALIVE_IDLE:I = 0x24

.field public static final ZMQ_TCP_KEEPALIVE_INTVL:I = 0x25

.field public static final ZMQ_TYPE:I = 0x10

.field public static final ZMQ_UNSUBSCRIBE:I = 0x7

.field public static final ZMQ_VERSION_MAJOR:I = 0x3

.field public static final ZMQ_VERSION_MINOR:I = 0x2

.field public static final ZMQ_VERSION_PATCH:I = 0x5

.field public static final ZMQ_XPUB:I = 0x9

.field public static final ZMQ_XPUB_VERBOSE:I = 0x28

.field public static final ZMQ_XREP:I = 0x6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ZMQ_XREQ:I = 0x5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final ZMQ_XSUB:I = 0xa


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 161
    new-array v0, v1, [B

    sput-object v0, Lzmq/ZMQ;->MESSAGE_SEPARATOR:[B

    .line 163
    new-array v0, v1, [B

    sput-object v0, Lzmq/ZMQ;->SUBSCRIPTION_ALL:[B

    .line 165
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    .line 800
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 803
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 32
    sget-object v0, Lzmq/ZMQ;->POLL_SELECTOR:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method public static bind(Lzmq/SocketBase;Ljava/lang/String;)Z
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 345
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 346
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 349
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->bind(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static close(Lzmq/SocketBase;)V
    .registers 2
    .param p0, "s"    # Lzmq/SocketBase;

    .prologue
    .line 304
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 305
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 307
    :cond_e
    invoke-virtual {p0}, Lzmq/SocketBase;->close()V

    .line 308
    return-void
.end method

.method public static connect(Lzmq/SocketBase;Ljava/lang/String;)Z
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 354
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 355
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 357
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->connect(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static createContext()Lzmq/Ctx;
    .registers 1

    .prologue
    .line 247
    new-instance v0, Lzmq/Ctx;

    invoke-direct {v0}, Lzmq/Ctx;-><init>()V

    .line 248
    .local v0, "ctx":Lzmq/Ctx;
    return-object v0
.end method

.method private static destroyContext(Lzmq/Ctx;)V
    .registers 2
    .param p0, "ctx"    # Lzmq/Ctx;

    .prologue
    .line 253
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/Ctx;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 254
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 257
    :cond_e
    invoke-virtual {p0}, Lzmq/Ctx;->terminate()V

    .line 258
    return-void
.end method

.method public static device(ILzmq/SocketBase;Lzmq/SocketBase;)Z
    .registers 4
    .param p0, "device"    # I
    .param p1, "insocket"    # Lzmq/SocketBase;
    .param p2, "outsocket"    # Lzmq/SocketBase;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 569
    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lzmq/Proxy;->proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z

    move-result v0

    return v0
.end method

.method public static disconnect(Lzmq/SocketBase;Ljava/lang/String;)Z
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 370
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 371
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 373
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->termEndpoint(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static getContextOption(Lzmq/Ctx;I)I
    .registers 3
    .param p0, "ctx"    # Lzmq/Ctx;
    .param p1, "option"    # I

    .prologue
    .line 270
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/Ctx;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 271
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 273
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/Ctx;->get(I)I

    move-result v0

    return v0
.end method

.method public static getMessageOption(Lzmq/Msg;I)I
    .registers 3
    .param p0, "msg"    # Lzmq/Msg;
    .param p1, "option"    # I

    .prologue
    .line 536
    packed-switch p1, :pswitch_data_14

    .line 540
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 538
    :pswitch_9
    invoke-virtual {p0}, Lzmq/Msg;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10

    .line 536
    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public static getSocketOption(Lzmq/SocketBase;I)I
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "opt"    # I

    .prologue
    .line 331
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->getSocketOpt(I)I

    move-result v0

    return v0
.end method

.method public static getSocketOptionExt(Lzmq/SocketBase;I)Ljava/lang/Object;
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "option"    # I

    .prologue
    .line 322
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 323
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 326
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->getsockoptx(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static init(I)Lzmq/Ctx;
    .registers 4
    .param p0, "ioThreads"    # I

    .prologue
    .line 279
    if-ltz p0, :cond_b

    .line 280
    invoke-static {}, Lzmq/ZMQ;->createContext()Lzmq/Ctx;

    move-result-object v0

    .line 281
    .local v0, "ctx":Lzmq/Ctx;
    const/4 v1, 0x1

    invoke-static {v0, v1, p0}, Lzmq/ZMQ;->setContextOption(Lzmq/Ctx;II)V

    .line 282
    return-object v0

    .line 284
    .end local v0    # "ctx":Lzmq/Ctx;
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "io_threds must not be negative"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static makeVersion(III)I
    .registers 5
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .param p2, "patch"    # I

    .prologue
    .line 792
    mul-int/lit16 v0, p0, 0x2710

    mul-int/lit8 v1, p1, 0x64

    add-int/2addr v0, v1

    add-int/2addr v0, p2

    return v0
.end method

.method public static monitorSocket(Lzmq/SocketBase;Ljava/lang/String;I)Z
    .registers 4
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "events"    # I

    .prologue
    .line 336
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 337
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 340
    :cond_e
    invoke-virtual {p0, p1, p2}, Lzmq/SocketBase;->monitor(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static msgInit()Lzmq/Msg;
    .registers 1

    .prologue
    .line 521
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0}, Lzmq/Msg;-><init>()V

    return-object v0
.end method

.method public static msgInitWithSize(I)Lzmq/Msg;
    .registers 2
    .param p0, "messageSize"    # I

    .prologue
    .line 526
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0, p0}, Lzmq/Msg;-><init>(I)V

    return-object v0
.end method

.method public static msgSize(Lzmq/Msg;)I
    .registers 2
    .param p0, "msg"    # Lzmq/Msg;

    .prologue
    .line 531
    invoke-virtual {p0}, Lzmq/Msg;->size()I

    move-result v0

    return v0
.end method

.method public static poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;IJ)I
    .registers 28
    .param p0, "selector"    # Ljava/nio/channels/Selector;
    .param p1, "items"    # [Lzmq/PollItem;
    .param p2, "count"    # I
    .param p3, "timeout"    # J

    .prologue
    .line 637
    if-nez p1, :cond_8

    .line 638
    new-instance v21, Ljava/lang/IllegalArgumentException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v21

    .line 640
    :cond_8
    if-nez p2, :cond_17

    .line 641
    const-wide/16 v21, 0x0

    cmp-long v21, p3, v21

    if-gtz v21, :cond_12

    .line 642
    const/4 v13, 0x0

    .line 777
    :cond_11
    :goto_11
    return v13

    .line 645
    :cond_12
    :try_start_12
    invoke-static/range {p3 .. p4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_15
    .catch Ljava/lang/InterruptedException; {:try_start_12 .. :try_end_15} :catch_14b

    .line 649
    :goto_15
    const/4 v13, 0x0

    goto :goto_11

    .line 651
    :cond_17
    const-wide/16 v14, 0x0

    .line 652
    .local v14, "now":J
    const-wide/16 v6, 0x0

    .line 654
    .local v6, "end":J
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 655
    .local v18, "saved":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/nio/channels/SelectableChannel;Ljava/nio/channels/SelectionKey;>;"
    invoke-virtual/range {p0 .. p0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_28
    :goto_28
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_46

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/nio/channels/SelectionKey;

    .line 656
    .local v12, "key":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v12}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v21

    if-eqz v21, :cond_28

    .line 657
    invoke-virtual {v12}, Ljava/nio/channels/SelectionKey;->channel()Ljava/nio/channels/SelectableChannel;

    move-result-object v21

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_28

    .line 661
    .end local v12    # "key":Ljava/nio/channels/SelectionKey;
    :cond_46
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_47
    move/from16 v0, p2

    if-ge v9, v0, :cond_90

    .line 662
    aget-object v11, p1, v9

    .line 663
    .local v11, "item":Lzmq/PollItem;
    if-nez v11, :cond_52

    .line 661
    :goto_4f
    add-int/lit8 v9, v9, 0x1

    goto :goto_47

    .line 667
    :cond_52
    invoke-virtual {v11}, Lzmq/PollItem;->getChannel()Ljava/nio/channels/SelectableChannel;

    move-result-object v3

    .line 668
    .local v3, "ch":Ljava/nio/channels/SelectableChannel;
    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/nio/channels/SelectionKey;

    .line 670
    .restart local v12    # "key":Ljava/nio/channels/SelectionKey;
    if-eqz v12, :cond_7b

    .line 671
    invoke-virtual {v12}, Ljava/nio/channels/SelectionKey;->interestOps()I

    move-result v21

    invoke-virtual {v11}, Lzmq/PollItem;->interestOps()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_77

    .line 672
    invoke-virtual {v11}, Lzmq/PollItem;->interestOps()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/nio/channels/SelectionKey;->interestOps(I)Ljava/nio/channels/SelectionKey;

    .line 674
    :cond_77
    invoke-virtual {v12, v11}, Ljava/nio/channels/SelectionKey;->attach(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4f

    .line 678
    :cond_7b
    :try_start_7b
    invoke-virtual {v11}, Lzmq/PollItem;->interestOps()I

    move-result v21

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v3, v0, v1, v11}, Ljava/nio/channels/SelectableChannel;->register(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    :try_end_86
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_7b .. :try_end_86} :catch_87

    goto :goto_4f

    .line 680
    :catch_87
    move-exception v5

    .line 681
    .local v5, "e":Ljava/nio/channels/ClosedChannelException;
    new-instance v21, Lzmq/ZError$IOException;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v21

    .line 686
    .end local v3    # "ch":Ljava/nio/channels/SelectableChannel;
    .end local v5    # "e":Ljava/nio/channels/ClosedChannelException;
    .end local v11    # "item":Lzmq/PollItem;
    .end local v12    # "key":Ljava/nio/channels/SelectionKey;
    :cond_90
    invoke-virtual/range {v18 .. v18}, Ljava/util/HashMap;->isEmpty()Z

    move-result v21

    if-nez v21, :cond_ae

    .line 687
    invoke-virtual/range {v18 .. v18}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_9e
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_ae

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/channels/SelectionKey;

    .line 688
    .local v4, "deprecated":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v4}, Ljava/nio/channels/SelectionKey;->cancel()V

    goto :goto_9e

    .line 692
    .end local v4    # "deprecated":Ljava/nio/channels/SelectionKey;
    :cond_ae
    const/4 v8, 0x1

    .line 693
    .local v8, "firstPass":Z
    const/4 v13, 0x0

    .line 699
    .local v13, "nevents":I
    :cond_b0
    :goto_b0
    if-eqz v8, :cond_eb

    .line 700
    const-wide/16 v19, 0x0

    .line 711
    .local v19, "waitMillis":J
    :goto_b4
    const/16 v16, 0x0

    .line 712
    .local v16, "rc":I
    const-wide/16 v21, 0x0

    cmp-long v21, v19, v21

    if-gez v21, :cond_f7

    .line 713
    const-wide/16 v21, 0x0

    :try_start_be
    move-object/from16 v0, p0

    move-wide/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/Selector;->select(J)I

    move-result v16

    .line 722
    :goto_c6
    invoke-virtual/range {p0 .. p0}, Ljava/nio/channels/Selector;->keys()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_ce
    :goto_ce
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_110

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/nio/channels/SelectionKey;

    .line 723
    .restart local v12    # "key":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v12}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lzmq/PollItem;

    .line 724
    .restart local v11    # "item":Lzmq/PollItem;
    move/from16 v0, v16

    invoke-virtual {v11, v12, v0}, Lzmq/PollItem;->readyOps(Ljava/nio/channels/SelectionKey;I)I

    move-result v17

    .line 725
    .local v17, "ready":I
    if-gez v17, :cond_10b

    .line 726
    const/4 v13, -0x1

    goto/16 :goto_11

    .line 702
    .end local v11    # "item":Lzmq/PollItem;
    .end local v12    # "key":Ljava/nio/channels/SelectionKey;
    .end local v16    # "rc":I
    .end local v17    # "ready":I
    .end local v19    # "waitMillis":J
    :cond_eb
    const-wide/16 v21, 0x0

    cmp-long v21, p3, v21

    if-gez v21, :cond_f4

    .line 703
    const-wide/16 v19, -0x1

    .restart local v19    # "waitMillis":J
    goto :goto_b4

    .line 706
    .end local v19    # "waitMillis":J
    :cond_f4
    sub-long v19, v6, v14

    .restart local v19    # "waitMillis":J
    goto :goto_b4

    .line 715
    .restart local v16    # "rc":I
    :cond_f7
    const-wide/16 v21, 0x0

    cmp-long v21, v19, v21

    if-nez v21, :cond_102

    .line 716
    invoke-virtual/range {p0 .. p0}, Ljava/nio/channels/Selector;->selectNow()I

    move-result v16

    goto :goto_c6

    .line 719
    :cond_102
    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/Selector;->select(J)I

    move-result v16

    goto :goto_c6

    .line 729
    .restart local v11    # "item":Lzmq/PollItem;
    .restart local v12    # "key":Ljava/nio/channels/SelectionKey;
    .restart local v17    # "ready":I
    :cond_10b
    if-lez v17, :cond_ce

    .line 730
    add-int/lit8 v13, v13, 0x1

    goto :goto_ce

    .line 733
    .end local v11    # "item":Lzmq/PollItem;
    .end local v12    # "key":Ljava/nio/channels/SelectionKey;
    .end local v17    # "ready":I
    :cond_110
    invoke-virtual/range {p0 .. p0}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Set;->clear()V
    :try_end_117
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_117} :catch_129

    .line 740
    const-wide/16 v21, 0x0

    cmp-long v21, p3, v21

    if-eqz v21, :cond_11

    .line 744
    if-gtz v13, :cond_11

    .line 750
    const-wide/16 v21, 0x0

    cmp-long v21, p3, v21

    if-gez v21, :cond_132

    .line 751
    if-eqz v8, :cond_b0

    .line 752
    const/4 v8, 0x0

    goto :goto_b0

    .line 736
    :catch_129
    move-exception v5

    .line 737
    .local v5, "e":Ljava/io/IOException;
    new-instance v21, Lzmq/ZError$IOException;

    move-object/from16 v0, v21

    invoke-direct {v0, v5}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v21

    .line 761
    .end local v5    # "e":Ljava/io/IOException;
    :cond_132
    if-eqz v8, :cond_141

    .line 762
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v14

    .line 763
    add-long v6, v14, p3

    .line 764
    cmp-long v21, v14, v6

    if-eqz v21, :cond_11

    .line 767
    const/4 v8, 0x0

    .line 768
    goto/16 :goto_b0

    .line 772
    :cond_141
    invoke-static {}, Lzmq/Clock;->nowMS()J

    move-result-wide v14

    .line 773
    cmp-long v21, v14, v6

    if-ltz v21, :cond_b0

    goto/16 :goto_11

    .line 647
    .end local v6    # "end":J
    .end local v8    # "firstPass":Z
    .end local v9    # "i":I
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v13    # "nevents":I
    .end local v14    # "now":J
    .end local v16    # "rc":I
    .end local v18    # "saved":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/nio/channels/SelectableChannel;Ljava/nio/channels/SelectionKey;>;"
    .end local v19    # "waitMillis":J
    :catch_14b
    move-exception v21

    goto/16 :goto_15
.end method

.method public static poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;J)I
    .registers 5
    .param p0, "selector"    # Ljava/nio/channels/Selector;
    .param p1, "items"    # [Lzmq/PollItem;
    .param p2, "timeout"    # J

    .prologue
    .line 623
    array-length v0, p1

    invoke-static {p0, p1, v0, p2, p3}, Lzmq/ZMQ;->poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;IJ)I

    move-result v0

    return v0
.end method

.method public static poll([Lzmq/PollItem;IJ)I
    .registers 8
    .param p0, "items"    # [Lzmq/PollItem;
    .param p1, "count"    # I
    .param p2, "timeout"    # J

    .prologue
    .line 597
    const/4 v2, 0x0

    .line 599
    .local v2, "selector":Ljava/nio/channels/Selector;
    :try_start_1
    invoke-static {}, Lzmq/ZMQ$PollSelector;->open()Ljava/nio/channels/Selector;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4} :catch_a

    move-result-object v2

    .line 605
    invoke-static {v2, p0, p1, p2, p3}, Lzmq/ZMQ;->poll(Ljava/nio/channels/Selector;[Lzmq/PollItem;IJ)I

    move-result v1

    .line 609
    .local v1, "ret":I
    return v1

    .line 601
    .end local v1    # "ret":I
    :catch_a
    move-exception v0

    .line 602
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lzmq/ZError$IOException;

    invoke-direct {v3, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v3
.end method

.method public static poll([Lzmq/PollItem;J)I
    .registers 4
    .param p0, "items"    # [Lzmq/PollItem;
    .param p1, "timeout"    # J

    .prologue
    .line 583
    array-length v0, p0

    invoke-static {p0, v0, p1, p2}, Lzmq/ZMQ;->poll([Lzmq/PollItem;IJ)I

    move-result v0

    return v0
.end method

.method public static proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z
    .registers 4
    .param p0, "frontend"    # Lzmq/SocketBase;
    .param p1, "backend"    # Lzmq/SocketBase;
    .param p2, "control"    # Lzmq/SocketBase;

    .prologue
    .line 556
    if-eqz p0, :cond_4

    if-nez p1, :cond_a

    .line 557
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 559
    :cond_a
    invoke-static {p0, p1, p2}, Lzmq/Proxy;->proxy(Lzmq/SocketBase;Lzmq/SocketBase;Lzmq/SocketBase;)Z

    move-result v0

    return v0
.end method

.method public static recv(Lzmq/SocketBase;I)Lzmq/Msg;
    .registers 4
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "flags"    # I

    .prologue
    .line 452
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v1

    if-nez v1, :cond_e

    .line 453
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 455
    :cond_e
    invoke-static {p0, p1}, Lzmq/ZMQ;->recvMsg(Lzmq/SocketBase;I)Lzmq/Msg;

    move-result-object v0

    .line 456
    .local v0, "msg":Lzmq/Msg;
    if-nez v0, :cond_15

    .line 457
    const/4 v0, 0x0

    .line 464
    .end local v0    # "msg":Lzmq/Msg;
    :cond_15
    return-object v0
.end method

.method public static recvMsg(Lzmq/SocketBase;I)Lzmq/Msg;
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "flags"    # I

    .prologue
    .line 516
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->recv(I)Lzmq/Msg;

    move-result-object v0

    return-object v0
.end method

.method public static send(Lzmq/SocketBase;Ljava/lang/String;I)I
    .registers 5
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "flags"    # I

    .prologue
    .line 379
    sget-object v1, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 380
    .local v0, "data":[B
    array-length v1, v0

    invoke-static {p0, v0, v1, p2}, Lzmq/ZMQ;->send(Lzmq/SocketBase;[BII)I

    move-result v1

    return v1
.end method

.method public static send(Lzmq/SocketBase;Lzmq/Msg;I)I
    .registers 4
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "msg"    # Lzmq/Msg;
    .param p2, "flags"    # I

    .prologue
    .line 385
    invoke-static {p0, p1, p2}, Lzmq/ZMQ;->sendMsg(Lzmq/SocketBase;Lzmq/Msg;I)I

    move-result v0

    .line 386
    .local v0, "rc":I
    if-gez v0, :cond_7

    .line 387
    const/4 v0, -0x1

    .line 390
    .end local v0    # "rc":I
    :cond_7
    return v0
.end method

.method public static send(Lzmq/SocketBase;[BII)I
    .registers 7
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "buf"    # [B
    .param p2, "len"    # I
    .param p3, "flags"    # I

    .prologue
    .line 395
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v2

    if-nez v2, :cond_e

    .line 396
    :cond_8
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 399
    :cond_e
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0, p2}, Lzmq/Msg;-><init>(I)V

    .line 400
    .local v0, "msg":Lzmq/Msg;
    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, p2}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    .line 402
    invoke-static {p0, v0, p3}, Lzmq/ZMQ;->sendMsg(Lzmq/SocketBase;Lzmq/Msg;I)I

    move-result v1

    .line 403
    .local v1, "rc":I
    if-gez v1, :cond_1e

    .line 404
    const/4 v1, -0x1

    .line 407
    .end local v1    # "rc":I
    :cond_1e
    return v1
.end method

.method public static sendMsg(Lzmq/SocketBase;Lzmq/Msg;I)I
    .registers 5
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "msg"    # Lzmq/Msg;
    .param p2, "flags"    # I

    .prologue
    .line 441
    invoke-static {p1}, Lzmq/ZMQ;->msgSize(Lzmq/Msg;)I

    move-result v1

    .line 442
    .local v1, "sz":I
    invoke-virtual {p0, p1, p2}, Lzmq/SocketBase;->send(Lzmq/Msg;I)Z

    move-result v0

    .line 443
    .local v0, "rc":Z
    if-nez v0, :cond_b

    .line 444
    const/4 v1, -0x1

    .line 446
    .end local v1    # "sz":I
    :cond_b
    return v1
.end method

.method public static setContextOption(Lzmq/Ctx;II)V
    .registers 4
    .param p0, "ctx"    # Lzmq/Ctx;
    .param p1, "option"    # I
    .param p2, "optval"    # I

    .prologue
    .line 262
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/Ctx;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 263
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 265
    :cond_e
    invoke-virtual {p0, p1, p2}, Lzmq/Ctx;->set(II)Z

    .line 266
    return-void
.end method

.method public static setSocketOption(Lzmq/SocketBase;ILjava/lang/Object;)V
    .registers 4
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    .line 312
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 313
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 316
    :cond_e
    invoke-virtual {p0, p1, p2}, Lzmq/SocketBase;->setSocketOpt(ILjava/lang/Object;)V

    .line 318
    return-void
.end method

.method public static sleep(I)V
    .registers 5
    .param p0, "s"    # I

    .prologue
    .line 547
    int-to-long v0, p0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    :try_start_4
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_7} :catch_8

    .line 551
    :goto_7
    return-void

    .line 549
    :catch_8
    move-exception v0

    goto :goto_7
.end method

.method public static socket(Lzmq/Ctx;I)Lzmq/SocketBase;
    .registers 4
    .param p0, "ctx"    # Lzmq/Ctx;
    .param p1, "type"    # I

    .prologue
    .line 295
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/Ctx;->checkTag()Z

    move-result v1

    if-nez v1, :cond_e

    .line 296
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 298
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/Ctx;->createSocket(I)Lzmq/SocketBase;

    move-result-object v0

    .line 299
    .local v0, "s":Lzmq/SocketBase;
    return-object v0
.end method

.method public static startStopwatch()J
    .registers 2

    .prologue
    .line 782
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static stopStopwatch(J)J
    .registers 6
    .param p0, "watch"    # J

    .prologue
    .line 787
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, p0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public static strerror(I)Ljava/lang/String;
    .registers 3
    .param p0, "errno"    # I

    .prologue
    .line 797
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Errno = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static term(Lzmq/Ctx;)V
    .registers 1
    .param p0, "ctx"    # Lzmq/Ctx;

    .prologue
    .line 289
    invoke-static {p0}, Lzmq/ZMQ;->destroyContext(Lzmq/Ctx;)V

    .line 290
    return-void
.end method

.method public static unbind(Lzmq/SocketBase;Ljava/lang/String;)Z
    .registers 3
    .param p0, "s"    # Lzmq/SocketBase;
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 362
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lzmq/SocketBase;->checkTag()Z

    move-result v0

    if-nez v0, :cond_e

    .line 363
    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 365
    :cond_e
    invoke-virtual {p0, p1}, Lzmq/SocketBase;->termEndpoint(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public recviov(Lzmq/SocketBase;[[BII)I
    .registers 10
    .param p1, "s"    # Lzmq/SocketBase;
    .param p2, "a"    # [[B
    .param p3, "count"    # I
    .param p4, "flags"    # I

    .prologue
    .line 489
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lzmq/SocketBase;->checkTag()Z

    move-result v4

    if-nez v4, :cond_e

    .line 490
    :cond_8
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 493
    :cond_e
    const/4 v2, 0x0

    .line 494
    .local v2, "nread":I
    const/4 v3, 0x1

    .line 496
    .local v3, "recvmore":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-eqz v3, :cond_1c

    if-ge v0, p3, :cond_1c

    .line 499
    invoke-static {p1, p4}, Lzmq/ZMQ;->recvMsg(Lzmq/SocketBase;I)Lzmq/Msg;

    move-result-object v1

    .line 500
    .local v1, "msg":Lzmq/Msg;
    if-nez v1, :cond_1d

    .line 501
    const/4 v2, -0x1

    .line 511
    .end local v1    # "msg":Lzmq/Msg;
    :cond_1c
    return v2

    .line 506
    .restart local v1    # "msg":Lzmq/Msg;
    :cond_1d
    invoke-virtual {v1}, Lzmq/Msg;->data()[B

    move-result-object v4

    aput-object v4, p2, v0

    .line 509
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v3

    .line 496
    add-int/lit8 v0, v0, 0x1

    goto :goto_11
.end method

.method public sendiov(Lzmq/SocketBase;[[BII)I
    .registers 9
    .param p1, "s"    # Lzmq/SocketBase;
    .param p2, "a"    # [[B
    .param p3, "count"    # I
    .param p4, "flags"    # I

    .prologue
    .line 418
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lzmq/SocketBase;->checkTag()Z

    move-result v3

    if-nez v3, :cond_e

    .line 419
    :cond_8
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    .line 421
    :cond_e
    const/4 v2, 0x0

    .line 424
    .local v2, "rc":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    if-ge v0, p3, :cond_26

    .line 425
    new-instance v1, Lzmq/Msg;

    aget-object v3, p2, v0

    invoke-direct {v1, v3}, Lzmq/Msg;-><init>([B)V

    .line 426
    .local v1, "msg":Lzmq/Msg;
    add-int/lit8 v3, p3, -0x1

    if-ne v0, v3, :cond_1f

    .line 427
    and-int/lit8 p4, p4, -0x3

    .line 429
    :cond_1f
    invoke-static {p1, v1, p4}, Lzmq/ZMQ;->sendMsg(Lzmq/SocketBase;Lzmq/Msg;I)I

    move-result v2

    .line 430
    if-gez v2, :cond_27

    .line 431
    const/4 v2, -0x1

    .line 435
    .end local v1    # "msg":Lzmq/Msg;
    :cond_26
    return v2

    .line 424
    .restart local v1    # "msg":Lzmq/Msg;
    :cond_27
    add-int/lit8 v0, v0, 0x1

    goto :goto_10
.end method
