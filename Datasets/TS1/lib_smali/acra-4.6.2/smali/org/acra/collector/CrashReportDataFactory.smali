.class public final Lorg/acra/collector/CrashReportDataFactory;
.super Ljava/lang/Object;
.source "CrashReportDataFactory.java"


# instance fields
.field private final appStartDate:Landroid/text/format/Time;

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
.method public constructor <init>(Landroid/content/Context;Landroid/content/SharedPreferences;Landroid/text/format/Time;Ljava/lang/String;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "prefs"    # Landroid/content/SharedPreferences;
    .param p3, "appStartDate"    # Landroid/text/format/Time;
    .param p4, "initialConfiguration"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    .line 64
    iput-object p1, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    .line 65
    iput-object p2, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    .line 66
    iput-object p3, p0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Landroid/text/format/Time;

    .line 67
    iput-object p4, p0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    .line 68
    return-void
.end method

.method private createCustomInfoString(Ljava/util/Map;)Ljava/lang/String;
    .registers 10
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
    .line 372
    .local p1, "reportCustomData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    .line 374
    .local v4, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_d

    .line 375
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 376
    .end local v4    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v4, v5

    .line 379
    .end local v5    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 380
    .local v2, "customInfo":Ljava/lang/StringBuilder;
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 381
    .local v0, "currentKey":Ljava/lang/String;
    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 382
    .local v1, "currentVal":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    const-string v6, " = "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    if-eqz v1, :cond_3e

    .line 387
    const-string v6, "\n"

    const-string v7, "\\\\n"

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 389
    :cond_3e
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    const-string v6, "\n"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 392
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentVal":Ljava/lang/String;
    :cond_47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method private getBuildConfigClass()Ljava/lang/Class;
    .registers 8
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
    .line 431
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Lorg/acra/ACRAConfiguration;->buildConfigClass()Ljava/lang/Class;

    move-result-object v1

    .line 432
    .local v1, "configuredBuildConfig":Ljava/lang/Class;
    if-eqz v1, :cond_13

    const-class v3, Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    .line 440
    .end local v1    # "configuredBuildConfig":Ljava/lang/Class;
    :goto_12
    return-object v1

    .line 438
    .restart local v1    # "configuredBuildConfig":Ljava/lang/Class;
    :cond_13
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".BuildConfig"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 440
    .local v0, "className":Ljava/lang/String;
    :try_start_34
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_37
    .catch Ljava/lang/ClassNotFoundException; {:try_start_34 .. :try_end_37} :catch_39

    move-result-object v1

    goto :goto_12

    .line 441
    :catch_39
    move-exception v2

    .line 442
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

    .line 443
    throw v2
.end method

.method private getStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 8
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "th"    # Ljava/lang/Throwable;

    .prologue
    .line 396
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 397
    .local v2, "result":Ljava/io/Writer;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 399
    .local v1, "printWriter":Ljava/io/PrintWriter;
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_15

    .line 400
    invoke-virtual {v1, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 404
    :cond_15
    move-object v0, p2

    .line 405
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_16
    if-eqz v0, :cond_20

    .line 406
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 407
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_16

    .line 409
    :cond_20
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 410
    .local v3, "stacktraceAsString":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 412
    return-object v3
.end method

.method private getStackTraceHash(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 10
    .param p1, "th"    # Ljava/lang/Throwable;

    .prologue
    .line 416
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    .local v5, "res":Ljava/lang/StringBuilder;
    move-object v1, p1

    .line 418
    .local v1, "cause":Ljava/lang/Throwable;
    :goto_6
    if-eqz v1, :cond_29

    .line 419
    invoke-virtual {v1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    .line 420
    .local v6, "stackTraceElements":[Ljava/lang/StackTraceElement;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v4, :cond_24

    aget-object v2, v0, v3

    .line 421
    .local v2, "e":Ljava/lang/StackTraceElement;
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 424
    .end local v2    # "e":Ljava/lang/StackTraceElement;
    :cond_24
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 425
    goto :goto_6

    .line 427
    .end local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "stackTraceElements":[Ljava/lang/StackTraceElement;
    :cond_29
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method


# virtual methods
.method public clearCustomData()V
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 106
    return-void
.end method

.method public createCrashData(Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ZLjava/lang/Thread;)Lorg/acra/collector/CrashReportData;
    .registers 21
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "th"    # Ljava/lang/Throwable;
    .param p4, "isSilentReport"    # Z
    .param p5, "brokenThread"    # Ljava/lang/Thread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/Thread;",
            ")",
            "Lorg/acra/collector/CrashReportData;"
        }
    .end annotation

    .prologue
    .line 135
    .local p3, "customData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Lorg/acra/collector/CrashReportData;

    invoke-direct {v2}, Lorg/acra/collector/CrashReportData;-><init>()V

    .line 137
    .local v2, "crashReportData":Lorg/acra/collector/CrashReportData;
    :try_start_5
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v11

    invoke-virtual {v11}, Lorg/acra/ACRAConfiguration;->getReportFields()Ljava/util/List;

    move-result-object v3

    .line 144
    .local v3, "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    sget-object v11, Lorg/acra/ReportField;->STACK_TRACE:Lorg/acra/ReportField;

    invoke-direct/range {p0 .. p2}, Lorg/acra/collector/CrashReportDataFactory;->getStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    sget-object v11, Lorg/acra/ReportField;->USER_APP_START_DATE:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Landroid/text/format/Time;

    invoke-static {v12}, Lorg/acra/util/ReportUtils;->getTimeString(Landroid/text/format/Time;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    if-eqz p4, :cond_2a

    .line 148
    sget-object v11, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    const-string v12, "true"

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    :cond_2a
    sget-object v11, Lorg/acra/ReportField;->STACK_TRACE_HASH:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3d

    .line 153
    sget-object v11, Lorg/acra/ReportField;->STACK_TRACE_HASH:Lorg/acra/ReportField;

    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lorg/acra/collector/CrashReportDataFactory;->getStackTraceHash(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_3d
    sget-object v11, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_52

    .line 158
    sget-object v11, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    :cond_52
    sget-object v11, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_65

    .line 163
    sget-object v11, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/util/Installation;->id(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_65
    sget-object v11, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_74

    .line 168
    sget-object v11, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    :cond_74
    sget-object v11, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_87

    .line 171
    sget-object v11, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    :cond_87
    move-object/from16 v0, p2

    instance-of v11, v0, Ljava/lang/OutOfMemoryError;

    if-nez v11, :cond_9e

    sget-object v11, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9e

    .line 176
    sget-object v11, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/DumpSysCollector;->collectMemInfo()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    :cond_9e
    sget-object v11, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b1

    .line 181
    sget-object v11, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    :cond_b1
    sget-object v11, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_dd

    .line 186
    sget-object v11, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-class v13, Landroid/os/Build;

    invoke-static {v13}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-class v13, Landroid/os/Build$VERSION;

    const-string v14, "VERSION"

    invoke-static {v13, v14}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    :cond_dd
    sget-object v11, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_ec

    .line 191
    sget-object v11, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    sget-object v12, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    :cond_ec
    sget-object v11, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_fb

    .line 195
    sget-object v11, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    sget-object v12, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_fb
    sget-object v11, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_10a

    .line 200
    sget-object v11, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    sget-object v12, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    :cond_10a
    sget-object v11, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_119

    .line 203
    sget-object v11, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    sget-object v12, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    :cond_119
    sget-object v11, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_12e

    .line 208
    sget-object v11, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getTotalInternalMemorySize()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    :cond_12e
    sget-object v11, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_143

    .line 211
    sget-object v11, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getAvailableInternalMemorySize()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    :cond_143
    sget-object v11, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_156

    .line 216
    sget-object v11, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/util/ReportUtils;->getApplicationFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :cond_156
    sget-object v11, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_169

    .line 221
    sget-object v11, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/DisplayManagerCollector;->collectDisplays(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    :cond_169
    sget-object v11, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_182

    .line 226
    new-instance v4, Landroid/text/format/Time;

    invoke-direct {v4}, Landroid/text/format/Time;-><init>()V

    .line 227
    .local v4, "curDate":Landroid/text/format/Time;
    invoke-virtual {v4}, Landroid/text/format/Time;->setToNow()V

    .line 228
    sget-object v11, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    invoke-static {v4}, Lorg/acra/util/ReportUtils;->getTimeString(Landroid/text/format/Time;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    .end local v4    # "curDate":Landroid/text/format/Time;
    :cond_182
    sget-object v11, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_195

    .line 233
    sget-object v11, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    move-object/from16 v0, p3

    invoke-direct {p0, v0}, Lorg/acra/collector/CrashReportDataFactory;->createCustomInfoString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    :cond_195
    sget-object v11, Lorg/acra/ReportField;->BUILD_CONFIG:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    :try_end_19a
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_19a} :catch_36c

    move-result v11

    if-eqz v11, :cond_1aa

    .line 238
    :try_start_19d
    invoke-direct {p0}, Lorg/acra/collector/CrashReportDataFactory;->getBuildConfigClass()Ljava/lang/Class;

    move-result-object v1

    .line 239
    .local v1, "buildConfigClass":Ljava/lang/Class;
    sget-object v11, Lorg/acra/ReportField;->BUILD_CONFIG:Lorg/acra/ReportField;

    invoke-static {v1}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1aa
    .catch Ljava/lang/ClassNotFoundException; {:try_start_19d .. :try_end_1aa} :catch_3a8
    .catch Ljava/lang/RuntimeException; {:try_start_19d .. :try_end_1aa} :catch_36c

    .line 246
    .end local v1    # "buildConfigClass":Ljava/lang/Class;
    :cond_1aa
    :goto_1aa
    :try_start_1aa
    sget-object v11, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1c1

    .line 247
    sget-object v11, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v13, "acra.user.email"

    const-string v14, "N/A"

    invoke-interface {v12, v13, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    :cond_1c1
    sget-object v11, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1d4

    .line 252
    sget-object v11, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/DeviceFeaturesCollector;->getFeatures(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    :cond_1d4
    sget-object v11, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1e7

    .line 257
    sget-object v11, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    const-class v12, Landroid/os/Environment;

    invoke-static {v12}, Lorg/acra/collector/ReflectionCollector;->collectStaticGettersResults(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    :cond_1e7
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1fa

    .line 262
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/SettingsCollector;->collectSystemSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :cond_1fa
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_20d

    .line 267
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/SettingsCollector;->collectSecureSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    :cond_20d
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_220

    .line 272
    sget-object v11, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/SettingsCollector;->collectGlobalSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    :cond_220
    sget-object v11, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_233

    .line 277
    sget-object v11, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v12}, Lorg/acra/collector/SharedPreferencesCollector;->collect(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    :cond_233
    new-instance v10, Lorg/acra/util/PackageManagerWrapper;

    iget-object v11, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-direct {v10, v11}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 284
    .local v10, "pm":Lorg/acra/util/PackageManagerWrapper;
    invoke-virtual {v10}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v9

    .line 285
    .local v9, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v9, :cond_363

    .line 287
    sget-object v11, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_253

    .line 288
    sget-object v11, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    iget v12, v9, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    :cond_253
    sget-object v11, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_266

    .line 291
    sget-object v12, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    iget-object v11, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v11, :cond_35f

    iget-object v11, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    :goto_263
    invoke-virtual {v2, v12, v11}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_266
    :goto_266
    sget-object v11, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_28e

    iget-object v11, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v12, "acra.deviceid.enable"

    const/4 v13, 0x1

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_28e

    const-string v11, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v10, v11}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_28e

    .line 301
    iget-object v11, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v11}, Lorg/acra/util/ReportUtils;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 302
    .local v5, "deviceId":Ljava/lang/String;
    if-eqz v5, :cond_28e

    .line 303
    sget-object v11, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-virtual {v2, v11, v5}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    .end local v5    # "deviceId":Ljava/lang/String;
    :cond_28e
    const-string v11, "android.permission.READ_LOGS"

    invoke-virtual {v10, v11}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_29e

    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v11

    const/16 v12, 0x10

    if-lt v11, v12, :cond_377

    :cond_29e
    const/4 v7, 0x1

    .line 312
    .local v7, "hasReadLogsPermission":Z
    :goto_29f
    iget-object v11, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v12, "acra.syslog.enable"

    const/4 v13, 0x1

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_37a

    if-eqz v7, :cond_37a

    .line 313
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "READ_LOGS granted! ACRA can include LogCat and DropBox data."

    invoke-interface {v11, v12, v13}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    sget-object v11, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2c7

    .line 315
    sget-object v11, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    const/4 v12, 0x0

    invoke-static {v12}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    :cond_2c7
    sget-object v11, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2da

    .line 318
    sget-object v11, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    const-string v12, "events"

    invoke-static {v12}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    :cond_2da
    sget-object v11, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2ed

    .line 321
    sget-object v11, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    const-string v12, "radio"

    invoke-static {v12}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    :cond_2ed
    sget-object v11, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_308

    .line 324
    sget-object v11, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    iget-object v12, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v13

    invoke-virtual {v13}, Lorg/acra/ACRAConfiguration;->additionalDropBoxTags()[Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lorg/acra/collector/DropBoxCollector;->read(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 332
    :cond_308
    :goto_308
    sget-object v11, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    :try_end_30d
    .catch Ljava/lang/RuntimeException; {:try_start_1aa .. :try_end_30d} :catch_36c

    move-result v11

    if-eqz v11, :cond_32b

    .line 334
    :try_start_310
    iget-object v11, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v12

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v13

    invoke-virtual {v13}, Lorg/acra/ACRAConfiguration;->applicationLogFileLines()I

    move-result v13

    invoke-static {v11, v12, v13}, Lorg/acra/collector/LogFileCollector;->collectLogFile(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    .line 337
    .local v8, "logFile":Ljava/lang/String;
    sget-object v11, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    invoke-virtual {v2, v11, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32b
    .catch Ljava/io/IOException; {:try_start_310 .. :try_end_32b} :catch_384
    .catch Ljava/lang/RuntimeException; {:try_start_310 .. :try_end_32b} :catch_36c

    .line 344
    .end local v8    # "logFile":Ljava/lang/String;
    :cond_32b
    :goto_32b
    :try_start_32b
    sget-object v11, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_33c

    .line 345
    sget-object v11, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/MediaCodecListCollector;->collecMediaCodecList()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    :cond_33c
    sget-object v11, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_34d

    .line 350
    sget-object v11, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-static/range {p5 .. p5}, Lorg/acra/collector/ThreadCollector;->collect(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    :cond_34d
    sget-object v11, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-interface {v3, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_35e

    .line 355
    sget-object v11, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getLocalIpAddress()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    .end local v3    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .end local v7    # "hasReadLogsPermission":Z
    .end local v9    # "pi":Landroid/content/pm/PackageInfo;
    .end local v10    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_35e
    :goto_35e
    return-object v2

    .line 291
    .restart local v3    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .restart local v9    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v10    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_35f
    const-string v11, "not set"

    goto/16 :goto_263

    .line 295
    :cond_363
    sget-object v11, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    const-string v12, "Package info unavailable"

    invoke-virtual {v2, v11, v12}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_36a
    .catch Ljava/lang/RuntimeException; {:try_start_32b .. :try_end_36a} :catch_36c

    goto/16 :goto_266

    .line 358
    .end local v3    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .end local v9    # "pi":Landroid/content/pm/PackageInfo;
    .end local v10    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :catch_36c
    move-exception v6

    .line 359
    .local v6, "e":Ljava/lang/RuntimeException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "Error while retrieving crash data"

    invoke-interface {v11, v12, v13, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_35e

    .line 311
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .restart local v3    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .restart local v9    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v10    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_377
    const/4 v7, 0x0

    goto/16 :goto_29f

    .line 328
    .restart local v7    # "hasReadLogsPermission":Z
    :cond_37a
    :try_start_37a
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v13, "READ_LOGS not allowed. ACRA will not include LogCat and DropBox data."

    invoke-interface {v11, v12, v13}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_308

    .line 338
    :catch_384
    move-exception v6

    .line 339
    .local v6, "e":Ljava/io/IOException;
    sget-object v11, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v12, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Error while reading application log file "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v14

    invoke-virtual {v14}, Lorg/acra/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v11, v12, v13, v6}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3a7
    .catch Ljava/lang/RuntimeException; {:try_start_37a .. :try_end_3a7} :catch_36c

    goto :goto_32b

    .line 240
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "hasReadLogsPermission":Z
    .end local v9    # "pi":Landroid/content/pm/PackageInfo;
    .end local v10    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :catch_3a8
    move-exception v11

    goto/16 :goto_1aa
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public putCustomData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public removeCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 98
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
