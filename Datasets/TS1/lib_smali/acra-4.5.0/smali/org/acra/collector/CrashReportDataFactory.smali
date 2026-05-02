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
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    .line 104
    iput-object p1, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    .line 105
    iput-object p2, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    .line 106
    iput-object p3, p0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Landroid/text/format/Time;

    .line 107
    iput-object p4, p0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    .line 108
    return-void
.end method

.method private createCustomInfoString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 386
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 387
    .local v2, "customInfo":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 388
    .local v0, "currentKey":Ljava/lang/String;
    iget-object v4, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 389
    .local v1, "currentVal":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    const-string v4, " = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    if-eqz v1, :cond_35

    .line 394
    const-string v4, "\n"

    const-string v5, "\\\\n"

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 396
    :cond_35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    const-string v4, "\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_f

    .line 399
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentVal":Ljava/lang/String;
    :cond_3e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getReportFields()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/acra/ReportField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 421
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v0

    .line 422
    .local v0, "config":Lorg/acra/annotation/ReportsCrashes;
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->customReportContent()[Lorg/acra/ReportField;

    move-result-object v1

    .line 425
    .local v1, "customReportFields":[Lorg/acra/ReportField;
    array-length v3, v1

    if-eqz v3, :cond_18

    .line 426
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using custom Report Fields"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    move-object v2, v1

    .line 435
    .local v2, "fieldsList":[Lorg/acra/ReportField;
    :goto_13
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    return-object v3

    .line 428
    .end local v2    # "fieldsList":[Lorg/acra/ReportField;
    :cond_18
    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2a

    const-string v3, ""

    invoke-interface {v0}, Lorg/acra/annotation/ReportsCrashes;->mailTo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    .line 429
    :cond_2a
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Report Fields"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_REPORT_FIELDS:[Lorg/acra/ReportField;

    .restart local v2    # "fieldsList":[Lorg/acra/ReportField;
    goto :goto_13

    .line 432
    .end local v2    # "fieldsList":[Lorg/acra/ReportField;
    :cond_34
    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Using default Mail Report Fields"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    sget-object v2, Lorg/acra/ACRAConstants;->DEFAULT_MAIL_REPORT_FIELDS:[Lorg/acra/ReportField;

    .restart local v2    # "fieldsList":[Lorg/acra/ReportField;
    goto :goto_13
.end method

.method private getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .registers 6
    .param p1, "th"    # Ljava/lang/Throwable;

    .prologue
    .line 404
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 405
    .local v2, "result":Ljava/io/Writer;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 409
    .local v1, "printWriter":Ljava/io/PrintWriter;
    move-object v0, p1

    .line 410
    .local v0, "cause":Ljava/lang/Throwable;
    :goto_b
    if-eqz v0, :cond_15

    .line 411
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 412
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_b

    .line 414
    :cond_15
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 415
    .local v3, "stacktraceAsString":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 417
    return-object v3
.end method


# virtual methods
.method public createCrashData(Ljava/lang/Throwable;ZLjava/lang/Thread;)Lorg/acra/collector/CrashReportData;
    .registers 15
    .param p1, "th"    # Ljava/lang/Throwable;
    .param p2, "isSilentReport"    # Z
    .param p3, "brokenThread"    # Ljava/lang/Thread;

    .prologue
    .line 164
    new-instance v0, Lorg/acra/collector/CrashReportData;

    invoke-direct {v0}, Lorg/acra/collector/CrashReportData;-><init>()V

    .line 166
    .local v0, "crashReportData":Lorg/acra/collector/CrashReportData;
    :try_start_5
    invoke-direct {p0}, Lorg/acra/collector/CrashReportDataFactory;->getReportFields()Ljava/util/List;

    move-result-object v1

    .line 173
    .local v1, "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    sget-object v7, Lorg/acra/ReportField;->STACK_TRACE:Lorg/acra/ReportField;

    invoke-direct {p0, p1}, Lorg/acra/collector/CrashReportDataFactory;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    sget-object v7, Lorg/acra/ReportField;->USER_APP_START_DATE:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->appStartDate:Landroid/text/format/Time;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/text/format/Time;->format3339(Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    if-eqz p2, :cond_27

    .line 177
    sget-object v7, Lorg/acra/ReportField;->IS_SILENT:Lorg/acra/ReportField;

    const-string v8, "true"

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    :cond_27
    sget-object v7, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 182
    sget-object v7, Lorg/acra/ReportField;->REPORT_ID:Lorg/acra/ReportField;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    :cond_3c
    sget-object v7, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4f

    .line 187
    sget-object v7, Lorg/acra/ReportField;->INSTALLATION_ID:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/util/Installation;->id(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    :cond_4f
    sget-object v7, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5e

    .line 192
    sget-object v7, Lorg/acra/ReportField;->INITIAL_CONFIGURATION:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->initialConfiguration:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    :cond_5e
    sget-object v7, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_71

    .line 195
    sget-object v7, Lorg/acra/ReportField;->CRASH_CONFIGURATION:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/ConfigurationCollector;->collectConfiguration(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    :cond_71
    instance-of v7, p1, Ljava/lang/OutOfMemoryError;

    if-nez v7, :cond_86

    sget-object v7, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_86

    .line 200
    sget-object v7, Lorg/acra/ReportField;->DUMPSYS_MEMINFO:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/DumpSysCollector;->collectMemInfo()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    :cond_86
    sget-object v7, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_99

    .line 205
    sget-object v7, Lorg/acra/ReportField;->PACKAGE_NAME:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    :cond_99
    sget-object v7, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c5

    .line 210
    sget-object v7, Lorg/acra/ReportField;->BUILD:Lorg/acra/ReportField;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-class v9, Landroid/os/Build;

    invoke-static {v9}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-class v9, Landroid/os/Build$VERSION;

    const-string v10, "VERSION"

    invoke-static {v9, v10}, Lorg/acra/collector/ReflectionCollector;->collectConstants(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    :cond_c5
    sget-object v7, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d4

    .line 215
    sget-object v7, Lorg/acra/ReportField;->PHONE_MODEL:Lorg/acra/ReportField;

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    :cond_d4
    sget-object v7, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e3

    .line 219
    sget-object v7, Lorg/acra/ReportField;->ANDROID_VERSION:Lorg/acra/ReportField;

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_e3
    sget-object v7, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f2

    .line 224
    sget-object v7, Lorg/acra/ReportField;->BRAND:Lorg/acra/ReportField;

    sget-object v8, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    :cond_f2
    sget-object v7, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_101

    .line 227
    sget-object v7, Lorg/acra/ReportField;->PRODUCT:Lorg/acra/ReportField;

    sget-object v8, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    :cond_101
    sget-object v7, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_116

    .line 232
    sget-object v7, Lorg/acra/ReportField;->TOTAL_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getTotalInternalMemorySize()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    :cond_116
    sget-object v7, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12b

    .line 235
    sget-object v7, Lorg/acra/ReportField;->AVAILABLE_MEM_SIZE:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getAvailableInternalMemorySize()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    :cond_12b
    sget-object v7, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13e

    .line 240
    sget-object v7, Lorg/acra/ReportField;->FILE_PATH:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/util/ReportUtils;->getApplicationFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    :cond_13e
    sget-object v7, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_151

    .line 245
    sget-object v7, Lorg/acra/ReportField;->DISPLAY:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/DisplayManagerCollector;->collectDisplays(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    :cond_151
    sget-object v7, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16b

    .line 250
    new-instance v2, Landroid/text/format/Time;

    invoke-direct {v2}, Landroid/text/format/Time;-><init>()V

    .line 251
    .local v2, "curDate":Landroid/text/format/Time;
    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    .line 252
    sget-object v7, Lorg/acra/ReportField;->USER_CRASH_DATE:Lorg/acra/ReportField;

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Landroid/text/format/Time;->format3339(Z)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .end local v2    # "curDate":Landroid/text/format/Time;
    :cond_16b
    sget-object v7, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17c

    .line 257
    sget-object v7, Lorg/acra/ReportField;->CUSTOM_DATA:Lorg/acra/ReportField;

    invoke-direct {p0}, Lorg/acra/collector/CrashReportDataFactory;->createCustomInfoString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    :cond_17c
    sget-object v7, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_193

    .line 262
    sget-object v7, Lorg/acra/ReportField;->USER_EMAIL:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v9, "acra.user.email"

    const-string v10, "N/A"

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :cond_193
    sget-object v7, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1a6

    .line 267
    sget-object v7, Lorg/acra/ReportField;->DEVICE_FEATURES:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/DeviceFeaturesCollector;->getFeatures(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    :cond_1a6
    sget-object v7, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1b9

    .line 272
    sget-object v7, Lorg/acra/ReportField;->ENVIRONMENT:Lorg/acra/ReportField;

    const-class v8, Landroid/os/Environment;

    invoke-static {v8}, Lorg/acra/collector/ReflectionCollector;->collectStaticGettersResults(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    :cond_1b9
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1cc

    .line 277
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_SYSTEM:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/SettingsCollector;->collectSystemSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    :cond_1cc
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1df

    .line 282
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_SECURE:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/SettingsCollector;->collectSecureSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    :cond_1df
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f2

    .line 287
    sget-object v7, Lorg/acra/ReportField;->SETTINGS_GLOBAL:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/SettingsCollector;->collectGlobalSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    :cond_1f2
    sget-object v7, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_205

    .line 292
    sget-object v7, Lorg/acra/ReportField;->SHARED_PREFERENCES:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v8}, Lorg/acra/collector/SharedPreferencesCollector;->collect(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    :cond_205
    new-instance v6, Lorg/acra/util/PackageManagerWrapper;

    iget-object v7, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-direct {v6, v7}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 299
    .local v6, "pm":Lorg/acra/util/PackageManagerWrapper;
    invoke-virtual {v6}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 300
    .local v5, "pi":Landroid/content/pm/PackageInfo;
    if-eqz v5, :cond_330

    .line 302
    sget-object v7, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_225

    .line 303
    sget-object v7, Lorg/acra/ReportField;->APP_VERSION_CODE:Lorg/acra/ReportField;

    iget v8, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    :cond_225
    sget-object v7, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_238

    .line 306
    sget-object v8, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    iget-object v7, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v7, :cond_32c

    iget-object v7, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    :goto_235
    invoke-virtual {v0, v8, v7}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    :cond_238
    :goto_238
    sget-object v7, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_260

    iget-object v7, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "acra.deviceid.enable"

    const/4 v9, 0x1

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_260

    const-string v7, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v6, v7}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_260

    .line 316
    iget-object v7, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {v7}, Lorg/acra/util/ReportUtils;->getDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 317
    .local v3, "deviceId":Ljava/lang/String;
    if-eqz v3, :cond_260

    .line 318
    sget-object v7, Lorg/acra/ReportField;->DEVICE_ID:Lorg/acra/ReportField;

    invoke-virtual {v0, v7, v3}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    .end local v3    # "deviceId":Ljava/lang/String;
    :cond_260
    iget-object v7, p0, Lorg/acra/collector/CrashReportDataFactory;->prefs:Landroid/content/SharedPreferences;

    const-string v8, "acra.syslog.enable"

    const/4 v9, 0x1

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_273

    const-string v7, "android.permission.READ_LOGS"

    invoke-virtual {v6, v7}, Lorg/acra/util/PackageManagerWrapper;->hasPermission(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_27b

    :cond_273
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v7

    const/16 v8, 0x10

    if-lt v7, v8, :cond_342

    .line 329
    :cond_27b
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "READ_LOGS granted! ACRA can include LogCat and DropBox data."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    sget-object v7, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_294

    .line 331
    sget-object v7, Lorg/acra/ReportField;->LOGCAT:Lorg/acra/ReportField;

    const/4 v8, 0x0

    invoke-static {v8}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    :cond_294
    sget-object v7, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2a7

    .line 334
    sget-object v7, Lorg/acra/ReportField;->EVENTSLOG:Lorg/acra/ReportField;

    const-string v8, "events"

    invoke-static {v8}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    :cond_2a7
    sget-object v7, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2ba

    .line 337
    sget-object v7, Lorg/acra/ReportField;->RADIOLOG:Lorg/acra/ReportField;

    const-string v8, "radio"

    invoke-static {v8}, Lorg/acra/collector/LogCatCollector;->collectLogCat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    :cond_2ba
    sget-object v7, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2d5

    .line 340
    sget-object v7, Lorg/acra/ReportField;->DROPBOX:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->additionalDropBoxTags()[Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/acra/collector/DropBoxCollector;->read(Landroid/content/Context;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    :cond_2d5
    :goto_2d5
    sget-object v7, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2f8

    .line 349
    sget-object v7, Lorg/acra/ReportField;->APPLICATION_LOG:Lorg/acra/ReportField;

    iget-object v8, p0, Lorg/acra/collector/CrashReportDataFactory;->context:Landroid/content/Context;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v10

    invoke-virtual {v10}, Lorg/acra/ACRAConfiguration;->applicationLogFileLines()I

    move-result v10

    invoke-static {v8, v9, v10}, Lorg/acra/collector/LogFileCollector;->collectLogFile(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    :cond_2f8
    sget-object v7, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_309

    .line 355
    sget-object v7, Lorg/acra/ReportField;->MEDIA_CODEC_LIST:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/collector/MediaCodecListCollector;->collecMediaCodecList()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    :cond_309
    sget-object v7, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_31a

    .line 360
    sget-object v7, Lorg/acra/ReportField;->THREAD_DETAILS:Lorg/acra/ReportField;

    invoke-static {p3}, Lorg/acra/collector/ThreadCollector;->collect(Ljava/lang/Thread;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    :cond_31a
    sget-object v7, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_32b

    .line 365
    sget-object v7, Lorg/acra/ReportField;->USER_IP:Lorg/acra/ReportField;

    invoke-static {}, Lorg/acra/util/ReportUtils;->getLocalIpAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .end local v1    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .end local v5    # "pi":Landroid/content/pm/PackageInfo;
    .end local v6    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_32b
    :goto_32b
    return-object v0

    .line 306
    .restart local v1    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .restart local v5    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v6    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_32c
    const-string v7, "not set"

    goto/16 :goto_235

    .line 310
    :cond_330
    sget-object v7, Lorg/acra/ReportField;->APP_VERSION_NAME:Lorg/acra/ReportField;

    const-string v8, "Package info unavailable"

    invoke-virtual {v0, v7, v8}, Lorg/acra/collector/CrashReportData;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_337
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_337} :catch_339
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_337} :catch_34a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_337} :catch_372

    goto/16 :goto_238

    .line 368
    .end local v1    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .end local v5    # "pi":Landroid/content/pm/PackageInfo;
    .end local v6    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :catch_339
    move-exception v4

    .line 369
    .local v4, "e":Ljava/lang/RuntimeException;
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Error while retrieving crash data"

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_32b

    .line 344
    .end local v4    # "e":Ljava/lang/RuntimeException;
    .restart local v1    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .restart local v5    # "pi":Landroid/content/pm/PackageInfo;
    .restart local v6    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :cond_342
    :try_start_342
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "READ_LOGS not allowed. ACRA will not include LogCat and DropBox data."

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_349
    .catch Ljava/lang/RuntimeException; {:try_start_342 .. :try_end_349} :catch_339
    .catch Ljava/io/FileNotFoundException; {:try_start_342 .. :try_end_349} :catch_34a
    .catch Ljava/io/IOException; {:try_start_342 .. :try_end_349} :catch_372

    goto :goto_2d5

    .line 370
    .end local v1    # "crashReportFields":Ljava/util/List;, "Ljava/util/List<Lorg/acra/ReportField;>;"
    .end local v5    # "pi":Landroid/content/pm/PackageInfo;
    .end local v6    # "pm":Lorg/acra/util/PackageManagerWrapper;
    :catch_34a
    move-exception v4

    .line 371
    .local v4, "e":Ljava/io/FileNotFoundException;
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error : application log file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not found."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_32b

    .line 372
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_372
    move-exception v4

    .line 373
    .local v4, "e":Ljava/io/IOException;
    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Error while reading application log file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v9

    invoke-virtual {v9}, Lorg/acra/ACRAConfiguration;->applicationLogFile()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_32b
.end method

.method public getCustomData(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 149
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
    .line 127
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
    .line 138
    iget-object v0, p0, Lorg/acra/collector/CrashReportDataFactory;->customParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
