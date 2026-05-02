.class public Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;
.super Ljava/lang/Object;
.source "DayPickerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ScrollStateRunnable"
.end annotation


# instance fields
.field private mNewState:I

.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;


# direct methods
.method protected constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;)V
    .registers 2

    .prologue
    .line 284
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doScrollStateChange(Landroid/widget/AbsListView;I)V
    .registers 6
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 295
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 296
    iput p2, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    .line 297
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x28

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 298
    return-void
.end method

.method public run()V
    .registers 13

    .prologue
    const/16 v11, 0xfa

    const/4 v6, 0x1

    .line 302
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mCurrentScrollState:I

    .line 303
    const-string v8, "MonthFragment"

    const/4 v9, 0x3

    invoke-static {v8, v9}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v8

    if-eqz v8, :cond_3a

    .line 304
    const-string v8, "MonthFragment"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "new scroll state: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " old state: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v10, v10, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    :cond_3a
    iget v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    if-nez v8, :cond_a9

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v8, v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    if-eqz v8, :cond_a9

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v8, v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    if-eq v8, v6, :cond_a9

    .line 311
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    .line 312
    const/4 v3, 0x0

    .line 313
    .local v3, "i":I
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8, v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 314
    .local v1, "child":Landroid/view/View;
    :goto_57
    if-eqz v1, :cond_68

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v8

    if-gtz v8, :cond_68

    .line 315
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v8, v3}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_57

    .line 317
    :cond_68
    if-nez v1, :cond_6b

    .line 337
    .end local v1    # "child":Landroid/view/View;
    .end local v3    # "i":I
    :cond_6a
    :goto_6a
    return-void

    .line 321
    .restart local v1    # "child":Landroid/view/View;
    .restart local v3    # "i":I
    :cond_6b
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getFirstVisiblePosition()I

    move-result v2

    .line 322
    .local v2, "firstPosition":I
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getLastVisiblePosition()I

    move-result v4

    .line 323
    .local v4, "lastPosition":I
    if-eqz v2, :cond_a1

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-eq v4, v8, :cond_a1

    .line 324
    .local v6, "scroll":Z
    :goto_83
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v7

    .line 325
    .local v7, "top":I
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 326
    .local v0, "bottom":I
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->getHeight()I

    move-result v8

    div-int/lit8 v5, v8, 0x2

    .line 327
    .local v5, "midpoint":I
    if-eqz v6, :cond_6a

    sget v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->LIST_TOP_OFFSET:I

    if-ge v7, v8, :cond_6a

    .line 328
    if-le v0, v5, :cond_a3

    .line 329
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8, v7, v11}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->smoothScrollBy(II)V

    goto :goto_6a

    .line 323
    .end local v0    # "bottom":I
    .end local v5    # "midpoint":I
    .end local v6    # "scroll":Z
    .end local v7    # "top":I
    :cond_a1
    const/4 v6, 0x0

    goto :goto_83

    .line 331
    .restart local v0    # "bottom":I
    .restart local v5    # "midpoint":I
    .restart local v6    # "scroll":Z
    .restart local v7    # "top":I
    :cond_a3
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    invoke-virtual {v8, v0, v11}, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->smoothScrollBy(II)V

    goto :goto_6a

    .line 335
    .end local v0    # "bottom":I
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "firstPosition":I
    .end local v3    # "i":I
    .end local v4    # "lastPosition":I
    .end local v5    # "midpoint":I
    .end local v6    # "scroll":Z
    .end local v7    # "top":I
    :cond_a9
    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->this$0:Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;

    iget v9, p0, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView$ScrollStateRunnable;->mNewState:I

    iput v9, v8, Lcom/wdullaer/materialdatetimepicker/date/DayPickerView;->mPreviousScrollState:I

    goto :goto_6a
.end method
