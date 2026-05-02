.class Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;
.super Ljava/lang/Object;
.source "SecondarySwitchDrawerItem.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 121
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 122
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    # setter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z
    invoke-static {v0, p2}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->access$102(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;Z)Z

    .line 123
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 124
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    invoke-interface {v0, v1, p1, p2}, Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;->onCheckedChanged(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/widget/CompoundButton;Z)V

    .line 131
    :cond_20
    :goto_20
    return-void

    .line 127
    :cond_21
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 128
    if-nez p2, :cond_35

    const/4 v0, 0x1

    :goto_28
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 129
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->access$300(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_20

    .line 128
    :cond_35
    const/4 v0, 0x0

    goto :goto_28
.end method
