.class Lcom/rey/material/widget/TabIndicatorView$2;
.super Ljava/lang/Object;
.source "TabIndicatorView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/TabIndicatorView;->animateToTab(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TabIndicatorView;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TabIndicatorView;I)V
    .registers 3

    .prologue
    .line 219
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    iput p2, p0, Lcom/rey/material/widget/TabIndicatorView$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 221
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v1}, Lcom/rey/material/widget/TabIndicatorView;->access$100(Lcom/rey/material/widget/TabIndicatorView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView$2;->val$position:I

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 222
    .local v0, "v":Landroid/view/View;
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mScrolling:Z
    invoke-static {v1}, Lcom/rey/material/widget/TabIndicatorView;->access$300(Lcom/rey/material/widget/TabIndicatorView;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 223
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # invokes: Lcom/rey/material/widget/TabIndicatorView;->updateIndicator(Landroid/view/View;)V
    invoke-static {v1, v0}, Lcom/rey/material/widget/TabIndicatorView;->access$200(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V

    .line 225
    :cond_19
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$000(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/TabIndicatorView;->smoothScrollToPosition(I)V

    .line 226
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$2;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    const/4 v2, 0x0

    # setter for: Lcom/rey/material/widget/TabIndicatorView;->mTabAnimSelector:Ljava/lang/Runnable;
    invoke-static {v1, v2}, Lcom/rey/material/widget/TabIndicatorView;->access$402(Lcom/rey/material/widget/TabIndicatorView;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 227
    return-void
.end method
