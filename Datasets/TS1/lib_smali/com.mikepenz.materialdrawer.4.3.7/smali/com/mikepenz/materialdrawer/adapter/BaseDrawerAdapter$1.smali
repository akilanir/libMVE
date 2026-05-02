.class Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;
.super Ljava/lang/Object;
.source "BaseDrawerAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

.field final synthetic val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 191
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->val$holder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    .line 192
    .local v2, "pos":I
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v3, v2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    .line 195
    .local v1, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v1, :cond_48

    .line 197
    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_48

    .line 198
    instance-of v3, v1, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;

    if-eqz v3, :cond_23

    .line 199
    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isSelectable()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 200
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v3, p1, v2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->handleSelection(Landroid/view/View;I)V

    .line 204
    :cond_23
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    # getter for: Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->access$000(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

    move-result-object v3

    if-eqz v3, :cond_34

    .line 205
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;->this$0:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    # getter for: Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;
    invoke-static {v3}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->access$000(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

    move-result-object v3

    invoke-interface {v3, p1, v2, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;->onClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 209
    :cond_34
    instance-of v3, v1, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;

    if-eqz v3, :cond_48

    move-object v0, v1

    .line 210
    check-cast v0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;

    .line 211
    .local v0, "adi":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v3

    if-eqz v3, :cond_48

    .line 212
    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v3

    invoke-interface {v3, p1, v2, v1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    .line 217
    .end local v0    # "adi":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
    :cond_48
    return-void
.end method
