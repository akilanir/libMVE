.class Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ProfileDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private email:Landroid/widget/TextView;

.field private name:Landroid/widget/TextView;

.field private profileIcon:Landroid/widget/ImageView;

.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 243
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 244
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->view:Landroid/view/View;

    .line 245
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profileIcon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;

    .line 246
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_name:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 247
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_email:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;

    .line 248
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$1;

    .prologue
    .line 236
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->email:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileDrawerItem$ViewHolder;->profileIcon:Landroid/widget/ImageView;

    return-object v0
.end method
