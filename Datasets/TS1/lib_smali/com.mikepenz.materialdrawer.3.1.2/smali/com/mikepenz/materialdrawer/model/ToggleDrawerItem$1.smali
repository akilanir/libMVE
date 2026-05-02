.class Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;
.super Ljava/lang/Object;
.source "ToggleDrawerItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
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
    .line 179
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 182
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->this$0:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->access$400(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 183
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v1

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;->val$viewHolder:Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 185
    :cond_1e
    return-void

    .line 183
    :cond_1f
    const/4 v0, 0x0

    goto :goto_1b
.end method
