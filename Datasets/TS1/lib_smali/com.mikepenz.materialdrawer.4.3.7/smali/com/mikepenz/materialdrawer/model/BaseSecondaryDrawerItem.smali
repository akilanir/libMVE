.class public abstract Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "BaseSecondaryDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;
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
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 125
    return-void
.end method


# virtual methods
.method protected bindViewHelper(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)V
    .registers 15
    .param p1, "viewHolder"    # Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;

    .prologue
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    const/4 v12, 0x1

    .line 79
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    .line 82
    .local v7, "ctx":Landroid/content/Context;
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getIdentifier()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 85
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->isSelected()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setSelected(Z)V

    .line 88
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getSelectedColor(Landroid/content/Context;)I

    move-result v8

    .line 90
    .local v8, "selectedColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getColor(Landroid/content/Context;)I

    move-result v6

    .line 91
    .local v6, "color":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getSelectedTextColor(Landroid/content/Context;)I

    move-result v9

    .line 93
    .local v9, "selectedTextColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getIconColor(Landroid/content/Context;)I

    move-result v1

    .line 94
    .local v1, "iconColor":I
    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getSelectedIconColor(Landroid/content/Context;)I

    move-result v3

    .line 97
    .local v3, "selectedIconColor":I
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->view:Landroid/view/View;

    invoke-static {v7, v8}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 99
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 102
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getDescription()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyToOrHide(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)Z

    .line 105
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {p0, v6, v9}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 108
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getDescriptionTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getColor(Landroid/content/Context;)I

    move-result v10

    invoke-virtual {p0, v7}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getSelectedColor(Landroid/content/Context;)I

    move-result v11

    invoke-virtual {p0, v10, v11}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-static {v4, v5, v10}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOr(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 111
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_84

    .line 112
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 113
    # getter for: Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 117
    :cond_84
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v1, v5, v12}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 118
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getSelectedIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->isIconTinted()Z

    move-result v5

    invoke-static {v4, v7, v3, v5, v12}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->decideIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/content/Context;IZI)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 119
    .local v2, "selectedIcon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->isIconTinted()Z

    move-result v4

    iget-object v5, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->icon:Landroid/widget/ImageView;

    invoke-static/range {v0 .. v5}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyMultiIconTo(Landroid/graphics/drawable/Drawable;ILandroid/graphics/drawable/Drawable;IZLandroid/widget/ImageView;)V

    .line 122
    iget-object v4, p1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->view:Landroid/view/View;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->setDrawerVerticalPadding(Landroid/view/View;)V

    .line 123
    return-void
.end method

.method protected getColor(Landroid/content/Context;)I
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 65
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 66
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_secondary_text:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_secondary_text:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .line 70
    .local v0, "color":I
    :goto_12
    return v0

    .line 68
    .end local v0    # "color":I
    :cond_13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->getDisabledTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .restart local v0    # "color":I
    goto :goto_12
.end method

.method public getDescription()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 48
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getDescriptionTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 52
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

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
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

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
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->description:Lcom/mikepenz/materialdrawer/holder/StringHolder;

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
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

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
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;->descriptionTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 44
    return-object p0
.end method
