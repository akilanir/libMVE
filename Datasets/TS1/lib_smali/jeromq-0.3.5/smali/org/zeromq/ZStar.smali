.class public Lorg/zeromq/ZStar;
.super Ljava/lang/Object;
.source "ZStar.java"

# interfaces
.implements Lorg/zeromq/ZAgent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/zeromq/ZStar$1;,
        Lorg/zeromq/ZStar$Entourage;,
        Lorg/zeromq/ZStar$SimpleSet;,
        Lorg/zeromq/ZStar$Set;,
        Lorg/zeromq/ZStar$Plateau;,
        Lorg/zeromq/ZStar$Fortune;,
        Lorg/zeromq/ZStar$TimeTaker;,
        Lorg/zeromq/ZStar$Star;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final agent:Lorg/zeromq/ZAgent;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 84
    const-class v0, Lorg/zeromq/ZStar;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/zeromq/ZStar;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public varargs constructor <init>(Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 11
    .param p1, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p2, "fortune"    # Lorg/zeromq/ZStar$Fortune;
    .param p3, "motdelafin"    # Ljava/lang/String;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 235
    const/4 v1, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZStar;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 236
    return-void
.end method

.method public constructor <init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 20
    .param p1, "context"    # Lorg/zeromq/ZContext;
    .param p2, "selector"    # Lorg/zeromq/ZAgent$SelectorCreator;
    .param p3, "fortune"    # Lorg/zeromq/ZStar$Fortune;
    .param p4, "motdelafin"    # Ljava/lang/String;
    .param p5, "bags"    # [Ljava/lang/Object;

    .prologue
    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    sget-boolean v12, Lorg/zeromq/ZStar;->$assertionsDisabled:Z

    if-nez v12, :cond_f

    if-nez p3, :cond_f

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 259
    :cond_f
    move-object/from16 v5, p2

    .line 260
    .local v5, "feather":Lorg/zeromq/ZAgent$SelectorCreator;
    if-nez p2, :cond_18

    .line 262
    new-instance v5, Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;

    .end local v5    # "feather":Lorg/zeromq/ZAgent$SelectorCreator;
    invoke-direct {v5}, Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;-><init>()V

    .line 266
    .restart local v5    # "feather":Lorg/zeromq/ZAgent$SelectorCreator;
    :cond_18
    move-object v3, p1

    .line 267
    .local v3, "chef":Lorg/zeromq/ZContext;
    const/4 v9, 0x0

    .line 268
    .local v9, "producer":Lorg/zeromq/ZContext;
    if-nez v3, :cond_22

    .line 270
    new-instance v3, Lorg/zeromq/ZContext;

    .end local v3    # "chef":Lorg/zeromq/ZContext;
    invoke-direct {v3}, Lorg/zeromq/ZContext;-><init>()V

    .line 272
    .restart local v3    # "chef":Lorg/zeromq/ZContext;
    move-object v9, v3

    .line 276
    :cond_22
    const/4 v10, 0x0

    .line 277
    .local v10, "set":Lorg/zeromq/ZStar$Set;
    const/4 v4, 0x0

    .line 278
    .local v4, "entourage":Lorg/zeromq/ZStar$Entourage;
    move-object/from16 v1, p5

    .local v1, "arr$":[Ljava/lang/Object;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_28
    if-ge v6, v7, :cond_3d

    aget-object v2, v1, v6

    .line 279
    .local v2, "bag":Ljava/lang/Object;
    instance-of v12, v2, Lorg/zeromq/ZStar$Set;

    if-eqz v12, :cond_33

    move-object v10, v2

    .line 280
    check-cast v10, Lorg/zeromq/ZStar$Set;

    .line 282
    :cond_33
    instance-of v12, v2, Lorg/zeromq/ZStar$Entourage;

    if-eqz v12, :cond_3a

    move-object v4, v2

    .line 283
    check-cast v4, Lorg/zeromq/ZStar$Entourage;

    .line 278
    :cond_3a
    add-int/lit8 v6, v6, 0x1

    goto :goto_28

    .line 286
    .end local v2    # "bag":Ljava/lang/Object;
    :cond_3d
    if-nez v10, :cond_44

    .line 287
    new-instance v10, Lorg/zeromq/ZStar$SimpleSet;

    .end local v10    # "set":Lorg/zeromq/ZStar$Set;
    invoke-direct {v10}, Lorg/zeromq/ZStar$SimpleSet;-><init>()V

    .line 290
    .restart local v10    # "set":Lorg/zeromq/ZStar$Set;
    :cond_44
    new-instance v11, Ljava/util/ArrayList;

    move-object/from16 v0, p5

    array-length v12, v0

    add-int/lit8 v12, v12, 0x6

    invoke-direct {v11, v12}, Ljava/util/ArrayList;-><init>(I)V

    .line 292
    .local v11, "train":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-interface {v11, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    move-object/from16 v0, p3

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    invoke-interface {v11, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    invoke-interface {v11, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    move-object/from16 v0, p4

    invoke-interface {v11, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    invoke-static/range {p5 .. p5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 302
    new-instance v12, Lorg/zeromq/ZStar$Plateau;

    const/4 v13, 0x0

    invoke-direct {v12, v13}, Lorg/zeromq/ZStar$Plateau;-><init>(Lorg/zeromq/ZStar$1;)V

    invoke-interface {v11}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v13

    invoke-static {v3, v12, v13}, Lorg/zeromq/ZThread;->fork(Lorg/zeromq/ZContext;Lorg/zeromq/ZThread$IAttachedRunnable;[Ljava/lang/Object;)Lorg/zeromq/ZMQ$Socket;

    move-result-object v8

    .line 304
    .local v8, "phone":Lorg/zeromq/ZMQ$Socket;
    move-object/from16 v0, p4

    invoke-virtual {p0, v8, v0}, Lorg/zeromq/ZStar;->agent(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)Lorg/zeromq/ZAgent;

    move-result-object v12

    iput-object v12, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    .line 305
    return-void
.end method

.method public varargs constructor <init>(Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 10
    .param p1, "actor"    # Lorg/zeromq/ZStar$Fortune;
    .param p2, "lock"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 222
    const/4 v1, 0x0

    new-instance v2, Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;

    invoke-direct {v2}, Lorg/zeromq/ZAgent$VerySimpleSelectorCreator;-><init>()V

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/zeromq/ZStar;-><init>(Lorg/zeromq/ZContext;Lorg/zeromq/ZAgent$SelectorCreator;Lorg/zeromq/ZStar$Fortune;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 223
    return-void
.end method

.method public static party(JLjava/util/concurrent/TimeUnit;)V
    .registers 5
    .param p0, "time"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 158
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p0, p1, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    .line 159
    return-void
.end method


# virtual methods
.method public agent()Lorg/zeromq/ZAgent;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    return-object v0
.end method

.method protected agent(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)Lorg/zeromq/ZAgent;
    .registers 4
    .param p1, "phone"    # Lorg/zeromq/ZMQ$Socket;
    .param p2, "secret"    # Ljava/lang/String;

    .prologue
    .line 323
    invoke-static {p1, p2}, Lorg/zeromq/ZAgent$Creator;->create(Lorg/zeromq/ZMQ$Socket;Ljava/lang/String;)Lorg/zeromq/ZAgent;

    move-result-object v0

    return-object v0
.end method

.method public nova()V
    .registers 2

    .prologue
    .line 513
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0}, Lorg/zeromq/ZAgent;->nova()V

    .line 514
    return-void
.end method

.method public pipe()Lorg/zeromq/ZMQ$Socket;
    .registers 2

    .prologue
    .line 501
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0}, Lorg/zeromq/ZAgent;->pipe()Lorg/zeromq/ZMQ$Socket;

    move-result-object v0

    return-object v0
.end method

.method public recv()Lorg/zeromq/ZMsg;
    .registers 2

    .prologue
    .line 465
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0}, Lorg/zeromq/ZAgent;->recv()Lorg/zeromq/ZMsg;

    move-result-object v0

    return-object v0
.end method

.method public recv(Z)Lorg/zeromq/ZMsg;
    .registers 3
    .param p1, "wait"    # Z

    .prologue
    .line 471
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0, p1}, Lorg/zeromq/ZAgent;->recv(Z)Lorg/zeromq/ZMsg;

    move-result-object v0

    return-object v0
.end method

.method public send(Ljava/lang/String;)Z
    .registers 3
    .param p1, "word"    # Ljava/lang/String;

    .prologue
    .line 489
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0, p1}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public send(Ljava/lang/String;Z)Z
    .registers 4
    .param p1, "word"    # Ljava/lang/String;
    .param p2, "more"    # Z

    .prologue
    .line 495
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZAgent;->send(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public send(Lorg/zeromq/ZMsg;)Z
    .registers 3
    .param p1, "message"    # Lorg/zeromq/ZMsg;

    .prologue
    .line 477
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0, p1}, Lorg/zeromq/ZAgent;->send(Lorg/zeromq/ZMsg;)Z

    move-result v0

    return v0
.end method

.method public send(Lorg/zeromq/ZMsg;Z)Z
    .registers 4
    .param p1, "msg"    # Lorg/zeromq/ZMsg;
    .param p2, "destroy"    # Z

    .prologue
    .line 483
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0, p1, p2}, Lorg/zeromq/ZAgent;->send(Lorg/zeromq/ZMsg;Z)Z

    move-result v0

    return v0
.end method

.method public sign()Z
    .registers 2

    .prologue
    .line 507
    iget-object v0, p0, Lorg/zeromq/ZStar;->agent:Lorg/zeromq/ZAgent;

    invoke-interface {v0}, Lorg/zeromq/ZAgent;->sign()Z

    move-result v0

    return v0
.end method
