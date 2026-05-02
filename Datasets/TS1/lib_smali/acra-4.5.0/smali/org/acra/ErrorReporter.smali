.class public Lorg/acra/ErrorReporter;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static mNotificationCounter:I

.field private static toastWaitEnded:Z


# instance fields
.field private brokenThread:Ljava/lang/Thread;

.field private final crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

.field private enabled:Z

.field private final fileNameParser:Lorg/acra/CrashReportFileNameParser;

.field private transient lastActivityCreated:Landroid/app/Activity;

.field private final mContext:Landroid/app/Application;

.field private final mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private final mReportSenders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/acra/sender/ReportSender;",
            ">;"
        }
    .end annotation
.end field

.field private final prefs:Landroid/content/SharedPreferences;

.field private unhandledThrowable:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 110
    const/4 v0, 0x1

    sput-boolean v0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    .line 115
    const/4 v0, 0x0

    sput v0, Lorg/acra/ErrorReporter;->mNotificationCounter:I

    return-void
.end method

.method constructor <init>(Landroid/app/Application;Landroid/content/SharedPreferences;Z)V
    .registers 8
    .param p1, "context"    # Landroid/app/Application;
    .param p2, "prefs"    # Landroid/content/SharedPreferences;
    .param p3, "enabled"    # Z

    .prologue
    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/acra/ErrorReporter;->enabled:Z

    .line 91
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    .line 95
    new-instance v2, Lorg/acra/CrashReportFileNameParser;

    invoke-direct {v2}, Lorg/acra/CrashReportFileNameParser;-><init>()V

    iput-object v2, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    .line 130
    iput-object p1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    .line 131
    iput-object p2, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    .line 132
    iput-boolean p3, p0, Lorg/acra/ErrorReporter;->enabled:Z

    .line 135
    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-static {v2}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "initialConfiguration":Ljava/lang/String;
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 141
    .local v0, "appStartDate":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 143
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v2

    const/16 v3, 0xe

    if-lt v2, v3, :cond_38

    .line 145
    new-instance v2, Lorg/acra/ErrorReporter$1;

    invoke-direct {v2, p0}, Lorg/acra/ErrorReporter$1;-><init>(Lorg/acra/ErrorReporter;)V

    invoke-static {p1, v2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->registerActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 196
    :cond_38
    new-instance v2, Lorg/acra/collector/CrashReportDataFactory;

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v2, v3, p2, v0, v1}, Lorg/acra/collector/CrashReportDataFactory;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/text/format/Time;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    .line 200
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    iput-object v2, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 201
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 204
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->checkReportsOnApplicationStart()V

    .line 205
    return-void
.end method

.method static synthetic access$002(Lorg/acra/ErrorReporter;Landroid/app/Activity;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 81
    iput-object p1, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Landroid/app/Activity;

    return-object p1
.end method

.method static synthetic access$100(Lorg/acra/ErrorReporter;)Landroid/app/Application;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    return-object v0
.end method

.method static synthetic access$200()Z
    .registers 1

    .prologue
    .line 81
    sget-boolean v0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    return v0
.end method

.method static synthetic access$202(Z)Z
    .registers 1
    .param p0, "x0"    # Z

    .prologue
    .line 81
    sput-boolean p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    return p0
.end method

.method static synthetic access$300(Lorg/acra/ErrorReporter;)V
    .registers 1
    .param p0, "x0"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/acra/ErrorReporter;->endApplication()V

    return-void
.end method

.method private containsOnlySilentOrApprovedReports([Ljava/lang/String;)Z
    .registers 7
    .param p1, "reportFileNames"    # [Ljava/lang/String;

    .prologue
    .line 905
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_14

    aget-object v3, v0, v1

    .line 906
    .local v3, "reportFileName":Ljava/lang/String;
    iget-object v4, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    invoke-virtual {v4, v3}, Lorg/acra/CrashReportFileNameParser;->isApproved(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_11

    .line 907
    const/4 v4, 0x0

    .line 910
    .end local v3    # "reportFileName":Ljava/lang/String;
    :goto_10
    return v4

    .line 905
    .restart local v3    # "reportFileName":Ljava/lang/String;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 910
    .end local v3    # "reportFileName":Ljava/lang/String;
    :cond_14
    const/4 v4, 0x1

    goto :goto_10
.end method

.method private deletePendingReports(ZZI)V
    .registers 14
    .param p1, "deleteApprovedReports"    # Z
    .param p2, "deleteNonApprovedReports"    # Z
    .param p3, "nbOfLatestToKeep"    # I

    .prologue
    .line 877
    new-instance v5, Lorg/acra/CrashReportFinder;

    iget-object v6, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v5, v6}, Lorg/acra/CrashReportFinder;-><init>(Landroid/content/Context;)V

    .line 878
    .local v5, "reportFinder":Lorg/acra/CrashReportFinder;
    invoke-virtual {v5}, Lorg/acra/CrashReportFinder;->getCrashReportFiles()[Ljava/lang/String;

    move-result-object v2

    .line 879
    .local v2, "filesList":[Ljava/lang/String;
    invoke-static {v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 880
    if-eqz v2, :cond_6b

    .line 881
    const/4 v3, 0x0

    .local v3, "iFile":I
    :goto_11
    array-length v6, v2

    sub-int/2addr v6, p3

    if-ge v3, v6, :cond_6b

    .line 882
    aget-object v0, v2, v3

    .line 883
    .local v0, "fileName":Ljava/lang/String;
    iget-object v6, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    invoke-virtual {v6, v0}, Lorg/acra/CrashReportFileNameParser;->isApproved(Ljava/lang/String;)Z

    move-result v4

    .line 884
    .local v4, "isReportApproved":Z
    if-eqz v4, :cond_21

    if-nez p1, :cond_25

    :cond_21
    if-nez v4, :cond_68

    if-eqz p2, :cond_68

    .line 885
    :cond_25
    new-instance v1, Ljava/io/File;

    iget-object v6, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v6}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-direct {v1, v6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 886
    .local v1, "fileToDelete":Ljava/io/File;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Deleting file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 887
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_68

    .line 888
    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not delete report : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 881
    .end local v1    # "fileToDelete":Ljava/io/File;
    :cond_68
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 893
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v3    # "iFile":I
    .end local v4    # "isReportApproved":Z
    :cond_6b
    return-void
.end method

.method private endApplication()V
    .registers 4

    .prologue
    .line 386
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    sget-object v1, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v0, v1, :cond_22

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    sget-object v1, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-ne v0, v1, :cond_2c

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->forceCloseDialogAfterToast()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 391
    :cond_22
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->brokenThread:Ljava/lang/Thread;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->unhandledThrowable:Ljava/lang/Throwable;

    invoke-interface {v0, v1, v2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 413
    :goto_2b
    return-void

    .line 396
    :cond_2c
    sget-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " fatal error : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/acra/ErrorReporter;->unhandledThrowable:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/acra/ErrorReporter;->unhandledThrowable:Ljava/lang/Throwable;

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 403
    iget-object v0, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Landroid/app/Activity;

    if-eqz v0, :cond_87

    .line 404
    sget-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Finishing the last Activity prior to killing the Process"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    iget-object v0, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 406
    sget-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Finished "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Landroid/app/Activity;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Landroid/app/Activity;

    .line 410
    :cond_87
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 411
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    goto :goto_2b
.end method

.method public static getInstance()Lorg/acra/ErrorReporter;
    .registers 1

    .prologue
    .line 216
    invoke-static {}, Lorg/acra/ACRA;->getErrorReporter()Lorg/acra/ErrorReporter;

    move-result-object v0

    return-object v0
.end method

.method private getLatestNonSilentReport([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "filesList"    # [Ljava/lang/String;

    .prologue
    .line 850
    if-eqz p1, :cond_20

    array-length v1, p1

    if-lez v1, :cond_20

    .line 851
    array-length v1, p1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_1a

    .line 852
    iget-object v1, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/acra/CrashReportFileNameParser;->isSilent(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_17

    .line 853
    aget-object v1, p1, v0

    .line 859
    .end local v0    # "i":I
    :goto_16
    return-object v1

    .line 851
    .restart local v0    # "i":I
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 857
    :cond_1a
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    aget-object v1, p1, v1

    goto :goto_16

    .line 859
    .end local v0    # "i":I
    :cond_20
    const/4 v1, 0x0

    goto :goto_16
.end method

.method private getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;
    .registers 8
    .param p1, "crashData"    # Lorg/acra/collector/CrashReportData;

    .prologue
    .line 807
    new-instance v1, Landroid/text/format/Time;

    invoke-direct {v1}, Landroid/text/format/Time;-><init>()V

    .line 808
    .local v1, "now":Landroid/text/format/Time;
    invoke-virtual {v1}, Landroid/text/format/Time;->setToNow()V

    .line 809
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v2

    .line 810
    .local v2, "timestamp":J
    sget-object v4, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    invoke-virtual {p1, v4}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v0

    .line 811
    .local v0, "isSilent":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v0, :cond_35

    sget-object v4, Lorg/acra/ACRAConstants;->SILENT_SUFFIX:Ljava/lang/String;

    :goto_26
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".stacktrace"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    :cond_35
    const-string v4, ""

    goto :goto_26
.end method

.method private handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V
    .registers 15
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "reportingInteractionMode"    # Lorg/acra/ReportingInteractionMode;
    .param p3, "forceSilentReport"    # Z
    .param p4, "endApplication"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 605
    iget-boolean v1, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-nez v1, :cond_7

    .line 742
    :goto_6
    return-void

    .line 609
    :cond_7
    const/4 v7, 0x0

    .line 610
    .local v7, "sendOnlySilentReports":Z
    if-nez p2, :cond_90

    .line 613
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object p2

    .line 625
    :cond_12
    :goto_12
    if-nez p1, :cond_1b

    .line 626
    new-instance p1, Ljava/lang/Exception;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string v1, "Report requested by developer"

    invoke-direct {p1, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 629
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_1b
    sget-object v1, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq p2, v1, :cond_31

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->resToastText()I

    move-result v1

    if-eqz v1, :cond_a3

    sget-object v1, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq p2, v1, :cond_31

    sget-object v1, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne p2, v1, :cond_a3

    :cond_31
    move v9, v3

    .line 632
    .local v9, "shouldDisplayToast":Z
    :goto_32
    if-eqz v9, :cond_3c

    .line 633
    new-instance v1, Lorg/acra/ErrorReporter$2;

    invoke-direct {v1, p0}, Lorg/acra/ErrorReporter$2;-><init>(Lorg/acra/ErrorReporter;)V

    invoke-virtual {v1}, Lorg/acra/ErrorReporter$2;->start()V

    .line 653
    :cond_3c
    iget-object v1, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    iget-object v5, p0, Lorg/acra/ErrorReporter;->brokenThread:Ljava/lang/Thread;

    invoke-virtual {v1, p1, p3, v5}, Lorg/acra/collector/CrashReportDataFactory;->createCrashData(Ljava/lang/Throwable;ZLjava/lang/Thread;)Lorg/acra/collector/CrashReportData;

    move-result-object v6

    .line 658
    .local v6, "crashReportData":Lorg/acra/collector/CrashReportData;
    invoke-direct {p0, v6}, Lorg/acra/ErrorReporter;->getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;

    move-result-object v4

    .line 659
    .local v4, "reportFileName":Ljava/lang/String;
    invoke-direct {p0, v4, v6}, Lorg/acra/ErrorReporter;->saveCrashReportFile(Ljava/lang/String;Lorg/acra/collector/CrashReportData;)V

    .line 661
    const/4 v8, 0x0

    .line 663
    .local v8, "sender":Lorg/acra/SendWorker;
    sget-object v1, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq p2, v1, :cond_5e

    sget-object v1, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq p2, v1, :cond_5e

    iget-object v1, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "acra.alwaysaccept"

    invoke-interface {v1, v5, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_a5

    .line 668
    :cond_5e
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "About to start ReportSenderWorker from #handleException"

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    invoke-virtual {p0, v7, v3}, Lorg/acra/ErrorReporter;->startSendingReports(ZZ)Lorg/acra/SendWorker;

    move-result-object v8

    .line 674
    :cond_69
    :goto_69
    if-eqz v9, :cond_75

    .line 679
    sput-boolean v0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    .line 680
    new-instance v1, Lorg/acra/ErrorReporter$3;

    invoke-direct {v1, p0}, Lorg/acra/ErrorReporter$3;-><init>(Lorg/acra/ErrorReporter;)V

    invoke-virtual {v1}, Lorg/acra/ErrorReporter$3;->start()V

    .line 707
    :cond_75
    move-object v2, v8

    .line 708
    .local v2, "worker":Lorg/acra/SendWorker;
    sget-object v1, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne p2, v1, :cond_b1

    iget-object v1, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v5, "acra.alwaysaccept"

    invoke-interface {v1, v5, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_b1

    .line 711
    .local v3, "showDirectDialog":Z
    :goto_84
    new-instance v0, Lorg/acra/ErrorReporter$4;

    move-object v1, p0

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/acra/ErrorReporter$4;-><init>(Lorg/acra/ErrorReporter;Lorg/acra/SendWorker;ZLjava/lang/String;Z)V

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$4;->start()V

    goto/16 :goto_6

    .line 619
    .end local v2    # "worker":Lorg/acra/SendWorker;
    .end local v3    # "showDirectDialog":Z
    .end local v4    # "reportFileName":Ljava/lang/String;
    .end local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .end local v8    # "sender":Lorg/acra/SendWorker;
    .end local v9    # "shouldDisplayToast":Z
    :cond_90
    sget-object v1, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-ne p2, v1, :cond_12

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v1

    sget-object v5, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v1, v5, :cond_12

    .line 621
    const/4 v7, 0x1

    goto/16 :goto_12

    :cond_a3
    move v9, v0

    .line 629
    goto :goto_32

    .line 670
    .restart local v4    # "reportFileName":Ljava/lang/String;
    .restart local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .restart local v8    # "sender":Lorg/acra/SendWorker;
    .restart local v9    # "shouldDisplayToast":Z
    :cond_a5
    sget-object v1, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-ne p2, v1, :cond_69

    .line 671
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Notification will be created on application start."

    invoke-static {v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_69

    .restart local v2    # "worker":Lorg/acra/SendWorker;
    :cond_b1
    move v3, v0

    .line 708
    goto :goto_84
.end method

.method private notifySendReport(Ljava/lang/String;)V
    .registers 19
    .param p1, "reportFileName"    # Ljava/lang/String;

    .prologue
    .line 775
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const-string v15, "notification"

    invoke-virtual {v14, v15}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 778
    .local v9, "notificationManager":Landroid/app/NotificationManager;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    .line 781
    .local v1, "conf":Lorg/acra/annotation/ReportsCrashes;
    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifIcon()I

    move-result v6

    .line 783
    .local v6, "icon":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v11

    .line 784
    .local v11, "tickerText":Ljava/lang/CharSequence;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 785
    .local v12, "when":J
    new-instance v7, Landroid/app/Notification;

    invoke-direct {v7, v6, v11, v12, v13}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 787
    .local v7, "notification":Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 788
    .local v4, "contentTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 790
    .local v3, "contentText":Ljava/lang/CharSequence;
    new-instance v8, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const-class v15, Lorg/acra/CrashReportDialog;

    invoke-direct {v8, v14, v15}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 791
    .local v8, "notificationIntent":Landroid/content/Intent;
    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Creating Notification for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    const-string v14, "REPORT_FILE_NAME"

    move-object/from16 v0, p1

    invoke-virtual {v8, v14, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 793
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    sget v15, Lorg/acra/ErrorReporter;->mNotificationCounter:I

    add-int/lit8 v16, v15, 0x1

    sput v16, Lorg/acra/ErrorReporter;->mNotificationCounter:I

    const/high16 v16, 0x8000000

    move/from16 v0, v16

    invoke-static {v14, v15, v8, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 795
    .local v2, "contentIntent":Landroid/app/PendingIntent;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v7, v14, v4, v3, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 797
    new-instance v5, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const-class v15, Lorg/acra/CrashReportDialog;

    invoke-direct {v5, v14, v15}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 798
    .local v5, "deleteIntent":Landroid/content/Intent;
    const-string v14, "FORCE_CANCEL"

    const/4 v15, 0x1

    invoke-virtual {v5, v14, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 799
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const/4 v15, -0x1

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v14, v15, v5, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 800
    .local v10, "pendingDeleteIntent":Landroid/app/PendingIntent;
    iput-object v10, v7, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 803
    const/16 v14, 0x29a

    invoke-virtual {v9, v14, v7}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 804
    return-void
.end method

.method private saveCrashReportFile(Ljava/lang/String;Lorg/acra/collector/CrashReportData;)V
    .registers 8
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "crashData"    # Lorg/acra/collector/CrashReportData;

    .prologue
    .line 832
    :try_start_0
    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Writing crash report file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    new-instance v1, Lorg/acra/CrashReportPersister;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v1, v2}, Lorg/acra/CrashReportPersister;-><init>(Landroid/content/Context;)V

    .line 834
    .local v1, "persister":Lorg/acra/CrashReportPersister;
    invoke-virtual {v1, p2, p1}, Lorg/acra/CrashReportPersister;->store(Lorg/acra/collector/CrashReportData;Ljava/lang/String;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_28} :catch_29

    .line 838
    .end local v1    # "persister":Lorg/acra/CrashReportPersister;
    :goto_28
    return-void

    .line 835
    :catch_29
    move-exception v0

    .line 836
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "An error occurred while writing the report file..."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_28
.end method


# virtual methods
.method public addCustomData(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 229
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1, p2}, Lorg/acra/collector/CrashReportDataFactory;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 230
    return-void
.end method

.method public addReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 3
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 290
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    return-void
.end method

.method public checkReportsOnApplicationStart()V
    .registers 15

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 477
    iget-object v12, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v13, "acra.lastVersionNr"

    invoke-interface {v12, v13, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    int-to-long v1, v12

    .line 478
    .local v1, "lastVersionNr":J
    new-instance v6, Lorg/acra/util/PackageManagerWrapper;

    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v6, v12}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 479
    .local v6, "packageManagerWrapper":Lorg/acra/util/PackageManagerWrapper;
    invoke-virtual {v6}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 480
    .local v5, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v5, :cond_b4

    iget v12, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    int-to-long v12, v12

    cmp-long v12, v12, v1

    if-lez v12, :cond_b4

    move v3, v10

    .line 481
    .local v3, "newVersion":Z
    :goto_20
    if-eqz v3, :cond_3f

    .line 482
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v12

    if-eqz v12, :cond_2f

    .line 483
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->deletePendingReports()V

    .line 485
    :cond_2f
    iget-object v12, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 486
    .local v7, "prefsEditor":Landroid/content/SharedPreferences$Editor;
    const-string v12, "acra.lastVersionNr"

    iget v13, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-interface {v7, v12, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 487
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 490
    .end local v7    # "prefsEditor":Landroid/content/SharedPreferences$Editor;
    :cond_3f
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v12

    sget-object v13, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v12, v13, :cond_57

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v12

    sget-object v13, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v12, v13, :cond_64

    :cond_57
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v12

    if-eqz v12, :cond_64

    .line 498
    invoke-virtual {p0, v10}, Lorg/acra/ErrorReporter;->deletePendingNonApprovedReports(Z)V

    .line 501
    :cond_64
    new-instance v8, Lorg/acra/CrashReportFinder;

    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v8, v12}, Lorg/acra/CrashReportFinder;-><init>(Landroid/content/Context;)V

    .line 502
    .local v8, "reportFinder":Lorg/acra/CrashReportFinder;
    invoke-virtual {v8}, Lorg/acra/CrashReportFinder;->getCrashReportFiles()[Ljava/lang/String;

    move-result-object v0

    .line 504
    .local v0, "filesList":[Ljava/lang/String;
    if-eqz v0, :cond_b3

    array-length v12, v0

    if-lez v12, :cond_b3

    .line 512
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v9

    .line 514
    .local v9, "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    invoke-virtual {v8}, Lorg/acra/CrashReportFinder;->getCrashReportFiles()[Ljava/lang/String;

    move-result-object v0

    .line 515
    invoke-direct {p0, v0}, Lorg/acra/ErrorReporter;->containsOnlySilentOrApprovedReports([Ljava/lang/String;)Z

    move-result v4

    .line 517
    .local v4, "onlySilentOrApprovedReports":Z
    sget-object v12, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_96

    sget-object v12, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_96

    if-eqz v4, :cond_b7

    sget-object v12, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_96

    sget-object v12, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v9, v12, :cond_b7

    .line 521
    :cond_96
    sget-object v12, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-ne v9, v12, :cond_a9

    if-nez v4, :cond_a9

    .line 524
    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v13

    invoke-virtual {v13}, Lorg/acra/ACRAConfiguration;->resToastText()I

    move-result v13

    invoke-static {v12, v13, v10}, Lorg/acra/util/ToastSender;->sendToast(Landroid/content/Context;II)V

    .line 527
    :cond_a9
    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "About to start ReportSenderWorker from #checkReportOnApplicationStart"

    invoke-static {v10, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 528
    invoke-virtual {p0, v11, v11}, Lorg/acra/ErrorReporter;->startSendingReports(ZZ)Lorg/acra/SendWorker;

    .line 542
    .end local v4    # "onlySilentOrApprovedReports":Z
    .end local v9    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    :cond_b3
    :goto_b3
    return-void

    .end local v0    # "filesList":[Ljava/lang/String;
    .end local v3    # "newVersion":Z
    .end local v8    # "reportFinder":Lorg/acra/CrashReportFinder;
    :cond_b4
    move v3, v11

    .line 480
    goto/16 :goto_20

    .line 529
    .restart local v0    # "filesList":[Ljava/lang/String;
    .restart local v3    # "newVersion":Z
    .restart local v4    # "onlySilentOrApprovedReports":Z
    .restart local v8    # "reportFinder":Lorg/acra/CrashReportFinder;
    .restart local v9    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    :cond_b7
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v10

    sget-object v11, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-ne v10, v11, :cond_cb

    .line 533
    invoke-direct {p0, v0}, Lorg/acra/ErrorReporter;->getLatestNonSilentReport([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/acra/ErrorReporter;->notifySendReport(Ljava/lang/String;)V

    goto :goto_b3

    .line 534
    :cond_cb
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v10

    sget-object v11, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v10, v11, :cond_b3

    goto :goto_b3
.end method

.method deletePendingNonApprovedReports(Z)V
    .registers 5
    .param p1, "keepOne"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 554
    if-eqz p1, :cond_9

    move v0, v1

    .line 555
    .local v0, "nbReportsToKeep":I
    :goto_5
    invoke-direct {p0, v2, v1, v0}, Lorg/acra/ErrorReporter;->deletePendingReports(ZZI)V

    .line 556
    return-void

    .end local v0    # "nbReportsToKeep":I
    :cond_9
    move v0, v2

    .line 554
    goto :goto_5
.end method

.method deletePendingReports()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 466
    const/4 v0, 0x0

    invoke-direct {p0, v1, v1, v0}, Lorg/acra/ErrorReporter;->deletePendingReports(ZZI)V

    .line 467
    return-void
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 280
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->getCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleException(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x0

    .line 583
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    invoke-direct {p0, p1, v0, v1, v1}, Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V

    .line 584
    return-void
.end method

.method public handleException(Ljava/lang/Throwable;Z)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "endApplication"    # Z

    .prologue
    .line 570
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V

    .line 571
    return-void
.end method

.method public handleSilentException(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 426
    iget-boolean v0, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-eqz v0, :cond_13

    .line 427
    sget-object v0, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V

    .line 428
    sget-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v1, "ACRA sent Silent report."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    :goto_12
    return-void

    .line 432
    :cond_13
    sget-object v0, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v1, "ACRA is disabled. Silent report not sent."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method notifyDialog(Ljava/lang/String;)V
    .registers 6
    .param p1, "reportFileName"    # Ljava/lang/String;

    .prologue
    .line 753
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Creating Dialog for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const-class v2, Lorg/acra/CrashReportDialog;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 755
    .local v0, "dialogIntent":Landroid/content/Intent;
    const-string v1, "REPORT_FILE_NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 756
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 757
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v1, v0}, Landroid/app/Application;->startActivity(Landroid/content/Intent;)V

    .line 758
    return-void
.end method

.method public putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1, p2}, Lorg/acra/collector/CrashReportDataFactory;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeAllReportSenders()V
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 327
    return-void
.end method

.method public removeCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 267
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->removeCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 3
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 301
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 302
    return-void
.end method

.method public removeReportSenders(Ljava/lang/Class;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 311
    .local p1, "senderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/acra/sender/ReportSender;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 312
    iget-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/acra/sender/ReportSender;

    .line 313
    .local v1, "sender":Lorg/acra/sender/ReportSender;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 314
    iget-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 318
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "sender":Lorg/acra/sender/ReportSender;
    :cond_26
    return-void
.end method

.method public setDefaultReportSenders()V
    .registers 8

    .prologue
    .line 918
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 919
    .local v0, "conf":Lorg/acra/annotation/ReportsCrashes;
    invoke-static {}, Lorg/acra/ACRA;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 920
    .local v1, "mApplication":Landroid/app/Application;
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->removeAllReportSenders()V

    .line 924
    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    .line 925
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reports will be sent by email (if accepted by user)."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    new-instance v3, Lorg/acra/sender/EmailIntentSender;

    invoke-direct {v3, v1}, Lorg/acra/sender/EmailIntentSender;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v3}, Lorg/acra/ErrorReporter;->setReportSender(Lorg/acra/sender/ReportSender;)V

    .line 957
    :cond_3b
    :goto_3b
    return-void

    .line 930
    :cond_3c
    new-instance v2, Lorg/acra/util/PackageManagerWrapper;

    invoke-direct {v2, v1}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 931
    .local v2, "pm":Lorg/acra/util/PackageManagerWrapper;
    const-string v3, "android.permission.INTERNET"

    invoke-virtual {v2, v3}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_72

    .line 937
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " should be granted permission "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "android.permission.INTERNET"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " if you want your crash reports to be sent. If you don\'t want to add this permission to your application you can also enable sending reports by email. If this is your will then provide your email address in @ReportsCrashes(mailTo=\"your.account@domain.com\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3b

    .line 947
    :cond_72
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9e

    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9e

    .line 948
    new-instance v3, Lorg/acra/sender/HttpSender;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/ACRAConfiguration;->httpMethod()Lorg/acra/sender/HttpSender$Method;

    move-result-object v4

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Lorg/acra/ACRAConfiguration;->reportType()Lorg/acra/sender/HttpSender$Type;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Lorg/acra/sender/HttpSender;-><init>(Lorg/acra/sender/HttpSender$Method;Lorg/acra/sender/HttpSender$Type;Ljava/util/Map;)V

    invoke-virtual {p0, v3}, Lorg/acra/ErrorReporter;->setReportSender(Lorg/acra/sender/ReportSender;)V

    goto :goto_3b

    .line 954
    :cond_9e
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formKey()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3b

    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3b

    .line 955
    new-instance v3, Lorg/acra/sender/GoogleFormSender;

    invoke-direct {v3}, Lorg/acra/sender/GoogleFormSender;-><init>()V

    invoke-virtual {p0, v3}, Lorg/acra/ErrorReporter;->addReportSender(Lorg/acra/sender/ReportSender;)V

    goto/16 :goto_3b
.end method

.method public setEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 443
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ACRA is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_2f

    const-string v0, "enabled"

    :goto_11
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " for "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    iput-boolean p1, p0, Lorg/acra/ErrorReporter;->enabled:Z

    .line 445
    return-void

    .line 443
    :cond_2f
    const-string v0, "disabled"

    goto :goto_11
.end method

.method public setReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 2
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->removeAllReportSenders()V

    .line 338
    invoke-virtual {p0, p1}, Lorg/acra/ErrorReporter;->addReportSender(Lorg/acra/sender/ReportSender;)V

    .line 339
    return-void
.end method

.method startSendingReports(ZZ)Lorg/acra/SendWorker;
    .registers 6
    .param p1, "onlySendSilentReports"    # Z
    .param p2, "approveReportsFirst"    # Z

    .prologue
    .line 457
    new-instance v0, Lorg/acra/SendWorker;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-direct {v0, v1, v2, p1, p2}, Lorg/acra/SendWorker;-><init>(Landroid/content/Context;Ljava/util/List;ZZ)V

    .line 458
    .local v0, "worker":Lorg/acra/SendWorker;
    invoke-virtual {v0}, Lorg/acra/SendWorker;->start()V

    .line 459
    return-object v0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 352
    :try_start_0
    iget-boolean v1, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-nez v1, :cond_62

    .line 353
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_32

    .line 354
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is disabled for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - forwarding uncaught Exception on to default ExceptionHandler"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 380
    :cond_31
    :goto_31
    return-void

    .line 358
    :cond_32
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is disabled for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - no default ExceptionHandler"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_56} :catch_57

    goto :goto_31

    .line 373
    :catch_57
    move-exception v0

    .line 376
    .local v0, "fatality":Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_31

    .line 377
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_31

    .line 364
    .end local v0    # "fatality":Ljava/lang/Throwable;
    :cond_62
    :try_start_62
    iput-object p1, p0, Lorg/acra/ErrorReporter;->brokenThread:Ljava/lang/Thread;

    .line 365
    iput-object p2, p0, Lorg/acra/ErrorReporter;->unhandledThrowable:Ljava/lang/Throwable;

    .line 367
    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA caught a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " exception for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Building report."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {p0, p2, v1, v2, v3}, Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Lorg/acra/ReportingInteractionMode;ZZ)V
    :try_end_a9
    .catch Ljava/lang/Throwable; {:try_start_62 .. :try_end_a9} :catch_57

    goto :goto_31
.end method
