.class public Lcom/stericson/RootTools/execution/Shell$Worker;
.super Ljava/lang/Thread;
.source "Shell.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/stericson/RootTools/execution/Shell;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Worker"
.end annotation


# instance fields
.field public exit:I

.field public shell:Lcom/stericson/RootTools/execution/Shell;


# direct methods
.method private constructor <init>(Lcom/stericson/RootTools/execution/Shell;)V
    .registers 3
    .param p1, "shell"    # Lcom/stericson/RootTools/execution/Shell;

    .prologue
    .line 641
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 637
    const/16 v0, -0x38f

    iput v0, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->exit:I

    .line 642
    iput-object p1, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    .line 643
    return-void
.end method

.method synthetic constructor <init>(Lcom/stericson/RootTools/execution/Shell;Lcom/stericson/RootTools/execution/Shell$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/stericson/RootTools/execution/Shell;
    .param p2, "x1"    # Lcom/stericson/RootTools/execution/Shell$1;

    .prologue
    .line 636
    invoke-direct {p0, p1}, Lcom/stericson/RootTools/execution/Shell$Worker;-><init>(Lcom/stericson/RootTools/execution/Shell;)V

    return-void
.end method

.method private setShellOom()V
    .registers 8

    .prologue
    .line 693
    :try_start_0
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$1200(Lcom/stericson/RootTools/execution/Shell;)Ljava/lang/Process;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_63

    move-result-object v3

    .line 696
    .local v3, "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_a
    const-string v4, "pid"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_f
    .catch Ljava/lang/NoSuchFieldException; {:try_start_a .. :try_end_f} :catch_5b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_f} :catch_63

    move-result-object v1

    .line 700
    .local v1, "field":Ljava/lang/reflect/Field;
    :goto_10
    const/4 v4, 0x1

    :try_start_11
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 701
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->proc:Ljava/lang/Process;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$1200(Lcom/stericson/RootTools/execution/Shell;)Ljava/lang/Process;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 702
    .local v2, "pid":I
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "(echo -17 > /proc/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/oom_adj) &> /dev/null\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 703
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    const-string v5, "(echo -17 > /proc/$$/oom_adj) &> /dev/null\n"

    invoke-virtual {v4, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 704
    iget-object v4, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v4}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/OutputStreamWriter;->flush()V

    .line 708
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "pid":I
    .end local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_5a
    return-void

    .line 697
    .restart local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_5b
    move-exception v0

    .line 698
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    const-string v4, "id"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_61} :catch_63

    move-result-object v1

    .restart local v1    # "field":Ljava/lang/reflect/Field;
    goto :goto_10

    .line 705
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "processClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_63
    move-exception v0

    .line 706
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5a
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 658
    :try_start_0
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v2}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v2

    const-string v3, "echo Started\n"

    invoke-virtual {v2, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 659
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->out:Ljava/io/OutputStreamWriter;
    invoke-static {v2}, Lcom/stericson/RootTools/execution/Shell;->access$700(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/OutputStreamWriter;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 662
    :cond_14
    :goto_14
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    # getter for: Lcom/stericson/RootTools/execution/Shell;->in:Ljava/io/BufferedReader;
    invoke-static {v2}, Lcom/stericson/RootTools/execution/Shell;->access$1000(Lcom/stericson/RootTools/execution/Shell;)Ljava/io/BufferedReader;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 663
    .local v1, "line":Ljava/lang/String;
    if-nez v1, :cond_3b

    .line 664
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_26} :catch_26

    .line 676
    .end local v1    # "line":Ljava/lang/String;
    :catch_26
    move-exception v0

    .line 677
    .local v0, "e":Ljava/io/IOException;
    const/16 v2, -0x2a

    iput v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->exit:I

    .line 678
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5a

    .line 679
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    # setter for: Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootTools/execution/Shell;->access$1402(Lcom/stericson/RootTools/execution/Shell;Ljava/lang/String;)Ljava/lang/String;

    .line 684
    .end local v0    # "e":Ljava/io/IOException;
    :goto_3a
    return-void

    .line 666
    .restart local v1    # "line":Ljava/lang/String;
    :cond_3b
    :try_start_3b
    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 668
    const-string v2, "Started"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_52

    .line 669
    const/4 v2, 0x1

    iput v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->exit:I

    .line 670
    invoke-direct {p0}, Lcom/stericson/RootTools/execution/Shell$Worker;->setShellOom()V

    goto :goto_3a

    .line 674
    :cond_52
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    const-string v3, "unkown error occured."

    # setter for: Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootTools/execution/Shell;->access$1402(Lcom/stericson/RootTools/execution/Shell;Ljava/lang/String;)Ljava/lang/String;
    :try_end_59
    .catch Ljava/io/IOException; {:try_start_3b .. :try_end_59} :catch_26

    goto :goto_14

    .line 681
    .end local v1    # "line":Ljava/lang/String;
    .restart local v0    # "e":Ljava/io/IOException;
    :cond_5a
    iget-object v2, p0, Lcom/stericson/RootTools/execution/Shell$Worker;->shell:Lcom/stericson/RootTools/execution/Shell;

    const-string v3, "RootAccess denied?."

    # setter for: Lcom/stericson/RootTools/execution/Shell;->error:Ljava/lang/String;
    invoke-static {v2, v3}, Lcom/stericson/RootTools/execution/Shell;->access$1402(Lcom/stericson/RootTools/execution/Shell;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_3a
.end method
