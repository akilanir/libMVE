.class public Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
.super Ljava/lang/Object;
.source "ProfileDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private email:Ljava/lang/String;

.field private enabled:Z

.field private icon:Landroid/graphics/drawable/Drawable;

.field private iconBitmap:Landroid/graphics/Bitmap;

.field private iconUri:Landroid/net/Uri;

.field private identifier:I

.field private name:Ljava/lang/String;

.field private nameShown:Z

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
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->identifier:I

    .line 29
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectable:Z

    .line 30
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 39
    iput-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->enabled:Z

    .line 42
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:I

    .line 43
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColorRes:I

    .line 45
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:I

    .line 46
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColorRes:I

    .line 48
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 350
    return-void
.end method

.method private resetIcons()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 51
    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 52
    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    .line 53
    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    .line 54
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 13
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v8, 0x0

    .line 291
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 294
    .local v1, "ctx":Landroid/content/Context;
    if-nez p2, :cond_c4

    .line 295
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getLayoutRes()I

    move-result v4

    invoke-virtual {p1, v4, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 296
    new-instance v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    const/4 v4, 0x0

    invoke-direct {v3, p2, v4}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$1;)V

    .line 297
    .local v3, "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
    invoke-virtual {p2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 303
    :goto_18
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getSelectedColor()I

    move-result v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getSelectedColorRes()I

    move-result v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v1, v4, v5, v6, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v2

    .line 305
    .local v2, "selectedColor":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTextColor()I

    move-result v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTextColorRes()I

    move-result v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v1, v4, v5, v6, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v0

    .line 307
    .local v0, "color":I
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    invoke-static {v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 309
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-eqz v4, :cond_cc

    .line 310
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 311
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    :goto_59
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-nez v4, :cond_d6

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getEmail()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_d6

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_d6

    .line 320
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 325
    :goto_74
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_90

    .line 326
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 327
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 330
    :cond_90
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-eqz v4, :cond_9b

    .line 331
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 333
    :cond_9b
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 335
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 336
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIconUri()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_e2

    .line 337
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getPlaceHolder(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 338
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 347
    :goto_c3
    return-object p2

    .line 299
    .end local v0    # "color":I
    .end local v2    # "selectedColor":I
    .end local v3    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
    :cond_c4
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .restart local v3    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
    goto/16 :goto_18

    .line 313
    .restart local v0    # "color":I
    .restart local v2    # "selectedColor":I
    :cond_cc
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_59

    .line 322
    :cond_d6
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getEmail()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_74

    .line 339
    :cond_e2
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_f4

    .line 340
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_c3

    .line 341
    :cond_f4
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_106

    .line 342
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIconBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_c3

    .line 344
    :cond_106
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_c3
.end method

.method public getEmail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getIconBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 213
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getIconUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 267
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->identifier:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 286
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_profile:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSelectedColor()I
    .registers 2

    .prologue
    .line 152
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:I

    return v0
.end method

.method public getSelectedColorRes()I
    .registers 2

    .prologue
    .line 160
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColorRes:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 168
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:I

    return v0
.end method

.method public getTextColorRes()I
    .registers 2

    .prologue
    .line 176
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColorRes:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 281
    const-string v0, "PROFILE_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 276
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->enabled:Z

    return v0
.end method

.method public isNameShown()Z
    .registers 2

    .prologue
    .line 144
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 238
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectable:Z

    return v0
.end method

.method public setEmail(Ljava/lang/String;)V
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 262
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->email:Ljava/lang/String;

    .line 263
    return-void
.end method

.method public setEnabled(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 103
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->enabled:Z

    .line 104
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 232
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 233
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 234
    return-void
.end method

.method public setIcon(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 222
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 223
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    .line 224
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 228
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    .line 229
    return-void
.end method

.method public setIconBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "iconBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 218
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    .line 219
    return-void
.end method

.method public setIdentifier(I)V
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 271
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->identifier:I

    .line 272
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->name:Ljava/lang/String;

    .line 255
    return-void
.end method

.method public setNameShown(Z)V
    .registers 2
    .param p1, "nameShown"    # Z

    .prologue
    .line 148
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 149
    return-void
.end method

.method public setSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "selectable"    # Z

    .prologue
    .line 243
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectable:Z

    .line 244
    return-object p0
.end method

.method public bridge synthetic setSelectable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->setSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public setSelectedColor(I)V
    .registers 2
    .param p1, "selectedColor"    # I

    .prologue
    .line 156
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:I

    .line 157
    return-void
.end method

.method public setSelectedColorRes(I)V
    .registers 2
    .param p1, "selectedColorRes"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColorRes:I

    .line 165
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->tag:Ljava/lang/Object;

    .line 201
    return-void
.end method

.method public setTextColor(I)V
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 172
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:I

    .line 173
    return-void
.end method

.method public setTextColorRes(I)V
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 180
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColorRes:I

    .line 181
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 191
    return-void
.end method

.method public withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->email:Ljava/lang/String;

    .line 94
    return-object p0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "iconBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 69
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconBitmap:Landroid/graphics/Bitmap;

    .line 70
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 63
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 64
    return-object p0
.end method

.method public withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 83
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    .line 84
    return-object p0
.end method

.method public withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->resetIcons()V

    .line 76
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->iconUri:Landroid/net/Uri;

    .line 77
    return-object p0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIdentifier(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->identifier:I

    .line 58
    return-object p0
.end method

.method public bridge synthetic withIdentifier(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIdentifier(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->name:Ljava/lang/String;

    .line 89
    return-object p0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withNameShown(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "nameShown"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 109
    return-object p0
.end method

.method public withSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "selectable"    # Z

    .prologue
    .line 134
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectable:Z

    .line 135
    return-object p0
.end method

.method public bridge synthetic withSelectable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withSelectable(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withSelectedColor(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "selectedColor"    # I

    .prologue
    .line 113
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:I

    .line 114
    return-object p0
.end method

.method public withSelectedColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "selectedColorRes"    # I

    .prologue
    .line 118
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColorRes:I

    .line 119
    return-object p0
.end method

.method public withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->tag:Ljava/lang/Object;

    .line 99
    return-object p0
.end method

.method public bridge synthetic withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 123
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:I

    .line 124
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 128
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColorRes:I

    .line 129
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 140
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 25
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method
