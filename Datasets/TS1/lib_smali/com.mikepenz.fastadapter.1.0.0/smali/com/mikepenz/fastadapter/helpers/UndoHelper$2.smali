.class Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;
.super Landroid/support/design/widget/Snackbar$Callback;
.source "UndoHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/fastadapter/helpers/UndoHelper;->remove(Landroid/view/View;Ljava/lang/String;Ljava/lang/String;ILjava/util/Set;)Landroid/support/design/widget/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;


# direct methods
.method constructor <init>(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    .prologue
    .line 56
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    invoke-direct {p0}, Landroid/support/design/widget/Snackbar$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissed(Landroid/support/design/widget/Snackbar;I)V
    .registers 4
    .param p1, "snackbar"    # Landroid/support/design/widget/Snackbar;
    .param p2, "event"    # I

    .prologue
    .line 59
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;"
    invoke-super {p0, p1, p2}, Landroid/support/design/widget/Snackbar$Callback;->onDismissed(Landroid/support/design/widget/Snackbar;I)V

    .line 61
    packed-switch p2, :pswitch_data_e

    .line 69
    :goto_6
    :pswitch_6
    return-void

    .line 66
    :pswitch_7
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    # invokes: Lcom/mikepenz/fastadapter/helpers/UndoHelper;->notifyCommit()V
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->access$200(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    goto :goto_6

    .line 61
    nop

    :pswitch_data_e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public onShown(Landroid/support/design/widget/Snackbar;)V
    .registers 3
    .param p1, "snackbar"    # Landroid/support/design/widget/Snackbar;

    .prologue
    .line 73
    .local p0, "this":Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;, "Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;"
    invoke-super {p0, p1}, Landroid/support/design/widget/Snackbar$Callback;->onShown(Landroid/support/design/widget/Snackbar;)V

    .line 74
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/UndoHelper$2;->this$0:Lcom/mikepenz/fastadapter/helpers/UndoHelper;

    # invokes: Lcom/mikepenz/fastadapter/helpers/UndoHelper;->doChange()V
    invoke-static {v0}, Lcom/mikepenz/fastadapter/helpers/UndoHelper;->access$300(Lcom/mikepenz/fastadapter/helpers/UndoHelper;)V

    .line 75
    return-void
.end method
