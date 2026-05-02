.class Leu/chainfire/libsuperuser/Shell$Interactive$6;
.super Ljava/lang/Object;
.source "Shell.java"

# interfaces
.implements Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Leu/chainfire/libsuperuser/Shell$Interactive;->open()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Leu/chainfire/libsuperuser/Shell$Interactive;


# direct methods
.method constructor <init>(Leu/chainfire/libsuperuser/Shell$Interactive;)V
    .registers 2
    .param p1, "this$0"    # Leu/chainfire/libsuperuser/Shell$Interactive;

    .prologue
    .line 1530
    iput-object p1, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLine(Ljava/lang/String;)V
    .registers 7
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 1533
    iget-object v3, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    monitor-enter v3

    .line 1534
    :try_start_3
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # getter for: Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;
    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v2

    if-nez v2, :cond_d

    .line 1535
    monitor-exit v3

    .line 1558
    :goto_c
    return-void

    .line 1538
    :cond_d
    move-object v0, p1

    .line 1540
    .local v0, "contentPart":Ljava/lang/String;
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # getter for: Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;
    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v2

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 1541
    .local v1, "markerIndex":I
    if-nez v1, :cond_54

    .line 1542
    const/4 v0, 0x0

    .line 1547
    :cond_1f
    :goto_1f
    if-eqz v0, :cond_39

    .line 1548
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # getter for: Leu/chainfire/libsuperuser/Shell$Interactive;->wantSTDERR:Z
    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2600(Leu/chainfire/libsuperuser/Shell$Interactive;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 1549
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->addBuffer(Ljava/lang/String;)V
    invoke-static {v2, v0}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2000(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)V

    .line 1550
    :cond_2e
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # getter for: Leu/chainfire/libsuperuser/Shell$Interactive;->onSTDERRLineListener:Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;
    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2700(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;

    move-result-object v4

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->processLine(Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V
    invoke-static {v2, v0, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2200(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;Leu/chainfire/libsuperuser/StreamGobbler$OnLineListener;)V

    .line 1553
    :cond_39
    if-ltz v1, :cond_4f

    .line 1554
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    iget-object v4, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # getter for: Leu/chainfire/libsuperuser/Shell$Interactive;->command:Leu/chainfire/libsuperuser/Shell$Command;
    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$1900(Leu/chainfire/libsuperuser/Shell$Interactive;)Leu/chainfire/libsuperuser/Shell$Command;

    move-result-object v4

    # getter for: Leu/chainfire/libsuperuser/Shell$Command;->marker:Ljava/lang/String;
    invoke-static {v4}, Leu/chainfire/libsuperuser/Shell$Command;->access$1500(Leu/chainfire/libsuperuser/Shell$Command;)Ljava/lang/String;

    move-result-object v4

    # setter for: Leu/chainfire/libsuperuser/Shell$Interactive;->lastMarkerSTDERR:Ljava/lang/String;
    invoke-static {v2, v4}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2802(Leu/chainfire/libsuperuser/Shell$Interactive;Ljava/lang/String;)Ljava/lang/String;

    .line 1555
    iget-object v2, p0, Leu/chainfire/libsuperuser/Shell$Interactive$6;->this$0:Leu/chainfire/libsuperuser/Shell$Interactive;

    # invokes: Leu/chainfire/libsuperuser/Shell$Interactive;->processMarker()V
    invoke-static {v2}, Leu/chainfire/libsuperuser/Shell$Interactive;->access$2500(Leu/chainfire/libsuperuser/Shell$Interactive;)V

    .line 1557
    :cond_4f
    monitor-exit v3

    goto :goto_c

    .end local v0    # "contentPart":Ljava/lang/String;
    .end local v1    # "markerIndex":I
    :catchall_51
    move-exception v2

    monitor-exit v3
    :try_end_53
    .catchall {:try_start_3 .. :try_end_53} :catchall_51

    throw v2

    .line 1543
    .restart local v0    # "contentPart":Ljava/lang/String;
    .restart local v1    # "markerIndex":I
    :cond_54
    if-lez v1, :cond_1f

    .line 1544
    const/4 v2, 0x0

    :try_start_57
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_51

    move-result-object v0

    goto :goto_1f
.end method
