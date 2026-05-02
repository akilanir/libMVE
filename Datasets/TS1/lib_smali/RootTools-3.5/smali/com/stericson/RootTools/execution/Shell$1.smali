.class Lcom/stericson/RootTools/execution/Shell$1;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/execution/Shell;
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
    .line 334
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 340
    :cond_1
    :goto_1
    :try_start_1
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v4

    monitor-enter v4
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_34
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_8} :catch_71
    .catchall {:try_start_1 .. :try_end_8} :catchall_120

    .line 346
    :goto_8
    :try_start_8
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->close:Z
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$200(Lcom/stericson/RootTools/execution/Shell;)Z

    move-result v3

    if-nez v3, :cond_4e

    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$300(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v3

    iget-object v5, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v5}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v3, v5, :cond_4e

    .line 347
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v5, 0x0

    iput-boolean v5, v3, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    .line 348
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    goto :goto_8

    .line 350
    :catchall_31
    move-exception v3

    monitor-exit v4
    :try_end_33
    .catchall {:try_start_8 .. :try_end_33} :catchall_31

    :try_start_33
    throw v3
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_34} :catch_34
    .catch Ljava/lang/InterruptedException; {:try_start_33 .. :try_end_34} :catch_71
    .catchall {:try_start_33 .. :try_end_34} :catchall_120

    .line 396
    :catch_34
    move-exception v1

    .line 397
    .local v1, "e":Ljava/io/IOException;
    :try_start_35
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4, v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;ILjava/lang/Exception;)V
    :try_end_3d
    .catchall {:try_start_35 .. :try_end_3d} :catchall_120

    .line 401
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # setter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootTools/execution/Shell;->access$302(Lcom/stericson/RootTools/execution/Shell;I)I

    .line 402
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootTools/execution/Shell;->access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V

    .line 404
    .end local v1    # "e":Ljava/io/IOException;
    :goto_4d
    return-void

    .line 350
    :cond_4e
    :try_start_4e
    monitor-exit v4
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_31

    .line 352
    :try_start_4f
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$300(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->maxCommands:I
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$400(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v4

    if-lt v3, v4, :cond_90

    .line 357
    :goto_5d
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$500(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$300(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v4

    if-eq v3, v4, :cond_8b

    .line 359
    const-string v3, "Waiting for read and write to catch up before cleanup."

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_70} :catch_34
    .catch Ljava/lang/InterruptedException; {:try_start_4f .. :try_end_70} :catch_71
    .catchall {:try_start_4f .. :try_end_70} :catchall_120

    goto :goto_5d

    .line 398
    :catch_71
    move-exception v1

    .line 399
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_72
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v3, v4, v1}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;ILjava/lang/Exception;)V
    :try_end_7a
    .catchall {:try_start_72 .. :try_end_7a} :catchall_120

    .line 401
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # setter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootTools/execution/Shell;->access$302(Lcom/stericson/RootTools/execution/Shell;I)I

    .line 402
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootTools/execution/Shell;->access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V

    goto :goto_4d

    .line 364
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_8b
    :try_start_8b
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # invokes: Lcom/stericson/RootTools/execution/Shell;->cleanCommands()V
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$600(Lcom/stericson/RootTools/execution/Shell;)V

    .line 373
    :cond_90
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$300(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_132

    .line 374
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    .line 375
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$300(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v4

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/stericson/RootTools/execution/Command;

    .line 376
    .local v0, "cmd":Lcom/stericson/RootTools/execution/Command;
    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Command;->startExecution()V

    .line 377
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 379
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v0}, Lcom/stericson/RootTools/execution/Command;->getCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 380
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\necho F*D^W@#FGF "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$800(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " $?\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 381
    .local v2, "line":Ljava/lang/String;
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 382
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 383
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # operator++ for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$308(Lcom/stericson/RootTools/execution/Shell;)I

    .line 384
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # operator++ for: Lcom/stericson/RootTools/execution/Shell;->totalExecuted:I
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$808(Lcom/stericson/RootTools/execution/Shell;)I
    :try_end_11e
    .catch Ljava/io/IOException; {:try_start_8b .. :try_end_11e} :catch_34
    .catch Ljava/lang/InterruptedException; {:try_start_8b .. :try_end_11e} :catch_71
    .catchall {:try_start_8b .. :try_end_11e} :catchall_120

    goto/16 :goto_1

    .line 401
    .end local v0    # "cmd":Lcom/stericson/RootTools/execution/Command;
    .end local v2    # "line":Ljava/lang/String;
    :catchall_120
    move-exception v3

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # setter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v4, v6}, Lcom/stericson/RootTools/execution/Shell;->access$302(Lcom/stericson/RootTools/execution/Shell;I)I

    .line 402
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v5, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v5}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v5

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v4, v5}, Lcom/stericson/RootTools/execution/Shell;->access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V

    throw v3

    .line 385
    :cond_132
    :try_start_132
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->close:Z
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$200(Lcom/stericson/RootTools/execution/Shell;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 389
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/stericson/RootTools/execution/Shell;->isExecuting:Z

    .line 390
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    const-string v4, "\nexit 0\n"

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 391
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v3}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/OutputStreamWriter;->flush()V

    .line 392
    const-string v3, "Closing shell"

    invoke-static {v3}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_158
    .catch Ljava/io/IOException; {:try_start_132 .. :try_end_158} :catch_34
    .catch Ljava/lang/InterruptedException; {:try_start_132 .. :try_end_158} :catch_71
    .catchall {:try_start_132 .. :try_end_158} :catchall_120

    .line 401
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # setter for: Lcom/stericson/RootTools/execution/Shell;->write:I
    invoke-static {v3, v6}, Lcom/stericson/RootTools/execution/Shell;->access$302(Lcom/stericson/RootTools/execution/Shell;I)I

    .line 402
    iget-object v3, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$1;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v3, v4}, Lcom/stericson/RootTools/execution/Shell;->access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V

    goto/16 :goto_4d
.end method
