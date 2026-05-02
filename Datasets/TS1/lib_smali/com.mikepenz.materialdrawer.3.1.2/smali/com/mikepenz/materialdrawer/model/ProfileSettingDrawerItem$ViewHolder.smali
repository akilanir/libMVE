.class Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;
.super Ljava/lang/Object;
.source "ProfileSettingDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private icon:Landroid/widget/ImageView;

.field private name:Landroid/widget/TextView;

.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 396
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 397
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->view:Landroid/view/View;

    .line 398
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->icon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 399
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->name:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 400
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$1;

    .prologue
    .line 391
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    .prologue
    .line 391
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    .prologue
    .line 391
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->name:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;

    .prologue
    .line 391
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ProfileSettingDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    return-object v0
.end method
