.class Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;
.super Ljava/lang/Object;
.source "SwitchDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

.field final synthetic val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

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

    .line 85
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->isSelectable()Z

    move-result v0

    if-nez v0, :cond_26

    .line 86
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->checked:Z
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->access$100(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;)Z

    move-result v0

    if-nez v0, :cond_27

    const/4 v0, 0x1

    :goto_14
    # setter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->checked:Z
    invoke-static {v2, v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->access$102(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;Z)Z

    .line 87
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v0

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->checked:Z
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->access$100(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 90
    :cond_26
    return v1

    :cond_27
    move v0, v1

    .line 86
    goto :goto_14
.end method
