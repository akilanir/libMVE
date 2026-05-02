.class public Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;
.super Landroid/support/v7/widget/helper/ItemTouchHelper$SimpleCallback;
.source "SimpleDragCallback.java"


# instance fields
.field private mCallbackItemTouch:Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;

.field private mIsDragEnabled:Z


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;)V
    .registers 4
    .param p1, "itemTouchCallback"    # Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;

    .prologue
    .line 17
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper$SimpleCallback;-><init>(II)V

    .line 14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;->mIsDragEnabled:Z

    .line 18
    iput-object p1, p0, Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;->mCallbackItemTouch:Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;

    .line 19
    return-void
.end method


# virtual methods
.method public isLongPressDragEnabled()Z
    .registers 2

    .prologue
    .line 27
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;->mIsDragEnabled:Z

    return v0
.end method

.method public onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .registers 7
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "target"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;->mCallbackItemTouch:Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/mikepenz/fastadapter/drag/ItemTouchCallback;->itemTouchOnMove(II)Z

    move-result v0

    return v0
.end method

.method public onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "direction"    # I

    .prologue
    .line 38
    return-void
.end method

.method public setIsDragEnabled(Z)V
    .registers 2
    .param p1, "mIsDragEnabled"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/drag/SimpleDragCallback;->mIsDragEnabled:Z

    .line 23
    return-void
.end method
