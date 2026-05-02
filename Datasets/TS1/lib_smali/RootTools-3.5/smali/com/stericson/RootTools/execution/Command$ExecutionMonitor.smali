.class Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;
.super Ljava/lang/Thread;
.source "Command.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/execution/Command;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExecutionMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/stericson/RootTools/execution/Command;


# direct methods
.method private constructor <init>(Lcom/stericson/RootTools/execution/Command;)V
    .registers 2

    .prologue
    .line 269
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/stericson/RootTools/execution/Command;Lcom/stericson/RootTools/execution/Command$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/stericson/RootTools/execution/Command;
    .param p2, "x1"    # Lcom/stericson/RootTools/execution/Command$1;

    .prologue
    .line 269
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;-><init>(Lcom/stericson/RootTools/execution/Command;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 271
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    iget-boolean v0, v0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    if-nez v0, :cond_2a

    .line 273
    iget-object v1, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    monitor-enter v1

    .line 275
    :try_start_9
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    iget-object v2, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    iget v2, v2, Lcom/stericson/RootTools/execution/Command;->timeout:I

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_13
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_13} :catch_2b
    .catchall {:try_start_9 .. :try_end_13} :catchall_27

    .line 277
    :goto_13
    :try_start_13
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_27

    .line 279
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    iget-boolean v0, v0, Lcom/stericson/RootTools/execution/Command;->finished:Z

    if-nez v0, :cond_0

    .line 280
    const-string v0, "Timeout Exception has occurred."

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 281
    iget-object v0, p0, Lcom/stericson/RootTools/execution/Command$ExecutionMonitor;->this$0:Lcom/stericson/RootTools/execution/Command;

    const-string v1, "Timeout Exception"

    invoke-virtual {v0, v1}, Lcom/stericson/RootTools/execution/Command;->terminate(Ljava/lang/String;)V

    goto :goto_0

    .line 277
    :catchall_27
    move-exception v0

    :try_start_28
    monitor-exit v1
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_27

    throw v0

    .line 284
    :cond_2a
    return-void

    .line 276
    :catch_2b
    move-exception v0

    goto :goto_13
.end method
