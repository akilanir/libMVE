.class Lorg/acra/ErrorReporter$4;
.super Ljava/lang/Thread;
.source "ErrorReporter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/ErrorReporter;

.field final synthetic val$endApplication:Z

.field final synthetic val$reportFileName:Ljava/lang/String;

.field final synthetic val$showDirectDialog:Z

.field final synthetic val$worker:Lorg/acra/SendWorker;


# direct methods
.method constructor <init>(Lorg/acra/ErrorReporter;Lorg/acra/SendWorker;ZLjava/lang/String;Z)V
    .registers 6

    .prologue
    .line 711
    iput-object p1, p0, Lorg/acra/ErrorReporter$4;->this$0:Lorg/acra/ErrorReporter;

    iput-object p2, p0, Lorg/acra/ErrorReporter$4;->val$worker:Lorg/acra/SendWorker;

    iput-boolean p3, p0, Lorg/acra/ErrorReporter$4;->val$showDirectDialog:Z

    iput-object p4, p0, Lorg/acra/ErrorReporter$4;->val$reportFileName:Ljava/lang/String;

    iput-boolean p5, p0, Lorg/acra/ErrorReporter$4;->val$endApplication:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 717
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Waiting for Toast + worker..."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 718
    :goto_7
    # getter for: Lorg/acra/ErrorReporter;->toastWaitEnded:Z
    invoke-static {}, Lorg/acra/ErrorReporter;->access$200()Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->val$worker:Lorg/acra/SendWorker;

    if-eqz v1, :cond_28

    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->val$worker:Lorg/acra/SendWorker;

    invoke-virtual {v1}, Lorg/acra/SendWorker;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 720
    :cond_19
    const-wide/16 v1, 0x64

    :try_start_1b
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_7

    .line 721
    :catch_1f
    move-exception v0

    .line 722
    .local v0, "e1":Ljava/lang/InterruptedException;
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Error : "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7

    .line 726
    .end local v0    # "e1":Ljava/lang/InterruptedException;
    :cond_28
    iget-boolean v1, p0, Lorg/acra/ErrorReporter$4;->val$showDirectDialog:Z

    if-eqz v1, :cond_3a

    .line 731
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "About to create DIALOG from #handleException"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->this$0:Lorg/acra/ErrorReporter;

    iget-object v2, p0, Lorg/acra/ErrorReporter$4;->val$reportFileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/acra/ErrorReporter;->notifyDialog(Ljava/lang/String;)V

    .line 735
    :cond_3a
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wait for Toast + worker ended. Kill Application ? "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lorg/acra/ErrorReporter$4;->val$endApplication:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    iget-boolean v1, p0, Lorg/acra/ErrorReporter$4;->val$endApplication:Z

    if-eqz v1, :cond_5d

    .line 738
    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->this$0:Lorg/acra/ErrorReporter;

    # invokes: Lorg/acra/ErrorReporter;->endApplication()V
    invoke-static {v1}, Lorg/acra/ErrorReporter;->access$300(Lorg/acra/ErrorReporter;)V

    .line 740
    :cond_5d
    return-void
.end method
