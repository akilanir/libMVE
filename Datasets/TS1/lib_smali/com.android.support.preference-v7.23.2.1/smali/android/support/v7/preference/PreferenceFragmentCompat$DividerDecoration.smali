.class Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "PreferenceFragmentCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/preference/PreferenceFragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DividerDecoration"
.end annotation


# instance fields
.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerHeight:I

.field final synthetic this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;


# direct methods
.method private constructor <init>(Landroid/support/v7/preference/PreferenceFragmentCompat;)V
    .registers 2

    .prologue
    .line 623
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/preference/PreferenceFragmentCompat;Landroid/support/v7/preference/PreferenceFragmentCompat$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/preference/PreferenceFragmentCompat;
    .param p2, "x1"    # Landroid/support/v7/preference/PreferenceFragmentCompat$1;

    .prologue
    .line 623
    invoke-direct {p0, p1}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;-><init>(Landroid/support/v7/preference/PreferenceFragmentCompat;)V

    return-void
.end method

.method private shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 662
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 663
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    if-nez v1, :cond_14

    check-cast v0, Landroid/support/v7/preference/PreferenceViewHolder;

    .end local v0    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceViewHolder;->isDividerAllowedAbove()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 v1, 0x1

    :goto_13
    return v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private shouldDrawDividerBelow(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z
    .registers 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 668
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/PreferenceViewHolder;

    .line 670
    .local v0, "holder":Landroid/support/v7/preference/PreferenceViewHolder;
    const/4 v2, 0x1

    .line 671
    .local v2, "nextAllowed":Z
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 672
    .local v1, "index":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v1, v5, :cond_23

    .line 673
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p2, v5}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 674
    .local v4, "nextView":Landroid/view/View;
    invoke-virtual {p2, v4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    check-cast v3, Landroid/support/v7/preference/PreferenceViewHolder;

    .line 676
    .local v3, "nextHolder":Landroid/support/v7/preference/PreferenceViewHolder;
    invoke-virtual {v3}, Landroid/support/v7/preference/PreferenceViewHolder;->isDividerAllowedAbove()Z

    move-result v2

    .line 678
    .end local v3    # "nextHolder":Landroid/support/v7/preference/PreferenceViewHolder;
    .end local v4    # "nextView":Landroid/view/View;
    :cond_23
    if-eqz v2, :cond_2d

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceViewHolder;->isDividerAllowedBelow()Z

    move-result v5

    if-eqz v5, :cond_2d

    const/4 v5, 0x1

    :goto_2c
    return v5

    :cond_2d
    const/4 v5, 0x0

    goto :goto_2c
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 6
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 653
    invoke-direct {p0, p2, p3}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 654
    iget v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 656
    :cond_a
    invoke-direct {p0, p2, p3}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->shouldDrawDividerBelow(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 657
    iget v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 659
    :cond_14
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v7, 0x0

    .line 630
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_6

    .line 648
    :cond_5
    return-void

    .line 633
    :cond_6
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 634
    .local v0, "childCount":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    .line 635
    .local v4, "width":I
    const/4 v1, 0x0

    .local v1, "childViewIndex":I
    :goto_f
    if-ge v1, v0, :cond_5

    .line 636
    invoke-virtual {p2, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 637
    .local v3, "view":Landroid/view/View;
    invoke-direct {p0, v3, p2}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 638
    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getY(Landroid/view/View;)F

    move-result v5

    float-to-int v2, v5

    .line 639
    .local v2, "top":I
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    iget v6, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    add-int/2addr v6, v2

    invoke-virtual {v5, v7, v2, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 640
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 642
    .end local v2    # "top":I
    :cond_2d
    invoke-direct {p0, v3, p2}, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->shouldDrawDividerBelow(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 643
    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getY(Landroid/view/View;)F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int v2, v5, v6

    .line 644
    .restart local v2    # "top":I
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    iget v6, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    add-int/2addr v6, v2

    invoke-virtual {v5, v7, v2, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 645
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 635
    .end local v2    # "top":I
    :cond_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 682
    if-eqz p1, :cond_14

    .line 683
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    .line 687
    :goto_8
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 688
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;

    # getter for: Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->access$200(Landroid/support/v7/preference/PreferenceFragmentCompat;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    .line 689
    return-void

    .line 685
    :cond_14
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    goto :goto_8
.end method

.method public setDividerHeight(I)V
    .registers 3
    .param p1, "dividerHeight"    # I

    .prologue
    .line 692
    iput p1, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->mDividerHeight:I

    .line 693
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceFragmentCompat$DividerDecoration;->this$0:Landroid/support/v7/preference/PreferenceFragmentCompat;

    # getter for: Landroid/support/v7/preference/PreferenceFragmentCompat;->mList:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v7/preference/PreferenceFragmentCompat;->access$200(Landroid/support/v7/preference/PreferenceFragmentCompat;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    .line 694
    return-void
.end method
