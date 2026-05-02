.class public abstract Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "BaseDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Iconable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Nameable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Iconable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected colorStateList:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/content/res/ColorStateList;",
            ">;"
        }
    .end annotation
.end field

.field protected disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected disabledTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

.field protected iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected iconTinted:Z

.field protected name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field protected selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

.field protected selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected selectedTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-void
.end method


# virtual methods
.method protected getColor(Landroid/content/Context;)I
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 271
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 272
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .line 276
    .local v0, "color":I
    :goto_12
    return v0

    .line 274
    .end local v0    # "color":I
    :cond_13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getDisabledTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .restart local v0    # "color":I
    goto :goto_12
.end method

.method public getDisabledIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 238
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getDisabledTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 218
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .registers 2

    .prologue
    .line 226
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    return-object v0
.end method

.method public getIconColor(Landroid/content/Context;)I
    .registers 6
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 297
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 298
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .line 302
    .local v0, "iconColor":I
    :goto_12
    return v0

    .line 300
    .end local v0    # "iconColor":I
    :cond_13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getDisabledIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_icon:I

    sget v3, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_icon:I

    invoke-static {v1, p1, v2, v3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .restart local v0    # "iconColor":I
    goto :goto_12
.end method

.method public getIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 246
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 234
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method protected getSelectedColor(Landroid/content/Context;)I
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 260
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v0, p1, v1, v2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 206
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getSelectedIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .registers 2

    .prologue
    .line 230
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    return-object v0
.end method

.method protected getSelectedIconColor(Landroid/content/Context;)I
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 312
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getSelectedIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v0, p1, v1, v2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public getSelectedIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 242
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method protected getSelectedTextColor(Landroid/content/Context;)I
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 286
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->getSelectedTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v2, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v0, p1, v1, v2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    return v0
.end method

.method public getSelectedTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 214
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 210
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method protected getTextColorStateList(II)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "selectedTextColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 323
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->colorStateList:Landroid/util/Pair;

    if-eqz v0, :cond_12

    add-int v1, p1, p2

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->colorStateList:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq v1, v0, :cond_23

    .line 324
    :cond_12
    new-instance v0, Landroid/util/Pair;

    add-int v1, p1, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, p2}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->colorStateList:Landroid/util/Pair;

    .line 327
    :cond_23
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->colorStateList:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 250
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isIconTinted()Z
    .registers 2

    .prologue
    .line 222
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    return v0
.end method

.method public withDisabledIconColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "disabledIconColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 162
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 163
    return-object p0
.end method

.method public withDisabledIconColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "disabledIconColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 167
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 168
    return-object p0
.end method

.method public withDisabledTextColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "disabledTextColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 133
    return-object p0
.end method

.method public withDisabledTextColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "disabledTextColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->disabledTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 138
    return-object p0
.end method

.method public withIcon(I)Ljava/lang/Object;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 60
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 55
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .registers 4
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/iconics/typeface/IIcon;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Lcom/mikepenz/iconics/typeface/IIcon;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 77
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 78
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Lcom/mikepenz/iconics/typeface/IIcon;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 83
    :goto_14
    return-object p0

    .line 80
    :cond_15
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->withIconTintingEnabled(Z)Ljava/lang/Object;

    goto :goto_14
.end method

.method public withIcon(Lcom/mikepenz/materialdrawer/holder/ImageHolder;)Ljava/lang/Object;
    .registers 2
    .param p1, "icon"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/materialdrawer/holder/ImageHolder;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 50
    return-object p0
.end method

.method public withIconColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "iconColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 143
    return-object p0
.end method

.method public withIconColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "iconColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 148
    return-object p0
.end method

.method public withIconTinted(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "iconTinted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 185
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 186
    return-object p0
.end method

.method public withIconTintingEnabled(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "iconTintingEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 179
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->iconTinted:Z

    .line 180
    return-object p0
.end method

.method public withName(I)Ljava/lang/Object;
    .registers 3
    .param p1, "nameRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 98
    return-object p0
.end method

.method public withName(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Ljava/lang/Object;
    .registers 2
    .param p1, "name"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/materialdrawer/holder/StringHolder;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 88
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 93
    return-object p0
.end method

.method public withSelectedColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 103
    return-object p0
.end method

.method public withSelectedColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 107
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 108
    return-object p0
.end method

.method public withSelectedIcon(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedIconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 70
    return-object p0
.end method

.method public withSelectedIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedIcon"    # Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Drawable;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIcon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 65
    return-object p0
.end method

.method public withSelectedIconColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedIconColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 153
    return-object p0
.end method

.method public withSelectedIconColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 157
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedIconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 158
    return-object p0
.end method

.method public withSelectedTextColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedTextColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 123
    return-object p0
.end method

.method public withSelectedTextColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "selectedColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->selectedTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 128
    return-object p0
.end method

.method public withTextColor(I)Ljava/lang/Object;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 113
    return-object p0
.end method

.method public withTextColorRes(I)Ljava/lang/Object;
    .registers 3
    .param p1, "textColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 118
    return-object p0
.end method

.method public withTintSelectedIcon(Z)Ljava/lang/Object;
    .registers 3
    .param p1, "iconTinted"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 197
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->withIconTintingEnabled(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Typeface;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;, "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 202
    return-object p0
.end method
