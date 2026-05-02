.class Lorg/acra/ErrorReporter$5;
.super Ljava/lang/Thread;
.source "ErrorReporter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/ErrorReporter;->report(Lorg/acra/ErrorReporter$ReportBuilder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/ErrorReporter;

.field final synthetic val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

.field final synthetic val$reportFileName:Ljava/lang/String;

.field final synthetic val$showDirectDialog:Z

.field final synthetic val$worker:Lorg/acra/SendWorker;


# direct methods
.method constructor <init>(Lorg/acra/ErrorReporter;Lorg/acra/SendWorker;ZLjava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)V
    .registers 6

    .prologue
    .line 810
    iput-object p1, p0, Lorg/acra/ErrorReporter$5;->this$0:Lorg/acra/ErrorReporter;

    iput-object p2, p0, Lorg/acra/ErrorReporter$5;->val$worker:Lorg/acra/SendWorker;

    iput-boolean p3, p0, Lorg/acra/ErrorReporter$5;->val$showDirectDialog:Z

    iput-object p4, p0, Lorg/acra/ErrorReporter$5;->val$reportFileName:Ljava/lang/String;

    iput-object p5, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 815
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Waiting for Toast"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 816
    :goto_9
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->this$0:Lorg/acra/ErrorReporter;

    # getter for: Lorg/acra/ErrorReporter;->toastWaitEnded:Z
    invoke-static {v2}, Lorg/acra/ErrorReporter;->access$1100(Lorg/acra/ErrorReporter;)Z

    move-result v2

    if-nez v2, :cond_22

    .line 818
    const-wide/16 v2, 0x64

    :try_start_13
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_16
    .catch Ljava/lang/InterruptedException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_9

    .line 819
    :catch_17
    move-exception v1

    .line 820
    .local v1, "e1":Ljava/lang/InterruptedException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Error : "

    invoke-interface {v2, v3, v4, v1}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .line 823
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    :cond_22
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Finished waiting for Toast"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->val$worker:Lorg/acra/SendWorker;

    if-eqz v2, :cond_5a

    .line 827
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Waiting for Worker"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 828
    :goto_38
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->val$worker:Lorg/acra/SendWorker;

    invoke-virtual {v2}, Lorg/acra/SendWorker;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_51

    .line 830
    const-wide/16 v2, 0x64

    :try_start_42
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_45
    .catch Ljava/lang/InterruptedException; {:try_start_42 .. :try_end_45} :catch_46

    goto :goto_38

    .line 831
    :catch_46
    move-exception v1

    .line 832
    .restart local v1    # "e1":Ljava/lang/InterruptedException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Error : "

    invoke-interface {v2, v3, v4, v1}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_38

    .line 835
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    :cond_51
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Finished waiting for Worker"

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 838
    :cond_5a
    iget-boolean v2, p0, Lorg/acra/ErrorReporter$5;->val$showDirectDialog:Z

    if-eqz v2, :cond_92

    .line 842
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Creating CrashReportDialog for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/acra/ErrorReporter$5;->val$reportFileName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 843
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->this$0:Lorg/acra/ErrorReporter;

    iget-object v3, p0, Lorg/acra/ErrorReporter$5;->val$reportFileName:Ljava/lang/String;

    iget-object v4, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    # invokes: Lorg/acra/ErrorReporter;->createCrashReportDialogIntent(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;
    invoke-static {v2, v3, v4}, Lorg/acra/ErrorReporter;->access$1200(Lorg/acra/ErrorReporter;Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;

    move-result-object v0

    .line 844
    .local v0, "dialogIntent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 845
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->this$0:Lorg/acra/ErrorReporter;

    # getter for: Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;
    invoke-static {v2}, Lorg/acra/ErrorReporter;->access$400(Lorg/acra/ErrorReporter;)Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Application;->startActivity(Landroid/content/Intent;)V

    .line 848
    .end local v0    # "dialogIntent":Landroid/content/Intent;
    :cond_92
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Wait for Toast + worker ended. Kill Application ? "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z
    invoke-static {v5}, Lorg/acra/ErrorReporter$ReportBuilder;->access$900(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 850
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z
    invoke-static {v2}, Lorg/acra/ErrorReporter$ReportBuilder;->access$900(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v2

    if-eqz v2, :cond_cb

    .line 851
    iget-object v2, p0, Lorg/acra/ErrorReporter$5;->this$0:Lorg/acra/ErrorReporter;

    iget-object v3, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mUncaughtExceptionThread:Ljava/lang/Thread;
    invoke-static {v3}, Lorg/acra/ErrorReporter$ReportBuilder;->access$800(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Thread;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter$5;->val$reportBuilder:Lorg/acra/ErrorReporter$ReportBuilder;

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;
    invoke-static {v4}, Lorg/acra/ErrorReporter$ReportBuilder;->access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;

    move-result-object v4

    # invokes: Lorg/acra/ErrorReporter;->endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    invoke-static {v2, v3, v4}, Lorg/acra/ErrorReporter;->access$1300(Lorg/acra/ErrorReporter;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 853
    :cond_cb
    return-void
.end method
