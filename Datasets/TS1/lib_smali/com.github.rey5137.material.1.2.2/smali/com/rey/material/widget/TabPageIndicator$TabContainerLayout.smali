.class Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;
.super Landroid/widget/FrameLayout;
.source "TabPageIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabPageIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TabContainerLayout"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/rey/material/widget/TabPageIndicator;


# direct methods
.method public constructor <init>(Lcom/rey/material/widget/TabPageIndicator;Landroid/content/Context;)V
    .registers 3
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 555
    iput-object p1, p0, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    .line 556
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 557
    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .registers 14
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 627
    const/4 v2, 0x0

    .line 628
    .local v2, "childLeft":I
    const/4 v4, 0x0

    .line 629
    .local v4, "childTop":I
    sub-int v3, p4, p2

    .line 630
    .local v3, "childRight":I
    sub-int v1, p5, p3

    .line 632
    .local v1, "childBottom":I
    iget-object v7, p0, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    # getter for: Lcom/rey/material/widget/TabPageIndicator;->mIsRtl:Z
    invoke-static {v7}, Lcom/rey/material/widget/TabPageIndicator;->access$700(Lcom/rey/material/widget/TabPageIndicator;)Z

    move-result v7

    if-eqz v7, :cond_2a

    .line 633
    const/4 v6, 0x0

    .local v6, "i":I
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v5

    .local v5, "count":I
    :goto_13
    if-ge v6, v5, :cond_45

    .line 634
    invoke-virtual {p0, v6}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 635
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    sub-int v7, v3, v7

    invoke-virtual {v0, v7, v4, v3, v1}, Landroid/view/View;->layout(IIII)V

    .line 636
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    sub-int/2addr v3, v7

    .line 633
    add-int/lit8 v6, v6, 0x1

    goto :goto_13

    .line 639
    .end local v0    # "child":Landroid/view/View;
    .end local v5    # "count":I
    .end local v6    # "i":I
    :cond_2a
    const/4 v6, 0x0

    .restart local v6    # "i":I
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v5

    .restart local v5    # "count":I
    :goto_2f
    if-ge v6, v5, :cond_45

    .line 640
    invoke-virtual {p0, v6}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 641
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v7, v2

    invoke-virtual {v0, v2, v4, v7, v1}, Landroid/view/View;->layout(IIII)V

    .line 642
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v2, v7

    .line 639
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f

    .line 644
    .end local v0    # "child":Landroid/view/View;
    :cond_45
    return-void
.end method

.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v1, 0x0

    const/high16 v11, 0x40000000    # 2.0f

    .line 561
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v7

    .line 562
    .local v7, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v8

    .line 564
    .local v8, "widthSize":I
    const/4 v6, 0x0

    .line 565
    .local v6, "width":I
    const/4 v3, 0x0

    .line 567
    .local v3, "height":I
    iget-object v10, p0, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->this$0:Lcom/rey/material/widget/TabPageIndicator;

    # getter for: Lcom/rey/material/widget/TabPageIndicator;->mMode:I
    invoke-static {v10}, Lcom/rey/material/widget/TabPageIndicator;->access$600(Lcom/rey/material/widget/TabPageIndicator;)I

    move-result v10

    if-nez v10, :cond_5d

    .line 568
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 569
    .local v9, "ws":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1a
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v10

    if-ge v5, v10, :cond_37

    .line 570
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 571
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0, v9, p2}, Landroid/view/View;->measure(II)V

    .line 572
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v6, v10

    .line 573
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    invoke-static {v3, v10}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 569
    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    .line 575
    .end local v0    # "child":Landroid/view/View;
    :cond_37
    invoke-virtual {p0, v6, v3}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->setMeasuredDimension(II)V

    .line 617
    .end local v9    # "ws":I
    :goto_3a
    invoke-static {v3, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 618
    .local v4, "hs":I
    const/4 v5, 0x0

    :goto_3f
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v10

    if-ge v5, v10, :cond_f0

    .line 619
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 620
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    if-eq v10, v3, :cond_5a

    .line 621
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v0, v10, v4}, Landroid/view/View;->measure(II)V

    .line 618
    :cond_5a
    add-int/lit8 v5, v5, 0x1

    goto :goto_3f

    .line 578
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "hs":I
    .end local v5    # "i":I
    :cond_5d
    if-eq v7, v11, :cond_b8

    .line 579
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 580
    .restart local v9    # "ws":I
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_64
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v10

    if-ge v5, v10, :cond_81

    .line 581
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 582
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0, v9, p2}, Landroid/view/View;->measure(II)V

    .line 583
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v6, v10

    .line 584
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    invoke-static {v3, v10}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 580
    add-int/lit8 v5, v5, 0x1

    goto :goto_64

    .line 587
    .end local v0    # "child":Landroid/view/View;
    :cond_81
    if-eqz v7, :cond_85

    if-ge v6, v8, :cond_89

    .line 588
    :cond_85
    invoke-virtual {p0, v8, v3}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->setMeasuredDimension(II)V

    goto :goto_3a

    .line 590
    :cond_89
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v2

    .line 591
    .local v2, "count":I
    if-nez v2, :cond_a4

    .line 592
    .local v1, "childWidth":I
    :goto_8f
    const/4 v5, 0x0

    :goto_90
    if-ge v5, v2, :cond_b4

    .line 593
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 594
    .restart local v0    # "child":Landroid/view/View;
    add-int/lit8 v10, v2, -0x1

    if-eq v5, v10, :cond_a7

    .line 595
    invoke-static {v1, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v0, v10, p2}, Landroid/view/View;->measure(II)V

    .line 592
    :goto_a1
    add-int/lit8 v5, v5, 0x1

    goto :goto_90

    .line 591
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childWidth":I
    :cond_a4
    div-int v1, v8, v2

    goto :goto_8f

    .line 597
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childWidth":I
    :cond_a7
    add-int/lit8 v10, v2, -0x1

    mul-int/2addr v10, v1

    sub-int v10, v8, v10

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v0, v10, p2}, Landroid/view/View;->measure(II)V

    goto :goto_a1

    .line 599
    .end local v0    # "child":Landroid/view/View;
    :cond_b4
    invoke-virtual {p0, v8, v3}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->setMeasuredDimension(II)V

    goto :goto_3a

    .line 603
    .end local v1    # "childWidth":I
    .end local v2    # "count":I
    .end local v5    # "i":I
    .end local v9    # "ws":I
    :cond_b8
    invoke-virtual {p0}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildCount()I

    move-result v2

    .line 604
    .restart local v2    # "count":I
    if-nez v2, :cond_db

    .line 605
    .restart local v1    # "childWidth":I
    :goto_be
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_bf
    if-ge v5, v2, :cond_eb

    .line 606
    invoke-virtual {p0, v5}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 607
    .restart local v0    # "child":Landroid/view/View;
    add-int/lit8 v10, v2, -0x1

    if-eq v5, v10, :cond_de

    .line 608
    invoke-static {v1, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v0, v10, p2}, Landroid/view/View;->measure(II)V

    .line 611
    :goto_d0
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    invoke-static {v3, v10}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 605
    add-int/lit8 v5, v5, 0x1

    goto :goto_bf

    .line 604
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childWidth":I
    .end local v5    # "i":I
    :cond_db
    div-int v1, v8, v2

    goto :goto_be

    .line 610
    .restart local v0    # "child":Landroid/view/View;
    .restart local v1    # "childWidth":I
    .restart local v5    # "i":I
    :cond_de
    add-int/lit8 v10, v2, -0x1

    mul-int/2addr v10, v1

    sub-int v10, v8, v10

    invoke-static {v10, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-virtual {v0, v10, p2}, Landroid/view/View;->measure(II)V

    goto :goto_d0

    .line 613
    .end local v0    # "child":Landroid/view/View;
    :cond_eb
    invoke-virtual {p0, v8, v3}, Lcom/rey/material/widget/TabPageIndicator$TabContainerLayout;->setMeasuredDimension(II)V

    goto/16 :goto_3a

    .line 623
    .end local v1    # "childWidth":I
    .end local v2    # "count":I
    .restart local v4    # "hs":I
    :cond_f0
    return-void
.end method
