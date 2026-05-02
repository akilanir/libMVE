.class Lcom/rey/material/widget/TabPageIndicator$2;
.super Ljava/lang/Object;
.source "TabPageIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rey/material/widget/TabPageIndicator;->animateToTab(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TabPageIndicator;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TabPageIndicator;I)V
    .registers 3

    .prologue
    .line 310
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    iput p2, p0, Lcom/rey/material/widget/TabPageIndicator$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 312
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    iget v2, p0, Lcom/rey/material/widget/TabPageIndicator$2;->val$position:I

    # invokes: Lcom/rey/material/widget/TabPageIndicator;->getTabView(I)Lcom/rey/material/widget/CheckedTextView;
    invoke-static {v1, v2}, Lcom/rey/material/widget/TabPageIndicator;->access$200(Lcom/rey/material/widget/TabPageIndicator;I)Lcom/rey/material/widget/CheckedTextView;

    move-result-object v0

    .line 313
    .local v0, "tv":Lcom/rey/material/widget/CheckedTextView;
    if-eqz v0, :cond_3e

    .line 314
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    # getter for: Lcom/rey/material/widget/TabPageIndicator;->mScrolling:Z
    invoke-static {v1}, Lcom/rey/material/widget/TabPageIndicator;->access$300(Lcom/rey/material/widget/TabPageIndicator;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 315
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    invoke-virtual {v0}, Lcom/rey/material/widget/CheckedTextView;->getLeft()I

    move-result v2

    invoke-virtual {v0}, Lcom/rey/material/widget/CheckedTextView;->getMeasuredWidth()I

    move-result v3

    # invokes: Lcom/rey/material/widget/TabPageIndicator;->updateIndicator(II)V
    invoke-static {v1, v2, v3}, Lcom/rey/material/widget/TabPageIndicator;->access$400(Lcom/rey/material/widget/TabPageIndicator;II)V

    .line 317
    :cond_1f
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    invoke-virtual {v0}, Lcom/rey/material/widget/CheckedTextView;->getLeft()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    invoke-virtual {v3}, Lcom/rey/material/widget/TabPageIndicator;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Lcom/rey/material/widget/CheckedTextView;->getWidth()I

    move-result v4

    sub-int/2addr v3, v4

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    invoke-virtual {v3}, Lcom/rey/material/widget/TabPageIndicator;->getPaddingLeft()I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/rey/material/widget/TabPageIndicator;->smoothScrollTo(II)V

    .line 319
    :cond_3e
    iget-object v1, p0, Lcom/rey/material/widget/TabPageIndicator$2;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    const/4 v2, 0x0

    # setter for: Lcom/rey/material/widget/TabPageIndicator;->mTabAnimSelector:Ljava/lang/Runnable;
    invoke-static {v1, v2}, Lcom/rey/material/widget/TabPageIndicator;->access$502(Lcom/rey/material/widget/TabPageIndicator;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 320
    return-void
.end method
