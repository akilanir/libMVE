.class public final Lorg/acra/util/ApplicationStartupProcessor;
.super Ljava/lang/Object;
.source "ApplicationStartupProcessor.java"


# instance fields
.field private final config:Lorg/acra/config/ACRAConfiguration;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lorg/acra/util/ApplicationStartupProcessor;->config:Lorg/acra/config/ACRAConfiguration;

    .line 31
    return-void
.end method

.method private getAppVersion()I
    .registers 4

    .prologue
    .line 90
    new-instance v1, Lorg/acra/util/PackageManagerWrapper;

    iget-object v2, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lorg/acra/util/PackageManagerWrapper;-><init>(Landroid/content/Context;)V

    .line 91
    .local v1, "packageManagerWrapper":Lorg/acra/util/PackageManagerWrapper;
    invoke-virtual {v1}, Lorg/acra/util/PackageManagerWrapper;->getPackageInfo()Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 92
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    if-nez v0, :cond_f

    const/4 v2, 0x0

    :goto_e
    return v2

    :cond_f
    iget v2, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    goto :goto_e
.end method

.method private hasNonSilentApprovedReports([Ljava/io/File;)Z
    .registers 8
    .param p1, "reportFiles"    # [Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 96
    new-instance v1, Lorg/acra/file/CrashReportFileNameParser;

    invoke-direct {v1}, Lorg/acra/file/CrashReportFileNameParser;-><init>()V

    .line 97
    .local v1, "fileNameParser":Lorg/acra/file/CrashReportFileNameParser;
    array-length v4, p1

    move v3, v2

    :goto_8
    if-ge v3, v4, :cond_17

    aget-object v0, p1, v3

    .line 98
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/acra/file/CrashReportFileNameParser;->isSilent(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 99
    const/4 v2, 0x1

    .line 102
    .end local v0    # "file":Ljava/io/File;
    :cond_17
    return v2

    .line 97
    .restart local v0    # "file":Ljava/io/File;
    :cond_18
    add-int/lit8 v3, v3, 0x1

    goto :goto_8
.end method


# virtual methods
.method public deleteAllUnapprovedReportsBarOne()V
    .registers 4

    .prologue
    .line 60
    new-instance v0, Lorg/acra/file/BulkReportDeleter;

    iget-object v1, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/acra/file/BulkReportDeleter;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/acra/file/BulkReportDeleter;->deleteReports(ZI)V

    .line 61
    return-void
.end method

.method public deleteUnsentReportsFromOldAppVersion()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 37
    new-instance v6, Lorg/acra/prefs/SharedPreferencesFactory;

    iget-object v7, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    iget-object v8, p0, Lorg/acra/util/ApplicationStartupProcessor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v6, v7, v8}, Lorg/acra/prefs/SharedPreferencesFactory;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    invoke-virtual {v6}, Lorg/acra/prefs/SharedPreferencesFactory;->create()Landroid/content/SharedPreferences;

    move-result-object v3

    .line 38
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string v6, "acra.lastVersionNr"

    invoke-interface {v3, v6, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    int-to-long v1, v6

    .line 39
    .local v1, "lastVersionNr":J
    invoke-direct {p0}, Lorg/acra/util/ApplicationStartupProcessor;->getAppVersion()I

    move-result v0

    .line 41
    .local v0, "appVersion":I
    int-to-long v6, v0

    cmp-long v6, v6, v1

    if-lez v6, :cond_38

    .line 42
    new-instance v5, Lorg/acra/file/BulkReportDeleter;

    iget-object v6, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    invoke-direct {v5, v6}, Lorg/acra/file/BulkReportDeleter;-><init>(Landroid/content/Context;)V

    .line 43
    .local v5, "reportDeleter":Lorg/acra/file/BulkReportDeleter;
    const/4 v6, 0x1

    invoke-virtual {v5, v6, v9}, Lorg/acra/file/BulkReportDeleter;->deleteReports(ZI)V

    .line 44
    invoke-virtual {v5, v9, v9}, Lorg/acra/file/BulkReportDeleter;->deleteReports(ZI)V

    .line 46
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 47
    .local v4, "prefsEditor":Landroid/content/SharedPreferences$Editor;
    const-string v6, "acra.lastVersionNr"

    invoke-interface {v4, v6, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 48
    invoke-static {v4}, Lorg/acra/prefs/PrefUtils;->save(Landroid/content/SharedPreferences$Editor;)V

    .line 50
    .end local v4    # "prefsEditor":Landroid/content/SharedPreferences$Editor;
    .end local v5    # "reportDeleter":Lorg/acra/file/BulkReportDeleter;
    :cond_38
    return-void
.end method

.method public sendApprovedReports()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 69
    new-instance v1, Lorg/acra/file/ReportLocator;

    iget-object v3, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Lorg/acra/file/ReportLocator;-><init>(Landroid/content/Context;)V

    .line 70
    .local v1, "reportLocator":Lorg/acra/file/ReportLocator;
    invoke-virtual {v1}, Lorg/acra/file/ReportLocator;->getApprovedReports()[Ljava/io/File;

    move-result-object v0

    .line 72
    .local v0, "reportFiles":[Ljava/io/File;
    array-length v3, v0

    if-nez v3, :cond_10

    .line 84
    :goto_f
    return-void

    .line 76
    :cond_10
    iget-object v3, p0, Lorg/acra/util/ApplicationStartupProcessor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v3}, Lorg/acra/config/ACRAConfiguration;->mode()Lorg/acra/ReportingInteractionMode;

    move-result-object v3

    sget-object v4, Lorg/acra/ReportingInteractionMode;->TOAST:Lorg/acra/ReportingInteractionMode;

    if-ne v3, v4, :cond_2c

    invoke-direct {p0, v0}, Lorg/acra/util/ApplicationStartupProcessor;->hasNonSilentApprovedReports([Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 77
    iget-object v3, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    iget-object v4, p0, Lorg/acra/util/ApplicationStartupProcessor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-virtual {v4}, Lorg/acra/config/ACRAConfiguration;->resToastText()I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Lorg/acra/util/ToastSender;->sendToast(Landroid/content/Context;II)V

    .line 81
    :cond_2c
    new-instance v2, Lorg/acra/sender/SenderServiceStarter;

    iget-object v3, p0, Lorg/acra/util/ApplicationStartupProcessor;->context:Landroid/content/Context;

    iget-object v4, p0, Lorg/acra/util/ApplicationStartupProcessor;->config:Lorg/acra/config/ACRAConfiguration;

    invoke-direct {v2, v3, v4}, Lorg/acra/sender/SenderServiceStarter;-><init>(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)V

    .line 82
    .local v2, "starter":Lorg/acra/sender/SenderServiceStarter;
    invoke-virtual {v2, v6, v6}, Lorg/acra/sender/SenderServiceStarter;->startService(ZZ)V

    goto :goto_f
.end method
