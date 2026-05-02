.class Lcom/stericson/RootTools/execution/Shell$2;
.super Ljava/lang/Thread;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootTools/execution/Shell;->notifyThreads()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootTools/execution/Shell;


# direct methods
.method constructor <init>(Lcom/stericson/RootTools/execution/Shell;)V
    .registers 2

    .prologue
    .line 408
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Shell$2;->this$0:Lcom/stericson/RootTools/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 410
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell$2;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v0}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 411
    :try_start_7
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Shell$2;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v0}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 412
    monitor-exit v1

    .line 413
    return-void

    .line 412
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_7 .. :try_end_14} :catchall_12

    throw v0
.end method
