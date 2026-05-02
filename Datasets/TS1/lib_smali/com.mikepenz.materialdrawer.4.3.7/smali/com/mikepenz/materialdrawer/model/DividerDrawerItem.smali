.class public Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "DividerDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 60
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 7
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v4, 0x0

    .line 29
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "ctx":Landroid/content/Context;
    move-object v1, p1

    .line 32
    check-cast v1, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;

    .line 35
    .local v1, "viewHolder":Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;->getIdentifier()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    .line 38
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setClickable(Z)V

    .line 39
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/view/View;->setEnabled(Z)V

    .line 40
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setMinimumHeight(I)V

    .line 43
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v0, v3, v4}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v2}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 47
    return-void
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 51
    new-instance v0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 24
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_divider:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 18
    const-string v0, "DIVIDER_ITEM"

    return-object v0
.end method
