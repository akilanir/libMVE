.class Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;
.super Lcom/stericson/RootTools/execution/CommandCapture;
.source "SanityCheckRootTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field _catch:Z

.field final synthetic this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;


# direct methods
.method varargs constructor <init>(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;IZ[Ljava/lang/String;)V
    .registers 6
    .param p2, "x0"    # I
    .param p3, "x1"    # Z
    .param p4, "x2"    # [Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    invoke-direct {p0, p2, p3, p4}, Lcom/stericson/RootTools/execution/CommandCapture;-><init>(IZ[Ljava/lang/String;)V

    .line 296
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->_catch:Z

    return-void
.end method


# virtual methods
.method public commandCompleted(II)V
    .registers 8
    .param p1, "id"    # I
    .param p2, "exitCode"    # I

    .prologue
    .line 327
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    iget-object v2, v1, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    monitor-enter v2

    .line 328
    const/4 v1, 0x1

    :try_start_6
    iput-boolean v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->_catch:Z

    .line 330
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    const/4 v3, 0x4

    const-string v4, "All tests complete."

    # invokes: Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    invoke-static {v1, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V

    .line 331
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    const/4 v3, 0x2

    const/4 v4, 0x0

    # invokes: Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    invoke-static {v1, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V
    :try_end_17
    .catchall {:try_start_6 .. :try_end_17} :catchall_21

    .line 334
    :try_start_17
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->closeAllShells()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1a} :catch_1c
    .catchall {:try_start_17 .. :try_end_1a} :catchall_21

    .line 340
    :goto_1a
    :try_start_1a
    monitor-exit v2

    .line 341
    return-void

    .line 335
    :catch_1c
    move-exception v0

    .line 337
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1a

    .line 340
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_21

    throw v1
.end method

.method public commandOutput(ILjava/lang/String;)V
    .registers 4
    .param p1, "id"    # I
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-super {p0, p1, p2}, Lcom/stericson/RootTools/execution/CommandCapture;->commandOutput(ILjava/lang/String;)V

    .line 302
    iget-boolean v0, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->_catch:Z

    if-eqz v0, :cond_c

    .line 303
    const-string v0, "CAUGHT!!!"

    invoke-static {v0}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 305
    :cond_c
    return-void
.end method

.method public commandTerminated(ILjava/lang/String;)V
    .registers 8
    .param p1, "id"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 309
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    iget-object v2, v1, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->this$0:Lcom/stericson/RootToolsTests/SanityCheckRootTools;

    monitor-enter v2

    .line 311
    const/4 v1, 0x1

    :try_start_6
    iput-boolean v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->_catch:Z

    .line 312
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    const/4 v3, 0x4

    const-string v4, "All tests complete."

    # invokes: Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    invoke-static {v1, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V

    .line 313
    iget-object v1, p0, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread$2;->this$1:Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;

    const/4 v3, 0x2

    const/4 v4, 0x0

    # invokes: Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->visualUpdate(ILjava/lang/String;)V
    invoke-static {v1, v3, v4}, Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;->access$200(Lcom/stericson/RootToolsTests/SanityCheckRootTools$SanityCheckThread;ILjava/lang/String;)V
    :try_end_17
    .catchall {:try_start_6 .. :try_end_17} :catchall_21

    .line 316
    :try_start_17
    invoke-static {}, Lcom/stericson/RootTools/RootTools;->closeAllShells()V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1a} :catch_1c
    .catchall {:try_start_17 .. :try_end_1a} :catchall_21

    .line 322
    :goto_1a
    :try_start_1a
    monitor-exit v2

    .line 323
    return-void

    .line 317
    :catch_1c
    move-exception v0

    .line 319
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1a

    .line 322
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_1a .. :try_end_23} :catchall_21

    throw v1
.end method
