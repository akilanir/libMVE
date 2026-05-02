.class public Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "ProfileDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
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
.field protected email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field protected icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

.field protected name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field protected nameShown:Z

.field protected selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field protected typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 236
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 9
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 169
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .local v1, "ctx":Landroid/content/Context;
    move-object v3, p1

    .line 172
    check-cast v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .line 175
    .local v3, "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
    iget-object v4, v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIdentifier()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 178
    iget-object v4, v3, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->isSelected()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setSelected(Z)V

    .line 181
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v6, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v4, v1, v5, v6}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v2

    .line 183
    .local v2, "selectedColor":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v6, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v4, v1, v5, v6}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .line 185
    .local v0, "color":I
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 187
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-eqz v4, :cond_c7

    .line 188
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 189
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 197
    :goto_55
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-nez v4, :cond_d1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    if-nez v4, :cond_d1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    if-eqz v4, :cond_d1

    .line 198
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 203
    :goto_70
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    if-eqz v4, :cond_8c

    .line 204
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 205
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 208
    :cond_8c
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    if-eqz v4, :cond_97

    .line 209
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 211
    :cond_97
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 214
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->getInstance()Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader;->cancelImage(Landroid/widget/ImageView;)V

    .line 216
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v5

    sget-object v6, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->PROFILE_DRAWER_ITEM:Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;

    invoke-virtual {v6}, Lcom/mikepenz/materialdrawer/util/DrawerImageLoader$Tags;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyToOrSetInvisible(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 219
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->setDrawerVerticalPadding(Landroid/view/View;)V

    .line 222
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v4}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 223
    return-void

    .line 191
    :cond_c7
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_55

    .line 200
    :cond_d1
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v4

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    goto :goto_70
.end method

.method public getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 227
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 164
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_profile:I

    return v0
.end method

.method public getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 158
    const-string v0, "PROFILE_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isNameShown()Z
    .registers 2

    .prologue
    .line 123
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    return v0
.end method

.method public setNameShown(Z)V
    .registers 2
    .param p1, "nameShown"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 128
    return-void
.end method

.method public withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 88
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 89
    return-object p0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIcon(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 54
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 55
    return-object p0
.end method

.method public withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "iconBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 60
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 61
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 48
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 49
    return-object p0
.end method

.method public withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 78
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 79
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 66
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Lcom/mikepenz/iconics/typeface/IIcon;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 67
    return-object p0
.end method

.method public withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 72
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 73
    return-object p0
.end method

.method public bridge synthetic withIcon(I)Ljava/lang/Object;
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 84
    return-object p0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withNameShown(Z)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "nameShown"    # Z

    .prologue
    .line 93
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->nameShown:Z

    .line 94
    return-object p0
.end method

.method public withSelectedColor(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "selectedColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 98
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 99
    return-object p0
.end method

.method public withSelectedColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "selectedColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 103
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 104
    return-object p0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 108
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 109
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 3
    .param p1, "textColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 113
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 114
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 119
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method
