.class Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;
.super Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;
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
.field private switchView:Landroid/support/v7/widget/SwitchCompat;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;-><init>(Landroid/view/View;)V

    .line 114
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_switch:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SwitchCompat;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;

    .line 115
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;

    return-object v0
.end method
