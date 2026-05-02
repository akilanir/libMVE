.class public Lorg/acra/sender/SenderService;
.super Landroid/app/IntentService;
.source "SenderService.java"


# static fields
.field public static final EXTRA_ACRA_CONFIG:Ljava/lang/String; = "acraConfig"

.field public static final EXTRA_APPROVE_REPORTS_FIRST:Ljava/lang/String; = "approveReportsFirst"

.field public static final EXTRA_ONLY_SEND_SILENT_REPORTS:Ljava/lang/String; = "onlySendSilentReports"

.field public static final EXTRA_REPORT_SENDER_FACTORIES:Ljava/lang/String; = "reportSenderFactories"


# instance fields
.field private final locator:Lorg/acra/file/ReportLocator;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    const-string v0, "ACRA SenderService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 26
    new-instance v0, Lorg/acra/file/ReportLocator;

    invoke-direct {v0, p0}, Lorg/acra/file/ReportLocator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/acra/sender/SenderService;->locator:Lorg/acra/file/ReportLocator;

    .line 30
    return-void
.end method

.method private getSenderInstances(Lorg/acra/config/ACRAConfiguration;Ljava/util/List;)Ljava/util/List;
    .registers 13
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/acra/config/ACRAConfiguration;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lorg/acra/sender/ReportSenderFactory;",
            ">;>;)",
            "Ljava/util/List",
            "<",
            "Lorg/acra/sender/ReportSender;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    .local p2, "factoryClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<+Lorg/acra/sender/ReportSenderFactory;>;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v3, "reportSenders":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 84
    .local v2, "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/sender/ReportSenderFactory;>;"
    :try_start_15
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/acra/sender/ReportSenderFactory;

    .line 85
    .local v1, "factory":Lorg/acra/sender/ReportSenderFactory;
    invoke-virtual {p0}, Lorg/acra/sender/SenderService;->getApplication()Landroid/app/Application;

    move-result-object v6

    invoke-interface {v1, v6, p1}, Lorg/acra/sender/ReportSenderFactory;->create(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Lorg/acra/sender/ReportSender;

    move-result-object v4

    .line 86
    .local v4, "sender":Lorg/acra/sender/ReportSender;
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_26
    .catch Ljava/lang/InstantiationException; {:try_start_15 .. :try_end_26} :catch_27
    .catch Ljava/lang/IllegalAccessException; {:try_start_15 .. :try_end_26} :catch_43

    goto :goto_9

    .line 87
    .end local v1    # "factory":Lorg/acra/sender/ReportSenderFactory;
    .end local v4    # "sender":Lorg/acra/sender/ReportSender;
    :catch_27
    move-exception v0

    .line 88
    .local v0, "e":Ljava/lang/InstantiationException;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not construct ReportSender from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .line 89
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_43
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not construct ReportSender from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_9

    .line 93
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v2    # "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/sender/ReportSenderFactory;>;"
    :cond_5f
    return-object v3
.end method

.method private markReportsAsApproved()V
    .registers 10

    .prologue
    .line 100
    sget-boolean v2, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v2, :cond_d

    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Mark all pending reports as approved."

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_d
    iget-object v2, p0, Lorg/acra/sender/SenderService;->locator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v2}, Lorg/acra/file/ReportLocator;->getUnapprovedReports()[Ljava/io/File;

    move-result-object v3

    array-length v4, v3

    const/4 v2, 0x0

    :goto_15
    if-ge v2, v4, :cond_55

    aget-object v1, v3, v2

    .line 103
    .local v1, "report":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    iget-object v5, p0, Lorg/acra/sender/SenderService;->locator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v5}, Lorg/acra/file/ReportLocator;->getApprovedFolder()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 104
    .local v0, "approvedReport":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_52

    .line 105
    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not rename approved report from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_52
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 108
    .end local v0    # "approvedReport":Ljava/io/File;
    .end local v1    # "report":Ljava/io/File;
    :cond_55
    return-void
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 16
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 35
    const-string v11, "onlySendSilentReports"

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    .line 36
    .local v4, "onlySendSilentReports":Z
    const-string v11, "approveReportsFirst"

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 39
    .local v0, "approveReportsFirst":Z
    const-string v11, "reportSenderFactories"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    .line 41
    .local v9, "senderFactoryClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<+Lorg/acra/sender/ReportSenderFactory;>;>;"
    const-string v11, "acraConfig"

    invoke-virtual {p1, v11}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lorg/acra/config/ACRAConfiguration;

    .line 43
    .local v1, "config":Lorg/acra/config/ACRAConfiguration;
    sget-boolean v11, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v11, :cond_2b

    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "About to start sending reports from SenderService"

    invoke-interface {v11, v12, v13}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    :cond_2b
    :try_start_2b
    invoke-direct {p0, v1, v9}, Lorg/acra/sender/SenderService;->getSenderInstances(Lorg/acra/config/ACRAConfiguration;Ljava/util/List;)Ljava/util/List;

    move-result-object v10

    .line 48
    .local v10, "senderInstances":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    if-eqz v0, :cond_34

    .line 49
    invoke-direct {p0}, Lorg/acra/sender/SenderService;->markReportsAsApproved()V

    .line 53
    :cond_34
    iget-object v11, p0, Lorg/acra/sender/SenderService;->locator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v11}, Lorg/acra/file/ReportLocator;->getApprovedReports()[Ljava/io/File;

    move-result-object v7

    .line 55
    .local v7, "reports":[Ljava/io/File;
    new-instance v6, Lorg/acra/sender/ReportDistributor;

    invoke-direct {v6, p0, v1, v10}, Lorg/acra/sender/ReportDistributor;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Ljava/util/List;)V

    .line 58
    .local v6, "reportDistributor":Lorg/acra/sender/ReportDistributor;
    const/4 v8, 0x0

    .line 59
    .local v8, "reportsSentCount":I
    new-instance v3, Lorg/acra/file/CrashReportFileNameParser;

    invoke-direct {v3}, Lorg/acra/file/CrashReportFileNameParser;-><init>()V

    .line 60
    .local v3, "fileNameParser":Lorg/acra/file/CrashReportFileNameParser;
    array-length v12, v7

    const/4 v11, 0x0

    :goto_47
    if-ge v11, v12, :cond_5d

    aget-object v5, v7, v11

    .line 61
    .local v5, "report":Ljava/io/File;
    if-eqz v4, :cond_5a

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lorg/acra/file/CrashReportFileNameParser;->isSilent(Ljava/lang/String;)Z
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_54} :catch_71

    move-result v13

    if-nez v13, :cond_5a

    .line 60
    :goto_57
    add-int/lit8 v11, v11, 0x1

    goto :goto_47

    .line 65
    :cond_5a
    const/4 v13, 0x5

    if-lt v8, v13, :cond_6b

    .line 76
    .end local v3    # "fileNameParser":Lorg/acra/file/CrashReportFileNameParser;
    .end local v5    # "report":Ljava/io/File;
    .end local v6    # "reportDistributor":Lorg/acra/sender/ReportDistributor;
    .end local v7    # "reports":[Ljava/io/File;
    .end local v8    # "reportsSentCount":I
    .end local v10    # "senderInstances":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    :cond_5d
    :goto_5d
    sget-boolean v11, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v11, :cond_6a

    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Finished sending reports from SenderService"

    invoke-interface {v11, v12, v13}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    :cond_6a
    return-void

    .line 69
    .restart local v3    # "fileNameParser":Lorg/acra/file/CrashReportFileNameParser;
    .restart local v5    # "report":Ljava/io/File;
    .restart local v6    # "reportDistributor":Lorg/acra/sender/ReportDistributor;
    .restart local v7    # "reports":[Ljava/io/File;
    .restart local v8    # "reportsSentCount":I
    .restart local v10    # "senderInstances":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    :cond_6b
    :try_start_6b
    invoke-virtual {v6, v5}, Lorg/acra/sender/ReportDistributor;->distribute(Ljava/io/File;)V
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_6e} :catch_71

    .line 70
    add-int/lit8 v8, v8, 0x1

    goto :goto_57

    .line 72
    .end local v3    # "fileNameParser":Lorg/acra/file/CrashReportFileNameParser;
    .end local v5    # "report":Ljava/io/File;
    .end local v6    # "reportDistributor":Lorg/acra/sender/ReportDistributor;
    .end local v7    # "reports":[Ljava/io/File;
    .end local v8    # "reportsSentCount":I
    .end local v10    # "senderInstances":Ljava/util/List;, "Ljava/util/List<Lorg/acra/sender/ReportSender;>;"
    :catch_71
    move-exception v2

    .line 73
    .local v2, "e":Ljava/lang/Exception;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, ""

    invoke-interface {v11, v12, v13, v2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5d
.end method
