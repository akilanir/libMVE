.class Lcom/rey/material/widget/TabIndicatorView$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "TabIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/TabIndicatorView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TabIndicatorView;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TabIndicatorView;)V
    .registers 2

    .prologue
    .line 107
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 6
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 111
    if-nez p2, :cond_17

    .line 112
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v1}, Lcom/rey/material/widget/TabIndicatorView;->access$100(Lcom/rey/material/widget/TabIndicatorView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$000(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v1

    # invokes: Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/TabIndicatorView;->access$200(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V

    .line 114
    :cond_17
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 7
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v1}, Lcom/rey/material/widget/TabIndicatorView;->access$100(Lcom/rey/material/widget/TabIndicatorView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$1;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$000(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v1

    # invokes: Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V
    invoke-static {v0, v1}, Lcom/rey/material/widget/TabIndicatorView;->access$200(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V

    .line 119
    return-void
.end method
