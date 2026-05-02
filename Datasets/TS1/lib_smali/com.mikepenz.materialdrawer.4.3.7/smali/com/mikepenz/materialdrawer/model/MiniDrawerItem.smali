.class public Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "MiniDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field private mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

.field private mEnableSelectedBackground:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 24
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnableSelectedBackground:Z

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;)V
    .registers 3
    .param p1, "primaryDrawerItem"    # Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 24
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnableSelectedBackground:Z

    .line 33
    iget v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mIdentifier:I

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mIdentifier:I

    .line 34
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mTag:Ljava/lang/Object;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mTag:Ljava/lang/Object;

    .line 36
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 37
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 39
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mEnabled:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnabled:Z

    .line 40
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mSelectable:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mSelectable:Z

    .line 41
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->mSelected:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mSelected:Z

    .line 43
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 44
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 46
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->iconTinted:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->iconTinted:Z

    .line 47
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 49
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 50
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 51
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;)V
    .registers 3
    .param p1, "secondaryDrawerItem"    # Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 24
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnableSelectedBackground:Z

    .line 55
    iget v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mIdentifier:I

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mIdentifier:I

    .line 56
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mTag:Ljava/lang/Object;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mTag:Ljava/lang/Object;

    .line 58
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 59
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 61
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mEnabled:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnabled:Z

    .line 62
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mSelectable:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mSelectable:Z

    .line 63
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->mSelected:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mSelected:Z

    .line 65
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 66
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 68
    iget-boolean v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->iconTinted:Z

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->iconTinted:Z

    .line 69
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 71
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 72
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 73
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 74
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 15
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v12, 0x1

    .line 94
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    .local v7, "ctx":Landroid/content/Context;
    move-object v11, p1

    .line 97
    check-cast v11, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;

    .line 100
    .local v11, "viewHolder":Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;
    iget-object v4, v11, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getIdentifier()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 103
    iget-object v4, v11, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->isSelected()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setSelected(Z)V

    .line 106
    iget-object v4, v11, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 109
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getIconColor(Landroid/content/Context;)I

    move-result v1

    .line 110
    .local v1, "iconColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getSelectedIconColor(Landroid/content/Context;)I

    move-result v3

    .line 112
    .local v3, "selectedIconColor":I
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnableSelectedBackground:Z

    if-eqz v4, :cond_3c

    .line 114
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getSelectedColor(Landroid/content/Context;)I

    move-result v8

    .line 116
    .local v8, "selectedColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v11}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    invoke-static {v7, v8}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 120
    .end local v8    # "selectedColor":I
    :cond_3c
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadge:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static {v11}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyToOrHide(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)Z

    move-result v6

    .line 122
    .local v6, "badgeVisible":Z
    if-eqz v6, :cond_51

    .line 123
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mBadgeStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    # getter for: Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static {v11}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->style(Landroid/widget/TextView;)V

    .line 127
    :cond_51
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v1, v5, v12}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 128
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->getSelectedIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v3, v5, v12}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 129
    .local v2, "selectedIcon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->isIconTinted()Z

    move-result v4

    # getter for: Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v11}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-static/range {v0 .. v5}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyMultiIconTo(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;IZLandroid/widget/ImageView;)V

    .line 132
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_padding:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v10

    .line 133
    .local v10, "verticalPadding":I
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$dimen;->material_mini_drawer_item_padding:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    .line 134
    .local v9, "topBottomPadding":I
    iget-object v4, v11, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v10, v9, v10, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 137
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v4}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 138
    return-void
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 142
    new-instance v0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 89
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_mini:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 83
    const-string v0, "MINI_ITEM"

    return-object v0
.end method

.method public withEnableSelectedBackground(Z)Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;
    .registers 2
    .param p1, "enableSelectedBackground"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/MiniDrawerItem;->mEnableSelectedBackground:Z

    .line 78
    return-object p0
.end method
