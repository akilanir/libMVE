.class Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
.super Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;
.source "ToggleDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private toggle:Landroid/widget/ToggleButton;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 120
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;-><init>(Landroid/view/View;)V

    .line 121
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_toggle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;

    .line 122
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;

    return-object v0
.end method
