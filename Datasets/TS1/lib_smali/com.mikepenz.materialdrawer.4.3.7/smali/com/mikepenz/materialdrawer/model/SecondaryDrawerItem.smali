.class public Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;
.source "SecondaryDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field protected mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field protected mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;-><init>()V

    .line 21
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 106
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 9
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 68
    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .local v1, "ctx":Landroid/content/Context;
    move-object v2, p1

    .line 71
    check-cast v2, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;

    .local v2, "viewHolder":Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;
    move-object v3, p1

    .line 74
    check-cast v3, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;

    invoke-virtual {p0, v3}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->bindViewHelper(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)V

    .line 77
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyToOrHide(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)Z

    move-result v0

    .line 79
    .local v0, "badgeVisible":Z
    if-eqz v0, :cond_4f

    .line 80
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getColor(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedTextColor(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->style(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 81
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badgeContainer:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 87
    :goto_38
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-eqz v3, :cond_49

    .line 88
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 92
    :cond_49
    iget-object v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v3}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 93
    return-void

    .line 83
    :cond_4f
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badgeContainer:Landroid/view/View;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_38
.end method

.method public getBadge()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getBadgeStyle()Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    return-object v0
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 97
    new-instance v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 63
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_secondary:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    const-string v0, "SECONDARY_ITEM"

    return-object v0
.end method

.method public withBadge(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 3
    .param p1, "badgeRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 37
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 38
    return-object p0
.end method

.method public withBadge(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 2
    .param p1, "badge"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 26
    return-object p0
.end method

.method public withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 3
    .param p1, "badge"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 32
    return-object p0
.end method

.method public bridge synthetic withBadge(I)Ljava/lang/Object;
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadge(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withBadge(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadge(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withBadge(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withBadgeStyle(Lcom/mikepenz/materialdrawer/holder/BadgeStyle;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 2
    .param p1, "badgeStyle"    # Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 44
    return-object p0
.end method

.method public bridge synthetic withBadgeStyle(Lcom/mikepenz/materialdrawer/holder/BadgeStyle;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadgeStyle(Lcom/mikepenz/materialdrawer/holder/BadgeStyle;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method
