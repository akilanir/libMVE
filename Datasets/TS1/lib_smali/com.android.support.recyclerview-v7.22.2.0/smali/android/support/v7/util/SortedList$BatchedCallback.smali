.class public Landroid/support/v7/util/SortedList$BatchedCallback;
.super Landroid/support/v7/util/SortedList$Callback;
.source "SortedList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/util/SortedList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BatchedCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T2:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/util/SortedList$Callback",
        "<TT2;>;"
    }
.end annotation


# static fields
.field static final TYPE_ADD:I = 0x1

.field static final TYPE_CHANGE:I = 0x3

.field static final TYPE_MOVE:I = 0x4

.field static final TYPE_NONE:I = 0x0

.field static final TYPE_REMOVE:I = 0x2


# instance fields
.field mLastEventCount:I

.field mLastEventPosition:I

.field mLastEventType:I

.field private final mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT2;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/v7/util/SortedList$Callback;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/util/SortedList$Callback",
            "<TT2;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "wrappedCallback":Landroid/support/v7/util/SortedList$Callback;, "Landroid/support/v7/util/SortedList$Callback<TT2;>;"
    const/4 v1, -0x1

    .line 556
    invoke-direct {p0}, Landroid/support/v7/util/SortedList$Callback;-><init>()V

    .line 545
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    .line 546
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 547
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 557
    iput-object p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    .line 558
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/util/SortedList$BatchedCallback;)Landroid/support/v7/util/SortedList$Callback;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/util/SortedList$BatchedCallback;

    .prologue
    .line 536
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    return-object v0
.end method


# virtual methods
.method public areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    .prologue
    .line 616
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "oldItem":Ljava/lang/Object;, "TT2;"
    .local p2, "newItem":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)Z"
        }
    .end annotation

    .prologue
    .line 621
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "item1":Ljava/lang/Object;, "TT2;"
    .local p2, "item2":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT2;TT2;)I"
        }
    .end annotation

    .prologue
    .line 562
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    .local p1, "o1":Ljava/lang/Object;, "TT2;"
    .local p2, "o2":Ljava/lang/Object;, "TT2;"
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public dispatchLastEvent()V
    .registers 4

    .prologue
    .line 630
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-nez v0, :cond_5

    .line 645
    :goto_4
    return-void

    .line 633
    :cond_5
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    packed-switch v0, :pswitch_data_2c

    .line 644
    :goto_a
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    goto :goto_4

    .line 635
    :pswitch_e
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onInserted(II)V

    goto :goto_a

    .line 638
    :pswitch_18
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onRemoved(II)V

    goto :goto_a

    .line 641
    :pswitch_22
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/util/SortedList$Callback;->onChanged(II)V

    goto :goto_a

    .line 633
    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_e
        :pswitch_18
        :pswitch_22
    .end packed-switch
.end method

.method public onChanged(II)V
    .registers 7
    .param p1, "position"    # I
    .param p2, "count"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    const/4 v3, 0x3

    .line 599
    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-ne v1, v3, :cond_2c

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v1, v2

    if-gt p1, v1, :cond_2c

    add-int v1, p1, p2

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt v1, v2, :cond_2c

    .line 603
    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int v0, v1, v2

    .line 604
    .local v0, "previousEnd":I
    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 605
    add-int v1, p1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 612
    .end local v0    # "previousEnd":I
    :goto_2b
    return-void

    .line 608
    :cond_2c
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 609
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 610
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 611
    iput v3, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    goto :goto_2b
.end method

.method public onInserted(II)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "count"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    const/4 v2, 0x1

    .line 567
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-ne v0, v2, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-lt p1, v0, :cond_1e

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    iget v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, v1

    if-gt p1, v0, :cond_1e

    .line 569
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 570
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 577
    :goto_1d
    return-void

    .line 573
    :cond_1e
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 574
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 575
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 576
    iput v2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    goto :goto_1d
.end method

.method public onMoved(II)V
    .registers 4
    .param p1, "fromPosition"    # I
    .param p2, "toPosition"    # I

    .prologue
    .line 593
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 594
    iget-object v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mWrappedCallback:Landroid/support/v7/util/SortedList$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/SortedList$Callback;->onMoved(II)V

    .line 595
    return-void
.end method

.method public onRemoved(II)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "count"    # I

    .prologue
    .local p0, "this":Landroid/support/v7/util/SortedList$BatchedCallback;, "Landroid/support/v7/util/SortedList$BatchedCallback<TT2;>;"
    const/4 v1, 0x2

    .line 581
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    if-ne v0, v1, :cond_f

    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    if-ne v0, p1, :cond_f

    .line 582
    iget v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    add-int/2addr v0, p2

    iput v0, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 589
    :goto_e
    return-void

    .line 585
    :cond_f
    invoke-virtual {p0}, Landroid/support/v7/util/SortedList$BatchedCallback;->dispatchLastEvent()V

    .line 586
    iput p1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventPosition:I

    .line 587
    iput p2, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventCount:I

    .line 588
    iput v1, p0, Landroid/support/v7/util/SortedList$BatchedCallback;->mLastEventType:I

    goto :goto_e
.end method
