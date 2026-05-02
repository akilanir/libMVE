.class Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;
.super Ljava/lang/Object;
.source "SwitchDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private description:Landroid/widget/TextView;

.field private icon:Landroid/widget/ImageView;

.field private name:Landroid/widget/TextView;

.field private switchView:Landroid/support/v7/widget/SwitchCompat;

.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->view:Landroid/view/View;

    .line 235
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->icon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 236
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->name:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 237
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->description:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->description:Landroid/widget/TextView;

    .line 238
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->switchView:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SwitchCompat;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;

    .line 239
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;

    .prologue
    .line 226
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->description:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    return-object v0
.end method
