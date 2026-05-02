.class Lorg/acra/builder/ReportExecutor$2;
.super Ljava/lang/Thread;
.source "ReportExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/builder/ReportExecutor;->execute(Lorg/acra/builder/ReportBuilder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/builder/ReportExecutor;

.field final synthetic val$reportBuilder:Lorg/acra/builder/ReportBuilder;

.field final synthetic val$reportFile:Ljava/io/File;

.field final synthetic val$sentToastTimeMillis:Lorg/acra/builder/ReportExecutor$TimeHelper;

.field final synthetic val$showDirectDialog:Z


# direct methods
.method constructor <init>(Lorg/acra/builder/ReportExecutor;Lorg/acra/builder/ReportExecutor$TimeHelper;Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V
    .registers 6
    .param p1, "this$0"    # Lorg/acra/builder/ReportExecutor;

    .prologue
    .line 200
    iput-object p1, p0, Lorg/acra/builder/ReportExecutor$2;->this$0:Lorg/acra/builder/ReportExecutor;

    iput-object p2, p0, Lorg/acra/builder/ReportExecutor$2;->val$sentToastTimeMillis:Lorg/acra/builder/ReportExecutor$TimeHelper;

    iput-object p3, p0, Lorg/acra/builder/ReportExecutor$2;->val$reportBuilder:Lorg/acra/builder/ReportBuilder;

    iput-object p4, p0, Lorg/acra/builder/ReportExecutor$2;->val$reportFile:Ljava/io/File;

    iput-boolean p5, p0, Lorg/acra/builder/ReportExecutor$2;->val$showDirectDialog:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    .line 204
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_32

    .line 205
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Waiting for 2000 millis from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/acra/builder/ReportExecutor$2;->val$sentToastTimeMillis:Lorg/acra/builder/ReportExecutor$TimeHelper;

    .line 206
    # getter for: Lorg/acra/builder/ReportExecutor$TimeHelper;->initialTimeMillis:Ljava/lang/Long;
    invoke-static {v6}, Lorg/acra/builder/ReportExecutor$TimeHelper;->access$300(Lorg/acra/builder/ReportExecutor$TimeHelper;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " currentMillis="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 207
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 205
    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    :cond_32
    const-wide/16 v3, 0x7d0

    iget-object v5, p0, Lorg/acra/builder/ReportExecutor$2;->val$sentToastTimeMillis:Lorg/acra/builder/ReportExecutor$TimeHelper;

    invoke-virtual {v5}, Lorg/acra/builder/ReportExecutor$TimeHelper;->getElapsedTime()J

    move-result-wide v5

    sub-long v1, v3, v5

    .line 211
    .local v1, "sleep":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_45

    :try_start_42
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_45
    .catch Ljava/lang/InterruptedException; {:try_start_42 .. :try_end_45} :catch_5e

    .line 216
    :cond_45
    :goto_45
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_52

    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Finished waiting for Toast"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    :cond_52
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor$2;->this$0:Lorg/acra/builder/ReportExecutor;

    iget-object v4, p0, Lorg/acra/builder/ReportExecutor$2;->val$reportBuilder:Lorg/acra/builder/ReportBuilder;

    iget-object v5, p0, Lorg/acra/builder/ReportExecutor$2;->val$reportFile:Ljava/io/File;

    iget-boolean v6, p0, Lorg/acra/builder/ReportExecutor$2;->val$showDirectDialog:Z

    # invokes: Lorg/acra/builder/ReportExecutor;->dialogAndEnd(Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V
    invoke-static {v3, v4, v5, v6}, Lorg/acra/builder/ReportExecutor;->access$400(Lorg/acra/builder/ReportExecutor;Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V

    .line 218
    return-void

    .line 212
    :catch_5e
    move-exception v0

    .line 213
    .local v0, "e1":Ljava/lang/InterruptedException;
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_45

    .line 214
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Interrupted while waiting for Toast to end."

    invoke-interface {v3, v4, v5, v0}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_45
.end method
