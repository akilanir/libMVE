.class Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "PreferenceFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v14/preference/PreferenceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DividerDecoration"
.end annotation


# instance fields
.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerHeight:I

.field final synthetic this$0:Landroid/support/v14/preference/PreferenceFragment;


# direct methods
.method private constructor <init>(Landroid/support/v14/preference/PreferenceFragment;)V
    .registers 2

    .prologue
    .line 631
    iput-object p1, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->this$0:Landroid/support/v14/preference/PreferenceFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v14/preference/PreferenceFragment;Landroid/support/v14/preference/PreferenceFragment$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v14/preference/PreferenceFragment;
    .param p2, "x1"    # Landroid/support/v14/preference/PreferenceFragment$1;

    .prologue
    .line 631
    invoke-direct {p0, p1}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;-><init>(Landroid/support/v14/preference/PreferenceFragment;)V

    return-void
.end method

.method private shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z
    .registers 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 670
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 671
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
    .line 676
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/PreferenceViewHolder;

    .line 678
    .local v0, "holder":Landroid/support/v7/preference/PreferenceViewHolder;
    const/4 v2, 0x1

    .line 679
    .local v2, "nextAllowed":Z
    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 680
    .local v1, "index":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v1, v5, :cond_23

    .line 681
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p2, v5}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 682
    .local v4, "nextView":Landroid/view/View;
    invoke-virtual {p2, v4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    check-cast v3, Landroid/support/v7/preference/PreferenceViewHolder;

    .line 684
    .local v3, "nextHolder":Landroid/support/v7/preference/PreferenceViewHolder;
    invoke-virtual {v3}, Landroid/support/v7/preference/PreferenceViewHolder;->isDividerAllowedAbove()Z

    move-result v2

    .line 686
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
    .line 661
    invoke-direct {p0, p2, p3}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 662
    iget v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    .line 664
    :cond_a
    invoke-direct {p0, p2, p3}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->shouldDrawDividerBelow(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 665
    iget v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 667
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

    .line 638
    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    if-nez v5, :cond_6

    .line 656
    :cond_5
    return-void

    .line 641
    :cond_6
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 642
    .local v0, "childCount":I
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v4

    .line 643
    .local v4, "width":I
    const/4 v1, 0x0

    .local v1, "childViewIndex":I
    :goto_f
    if-ge v1, v0, :cond_5

    .line 644
    invoke-virtual {p2, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 645
    .local v3, "view":Landroid/view/View;
    invoke-direct {p0, v3, p2}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->shouldDrawDividerAbove(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 646
    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getY(Landroid/view/View;)F

    move-result v5

    float-to-int v2, v5

    .line 647
    .local v2, "top":I
    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    iget v6, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    add-int/2addr v6, v2

    invoke-virtual {v5, v7, v2, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 648
    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 650
    .end local v2    # "top":I
    :cond_2d
    invoke-direct {p0, v3, p2}, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->shouldDrawDividerBelow(Landroid/view/View;Landroid/support/v7/widget/RecyclerView;)Z

    move-result v5

    if-eqz v5, :cond_4b

    .line 651
    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getY(Landroid/view/View;)F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int v2, v5, v6

    .line 652
    .restart local v2    # "top":I
    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    iget v6, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    add-int/2addr v6, v2

    invoke-virtual {v5, v7, v2, v4, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 653
    iget-object v5, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 643
    .end local v2    # "top":I
    :cond_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method public setDivider(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 690
    if-eqz p1, :cond_14

    .line 691
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    .line 695
    :goto_8
    iput-object p1, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 696
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->this$0:Landroid/support/v14/preference/PreferenceFragment;

    # getter for: Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v14/preference/PreferenceFragment;->access$200(Landroid/support/v14/preference/PreferenceFragment;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    .line 697
    return-void

    .line 693
    :cond_14
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    goto :goto_8
.end method

.method public setDividerHeight(I)V
    .registers 3
    .param p1, "dividerHeight"    # I

    .prologue
    .line 700
    iput p1, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->mDividerHeight:I

    .line 701
    iget-object v0, p0, Landroid/support/v14/preference/PreferenceFragment$DividerDecoration;->this$0:Landroid/support/v14/preference/PreferenceFragment;

    # getter for: Landroid/support/v14/preference/PreferenceFragment;->mList:Landroid/support/v7/widget/RecyclerView;
    invoke-static {v0}, Landroid/support/v14/preference/PreferenceFragment;->access$200(Landroid/support/v14/preference/PreferenceFragment;)Landroid/support/v7/widget/RecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    .line 702
    return-void
.end method
