.class Leu/chainfire/libsuperuser/Shell$Interactive$4;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Leu/chainfire/libsuperuser/Shell$Interactive;->postCallback(Leu/chainfire/libsuperuser/Shell$Command;ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

.field final synthetic val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

.field final synthetic val$fExitCode:I

.field final synthetic val$fOutput:Ljava/util/List;


# direct methods
.method constructor <init>(Leu/chainfire/libsuperuser/Shell$Interactive;Leu/chainfire/libsuperuser/Shell$Command;Ljava/util/List;I)V
    .registers 5
    .param p1, "this$0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 1430
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iput-object p2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    iput-object p3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fOutput:Ljava/util/List;

    iput p4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 1434
    :try_start_0
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fOutput:Ljava/util/List;

    if-eqz v0, :cond_1f

    .line 1435
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandResultListener:Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1400(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->code:I
    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fOutput:Ljava/util/List;

    invoke-interface {v0, v1, v2, v3}, Leu/chainfire/libsuperuser/Shell$OnCommandResultListener;->onCommandResult(IILjava/util/List;)V

    .line 1437
    :cond_1f
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandLineListener:Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 1438
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->onCommandLineListener:Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Command;->access$1700(Leu/chainfire/libsuperuser/Shell$Command;)Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;

    move-result-object v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fCommand:Leu/chainfire/libsuperuser/Shell$Command;

    .line 1439
    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->code:I
    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Command;->access$1800(Leu/chainfire/libsuperuser/Shell$Command;)I

    move-result v1

    iget v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->val$fExitCode:I

    invoke-interface {v0, v1, v2}, Leu/chainfire/libsuperuser/Shell$OnCommandLineListener;->onCommandResult(II)V
    :try_end_38
    .catchall {:try_start_0 .. :try_end_38} :catchall_3e

    .line 1441
    :cond_38
    iget-object v0, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->endCallback()V
    invoke-static {v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1443
    return-void

    .line 1441
    :catchall_3e
    move-exception v0

    iget-object v1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$4;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->endCallback()V
    invoke-static {v1}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1600(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    throw v0
.end method
