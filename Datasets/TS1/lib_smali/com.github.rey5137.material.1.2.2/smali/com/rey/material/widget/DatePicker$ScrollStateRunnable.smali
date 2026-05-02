.class Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;
.super Ljava/lang/Object;
.source "DatePicker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/DatePicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollStateRunnable"
.end annotation


# instance fields
.field private mNewState:I

.field final synthetic this$0:Lcom/rey/material/widget/DatePicker;


# direct methods
.method private constructor <init>(Lcom/rey/material/widget/DatePicker;)V
    .registers 2

    .prologue
    .line 505
    iput-object p1, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/widget/DatePicker;Lcom/rey/material/widget/DatePicker$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/widget/DatePicker;
    .param p2, "x1"    # Lcom/rey/material/widget/DatePicker$1;

    .prologue
    .line 505
    invoke-direct {p0, p1}, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;-><init>(Lcom/rey/material/widget/DatePicker;)V

    return-void
.end method


# virtual methods
.method public doScrollStateChange(Landroid/widget/AbsListView;I)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 516
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget-object v0, v0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 517
    iput p2, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->mNewState:I

    .line 518
    iget-object v0, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget-object v0, v0, Lcom/rey/material/widget/DatePicker;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x28

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 519
    return-void
.end method

.method public run()V
    .registers 12

    .prologue
    const/16 v10, 0xfa

    const/4 v6, 0x1

    .line 523
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v9, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/rey/material/widget/DatePicker;->mCurrentScrollState:I

    .line 525
    iget v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->mNewState:I

    if-nez v8, :cond_77

    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v8, v8, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    if-eqz v8, :cond_77

    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v8, v8, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    if-eq v8, v6, :cond_77

    .line 526
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v9, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    .line 528
    const/4 v3, 0x0

    .line 529
    .local v3, "i":I
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8, v3}, Lcom/rey/material/widget/DatePicker;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 530
    .local v1, "child":Landroid/view/View;
    :goto_26
    if-eqz v1, :cond_37

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v8

    if-gtz v8, :cond_37

    .line 531
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v8, v3}, Lcom/rey/material/widget/DatePicker;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_26

    .line 532
    :cond_37
    if-nez v1, :cond_3a

    .line 550
    .end local v1    # "child":Landroid/view/View;
    .end local v3    # "i":I
    :cond_39
    :goto_39
    return-void

    .line 535
    .restart local v1    # "child":Landroid/view/View;
    .restart local v3    # "i":I
    :cond_3a
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/DatePicker;->getFirstVisiblePosition()I

    move-result v2

    .line 536
    .local v2, "firstPosition":I
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/DatePicker;->getLastVisiblePosition()I

    move-result v4

    .line 537
    .local v4, "lastPosition":I
    if-eqz v2, :cond_6f

    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/DatePicker;->getCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-eq v4, v8, :cond_6f

    .line 538
    .local v6, "scroll":Z
    :goto_52
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v7

    .line 539
    .local v7, "top":I
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 540
    .local v0, "bottom":I
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8}, Lcom/rey/material/widget/DatePicker;->getHeight()I

    move-result v8

    div-int/lit8 v5, v8, 0x2

    .line 541
    .local v5, "midpoint":I
    if-eqz v6, :cond_39

    const/4 v8, -0x1

    if-ge v7, v8, :cond_39

    .line 542
    if-le v0, v5, :cond_71

    .line 543
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8, v7, v10}, Lcom/rey/material/widget/DatePicker;->smoothScrollBy(II)V

    goto :goto_39

    .line 537
    .end local v0    # "bottom":I
    .end local v5    # "midpoint":I
    .end local v6    # "scroll":Z
    .end local v7    # "top":I
    :cond_6f
    const/4 v6, 0x0

    goto :goto_52

    .line 545
    .restart local v0    # "bottom":I
    .restart local v5    # "midpoint":I
    .restart local v6    # "scroll":Z
    .restart local v7    # "top":I
    :cond_71
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    invoke-virtual {v8, v0, v10}, Lcom/rey/material/widget/DatePicker;->smoothScrollBy(II)V

    goto :goto_39

    .line 549
    .end local v0    # "bottom":I
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "firstPosition":I
    .end local v3    # "i":I
    .end local v4    # "lastPosition":I
    .end local v5    # "midpoint":I
    .end local v6    # "scroll":Z
    .end local v7    # "top":I
    :cond_77
    iget-object v8, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->this$0:Lcom/rey/material/widget/DatePicker;

    iget v9, p0, Lcom/rey/material/widget/DatePicker$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/rey/material/widget/DatePicker;->mPreviousScrollState:I

    goto :goto_39
.end method
