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

    .line 8803
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8805
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .line 8806
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    .line 8809
    iput-wide v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    .line 8810
    iput-wide v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    .line 8811
    iput-wide v3, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    .line 8812
    iput-wide v3, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    .line 8814
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    .line 9228
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
    .line 9071
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9072
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9073
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9075
    :cond_c
    return-void
.end method

.method public final dispatchAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9118
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9119
    return-void
.end method

.method public final dispatchAnimationsFinished()V
    .registers 4

    .prologue
    .line 9214
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 9215
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v0, :cond_17

    .line 9216
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;

    invoke-interface {v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;->onAnimationsFinished()V

    .line 9215
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 9218
    :cond_17
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 9219
    return-void
.end method

.method public final dispatchChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 4
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9088
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 9089
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9090
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9092
    :cond_c
    return-void
.end method

.method public final dispatchChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9131
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V

    .line 9132
    return-void
.end method

.method public final dispatchMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9059
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9060
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9061
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9063
    :cond_c
    return-void
.end method

.method public final dispatchMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9109
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9110
    return-void
.end method

.method public final dispatchRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9047
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9048
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    if-eqz v0, :cond_c

    .line 9049
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;->onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9051
    :cond_c
    return-void
.end method

.method public final dispatchRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9100
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->onRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 9101
    return-void
.end method

.method public abstract endAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end method

.method public abstract endAnimations()V
.end method

.method public getAddDuration()J
    .registers 3

    .prologue
    .line 8840
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    return-wide v0
.end method

.method public getChangeDuration()J
    .registers 3

    .prologue
    .line 8876
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    return-wide v0
.end method

.method public getMoveDuration()J
    .registers 3

    .prologue
    .line 8822
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    return-wide v0
.end method

.method public getRemoveDuration()J
    .registers 3

    .prologue
    .line 8858
    iget-wide v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    return-wide v0
.end method

.method public getSupportsChangeAnimations()Z
    .registers 2

    .prologue
    .line 8894
    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    return v0
.end method

.method public abstract isRunning()Z
.end method

.method public final isRunning(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;)Z
    .registers 4
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;

    .prologue
    .line 9186
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->isRunning()Z

    move-result v0

    .line 9187
    .local v0, "running":Z
    if-eqz p1, :cond_b

    .line 9188
    if-nez v0, :cond_c

    .line 9189
    invoke-interface {p1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorFinishedListener;->onAnimationsFinished()V

    .line 9194
    :cond_b
    :goto_b
    return v0

    .line 9191
    :cond_c
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mFinishedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b
.end method

.method public onAddFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9270
    return-void
.end method

.method public onAddStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9260
    return-void
.end method

.method public onChangeFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9314
    return-void
.end method

.method public onChangeStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)V
    .registers 3
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "oldItem"    # Z

    .prologue
    .line 9302
    return-void
.end method

.method public onMoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9290
    return-void
.end method

.method public onMoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9280
    return-void
.end method

.method public onRemoveFinished(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9250
    return-void
.end method

.method public onRemoveStarting(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "item"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 9240
    return-void
.end method

.method public abstract runPendingAnimations()V
.end method

.method public setAddDuration(J)V
    .registers 3
    .param p1, "addDuration"    # J

    .prologue
    .line 8849
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mAddDuration:J

    .line 8850
    return-void
.end method

.method public setChangeDuration(J)V
    .registers 3
    .param p1, "changeDuration"    # J

    .prologue
    .line 8885
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mChangeDuration:J

    .line 8886
    return-void
.end method

.method setListener(Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .prologue
    .line 8926
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mListener:Landroid/support/v7/widget/RecyclerView$ItemAnimator$ItemAnimatorListener;

    .line 8927
    return-void
.end method

.method public setMoveDuration(J)V
    .registers 3
    .param p1, "moveDuration"    # J

    .prologue
    .line 8831
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mMoveDuration:J

    .line 8832
    return-void
.end method

.method public setRemoveDuration(J)V
    .registers 3
    .param p1, "removeDuration"    # J

    .prologue
    .line 8867
    iput-wide p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mRemoveDuration:J

    .line 8868
    return-void
.end method

.method public setSupportsChangeAnimations(Z)V
    .registers 2
    .param p1, "supportsChangeAnimations"    # Z

    .prologue
    .line 8914
    iput-boolean p1, p0, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->mSupportsChangeAnimations:Z

    .line 8915
    return-void
.end method
