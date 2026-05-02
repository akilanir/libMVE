.class Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;
.super Ljava/lang/Object;
.source "SecondaryToggleDrawerItem.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 128
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_21

    .line 129
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    # setter for: Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->checked:Z
    invoke-static {v0, p2}, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->access$102(Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;Z)Z

    .line 130
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 131
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    move-result-object v0

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    invoke-interface {v0, v1, p1, p2}, Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;->onCheckedChanged(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/widget/CompoundButton;Z)V

    .line 138
    :cond_20
    :goto_20
    return-void

    .line 134
    :cond_21
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 135
    if-nez p2, :cond_35

    const/4 v0, 0x1

    :goto_28
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 136
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem$2;->this$0:Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;

    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryToggleDrawerItem;)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_20

    .line 135
    :cond_35
    const/4 v0, 0x0

    goto :goto_28
.end method
