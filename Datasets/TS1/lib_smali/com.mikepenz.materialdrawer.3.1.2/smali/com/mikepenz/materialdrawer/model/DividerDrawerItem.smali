.class public Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;
.super Ljava/lang/Object;
.source "DividerDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v2, 0x0

    .line 48
    if-nez p2, :cond_3e

    .line 49
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;->getLayoutRes()I

    move-result v1

    invoke-virtual {p1, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 50
    new-instance v0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$1;)V

    .line 51
    .local v0, "viewHolder":Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
    invoke-virtual {p2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 56
    :goto_14
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setClickable(Z)V

    .line 57
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 58
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 61
    # getter for: Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v2, v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 63
    return-object p2

    .line 53
    .end local v0    # "viewHolder":Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
    :cond_3e
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;

    .restart local v0    # "viewHolder":Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
    goto :goto_14
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 22
    const/4 v0, -0x1

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 42
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_divider:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 27
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    const-string v0, "DIVIDER_ITEM"

    return-object v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method
