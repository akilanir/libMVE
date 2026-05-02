.class Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "MiniProfileDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private icon:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 136
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 138
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_icon:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 139
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/MiniProfileDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;

    return-object v0
.end method
