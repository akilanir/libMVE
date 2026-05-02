.class public Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "MiniProfileDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile",
        "<",
        "Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field protected icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;)V
    .registers 3
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 30
    iget-object v0, p1, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 31
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 108
    move-object v0, p1

    check-cast v0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;

    .line 111
    .local v0, "viewHolder":Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;
    iget-object v1, v0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->getIdentifier()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    .line 114
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    move-result-object v1

    # getter for: Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyToOrSetInvisible(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;)V

    .line 117
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 118
    return-void
.end method

.method public getEmail()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 122
    new-instance v0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getIcon()Lcom/mikepenz/materialdrawer/holder/ImageHolder;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 102
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_mini_profile:I

    return v0
.end method

.method public getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    const-string v0, "MINI_PROFILE_ITEM"

    return-object v0
.end method

.method public withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "email"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic withEmail(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withEmail(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withIcon(I)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "iconRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 61
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 62
    return-object p0
.end method

.method public withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "iconBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 67
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 68
    return-object p0
.end method

.method public withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 55
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 56
    return-object p0
.end method

.method public withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 79
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 80
    return-object p0
.end method

.method public withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 85
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Lcom/mikepenz/iconics/typeface/IIcon;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 86
    return-object p0
.end method

.method public withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->icon:Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .line 74
    return-object p0
.end method

.method public bridge synthetic withIcon(I)Ljava/lang/Object;
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(I)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(Landroid/graphics/Bitmap;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Landroid/net/Uri;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(Landroid/net/Uri;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withIcon(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withIcon(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;

    move-result-object v0

    return-object v0
.end method
