.class public final Lorg/acra/legacy/ReportMigrator;
.super Ljava/lang/Object;
.source "ReportMigrator.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final fileNameParser:Lorg/acra/file/CrashReportFileNameParser;

.field private final reportLocator:Lorg/acra/file/ReportLocator;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lorg/acra/file/CrashReportFileNameParser;

    invoke-direct {v0}, Lorg/acra/file/CrashReportFileNameParser;-><init>()V

    iput-object v0, p0, Lorg/acra/legacy/ReportMigrator;->fileNameParser:Lorg/acra/file/CrashReportFileNameParser;

    .line 27
    iput-object p1, p0, Lorg/acra/legacy/ReportMigrator;->context:Landroid/content/Context;

    .line 28
    new-instance v0, Lorg/acra/file/ReportLocator;

    invoke-direct {v0, p1}, Lorg/acra/file/ReportLocator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/acra/legacy/ReportMigrator;->reportLocator:Lorg/acra/file/ReportLocator;

    .line 29
    return-void
.end method

.method private getCrashReportFiles()[Ljava/io/File;
    .registers 9
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 59
    iget-object v3, p0, Lorg/acra/legacy/ReportMigrator;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 60
    .local v0, "dir":Ljava/io/File;
    if-nez v0, :cond_15

    .line 61
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Application files directory does not exist! The application may not be installed correctly. Please try reinstalling."

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    new-array v2, v7, [Ljava/io/File;

    .line 75
    :cond_14
    :goto_14
    return-object v2

    .line 65
    :cond_15
    sget-boolean v3, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v3, :cond_37

    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Looking for error files in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    :cond_37
    new-instance v1, Lorg/acra/legacy/ReportMigrator$1;

    invoke-direct {v1, p0}, Lorg/acra/legacy/ReportMigrator$1;-><init>(Lorg/acra/legacy/ReportMigrator;)V

    .line 74
    .local v1, "filter":Ljava/io/FilenameFilter;
    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v2

    .line 75
    .local v2, "result":[Ljava/io/File;
    if-nez v2, :cond_14

    new-array v2, v7, [Ljava/io/File;

    goto :goto_14
.end method


# virtual methods
.method public migrate()V
    .registers 10

    .prologue
    .line 32
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Migrating unsent ACRA reports to new file locations"

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    invoke-direct {p0}, Lorg/acra/legacy/ReportMigrator;->getCrashReportFiles()[Ljava/io/File;

    move-result-object v2

    .line 36
    .local v2, "reportFiles":[Ljava/io/File;
    array-length v4, v2

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v4, :cond_81

    aget-object v0, v2, v3

    .line 38
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 39
    .local v1, "fileName":Ljava/lang/String;
    iget-object v5, p0, Lorg/acra/legacy/ReportMigrator;->fileNameParser:Lorg/acra/file/CrashReportFileNameParser;

    invoke-virtual {v5, v1}, Lorg/acra/file/CrashReportFileNameParser;->isApproved(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 40
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lorg/acra/legacy/ReportMigrator;->reportLocator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v6}, Lorg/acra/file/ReportLocator;->getApprovedFolder()Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 41
    sget-boolean v5, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v5, :cond_4e

    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cold not migrate unsent ACRA crash report : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    :cond_4e
    :goto_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 44
    :cond_51
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lorg/acra/legacy/ReportMigrator;->reportLocator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v6}, Lorg/acra/file/ReportLocator;->getUnapprovedFolder()Ljava/io/File;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 45
    sget-boolean v5, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v5, :cond_4e

    sget-object v5, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v6, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Cold not migrate unsent ACRA crash report : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4e

    .line 49
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "fileName":Ljava/lang/String;
    :cond_81
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Migrated "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " unsent reports"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/acra/log/ACRALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    return-void
.end method
