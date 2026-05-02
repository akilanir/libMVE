.class public abstract Landroid/support/v7/widget/RecyclerView$ItemAnimator;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ItemAnimator"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;,
        Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;
    }
.end annotation


# instance fields
.field private mAddDuration:J

.field private mChangeDuration:J

.field private mFinishedListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;",
            ">;"
        }
    .end annotation
.end field

.field private mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

.field private mMoveDuration:J

.field private mRemoveDuration:J

.field private mSupportsChangeAnimations:Z


# direct methods
.method public constructor <init>()V
    .registers 6

    .prologue
    const-wide/16 v3, 0xfa

    const-wide/16 v1, 0x78

    .line 9250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9252
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .line 9253
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    .line 9256
    iput-wide v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    .line 9257
    iput-wide v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    .line 9258
    iput-wide v3, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    .line 9259
    iput-wide v3, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    .line 9261
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    .line 9675
    return-void
.end method


# virtual methods
.method public abstract animateAdd(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
.end method

.method public abstract animateChange(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z
.end method

.method public abstract animateMove(Landroid/support/v7/widget/RecyclerView$ViewHolder;IIII)Z
.end method

.method public abstract animateRemove(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
.end method

.method public final dispatchAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9518
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9519
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9520
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9522
    :cond_c
    return-void
.end method

.method public final dispatchAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9565
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9566
    return-void
.end method

.method public final dispatchAnimationsFinished()V
    .registers 4

    .prologue
    .line 9661
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 9662
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_17

    .line 9663
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;

    invoke-interface {v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;->onAnimationsFinished()V

    .line 9662
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 9665
    :cond_17
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 9666
    return-void
.end method

.method public final dispatchChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 4
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9535
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 9536
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9537
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9539
    :cond_c
    return-void
.end method

.method public final dispatchChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9578
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 9579
    return-void
.end method

.method public final dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9506
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9507
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9508
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9510
    :cond_c
    return-void
.end method

.method public final dispatchMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9556
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9557
    return-void
.end method

.method public final dispatchRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9494
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9495
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9496
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9498
    :cond_c
    return-void
.end method

.method public final dispatchRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9547
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9548
    return-void
.end method

.method public abstract endAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end method

.method public abstract endAnimations()V
.end method

.method public getAddDuration()J
    .registers 3

    .prologue
    .line 9287
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    return-wide v0
.end method

.method public getChangeDuration()J
    .registers 3

    .prologue
    .line 9323
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    return-wide v0
.end method

.method public getMoveDuration()J
    .registers 3

    .prologue
    .line 9269
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    return-wide v0
.end method

.method public getRemoveDuration()J
    .registers 3

    .prologue
    .line 9305
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    return-wide v0
.end method

.method public getSupportsChangeAnimations()Z
    .registers 2

    .prologue
    .line 9341
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    return v0
.end method

.method public abstract isRunning()Z
.end method

.method public final isRunning(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;)Z
    .registers 4
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;

    .prologue
    .line 9633
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->isRunning()Z

    move-result v0

    .line 9634
    .local v0, "running":Z
    if-eqz p1, :cond_b

    .line 9635
    if-nez v0, :cond_c

    .line 9636
    invoke-interface {p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;->onAnimationsFinished()V

    .line 9641
    :cond_b
    :goto_b
    return v0

    .line 9638
    :cond_c
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b
.end method

.method public onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9717
    return-void
.end method

.method public onAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9707
    return-void
.end method

.method public onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9761
    return-void
.end method

.method public onChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9749
    return-void
.end method

.method public onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9737
    return-void
.end method

.method public onMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9727
    return-void
.end method

.method public onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9697
    return-void
.end method

.method public onRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9687
    return-void
.end method

.method public abstract runPendingAnimations()V
.end method

.method public setAddDuration(J)V
    .registers 3
    .param p1, "addDuration"    # J

    .prologue
    .line 9296
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    .line 9297
    return-void
.end method

.method public setChangeDuration(J)V
    .registers 3
    .param p1, "changeDuration"    # J

    .prologue
    .line 9332
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    .line 9333
    return-void
.end method

.method setListener(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .prologue
    .line 9373
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .line 9374
    return-void
.end method

.method public setMoveDuration(J)V
    .registers 3
    .param p1, "moveDuration"    # J

    .prologue
    .line 9278
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    .line 9279
    return-void
.end method

.method public setRemoveDuration(J)V
    .registers 3
    .param p1, "removeDuration"    # J

    .prologue
    .line 9314
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    .line 9315
    return-void
.end method

.method public setSupportsChangeAnimations(Z)V
    .registers 2
    .param p1, "supportsChangeAnimations"    # Z

    .prologue
    .line 9361
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    .line 9362
    return-void
.end method
