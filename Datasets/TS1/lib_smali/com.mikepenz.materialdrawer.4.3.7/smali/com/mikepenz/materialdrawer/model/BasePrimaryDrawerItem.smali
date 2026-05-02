.class public abstract Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "BasePrimaryDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field private descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 108
    return-void
.end method


# virtual methods
.method protected bindViewHelper(Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;)V
    .registers 14
    .param p1, "viewHolder"    # Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;

    .prologue
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    const/4 v11, 0x1

    .line 61
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 64
    .local v7, "ctx":Landroid/content/Context;
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getIdentifier()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 67
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->isSelected()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setSelected(Z)V

    .line 70
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 73
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getSelectedColor(Landroid/content/Context;)I

    move-result v8

    .line 75
    .local v8, "selectedColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getColor(Landroid/content/Context;)I

    move-result v6

    .line 76
    .local v6, "color":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getSelectedTextColor(Landroid/content/Context;)I

    move-result v9

    .line 78
    .local v9, "selectedTextColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getIconColor(Landroid/content/Context;)I

    move-result v1

    .line 79
    .local v1, "iconColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getSelectedIconColor(Landroid/content/Context;)I

    move-result v3

    .line 82
    .local v3, "selectedIconColor":I
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->view:Landroid/view/View;

    invoke-static {v7, v8}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 84
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 86
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getDescription()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyToOrHide(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)Z

    .line 89
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {p0, v6, v9}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 91
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getDescriptionTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;

    invoke-virtual {p0, v6, v9}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-static {v4, v5, v10}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOr(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 94
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_7b

    .line 95
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 96
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 100
    :cond_7b
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v1, v5, v11}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 101
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->getSelectedIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v3, v5, v11}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 102
    .local v2, "selectedIcon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->isIconTinted()Z

    move-result v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->icon:Landroid/widget/ImageView;

    invoke-static/range {v0 .. v5}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyMultiIconTo(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;IZLandroid/widget/ImageView;)V

    .line 105
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;->view:Landroid/view/View;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->setDrawerVerticalPadding(Landroid/view/View;)V

    .line 106
    return-void
.end method

.method public getDescription()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 48
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getDescriptionTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 52
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public withDescription(I)Ljava/lang/Object;
    .registers 3
    .param p1, "descriptionRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 34
    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 29
    return-object p0
.end method

.method public withDescriptionTextColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 39
    return-object p0
.end method

.method public withDescriptionTextColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 44
    return-object p0
.end method
