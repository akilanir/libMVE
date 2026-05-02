.class public Lorg/acra/ErrorReporter;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final context:Landroid/app/Application;

.field private final crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private volatile exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final reportExecutor:Lorg/acra/builder/ReportExecutor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final supportedAndroidVersion:Z


# direct methods
.method constructor <init>(Landroid/app/Application;Lorg/acra/config/ACRAConfiguration;Landroid/content/SharedPreferences;ZZZ)V
    .registers 21
    .param p1, "context"    # Landroid/app/Application;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "prefs"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4, "enabled"    # Z
    .param p5, "supportedAndroidVersion"    # Z
    .param p6, "listenForUncaughtExceptions"    # Z

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v1, Lorg/acra/ErrorReporter$1;

    invoke-direct {v1, p0}, Lorg/acra/ErrorReporter$1;-><init>(Lorg/acra/ErrorReporter;)V

    iput-object v1, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    .line 93
    iput-object p1, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    .line 94
    move-object/from16 v0, p2

    iput-object v0, p0, Lorg/acra/ErrorReporter;->config:Lorg/acra/config/ACRAConfiguration;

    .line 95
    move/from16 v0, p5

    iput-boolean v0, p0, Lorg/acra/ErrorReporter;->supportedAndroidVersion:Z

    .line 100
    invoke-virtual/range {p2 .. p2}, Lorg/acra/config/ACRAConfiguration;->getReportFields()Lorg/acra/collections/ImmutableSet;

    move-result-object v1

    sget-object v2, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    invoke-virtual {v1, v2}, Lorg/acra/collections/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_60

    .line 101
    iget-object v1, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    invoke-static {v1}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 108
    .local v6, "initialConfiguration":Ljava/lang/String;
    :goto_26
    new-instance v5, Ljava/util/GregorianCalendar;

    invoke-direct {v5}, Ljava/util/GregorianCalendar;-><init>()V

    .line 110
    .local v5, "appStartDate":Ljava/util/Calendar;
    new-instance v1, Lorg/acra/collector/CrashReportDataFactory;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct/range {v1 .. v6}, Lorg/acra/collector/CrashReportDataFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Landroid/content/SharedPreferences;Ljava/util/Calendar;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    .line 113
    if-eqz p6, :cond_62

    .line 114
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v12

    .line 115
    .local v12, "defaultExceptionHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 120
    :goto_41
    new-instance v11, Lorg/acra/builder/LastActivityManager;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    invoke-direct {v11, v1}, Lorg/acra/builder/LastActivityManager;-><init>(Landroid/app/Application;)V

    .line 121
    .local v11, "lastActivityManager":Lorg/acra/builder/LastActivityManager;
    invoke-static/range {p2 .. p2}, Lorg/acra/ErrorReporter;->getReportPrimer(Lorg/acra/config/ACRAConfiguration;)Lorg/acra/builder/ReportPrimer;

    move-result-object v13

    .line 123
    .local v13, "reportPrimer":Lorg/acra/builder/ReportPrimer;
    new-instance v7, Lorg/acra/builder/ReportExecutor;

    iget-object v10, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    move-object v8, p1

    move-object/from16 v9, p2

    invoke-direct/range {v7 .. v13}, Lorg/acra/builder/ReportExecutor;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Lorg/acra/collector/CrashReportDataFactory;Lorg/acra/builder/LastActivityManager;Ljava/lang/Thread$UncaughtExceptionHandler;Lorg/acra/builder/ReportPrimer;)V

    iput-object v7, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    .line 124
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Lorg/acra/builder/ReportExecutor;->setEnabled(Z)V

    .line 125
    return-void

    .line 103
    .end local v5    # "appStartDate":Ljava/util/Calendar;
    .end local v6    # "initialConfiguration":Ljava/lang/String;
    .end local v11    # "lastActivityManager":Lorg/acra/builder/LastActivityManager;
    .end local v12    # "defaultExceptionHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    .end local v13    # "reportPrimer":Lorg/acra/builder/ReportPrimer;
    :cond_60
    const/4 v6, 0x0

    .restart local v6    # "initialConfiguration":Ljava/lang/String;
    goto :goto_26

    .line 117
    .restart local v5    # "appStartDate":Ljava/util/Calendar;
    :cond_62
    const/4 v12, 0x0

    .restart local v12    # "defaultExceptionHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    goto :goto_41
.end method

.method private static getReportPrimer(Lorg/acra/config/ACRAConfiguration;)Lorg/acra/builder/ReportPrimer;
    .registers 6
    .param p0, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 374
    :try_start_0
    invoke-virtual {p0}, Lorg/acra/config/ACRAConfiguration;->reportPrimerClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/acra/builder/ReportPrimer;
    :try_end_a
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_a} :catch_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_a} :catch_36

    .line 381
    :goto_a
    return-object v1

    .line 375
    :catch_b
    move-exception v0

    .line 376
    .local v0, "e":Ljava/lang/InstantiationException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not construct ReportPrimer from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/acra/config/ACRAConfiguration;->reportPrimerClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - not priming"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 381
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :goto_30
    new-instance v1, Lorg/acra/builder/NoOpReportPrimer;

    invoke-direct {v1}, Lorg/acra/builder/NoOpReportPrimer;-><init>()V

    goto :goto_a

    .line 377
    :catch_36
    move-exception v0

    .line 378
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not construct ReportPrimer from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/acra/config/ACRAConfiguration;->reportPrimerClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - not priming"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_30
.end method

.method private performDeprecatedReportPriming()V
    .registers 6

    .prologue
    .line 365
    :try_start_0
    iget-object v1, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    invoke-interface {v1, p0}, Lorg/acra/ExceptionHandlerInitializer;->initializeExceptionHandler(Lorg/acra/ErrorReporter;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 369
    :goto_5
    return-void

    .line 366
    :catch_6
    move-exception v0

    .line 367
    .local v0, "exceptionInRunnable":Ljava/lang/Exception;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to initialize "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " from #handleException"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5
.end method


# virtual methods
.method public addCustomData(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0, p1, p2}, Lorg/acra/ErrorReporter;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 137
    return-void
.end method

.method public checkReportsOnApplicationStart()V
    .registers 4

    .prologue
    .line 311
    new-instance v0, Lorg/acra/util/ApplicationStartupProcessor;

    iget-object v1, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    iget-object v2, p0, Lorg/acra/ErrorReporter;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v0, v1, v2}, Lorg/acra/util/ApplicationStartupProcessor;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 312
    .local v0, "startupProcessor":Lorg/acra/util/ApplicationStartupProcessor;
    iget-object v1, p0, Lorg/acra/ErrorReporter;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->deleteOldUnsentReportsOnApplicationStart()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 313
    invoke-virtual {v0}, Lorg/acra/util/ApplicationStartupProcessor;->deleteUnsentReportsFromOldAppVersion()V

    .line 315
    :cond_14
    iget-object v1, p0, Lorg/acra/ErrorReporter;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v1}, Lorg/acra/config/ACRAConfiguration;->deleteUnapprovedReportsOnApplicationStart()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 316
    invoke-virtual {v0}, Lorg/acra/util/ApplicationStartupProcessor;->deleteAllUnapprovedReportsBarOne()V

    .line 318
    :cond_1f
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v1}, Lorg/acra/builder/ReportExecutor;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 319
    invoke-virtual {v0}, Lorg/acra/util/ApplicationStartupProcessor;->sendApprovedReports()V

    .line 321
    :cond_2a
    return-void
.end method

.method public clearCustomData()V
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0}, Lorg/acra/collector/CrashReportDataFactory;->clearCustomData()V

    .line 221
    return-void
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 234
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->getCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleException(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 356
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/acra/ErrorReporter;->handleException(Ljava/lang/Throwable;Z)V

    .line 357
    return-void
.end method

.method public handleException(Ljava/lang/Throwable;Z)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "endApplication"    # Z

    .prologue
    .line 336
    invoke-direct {p0}, Lorg/acra/ErrorReporter;->performDeprecatedReportPriming()V

    .line 337
    new-instance v0, Lorg/acra/builder/ReportBuilder;

    invoke-direct {v0}, Lorg/acra/builder/ReportBuilder;-><init>()V

    .line 338
    .local v0, "builder":Lorg/acra/builder/ReportBuilder;
    invoke-virtual {v0, p1}, Lorg/acra/builder/ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/builder/ReportBuilder;

    .line 339
    if-eqz p2, :cond_10

    .line 340
    invoke-virtual {v0}, Lorg/acra/builder/ReportBuilder;->endApplication()Lorg/acra/builder/ReportBuilder;

    .line 342
    :cond_10
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v0, v1}, Lorg/acra/builder/ReportBuilder;->build(Lorg/acra/builder/ReportExecutor;)V

    .line 343
    return-void
.end method

.method public handleSilentException(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 281
    invoke-direct {p0}, Lorg/acra/ErrorReporter;->performDeprecatedReportPriming()V

    .line 282
    new-instance v0, Lorg/acra/builder/ReportBuilder;

    invoke-direct {v0}, Lorg/acra/builder/ReportBuilder;-><init>()V

    .line 283
    invoke-virtual {v0, p1}, Lorg/acra/builder/ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/builder/ReportBuilder;

    move-result-object v0

    .line 284
    invoke-virtual {v0}, Lorg/acra/builder/ReportBuilder;->sendSilently()Lorg/acra/builder/ReportBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    .line 285
    invoke-virtual {v0, v1}, Lorg/acra/builder/ReportBuilder;->build(Lorg/acra/builder/ReportExecutor;)V

    .line 286
    return-void
.end method

.method public putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1, p2}, Lorg/acra/collector/CrashReportDataFactory;->putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 212
    iget-object v0, p0, Lorg/acra/ErrorReporter;->crashReportDataFactory:Lorg/acra/collector/CrashReportDataFactory;

    invoke-virtual {v0, p1}, Lorg/acra/collector/CrashReportDataFactory;->removeCustomData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setEnabled(Z)V
    .registers 6
    .param p1, "enabled"    # Z

    .prologue
    .line 296
    iget-boolean v0, p0, Lorg/acra/ErrorReporter;->supportedAndroidVersion:Z

    if-eqz v0, :cond_3b

    .line 297
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACRA is "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz p1, :cond_38

    const-string v0, "enabled"

    :goto_17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " for "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    invoke-virtual {v3}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget-object v0, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v0, p1}, Lorg/acra/builder/ReportExecutor;->setEnabled(Z)V

    .line 302
    :goto_37
    return-void

    .line 297
    :cond_38
    const-string v0, "disabled"

    goto :goto_17

    .line 300
    :cond_3b
    sget-object v0, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v1, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v2, "ACRA 4.7.0+ requires Froyo or greater. ACRA is disabled and will NOT catch crashes or send messages."

    invoke-interface {v0, v1, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_37
.end method

.method public setExceptionHandlerInitializer(Lorg/acra/ExceptionHandlerInitializer;)V
    .registers 2
    .param p1, "initializer"    # Lorg/acra/ExceptionHandlerInitializer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 193
    if-eqz p1, :cond_5

    .end local p1    # "initializer":Lorg/acra/ExceptionHandlerInitializer;
    :goto_2
    iput-object p1, p0, Lorg/acra/ErrorReporter;->exceptionHandlerInitializer:Lorg/acra/ExceptionHandlerInitializer;

    .line 200
    return-void

    .line 193
    .restart local p1    # "initializer":Lorg/acra/ExceptionHandlerInitializer;
    :cond_5
    new-instance p1, Lorg/acra/ErrorReporter$2;

    .end local p1    # "initializer":Lorg/acra/ExceptionHandlerInitializer;
    invoke-direct {p1, p0}, Lorg/acra/ErrorReporter$2;-><init>(Lorg/acra/ErrorReporter;)V

    goto :goto_2
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "t"    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 248
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v1}, Lorg/acra/builder/ReportExecutor;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_e

    .line 249
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v1, p1, p2}, Lorg/acra/builder/ReportExecutor;->handReportToDefaultExceptionHandler(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 271
    :goto_d
    return-void

    .line 254
    :cond_e
    :try_start_e
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

    iget-object v4, p0, Lorg/acra/ErrorReporter;->context:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, p2}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 255
    sget-boolean v1, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v1, :cond_4d

    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "Building report"

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    :cond_4d
    invoke-direct {p0}, Lorg/acra/ErrorReporter;->performDeprecatedReportPriming()V

    .line 260
    new-instance v1, Lorg/acra/builder/ReportBuilder;

    invoke-direct {v1}, Lorg/acra/builder/ReportBuilder;-><init>()V

    .line 261
    invoke-virtual {v1, p1}, Lorg/acra/builder/ReportBuilder;->uncaughtExceptionThread(Ljava/lang/Thread;)Lorg/acra/builder/ReportBuilder;

    move-result-object v1

    .line 262
    invoke-virtual {v1, p2}, Lorg/acra/builder/ReportBuilder;->exception(Ljava/lang/Throwable;)Lorg/acra/builder/ReportBuilder;

    move-result-object v1

    .line 263
    invoke-virtual {v1}, Lorg/acra/builder/ReportBuilder;->endApplication()Lorg/acra/builder/ReportBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    .line 264
    invoke-virtual {v1, v2}, Lorg/acra/builder/ReportBuilder;->build(Lorg/acra/builder/ReportExecutor;)V
    :try_end_66
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_66} :catch_67

    goto :goto_d

    .line 266
    :catch_67
    move-exception v0

    .line 268
    .local v0, "fatality":Ljava/lang/Throwable;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v3, "ACRA failed to capture the error - handing off to native error reporter"

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 269
    iget-object v1, p0, Lorg/acra/ErrorReporter;->reportExecutor:Lorg/acra/builder/ReportExecutor;

    invoke-virtual {v1, p1, p2}, Lorg/acra/builder/ReportExecutor;->handReportToDefaultExceptionHandler(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_d
.end method
