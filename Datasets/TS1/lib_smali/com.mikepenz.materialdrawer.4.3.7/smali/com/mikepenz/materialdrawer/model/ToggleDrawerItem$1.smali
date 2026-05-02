.class Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;
.super Ljava/lang/Object;
.source "ToggleDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

.field final synthetic val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    const/4 v1, 0x0

    .line 92
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isSelectable()Z

    move-result v0

    if-nez v0, :cond_26

    .line 93
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->access$100(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Z

    move-result v0

    if-nez v0, :cond_27

    const/4 v0, 0x1

    :goto_14
    # setter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z
    invoke-static {v2, v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->access$102(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Z)Z

    .line 94
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v0

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->access$100(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 97
    :cond_26
    return v1

    :cond_27
    move v0, v1

    .line 93
    goto :goto_14
.end method
