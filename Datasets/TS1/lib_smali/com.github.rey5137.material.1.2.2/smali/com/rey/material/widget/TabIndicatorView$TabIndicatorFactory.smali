.class public abstract Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;
.super Ljava/lang/Object;
.source "TabIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "TabIndicatorFactory"
.end annotation


# instance fields
.field private mView:Lcom/rey/material/widget/TabIndicatorView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 397
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getCurrentTabIndicator()I
.end method

.method public abstract getIcon(I)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract getTabIndicatorCount()I
.end method

.method public abstract getText(I)Ljava/lang/CharSequence;
.end method

.method public abstract isIconTabIndicator(I)Z
.end method

.method public final notifyDataSetChanged()V
    .registers 2

    .prologue
    .line 479
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 480
    return-void
.end method

.method public final notifyTabChanged(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 487
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 488
    return-void
.end method

.method public final notifyTabInserted(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 504
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 505
    return-void
.end method

.method public final notifyTabMoved(II)V
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 513
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 514
    return-void
.end method

.method public final notifyTabRangeChanged(II)V
    .registers 4
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 496
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 497
    return-void
.end method

.method public final notifyTabRangeInserted(II)V
    .registers 4
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 522
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 523
    return-void
.end method

.method public final notifyTabRangeRemoved(II)V
    .registers 4
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 539
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 540
    return-void
.end method

.method public final notifyTabRemoved(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 530
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 531
    return-void
.end method

.method public final notifyTabScrollStateChanged(I)V
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 452
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TabIndicatorView;->onTabScrollStateChanged(I)V

    .line 453
    return-void
.end method

.method public final notifyTabScrolled(IF)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F

    .prologue
    .line 462
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/TabIndicatorView;->onTabScrolled(IF)V

    .line 463
    return-void
.end method

.method public final notifyTabSelected(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 472
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TabIndicatorView;->onTabSelected(I)V

    .line 473
    return-void
.end method

.method public abstract onTabIndicatorSelected(I)V
.end method

.method protected setTabIndicatorView(Lcom/rey/material/widget/TabIndicatorView;)V
    .registers 2
    .param p1, "view"    # Lcom/rey/material/widget/TabIndicatorView;

    .prologue
    .line 441
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->mView:Lcom/rey/material/widget/TabIndicatorView;

    .line 442
    return-void
.end method
