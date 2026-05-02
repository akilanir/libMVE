.class public abstract Lorg/acra/dialog/BaseCrashReportDialog;
.super Landroid/app/Activity;
.source "BaseCrashReportDialog.java"


# instance fields
.field private config:Lorg/acra/config/ACRAConfiguration;

.field private exception:Ljava/lang/Throwable;

.field private reportFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected final cancelReports()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 100
    new-instance v0, Lorg/acra/file/BulkReportDeleter;

    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/acra/file/BulkReportDeleter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2, v2}, Lorg/acra/file/BulkReportDeleter;->deleteReports(ZI)V

    .line 101
    return-void
.end method

.method protected final getConfig()Lorg/acra/config/ACRAConfiguration;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lorg/acra/dialog/BaseCrashReportDialog;->config:Lorg/acra/config/ACRAConfiguration;

    return-object v0
.end method

.method protected final getException()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lorg/acra/dialog/BaseCrashReportDialog;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method protected init(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 93
    return-void
.end method

.method protected final onCreate(Landroid/os/Bundle;)V
    .registers 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    sget-boolean v4, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v4, :cond_29

    .line 62
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CrashReportDialog extras="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    :cond_29
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "REPORT_CONFIG"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    .line 66
    .local v1, "sConfig":Ljava/io/Serializable;
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "REPORT_FILE"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    .line 67
    .local v3, "sReportFile":Ljava/io/Serializable;
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "REPORT_EXCEPTION"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    .line 68
    .local v2, "sException":Ljava/io/Serializable;
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "FORCE_CANCEL"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 70
    .local v0, "forceCancel":Z
    if-eqz v0, :cond_68

    .line 71
    sget-boolean v4, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v4, :cond_61

    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Forced reports deletion."

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_61
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->cancelReports()V

    .line 73
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->finish()V

    .line 83
    .end local v1    # "sConfig":Ljava/io/Serializable;
    .end local v2    # "sException":Ljava/io/Serializable;
    .end local v3    # "sReportFile":Ljava/io/Serializable;
    :goto_67
    return-void

    .line 74
    .restart local v1    # "sConfig":Ljava/io/Serializable;
    .restart local v2    # "sException":Ljava/io/Serializable;
    .restart local v3    # "sReportFile":Ljava/io/Serializable;
    :cond_68
    instance-of v4, v1, Lorg/acra/config/ACRAConfiguration;

    if-eqz v4, :cond_86

    instance-of v4, v3, Ljava/io/File;

    if-eqz v4, :cond_86

    instance-of v4, v2, Ljava/lang/Throwable;

    if-nez v4, :cond_76

    if-nez v2, :cond_86

    .line 75
    :cond_76
    check-cast v1, Lorg/acra/config/ACRAConfiguration;

    .end local v1    # "sConfig":Ljava/io/Serializable;
    iput-object v1, p0, Lorg/acra/dialog/BaseCrashReportDialog;->config:Lorg/acra/config/ACRAConfiguration;

    .line 76
    check-cast v3, Ljava/io/File;

    .end local v3    # "sReportFile":Ljava/io/Serializable;
    iput-object v3, p0, Lorg/acra/dialog/BaseCrashReportDialog;->reportFile:Ljava/io/File;

    .line 77
    check-cast v2, Ljava/lang/Throwable;

    .end local v2    # "sException":Ljava/io/Serializable;
    iput-object v2, p0, Lorg/acra/dialog/BaseCrashReportDialog;->exception:Ljava/lang/Throwable;

    .line 78
    invoke-virtual {p0, p1}, Lorg/acra/dialog/BaseCrashReportDialog;->init(Landroid/os/Bundle;)V

    goto :goto_67

    .line 80
    .restart local v1    # "sConfig":Ljava/io/Serializable;
    .restart local v2    # "sException":Ljava/io/Serializable;
    .restart local v3    # "sReportFile":Ljava/io/Serializable;
    :cond_86
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "Illegal or incomplete call of BaseCrashReportDialog."

    invoke-interface {v4, v5, v6}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->finish()V

    goto :goto_67
.end method

.method protected final sendCrash(Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p1, "comment"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "userEmail"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v9, 0x1

    .line 111
    new-instance v2, Lorg/acra/file/CrashReportPersister;

    invoke-direct {v2}, Lorg/acra/file/CrashReportPersister;-><init>()V

    .line 113
    .local v2, "persister":Lorg/acra/file/CrashReportPersister;
    :try_start_6
    sget-boolean v5, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v5, :cond_26

    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Add user comment to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/acra/dialog/BaseCrashReportDialog;->reportFile:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_26
    iget-object v5, p0, Lorg/acra/dialog/BaseCrashReportDialog;->reportFile:Ljava/io/File;

    invoke-virtual {v2, v5}, Lorg/acra/file/CrashReportPersister;->load(Ljava/io/File;)Lorg/acra/collector/CrashReportData;

    move-result-object v0

    .line 115
    .local v0, "crashData":Lorg/acra/collector/CrashReportData;
    sget-object v5, Lorg/acra/ReportField;->USER_COMMENT:Lorg/acra/ReportField;

    if-nez p1, :cond_32

    const-string p1, ""

    .end local p1    # "comment":Ljava/lang/String;
    :cond_32
    invoke-virtual {v0, v5, p1}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v5, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    if-nez p2, :cond_3b

    const-string p2, ""

    .end local p2    # "userEmail":Ljava/lang/String;
    :cond_3b
    invoke-virtual {v0, v5, p2}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    iget-object v5, p0, Lorg/acra/dialog/BaseCrashReportDialog;->reportFile:Ljava/io/File;

    invoke-virtual {v2, v0, v5}, Lorg/acra/file/CrashReportPersister;->store(Lorg/acra/collector/CrashReportData;Ljava/io/File;)V
    :try_end_43
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_43} :catch_62

    .line 123
    .end local v0    # "crashData":Lorg/acra/collector/CrashReportData;
    :goto_43
    new-instance v3, Lorg/acra/sender/SenderServiceStarter;

    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lorg/acra/dialog/BaseCrashReportDialog;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v3, v5, v6}, Lorg/acra/sender/SenderServiceStarter;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 124
    .local v3, "starter":Lorg/acra/sender/SenderServiceStarter;
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v9}, Lorg/acra/sender/SenderServiceStarter;->startService(ZZ)V

    .line 127
    iget-object v5, p0, Lorg/acra/dialog/BaseCrashReportDialog;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v5}, Lorg/acra/config/ACRAConfiguration;->resDialogOkToast()I

    move-result v4

    .line 128
    .local v4, "toastId":I
    if-eqz v4, :cond_61

    .line 129
    invoke-virtual {p0}, Lorg/acra/dialog/BaseCrashReportDialog;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5, v4, v9}, Lorg/acra/util/ToastSender;->sendToast(Landroid/content/Context;II)V

    .line 131
    :cond_61
    return-void

    .line 118
    .end local v3    # "starter":Lorg/acra/sender/SenderServiceStarter;
    .end local v4    # "toastId":I
    :catch_62
    move-exception v1

    .line 119
    .local v1, "e":Ljava/io/IOException;
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v7, "User comment not added: "

    invoke-interface {v5, v6, v7, v1}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_43
.end method
