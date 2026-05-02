.class Lcom/rey/material/widget/TabIndicatorView$Adapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "TabIndicatorView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/widget/TabIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/rey/material/widget/TabIndicatorView$ViewHolder;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field static final TYPE_ICON:I = 0x1

.field static final TYPE_TEXT:I


# instance fields
.field mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

.field mFixedWidth:I

.field mLastFixedWidth:I

.field final synthetic this$0:Lcom/rey/material/widget/TabIndicatorView;


# direct methods
.method constructor <init>(Lcom/rey/material/widget/TabIndicatorView;)V
    .registers 2

    .prologue
    .line 543
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 672
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->getTabIndicatorCount()I

    move-result v0

    goto :goto_5
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 667
    iget-object v0, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->isIconTabIndicator(I)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "x1"    # I

    .prologue
    .line 543
    check-cast p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;

    .end local p1    # "x0":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p1, p2}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->onBindViewHolder(Lcom/rey/material/widget/TabIndicatorView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/rey/material/widget/TabIndicatorView$ViewHolder;I)V
    .registers 11
    .param p1, "holder"    # Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 619
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemViewType(I)I

    move-result v1

    .line 621
    .local v1, "viewType":I
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 622
    .local v0, "params":Landroid/view/ViewGroup$LayoutParams;
    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFixedWidth:I

    if-lez v2, :cond_7f

    .line 623
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne p2, v2, :cond_7c

    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mLastFixedWidth:I

    :goto_1a
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 626
    :goto_1c
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 628
    iget v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->padding:I

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$500(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v5

    if-eq v2, v5, :cond_44

    .line 629
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$500(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    iput v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->padding:I

    .line 630
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$500(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v5

    iget-object v6, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabPadding:I
    invoke-static {v6}, Lcom/rey/material/widget/TabIndicatorView;->access$500(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v6

    invoke-virtual {v2, v5, v4, v6, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 633
    :cond_44
    iget v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->rippleStyle:I

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$600(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v5

    if-eq v2, v5, :cond_78

    .line 634
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$600(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    iput v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->rippleStyle:I

    .line 635
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$600(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    if-lez v2, :cond_78

    .line 636
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v5, Lcom/rey/material/drawable/RippleDrawable$Builder;

    iget-object v6, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v6}, Lcom/rey/material/widget/TabIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabRippleStyle:I
    invoke-static {v7}, Lcom/rey/material/widget/TabIndicatorView;->access$600(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v7

    invoke-direct {v5, v6, v7}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v5}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 639
    :cond_78
    packed-switch v1, :pswitch_data_10a

    .line 663
    :goto_7b
    return-void

    .line 623
    :cond_7c
    iget v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFixedWidth:I

    goto :goto_1a

    .line 625
    :cond_7f
    const/4 v2, -0x2

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    goto :goto_1c

    .line 641
    :pswitch_83
    iget v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textAppearance:I

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$700(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v5

    if-eq v2, v5, :cond_a6

    .line 642
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$700(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    iput v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textAppearance:I

    .line 643
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v5}, Lcom/rey/material/widget/TabIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTextAppearance:I
    invoke-static {v6}, Lcom/rey/material/widget/TabIndicatorView;->access$700(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v6

    invoke-virtual {v2, v5, v6}, Lcom/rey/material/widget/CheckedTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 645
    :cond_a6
    iget-boolean v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->singleLine:Z

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$800(Lcom/rey/material/widget/TabIndicatorView;)Z

    move-result v5

    if-eq v2, v5, :cond_c5

    .line 646
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$800(Lcom/rey/material/widget/TabIndicatorView;)Z

    move-result v2

    iput-boolean v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->singleLine:Z

    .line 647
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mTabSingleLine:Z
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$800(Lcom/rey/material/widget/TabIndicatorView;)Z

    move-result v2

    if-eqz v2, :cond_df

    .line 648
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    .line 655
    :cond_c5
    :goto_c5
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v5, p2}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 656
    iget-object v5, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I
    invoke-static {v2}, Lcom/rey/material/widget/TabIndicatorView;->access$000(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v2

    if-ne p2, v2, :cond_eb

    move v2, v3

    :goto_db
    invoke-virtual {v5, v2}, Lcom/rey/material/widget/CheckedTextView;->setChecked(Z)V

    goto :goto_7b

    .line 650
    :cond_df
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {v2, v4}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    .line 651
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/CheckedTextView;->setMaxLines(I)V

    goto :goto_c5

    :cond_eb
    move v2, v4

    .line 656
    goto :goto_db

    .line 659
    :pswitch_ed
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->iconView:Lcom/rey/material/widget/CheckedImageView;

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v5, p2}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->getIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/CheckedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 660
    iget-object v2, p1, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->iconView:Lcom/rey/material/widget/CheckedImageView;

    iget-object v5, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    # getter for: Lcom/rey/material/widget/TabIndicatorView;->mSelectedPosition:I
    invoke-static {v5}, Lcom/rey/material/widget/TabIndicatorView;->access$000(Lcom/rey/material/widget/TabIndicatorView;)I

    move-result v5

    if-ne p2, v5, :cond_107

    :goto_102
    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CheckedImageView;->setChecked(Z)V

    goto/16 :goto_7b

    :cond_107
    move v3, v4

    goto :goto_102

    .line 639
    nop

    :pswitch_data_10a
    .packed-switch 0x0
        :pswitch_83
        :pswitch_ed
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 677
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;

    .line 678
    .local v0, "holder":Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    iget-object v1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v0}, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->getAdapterPosition()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->onTabIndicatorSelected(I)V

    .line 679
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "x0"    # Landroid/view/ViewGroup;
    .param p2, "x1"    # I

    .prologue
    .line 543
    invoke-virtual {p0, p1, p2}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/rey/material/widget/TabIndicatorView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    .registers 10
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/16 v6, 0x11

    const/4 v5, 0x1

    .line 585
    const/4 v1, 0x0

    .line 586
    .local v1, "v":Landroid/view/View;
    packed-switch p2, :pswitch_data_60

    .line 595
    :goto_7
    new-instance v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;

    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-direct {v0, v2, v1}, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;-><init>(Lcom/rey/material/widget/TabIndicatorView;Landroid/view/View;)V

    .line 596
    .local v0, "holder":Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 597
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 598
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 600
    packed-switch p2, :pswitch_data_68

    .line 614
    :goto_21
    return-object v0

    .line 588
    .end local v0    # "holder":Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    :pswitch_22
    new-instance v1, Lcom/rey/material/widget/CheckedTextView;

    .end local v1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/rey/material/widget/CheckedTextView;-><init>(Landroid/content/Context;)V

    .line 589
    .restart local v1    # "v":Landroid/view/View;
    goto :goto_7

    .line 591
    :pswitch_2c
    new-instance v1, Lcom/rey/material/widget/ImageButton;

    .end local v1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/rey/material/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .restart local v1    # "v":Landroid/view/View;
    goto :goto_7

    .line 602
    .restart local v0    # "holder":Lcom/rey/material/widget/TabIndicatorView$ViewHolder;
    :pswitch_36
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CheckedTextView;->setCheckMarkDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 603
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v6, :cond_45

    .line 604
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/CheckedTextView;->setTextAlignment(I)V

    .line 605
    :cond_45
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {v2, v6}, Lcom/rey/material/widget/CheckedTextView;->setGravity(I)V

    .line 606
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CheckedTextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 607
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->textView:Lcom/rey/material/widget/CheckedTextView;

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/CheckedTextView;->setSingleLine(Z)V

    goto :goto_21

    .line 610
    :pswitch_57
    iget-object v2, v0, Lcom/rey/material/widget/TabIndicatorView$ViewHolder;->iconView:Lcom/rey/material/widget/CheckedImageView;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/CheckedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    goto :goto_21

    .line 586
    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_22
        :pswitch_2c
    .end packed-switch

    .line 600
    :pswitch_data_68
    .packed-switch 0x0
        :pswitch_36
        :pswitch_57
    .end packed-switch
.end method

.method public setFactory(Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;)V
    .registers 7
    .param p1, "factory"    # Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    .prologue
    const/4 v4, 0x0

    .line 554
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    if-eqz v2, :cond_b

    .line 555
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->setTabIndicatorView(Lcom/rey/material/widget/TabIndicatorView;)V

    .line 557
    :cond_b
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v1

    .line 558
    .local v1, "prevCount":I
    if-lez v1, :cond_14

    .line 559
    invoke-virtual {p0, v4, v1}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->notifyItemRangeRemoved(II)V

    .line 561
    :cond_14
    iput-object p1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    .line 562
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    if-eqz v2, :cond_21

    .line 563
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    iget-object v3, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->setTabIndicatorView(Lcom/rey/material/widget/TabIndicatorView;)V

    .line 564
    :cond_21
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v0

    .line 565
    .local v0, "count":I
    if-lez v0, :cond_2a

    .line 566
    invoke-virtual {p0, v4, v0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->notifyItemRangeInserted(II)V

    .line 568
    :cond_2a
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    if-eqz v2, :cond_39

    .line 569
    iget-object v2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->this$0:Lcom/rey/material/widget/TabIndicatorView;

    iget-object v3, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFactory:Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;

    invoke-virtual {v3}, Lcom/rey/material/widget/TabIndicatorView$TabIndicatorFactory;->getCurrentTabIndicator()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/rey/material/widget/TabIndicatorView;->onTabSelected(I)V

    .line 570
    :cond_39
    return-void
.end method

.method public setFixedWidth(II)V
    .registers 5
    .param p1, "width"    # I
    .param p2, "lastWidth"    # I

    .prologue
    .line 573
    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFixedWidth:I

    if-ne v1, p1, :cond_8

    iget v1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mLastFixedWidth:I

    if-eq v1, p2, :cond_16

    .line 574
    :cond_8
    iput p1, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mFixedWidth:I

    .line 575
    iput p2, p0, Lcom/rey/material/widget/TabIndicatorView$Adapter;->mLastFixedWidth:I

    .line 577
    invoke-virtual {p0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->getItemCount()I

    move-result v0

    .line 578
    .local v0, "count":I
    if-lez v0, :cond_16

    .line 579
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/rey/material/widget/TabIndicatorView$Adapter;->notifyItemRangeChanged(II)V

    .line 581
    .end local v0    # "count":I
    :cond_16
    return-void
.end method
