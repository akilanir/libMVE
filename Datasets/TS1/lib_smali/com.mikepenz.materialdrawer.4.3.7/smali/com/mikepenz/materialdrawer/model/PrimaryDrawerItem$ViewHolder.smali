.class Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;
.super Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;
.source "PrimaryDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private badge:Landroid/widget/TextView;

.field private badgeContainer:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 111
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;-><init>(Landroid/view/View;)V

    .line 112
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_badge_container:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badgeContainer:Landroid/view/View;

    .line 113
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_badge:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;

    .line 114
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badgeContainer:Landroid/view/View;

    return-object v0
.end method
