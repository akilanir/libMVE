.class public final Lorg/acra/builder/ReportExecutor;
.super Ljava/lang/Object;
.source "ReportExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/builder/ReportExecutor$TimeHelper;
    }
.end annotation


# static fields
.field private static final THREAD_SLEEP_INTERVAL_MILLIS:I = 0x64

.field private static mNotificationCounter:I


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;

.field private final crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

.field private final defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private enabled:Z

.field private final lastActivityManager:Lorg/acra/builder/LastActivityManager;

.field private final reportPrimer:Lorg/acra/builder/ReportPrimer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 61
    const/4 v0, 0x0

    sput v0, Lorg/acra/builder/ReportExecutor;->mNotificationCounter:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Lorg/acra/collector/CrashReportDataFactory;Lorg/acra/builder/LastActivityManager;Ljava/lang/Thread$UncaughtExceptionHandler;Lorg/acra/builder/ReportPrimer;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "crashReportDataFactory"    # Lorg/acra/collector/CrashReportDataFactory;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "lastActivityManager"    # Lorg/acra/builder/LastActivityManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "defaultExceptionHandler"    # Ljava/lang/Thread$UncaughtExceptionHandler;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "reportPrimer"    # Lorg/acra/builder/ReportPrimer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/acra/builder/ReportExecutor;->enabled:Z

    .line 65
    iput-object p1, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    .line 66
    iput-object p2, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    .line 67
    iput-object p3, p0, Lorg/acra/builder/ReportExecutor;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    .line 68
    iput-object p4, p0, Lorg/acra/builder/ReportExecutor;->lastActivityManager:Lorg/acra/builder/LastActivityManager;

    .line 69
    iput-object p5, p0, Lorg/acra/builder/ReportExecutor;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 70
    iput-object p6, p0, Lorg/acra/builder/ReportExecutor;->reportPrimer:Lorg/acra/builder/ReportPrimer;

    .line 71
    return-void
.end method

.method static synthetic access$100(Lorg/acra/builder/ReportExecutor;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lorg/acra/builder/ReportExecutor;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lorg/acra/builder/ReportExecutor;)Lorg/acra/config/ACRAConfiguration;
    .registers 2
    .param p0, "x0"    # Lorg/acra/builder/ReportExecutor;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    return-object v0
.end method

.method static synthetic access$400(Lorg/acra/builder/ReportExecutor;Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V
    .registers 4
    .param p0, "x0"    # Lorg/acra/builder/ReportExecutor;
    .param p1, "x1"    # Lorg/acra/builder/ReportBuilder;
    .param p2, "x2"    # Ljava/io/File;
    .param p3, "x3"    # Z

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lorg/acra/builder/ReportExecutor;->dialogAndEnd(Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V

    return-void
.end method

.method private createCrashReportDialogIntent(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)Landroid/content/Intent;
    .registers 8
    .param p1, "reportFile"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reportBuilder"    # Lorg/acra/builder/ReportBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 383
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_2c

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating DialogIntent for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    :cond_2c
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    iget-object v2, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v2}, Lorg/acra/config/ACRAConfiguration;->reportDialogClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 385
    .local v0, "dialogIntent":Landroid/content/Intent;
    const-string v1, "REPORT_FILE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 386
    const-string v1, "REPORT_EXCEPTION"

    invoke-virtual {p2}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 387
    const-string v1, "REPORT_CONFIG"

    iget-object v2, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 388
    return-object v0
.end method

.method private createNotification(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)V
    .registers 20
    .param p1, "reportFile"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reportBuilder"    # Lorg/acra/builder/ReportBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 299
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    const-string v14, "notification"

    invoke-virtual {v13, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    .line 302
    .local v9, "notificationManager":Landroid/app/NotificationManager;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v13}, Lorg/acra/config/ACRAConfiguration;->resNotifIcon()I

    move-result v7

    .line 304
    .local v7, "icon":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v14}, Lorg/acra/config/ACRAConfiguration;->resNotifTickerText()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v10

    .line 305
    .local v10, "tickerText":Ljava/lang/CharSequence;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 307
    .local v11, "when":J
    sget-boolean v13, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v13, :cond_48

    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Creating Notification for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    :cond_48
    invoke-direct/range {p0 .. p2}, Lorg/acra/builder/ReportExecutor;->createCrashReportDialogIntent(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)Landroid/content/Intent;

    move-result-object v5

    .line 309
    .local v5, "crashReportDialogIntent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    sget v14, Lorg/acra/builder/ReportExecutor;->mNotificationCounter:I

    add-int/lit8 v15, v14, 0x1

    sput v15, Lorg/acra/builder/ReportExecutor;->mNotificationCounter:I

    const/high16 v15, 0x8000000

    invoke-static {v13, v14, v5, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 311
    .local v2, "contentIntent":Landroid/app/PendingIntent;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v14}, Lorg/acra/config/ACRAConfiguration;->resNotifTitle()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 312
    .local v4, "contentTitle":Ljava/lang/CharSequence;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v14}, Lorg/acra/config/ACRAConfiguration;->resNotifText()I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 314
    .local v3, "contentText":Ljava/lang/CharSequence;
    new-instance v1, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-direct {v1, v13}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 316
    .local v1, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-virtual {v1, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 317
    invoke-virtual {v13, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 318
    invoke-virtual {v13, v11, v12}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    const/4 v14, 0x1

    .line 319
    invoke-virtual {v13, v14}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 320
    invoke-virtual {v13, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 321
    invoke-virtual {v13, v3}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 322
    invoke-virtual {v13, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v13

    .line 323
    invoke-virtual {v13}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v8

    .line 325
    .local v8, "notification":Landroid/app/Notification;
    iget v13, v8, Landroid/app/Notification;->flags:I

    or-int/lit8 v13, v13, 0x10

    iput v13, v8, Landroid/app/Notification;->flags:I

    .line 330
    invoke-direct/range {p0 .. p2}, Lorg/acra/builder/ReportExecutor;->createCrashReportDialogIntent(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)Landroid/content/Intent;

    move-result-object v6

    .line 331
    .local v6, "deleteIntent":Landroid/content/Intent;
    const-string v13, "FORCE_CANCEL"

    const/4 v14, 0x1

    invoke-virtual {v6, v13, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 332
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    const/4 v14, -0x1

    const/4 v15, 0x0

    invoke-static {v13, v14, v6, v15}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v13

    iput-object v13, v8, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 335
    const/16 v13, 0x29a

    invoke-virtual {v9, v13, v8}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 336
    return-void
.end method

.method private dialogAndEnd(Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V
    .registers 9
    .param p1, "reportBuilder"    # Lorg/acra/builder/ReportBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reportFile"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "shouldShowDialog"    # Z

    .prologue
    .line 226
    if-eqz p3, :cond_2e

    .line 230
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_20

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Creating CrashReportDialog for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    :cond_20
    invoke-direct {p0, p2, p1}, Lorg/acra/builder/ReportExecutor;->createCrashReportDialogIntent(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)Landroid/content/Intent;

    move-result-object v0

    .line 232
    .local v0, "dialogIntent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 233
    iget-object v1, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 236
    .end local v0    # "dialogIntent":Landroid/content/Intent;
    :cond_2e
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_50

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Wait for Toast + worker ended. Kill Application ? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->isEndApplication()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    :cond_50
    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->isEndApplication()Z

    move-result v1

    if-eqz v1, :cond_61

    .line 239
    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->getUncaughtExceptionThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/acra/builder/ReportExecutor;->endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 241
    :cond_61
    return-void
.end method

.method private endApplication(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 10
    .param p1, "uncaughtExceptionThread"    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "th"    # Ljava/lang/Throwable;

    .prologue
    .line 247
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->alsoReportToAndroidFramework()Z

    move-result v2

    .line 249
    .local v2, "letDefaultHandlerEndApplication":Z
    if-eqz p1, :cond_24

    const/4 v0, 0x1

    .line 250
    .local v0, "handlingUncaughtException":Z
    :goto_9
    if-eqz v0, :cond_26

    if-eqz v2, :cond_26

    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v3, :cond_26

    .line 252
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_1e

    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Handing Exception on to default ExceptionHandler"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    :cond_1e
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v3, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 273
    :goto_23
    return-void

    .line 249
    .end local v0    # "handlingUncaughtException":Z
    :cond_24
    const/4 v0, 0x0

    goto :goto_9

    .line 262
    .restart local v0    # "handlingUncaughtException":Z
    :cond_26
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->lastActivityManager:Lorg/acra/builder/LastActivityManager;

    invoke-virtual {v3}, Lorg/acra/builder/LastActivityManager;->getLastActivity()Landroid/app/Activity;

    move-result-object v1

    .line 263
    .local v1, "lastActivity":Landroid/app/Activity;
    if-eqz v1, :cond_65

    .line 264
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_3b

    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Finishing the last Activity prior to killing the Process"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    :cond_3b
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 266
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_60

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

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 267
    :cond_60
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->lastActivityManager:Lorg/acra/builder/LastActivityManager;

    invoke-virtual {v3}, Lorg/acra/builder/LastActivityManager;->clearLastActivity()V

    .line 270
    :cond_65
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-static {v3}, Landroid/os/Process;->killProcess(I)V

    .line 271
    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    goto :goto_23
.end method

.method private getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/io/File;
    .registers 9
    .param p1, "crashData"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 340
    sget-object v4, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    invoke-virtual {p1, v4}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v3

    .line 341
    .local v3, "timestamp":Ljava/lang/String;
    sget-object v4, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    invoke-virtual {p1, v4}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v1

    .line 342
    .local v1, "isSilent":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v3, :cond_3a

    .end local v3    # "timestamp":Ljava/lang/String;
    :goto_13
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v1, :cond_48

    sget-object v4, Lorg/acra/ACRAConstants;->SILENT_SUFFIX:Ljava/lang/String;

    :goto_1b
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".stacktrace"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 345
    .local v0, "fileName":Ljava/lang/String;
    new-instance v2, Lorg/acra/file/ReportLocator;

    iget-object v4, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-direct {v2, v4}, Lorg/acra/file/ReportLocator;-><init>(Landroid/content/Context;)V

    .line 346
    .local v2, "reportLocator":Lorg/acra/file/ReportLocator;
    new-instance v4, Ljava/io/File;

    invoke-virtual {v2}, Lorg/acra/file/ReportLocator;->getUnapprovedFolder()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v4

    .line 342
    .end local v0    # "fileName":Ljava/lang/String;
    .end local v2    # "reportLocator":Lorg/acra/file/ReportLocator;
    .restart local v3    # "timestamp":Ljava/lang/String;
    :cond_3a
    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    goto :goto_13

    .end local v3    # "timestamp":Ljava/lang/String;
    :cond_48
    const-string v4, ""

    goto :goto_1b
.end method

.method private saveCrashReportFile(Ljava/io/File;Lorg/acra/collector/CrashReportData;)V
    .registers 9
    .param p1, "file"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "crashData"    # Lorg/acra/collector/CrashReportData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 366
    :try_start_0
    sget-boolean v2, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v2, :cond_1e

    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Writing crash report file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_1e
    new-instance v1, Lorg/acra/file/CrashReportPersister;

    invoke-direct {v1}, Lorg/acra/file/CrashReportPersister;-><init>()V

    .line 368
    .local v1, "persister":Lorg/acra/file/CrashReportPersister;
    invoke-virtual {v1, p2, p1}, Lorg/acra/file/CrashReportPersister;->store(Lorg/acra/collector/CrashReportData;Ljava/io/File;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    .line 372
    .end local v1    # "persister":Lorg/acra/file/CrashReportPersister;
    :goto_26
    return-void

    .line 369
    :catch_27
    move-exception v0

    .line 370
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "An error occurred while writing the report file..."

    invoke-interface {v2, v3, v4, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26
.end method

.method private startSendingReports(Z)V
    .registers 6
    .param p1, "onlySendSilentReports"    # Z

    .prologue
    .line 281
    iget-boolean v1, p0, Lorg/acra/builder/ReportExecutor;->enabled:Z

    if-eqz v1, :cond_12

    .line 282
    new-instance v0, Lorg/acra/sender/SenderServiceStarter;

    iget-object v1, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    iget-object v2, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, v1, v2}, Lorg/acra/sender/SenderServiceStarter;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 283
    .local v0, "starter":Lorg/acra/sender/SenderServiceStarter;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/acra/sender/SenderServiceStarter;->startService(ZZ)V

    .line 287
    .end local v0    # "starter":Lorg/acra/sender/SenderServiceStarter;
    :goto_11
    return-void

    .line 285
    :cond_12
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Would be sending reports, but ACRA is disabled"

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11
.end method


# virtual methods
.method public execute(Lorg/acra/builder/ReportBuilder;)V
    .registers 15
    .param p1, "reportBuilder"    # Lorg/acra/builder/ReportBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 119
    iget-boolean v3, p0, Lorg/acra/builder/ReportExecutor;->enabled:Z

    if-nez v3, :cond_10

    .line 120
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "ACRA is disabled. Report not sent."

    invoke-interface {v0, v1, v3}, Lorg/acra/log/ACRALog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    :cond_f
    :goto_f
    return-void

    .line 125
    :cond_10
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->reportPrimer:Lorg/acra/builder/ReportPrimer;

    iget-object v11, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-interface {v3, v11, p1}, Lorg/acra/builder/ReportPrimer;->primeReport(Landroid/content/Context;Lorg/acra/builder/ReportBuilder;)V

    .line 127
    const/4 v9, 0x0

    .line 129
    .local v9, "sendOnlySilentReports":Z
    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->isSendSilently()Z

    move-result v3

    if-nez v3, :cond_9b

    .line 131
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v8

    .line 144
    .local v8, "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    :cond_24
    :goto_24
    sget-object v3, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v3, :cond_38

    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    .line 145
    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->resToastText()I

    move-result v3

    if-eqz v3, :cond_aa

    sget-object v3, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v3, :cond_38

    sget-object v3, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v3, :cond_aa

    :cond_38
    move v10, v1

    .line 147
    .local v10, "shouldDisplayToast":Z
    :goto_39
    new-instance v2, Lorg/acra/builder/ReportExecutor$TimeHelper;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/acra/builder/ReportExecutor$TimeHelper;-><init>(Lorg/acra/builder/ReportExecutor$1;)V

    .line 148
    .local v2, "sentToastTimeMillis":Lorg/acra/builder/ReportExecutor$TimeHelper;
    if-eqz v10, :cond_49

    .line 149
    new-instance v3, Lorg/acra/builder/ReportExecutor$1;

    invoke-direct {v3, p0, v2}, Lorg/acra/builder/ReportExecutor$1;-><init>(Lorg/acra/builder/ReportExecutor;Lorg/acra/builder/ReportExecutor$TimeHelper;)V

    .line 164
    invoke-virtual {v3}, Lorg/acra/builder/ReportExecutor$1;->start()V

    .line 170
    :cond_49
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v3, p1}, Lorg/acra/collector/CrashReportDataFactory;->createCrashData(Lorg/acra/builder/ReportBuilder;)Lorg/acra/collector/CrashReportData;

    move-result-object v6

    .line 174
    .local v6, "crashReportData":Lorg/acra/collector/CrashReportData;
    invoke-direct {p0, v6}, Lorg/acra/builder/ReportExecutor;->getReportFileName(Lorg/acra/collector/CrashReportData;)Ljava/io/File;

    move-result-object v4

    .line 175
    .local v4, "reportFile":Ljava/io/File;
    invoke-direct {p0, v4, v6}, Lorg/acra/builder/ReportExecutor;->saveCrashReportFile(Ljava/io/File;Lorg/acra/collector/CrashReportData;)V

    .line 177
    new-instance v3, Lorg/acra/prefs/SharedPreferencesFactory;

    iget-object v11, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    iget-object v12, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v3, v11, v12}, Lorg/acra/prefs/SharedPreferencesFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    invoke-virtual {v3}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v7

    .line 178
    .local v7, "prefs":Landroid/content/SharedPreferences;
    sget-object v3, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v3, :cond_73

    sget-object v3, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-eq v8, v3, :cond_73

    const-string v3, "acra.alwaysaccept"

    .line 180
    invoke-interface {v7, v3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_ac

    .line 183
    :cond_73
    invoke-direct {p0, v9}, Lorg/acra/builder/ReportExecutor;->startSendingReports(Z)V

    .line 184
    sget-object v3, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v3, :cond_80

    invoke-virtual {p1}, Lorg/acra/builder/ReportBuilder;->isEndApplication()Z

    move-result v3

    if-eqz v3, :cond_f

    .line 195
    :cond_80
    :goto_80
    sget-object v3, Lorg/acra/ReportingInteractionMode;->DIALOG:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v3, :cond_c1

    const-string v3, "acra.alwaysaccept"

    .line 196
    invoke-interface {v7, v3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_c1

    move v5, v1

    .line 198
    .local v5, "showDirectDialog":Z
    :goto_8d
    if-eqz v10, :cond_c3

    .line 200
    new-instance v0, Lorg/acra/builder/ReportExecutor$2;

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/acra/builder/ReportExecutor$2;-><init>(Lorg/acra/builder/ReportExecutor;Lorg/acra/builder/ReportExecutor$TimeHelper;Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V

    .line 219
    invoke-virtual {v0}, Lorg/acra/builder/ReportExecutor$2;->start()V

    goto/16 :goto_f

    .line 133
    .end local v2    # "sentToastTimeMillis":Lorg/acra/builder/ReportExecutor$TimeHelper;
    .end local v4    # "reportFile":Ljava/io/File;
    .end local v5    # "showDirectDialog":Z
    .end local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .end local v7    # "prefs":Landroid/content/SharedPreferences;
    .end local v8    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    .end local v10    # "shouldDisplayToast":Z
    :cond_9b
    sget-object v8, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    .line 139
    .restart local v8    # "reportingInteractionMode":Lorg/acra/ReportingInteractionMode;
    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v3

    sget-object v11, Lorg/acra/ReportingInteractionMode;->SILENT:Lorg/acra/ReportingInteractionMode;

    if-eq v3, v11, :cond_24

    .line 140
    const/4 v9, 0x1

    goto/16 :goto_24

    :cond_aa
    move v10, v0

    .line 145
    goto :goto_39

    .line 190
    .restart local v2    # "sentToastTimeMillis":Lorg/acra/builder/ReportExecutor$TimeHelper;
    .restart local v4    # "reportFile":Ljava/io/File;
    .restart local v6    # "crashReportData":Lorg/acra/collector/CrashReportData;
    .restart local v7    # "prefs":Landroid/content/SharedPreferences;
    .restart local v10    # "shouldDisplayToast":Z
    :cond_ac
    sget-object v3, Lorg/acra/ReportingInteractionMode;->NOTIFICATION:Lorg/acra/ReportingInteractionMode;

    if-ne v8, v3, :cond_80

    .line 191
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_bd

    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v11, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "Creating Notification."

    invoke-interface {v3, v11, v12}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    :cond_bd
    invoke-direct {p0, v4, p1}, Lorg/acra/builder/ReportExecutor;->createNotification(Ljava/io/File;Lorg/acra/builder/ReportBuilder;)V

    goto :goto_80

    :cond_c1
    move v5, v0

    .line 196
    goto :goto_8d

    .line 221
    .restart local v5    # "showDirectDialog":Z
    :cond_c3
    invoke-direct {p0, p1, v4, v5}, Lorg/acra/builder/ReportExecutor;->dialogAndEnd(Lorg/acra/builder/ReportBuilder;Ljava/io/File;Z)V

    goto/16 :goto_f
.end method

.method public handReportToDefaultExceptionHandler(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 7
    .param p1, "t"    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 93
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_30

    .line 94
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is disabled for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - forwarding uncaught Exception on to default ExceptionHandler"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 102
    :goto_2f
    return-void

    .line 98
    :cond_30
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is disabled for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - no default ExceptionHandler"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

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

    const-string v3, " for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/acra/builder/ReportExecutor;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2, p2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2f
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/acra/builder/ReportExecutor;->enabled:Z

    return v0
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lorg/acra/builder/ReportExecutor;->enabled:Z

    .line 110
    return-void
.end method
