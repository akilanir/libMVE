.class public Lorg/acra/ErrorReporter;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/ErrorReporter$ReportBuilder;,
        Lorg/acra/ErrorReporter$TimeHelper;
    }
.end annotation


# static fields
.field private static final NULL_EXCEPTION_HANDLER_INITIALIZER:Lorg/acra/ExceptionHandlerInitializer;

.field private static mNotificationCounter:I


# instance fields
.field private final crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

.field private enabled:Z

.field private volatile exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

.field private final fileNameParser:Lorg/acra/CrashReportFileNameParser;

.field private lastActivityCreated:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

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

.field private toastWaitEnded:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 110
    new-instance v0, Lorg/acra/ErrorReporter$1;

    invoke-direct {v0}, Lorg/acra/ErrorReporter$1;-><init>()V

    sput-object v0, Lorg/acra/ErrorReporter;->NULL_EXCEPTION_HANDLER_INITIALIZER:Lorg/acra/ExceptionHandlerInitializer;

    .line 121
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
    .line 134
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

    .line 102
    new-instance v2, Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    .line 108
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    .line 116
    sget-object v2, Lorg/acra/ErrorReporter;->NULL_EXCEPTION_HANDLER_INITIALIZER:Lorg/acra/ExceptionHandlerInitializer;

    iput-object v2, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    .line 136
    iput-object p1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    .line 137
    iput-object p2, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    .line 138
    iput-boolean p3, p0, Lorg/acra/ErrorReporter;->enabled:Z

    .line 143
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/ACRAConfiguration;->getReportFields()Ljava/util/List;

    move-result-object v2

    sget-object v3, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6a

    .line 144
    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-static {v2}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "initialConfiguration":Ljava/lang/String;
    :goto_3f
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 153
    .local v0, "appStartDate":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 155
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v2

    const/16 v3, 0xe

    if-lt v2, v3, :cond_57

    .line 157
    new-instance v2, Lorg/acra/ErrorReporter$2;

    invoke-direct {v2, p0}, Lorg/acra/ErrorReporter$2;-><init>(Lorg/acra/ErrorReporter;)V

    invoke-static {p1, v2}, Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ApplicationHelper;->registerActivityLifecycleCallbacks(Landroid/app/Application;Lorg/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat;)V

    .line 208
    :cond_57
    new-instance v2, Lorg/acra/collector/CrashReportDataFactory;

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v2, v3, p2, v0, v1}, Lorg/acra/collector/CrashReportDataFactory;-><init>(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/text/format/Time;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    .line 212
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v2

    iput-object v2, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 213
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 214
    return-void

    .line 146
    .end local v0    # "appStartDate":Landroid/text/format/Time;
    .end local v1    # "initialConfiguration":Ljava/lang/String;
    :cond_6a
    const/4 v1, 0x0

    .restart local v1    # "initialConfiguration":Ljava/lang/String;
    goto :goto_3f
.end method

.method static synthetic access$002(Lorg/acra/ErrorReporter;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Ljava/lang/ref/WeakReference;

    .prologue
    .line 81
    iput-object p1, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic access$1100(Lorg/acra/ErrorReporter;)Z
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 81
    iget-boolean v0, p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    return v0
.end method

.method static synthetic access$1102(Lorg/acra/ErrorReporter;Z)Z
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Z

    .prologue
    .line 81
    iput-boolean p1, p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    return p1
.end method

.method static synthetic access$1200(Lorg/acra/ErrorReporter;Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;
    .registers 4
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lorg/acra/ErrorReporter;->createCrashReportDialogIntent(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lorg/acra/ErrorReporter;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Ljava/lang/Thread;
    .param p2, "x2"    # Ljava/lang/Throwable;

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Lorg/acra/ErrorReporter;->endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic access$1400(Lorg/acra/ErrorReporter;Lorg/acra/ErrorReporter$ReportBuilder;)V
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;
    .param p1, "x1"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lorg/acra/ErrorReporter;->report(Lorg/acra/ErrorReporter$ReportBuilder;)V

    return-void
.end method

.method static synthetic access$400(Lorg/acra/ErrorReporter;)Landroid/app/Application;
    .registers 2
    .param p0, "x0"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    return-object v0
.end method

.method private containsOnlySilentOrApprovedReports([Ljava/lang/String;)Z
    .registers 7
    .param p1, "reportFileNames"    # [Ljava/lang/String;

    .prologue
    .line 988
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_14

    aget-object v3, v0, v1

    .line 989
    .local v3, "reportFileName":Ljava/lang/String;
    iget-object v4, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    invoke-virtual {v4, v3}, Lorg/acra/CrashReportFileNameParser;->isApproved(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_11

    .line 990
    const/4 v4, 0x0

    .line 993
    .end local v3    # "reportFileName":Ljava/lang/String;
    :goto_10
    return v4

    .line 988
    .restart local v3    # "reportFileName":Ljava/lang/String;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 993
    .end local v3    # "reportFileName":Ljava/lang/String;
    :cond_14
    const/4 v4, 0x1

    goto :goto_10
.end method

.method private createCrashReportDialogIntent(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;
    .registers 8
    .param p1, "reportFileName"    # Ljava/lang/String;
    .param p2, "reportBuilder"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 864
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating DialogIntent for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;
    invoke-static {p2}, Lorg/acra/ErrorReporter$ReportBuilder;->access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 865
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Lorg/acra/ACRAConfiguration;->reportDialogClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 866
    .local v0, "dialogIntent":Landroid/content/Intent;
    const-string v1, "REPORT_FILE_NAME"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 867
    const-string v1, "REPORT_EXCEPTION"

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;
    invoke-static {p2}, Lorg/acra/ErrorReporter$ReportBuilder;->access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 868
    return-object v0
.end method

.method private createNotification(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)V
    .registers 20
    .param p1, "reportFileName"    # Ljava/lang/String;
    .param p2, "reportBuilder"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 882
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const-string v14, "notification"

    invoke-virtual {v13, v14}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 884
    .local v9, "notificationManager":Landroid/app/NotificationManager;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v1

    .line 887
    .local v1, "conf":Lorg/acra/annotation/ReportsCrashes;
    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifIcon()I

    move-result v7

    .line 889
    .local v7, "icon":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifTickerText()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v10

    .line 890
    .local v10, "tickerText":Ljava/lang/CharSequence;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 891
    .local v11, "when":J
    new-instance v8, Landroid/app/Notification;

    invoke-direct {v8, v7, v10, v11, v12}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 893
    .local v8, "notification":Landroid/app/Notification;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifTitle()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 894
    .local v4, "contentTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-interface {v1}, Lorg/acra/annotation/ReportsCrashes;->resNotifText()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/app/Application;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 896
    .local v3, "contentText":Ljava/lang/CharSequence;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

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

    invoke-interface {v13, v14, v15}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 897
    invoke-direct/range {p0 .. p2}, Lorg/acra/ErrorReporter;->createCrashReportDialogIntent(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;

    move-result-object v5

    .line 898
    .local v5, "crashReportDialogIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    sget v14, Lorg/acra/ErrorReporter;->mNotificationCounter:I

    add-int/lit8 v15, v14, 0x1

    sput v15, Lorg/acra/ErrorReporter;->mNotificationCounter:I

    const/high16 v15, 0x8000000

    invoke-static {v13, v14, v5, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 900
    .local v2, "contentIntent":Landroid/app/PendingIntent;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v8, v13, v4, v3, v2}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 901
    iget v13, v8, Landroid/app/Notification;->flags:I

    or-int/lit8 v13, v13, 0x10

    iput v13, v8, Landroid/app/Notification;->flags:I

    .line 906
    invoke-direct/range {p0 .. p2}, Lorg/acra/ErrorReporter;->createCrashReportDialogIntent(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)Landroid/content/Intent;

    move-result-object v6

    .line 907
    .local v6, "deleteIntent":Landroid/content/Intent;
    const-string v13, "FORCE_CANCEL"

    const/4 v14, 0x1

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 908
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    const/4 v14, -0x1

    const/4 v15, 0x0

    invoke-static {v13, v14, v6, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    iput-object v13, v8, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 911
    const/16 v13, 0x29a

    invoke-virtual {v9, v13, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 912
    return-void
.end method

.method private deletePendingReports(ZZI)V
    .registers 14
    .param p1, "deleteApprovedReports"    # Z
    .param p2, "deleteNonApprovedReports"    # Z
    .param p3, "nbOfLatestToKeep"    # I

    .prologue
    .line 962
    new-instance v5, Lorg/acra/CrashReportFinder;

    iget-object v6, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v5, v6}, Lorg/acra/CrashReportFinder;-><init>(Landroid/content/Context;)V

    .line 963
    .local v5, "reportFinder":Lorg/acra/CrashReportFinder;
    invoke-virtual {v5}, Lorg/acra/CrashReportFinder;->getCrashReportFiles()[Ljava/lang/String;

    move-result-object v2

    .line 964
    .local v2, "filesList":[Ljava/lang/String;
    invoke-static {v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 965
    const/4 v3, 0x0

    .local v3, "iFile":I
    :goto_f
    array-length v6, v2

    sub-int/2addr v6, p3

    if-ge v3, v6, :cond_6b

    .line 966
    aget-object v0, v2, v3

    .line 967
    .local v0, "fileName":Ljava/lang/String;
    iget-object v6, p0, Lorg/acra/ErrorReporter;->fileNameParser:Lorg/acra/CrashReportFileNameParser;

    invoke-virtual {v6, v0}, Lorg/acra/CrashReportFileNameParser;->isApproved(Ljava/lang/String;)Z

    move-result v4

    .line 968
    .local v4, "isReportApproved":Z
    if-eqz v4, :cond_1f

    if-nez p1, :cond_23

    :cond_1f
    if-nez v4, :cond_68

    if-eqz p2, :cond_68

    .line 969
    :cond_23
    new-instance v1, Ljava/io/File;

    iget-object v6, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v6}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v6

    invoke-direct {v1, v6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 970
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

    .line 971
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_68

    .line 972
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Could not delete report : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    .end local v1    # "fileToDelete":Ljava/io/File;
    :cond_68
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 976
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v4    # "isReportApproved":Z
    :cond_6b
    return-void
.end method

.method private endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "uncaughtExceptionThread"    # Ljava/lang/Thread;
    .param p2, "th"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x1

    const/4 v3, 0x0

    .line 448
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v4

    sget-object v5, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v4, v5, :cond_24

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v4

    sget-object v5, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-ne v4, v5, :cond_3e

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Lorg/acra/ACRAConfiguration;->forceCloseDialogAfterToast()Z

    move-result v4

    if-eqz v4, :cond_3e

    :cond_24
    move v2, v0

    .line 453
    .local v2, "letDefaultHandlerEndApplication":Z
    :goto_25
    if-eqz p1, :cond_40

    .line 454
    .local v0, "handlingUncaughtException":Z
    :goto_27
    if-eqz v0, :cond_42

    if-eqz v2, :cond_42

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v3, :cond_42

    .line 456
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Handing Exception on to default ExceptionHandler"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    iget-object v3, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v3, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 479
    :goto_3d
    return-void

    .end local v0    # "handlingUncaughtException":Z
    .end local v2    # "letDefaultHandlerEndApplication":Z
    :cond_3e
    move v2, v3

    .line 448
    goto :goto_25

    .restart local v2    # "letDefaultHandlerEndApplication":Z
    :cond_40
    move v0, v3

    .line 453
    goto :goto_27

    .line 462
    .restart local v0    # "handlingUncaughtException":Z
    :cond_42
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v6}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " fatal error : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5, p2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 468
    iget-object v3, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    .line 469
    .local v1, "lastActivity":Landroid/app/Activity;
    if-eqz v1, :cond_a3

    .line 470
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Finishing the last Activity prior to killing the Process"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 472
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Finished "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    iget-object v3, p0, Lorg/acra/ErrorReporter;->lastActivityCreated:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->clear()V

    .line 476
    :cond_a3
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-static {v3}, Landroid/os/Process;->killProcess(I)V

    .line 477
    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    goto :goto_3d
.end method

.method public static getInstance()Lorg/acra/ErrorReporter;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 226
    invoke-static {}, Lorg/acra/ACRA;->getErrorReporter()Lorg/acra/ErrorReporter;

    move-result-object v0

    return-object v0
.end method

.method private getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;
    .registers 8
    .param p1, "crashData"    # Lorg/acra/collector/CrashReportData;

    .prologue
    .line 915
    new-instance v1, Landroid/text/format/Time;

    invoke-direct {v1}, Landroid/text/format/Time;-><init>()V

    .line 916
    .local v1, "now":Landroid/text/format/Time;
    invoke-virtual {v1}, Landroid/text/format/Time;->setToNow()V

    .line 917
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v2

    .line 918
    .local v2, "timestamp":J
    sget-object v4, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    invoke-virtual {p1, v4}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v0

    .line 919
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

.method private report(Lorg/acra/ErrorReporter$ReportBuilder;)V
    .registers 16
    .param p1, "reportBuilder"    # Lorg/acra/ErrorReporter$ReportBuilder;

    .prologue
    .line 692
    iget-boolean v0, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-nez v0, :cond_5

    .line 855
    :cond_4
    :goto_4
    return-void

    .line 697
    :cond_5
    :try_start_5
    iget-object v0, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    invoke-interface {v0, p0}, Lorg/acra/ExceptionHandlerInitializer;->initializeExceptionHandler(Lorg/acra/ErrorReporter;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a} :catch_d5

    .line 702
    :goto_a
    const/4 v9, 0x0

    .line 704
    .local v9, "sendOnlySilentReports":Z
    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mForceSilent:Z
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$200(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v0

    if-nez v0, :cond_fa

    .line 707
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v8

    .line 720
    .local v8, "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    :cond_19
    :goto_19
    sget-object v0, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v0, :cond_2f

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->resToastText()I

    move-result v0

    if-eqz v0, :cond_10b

    sget-object v0, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v0, :cond_2f

    sget-object v0, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v0, :cond_10b

    :cond_2f
    const/4 v12, 0x1

    .line 723
    .local v12, "shouldDisplayToast":Z
    :goto_30
    new-instance v11, Lorg/acra/ErrorReporter$TimeHelper;

    const/4 v0, 0x0

    invoke-direct {v11, v0}, Lorg/acra/ErrorReporter$TimeHelper;-><init>(Lorg/acra/ErrorReporter$1;)V

    .line 724
    .local v11, "sentToastTimeMillis":Lorg/acra/ErrorReporter$TimeHelper;
    if-eqz v12, :cond_40

    .line 725
    new-instance v0, Lorg/acra/ErrorReporter$3;

    invoke-direct {v0, p0, v11}, Lorg/acra/ErrorReporter$3;-><init>(Lorg/acra/ErrorReporter;Lorg/acra/ErrorReporter$TimeHelper;)V

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$3;->start()V

    .line 746
    :cond_40
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mMessage:Ljava/lang/String;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$500(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;

    move-result-object v2

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mCustomData:Ljava/util/Map;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$700(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/util/Map;

    move-result-object v3

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mForceSilent:Z
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$200(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v4

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mUncaughtExceptionThread:Ljava/lang/Thread;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$800(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lorg/acra/collector/CrashReportDataFactory;->createCrashData(Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ZLjava/lang/Thread;)Lorg/acra/collector/CrashReportData;

    move-result-object v6

    .line 752
    .local v6, "crashReportData":Lorg/acra/collector/CrashReportData;
    invoke-direct {p0, v6}, Lorg/acra/ErrorReporter;->getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/lang/String;

    move-result-object v4

    .line 753
    .local v4, "reportFileName":Ljava/lang/String;
    invoke-direct {p0, v4, v6}, Lorg/acra/ErrorReporter;->saveCrashReportFile(Ljava/lang/String;Lorg/acra/collector/CrashReportData;)V

    .line 755
    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$900(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v0

    if-eqz v0, :cond_7c

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->sendReportsAtShutdown()Z

    move-result v0

    if-nez v0, :cond_7c

    .line 756
    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mUncaughtExceptionThread:Ljava/lang/Thread;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$800(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Thread;

    move-result-object v0

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mException:Ljava/lang/Throwable;
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$600(Lorg/acra/ErrorReporter$ReportBuilder;)Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/acra/ErrorReporter;->endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 759
    :cond_7c
    const/4 v10, 0x0

    .line 761
    .local v10, "sender":Lorg/acra/SendWorker;
    sget-object v0, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v0, :cond_90

    sget-object v0, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v0, :cond_90

    iget-object v0, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "acra.alwaysaccept"

    const/4 v5, 0x0

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_10e

    .line 766
    :cond_90
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "About to start ReportSenderWorker from #handleException"

    invoke-interface {v0, v1, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 767
    const/4 v0, 0x1

    invoke-virtual {p0, v9, v0}, Lorg/acra/ErrorReporter;->startSendingReports(ZZ)Lorg/acra/SendWorker;

    move-result-object v10

    .line 768
    sget-object v0, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v0, :cond_a8

    # getter for: Lorg/acra/ErrorReporter$ReportBuilder;->mEndsApplication:Z
    invoke-static {p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$900(Lorg/acra/ErrorReporter$ReportBuilder;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 779
    :cond_a8
    :goto_a8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    .line 780
    if-eqz v12, :cond_b8

    .line 783
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/acra/ErrorReporter;->toastWaitEnded:Z

    .line 784
    new-instance v0, Lorg/acra/ErrorReporter$4;

    invoke-direct {v0, p0, v11}, Lorg/acra/ErrorReporter$4;-><init>(Lorg/acra/ErrorReporter;Lorg/acra/ErrorReporter$TimeHelper;)V

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$4;->start()V

    .line 806
    :cond_b8
    move-object v2, v10

    .line 807
    .local v2, "worker":Lorg/acra/SendWorker;
    sget-object v0, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v0, :cond_11f

    iget-object v0, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v1, "acra.alwaysaccept"

    const/4 v5, 0x0

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_11f

    const/4 v3, 0x1

    .line 810
    .local v3, "showDirectDialog":Z
    :goto_c9
    new-instance v0, Lorg/acra/ErrorReporter$5;

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/acra/ErrorReporter$5;-><init>(Lorg/acra/ErrorReporter;Lorg/acra/SendWorker;ZLjava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)V

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$5;->start()V

    goto/16 :goto_4

    .line 698
    .end local v2    # "worker":Lorg/acra/SendWorker;
    .end local v3    # "showDirectDialog":Z
    .end local v4    # "reportFileName":Ljava/lang/String;
    .end local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .end local v8    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    .end local v9    # "sendOnlySilentReports":Z
    .end local v10    # "sender":Lorg/acra/SendWorker;
    .end local v11    # "sentToastTimeMillis":Lorg/acra/ErrorReporter$TimeHelper;
    .end local v12    # "shouldDisplayToast":Z
    :catch_d5
    move-exception v7

    .line 699
    .local v7, "exceptionInRunnable":Ljava/lang/Exception;
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Failed to initlize "

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v13, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v13, " from #handleException"

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v1, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 709
    .end local v7    # "exceptionInRunnable":Ljava/lang/Exception;
    .restart local v9    # "sendOnlySilentReports":Z
    :cond_fa
    sget-object v8, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    .line 715
    .restart local v8    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v0

    sget-object v1, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v0, v1, :cond_19

    .line 716
    const/4 v9, 0x1

    goto/16 :goto_19

    .line 720
    :cond_10b
    const/4 v12, 0x0

    goto/16 :goto_30

    .line 774
    .restart local v4    # "reportFileName":Ljava/lang/String;
    .restart local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .restart local v10    # "sender":Lorg/acra/SendWorker;
    .restart local v11    # "sentToastTimeMillis":Lorg/acra/ErrorReporter$TimeHelper;
    .restart local v12    # "shouldDisplayToast":Z
    :cond_10e
    sget-object v0, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v0, :cond_a8

    .line 775
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Creating Notification."

    invoke-interface {v0, v1, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 776
    invoke-direct {p0, v4, p1}, Lorg/acra/ErrorReporter;->createNotification(Ljava/lang/String;Lorg/acra/ErrorReporter$ReportBuilder;)V

    goto :goto_a8

    .line 807
    .restart local v2    # "worker":Lorg/acra/SendWorker;
    :cond_11f
    const/4 v3, 0x0

    goto :goto_c9
.end method

.method private saveCrashReportFile(Ljava/lang/String;Lorg/acra/collector/CrashReportData;)V
    .registers 9
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "crashData"    # Lorg/acra/collector/CrashReportData;

    .prologue
    .line 940
    :try_start_0
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Writing crash report file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 941
    new-instance v1, Lorg/acra/CrashReportPersister;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v1, v2}, Lorg/acra/CrashReportPersister;-><init>(Landroid/content/Context;)V

    .line 942
    .local v1, "persister":Lorg/acra/CrashReportPersister;
    invoke-virtual {v1, p2, p1}, Lorg/acra/CrashReportPersister;->store(Lorg/acra/collector/CrashReportData;Ljava/lang/String;)V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2a} :catch_2b

    .line 946
    .end local v1    # "persister":Lorg/acra/CrashReportPersister;
    :goto_2a
    return-void

    .line 943
    :catch_2b
    move-exception v0

    .line 944
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "An error occurred while writing the report file..."

    invoke-interface {v2, v3, v4, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2a
.end method


# virtual methods
.method public addCustomData(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 240
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1, p2}, Lorg/acra/collector/CrashReportDataFactory;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 241
    return-void
.end method

.method public addReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 3
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 344
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    return-void
.end method

.method public checkReportsOnApplicationStart()V
    .registers 15

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 544
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v12

    if-eqz v12, :cond_3f

    .line 547
    iget-object v12, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    const-string v13, "acra.lastVersionNr"

    invoke-interface {v12, v13, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    int-to-long v1, v12

    .line 548
    .local v1, "lastVersionNr":J
    new-instance v6, Lorg/acra/util/PackageManagerWrapper;

    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v6, v12}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 549
    .local v6, "packageManagerWrapper":Lorg/acra/util/PackageManagerWrapper;
    invoke-virtual {v6}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 550
    .local v5, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v5, :cond_3f

    .line 551
    iget v12, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    int-to-long v12, v12

    cmp-long v12, v12, v1

    if-lez v12, :cond_a2

    move v3, v10

    .line 552
    .local v3, "newVersion":Z
    :goto_2a
    if-eqz v3, :cond_2f

    .line 553
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->deletePendingReports()V

    .line 555
    :cond_2f
    iget-object v12, p0, Lorg/acra/ErrorReporter;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v12}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 556
    .local v7, "prefsEditor":Landroid/content/SharedPreferences$Editor;
    const-string v12, "acra.lastVersionNr"

    iget v13, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-interface {v7, v12, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 557
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 561
    .end local v1    # "lastVersionNr":J
    .end local v3    # "newVersion":Z
    .end local v5    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v6    # "packageManagerWrapper":Lorg/acra/util/PackageManagerWrapper;
    .end local v7    # "prefsEditor":Landroid/content/SharedPreferences$Editor;
    :cond_3f
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v9

    .line 563
    .local v9, "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    sget-object v12, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_4f

    sget-object v12, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v9, v12, :cond_5c

    :cond_4f
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v12

    if-eqz v12, :cond_5c

    .line 571
    invoke-virtual {p0, v10}, Lorg/acra/ErrorReporter;->deletePendingNonApprovedReports(Z)V

    .line 574
    :cond_5c
    new-instance v8, Lorg/acra/CrashReportFinder;

    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-direct {v8, v12}, Lorg/acra/CrashReportFinder;-><init>(Landroid/content/Context;)V

    .line 575
    .local v8, "reportFinder":Lorg/acra/CrashReportFinder;
    invoke-virtual {v8}, Lorg/acra/CrashReportFinder;->getCrashReportFiles()[Ljava/lang/String;

    move-result-object v0

    .line 577
    .local v0, "filesList":[Ljava/lang/String;
    if-eqz v0, :cond_a1

    array-length v12, v0

    if-lez v12, :cond_a1

    .line 586
    invoke-direct {p0, v0}, Lorg/acra/ErrorReporter;->containsOnlySilentOrApprovedReports([Ljava/lang/String;)Z

    move-result v4

    .line 588
    .local v4, "onlySilentOrApprovedReports":Z
    sget-object v12, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_82

    sget-object v12, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_82

    if-eqz v4, :cond_a1

    sget-object v12, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v9, v12, :cond_82

    sget-object v12, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v9, v12, :cond_a1

    .line 592
    :cond_82
    sget-object v12, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-ne v9, v12, :cond_95

    if-nez v4, :cond_95

    .line 595
    iget-object v12, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v13

    invoke-virtual {v13}, Lorg/acra/ACRAConfiguration;->resToastText()I

    move-result v13

    invoke-static {v12, v13, v10}, Lorg/acra/util/ToastSender;->sendToast(Landroid/content/Context;II)V

    .line 598
    :cond_95
    sget-object v10, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "About to start ReportSenderWorker from #checkReportOnApplicationStart"

    invoke-interface {v10, v12, v13}, Lorg/acra/log/ACRALog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    invoke-virtual {p0, v11, v11}, Lorg/acra/ErrorReporter;->startSendingReports(ZZ)Lorg/acra/SendWorker;

    .line 603
    .end local v4    # "onlySilentOrApprovedReports":Z
    :cond_a1
    return-void

    .end local v0    # "filesList":[Ljava/lang/String;
    .end local v8    # "reportFinder":Lorg/acra/CrashReportFinder;
    .end local v9    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    .restart local v1    # "lastVersionNr":J
    .restart local v5    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v6    # "packageManagerWrapper":Lorg/acra/util/PackageManagerWrapper;
    :cond_a2
    move v3, v11

    .line 551
    goto :goto_2a
.end method

.method public clearCustomData()V
    .registers 2

    .prologue
    .line 320
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0}, Lorg/acra/collector/CrashReportDataFactory;->clearCustomData()V

    .line 321
    return-void
.end method

.method deletePendingNonApprovedReports(Z)V
    .registers 5
    .param p1, "keepOne"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 615
    if-eqz p1, :cond_9

    move v0, v1

    .line 616
    .local v0, "nbReportsToKeep":I
    :goto_5
    invoke-direct {p0, v2, v1, v0}, Lorg/acra/ErrorReporter;->deletePendingReports(ZZI)V

    .line 617
    return-void

    .end local v0    # "nbReportsToKeep":I
    :cond_9
    move v0, v2

    .line 615
    goto :goto_5
.end method

.method deletePendingReports()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 535
    const/4 v0, 0x0

    invoke-direct {p0, v1, v1, v0}, Lorg/acra/ErrorReporter;->deletePendingReports(ZZI)V

    .line 536
    return-void
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->getCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleException(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 651
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->reportBuilder()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/acra/ErrorReporter$ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$ReportBuilder;->send()V

    .line 654
    return-void
.end method

.method public handleException(Ljava/lang/Throwable;Z)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;
    .param p2, "endApplication"    # Z

    .prologue
    .line 632
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->reportBuilder()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/acra/ErrorReporter$ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    .line 634
    .local v0, "builder":Lorg/acra/ErrorReporter$ReportBuilder;
    if-eqz p2, :cond_d

    .line 635
    invoke-virtual {v0}, Lorg/acra/ErrorReporter$ReportBuilder;->endsApplication()Lorg/acra/ErrorReporter$ReportBuilder;

    .line 637
    :cond_d
    invoke-virtual {v0}, Lorg/acra/ErrorReporter$ReportBuilder;->send()V

    .line 638
    return-void
.end method

.method public handleSilentException(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 492
    iget-boolean v0, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-eqz v0, :cond_1d

    .line 493
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->reportBuilder()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/acra/ErrorReporter$ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$ReportBuilder;->forceSilent()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/acra/ErrorReporter$ReportBuilder;->send()V

    .line 497
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA sent Silent report."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    :goto_1c
    return-void

    .line 501
    :cond_1d
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA is disabled. Silent report not sent."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1c
.end method

.method public putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 266
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1, p2}, Lorg/acra/collector/CrashReportDataFactory;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeAllReportSenders()V
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 383
    return-void
.end method

.method public removeCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 312
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->removeCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 3
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 357
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
    .line 367
    .local p1, "senderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/acra/sender/ReportSender;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 368
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

    .line 369
    .local v1, "sender":Lorg/acra/sender/ReportSender;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 370
    iget-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_e

    .line 374
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "sender":Lorg/acra/sender/ReportSender;
    :cond_26
    return-void
.end method

.method public reportBuilder()Lorg/acra/ErrorReporter$ReportBuilder;
    .registers 2

    .prologue
    .line 662
    new-instance v0, Lorg/acra/ErrorReporter$ReportBuilder;

    invoke-direct {v0, p0}, Lorg/acra/ErrorReporter$ReportBuilder;-><init>(Lorg/acra/ErrorReporter;)V

    return-object v0
.end method

.method public setDefaultReportSenders()V
    .registers 8

    .prologue
    .line 1001
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 1002
    .local v0, "conf":Lorg/acra/annotation/ReportsCrashes;
    invoke-static {}, Lorg/acra/ACRA;->getApplication()Landroid/app/Application;

    move-result-object v1

    .line 1003
    .local v1, "mApplication":Landroid/app/Application;
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->removeAllReportSenders()V

    .line 1007
    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3e

    .line 1008
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " reports will be sent by email (if accepted by user)."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1009
    new-instance v3, Lorg/acra/sender/EmailIntentSender;

    invoke-direct {v3, v1}, Lorg/acra/sender/EmailIntentSender;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v3}, Lorg/acra/ErrorReporter;->setReportSender(Lorg/acra/sender/ReportSender;)V

    .line 1033
    :cond_3d
    :goto_3d
    return-void

    .line 1013
    :cond_3e
    new-instance v2, Lorg/acra/util/PackageManagerWrapper;

    invoke-direct {v2, v1}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 1014
    .local v2, "pm":Lorg/acra/util/PackageManagerWrapper;
    const-string v3, "android.permission.INTERNET"

    invoke-virtual {v2, v3}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_76

    .line 1020
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " should be granted permission "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "android.permission.INTERNET"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " if you want your crash reports to be sent. If you don\'t want to add this permission to your application you can also enable sending reports by email. If this is your will then provide your email address in @ReportsCrashes(mailTo=\"your.account@domain.com\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3d

    .line 1030
    :cond_76
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3d

    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->formUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3d

    .line 1031
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

    goto :goto_3d
.end method

.method public setEnabled(Z)V
    .registers 6
    .param p1, "enabled"    # Z

    .prologue
    .line 512
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p1, :cond_31

    const-string v0, "enabled"

    :goto_13
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " for "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 513
    iput-boolean p1, p0, Lorg/acra/ErrorReporter;->enabled:Z

    .line 514
    return-void

    .line 512
    :cond_31
    const-string v0, "disabled"

    goto :goto_13
.end method

.method public setExceptionHandlerInitializer(Lorg/acra/ExceptionHandlerInitializer;)V
    .registers 2
    .param p1, "initializer"    # Lorg/acra/ExceptionHandlerInitializer;

    .prologue
    .line 298
    if-eqz p1, :cond_5

    .end local p1    # "initializer":Lorg/acra/ExceptionHandlerInitializer;
    :goto_2
    iput-object p1, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    .line 299
    return-void

    .line 298
    .restart local p1    # "initializer":Lorg/acra/ExceptionHandlerInitializer;
    :cond_5
    sget-object p1, Lorg/acra/ErrorReporter;->NULL_EXCEPTION_HANDLER_INITIALIZER:Lorg/acra/ExceptionHandlerInitializer;

    goto :goto_2
.end method

.method public setReportSender(Lorg/acra/sender/ReportSender;)V
    .registers 2
    .param p1, "sender"    # Lorg/acra/sender/ReportSender;

    .prologue
    .line 393
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->removeAllReportSenders()V

    .line 394
    invoke-virtual {p0, p1}, Lorg/acra/ErrorReporter;->addReportSender(Lorg/acra/sender/ReportSender;)V

    .line 395
    return-void
.end method

.method startSendingReports(ZZ)Lorg/acra/SendWorker;
    .registers 6
    .param p1, "onlySendSilentReports"    # Z
    .param p2, "approveReportsFirst"    # Z

    .prologue
    .line 526
    new-instance v0, Lorg/acra/SendWorker;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->mReportSenders:Ljava/util/List;

    invoke-direct {v0, v1, v2, p1, p2}, Lorg/acra/SendWorker;-><init>(Landroid/content/Context;Ljava/util/List;ZZ)V

    .line 527
    .local v0, "worker":Lorg/acra/SendWorker;
    invoke-virtual {v0}, Lorg/acra/SendWorker;->start()V

    .line 528
    return-object v0
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Thread;
    .param p2, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 409
    :try_start_0
    iget-boolean v1, p0, Lorg/acra/ErrorReporter;->enabled:Z

    if-nez v1, :cond_98

    .line 410
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_34

    .line 411
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA is disabled for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - forwarding uncaught Exception on to default ExceptionHandler"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 440
    :cond_33
    :goto_33
    return-void

    .line 415
    :cond_34
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA is disabled for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - no default ExceptionHandler"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA caught a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, p2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8c
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_8c} :catch_8d

    goto :goto_33

    .line 433
    :catch_8d
    move-exception v0

    .line 436
    .local v0, "fatality":Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v1, :cond_33

    .line 437
    iget-object v1, p0, Lorg/acra/ErrorReporter;->mDfltExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_33

    .line 423
    .end local v0    # "fatality":Ljava/lang/Throwable;
    :cond_98
    :try_start_98
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ACRA caught a "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter;->mContext:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, p2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 425
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Building report"

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    invoke-virtual {p0}, Lorg/acra/ErrorReporter;->reportBuilder()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v1

    # invokes: Lorg/acra/ErrorReporter$ReportBuilder;->uncaughtExceptionThread(Ljava/lang/Thread;)Lorg/acra/ErrorReporter$ReportBuilder;
    invoke-static {v1, p1}, Lorg/acra/ErrorReporter$ReportBuilder;->access$100(Lorg/acra/ErrorReporter$ReportBuilder;Ljava/lang/Thread;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/acra/ErrorReporter$ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ErrorReporter$ReportBuilder;->endsApplication()Lorg/acra/ErrorReporter$ReportBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/acra/ErrorReporter$ReportBuilder;->send()V
    :try_end_e6
    .catch Ljava/lang/Throwable; {:try_start_98 .. :try_end_e6} :catch_8d

    goto/16 :goto_33
.end method
