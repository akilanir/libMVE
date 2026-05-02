.class Lcom/rey/material/app/SimpleDialog$InternalAdapter;
.super Landroid/widget/BaseAdapter;
.source "SimpleDialog.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/SimpleDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalAdapter"
.end annotation


# instance fields
.field private mItems:[Ljava/lang/CharSequence;

.field private mLastSelectedIndex:I

.field private mSelected:[Z

.field final synthetic this$0:Lcom/rey/material/app/SimpleDialog;


# direct methods
.method private constructor <init>(Lcom/rey/material/app/SimpleDialog;)V
    .registers 2

    .prologue
    .line 450
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/rey/material/app/SimpleDialog;Lcom/rey/material/app/SimpleDialog$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/rey/material/app/SimpleDialog;
    .param p2, "x1"    # Lcom/rey/material/app/SimpleDialog$1;

    .prologue
    .line 450
    invoke-direct {p0, p1}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;-><init>(Lcom/rey/material/app/SimpleDialog;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 525
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    array-length v0, v0

    goto :goto_5
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 530
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    aget-object v0, v0, p1

    goto :goto_9
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 535
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getLastSelectedIndex()I
    .registers 2

    .prologue
    .line 476
    iget v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    return v0
.end method

.method public getLastSelectedValue()Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 480
    iget-object v0, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    iget v1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getSelectedIndexes()[I
    .registers 5

    .prologue
    .line 484
    const/4 v0, 0x0

    .line 485
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v3, v3

    if-ge v1, v3, :cond_12

    .line 486
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v3, v3, v1

    if-eqz v3, :cond_f

    .line 487
    add-int/lit8 v0, v0, 0x1

    .line 485
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 489
    :cond_12
    if-nez v0, :cond_16

    .line 490
    const/4 v2, 0x0

    .line 500
    :cond_15
    return-object v2

    .line 492
    :cond_16
    new-array v2, v0, [I

    .line 493
    .local v2, "result":[I
    const/4 v0, 0x0

    .line 494
    const/4 v1, 0x0

    :goto_1a
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v3, v3

    if-ge v1, v3, :cond_15

    .line 495
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v3, v3, v1

    if-eqz v3, :cond_29

    .line 496
    aput v1, v2, v0

    .line 497
    add-int/lit8 v0, v0, 0x1

    .line 494
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a
.end method

.method public getSelectedValues()[Ljava/lang/CharSequence;
    .registers 5

    .prologue
    .line 504
    const/4 v0, 0x0

    .line 505
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v3, v3

    if-ge v1, v3, :cond_12

    .line 506
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v3, v3, v1

    if-eqz v3, :cond_f

    .line 507
    add-int/lit8 v0, v0, 0x1

    .line 505
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 509
    :cond_12
    if-nez v0, :cond_16

    .line 510
    const/4 v2, 0x0

    .line 520
    :cond_15
    return-object v2

    .line 512
    :cond_16
    new-array v2, v0, [Ljava/lang/CharSequence;

    .line 513
    .local v2, "result":[Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 514
    const/4 v1, 0x0

    :goto_1a
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v3, v3

    if-ge v1, v3, :cond_15

    .line 515
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v3, v3, v1

    if-eqz v3, :cond_2d

    .line 516
    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    aget-object v3, v3, v1

    aput-object v3, v2, v0

    .line 517
    add-int/lit8 v0, v0, 0x1

    .line 514
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v1, 0x3

    .line 540
    move-object v0, p2

    check-cast v0, Lcom/rey/material/widget/CompoundButton;

    .line 541
    .local v0, "v":Lcom/rey/material/widget/CompoundButton;
    if-nez v0, :cond_5e

    .line 542
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mMode:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$300(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    if-ne v2, v1, :cond_7e

    .line 543
    new-instance v0, Lcom/rey/material/widget/CheckBox;

    .end local v0    # "v":Lcom/rey/material/widget/CompoundButton;
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/rey/material/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 544
    .restart local v0    # "v":Lcom/rey/material/widget/CompoundButton;
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mCheckBoxStyle:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$400(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CompoundButton;->applyStyle(I)V

    .line 550
    :goto_20
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mItemHeight:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$200(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    const/4 v3, -0x2

    if-eq v2, v3, :cond_32

    .line 551
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mItemHeight:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$200(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CompoundButton;->setMinHeight(I)V

    .line 552
    :cond_32
    const v2, 0x800013

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CompoundButton;->setGravity(I)V

    .line 553
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_4a

    .line 554
    check-cast p3, Lcom/rey/material/app/SimpleDialog$InternalListView;

    .end local p3    # "parent":Landroid/view/ViewGroup;
    invoke-virtual {p3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->isLayoutRtl()Z

    move-result v2

    if-eqz v2, :cond_47

    const/4 v1, 0x4

    :cond_47
    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CompoundButton;->setTextDirection(I)V

    .line 555
    :cond_4a
    invoke-virtual {v0}, Lcom/rey/material/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mItemTextAppearance:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$600(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/CompoundButton;->setTextAppearance(Landroid/content/Context;I)V

    .line 556
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    iget v1, v1, Lcom/rey/material/app/SimpleDialog;->mContentPadding:I

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CompoundButton;->setCompoundDrawablePadding(I)V

    .line 559
    :cond_5e
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CompoundButton;->setTag(Ljava/lang/Object;)V

    .line 560
    iget-object v1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/CompoundButton;->setText(Ljava/lang/CharSequence;)V

    .line 561
    instance-of v1, v0, Lcom/rey/material/widget/CheckBox;

    if-eqz v1, :cond_91

    move-object v1, v0

    .line 562
    check-cast v1, Lcom/rey/material/widget/CheckBox;

    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v2, v2, p1

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/CheckBox;->setCheckedImmediately(Z)V

    .line 566
    :goto_7a
    invoke-virtual {v0, p0}, Lcom/rey/material/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 568
    return-object v0

    .line 547
    .restart local p3    # "parent":Landroid/view/ViewGroup;
    :cond_7e
    new-instance v0, Lcom/rey/material/widget/RadioButton;

    .end local v0    # "v":Lcom/rey/material/widget/CompoundButton;
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/rey/material/widget/RadioButton;-><init>(Landroid/content/Context;)V

    .line 548
    .restart local v0    # "v":Lcom/rey/material/widget/CompoundButton;
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mRadioButtonStyle:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$500(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/rey/material/widget/CompoundButton;->applyStyle(I)V

    goto :goto_20

    .end local p3    # "parent":Landroid/view/ViewGroup;
    :cond_91
    move-object v1, v0

    .line 564
    check-cast v1, Lcom/rey/material/widget/RadioButton;

    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v2, v2, p1

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/RadioButton;->setCheckedImmediately(Z)V

    goto :goto_7a
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 9
    .param p1, "v"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v5, 0x0

    .line 573
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 574
    .local v1, "position":I
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v2, v2, v1

    if-eq v2, p2, :cond_2a

    .line 575
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aput-boolean p2, v2, v1

    .line 577
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$700(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    move-result-object v2

    if-eqz v2, :cond_2a

    .line 578
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$700(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    move-result-object v2

    iget-object v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    aget-boolean v3, v3, v1

    invoke-interface {v2, v1, v3}, Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;->onSelectionChanged(IZ)V

    .line 581
    :cond_2a
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mMode:I
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$300(Lcom/rey/material/app/SimpleDialog;)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_72

    if-eqz p2, :cond_72

    iget v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    if-eq v2, v1, :cond_72

    .line 582
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    iget v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    aput-boolean v5, v2, v3

    .line 584
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$700(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    move-result-object v2

    if-eqz v2, :cond_52

    .line 585
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mOnSelectionChangedListener:Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$700(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;

    move-result-object v2

    iget v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    invoke-interface {v2, v3, v5}, Lcom/rey/material/app/SimpleDialog$OnSelectionChangedListener;->onSelectionChanged(IZ)V

    .line 587
    :cond_52
    iget-object v2, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;
    invoke-static {v2}, Lcom/rey/material/app/SimpleDialog;->access$800(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$InternalListView;

    move-result-object v2

    iget v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    iget-object v4, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->this$0:Lcom/rey/material/app/SimpleDialog;

    # getter for: Lcom/rey/material/app/SimpleDialog;->mListView:Lcom/rey/material/app/SimpleDialog$InternalListView;
    invoke-static {v4}, Lcom/rey/material/app/SimpleDialog;->access$800(Lcom/rey/material/app/SimpleDialog;)Lcom/rey/material/app/SimpleDialog$InternalListView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getFirstVisiblePosition()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/rey/material/app/SimpleDialog$InternalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/rey/material/widget/CompoundButton;

    .line 588
    .local v0, "child":Lcom/rey/material/widget/CompoundButton;
    if-eqz v0, :cond_70

    .line 589
    invoke-virtual {v0, v5}, Lcom/rey/material/widget/CompoundButton;->setChecked(Z)V

    .line 591
    :cond_70
    iput v1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    .line 593
    .end local v0    # "child":Lcom/rey/material/widget/CompoundButton;
    :cond_72
    return-void
.end method

.method public varargs setItems([Ljava/lang/CharSequence;[I)V
    .registers 10
    .param p1, "items"    # [Ljava/lang/CharSequence;
    .param p2, "selectedIndexes"    # [I

    .prologue
    .line 457
    iput-object p1, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mItems:[Ljava/lang/CharSequence;

    .line 459
    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    if-eqz v5, :cond_c

    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v5, v5

    array-length v6, p1

    if-eq v5, v6, :cond_11

    .line 460
    :cond_c
    array-length v5, p1

    new-array v5, v5, [Z

    iput-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    .line 462
    :cond_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v5, v5

    if-ge v1, v5, :cond_1f

    .line 463
    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    const/4 v6, 0x0

    aput-boolean v6, v5, v1

    .line 462
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 465
    :cond_1f
    if-eqz p2, :cond_39

    .line 466
    move-object v0, p2

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_24
    if-ge v2, v4, :cond_39

    aget v3, v0, v2

    .line 467
    .local v3, "index":I
    if-ltz v3, :cond_36

    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    array-length v5, v5

    if-ge v3, v5, :cond_36

    .line 468
    iget-object v5, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mSelected:[Z

    const/4 v6, 0x1

    aput-boolean v6, v5, v3

    .line 469
    iput v3, p0, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->mLastSelectedIndex:I

    .line 466
    :cond_36
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 472
    .end local v0    # "arr$":[I
    .end local v2    # "i$":I
    .end local v3    # "index":I
    .end local v4    # "len$":I
    :cond_39
    invoke-virtual {p0}, Lcom/rey/material/app/SimpleDialog$InternalAdapter;->notifyDataSetChanged()V

    .line 473
    return-void
.end method
