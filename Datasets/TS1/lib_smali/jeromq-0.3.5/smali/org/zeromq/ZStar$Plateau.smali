.class final Lorg/zeromq/ZStar$Plateau;
.super Ljava/lang/Object;
.source "ZStar.java"

# interfaces
.implements Lorg/zeromq/ZThread$IAttachedRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZStar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Plateau"
.end annotation


# static fields
.field private static final shows:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final number:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 330
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/zeromq/ZStar$Plateau;->shows:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 332
    sget-object v0, Lorg/zeromq/ZStar$Plateau;->shows:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p0, Lorg/zeromq/ZStar$Plateau;->number:I

    return-void
.end method

.method synthetic constructor <init>(Lorg/zeromq/ZStar$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/zeromq/ZStar$1;

    .prologue
    .line 328
    invoke-direct {p0}, Lorg/zeromq/ZStar$Plateau;-><init>()V

    return-void
.end method

.method private showMustGoOn(Lorg/zeromq/ZContext;Lorg/zeromq/ZStar$Set;Ljava/nio/channels/Selector;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZStar$Fortune;[Ljava/lang/Object;)V
    .registers 16
    .param p1, "chef"    # Lorg/zeromq/ZContext;
    .param p2, "set"    # Lorg/zeromq/ZStar$Set;
    .param p3, "story"    # Ljava/nio/channels/Selector;
    .param p4, "phone"    # Lorg/zeromq/ZMQ$Socket;
    .param p5, "fortune"    # Lorg/zeromq/ZStar$Fortune;
    .param p6, "bags"    # [Ljava/lang/Object;

    .prologue
    .line 423
    const/4 v4, 0x0

    .line 425
    .local v4, "shows":I
    const/4 v5, 0x0

    .line 429
    .local v5, "actor":Lorg/zeromq/ZStar$Star;
    :goto_2
    add-int/lit8 v8, v4, 0x1

    .end local v4    # "shows":I
    .local v8, "shows":I
    move-object v0, p5

    move-object v1, p1

    move-object v2, p4

    move-object v3, p3

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Lorg/zeromq/ZStar$Fortune;->create(Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;Ljava/nio/channels/Selector;ILorg/zeromq/ZStar$Star;[Ljava/lang/Object;)Lorg/zeromq/ZStar$Star;

    move-result-object v5

    .line 432
    invoke-interface {v5}, Lorg/zeromq/ZStar$Star;->prepare()V

    .line 435
    :cond_10
    invoke-interface {p2}, Lorg/zeromq/ZStar$Set;->fire()Z

    move-result v0

    if-nez v0, :cond_20

    .line 437
    invoke-interface {v5}, Lorg/zeromq/ZStar$Star;->breathe()I

    move-result v7

    .line 440
    .local v7, "events":I
    invoke-interface {v5, v7}, Lorg/zeromq/ZStar$Star;->act(I)Z

    move-result v0

    if-nez v0, :cond_27

    .line 452
    .end local v7    # "events":I
    :cond_20
    :goto_20
    invoke-interface {v5}, Lorg/zeromq/ZStar$Star;->renews()Z

    move-result v0

    if-nez v0, :cond_2e

    .line 454
    return-void

    .line 446
    .restart local v7    # "events":I
    :cond_27
    invoke-interface {v5}, Lorg/zeromq/ZStar$Star;->entract()Z

    move-result v0

    if-nez v0, :cond_10

    goto :goto_20

    .end local v7    # "events":I
    :cond_2e
    move v4, v8

    .end local v8    # "shows":I
    .restart local v4    # "shows":I
    goto :goto_2
.end method


# virtual methods
.method public run([Ljava/lang/Object;Lorg/zeromq/ZContext;Lorg/zeromq/ZMQ$Socket;)V
    .registers 21
    .param p1, "train"    # [Ljava/lang/Object;
    .param p2, "chef"    # Lorg/zeromq/ZContext;
    .param p3, "mic"    # Lorg/zeromq/ZMQ$Socket;

    .prologue
    .line 339
    const/4 v13, 0x6

    .line 342
    .local v13, "mandat":I
    const/4 v2, 0x1

    aget-object v7, p1, v2

    check-cast v7, Lorg/zeromq/ZStar$Fortune;

    .line 344
    .local v7, "star":Lorg/zeromq/ZStar$Fortune;
    const/4 v2, 0x4

    aget-object v10, p1, v2

    check-cast v10, Lorg/zeromq/ZStar$Entourage;

    .line 346
    .local v10, "entourage":Lorg/zeromq/ZStar$Entourage;
    const/4 v2, 0x3

    aget-object v15, p1, v2

    check-cast v15, Lorg/zeromq/ZContext;

    .line 347
    .local v15, "producer":Lorg/zeromq/ZContext;
    const/4 v2, 0x2

    aget-object v11, p1, v2

    check-cast v11, Lorg/zeromq/ZAgent$SelectorCreator;

    .line 349
    .local v11, "feather":Lorg/zeromq/ZAgent$SelectorCreator;
    const/4 v2, 0x0

    aget-object v4, p1, v2

    check-cast v4, Lorg/zeromq/ZStar$Set;

    .line 351
    .local v4, "set":Lorg/zeromq/ZStar$Set;
    const/4 v2, 0x5

    aget-object v12, p1, v2

    check-cast v12, Ljava/lang/String;

    .line 354
    .local v12, "gossip":Ljava/lang/String;
    move-object/from16 v0, p1

    array-length v2, v0

    add-int/lit8 v2, v2, -0x6

    new-array v8, v2, [Ljava/lang/Object;

    .line 355
    .local v8, "bags":[Ljava/lang/Object;
    const/4 v2, 0x6

    const/4 v3, 0x0

    array-length v6, v8

    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 358
    if-eqz v10, :cond_37

    .line 359
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-interface {v10, v0, v7, v1, v8}, Lorg/zeromq/ZStar$Entourage;->breakaleg(Lorg/zeromq/ZContext;Lorg/zeromq/ZStar$Fortune;Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)V

    .line 362
    :cond_37
    const/4 v5, 0x0

    .line 366
    .local v5, "story":Ljava/nio/channels/Selector;
    :try_start_38
    invoke-interface {v11}, Lorg/zeromq/ZAgent$SelectorCreator;->create()Ljava/nio/channels/Selector;

    move-result-object v5

    .line 369
    move-object/from16 v0, p3

    invoke-interface {v7, v0, v8}, Lorg/zeromq/ZStar$Fortune;->premiere(Lorg/zeromq/ZMQ$Socket;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    .line 371
    .local v14, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v2, v0, Lorg/zeromq/ZStar$Plateau;->number:I

    invoke-interface {v4, v14, v2}, Lorg/zeromq/ZStar$Set;->lights(Ljava/lang/String;I)V

    move-object/from16 v2, p0

    move-object/from16 v3, p2

    move-object/from16 v6, p3

    .line 374
    invoke-direct/range {v2 .. v8}, Lorg/zeromq/ZStar$Plateau;->showMustGoOn(Lorg/zeromq/ZContext;Lorg/zeromq/ZStar$Set;Ljava/nio/channels/Selector;Lorg/zeromq/ZMQ$Socket;Lorg/zeromq/ZStar$Fortune;[Ljava/lang/Object;)V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_52} :catch_7f
    .catchall {:try_start_38 .. :try_end_52} :catchall_b0

    .line 384
    move-object/from16 v0, p3

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->interview(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v16

    .line 386
    .local v16, "tell":Z
    if-eqz v16, :cond_61

    if-eqz v12, :cond_61

    .line 388
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/zeromq/ZMQ$Socket;->send(Ljava/lang/String;)Z

    .line 392
    :cond_61
    move-object/from16 v0, p2

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->party(Lorg/zeromq/ZContext;)V

    .line 393
    const/4 v7, 0x0

    .line 394
    if-eqz v10, :cond_6e

    .line 395
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/zeromq/ZStar$Entourage;->party(Lorg/zeromq/ZContext;)V

    .line 400
    :cond_6e
    invoke-virtual/range {p2 .. p2}, Lorg/zeromq/ZContext;->close()V

    .line 401
    if-eqz v15, :cond_76

    .line 403
    invoke-virtual {v15}, Lorg/zeromq/ZContext;->close()V

    .line 406
    :cond_76
    :try_start_76
    invoke-interface {v11, v5}, Lorg/zeromq/ZAgent$SelectorCreator;->destroy(Ljava/nio/channels/Selector;)V
    :try_end_79
    .catch Ljava/io/IOException; {:try_start_76 .. :try_end_79} :catch_7a

    .line 413
    .end local v14    # "name":Ljava/lang/String;
    :goto_79
    return-void

    .line 408
    .restart local v14    # "name":Ljava/lang/String;
    :catch_7a
    move-exception v9

    .line 410
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_79

    .line 377
    .end local v9    # "e":Ljava/io/IOException;
    .end local v14    # "name":Ljava/lang/String;
    .end local v16    # "tell":Z
    :catch_7f
    move-exception v9

    .line 379
    .restart local v9    # "e":Ljava/io/IOException;
    :try_start_80
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_b0

    .line 384
    move-object/from16 v0, p3

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->interview(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v16

    .line 386
    .restart local v16    # "tell":Z
    if-eqz v16, :cond_92

    if-eqz v12, :cond_92

    .line 388
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/zeromq/ZMQ$Socket;->send(Ljava/lang/String;)Z

    .line 392
    :cond_92
    move-object/from16 v0, p2

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->party(Lorg/zeromq/ZContext;)V

    .line 393
    const/4 v7, 0x0

    .line 394
    if-eqz v10, :cond_9f

    .line 395
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/zeromq/ZStar$Entourage;->party(Lorg/zeromq/ZContext;)V

    .line 400
    :cond_9f
    invoke-virtual/range {p2 .. p2}, Lorg/zeromq/ZContext;->close()V

    .line 401
    if-eqz v15, :cond_a7

    .line 403
    invoke-virtual {v15}, Lorg/zeromq/ZContext;->close()V

    .line 406
    :cond_a7
    :try_start_a7
    invoke-interface {v11, v5}, Lorg/zeromq/ZAgent$SelectorCreator;->destroy(Ljava/nio/channels/Selector;)V
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_a7 .. :try_end_aa} :catch_ab

    goto :goto_79

    .line 408
    :catch_ab
    move-exception v9

    .line 410
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_79

    .line 384
    .end local v9    # "e":Ljava/io/IOException;
    .end local v16    # "tell":Z
    :catchall_b0
    move-exception v2

    move-object/from16 v0, p3

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->interview(Lorg/zeromq/ZMQ$Socket;)Z

    move-result v16

    .line 386
    .restart local v16    # "tell":Z
    if-eqz v16, :cond_c0

    if-eqz v12, :cond_c0

    .line 388
    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Lorg/zeromq/ZMQ$Socket;->send(Ljava/lang/String;)Z

    .line 392
    :cond_c0
    move-object/from16 v0, p2

    invoke-interface {v7, v0}, Lorg/zeromq/ZStar$Fortune;->party(Lorg/zeromq/ZContext;)V

    .line 393
    const/4 v7, 0x0

    .line 394
    if-eqz v10, :cond_cd

    .line 395
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/zeromq/ZStar$Entourage;->party(Lorg/zeromq/ZContext;)V

    .line 400
    :cond_cd
    invoke-virtual/range {p2 .. p2}, Lorg/zeromq/ZContext;->close()V

    .line 401
    if-eqz v15, :cond_d5

    .line 403
    invoke-virtual {v15}, Lorg/zeromq/ZContext;->close()V

    .line 406
    :cond_d5
    :try_start_d5
    invoke-interface {v11, v5}, Lorg/zeromq/ZAgent$SelectorCreator;->destroy(Ljava/nio/channels/Selector;)V
    :try_end_d8
    .catch Ljava/io/IOException; {:try_start_d5 .. :try_end_d8} :catch_d9

    .line 412
    :goto_d8
    throw v2

    .line 408
    :catch_d9
    move-exception v9

    .line 410
    .restart local v9    # "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d8
.end method
