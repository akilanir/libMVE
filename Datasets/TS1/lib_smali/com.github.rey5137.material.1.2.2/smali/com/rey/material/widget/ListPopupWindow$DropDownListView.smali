.class Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
.super Lcom/rey/material/widget/ListView;
.source "ListPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/ListPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DropDownListView"
.end annotation


# instance fields
.field private mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

.field private mDrawsInPressedState:Z

.field private mHijackFocus:Z

.field private mListSelectionHidden:Z

.field private mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "hijackFocus"    # Z

    .prologue
    .line 1591
    const/4 v0, 0x0

    sget v1, Lcom/rey/material/R$attr;->dropDownListViewStyle:I

    invoke-direct {p0, p1, v0, v1}, Lcom/rey/material/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 1592
    iput-boolean p2, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mHijackFocus:Z

    .line 1593
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setCacheColorHint(I)V

    .line 1594
    return-void
.end method

.method static synthetic access$1002(Lcom/rey/material/widget/ListPopupWindow$DropDownListView;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    .param p1, "x1"    # Z

    .prologue
    .line 1539
    iput-boolean p1, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mListSelectionHidden:Z

    return p1
.end method

.method private clearPressedItem()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 1668
    iput-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mDrawsInPressedState:Z

    .line 1669
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setPressed(Z)V

    .line 1671
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->drawableStateChanged()V

    .line 1673
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    if-eqz v0, :cond_15

    .line 1674
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    .line 1675
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    .line 1677
    :cond_15
    return-void
.end method

.method private clickPressedItem(Landroid/view/View;I)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 1663
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getItemIdAtPosition(I)J

    move-result-wide v0

    .line 1664
    .local v0, "id":J
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->performItemClick(Landroid/view/View;IJ)Z

    .line 1665
    return-void
.end method

.method private setPressedItem(Landroid/view/View;IFF)V
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "x"    # F
    .param p4, "y"    # F

    .prologue
    const/4 v0, 0x1

    .line 1680
    iput-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mDrawsInPressedState:Z

    .line 1684
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setPressed(Z)V

    .line 1685
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->layoutChildren()V

    .line 1688
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setSelection(I)V

    .line 1689
    invoke-virtual {p0, p2, p1, p3, p4}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->positionSelectorLikeTouchCompat(ILandroid/view/View;FF)V

    .line 1694
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setSelectorEnabled(Z)V

    .line 1698
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->refreshDrawableState()V

    .line 1699
    return-void
.end method


# virtual methods
.method public hasFocus()Z
    .registers 2

    .prologue
    .line 1739
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_a

    invoke-super {p0}, Lcom/rey/material/widget/ListView;->hasFocus()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public hasWindowFocus()Z
    .registers 2

    .prologue
    .line 1719
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_a

    invoke-super {p0}, Lcom/rey/material/widget/ListView;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isFocused()Z
    .registers 2

    .prologue
    .line 1729
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_a

    invoke-super {p0}, Lcom/rey/material/widget/ListView;->isFocused()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isInTouchMode()Z
    .registers 2

    .prologue
    .line 1709
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mHijackFocus:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mListSelectionHidden:Z

    if-nez v0, :cond_e

    :cond_8
    invoke-super {p0}, Lcom/rey/material/widget/ListView;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public onForwardedEvent(Landroid/view/MotionEvent;I)Z
    .registers 14
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "activePointerId"    # I

    .prologue
    const/4 v10, 0x1

    .line 1603
    const/4 v4, 0x1

    .line 1604
    .local v4, "handledEvent":Z
    const/4 v3, 0x0

    .line 1606
    .local v3, "clearPressedItem":Z
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 1607
    .local v0, "actionMasked":I
    packed-switch v0, :pswitch_data_68

    .line 1640
    :cond_a
    :goto_a
    if-eqz v4, :cond_e

    if-eqz v3, :cond_11

    .line 1641
    :cond_e
    invoke-direct {p0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->clearPressedItem()V

    .line 1645
    :cond_11
    if-eqz v4, :cond_5d

    .line 1646
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    if-nez v8, :cond_1e

    .line 1647
    new-instance v8, Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-direct {v8, p0}, Landroid/support/v4/widget/ListViewAutoScrollHelper;-><init>(Landroid/widget/ListView;)V

    iput-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    .line 1649
    :cond_1e
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-virtual {v8, v10}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->setEnabled(Z)Landroid/support/v4/widget/AutoScrollHelper;

    .line 1650
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-virtual {v8, p0, p1}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 1655
    :cond_28
    :goto_28
    return v4

    .line 1609
    :pswitch_29
    const/4 v4, 0x0

    .line 1610
    goto :goto_a

    .line 1612
    :pswitch_2b
    const/4 v4, 0x0

    .line 1615
    :pswitch_2c
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v1

    .line 1616
    .local v1, "activeIndex":I
    if-gez v1, :cond_34

    .line 1617
    const/4 v4, 0x0

    .line 1618
    goto :goto_a

    .line 1621
    :cond_34
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    float-to-int v6, v8

    .line 1622
    .local v6, "x":I
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    float-to-int v7, v8

    .line 1623
    .local v7, "y":I
    invoke-virtual {p0, v6, v7}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->pointToPosition(II)I

    move-result v5

    .line 1624
    .local v5, "position":I
    const/4 v8, -0x1

    if-ne v5, v8, :cond_47

    .line 1625
    const/4 v3, 0x1

    .line 1626
    goto :goto_a

    .line 1629
    :cond_47
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getFirstVisiblePosition()I

    move-result v8

    sub-int v8, v5, v8

    invoke-virtual {p0, v8}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1630
    .local v2, "child":Landroid/view/View;
    int-to-float v8, v6

    int-to-float v9, v7

    invoke-direct {p0, v2, v5, v8, v9}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setPressedItem(Landroid/view/View;IFF)V

    .line 1631
    const/4 v4, 0x1

    .line 1633
    if-ne v0, v10, :cond_a

    .line 1634
    invoke-direct {p0, v2, v5}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->clickPressedItem(Landroid/view/View;I)V

    goto :goto_a

    .line 1651
    .end local v1    # "activeIndex":I
    .end local v2    # "child":Landroid/view/View;
    .end local v5    # "position":I
    .end local v6    # "x":I
    .end local v7    # "y":I
    :cond_5d
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    if-eqz v8, :cond_28

    .line 1652
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->setEnabled(Z)Landroid/support/v4/widget/AutoScrollHelper;

    goto :goto_28

    .line 1607
    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_2c
        :pswitch_29
    .end packed-switch
.end method

.method protected touchModeDrawsInPressedStateCompat()Z
    .registers 2

    .prologue
    .line 1703
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mDrawsInPressedState:Z

    if-nez v0, :cond_a

    invoke-super {p0}, Lcom/rey/material/widget/ListView;->touchModeDrawsInPressedStateCompat()Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method
