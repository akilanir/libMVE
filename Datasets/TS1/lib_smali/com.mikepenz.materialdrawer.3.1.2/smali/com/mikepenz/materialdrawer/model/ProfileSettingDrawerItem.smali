.class public Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
.super Ljava/lang/Object;
.source "ProfileSettingDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private email:Ljava/lang/String;

.field private enabled:Z

.field private icon:Landroid/graphics/drawable/Drawable;

.field private iconBitmap:Landroid/graphics/Bitmap;

.field private iconColor:I

.field private iconColorRes:I

.field private iconTinted:Z

.field private iconUri:Landroid/net/Uri;

.field private identifier:I

.field private iicon:Lcom/mikepenz/iconics/typeface/IIcon;

.field private name:Ljava/lang/String;

.field private selectable:Z

.field private selectedColor:I

.field private selectedColorRes:I

.field private tag:Ljava/lang/Object;

.field private textColor:I

.field private textColorRes:I

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->identifier:I

    .line 32
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectable:Z

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->enabled:Z

    .line 45
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 47
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:I

    .line 48
    iput v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColorRes:I

    .line 50
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:I

    .line 51
    iput v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColorRes:I

    .line 53
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:I

    .line 54
    iput v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColorRes:I

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 391
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, 0x0

    .line 345
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 348
    .local v1, "ctx":Landroid/content/Context;
    if-nez p2, :cond_9e

    .line 349
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getLayoutRes()I

    move-result v5

    invoke-virtual {p1, v5, p3, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 350
    new-instance v4, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    const/4 v5, 0x0

    invoke-direct {v4, p2, v5}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$1;)V

    .line 351
    .local v4, "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
    invoke-virtual {p2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 357
    :goto_18
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getSelectedColor()I

    move-result v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getSelectedColorRes()I

    move-result v6

    sget v7, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v8, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v1, v5, v6, v7, v8}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v3

    .line 359
    .local v3, "selectedColor":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTextColor()I

    move-result v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTextColorRes()I

    move-result v6

    sget v7, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v8, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v1, v5, v6, v7, v8}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v0

    .line 360
    .local v0, "color":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIconColor()I

    move-result v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIconColorRes()I

    move-result v6

    sget v7, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v8, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v1, v5, v6, v7, v8}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v2

    .line 362
    .local v2, "iconColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v5

    invoke-static {v3}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 364
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 367
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    if-eqz v5, :cond_76

    .line 368
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 372
    :cond_76
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_a6

    .line 373
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_8d

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->isIconTinted()Z

    move-result v5

    if-eqz v5, :cond_8d

    .line 374
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v5, v2, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 376
    :cond_8d
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 377
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 388
    :goto_9d
    return-object p2

    .line 353
    .end local v0    # "color":I
    .end local v2    # "iconColor":I
    .end local v3    # "selectedColor":I
    .end local v4    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
    :cond_9e
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    .restart local v4    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
    goto/16 :goto_18

    .line 378
    .restart local v0    # "color":I
    .restart local v2    # "iconColor":I
    .restart local v3    # "selectedColor":I
    :cond_a6
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_bd

    .line 379
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 380
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_9d

    .line 381
    :cond_bd
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v5

    if-eqz v5, :cond_e8

    .line 382
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    new-instance v6, Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v7

    invoke-direct {v6, v1, v7}, Lcom/mikepenz/iconics/IconicsDrawable;-><init>(Landroid/content/Context;Lcom/mikepenz/iconics/typeface/IIcon;)V

    invoke-virtual {v6, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mikepenz/iconics/IconicsDrawable;->actionBarSize()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Lcom/mikepenz/iconics/IconicsDrawable;->paddingDp(I)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 383
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_9d

    .line 385
    :cond_e8
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_9d
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIconBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIconColor()I
    .registers 2

    .prologue
    .line 218
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:I

    return v0
.end method

.method public getIconColorRes()I
    .registers 2

    .prologue
    .line 210
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColorRes:I

    return v0
.end method

.method public getIconUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 261
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 321
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->identifier:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 340
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_profile_setting:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectedColor()I
    .registers 2

    .prologue
    .line 178
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:I

    return v0
.end method

.method public getSelectedColorRes()I
    .registers 2

    .prologue
    .line 186
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColorRes:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 194
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:I

    return v0
.end method

.method public getTextColorRes()I
    .registers 2

    .prologue
    .line 202
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColorRes:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 335
    const-string v0, "PROFILE_SETTING_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 285
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->enabled:Z

    return v0
.end method

.method public isIconTinted()Z
    .registers 2

    .prologue
    .line 276
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 266
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectable:Z

    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 316
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    .line 317
    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 308
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    .line 309
    return-void
.end method

.method public setEnabled(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->enabled:Z

    .line 113
    return-object p0
.end method

.method public setIIcon(Lcom/mikepenz/iconics/typeface/IIcon;)V
    .registers 2
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 248
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 249
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 240
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 241
    return-void
.end method

.method public setIcon(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconUri:Landroid/net/Uri;

    .line 253
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 256
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconUri:Landroid/net/Uri;

    .line 257
    return-void
.end method

.method public setIconBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "iconBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    .line 175
    return-void
.end method

.method public setIconColor(I)V
    .registers 2
    .param p1, "iconColor"    # I

    .prologue
    .line 222
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:I

    .line 223
    return-void
.end method

.method public setIconColorRes(I)V
    .registers 2
    .param p1, "iconColorRes"    # I

    .prologue
    .line 214
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColorRes:I

    .line 215
    return-void
.end method

.method public setIconTinted(Z)V
    .registers 2
    .param p1, "iconTinted"    # Z

    .prologue
    .line 280
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 281
    return-void
.end method

.method public setIdentifier(I)V
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 325
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->identifier:I

    .line 326
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 300
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->name:Ljava/lang/String;

    .line 301
    return-void
.end method

.method public setSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "selectable"    # Z

    .prologue
    .line 271
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectable:Z

    .line 272
    return-object p0
.end method

.method public bridge synthetic setSelectable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->setSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public setSelectedColor(I)V
    .registers 2
    .param p1, "selectedColor"    # I

    .prologue
    .line 182
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:I

    .line 183
    return-void
.end method

.method public setSelectedColorRes(I)V
    .registers 2
    .param p1, "selectedColorRes"    # I

    .prologue
    .line 190
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColorRes:I

    .line 191
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->tag:Ljava/lang/Object;

    .line 233
    return-void
.end method

.method public setTextColor(I)V
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 198
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:I

    .line 199
    return-void
.end method

.method public setTextColorRes(I)V
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 206
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColorRes:I

    .line 207
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 291
    return-void
.end method

.method public withDescription(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    .line 97
    return-object p0
.end method

.method public withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Ljava/lang/String;

    .line 103
    return-object p0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withEnabled(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->enabled:Z

    .line 118
    return-object p0
.end method

.method public withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    .line 70
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 65
    return-object p0
.end method

.method public withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconUri:Landroid/net/Uri;

    .line 87
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iicon:Lcom/mikepenz/iconics/typeface/IIcon;

    .line 75
    return-object p0
.end method

.method public withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 80
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconUri:Landroid/net/Uri;

    .line 81
    return-object p0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIconColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "iconColor"    # I

    .prologue
    .line 142
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:I

    .line 143
    return-object p0
.end method

.method public withIconColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "iconColorRes"    # I

    .prologue
    .line 147
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColorRes:I

    .line 148
    return-object p0
.end method

.method public withIconTinted(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "iconTinted"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 164
    return-object p0
.end method

.method public withIdentifier(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 59
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->identifier:I

    .line 60
    return-object p0
.end method

.method public bridge synthetic withIdentifier(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIdentifier(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->name:Ljava/lang/String;

    .line 92
    return-object p0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "selectable"    # Z

    .prologue
    .line 153
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectable:Z

    .line 154
    return-object p0
.end method

.method public bridge synthetic withSelectable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withSelectedColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "selectedColor"    # I

    .prologue
    .line 122
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:I

    .line 123
    return-object p0
.end method

.method public withSelectedColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "selectedColorRes"    # I

    .prologue
    .line 127
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColorRes:I

    .line 128
    return-object p0
.end method

.method public withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->tag:Ljava/lang/Object;

    .line 108
    return-object p0
.end method

.method public bridge synthetic withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 132
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:I

    .line 133
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColorRes:I

    .line 138
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 159
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method
