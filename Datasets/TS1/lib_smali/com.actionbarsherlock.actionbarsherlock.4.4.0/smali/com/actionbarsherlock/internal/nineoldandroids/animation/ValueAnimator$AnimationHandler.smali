.class Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator$AnimationHandler;
.super Landroid/os/Handler;
.source "ValueAnimator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnimationHandler"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 571
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator$1;

    .prologue
    .line 571
    invoke-direct {p0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator$AnimationHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 28
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 587
    const/4 v6, 0x1

    .line 588
    .local v6, "callAgain":Z
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sAnimations:Ljava/lang/ThreadLocal;
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$000()Ljava/lang/ThreadLocal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 589
    .local v5, "animations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sDelayedAnims:Ljava/lang/ThreadLocal;
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$100()Ljava/lang/ThreadLocal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/ArrayList;

    .line 590
    .local v10, "delayedAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v19, v0

    packed-switch v19, :pswitch_data_132

    .line 684
    :cond_1e
    :goto_1e
    return-void

    .line 594
    :pswitch_1f
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$200()Ljava/lang/ThreadLocal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    .line 595
    .local v16, "pendingAnimations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-gtz v19, :cond_35

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_36

    .line 596
    :cond_35
    const/4 v6, 0x0

    .line 603
    :cond_36
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_68

    .line 605
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    .line 606
    .local v17, "pendingCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->clear()V

    .line 607
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 608
    .local v7, "count":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4a
    if-ge v12, v7, :cond_36

    .line 609
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 611
    .local v4, "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->mStartDelay:J
    invoke-static {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$300(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;)J

    move-result-wide v19

    const-wide/16 v21, 0x0

    cmp-long v19, v19, v21

    if-nez v19, :cond_64

    .line 612
    # invokes: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->startAnimation()V
    invoke-static {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$400(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;)V

    .line 608
    :goto_61
    add-int/lit8 v12, v12, 0x1

    goto :goto_4a

    .line 614
    :cond_64
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_61

    .line 622
    .end local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    .end local v7    # "count":I
    .end local v12    # "i":I
    .end local v16    # "pendingAnimations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    .end local v17    # "pendingCopy":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    :cond_68
    :pswitch_68
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v8

    .line 623
    .local v8, "currentTime":J
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sReadyAnims:Ljava/lang/ThreadLocal;
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$500()Ljava/lang/ThreadLocal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/ArrayList;

    .line 624
    .local v18, "readyAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sEndingAnims:Ljava/lang/ThreadLocal;
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$600()Ljava/lang/ThreadLocal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 628
    .local v11, "endingAnims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;>;"
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 629
    .local v14, "numDelayedAnims":I
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_85
    if-ge v12, v14, :cond_9b

    .line 630
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 631
    .restart local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    # invokes: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->delayedAnimationFrame(J)Z
    invoke-static {v4, v8, v9}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$700(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;J)Z

    move-result v19

    if-eqz v19, :cond_98

    .line 632
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    :cond_98
    add-int/lit8 v12, v12, 0x1

    goto :goto_85

    .line 635
    .end local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    :cond_9b
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v15

    .line 636
    .local v15, "numReadyAnims":I
    if-lez v15, :cond_bf

    .line 637
    const/4 v12, 0x0

    :goto_a2
    if-ge v12, v15, :cond_bc

    .line 638
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 639
    .restart local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    # invokes: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->startAnimation()V
    invoke-static {v4}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$400(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;)V

    .line 640
    const/16 v19, 0x1

    move/from16 v0, v19

    # setter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->mRunning:Z
    invoke-static {v4, v0}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$802(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;Z)Z

    .line 641
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 637
    add-int/lit8 v12, v12, 0x1

    goto :goto_a2

    .line 643
    .end local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    :cond_bc
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->clear()V

    .line 648
    :cond_bf
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 649
    .local v13, "numAnims":I
    const/4 v12, 0x0

    .line 650
    :goto_c4
    if-ge v12, v13, :cond_e6

    .line 651
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    .line 652
    .restart local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {v4, v8, v9}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->animationFrame(J)Z

    move-result v19

    if-eqz v19, :cond_d5

    .line 653
    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 655
    :cond_d5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ne v0, v13, :cond_e0

    .line 656
    add-int/lit8 v12, v12, 0x1

    goto :goto_c4

    .line 665
    :cond_e0
    add-int/lit8 v13, v13, -0x1

    .line 666
    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_c4

    .line 669
    .end local v4    # "anim":Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;
    :cond_e6
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v19

    if-lez v19, :cond_104

    .line 670
    const/4 v12, 0x0

    :goto_ed
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v12, v0, :cond_101

    .line 671
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;

    # invokes: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->endAnimation()V
    invoke-static/range {v19 .. v19}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$900(Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;)V

    .line 670
    add-int/lit8 v12, v12, 0x1

    goto :goto_ed

    .line 673
    :cond_101
    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 678
    :cond_104
    if-eqz v6, :cond_1e

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_112

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_1e

    .line 679
    :cond_112
    const/16 v19, 0x1

    const-wide/16 v20, 0x0

    # getter for: Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->sFrameDelay:J
    invoke-static {}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator;->access$1000()J

    move-result-wide v22

    .line 680
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v24

    sub-long v24, v24, v8

    sub-long v22, v22, v24

    .line 679
    invoke-static/range {v20 .. v23}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v20

    move-object/from16 v0, p0

    move/from16 v1, v19

    move-wide/from16 v2, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/actionbarsherlock/internal/nineoldandroids/animation/ValueAnimator$AnimationHandler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_1e

    .line 590
    nop

    :pswitch_data_132
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_68
    .end packed-switch
.end method
