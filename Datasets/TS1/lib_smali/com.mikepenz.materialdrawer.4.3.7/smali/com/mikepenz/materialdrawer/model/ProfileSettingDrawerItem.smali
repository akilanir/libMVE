.class public Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "ProfileSettingDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
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
.field private email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field private icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

.field private iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private iconTinted:Z

.field private name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field private selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 250
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 11
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 203
    iget-object v5, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .local v1, "ctx":Landroid/content/Context;
    move-object v4, p1

    .line 206
    check-cast v4, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    .line 209
    .local v4, "viewHolder":Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
    iget-object v5, v4, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIdentifier()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setId(I)V

    .line 212
    iget-object v5, v4, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->isSelected()Z

    move-result v6

    invoke-virtual {v5, v6}, Landroid/view/View;->setSelected(Z)V

    .line 215
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v5, v1, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v3

    .line 217
    .local v3, "selectedColor":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v5, v1, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v0

    .line 218
    .local v0, "color":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v5, v1, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v2

    .line 220
    .local v2, "iconColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v5

    invoke-static {v1, v3}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 222
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v5

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 223
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 225
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v5

    if-eqz v5, :cond_6d

    .line 226
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 230
    :cond_6d
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v6

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->isIconTinted()Z

    move-result v7

    const/4 v8, 0x2

    invoke-static {v5, v6, v2, v7, v8}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyDecidedIconOrSetGone(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;IZI)V

    .line 233
    # getter for: Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v4}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v5

    invoke-static {v5}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->setDrawerVerticalPadding(Landroid/view/View;)V

    .line 236
    iget-object v5, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v5}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 237
    return-void
.end method

.method public getDescription()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 241
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    return-object v0
.end method

.method public getIconColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 198
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_profile_setting:I

    return v0
.end method

.method public getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    const-string v0, "PROFILE_SETTING_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isIconTinted()Z
    .registers 2

    .prologue
    .line 156
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 187
    const/4 v0, 0x0

    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 183
    return-void
.end method

.method public setIconTinted(Z)V
    .registers 2
    .param p1, "iconTinted"    # Z

    .prologue
    .line 160
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 161
    return-void
.end method

.method public withDescription(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 88
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 89
    return-object p0
.end method

.method public withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 94
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->email:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 95
    return-object p0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIcon(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 54
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 55
    return-object p0
.end method

.method public withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 60
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 61
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 48
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 49
    return-object p0
.end method

.method public withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 78
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 79
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "iicon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 66
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Lcom/mikepenz/iconics/typeface/IIcon;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 67
    return-object p0
.end method

.method public withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 72
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

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
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIconColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "iconColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 119
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 120
    return-object p0
.end method

.method public withIconColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "iconColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 124
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 125
    return-object p0
.end method

.method public withIconTinted(Z)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "iconTinted"    # Z

    .prologue
    .line 134
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->iconTinted:Z

    .line 135
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 84
    return-object p0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withSelectedColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "selectedColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 99
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 100
    return-object p0
.end method

.method public withSelectedColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "selectedColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 104
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->selectedColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 105
    return-object p0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 109
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 110
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 3
    .param p1, "textColorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 114
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 115
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 130
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;

    move-result-object v0

    return-object v0
.end method
