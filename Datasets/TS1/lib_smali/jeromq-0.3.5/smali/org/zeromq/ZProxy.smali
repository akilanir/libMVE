.class public Lorg/zeromq/ZProxy;
.super Ljava/lang/Object;
.source "ZProxy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZProxy$1;,
        Lorg/zeromq/ZProxy$ZmqPump;,
        Lorg/zeromq/ZProxy$ZPump;,
        Lorg/zeromq/ZProxy$ProxyActor;,
        Lorg/zeromq/ZProxy$Pump;,
        Lorg/zeromq/ZProxy$State;,
        Lorg/zeromq/ZProxy$Command;,
        Lorg/zeromq/ZProxy$Proxy;,
        Lorg/zeromq/ZProxy$Plug;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final ALIVE:Ljava/lang/String;

.field private static final CONFIG:Ljava/lang/String;

.field private static final EXIT:Ljava/lang/String;

.field public static final EXITED:Ljava/lang/String;

.field private static final PAUSE:Ljava/lang/String;

.field public static final PAUSED:Ljava/lang/String;

.field private static final RESTART:Ljava/lang/String;

.field private static final START:Ljava/lang/String;

.field public static final STARTED:Ljava/lang/String;

.field private static final STATUS:Ljava/lang/String;

.field private static final STOP:Ljava/lang/String;

.field public static final STOPPED:Ljava/lang/String;

.field private static final counter:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final agent:Lorg/zeromq/ZAgent;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 136
    const-class v0, Lorg/zeromq/ZProxy;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_73

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZProxy;->$assertionsDisabled:Z

    .line 566
    sget-object v0, Lorg/zeromq/ZProxy$Command;->START:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->START:Ljava/lang/String;

    .line 567
    sget-object v0, Lorg/zeromq/ZProxy$Command;->PAUSE:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->PAUSE:Ljava/lang/String;

    .line 568
    sget-object v0, Lorg/zeromq/ZProxy$Command;->STOP:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->STOP:Ljava/lang/String;

    .line 569
    sget-object v0, Lorg/zeromq/ZProxy$Command;->RESTART:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->RESTART:Ljava/lang/String;

    .line 570
    sget-object v0, Lorg/zeromq/ZProxy$Command;->EXIT:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->EXIT:Ljava/lang/String;

    .line 571
    sget-object v0, Lorg/zeromq/ZProxy$Command;->STATUS:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    .line 572
    sget-object v0, Lorg/zeromq/ZProxy$Command;->CONFIG:Lorg/zeromq/ZProxy$Command;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->CONFIG:Ljava/lang/String;

    .line 585
    sget-object v0, Lorg/zeromq/ZProxy$State;->STARTED:Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$State;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->STARTED:Ljava/lang/String;

    .line 586
    sget-object v0, Lorg/zeromq/ZProxy$State;->PAUSED:Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$State;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->PAUSED:Ljava/lang/String;

    .line 587
    sget-object v0, Lorg/zeromq/ZProxy$State;->STOPPED:Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$State;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->STOPPED:Ljava/lang/String;

    .line 588
    sget-object v0, Lorg/zeromq/ZProxy$State;->EXITED:Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$State;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    .line 590
    sget-object v0, Lorg/zeromq/ZProxy$State;->ALIVE:Lorg/zeromq/ZProxy$State;

    invoke-virtual {v0}, Lorg/zeromq/ZProxy$State;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/zeromq/ZProxy;->ALIVE:Ljava/lang/String;

    .line 592
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/zeromq/ZProxy;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void

    .line 136
    :cond_73
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public varargs constructor <init>(Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 14
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p3, "creator"    # Lorg/zeromq/ZProxy$Proxy;
    .param p4, "motdelafin"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 619
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, v1

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 620
    return-void
.end method

.method public varargs constructor <init>(Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 13
    .param p1, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p2, "creator"    # Lorg/zeromq/ZProxy$Proxy;
    .param p3, "motdelafin"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 606
    move-object v0, p0

    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, v1

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 607
    return-void
.end method

.method public varargs constructor <init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 21
    .param p1, "ctx"    # Lorg/zeromq/ZContext;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p4, "sockets"    # Lorg/zeromq/ZProxy$Proxy;
    .param p5, "pump"    # Lorg/zeromq/ZProxy$Pump;
    .param p6, "motdelafin"    # Ljava/lang/String;
    .param p7, "args"    # [Ljava/lang/Object;

    .prologue
    .line 636
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 639
    if-nez p5, :cond_d

    .line 640
    new-instance p5, Lorg/zeromq/ZProxy$ZmqPump;

    .end local p5    # "pump":Lorg/zeromq/ZProxy$Pump;
    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-direct {v0, v2}, Lorg/zeromq/ZProxy$ZmqPump;-><init>(Lorg/zeromq/ZProxy$1;)V

    .line 642
    .restart local p5    # "pump":Lorg/zeromq/ZProxy$Pump;
    :cond_d
    const/4 v9, 0x1

    .line 643
    .local v9, "count":I
    move-object/from16 v0, p7

    array-length v2, v0

    add-int/2addr v9, v2

    .line 645
    const/4 v6, 0x0

    .line 646
    .local v6, "vars":[Ljava/lang/Object;
    new-array v6, v9, [Ljava/lang/Object;

    .line 648
    const/4 v2, 0x0

    aput-object p4, v6, v2

    .line 649
    const/4 v12, 0x0

    .line 652
    .local v12, "shadow":Lorg/zeromq/ZActor$Actor;
    const/4 v11, 0x0

    .local v11, "index":I
    :goto_1a
    move-object/from16 v0, p7

    array-length v2, v0

    if-ge v11, v2, :cond_2f

    .line 653
    aget-object v8, p7, v11

    .line 654
    .local v8, "arg":Ljava/lang/Object;
    instance-of v2, v8, Lorg/zeromq/ZActor$Actor;

    if-eqz v2, :cond_28

    move-object v12, v8

    .line 655
    check-cast v12, Lorg/zeromq/ZActor$Actor;

    .line 657
    :cond_28
    add-int/lit8 v2, v11, 0x1

    aput-object v8, v6, v2

    .line 652
    add-int/lit8 v11, v11, 0x1

    goto :goto_1a

    .line 661
    .end local v8    # "arg":Ljava/lang/Object;
    :cond_2f
    sget-object v2, Lorg/zeromq/ZProxy;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v10

    .line 662
    .local v10, "id":I
    new-instance v4, Lorg/zeromq/ZProxy$ProxyActor;

    move-object/from16 v0, p5

    invoke-direct {v4, p2, v0, v10}, Lorg/zeromq/ZProxy$ProxyActor;-><init>(Ljava/lang/String;Lorg/zeromq/ZProxy$Pump;I)V

    .line 663
    .local v4, "actor":Lorg/zeromq/ZActor$Actor;
    if-eqz v12, :cond_44

    .line 664
    new-instance v7, Lorg/zeromq/ZActor$Duo;

    invoke-direct {v7, v4, v12}, Lorg/zeromq/ZActor$Duo;-><init>(Lorg/zeromq/ZActor$Actor;Lorg/zeromq/ZActor$Actor;)V

    .end local v4    # "actor":Lorg/zeromq/ZActor$Actor;
    .local v7, "actor":Lorg/zeromq/ZActor$Actor;
    move-object v4, v7

    .line 667
    .end local v7    # "actor":Lorg/zeromq/ZActor$Actor;
    .restart local v4    # "actor":Lorg/zeromq/ZActor$Actor;
    :cond_44
    new-instance v1, Lorg/zeromq/ZActor;

    move-object v2, p1

    move-object/from16 v3, p3

    move-object/from16 v5, p6

    invoke-direct/range {v1 .. v6}, Lorg/zeromq/ZActor;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZActor$Actor;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 668
    .local v1, "zactor":Lorg/zeromq/ZActor;
    invoke-virtual {v1}, Lorg/zeromq/ZActor;->agent()Lorg/zeromq/ZAgent;

    move-result-object v2

    iput-object v2, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    .line 669
    return-void
.end method

.method static synthetic access$1000()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->EXIT:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->START:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->STOP:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->PAUSE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->RESTART:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900()Ljava/lang/String;
    .registers 1

    .prologue
    .line 136
    sget-object v0, Lorg/zeromq/ZProxy;->CONFIG:Ljava/lang/String;

    return-object v0
.end method

.method private await()Ljava/lang/String;
    .registers 3

    .prologue
    .line 474
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "status":Ljava/lang/String;
    :goto_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1

    if-nez v1, :cond_17

    .line 476
    sget-object v1, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 484
    .end local v0    # "status":Ljava/lang/String;
    :cond_17
    :goto_17
    return-object v0

    .line 479
    .restart local v0    # "status":Ljava/lang/String;
    :cond_18
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v1}, Lorg/zeromq/ZAgent;->sign()Z

    move-result v1

    if-nez v1, :cond_23

    .line 480
    sget-object v0, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    goto :goto_17

    .line 482
    :cond_23
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public static varargs newProxy(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)Lorg/zeromq/ZProxy;
    .registers 14
    .param p0, "ctx"    # Lorg/zeromq/ZContext;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p3, "sockets"    # Lorg/zeromq/ZProxy$Proxy;
    .param p4, "motdelafin"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 284
    new-instance v0, Lorg/zeromq/ZProxy;

    new-instance v5, Lorg/zeromq/ZProxy$ZmqPump;

    const/4 v1, 0x0

    invoke-direct {v5, v1}, Lorg/zeromq/ZProxy$ZmqPump;-><init>(Lorg/zeromq/ZProxy$1;)V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public static varargs newProxy(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)Lorg/zeromq/ZProxy;
    .registers 13
    .param p0, "ctx"    # Lorg/zeromq/ZContext;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sockets"    # Lorg/zeromq/ZProxy$Proxy;
    .param p3, "motdelafin"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 289
    new-instance v0, Lorg/zeromq/ZProxy;

    new-instance v5, Lorg/zeromq/ZProxy$ZmqPump;

    invoke-direct {v5, v3}, Lorg/zeromq/ZProxy$ZmqPump;-><init>(Lorg/zeromq/ZProxy$1;)V

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public static varargs newZProxy(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)Lorg/zeromq/ZProxy;
    .registers 14
    .param p0, "ctx"    # Lorg/zeromq/ZContext;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p3, "sockets"    # Lorg/zeromq/ZProxy$Proxy;
    .param p4, "motdelafin"    # Ljava/lang/String;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 260
    new-instance v0, Lorg/zeromq/ZProxy;

    new-instance v5, Lorg/zeromq/ZProxy$ZPump;

    invoke-direct {v5}, Lorg/zeromq/ZProxy$ZPump;-><init>()V

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public static varargs newZProxy(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZProxy$Proxy;Ljava/lang/String;[Ljava/lang/Object;)Lorg/zeromq/ZProxy;
    .registers 13
    .param p0, "ctx"    # Lorg/zeromq/ZContext;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sockets"    # Lorg/zeromq/ZProxy$Proxy;
    .param p3, "motdelafin"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 265
    new-instance v0, Lorg/zeromq/ZProxy;

    const/4 v3, 0x0

    new-instance v5, Lorg/zeromq/ZProxy$ZPump;

    invoke-direct {v5}, Lorg/zeromq/ZProxy$ZPump;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lorg/zeromq/ZProxy;-><init>(Lorg/zeromq/ZContext;Ljava/lang/String;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZProxy$Proxy;Lorg/zeromq/ZProxy$Pump;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method

.method private recvStatus()Ljava/lang/String;
    .registers 4

    .prologue
    .line 521
    iget-object v2, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v2}, Lorg/zeromq/ZAgent;->sign()Z

    move-result v2

    if-nez v2, :cond_b

    .line 522
    sget-object v1, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    .line 533
    :goto_a
    return-object v1

    .line 525
    :cond_b
    iget-object v2, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v2}, Lorg/zeromq/ZAgent;->recv()Lorg/zeromq/ZMsg;

    move-result-object v0

    .line 527
    .local v0, "msg":Lorg/zeromq/ZMsg;
    if-nez v0, :cond_16

    .line 528
    sget-object v1, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    goto :goto_a

    .line 531
    :cond_16
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->popString()Ljava/lang/String;

    move-result-object v1

    .line 532
    .local v1, "status":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/zeromq/ZMsg;->destroy()V

    goto :goto_a
.end method


# virtual methods
.method public command(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "sync"    # Z

    .prologue
    .line 340
    sget-boolean v1, Lorg/zeromq/ZProxy;->$assertionsDisabled:Z

    if-nez v1, :cond_12

    sget-object v1, Lorg/zeromq/ZProxy;->CONFIG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 341
    :cond_12
    sget-boolean v1, Lorg/zeromq/ZProxy;->$assertionsDisabled:Z

    if-nez v1, :cond_24

    sget-object v1, Lorg/zeromq/ZProxy;->RESTART:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 342
    :cond_24
    sget-object v1, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 343
    invoke-virtual {p0, p2}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    .line 357
    :cond_30
    :goto_30
    return-object v0

    .line 345
    :cond_31
    sget-object v1, Lorg/zeromq/ZProxy;->EXIT:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    .line 346
    invoke-virtual {p0, p2}, Lorg/zeromq/ZProxy;->exit(Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_30

    .line 349
    :cond_3e
    invoke-direct {p0}, Lorg/zeromq/ZProxy;->recvStatus()Ljava/lang/String;

    move-result-object v0

    .line 351
    .local v0, "status":Ljava/lang/String;
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v1, p1}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 353
    if-eqz p2, :cond_30

    .line 354
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    goto :goto_30
.end method

.method public command(Lorg/zeromq/ZProxy$Command;Lorg/zeromq/ZMsg;Z)Lorg/zeromq/ZMsg;
    .registers 6
    .param p1, "command"    # Lorg/zeromq/ZProxy$Command;
    .param p2, "msg"    # Lorg/zeromq/ZMsg;
    .param p3, "sync"    # Z

    .prologue
    .line 386
    sget-object v1, Lorg/zeromq/ZProxy$Command;->CONFIG:Lorg/zeromq/ZProxy$Command;

    if-ne p1, v1, :cond_9

    .line 387
    invoke-virtual {p0, p2}, Lorg/zeromq/ZProxy;->configure(Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;

    move-result-object v1

    .line 395
    :goto_8
    return-object v1

    .line 389
    :cond_9
    sget-object v1, Lorg/zeromq/ZProxy$Command;->RESTART:Lorg/zeromq/ZProxy$Command;

    if-ne p1, v1, :cond_1b

    .line 390
    invoke-virtual {p0, p2}, Lorg/zeromq/ZProxy;->restart(Lorg/zeromq/ZMsg;)Ljava/lang/String;

    move-result-object v0

    .line 391
    .local v0, "status":Ljava/lang/String;
    new-instance p2, Lorg/zeromq/ZMsg;

    .end local p2    # "msg":Lorg/zeromq/ZMsg;
    invoke-direct {p2}, Lorg/zeromq/ZMsg;-><init>()V

    .line 392
    .restart local p2    # "msg":Lorg/zeromq/ZMsg;
    invoke-virtual {p2, v0}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    move-object v1, p2

    .line 393
    goto :goto_8

    .line 395
    .end local v0    # "status":Ljava/lang/String;
    :cond_1b
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public command(Lorg/zeromq/ZProxy$Command;Z)Lorg/zeromq/ZProxy$State;
    .registers 4
    .param p1, "command"    # Lorg/zeromq/ZProxy$Command;
    .param p2, "sync"    # Z

    .prologue
    .line 371
    invoke-virtual {p1}, Lorg/zeromq/ZProxy$Command;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lorg/zeromq/ZProxy;->command(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/zeromq/ZProxy$State;->valueOf(Ljava/lang/String;)Lorg/zeromq/ZProxy$State;

    move-result-object v0

    return-object v0
.end method

.method public configure(Lorg/zeromq/ZMsg;)Lorg/zeromq/ZMsg;
    .registers 5
    .param p1, "msg"    # Lorg/zeromq/ZMsg;

    .prologue
    .line 407
    sget-object v1, Lorg/zeromq/ZProxy;->CONFIG:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lorg/zeromq/ZMsg;->addFirst(Ljava/lang/String;)V

    .line 409
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v1, p1}, Lorg/zeromq/ZAgent;->send(Lorg/zeromq/ZMsg;)Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 411
    invoke-direct {p0}, Lorg/zeromq/ZProxy;->recvStatus()Ljava/lang/String;

    .line 413
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v1}, Lorg/zeromq/ZAgent;->recv()Lorg/zeromq/ZMsg;

    move-result-object v0

    .line 414
    .local v0, "reply":Lorg/zeromq/ZMsg;
    sget-boolean v1, Lorg/zeromq/ZProxy;->$assertionsDisabled:Z

    if-nez v1, :cond_22

    if-nez v0, :cond_22

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 417
    :cond_22
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    sget-object v2, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    .line 420
    .end local v0    # "reply":Lorg/zeromq/ZMsg;
    :goto_29
    return-object v0

    :cond_2a
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public exit(Z)Ljava/lang/String;
    .registers 5
    .param p1, "sync"    # Z

    .prologue
    .line 461
    sget-object v0, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    .line 462
    .local v0, "status":Ljava/lang/String;
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    sget-object v2, Lorg/zeromq/ZProxy;->EXIT:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 463
    if-eqz p1, :cond_13

    .line 464
    invoke-direct {p0}, Lorg/zeromq/ZProxy;->await()Ljava/lang/String;

    move-result-object v1

    .line 468
    :goto_12
    return-object v1

    .line 466
    :cond_13
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    :cond_18
    move-object v1, v0

    .line 468
    goto :goto_12
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    .line 541
    invoke-virtual {p0}, Lorg/zeromq/ZProxy;->started()Z

    move-result v0

    return v0
.end method

.method public pause(Z)Ljava/lang/String;
    .registers 3
    .param p1, "sync"    # Z

    .prologue
    .line 315
    sget-object v0, Lorg/zeromq/ZProxy;->PAUSE:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lorg/zeromq/ZProxy;->command(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public restart(Lorg/zeromq/ZMsg;)Ljava/lang/String;
    .registers 8
    .param p1, "hot"    # Lorg/zeromq/ZMsg;

    .prologue
    const/4 v5, 0x0

    .line 431
    new-instance v2, Lorg/zeromq/ZMsg;

    invoke-direct {v2}, Lorg/zeromq/ZMsg;-><init>()V

    .line 432
    .local v2, "msg":Lorg/zeromq/ZMsg;
    sget-object v4, Lorg/zeromq/ZProxy;->RESTART:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    .line 434
    if-nez p1, :cond_23

    .line 435
    invoke-static {v5}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    .line 446
    :cond_14
    sget-object v3, Lorg/zeromq/ZProxy;->EXITED:Ljava/lang/String;

    .line 447
    .local v3, "status":Ljava/lang/String;
    iget-object v4, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v4, v2}, Lorg/zeromq/ZAgent;->send(Lorg/zeromq/ZMsg;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 448
    invoke-virtual {p0, v5}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v3

    .line 450
    :cond_22
    return-object v3

    .line 438
    .end local v3    # "status":Ljava/lang/String;
    :cond_23
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/zeromq/ZMsg;->add(Ljava/lang/String;)Z

    .line 440
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_2c
    invoke-virtual {p1}, Lorg/zeromq/ZMsg;->size()I

    move-result v4

    if-ge v1, v4, :cond_14

    .line 441
    invoke-virtual {p1}, Lorg/zeromq/ZMsg;->pop()Lorg/zeromq/ZFrame;

    move-result-object v0

    .line 442
    .local v0, "frame":Lorg/zeromq/ZFrame;
    invoke-virtual {v2, v0}, Lorg/zeromq/ZMsg;->add(Lorg/zeromq/ZFrame;)Z

    .line 440
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c
.end method

.method public start(Z)Ljava/lang/String;
    .registers 3
    .param p1, "sync"    # Z

    .prologue
    .line 300
    sget-object v0, Lorg/zeromq/ZProxy;->START:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lorg/zeromq/ZProxy;->command(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public started()Z
    .registers 3

    .prologue
    .line 549
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    .line 550
    .local v0, "status":Ljava/lang/String;
    sget-object v1, Lorg/zeromq/ZProxy;->STARTED:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public status()Ljava/lang/String;
    .registers 2

    .prologue
    .line 493
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/zeromq/ZProxy;->status(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public status(Z)Ljava/lang/String;
    .registers 5
    .param p1, "sync"    # Z

    .prologue
    .line 504
    invoke-direct {p0}, Lorg/zeromq/ZProxy;->recvStatus()Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, "status":Ljava/lang/String;
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    sget-object v2, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    if-eqz p1, :cond_26

    .line 508
    invoke-direct {p0}, Lorg/zeromq/ZProxy;->recvStatus()Ljava/lang/String;

    move-result-object v0

    .line 510
    iget-object v1, p0, Lorg/zeromq/ZProxy;->agent:Lorg/zeromq/ZAgent;

    sget-object v2, Lorg/zeromq/ZProxy;->STATUS:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_26

    .line 512
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unable to send the status message"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 515
    :cond_26
    return-object v0
.end method

.method public stop(Z)Ljava/lang/String;
    .registers 3
    .param p1, "sync"    # Z

    .prologue
    .line 326
    sget-object v0, Lorg/zeromq/ZProxy;->STOP:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lorg/zeromq/ZProxy;->command(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
