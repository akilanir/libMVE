.class final Lorg/acra/sender/ReportDistributor;
.super Ljava/lang/Object;
.source "ReportDistributor.java"


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;

.field private final reportSenders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/acra/sender/ReportSender;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Ljava/util/List;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lorg/acra/config/ACRAConfiguration;",
            "Ljava/util/List",
            "<",
            "Lorg/acra/sender/ReportSender;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p3, "reportSenders":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/acra/sender/ReportDistributor;->context:Landroid/content/Context;

    .line 55
    iput-object p2, p0, Lorg/acra/sender/ReportDistributor;->config:Lorg/acra/config/ACRAConfiguration;

    .line 56
    iput-object p3, p0, Lorg/acra/sender/ReportDistributor;->reportSenders:Ljava/util/List;

    .line 57
    return-void
.end method

.method private deleteFile(Ljava/io/File;)V
    .registers 7
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 128
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    .line 129
    .local v0, "deleted":Z
    if-nez v0, :cond_20

    .line 130
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not delete error report : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    :cond_20
    return-void
.end method

.method private isDebuggable()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 140
    iget-object v3, p0, Lorg/acra/sender/ReportDistributor;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 142
    .local v1, "pm":Landroid/content/pm/PackageManager;
    :try_start_7
    iget-object v3, p0, Lorg/acra/sender/ReportDistributor;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_14
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_14} :catch_1a

    and-int/lit8 v3, v3, 0x2

    if-lez v3, :cond_19

    const/4 v2, 0x1

    .line 144
    :cond_19
    :goto_19
    return v2

    .line 143
    :catch_1a
    move-exception v0

    .line 144
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    goto :goto_19
.end method

.method private sendCrashReport(Lorg/acra/collector/CrashReportData;)V
    .registers 12
    .param p1, "errorContent"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/sender/ReportSenderException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/acra/sender/ReportDistributor;->isDebuggable()Z

    move-result v5

    if-eqz v5, :cond_e

    iget-object v5, p0, Lorg/acra/sender/ReportDistributor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v5}, Lorg/acra/config/ACRAConfiguration;->sendReportsInDevMode()Z

    move-result v5

    if-eqz v5, :cond_a6

    .line 96
    :cond_e
    const/4 v4, 0x0

    .line 97
    .local v4, "sentAtLeastOnce":Z
    const/4 v2, 0x0

    .line 98
    .local v2, "sendFailure":Lorg/acra/sender/ReportSenderException;
    const/4 v1, 0x0

    .line 99
    .local v1, "failedSender":Ljava/lang/String;
    iget-object v5, p0, Lorg/acra/sender/ReportDistributor;->reportSenders:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_81

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/acra/sender/ReportSender;

    .line 101
    .local v3, "sender":Lorg/acra/sender/ReportSender;
    :try_start_23
    sget-boolean v6, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v6, :cond_49

    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Sending report using "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_49
    iget-object v6, p0, Lorg/acra/sender/ReportDistributor;->context:Landroid/content/Context;

    invoke-interface {v3, v6, p1}, Lorg/acra/sender/ReportSender;->send(Landroid/content/Context;Lorg/acra/collector/CrashReportData;)V

    .line 103
    sget-boolean v6, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v6, :cond_74

    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Sent report using "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_74
    .catch Lorg/acra/sender/ReportSenderException; {:try_start_23 .. :try_end_74} :catch_76

    .line 106
    :cond_74
    const/4 v4, 0x1

    goto :goto_17

    .line 107
    :catch_76
    move-exception v0

    .line 108
    .local v0, "e":Lorg/acra/sender/ReportSenderException;
    move-object v2, v0

    .line 109
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_17

    .line 113
    .end local v0    # "e":Lorg/acra/sender/ReportSenderException;
    .end local v3    # "sender":Lorg/acra/sender/ReportSender;
    :cond_81
    if-eqz v2, :cond_a6

    .line 115
    if-nez v4, :cond_86

    .line 116
    throw v2

    .line 118
    :cond_86
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ReportSender of class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " failed but other senders completed their task. ACRA will not send this report again."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .end local v1    # "failedSender":Ljava/lang/String;
    .end local v2    # "sendFailure":Lorg/acra/sender/ReportSenderException;
    .end local v4    # "sentAtLeastOnce":Z
    :cond_a6
    return-void
.end method


# virtual methods
.method public distribute(Ljava/io/File;)V
    .registers 9
    .param p1, "reportFile"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sending report "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :try_start_1a
    new-instance v1, Lorg/acra/file/CrashReportPersister;

    invoke-direct {v1}, Lorg/acra/file/CrashReportPersister;-><init>()V

    .line 69
    .local v1, "persister":Lorg/acra/file/CrashReportPersister;
    invoke-virtual {v1, p1}, Lorg/acra/file/CrashReportPersister;->load(Ljava/io/File;)Lorg/acra/collector/CrashReportData;

    move-result-object v2

    .line 70
    .local v2, "previousCrashReport":Lorg/acra/collector/CrashReportData;
    invoke-direct {p0, v2}, Lorg/acra/sender/ReportDistributor;->sendCrashReport(Lorg/acra/collector/CrashReportData;)V

    .line 71
    invoke-direct {p0, p1}, Lorg/acra/sender/ReportDistributor;->deleteFile(Ljava/io/File;)V
    :try_end_29
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_29} :catch_2a
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_29} :catch_49
    .catch Lorg/acra/sender/ReportSenderException; {:try_start_1a .. :try_end_29} :catch_68

    .line 84
    .end local v1    # "persister":Lorg/acra/file/CrashReportPersister;
    .end local v2    # "previousCrashReport":Lorg/acra/collector/CrashReportData;
    :goto_29
    return-void

    .line 72
    :catch_2a
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to send crash reports for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 74
    invoke-direct {p0, p1}, Lorg/acra/sender/ReportDistributor;->deleteFile(Ljava/io/File;)V

    goto :goto_29

    .line 75
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_49
    move-exception v0

    .line 76
    .local v0, "e":Ljava/io/IOException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to load crash report for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    invoke-direct {p0, p1}, Lorg/acra/sender/ReportDistributor;->deleteFile(Ljava/io/File;)V

    goto :goto_29

    .line 78
    .end local v0    # "e":Ljava/io/IOException;
    :catch_68
    move-exception v0

    .line 79
    .local v0, "e":Lorg/acra/sender/ReportSenderException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to send crash report for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_29
.end method
