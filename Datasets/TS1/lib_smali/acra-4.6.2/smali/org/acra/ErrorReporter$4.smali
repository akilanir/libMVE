.class Lorg/acra/ErrorReporter$4;
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

.field final synthetic val$sentToastTimeMillis:Lorg/acra/ErrorReporter$TimeHelper;


# direct methods
.method constructor <init>(Lorg/acra/ErrorReporter;Lorg/acra/ErrorReporter$TimeHelper;)V
    .registers 3

    .prologue
    .line 784
    iput-object p1, p0, Lorg/acra/ErrorReporter$4;->this$0:Lorg/acra/ErrorReporter;

    iput-object p2, p0, Lorg/acra/ErrorReporter$4;->val$sentToastTimeMillis:Lorg/acra/ErrorReporter$TimeHelper;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 788
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Waiting for 2000 millis from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter$4;->val$sentToastTimeMillis:Lorg/acra/ErrorReporter$TimeHelper;

    # getter for: Lorg/acra/ErrorReporter$TimeHelper;->initialTimeMillis:Ljava/lang/Long;
    invoke-static {v4}, Lorg/acra/ErrorReporter$TimeHelper;->access$1000(Lorg/acra/ErrorReporter$TimeHelper;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " currentMillis="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 791
    :goto_2e
    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->val$sentToastTimeMillis:Lorg/acra/ErrorReporter$TimeHelper;

    invoke-virtual {v1}, Lorg/acra/ErrorReporter$TimeHelper;->getElapsedTime()J

    move-result-wide v1

    const-wide/16 v3, 0x7d0

    cmp-long v1, v1, v3

    if-gez v1, :cond_4b

    .line 794
    const-wide/16 v1, 0x64

    :try_start_3c
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3f
    .catch Ljava/lang/InterruptedException; {:try_start_3c .. :try_end_3f} :catch_40

    goto :goto_2e

    .line 795
    :catch_40
    move-exception v0

    .line 796
    .local v0, "e1":Ljava/lang/InterruptedException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Interrupted while waiting for Toast to end."

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2e

    .line 799
    .end local v0    # "e1":Ljava/lang/InterruptedException;
    :cond_4b
    iget-object v1, p0, Lorg/acra/ErrorReporter$4;->this$0:Lorg/acra/ErrorReporter;

    const/4 v2, 0x1

    # setter for: Lorg/acra/ErrorReporter;->toastWaitEnded:Z
    invoke-static {v1, v2}, Lorg/acra/ErrorReporter;->access$1102(Lorg/acra/ErrorReporter;Z)Z

    .line 800
    return-void
.end method
