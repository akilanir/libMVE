.class Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;
.super Ljava/lang/Object;
.source "ActionModeHelper.java"

# interfaces
.implements Landroid/support/v7/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActionBarCallBack"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;


# direct methods
.method private constructor <init>(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)V
    .registers 2

    .prologue
    .line 97
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;
    .param p2, "x1"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$1;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;-><init>(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/support/v7/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 101
    const/4 v0, 0x0

    .line 102
    .local v0, "consumed":Z
    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v1

    if-eqz v1, :cond_13

    .line 103
    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/support/v7/view/ActionMode$Callback;->onActionItemClicked(Landroid/support/v7/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result v0

    .line 106
    :cond_13
    if-nez v0, :cond_21

    .line 107
    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$200(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/fastadapter/FastAdapter;->deleteAllSelectedItems()Ljava/util/List;

    .line 109
    invoke-virtual {p1}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 111
    :cond_21
    return v0
.end method

.method public onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    .registers 6
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v0, 0x0

    .line 116
    invoke-virtual {p1}, Landroid/support/v7/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCabMenu:I
    invoke-static {v2}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$300(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)I

    move-result v2

    invoke-virtual {v1, v2, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 119
    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$200(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mikepenz/fastadapter/FastAdapter;->withSelectOnLongClick(Z)Lcom/mikepenz/fastadapter/FastAdapter;

    .line 121
    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v1

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Landroid/support/v7/view/ActionMode$Callback;->onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z

    move-result v1

    if-eqz v1, :cond_2c

    :cond_2b
    const/4 v0, 0x1

    :cond_2c
    return v0
.end method

.method public onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V
    .registers 4
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    const/4 v1, 0x0

    # setter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;
    invoke-static {v0, v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$402(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;Landroid/support/v7/view/ActionMode;)Landroid/support/v7/view/ActionMode;

    .line 129
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$200(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/mikepenz/fastadapter/FastAdapter;->withSelectOnLongClick(Z)Lcom/mikepenz/fastadapter/FastAdapter;

    .line 132
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$200(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Lcom/mikepenz/fastadapter/FastAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->deselect()V

    .line 134
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v0

    if-eqz v0, :cond_2a

    .line 136
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/support/v7/view/ActionMode$Callback;->onDestroyActionMode(Landroid/support/v7/view/ActionMode;)V

    .line 138
    :cond_2a
    return-void
.end method

.method public onPrepareActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z
    .registers 4
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;->this$0:Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    # getter for: Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/support/v7/view/ActionMode$Callback;->onPrepareActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
