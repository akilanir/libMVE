.class Lcom/stericson/RootTools/execution/Shell$3;
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
    .line 422
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 12

    .prologue
    const/4 v10, 0x2

    .line 425
    const/4 v1, 0x0

    .line 427
    .local v1, "command":Lcom/stericson/RootTools/execution/Command;
    :cond_2
    :goto_2
    :try_start_2
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->close:Z
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$200(Lcom/stericson/RootTools/execution/Shell;)Z

    move-result v8

    if-nez v8, :cond_20

    .line 428
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/stericson/RootTools/execution/Shell;->isReading:Z

    .line 429
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$1000(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 430
    .local v6, "line":Ljava/lang/String;
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v9, 0x1

    iput-boolean v9, v8, Lcom/stericson/RootTools/execution/Shell;->isReading:Z

    .line 435
    if-nez v6, :cond_8f

    .line 500
    .end local v6    # "line":Ljava/lang/String;
    :cond_20
    :goto_20
    const-string v8, "Read all output"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_25} :catch_86

    .line 502
    :try_start_25
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$1200(Lcom/stericson/RootTools/execution/Shell;)Ljava/lang/Process;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Process;->waitFor()I

    .line 503
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$1200(Lcom/stericson/RootTools/execution/Shell;)Ljava/lang/Process;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Process;->destroy()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_37} :catch_122
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_37} :catch_86

    .line 506
    :goto_37
    :try_start_37
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v9

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Writer;)V
    invoke-static {v8, v9}, Lcom/stericson/RootTools/execution/Shell;->access$900(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Writer;)V

    .line 507
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$1000(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v9

    # invokes: Lcom/stericson/RootTools/execution/Shell;->closeQuietly(Ljava/io/Reader;)V
    invoke-static {v8, v9}, Lcom/stericson/RootTools/execution/Shell;->access$1300(Lcom/stericson/RootTools/execution/Shell;Ljava/io/Reader;)V

    .line 509
    const-string v8, "Shell destroyed"

    invoke-static {v8}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;)V

    .line 511
    :goto_52
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$500(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v8

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_11a

    .line 512
    if-nez v1, :cond_7a

    .line 513
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v8

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$500(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v9

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lcom/stericson/RootTools/execution/Command;

    move-object v1, v0

    .line 515
    :cond_7a
    const-string v8, "Unexpected Termination."

    invoke-virtual {v1, v8}, Lcom/stericson/RootTools/execution/Command;->terminated(Ljava/lang/String;)V

    .line 516
    const/4 v1, 0x0

    .line 517
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # operator++ for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$508(Lcom/stericson/RootTools/execution/Shell;)I
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_85} :catch_86

    goto :goto_52

    .line 522
    :catch_86
    move-exception v2

    .line 523
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, v10, v2}, Lcom/stericson/RootTools/RootTools;->log(Ljava/lang/String;ILjava/lang/Exception;)V

    .line 525
    .end local v2    # "e":Ljava/io/IOException;
    :goto_8e
    return-void

    .line 438
    .restart local v6    # "line":Ljava/lang/String;
    :cond_8f
    if-nez v1, :cond_c1

    .line 439
    :try_start_91
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$500(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v8

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lt v8, v9, :cond_ad

    .line 440
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->close:Z
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$200(Lcom/stericson/RootTools/execution/Shell;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto/16 :goto_20

    .line 445
    :cond_ad
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->commands:Ljava/util/List;
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$100(Lcom/stericson/RootTools/execution/Shell;)Ljava/util/List;

    move-result-object v8

    iget-object v9, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v9}, Lcom/stericson/RootTools/execution/Shell;->access$500(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v9

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lcom/stericson/RootTools/execution/Command;

    move-object v1, v0

    .line 453
    :cond_c1
    const-string v8, "F*D^W@#FGF"

    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 456
    .local v7, "pos":I
    const/4 v8, -0x1

    if-ne v7, v8, :cond_cf

    .line 460
    iget v8, v1, Lcom/stericson/RootTools/execution/Command;->id:I

    invoke-virtual {v1, v8, v6}, Lcom/stericson/RootTools/execution/Command;->output(ILjava/lang/String;)V

    .line 462
    :cond_cf
    if-lez v7, :cond_db

    .line 466
    iget v8, v1, Lcom/stericson/RootTools/execution/Command;->id:I

    const/4 v9, 0x0

    invoke-virtual {v6, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Lcom/stericson/RootTools/execution/Command;->output(ILjava/lang/String;)V

    .line 468
    :cond_db
    if-ltz v7, :cond_2

    .line 469
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 470
    const-string v8, " "

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 472
    .local v4, "fields":[Ljava/lang/String;
    array-length v8, v4

    if-lt v8, v10, :cond_2

    const/4 v8, 0x1

    aget-object v8, v4, v8
    :try_end_ed
    .catch Ljava/io/IOException; {:try_start_91 .. :try_end_ed} :catch_86

    if-eqz v8, :cond_2

    .line 473
    const/4 v5, 0x0

    .line 476
    .local v5, "id":I
    const/4 v8, 0x1

    :try_start_f1
    aget-object v8, v4, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_f6
    .catch Ljava/lang/NumberFormatException; {:try_start_f1 .. :try_end_f6} :catch_127
    .catch Ljava/io/IOException; {:try_start_f1 .. :try_end_f6} :catch_86

    move-result v5

    .line 480
    :goto_f7
    const/4 v3, -0x1

    .line 483
    .local v3, "exitCode":I
    const/4 v8, 0x2

    :try_start_f9
    aget-object v8, v4, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_fe
    .catch Ljava/lang/NumberFormatException; {:try_start_f9 .. :try_end_fe} :catch_125
    .catch Ljava/io/IOException; {:try_start_f9 .. :try_end_fe} :catch_86

    move-result v3

    .line 487
    :goto_ff
    :try_start_ff
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->totalRead:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$1100(Lcom/stericson/RootTools/execution/Shell;)I

    move-result v8

    if-ne v5, v8, :cond_2

    .line 488
    invoke-virtual {v1, v3}, Lcom/stericson/RootTools/execution/Command;->setExitCode(I)V

    .line 489
    invoke-virtual {v1}, Lcom/stericson/RootTools/execution/Command;->commandFinished()V

    .line 490
    const/4 v1, 0x0

    .line 492
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # operator++ for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$508(Lcom/stericson/RootTools/execution/Shell;)I

    .line 493
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    # operator++ for: Lcom/stericson/RootTools/execution/Shell;->totalRead:I
    invoke-static {v8}, Lcom/stericson/RootTools/execution/Shell;->access$1108(Lcom/stericson/RootTools/execution/Shell;)I

    goto/16 :goto_2

    .line 520
    .end local v3    # "exitCode":I
    .end local v4    # "fields":[Ljava/lang/String;
    .end local v5    # "id":I
    .end local v6    # "line":Ljava/lang/String;
    .end local v7    # "pos":I
    :cond_11a
    iget-object v8, p0, Lcom/stericson/RootTools/execution/Shell$3;->this$0:Lcom/stericson/RootTools/execution/Shell;

    const/4 v9, 0x0

    # setter for: Lcom/stericson/RootTools/execution/Shell;->read:I
    invoke-static {v8, v9}, Lcom/stericson/RootTools/execution/Shell;->access$502(Lcom/stericson/RootTools/execution/Shell;I)I
    :try_end_120
    .catch Ljava/io/IOException; {:try_start_ff .. :try_end_120} :catch_86

    goto/16 :goto_8e

    .line 504
    :catch_122
    move-exception v8

    goto/16 :goto_37

    .line 484
    .restart local v3    # "exitCode":I
    .restart local v4    # "fields":[Ljava/lang/String;
    .restart local v5    # "id":I
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v7    # "pos":I
    :catch_125
    move-exception v8

    goto :goto_ff

    .line 477
    .end local v3    # "exitCode":I
    :catch_127
    move-exception v8

    goto :goto_f7
.end method
