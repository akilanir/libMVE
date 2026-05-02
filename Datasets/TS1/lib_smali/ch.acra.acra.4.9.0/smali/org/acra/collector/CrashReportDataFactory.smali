.class public final Lorg/acra/collector/CrashReportDataFactory;
.super Ljava/lang/Object;
.source "CrashReportDataFactory.java"


# instance fields
.field private final appStartDate:Ljava/util/Calendar;

.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;

.field private final customParameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final initialConfiguration:Ljava/lang/String;

.field private final prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;Landroid/content/SharedPreferences;Ljava/util/Calendar;Ljava/lang/String;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
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
    .param p4, "appStartDate"    # Ljava/util/Calendar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "initialConfiguration"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    .line 109
    iput-object p1, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    .line 110
    iput-object p2, p0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    .line 111
    iput-object p3, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    .line 112
    iput-object p4, p0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Ljava/util/Calendar;

    .line 113
    iput-object p5, p0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    .line 114
    return-void
.end method

.method private createCustomInfoString(Ljava/util/Map;)Ljava/lang/String;
    .registers 10
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 555
    .local p1, "reportCustomData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    .line 557
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_d

    .line 558
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 559
    .end local v3    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v4, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v4, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v3, v4

    .line 562
    .end local v4    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 563
    .local v2, "customInfo":Ljava/lang/StringBuilder;
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_53

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 564
    .local v0, "currentEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 565
    const-string v5, " = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 570
    .local v1, "currentVal":Ljava/lang/String;
    if-eqz v1, :cond_4d

    .line 571
    const-string v5, "\n"

    const-string v7, "\\\\n"

    invoke-virtual {v1, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    :goto_47
    const/16 v5, 0xa

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 573
    :cond_4d
    const-string v5, "null"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_47

    .line 577
    .end local v0    # "currentEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "currentVal":Ljava/lang/String;
    :cond_53
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private getBuildConfigClass()Ljava/lang/Class;
    .registers 8
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 620
    iget-object v3, p0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->buildConfigClass()Ljava/lang/Class;

    move-result-object v1

    .line 621
    .local v1, "configuredBuildConfig":Ljava/lang/Class;
    const-class v3, Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 629
    .end local v1    # "configuredBuildConfig":Ljava/lang/Class;
    :goto_e
    return-object v1

    .line 627
    .restart local v1    # "configuredBuildConfig":Ljava/lang/Class;
    :cond_f
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".BuildConfig"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 629
    .local v0, "className":Ljava/lang/String;
    :try_start_28
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_28 .. :try_end_2b} :catch_2d

    move-result-object v1

    goto :goto_e

    .line 630
    :catch_2d
    move-exception v2

    .line 631
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not adding buildConfig to log. Class Not found : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". Please configure \'buildConfigClass\' in your ACRA config"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    throw v2
.end method

.method private getStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 8
    .param p1, "msg"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "th"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 582
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 583
    .local v2, "result":Ljava/io/Writer;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 585
    .local v1, "printWriter":Ljava/io/PrintWriter;
    if-eqz p1, :cond_15

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 586
    invoke-virtual {v1, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 591
    :cond_15
    move-object v0, p2

    .line 592
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_16
    if-eqz v0, :cond_20

    .line 593
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 594
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_16

    .line 596
    :cond_20
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 597
    .local v3, "stacktraceAsString":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 599
    return-object v3
.end method

.method private getStackTraceHash(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 9
    .param p1, "th"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 604
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 605
    .local v2, "res":Ljava/lang/StringBuilder;
    move-object v0, p1

    .line 606
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_6
    if-eqz v0, :cond_28

    .line 607
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    .line 608
    .local v3, "stackTraceElements":[Ljava/lang/StackTraceElement;
    array-length v5, v3

    const/4 v4, 0x0

    :goto_e
    if-ge v4, v5, :cond_23

    aget-object v1, v3, v4

    .line 609
    .local v1, "e":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 610
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 608
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 612
    .end local v1    # "e":Ljava/lang/StackTraceElement;
    :cond_23
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 613
    goto :goto_6

    .line 615
    .end local v3    # "stackTraceElements":[Ljava/lang/StackTraceElement;
    :cond_28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public clearCustomData()V
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 149
    return-void
.end method

.method public createCrashData(Lorg/acra/builder/ReportBuilder;)Lorg/acra/collector/CrashReportData;
    .registers 19
    .param p1, "builder"    # Lorg/acra/builder/ReportBuilder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 169
    new-instance v2, Lorg/acra/collector/CrashReportData;

    invoke-direct {v2}, Lorg/acra/collector/CrashReportData;-><init>()V

    .line 171
    .local v2, "crashReportData":Lorg/acra/collector/CrashReportData;
    :try_start_5
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v13}, Lorg/acra/config/ACRAConfiguration;->getReportFields()Lorg/acra/collections/ImmutableSet;
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_c} :catch_3c3

    move-result-object v3

    .line 179
    .local v3, "crashReportFields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    :try_start_d
    sget-object v13, Lorg/acra/ReportField;->STACK_TRACE:Lorg/acra/ReportField;

    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/acra/collector/CrashReportDataFactory;->getStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_20
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_20} :catch_3b7

    .line 186
    :goto_20
    :try_start_20
    new-instance v11, Lorg/acra/util/PackageManagerWrapper;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-direct {v11, v13}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 191
    .local v11, "pm":Lorg/acra/util/PackageManagerWrapper;
    const-string v13, "android.permission.READ_LOGS"

    invoke-virtual {v11, v13}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_37

    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x10

    if-lt v13, v14, :cond_3ce

    :cond_37
    const/4 v7, 0x1

    .line 192
    .local v7, "hasReadLogsPermission":Z
    :goto_38
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v14, "acra.syslog.enable"

    const/4 v15, 0x1

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_401

    if-eqz v7, :cond_401

    .line 193
    sget-boolean v13, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v13, :cond_54

    .line 194
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "READ_LOGS granted! ACRA can include LogCat and DropBox data."

    invoke-interface {v13, v14, v15}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :cond_54
    new-instance v8, Lorg/acra/collector/LogCatCollector;

    invoke-direct {v8}, Lorg/acra/collector/LogCatCollector;-><init>()V

    .line 196
    .local v8, "logCatCollector":Lorg/acra/collector/LogCatCollector;
    sget-object v13, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_5e
    .catch Ljava/lang/RuntimeException; {:try_start_20 .. :try_end_5e} :catch_3c3

    move-result v13

    if-eqz v13, :cond_6f

    .line 198
    :try_start_61
    sget-object v13, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    const/4 v15, 0x0

    invoke-virtual {v8, v14, v15}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6f
    .catch Ljava/lang/RuntimeException; {:try_start_61 .. :try_end_6f} :catch_3d1

    .line 203
    :cond_6f
    :goto_6f
    :try_start_6f
    sget-object v13, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_74
    .catch Ljava/lang/RuntimeException; {:try_start_6f .. :try_end_74} :catch_3c3

    move-result v13

    if-eqz v13, :cond_86

    .line 205
    :try_start_77
    sget-object v13, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    const-string v15, "events"

    invoke-virtual {v8, v14, v15}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_86
    .catch Ljava/lang/RuntimeException; {:try_start_77 .. :try_end_86} :catch_3dd

    .line 210
    :cond_86
    :goto_86
    :try_start_86
    sget-object v13, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_8b
    .catch Ljava/lang/RuntimeException; {:try_start_86 .. :try_end_8b} :catch_3c3

    move-result v13

    if-eqz v13, :cond_9d

    .line 212
    :try_start_8e
    sget-object v13, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    const-string v15, "radio"

    invoke-virtual {v8, v14, v15}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9d
    .catch Ljava/lang/RuntimeException; {:try_start_8e .. :try_end_9d} :catch_3e9

    .line 217
    :cond_9d
    :goto_9d
    :try_start_9d
    sget-object v13, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_a2
    .catch Ljava/lang/RuntimeException; {:try_start_9d .. :try_end_a2} :catch_3c3

    move-result v13

    if-eqz v13, :cond_bd

    .line 219
    :try_start_a5
    sget-object v13, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    new-instance v14, Lorg/acra/collector/DropBoxCollector;

    invoke-direct {v14}, Lorg/acra/collector/DropBoxCollector;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    move-object/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lorg/acra/collector/DropBoxCollector;->read(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_bd
    .catch Ljava/lang/RuntimeException; {:try_start_a5 .. :try_end_bd} :catch_3f5

    .line 230
    .end local v8    # "logCatCollector":Lorg/acra/collector/LogCatCollector;
    :cond_bd
    :goto_bd
    :try_start_bd
    sget-object v13, Lorg/acra/ReportField;->USER_APP_START_DATE:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Ljava/util/Calendar;

    invoke-static {v14}, Lorg/acra/util/ReportUtils;->getTimeString(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ca
    .catch Ljava/lang/RuntimeException; {:try_start_bd .. :try_end_ca} :catch_410

    .line 235
    :goto_ca
    :try_start_ca
    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->isSendSilently()Z

    move-result v13

    if-eqz v13, :cond_d7

    .line 236
    sget-object v13, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    const-string v14, "true"

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d7
    .catch Ljava/lang/RuntimeException; {:try_start_ca .. :try_end_d7} :catch_3c3

    .line 241
    :cond_d7
    :try_start_d7
    sget-object v13, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e4
    .catch Ljava/lang/RuntimeException; {:try_start_d7 .. :try_end_e4} :catch_41c

    .line 248
    :goto_e4
    :try_start_e4
    new-instance v4, Ljava/util/GregorianCalendar;

    invoke-direct {v4}, Ljava/util/GregorianCalendar;-><init>()V

    .line 249
    .local v4, "curDate":Ljava/util/Calendar;
    sget-object v13, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    invoke-static {v4}, Lorg/acra/util/ReportUtils;->getTimeString(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f2
    .catch Ljava/lang/RuntimeException; {:try_start_e4 .. :try_end_f2} :catch_428

    .line 255
    .end local v4    # "curDate":Ljava/util/Calendar;
    :goto_f2
    :try_start_f2
    sget-object v13, Lorg/acra/ReportField;->STACK_TRACE_HASH:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_f7
    .catch Ljava/lang/RuntimeException; {:try_start_f2 .. :try_end_f7} :catch_3c3

    move-result v13

    if-eqz v13, :cond_109

    .line 257
    :try_start_fa
    sget-object v13, Lorg/acra/ReportField;->STACK_TRACE_HASH:Lorg/acra/ReportField;

    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/acra/collector/CrashReportDataFactory;->getStackTraceHash(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_109
    .catch Ljava/lang/RuntimeException; {:try_start_fa .. :try_end_109} :catch_434

    .line 264
    :cond_109
    :goto_109
    :try_start_109
    sget-object v13, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_10e
    .catch Ljava/lang/RuntimeException; {:try_start_109 .. :try_end_10e} :catch_3c3

    move-result v13

    if-eqz v13, :cond_11e

    .line 266
    :try_start_111
    sget-object v13, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v14}, Lorg/acra/util/Installation;->id(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11e
    .catch Ljava/lang/RuntimeException; {:try_start_111 .. :try_end_11e} :catch_440

    .line 273
    :cond_11e
    :goto_11e
    :try_start_11e
    sget-object v13, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_123
    .catch Ljava/lang/RuntimeException; {:try_start_11e .. :try_end_123} :catch_3c3

    move-result v13

    if-eqz v13, :cond_12f

    .line 275
    :try_start_126
    sget-object v13, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12f
    .catch Ljava/lang/RuntimeException; {:try_start_126 .. :try_end_12f} :catch_44c

    .line 280
    :cond_12f
    :goto_12f
    :try_start_12f
    sget-object v13, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_134
    .catch Ljava/lang/RuntimeException; {:try_start_12f .. :try_end_134} :catch_3c3

    move-result v13

    if-eqz v13, :cond_144

    .line 282
    :try_start_137
    sget-object v13, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v14}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_144
    .catch Ljava/lang/RuntimeException; {:try_start_137 .. :try_end_144} :catch_458

    .line 289
    :cond_144
    :goto_144
    :try_start_144
    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getException()Ljava/lang/Throwable;

    move-result-object v13

    instance-of v13, v13, Ljava/lang/OutOfMemoryError;

    if-nez v13, :cond_15d

    sget-object v13, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_151
    .catch Ljava/lang/RuntimeException; {:try_start_144 .. :try_end_151} :catch_3c3

    move-result v13

    if-eqz v13, :cond_15d

    .line 291
    :try_start_154
    sget-object v13, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/DumpSysCollector;->collectMemInfo()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15d
    .catch Ljava/lang/RuntimeException; {:try_start_154 .. :try_end_15d} :catch_464

    .line 298
    :cond_15d
    :goto_15d
    :try_start_15d
    sget-object v13, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_162
    .catch Ljava/lang/RuntimeException; {:try_start_15d .. :try_end_162} :catch_3c3

    move-result v13

    if-eqz v13, :cond_172

    .line 300
    :try_start_165
    sget-object v13, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_172
    .catch Ljava/lang/RuntimeException; {:try_start_165 .. :try_end_172} :catch_470

    .line 307
    :cond_172
    :goto_172
    :try_start_172
    sget-object v13, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_177
    .catch Ljava/lang/RuntimeException; {:try_start_172 .. :try_end_177} :catch_3c3

    move-result v13

    if-eqz v13, :cond_19e

    .line 309
    :try_start_17a
    sget-object v13, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-class v15, Landroid/os/Build;

    invoke-static {v15}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-class v15, Landroid/os/Build$VERSION;

    const-string v16, "VERSION"

    invoke-static/range {v15 .. v16}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19e
    .catch Ljava/lang/RuntimeException; {:try_start_17a .. :try_end_19e} :catch_47c

    .line 316
    :cond_19e
    :goto_19e
    :try_start_19e
    sget-object v13, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1a3
    .catch Ljava/lang/RuntimeException; {:try_start_19e .. :try_end_1a3} :catch_3c3

    move-result v13

    if-eqz v13, :cond_1ad

    .line 318
    :try_start_1a6
    sget-object v13, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    sget-object v14, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1ad
    .catch Ljava/lang/RuntimeException; {:try_start_1a6 .. :try_end_1ad} :catch_488

    .line 324
    :cond_1ad
    :goto_1ad
    :try_start_1ad
    sget-object v13, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1b2
    .catch Ljava/lang/RuntimeException; {:try_start_1ad .. :try_end_1b2} :catch_3c3

    move-result v13

    if-eqz v13, :cond_1bc

    .line 326
    :try_start_1b5
    sget-object v13, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    sget-object v14, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1bc
    .catch Ljava/lang/RuntimeException; {:try_start_1b5 .. :try_end_1bc} :catch_494

    .line 333
    :cond_1bc
    :goto_1bc
    :try_start_1bc
    sget-object v13, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1c1
    .catch Ljava/lang/RuntimeException; {:try_start_1bc .. :try_end_1c1} :catch_3c3

    move-result v13

    if-eqz v13, :cond_1cb

    .line 335
    :try_start_1c4
    sget-object v13, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    sget-object v14, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1cb
    .catch Ljava/lang/RuntimeException; {:try_start_1c4 .. :try_end_1cb} :catch_4a0

    .line 340
    :cond_1cb
    :goto_1cb
    :try_start_1cb
    sget-object v13, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1d0
    .catch Ljava/lang/RuntimeException; {:try_start_1cb .. :try_end_1d0} :catch_3c3

    move-result v13

    if-eqz v13, :cond_1da

    .line 342
    :try_start_1d3
    sget-object v13, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    sget-object v14, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1da
    .catch Ljava/lang/RuntimeException; {:try_start_1d3 .. :try_end_1da} :catch_4ac

    .line 349
    :cond_1da
    :goto_1da
    :try_start_1da
    sget-object v13, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1df
    .catch Ljava/lang/RuntimeException; {:try_start_1da .. :try_end_1df} :catch_3c3

    move-result v13

    if-eqz v13, :cond_1ef

    .line 351
    :try_start_1e2
    sget-object v13, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getTotalInternalMemorySize()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1ef
    .catch Ljava/lang/RuntimeException; {:try_start_1e2 .. :try_end_1ef} :catch_4b8

    .line 356
    :cond_1ef
    :goto_1ef
    :try_start_1ef
    sget-object v13, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_1f4
    .catch Ljava/lang/RuntimeException; {:try_start_1ef .. :try_end_1f4} :catch_3c3

    move-result v13

    if-eqz v13, :cond_204

    .line 358
    :try_start_1f7
    sget-object v13, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getAvailableInternalMemorySize()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_204
    .catch Ljava/lang/RuntimeException; {:try_start_1f7 .. :try_end_204} :catch_4c4

    .line 365
    :cond_204
    :goto_204
    :try_start_204
    sget-object v13, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_209
    .catch Ljava/lang/RuntimeException; {:try_start_204 .. :try_end_209} :catch_3c3

    move-result v13

    if-eqz v13, :cond_219

    .line 367
    :try_start_20c
    sget-object v13, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v14}, Lorg/acra/util/ReportUtils;->getApplicationFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_219
    .catch Ljava/lang/RuntimeException; {:try_start_20c .. :try_end_219} :catch_4d0

    .line 374
    :cond_219
    :goto_219
    :try_start_219
    sget-object v13, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_21e
    .catch Ljava/lang/RuntimeException; {:try_start_219 .. :try_end_21e} :catch_3c3

    move-result v13

    if-eqz v13, :cond_22e

    .line 376
    :try_start_221
    sget-object v13, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v14}, Lorg/acra/collector/DisplayManagerCollector;->collectDisplays(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_22e
    .catch Ljava/lang/RuntimeException; {:try_start_221 .. :try_end_22e} :catch_4dc

    .line 383
    :cond_22e
    :goto_22e
    :try_start_22e
    sget-object v13, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_233
    .catch Ljava/lang/RuntimeException; {:try_start_22e .. :try_end_233} :catch_3c3

    move-result v13

    if-eqz v13, :cond_245

    .line 385
    :try_start_236
    sget-object v13, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getCustomData()Ljava/util/Map;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/acra/collector/CrashReportDataFactory;->createCustomInfoString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_245
    .catch Ljava/lang/RuntimeException; {:try_start_236 .. :try_end_245} :catch_4e8

    .line 391
    :cond_245
    :goto_245
    :try_start_245
    sget-object v13, Lorg/acra/ReportField;->BUILD_CONFIG:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_24a
    .catch Ljava/lang/RuntimeException; {:try_start_245 .. :try_end_24a} :catch_3c3

    move-result v13

    if-eqz v13, :cond_25a

    .line 393
    :try_start_24d
    invoke-direct/range {p0 .. p0}, Lorg/acra/collector/CrashReportDataFactory;->getBuildConfigClass()Ljava/lang/Class;

    move-result-object v1

    .line 394
    .local v1, "buildConfigClass":Ljava/lang/Class;
    sget-object v13, Lorg/acra/ReportField;->BUILD_CONFIG:Lorg/acra/ReportField;

    invoke-static {v1}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_25a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_24d .. :try_end_25a} :catch_5d0
    .catch Ljava/lang/RuntimeException; {:try_start_24d .. :try_end_25a} :catch_4f4

    .line 403
    .end local v1    # "buildConfigClass":Ljava/lang/Class;
    :cond_25a
    :goto_25a
    :try_start_25a
    sget-object v13, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_25f
    .catch Ljava/lang/RuntimeException; {:try_start_25a .. :try_end_25f} :catch_3c3

    move-result v13

    if-eqz v13, :cond_273

    .line 405
    :try_start_262
    sget-object v13, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v15, "acra.user.email"

    const-string v16, "N/A"

    invoke-interface/range {v14 .. v16}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_273
    .catch Ljava/lang/RuntimeException; {:try_start_262 .. :try_end_273} :catch_500

    .line 412
    :cond_273
    :goto_273
    :try_start_273
    sget-object v13, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_278
    .catch Ljava/lang/RuntimeException; {:try_start_273 .. :try_end_278} :catch_3c3

    move-result v13

    if-eqz v13, :cond_288

    .line 414
    :try_start_27b
    sget-object v13, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v14}, Lorg/acra/collector/DeviceFeaturesCollector;->getFeatures(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_288
    .catch Ljava/lang/RuntimeException; {:try_start_27b .. :try_end_288} :catch_50c

    .line 421
    :cond_288
    :goto_288
    :try_start_288
    sget-object v13, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_28d
    .catch Ljava/lang/RuntimeException; {:try_start_288 .. :try_end_28d} :catch_3c3

    move-result v13

    if-eqz v13, :cond_29b

    .line 423
    :try_start_290
    sget-object v13, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    const-class v14, Landroid/os/Environment;

    invoke-static {v14}, Lorg/acra/collector/ReflectionCollector;->collectStaticGettersResults(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29b
    .catch Ljava/lang/RuntimeException; {:try_start_290 .. :try_end_29b} :catch_518

    .line 429
    :cond_29b
    :goto_29b
    :try_start_29b
    new-instance v12, Lorg/acra/collector/SettingsCollector;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v12, v13, v14}, Lorg/acra/collector/SettingsCollector;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 431
    .local v12, "settingsCollector":Lorg/acra/collector/SettingsCollector;
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_2ad
    .catch Ljava/lang/RuntimeException; {:try_start_29b .. :try_end_2ad} :catch_3c3

    move-result v13

    if-eqz v13, :cond_2b9

    .line 433
    :try_start_2b0
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    invoke-virtual {v12}, Lorg/acra/collector/SettingsCollector;->collectSystemSettings()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b9
    .catch Ljava/lang/RuntimeException; {:try_start_2b0 .. :try_end_2b9} :catch_524

    .line 440
    :cond_2b9
    :goto_2b9
    :try_start_2b9
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_2be
    .catch Ljava/lang/RuntimeException; {:try_start_2b9 .. :try_end_2be} :catch_3c3

    move-result v13

    if-eqz v13, :cond_2ca

    .line 442
    :try_start_2c1
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    invoke-virtual {v12}, Lorg/acra/collector/SettingsCollector;->collectSecureSettings()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2ca
    .catch Ljava/lang/RuntimeException; {:try_start_2c1 .. :try_end_2ca} :catch_530

    .line 449
    :cond_2ca
    :goto_2ca
    :try_start_2ca
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_2cf
    .catch Ljava/lang/RuntimeException; {:try_start_2ca .. :try_end_2cf} :catch_3c3

    move-result v13

    if-eqz v13, :cond_2db

    .line 452
    :try_start_2d2
    sget-object v13, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    invoke-virtual {v12}, Lorg/acra/collector/SettingsCollector;->collectGlobalSettings()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2db
    .catch Ljava/lang/RuntimeException; {:try_start_2d2 .. :try_end_2db} :catch_53c

    .line 459
    :cond_2db
    :goto_2db
    :try_start_2db
    sget-object v13, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_2e0
    .catch Ljava/lang/RuntimeException; {:try_start_2db .. :try_end_2e0} :catch_3c3

    move-result v13

    if-eqz v13, :cond_2fb

    .line 461
    :try_start_2e3
    sget-object v13, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    new-instance v14, Lorg/acra/collector/SharedPreferencesCollector;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    move-object/from16 v16, v0

    invoke-direct/range {v14 .. v16}, Lorg/acra/collector/SharedPreferencesCollector;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    invoke-virtual {v14}, Lorg/acra/collector/SharedPreferencesCollector;->collect()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2fb
    .catch Ljava/lang/RuntimeException; {:try_start_2e3 .. :try_end_2fb} :catch_548

    .line 470
    :cond_2fb
    :goto_2fb
    :try_start_2fb
    invoke-virtual {v11}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v10

    .line 471
    .local v10, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v10, :cond_558

    .line 473
    sget-object v13, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_314

    .line 474
    sget-object v13, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    iget v14, v10, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    :cond_314
    sget-object v13, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_327

    .line 477
    sget-object v14, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    iget-object v13, v10, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v13, :cond_554

    iget-object v13, v10, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    :goto_324
    invoke-virtual {v2, v14, v13}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_327
    .catch Ljava/lang/RuntimeException; {:try_start_2fb .. :try_end_327} :catch_561

    .line 488
    .end local v10    # "pi":Landroid/content/pm/PackageInfo;
    :cond_327
    :goto_327
    :try_start_327
    sget-object v13, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_353

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v14, "acra.deviceid.enable"

    const/4 v15, 0x1

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_353

    const-string v13, "android.permission.READ_PHONE_STATE"

    .line 489
    invoke-virtual {v11, v13}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z
    :try_end_341
    .catch Ljava/lang/RuntimeException; {:try_start_327 .. :try_end_341} :catch_3c3

    move-result v13

    if-eqz v13, :cond_353

    .line 491
    :try_start_344
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v13}, Lorg/acra/util/ReportUtils;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 492
    .local v5, "deviceId":Ljava/lang/String;
    if-eqz v5, :cond_353

    .line 493
    sget-object v13, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-virtual {v2, v13, v5}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_353
    .catch Ljava/lang/RuntimeException; {:try_start_344 .. :try_end_353} :catch_56d

    .line 501
    .end local v5    # "deviceId":Ljava/lang/String;
    :cond_353
    :goto_353
    :try_start_353
    sget-object v13, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_358
    .catch Ljava/lang/RuntimeException; {:try_start_353 .. :try_end_358} :catch_3c3

    move-result v13

    if-eqz v13, :cond_37f

    .line 503
    :try_start_35b
    new-instance v13, Lorg/acra/collector/LogFileCollector;

    invoke-direct {v13}, Lorg/acra/collector/LogFileCollector;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v15}, Lorg/acra/config/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/acra/config/ACRAConfiguration;->applicationLogFileLines()I

    move-result v16

    invoke-virtual/range {v13 .. v16}, Lorg/acra/collector/LogFileCollector;->collectLogFile(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v9

    .line 504
    .local v9, "logFile":Ljava/lang/String;
    sget-object v13, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    invoke-virtual {v2, v13, v9}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_37f
    .catch Ljava/io/IOException; {:try_start_35b .. :try_end_37f} :catch_579
    .catch Ljava/lang/RuntimeException; {:try_start_35b .. :try_end_37f} :catch_5a0

    .line 514
    .end local v9    # "logFile":Ljava/lang/String;
    :cond_37f
    :goto_37f
    :try_start_37f
    sget-object v13, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_384
    .catch Ljava/lang/RuntimeException; {:try_start_37f .. :try_end_384} :catch_3c3

    move-result v13

    if-eqz v13, :cond_390

    .line 516
    :try_start_387
    sget-object v13, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/MediaCodecListCollector;->collectMediaCodecList()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_390
    .catch Ljava/lang/RuntimeException; {:try_start_387 .. :try_end_390} :catch_5ac

    .line 523
    :cond_390
    :goto_390
    :try_start_390
    sget-object v13, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_395
    .catch Ljava/lang/RuntimeException; {:try_start_390 .. :try_end_395} :catch_3c3

    move-result v13

    if-eqz v13, :cond_3a5

    .line 525
    :try_start_398
    sget-object v13, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-virtual/range {p1 .. p1}, Lorg/acra/builder/ReportBuilder;->getUncaughtExceptionThread()Ljava/lang/Thread;

    move-result-object v14

    invoke-static {v14}, Lorg/acra/collector/ThreadCollector;->collect(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a5
    .catch Ljava/lang/RuntimeException; {:try_start_398 .. :try_end_3a5} :catch_5b8

    .line 532
    :cond_3a5
    :goto_3a5
    :try_start_3a5
    sget-object v13, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-interface {v3, v13}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_3aa
    .catch Ljava/lang/RuntimeException; {:try_start_3a5 .. :try_end_3aa} :catch_3c3

    move-result v13

    if-eqz v13, :cond_3b6

    .line 534
    :try_start_3ad
    sget-object v13, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getLocalIpAddress()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b6
    .catch Ljava/lang/RuntimeException; {:try_start_3ad .. :try_end_3b6} :catch_5c4

    .line 544
    .end local v3    # "crashReportFields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    .end local v7    # "hasReadLogsPermission":Z
    .end local v11    # "pm":Lorg/acra/util/PackageManagerWrapper;
    .end local v12    # "settingsCollector":Lorg/acra/collector/SettingsCollector;
    :cond_3b6
    :goto_3b6
    return-object v2

    .line 180
    .restart local v3    # "crashReportFields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    :catch_3b7
    move-exception v6

    .line 181
    .local v6, "e":Ljava/lang/RuntimeException;
    :try_start_3b8
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving STACK_TRACE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3c1
    .catch Ljava/lang/RuntimeException; {:try_start_3b8 .. :try_end_3c1} :catch_3c3

    goto/16 :goto_20

    .line 540
    .end local v3    # "crashReportFields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_3c3
    move-exception v6

    .line 541
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving crash data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3b6

    .line 191
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .restart local v3    # "crashReportFields":Ljava/util/Set;, "Ljava/util/Set<Lorg/acra/ReportField;>;"
    .restart local v11    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_3ce
    const/4 v7, 0x0

    goto/16 :goto_38

    .line 199
    .restart local v7    # "hasReadLogsPermission":Z
    .restart local v8    # "logCatCollector":Lorg/acra/collector/LogCatCollector;
    :catch_3d1
    move-exception v6

    .line 200
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    :try_start_3d2
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving LOGCAT data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_6f

    .line 206
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_3dd
    move-exception v6

    .line 207
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving EVENTSLOG data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_86

    .line 213
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_3e9
    move-exception v6

    .line 214
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving RADIOLOG data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_9d

    .line 220
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_3f5
    move-exception v6

    .line 221
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving DROPBOX data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_bd

    .line 225
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .end local v8    # "logCatCollector":Lorg/acra/collector/LogCatCollector;
    :cond_401
    sget-boolean v13, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v13, :cond_bd

    .line 226
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "READ_LOGS not allowed. ACRA will not include LogCat and DropBox data."

    invoke-interface {v13, v14, v15}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_bd

    .line 231
    :catch_410
    move-exception v6

    .line 232
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving USER_APP_START_DATE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_ca

    .line 242
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_41c
    move-exception v6

    .line 243
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving REPORT_ID data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_e4

    .line 250
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_428
    move-exception v6

    .line 251
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving USER_CRASH_DATE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_f2

    .line 258
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_434
    move-exception v6

    .line 259
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving STACK_TRACE_HASH data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_109

    .line 267
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_440
    move-exception v6

    .line 268
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving INSTALLATION_ID data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_11e

    .line 276
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_44c
    move-exception v6

    .line 277
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving INITIAL_CONFIGURATION data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_12f

    .line 283
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_458
    move-exception v6

    .line 284
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving CRASH_CONFIGURATION data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_144

    .line 292
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_464
    move-exception v6

    .line 293
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving DUMPSYS_MEMINFO data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_15d

    .line 301
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_470
    move-exception v6

    .line 302
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving PACKAGE_NAME data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_172

    .line 310
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_47c
    move-exception v6

    .line 311
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving BUILD data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_19e

    .line 319
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_488
    move-exception v6

    .line 320
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving PHONE_MODEL data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1ad

    .line 327
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_494
    move-exception v6

    .line 328
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving ANDROID_VERSION data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1bc

    .line 336
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4a0
    move-exception v6

    .line 337
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving BRAND data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1cb

    .line 343
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4ac
    move-exception v6

    .line 344
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving PRODUCT data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1da

    .line 352
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4b8
    move-exception v6

    .line 353
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving TOTAL_MEM_SIZE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1ef

    .line 359
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4c4
    move-exception v6

    .line 360
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving AVAILABLE_MEM_SIZE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_204

    .line 368
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4d0
    move-exception v6

    .line 369
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving FILE_PATH data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_219

    .line 377
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4dc
    move-exception v6

    .line 378
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving DISPLAY data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_22e

    .line 386
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4e8
    move-exception v6

    .line 387
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving CUSTOM_DATA data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_245

    .line 397
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_4f4
    move-exception v6

    .line 398
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving BUILD_CONFIG data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_25a

    .line 406
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_500
    move-exception v6

    .line 407
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving USER_EMAIL data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_273

    .line 415
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_50c
    move-exception v6

    .line 416
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving DEVICE_FEATURES data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_288

    .line 424
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_518
    move-exception v6

    .line 425
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving ENVIRONMENT data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_29b

    .line 434
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .restart local v12    # "settingsCollector":Lorg/acra/collector/SettingsCollector;
    :catch_524
    move-exception v6

    .line 435
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving SETTINGS_SYSTEM data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2b9

    .line 443
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_530
    move-exception v6

    .line 444
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving SETTINGS_SECURE data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2ca

    .line 453
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_53c
    move-exception v6

    .line 454
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving SETTINGS_GLOBAL data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_2db

    .line 462
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_548
    move-exception v6

    .line 463
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving SHARED_PREFERENCES data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_552
    .catch Ljava/lang/RuntimeException; {:try_start_3d2 .. :try_end_552} :catch_3c3

    goto/16 :goto_2fb

    .line 477
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .restart local v10    # "pi":Landroid/content/pm/PackageInfo;
    :cond_554
    :try_start_554
    const-string v13, "not set"

    goto/16 :goto_324

    .line 481
    :cond_558
    sget-object v13, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    const-string v14, "Package info unavailable"

    invoke-virtual {v2, v13, v14}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_55f
    .catch Ljava/lang/RuntimeException; {:try_start_554 .. :try_end_55f} :catch_561

    goto/16 :goto_327

    .line 483
    .end local v10    # "pi":Landroid/content/pm/PackageInfo;
    :catch_561
    move-exception v6

    .line 484
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    :try_start_562
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving APP_VERSION_CODE and APP_VERSION_NAME data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_327

    .line 495
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_56d
    move-exception v6

    .line 496
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving DEVICE_ID data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_353

    .line 505
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_579
    move-exception v6

    .line 506
    .local v6, "e":Ljava/io/IOException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Error while reading application log file "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/collector/CrashReportDataFactory;->config:Lorg/acra/config/ACRAConfiguration;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/acra/config/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_37f

    .line 507
    .end local v6    # "e":Ljava/io/IOException;
    :catch_5a0
    move-exception v6

    .line 508
    .local v6, "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving APPLICATION_LOG data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_37f

    .line 517
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_5ac
    move-exception v6

    .line 518
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving MEDIA_CODEC_LIST data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_390

    .line 526
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_5b8
    move-exception v6

    .line 527
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving THREAD_DETAILS data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3a5

    .line 535
    .end local v6    # "e":Ljava/lang/RuntimeException;
    :catch_5c4
    move-exception v6

    .line 536
    .restart local v6    # "e":Ljava/lang/RuntimeException;
    sget-object v13, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v14, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v15, "Error while retrieving USER_IP data"

    invoke-interface {v13, v14, v15, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5ce
    .catch Ljava/lang/RuntimeException; {:try_start_562 .. :try_end_5ce} :catch_3c3

    goto/16 :goto_3b6

    .line 395
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .end local v12    # "settingsCollector":Lorg/acra/collector/SettingsCollector;
    :catch_5d0
    move-exception v13

    goto/16 :goto_25a
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 158
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public removeCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 141
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
