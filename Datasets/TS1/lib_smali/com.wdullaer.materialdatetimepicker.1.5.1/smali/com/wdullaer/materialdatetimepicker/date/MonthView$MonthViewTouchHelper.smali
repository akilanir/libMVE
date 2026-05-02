.class public Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;
.super Landroid/support/v4/widget/ExploreByTouchHelper;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wdullaer/materialdatetimepicker/date/MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MonthViewTouchHelper"
.end annotation


# static fields
.field private static final DATE_FORMAT:Ljava/lang/String; = "dd MMMM yyyy"


# instance fields
.field private final mTempCalendar:Ljava/util/Calendar;

.field private final mTempRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;


# direct methods
.method public constructor <init>(Lcom/wdullaer/materialdatetimepicker/date/MonthView;Landroid/view/View;)V
    .registers 4
    .param p2, "host"    # Landroid/view/View;

    .prologue
    .line 769
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    .line 770
    invoke-direct {p0, p2}, Landroid/support/v4/widget/ExploreByTouchHelper;-><init>(Landroid/view/View;)V

    .line 766
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempRect:Landroid/graphics/Rect;

    .line 767
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempCalendar:Ljava/util/Calendar;

    .line 771
    return-void
.end method


# virtual methods
.method public clearFocusedVirtualView()V
    .registers 5

    .prologue
    .line 779
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getFocusedVirtualView()I

    move-result v0

    .line 780
    .local v0, "focusedVirtualView":I
    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_14

    .line 781
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {p0, v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getAccessibilityNodeProvider(Landroid/view/View;)Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;

    move-result-object v1

    const/16 v2, 0x80

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;->performAction(IILandroid/os/Bundle;)Z

    .line 786
    :cond_14
    return-void
.end method

.method protected getItemBounds(ILandroid/graphics/Rect;)V
    .registers 14
    .param p1, "day"    # I
    .param p2, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 843
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v4, v9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    .line 844
    .local v4, "offsetX":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {v9}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getMonthHeaderSize()I

    move-result v5

    .line 845
    .local v5, "offsetY":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v0, v9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mRowHeight:I

    .line 846
    .local v0, "cellHeight":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v9, v9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mWidth:I

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v10, v10, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mEdgePadding:I

    mul-int/lit8 v10, v10, 0x2

    sub-int/2addr v9, v10

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v10, v10, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    div-int v1, v9, v10

    .line 847
    .local v1, "cellWidth":I
    add-int/lit8 v9, p1, -0x1

    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {v10}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->findDayOffset()I

    move-result v10

    add-int v3, v9, v10

    .line 848
    .local v3, "index":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v9, v9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    div-int v6, v3, v9

    .line 849
    .local v6, "row":I
    iget-object v9, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v9, v9, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumDays:I

    rem-int v2, v3, v9

    .line 850
    .local v2, "column":I
    mul-int v9, v2, v1

    add-int v7, v4, v9

    .line 851
    .local v7, "x":I
    mul-int v9, v6, v0

    add-int v8, v5, v9

    .line 853
    .local v8, "y":I
    add-int v9, v7, v1

    add-int v10, v8, v0

    invoke-virtual {p2, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 854
    return-void
.end method

.method protected getItemDescription(I)Ljava/lang/CharSequence;
    .registers 7
    .param p1, "day"    # I

    .prologue
    .line 865
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempCalendar:Ljava/util/Calendar;

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v2, v2, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mYear:I

    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v3, v3, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mMonth:I

    invoke-virtual {v1, v2, v3, p1}, Ljava/util/Calendar;->set(III)V

    .line 866
    const-string v1, "dd MMMM yyyy"

    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempCalendar:Ljava/util/Calendar;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    .line 869
    .local v0, "date":Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v1, v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDay:I

    if-ne p1, v1, :cond_31

    .line 870
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_item_is_selected:I

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 873
    .end local v0    # "date":Ljava/lang/CharSequence;
    :cond_31
    return-object v0
.end method

.method protected getVirtualViewAt(FF)I
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 790
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {v1, p1, p2}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->getDayFromLocation(FF)I

    move-result v0

    .line 791
    .local v0, "day":I
    if-ltz v0, :cond_9

    .line 794
    .end local v0    # "day":I
    :goto_8
    return v0

    .restart local v0    # "day":I
    :cond_9
    const/high16 v0, -0x80000000

    goto :goto_8
.end method

.method protected getVisibleVirtualViews(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 799
    .local p1, "virtualViewIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .local v0, "day":I
    :goto_1
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v1, v1, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mNumCells:I

    if-gt v0, v1, :cond_11

    .line 800
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 799
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 802
    :cond_11
    return-void
.end method

.method protected onPerformActionForVirtualView(IILandroid/os/Bundle;)Z
    .registers 5
    .param p1, "virtualViewId"    # I
    .param p2, "action"    # I
    .param p3, "arguments"    # Landroid/os/Bundle;

    .prologue
    .line 827
    packed-switch p2, :pswitch_data_c

    .line 833
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 829
    :pswitch_5
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    # invokes: Lcom/wdullaer/materialdatetimepicker/date/MonthView;->onDayClick(I)V
    invoke-static {v0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->access$000(Lcom/wdullaer/materialdatetimepicker/date/MonthView;I)V

    .line 830
    const/4 v0, 0x1

    goto :goto_4

    .line 827
    :pswitch_data_c
    .packed-switch 0x10
        :pswitch_5
    .end packed-switch
.end method

.method protected onPopulateEventForVirtualView(ILandroid/view/accessibility/AccessibilityEvent;)V
    .registers 4
    .param p1, "virtualViewId"    # I
    .param p2, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 806
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getItemDescription(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/accessibility/AccessibilityEvent;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 807
    return-void
.end method

.method protected onPopulateNodeForVirtualView(ILandroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 4
    .param p1, "virtualViewId"    # I
    .param p2, "node"    # Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;

    .prologue
    .line 812
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getItemBounds(ILandroid/graphics/Rect;)V

    .line 814
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getItemDescription(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 815
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setBoundsInParent(Landroid/graphics/Rect;)V

    .line 816
    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->addAction(I)V

    .line 818
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    iget v0, v0, Lcom/wdullaer/materialdatetimepicker/date/MonthView;->mSelectedDay:I

    if-ne p1, v0, :cond_20

    .line 819
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setSelected(Z)V

    .line 822
    :cond_20
    return-void
.end method

.method public setFocusedVirtualView(I)V
    .registers 5
    .param p1, "virtualViewId"    # I

    .prologue
    .line 774
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->this$0:Lcom/wdullaer/materialdatetimepicker/date/MonthView;

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/MonthView$MonthViewTouchHelper;->getAccessibilityNodeProvider(Landroid/view/View;)Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;

    move-result-object v0

    const/16 v1, 0x40

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeProviderCompat;->performAction(IILandroid/os/Bundle;)Z

    .line 776
    return-void
.end method
