.class public final Lorg/acra/file/BulkReportDeleter;
.super Ljava/lang/Object;
.source "BulkReportDeleter.java"


# instance fields
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
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lorg/acra/file/ReportLocator;

    invoke-direct {v0, p1}, Lorg/acra/file/ReportLocator;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/acra/file/BulkReportDeleter;->reportLocator:Lorg/acra/file/ReportLocator;

    .line 23
    return-void
.end method


# virtual methods
.method public deleteReports(ZI)V
    .registers 9
    .param p1, "approved"    # Z
    .param p2, "nrToKeep"    # I

    .prologue
    .line 30
    if-eqz p1, :cond_3c

    iget-object v2, p0, Lorg/acra/file/BulkReportDeleter;->reportLocator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v2}, Lorg/acra/file/ReportLocator;->getApprovedReports()[Ljava/io/File;

    move-result-object v0

    .line 32
    .local v0, "files":[Ljava/io/File;
    :goto_8
    new-instance v2, Lorg/acra/file/LastModifiedComparator;

    invoke-direct {v2}, Lorg/acra/file/LastModifiedComparator;-><init>()V

    invoke-static {v0, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 34
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    array-length v2, v0

    sub-int/2addr v2, p2

    if-ge v1, v2, :cond_43

    .line 35
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_39

    .line 36
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not delete report : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 30
    .end local v0    # "files":[Ljava/io/File;
    .end local v1    # "i":I
    :cond_3c
    iget-object v2, p0, Lorg/acra/file/BulkReportDeleter;->reportLocator:Lorg/acra/file/ReportLocator;

    invoke-virtual {v2}, Lorg/acra/file/ReportLocator;->getUnapprovedReports()[Ljava/io/File;

    move-result-object v0

    goto :goto_8

    .line 39
    .restart local v0    # "files":[Ljava/io/File;
    .restart local v1    # "i":I
    :cond_43
    return-void
.end method
