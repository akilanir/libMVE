.class public Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "ContainerDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ItemFactory;,
        Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mView:Landroid/view/View;

.field public mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 35
    sget-object v0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->TOP:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    .line 112
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 10
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v7, -0x1

    .line 59
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "ctx":Landroid/content/Context;
    move-object v3, p1

    .line 62
    check-cast v3, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;

    .line 65
    .local v3, "viewHolder":Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->getIdentifier()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 68
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setEnabled(Z)V

    .line 71
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_30

    .line 72
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 76
    :cond_30
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 78
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 79
    .local v1, "divider":Landroid/view/View;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/view/View;->setMinimumHeight(I)V

    .line 80
    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v0, v4, v5}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v4

    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 82
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v0}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v4

    float-to-int v4, v4

    invoke-direct {v2, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 85
    .local v2, "layoutParams":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    sget-object v5, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->TOP:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    if-ne v4, v5, :cond_86

    .line 86
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    const/4 v6, -0x2

    invoke-virtual {v4, v5, v7, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 87
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_padding:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 88
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    :goto_80
    iget-object v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v4}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 99
    return-void

    .line 89
    :cond_86
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    sget-object v5, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->BOTTOM:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    if-ne v4, v5, :cond_ad

    .line 90
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_padding:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 91
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_80

    .line 94
    :cond_ad
    # getter for: Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_80
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 103
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 54
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_container:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    const-string v0, "CONTAINER_ITEM"

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    return-object v0
.end method

.method public getViewPosition()Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    return-object v0
.end method

.method public withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mView:Landroid/view/View;

    .line 22
    return-object p0
.end method

.method public withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;
    .registers 2
    .param p1, "position"    # Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->mViewPosition:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    .line 39
    return-object p0
.end method
