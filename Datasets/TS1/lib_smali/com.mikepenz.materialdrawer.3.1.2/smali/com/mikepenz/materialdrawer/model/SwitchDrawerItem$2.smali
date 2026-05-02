.class Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;
.super Ljava/lang/Object;
.source "SwitchDrawerItem.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    .prologue
    .line 242
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 245
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    # setter for: Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->checked:Z
    invoke-static {v0, p2}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->access$702(Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;Z)Z

    .line 247
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 248
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;

    invoke-interface {v0, v1, p1, p2}, Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;->onCheckedChanged(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/widget/CompoundButton;Z)V

    .line 250
    :cond_18
    return-void
.end method
