.class public Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "BaseSecondaryDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "BaseViewHolder"
.end annotation


# instance fields
.field private description:Landroid/widget/TextView;

.field protected icon:Landroid/widget/ImageView;

.field protected name:Landroid/widget/TextView;

.field protected view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 132
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 134
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->view:Landroid/view/View;

    .line 135
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_icon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->icon:Landroid/widget/ImageView;

    .line 136
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_name:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->name:Landroid/widget/TextView;

    .line 137
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_description:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;

    .line 138
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;->description:Landroid/widget/TextView;

    return-object v0
.end method
