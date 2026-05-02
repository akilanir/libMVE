.class Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;
.super Lcom/nineoldandroids/view/ViewPropertyAnimator;
.source "ViewPropertyAnimatorHC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;,
        Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;,
        Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;
    }
.end annotation


# static fields
.field private static final ALPHA:I = 0x200

.field private static final NONE:I = 0x0

.field private static final ROTATION:I = 0x10

.field private static final ROTATION_X:I = 0x20

.field private static final ROTATION_Y:I = 0x40

.field private static final SCALE_X:I = 0x4

.field private static final SCALE_Y:I = 0x8

.field private static final TRANSFORM_MASK:I = 0x1ff

.field private static final TRANSLATION_X:I = 0x1

.field private static final TRANSLATION_Y:I = 0x2

.field private static final X:I = 0x80

.field private static final Y:I = 0x100


# instance fields
.field private mAnimationStarter:Ljava/lang/Runnable;

.field private mAnimatorEventListener:Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;

.field private mAnimatorMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/nineoldandroids/animation/Animator;",
            "Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;",
            ">;"
        }
    .end annotation
.end field

.field private mDuration:J

.field private mDurationSet:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mInterpolatorSet:Z

.field private mListener:Lcom/nineoldandroids/animation/Animator$AnimatorListener;

.field mPendingAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mStartDelay:J

.field private mStartDelaySet:Z

.field private final mView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 206
    invoke-direct {p0}, Lcom/nineoldandroids/view/ViewPropertyAnimator;-><init>()V

    .line 47
    iput-boolean v2, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDurationSet:Z

    .line 54
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelay:J

    .line 60
    iput-boolean v2, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelaySet:Z

    .line 73
    iput-boolean v2, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mInterpolatorSet:Z

    .line 78
    iput-object v3, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mListener:Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 85
    new-instance v0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;

    invoke-direct {v0, p0, v3}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;-><init>(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$1;)V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorEventListener:Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mPendingAnimations:Ljava/util/ArrayList;

    .line 124
    new-instance v0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$1;

    invoke-direct {v0, p0}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$1;-><init>(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;)V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimationStarter:Ljava/lang/Runnable;

    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    .line 207
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    .line 208
    return-void
.end method

.method static synthetic access$100(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;)V
    .registers 1
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->startAnimation()V

    return-void
.end method

.method static synthetic access$200(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;)Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mListener:Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    return-object v0
.end method

.method static synthetic access$202(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;
    .param p1, "x1"    # Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mListener:Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    return-object p1
.end method

.method static synthetic access$300(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$500(Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;IF)V
    .registers 3
    .param p0, "x0"    # Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;
    .param p1, "x1"    # I
    .param p2, "x2"    # F

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->setValue(IF)V

    return-void
.end method

.method private animateProperty(IF)V
    .registers 5
    .param p1, "constantName"    # I
    .param p2, "toValue"    # F

    .prologue
    .line 467
    invoke-direct {p0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->getValue(I)F

    move-result v1

    .line 468
    .local v1, "fromValue":F
    sub-float v0, p2, v1

    .line 469
    .local v0, "deltaValue":F
    invoke-direct {p0, p1, v1, v0}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IFF)V

    .line 470
    return-void
.end method

.method private animatePropertyBy(IF)V
    .registers 4
    .param p1, "constantName"    # I
    .param p2, "byValue"    # F

    .prologue
    .line 481
    invoke-direct {p0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->getValue(I)F

    move-result v0

    .line 482
    .local v0, "fromValue":F
    invoke-direct {p0, p1, v0, p2}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IFF)V

    .line 483
    return-void
.end method

.method private animatePropertyBy(IFF)V
    .registers 12
    .param p1, "constantName"    # I
    .param p2, "startValue"    # F
    .param p3, "byValue"    # F

    .prologue
    .line 495
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->size()I

    move-result v7

    if-lez v7, :cond_37

    .line 496
    const/4 v1, 0x0

    .line 497
    .local v1, "animatorToCancel":Lcom/nineoldandroids/animation/Animator;
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 498
    .local v0, "animatorSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/nineoldandroids/animation/Animator;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_32

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/Animator;

    .line 499
    .local v5, "runningAnim":Lcom/nineoldandroids/animation/Animator;
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    invoke-virtual {v7, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;

    .line 500
    .local v2, "bundle":Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;
    invoke-virtual {v2, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;->cancel(I)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 505
    iget v7, v2, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;->mPropertyMask:I

    if-nez v7, :cond_13

    .line 507
    move-object v1, v5

    .line 512
    .end local v2    # "bundle":Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;
    .end local v5    # "runningAnim":Lcom/nineoldandroids/animation/Animator;
    :cond_32
    if-eqz v1, :cond_37

    .line 513
    invoke-virtual {v1}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    .line 517
    .end local v0    # "animatorSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/nineoldandroids/animation/Animator;>;"
    .end local v1    # "animatorToCancel":Lcom/nineoldandroids/animation/Animator;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_37
    new-instance v4, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;

    invoke-direct {v4, p1, p2, p3}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;-><init>(IFF)V

    .line 518
    .local v4, "nameValuePair":Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 519
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    .line 520
    .local v6, "v":Landroid/view/View;
    if-eqz v6, :cond_55

    .line 521
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimationStarter:Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 522
    iget-object v7, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimationStarter:Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 524
    :cond_55
    return-void
.end method

.method private getValue(I)F
    .registers 4
    .param p1, "propertyConstant"    # I

    .prologue
    .line 591
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 592
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_d

    .line 593
    sparse-switch p1, :sswitch_data_42

    .line 626
    :cond_d
    const/4 v1, 0x0

    :goto_e
    return v1

    .line 596
    :sswitch_f
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v1

    goto :goto_e

    .line 599
    :sswitch_14
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    goto :goto_e

    .line 602
    :sswitch_19
    invoke-virtual {v0}, Landroid/view/View;->getRotation()F

    move-result v1

    goto :goto_e

    .line 605
    :sswitch_1e
    invoke-virtual {v0}, Landroid/view/View;->getRotationX()F

    move-result v1

    goto :goto_e

    .line 608
    :sswitch_23
    invoke-virtual {v0}, Landroid/view/View;->getRotationY()F

    move-result v1

    goto :goto_e

    .line 611
    :sswitch_28
    invoke-virtual {v0}, Landroid/view/View;->getScaleX()F

    move-result v1

    goto :goto_e

    .line 614
    :sswitch_2d
    invoke-virtual {v0}, Landroid/view/View;->getScaleY()F

    move-result v1

    goto :goto_e

    .line 617
    :sswitch_32
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    move-result v1

    goto :goto_e

    .line 620
    :sswitch_37
    invoke-virtual {v0}, Landroid/view/View;->getY()F

    move-result v1

    goto :goto_e

    .line 623
    :sswitch_3c
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v1

    goto :goto_e

    .line 593
    nop

    :sswitch_data_42
    .sparse-switch
        0x1 -> :sswitch_f
        0x2 -> :sswitch_14
        0x4 -> :sswitch_28
        0x8 -> :sswitch_2d
        0x10 -> :sswitch_19
        0x20 -> :sswitch_1e
        0x40 -> :sswitch_23
        0x80 -> :sswitch_32
        0x100 -> :sswitch_37
        0x200 -> :sswitch_3c
    .end sparse-switch
.end method

.method private setValue(IF)V
    .registers 5
    .param p1, "propertyConstant"    # I
    .param p2, "value"    # F

    .prologue
    .line 536
    iget-object v1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 537
    .local v0, "v":Landroid/view/View;
    if-eqz v0, :cond_d

    .line 538
    sparse-switch p1, :sswitch_data_36

    .line 581
    :cond_d
    :goto_d
    return-void

    .line 541
    :sswitch_e
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationX(F)V

    goto :goto_d

    .line 545
    :sswitch_12
    invoke-virtual {v0, p2}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_d

    .line 549
    :sswitch_16
    invoke-virtual {v0, p2}, Landroid/view/View;->setRotation(F)V

    goto :goto_d

    .line 553
    :sswitch_1a
    invoke-virtual {v0, p2}, Landroid/view/View;->setRotationX(F)V

    goto :goto_d

    .line 557
    :sswitch_1e
    invoke-virtual {v0, p2}, Landroid/view/View;->setRotationY(F)V

    goto :goto_d

    .line 561
    :sswitch_22
    invoke-virtual {v0, p2}, Landroid/view/View;->setScaleX(F)V

    goto :goto_d

    .line 565
    :sswitch_26
    invoke-virtual {v0, p2}, Landroid/view/View;->setScaleY(F)V

    goto :goto_d

    .line 569
    :sswitch_2a
    invoke-virtual {v0, p2}, Landroid/view/View;->setX(F)V

    goto :goto_d

    .line 573
    :sswitch_2e
    invoke-virtual {v0, p2}, Landroid/view/View;->setY(F)V

    goto :goto_d

    .line 577
    :sswitch_32
    invoke-virtual {v0, p2}, Landroid/view/View;->setAlpha(F)V

    goto :goto_d

    .line 538
    :sswitch_data_36
    .sparse-switch
        0x1 -> :sswitch_e
        0x2 -> :sswitch_12
        0x4 -> :sswitch_22
        0x8 -> :sswitch_26
        0x10 -> :sswitch_16
        0x20 -> :sswitch_1a
        0x40 -> :sswitch_1e
        0x80 -> :sswitch_2a
        0x100 -> :sswitch_2e
        0x200 -> :sswitch_32
    .end sparse-switch
.end method

.method private startAnimation()V
    .registers 10

    .prologue
    .line 429
    const/4 v6, 0x1

    new-array v6, v6, [F

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    aput v8, v6, v7

    invoke-static {v6}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 430
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 432
    .local v2, "nameValueList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;>;"
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 433
    const/4 v5, 0x0

    .line 434
    .local v5, "propertyMask":I
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 435
    .local v4, "propertyCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1f
    if-ge v1, v4, :cond_2d

    .line 436
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;

    .line 437
    .local v3, "nameValuesHolder":Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;
    iget v6, v3, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;->mNameConstant:I

    or-int/2addr v5, v6

    .line 435
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 439
    .end local v3    # "nameValuesHolder":Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$NameValuesHolder;
    :cond_2d
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    new-instance v7, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;

    invoke-direct {v7, v5, v2}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;-><init>(ILjava/util/ArrayList;)V

    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 440
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorEventListener:Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;

    invoke-virtual {v0, v6}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 441
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorEventListener:Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$AnimatorEventListener;

    invoke-virtual {v0, v6}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 442
    iget-boolean v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelaySet:Z

    if-eqz v6, :cond_4a

    .line 443
    iget-wide v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelay:J

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/animation/ValueAnimator;->setStartDelay(J)V

    .line 445
    :cond_4a
    iget-boolean v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDurationSet:Z

    if-eqz v6, :cond_53

    .line 446
    iget-wide v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDuration:J

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 448
    :cond_53
    iget-boolean v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mInterpolatorSet:Z

    if-eqz v6, :cond_5c

    .line 449
    iget-object v6, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v6}, Lcom/nineoldandroids/animation/ValueAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 451
    :cond_5c
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 452
    return-void
.end method


# virtual methods
.method public alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 413
    const/16 v0, 0x200

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 414
    return-object p0
.end method

.method public alphaBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 419
    const/16 v0, 0x200

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 420
    return-object p0
.end method

.method public cancel()V
    .registers 7

    .prologue
    .line 288
    iget-object v5, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v5

    if-lez v5, :cond_28

    .line 289
    iget-object v5, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimatorMap:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 291
    .local v2, "mAnimatorMapCopy":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/nineoldandroids/animation/Animator;Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;>;"
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 292
    .local v0, "animatorSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/nineoldandroids/animation/Animator;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Animator;

    .line 293
    .local v3, "runningAnim":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    goto :goto_18

    .line 296
    .end local v0    # "animatorSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/nineoldandroids/animation/Animator;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "mAnimatorMapCopy":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/nineoldandroids/animation/Animator;Lcom/nineoldandroids/view/ViewPropertyAnimatorHC$PropertyBundle;>;"
    .end local v3    # "runningAnim":Lcom/nineoldandroids/animation/Animator;
    :cond_28
    iget-object v5, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mPendingAnimations:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 297
    iget-object v5, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 298
    .local v4, "v":Landroid/view/View;
    if-eqz v4, :cond_3c

    .line 299
    iget-object v5, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mAnimationStarter:Ljava/lang/Runnable;

    invoke-virtual {v4, v5}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 301
    :cond_3c
    return-void
.end method

.method public getDuration()J
    .registers 3

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDurationSet:Z

    if-eqz v0, :cond_7

    .line 238
    iget-wide v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDuration:J

    .line 242
    :goto_6
    return-wide v0

    :cond_7
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->getDuration()J

    move-result-wide v0

    goto :goto_6
.end method

.method public getStartDelay()J
    .registers 3

    .prologue
    .line 248
    iget-boolean v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelaySet:Z

    if-eqz v0, :cond_7

    .line 249
    iget-wide v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelay:J

    .line 253
    :goto_6
    return-wide v0

    :cond_7
    const-wide/16 v0, 0x0

    goto :goto_6
.end method

.method public rotation(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 329
    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 330
    return-object p0
.end method

.method public rotationBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 335
    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 336
    return-object p0
.end method

.method public rotationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 341
    const/16 v0, 0x20

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 342
    return-object p0
.end method

.method public rotationXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 347
    const/16 v0, 0x20

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 348
    return-object p0
.end method

.method public rotationY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 353
    const/16 v0, 0x40

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 354
    return-object p0
.end method

.method public rotationYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 359
    const/16 v0, 0x40

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 360
    return-object p0
.end method

.method public scaleX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 389
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 390
    return-object p0
.end method

.method public scaleXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 395
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 396
    return-object p0
.end method

.method public scaleY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 401
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 402
    return-object p0
.end method

.method public scaleYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 407
    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 408
    return-object p0
.end method

.method public setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 6
    .param p1, "duration"    # J

    .prologue
    .line 219
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1f

    .line 220
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Animators cannot have negative duration: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :cond_1f
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDurationSet:Z

    .line 224
    iput-wide p1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mDuration:J

    .line 225
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 270
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mInterpolatorSet:Z

    .line 271
    iput-object p1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 272
    return-object p0
.end method

.method public setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 2
    .param p1, "listener"    # Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mListener:Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 278
    return-object p0
.end method

.method public setStartDelay(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 6
    .param p1, "startDelay"    # J

    .prologue
    .line 259
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1f

    .line 260
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Animators cannot have negative duration: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 263
    :cond_1f
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelaySet:Z

    .line 264
    iput-wide p1, p0, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->mStartDelay:J

    .line 265
    return-object p0
.end method

.method public start()V
    .registers 1

    .prologue
    .line 283
    invoke-direct {p0}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->startAnimation()V

    .line 284
    return-void
.end method

.method public translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 365
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 366
    return-object p0
.end method

.method public translationXBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 371
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 372
    return-object p0
.end method

.method public translationY(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 377
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 378
    return-object p0
.end method

.method public translationYBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 383
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 384
    return-object p0
.end method

.method public x(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 305
    const/16 v0, 0x80

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 306
    return-object p0
.end method

.method public xBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 311
    const/16 v0, 0x80

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 312
    return-object p0
.end method

.method public y(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 317
    const/16 v0, 0x100

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animateProperty(IF)V

    .line 318
    return-object p0
.end method

.method public yBy(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;
    .registers 3
    .param p1, "value"    # F

    .prologue
    .line 323
    const/16 v0, 0x100

    invoke-direct {p0, v0, p1}, Lcom/nineoldandroids/view/ViewPropertyAnimatorHC;->animatePropertyBy(IF)V

    .line 324
    return-object p0
.end method
