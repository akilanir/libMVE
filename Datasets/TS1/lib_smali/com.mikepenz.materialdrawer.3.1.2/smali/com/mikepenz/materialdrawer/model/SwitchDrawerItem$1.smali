.class Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;
.super Ljava/lang/Object;
.source "SwitchDrawerItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
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
    .line 178
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 181
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->switchEnabled:Z
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->access$400(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 182
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v1

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 184
    :cond_1e
    return-void

    .line 182
    :cond_1f
    const/4 v0, 0x0

    goto :goto_1b
.end method
