.class public final Lorg/acra/file/ReportLocator;
.super Ljava/lang/Object;
.source "ReportLocator.java"


# static fields
.field private static final APPROVED_FOLDER_NAME:Ljava/lang/String; = "ACRA-approved"

.field private static final UNAPPROVED_FOLDER_NAME:Ljava/lang/String; = "ACRA-unapproved"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lorg/acra/file/ReportLocator;->context:Landroid/content/Context;

    .line 25
    return-void
.end method


# virtual methods
.method public getApprovedFolder()Ljava/io/File;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/acra/file/ReportLocator;->context:Landroid/content/Context;

    const-string v1, "ACRA-approved"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getApprovedReports()[Ljava/io/File;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 51
    invoke-virtual {p0}, Lorg/acra/file/ReportLocator;->getApprovedFolder()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 52
    .local v0, "reports":[Ljava/io/File;
    if-nez v0, :cond_e

    .line 53
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/io/File;

    .line 56
    .end local v0    # "reports":[Ljava/io/File;
    :goto_d
    return-object v0

    .line 55
    .restart local v0    # "reports":[Ljava/io/File;
    :cond_e
    new-instance v1, Lorg/acra/file/LastModifiedComparator;

    invoke-direct {v1}, Lorg/acra/file/LastModifiedComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    goto :goto_d
.end method

.method public getUnapprovedFolder()Ljava/io/File;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 29
    iget-object v0, p0, Lorg/acra/file/ReportLocator;->context:Landroid/content/Context;

    const-string v1, "ACRA-unapproved"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getUnapprovedReports()[Ljava/io/File;
    .registers 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0}, Lorg/acra/file/ReportLocator;->getUnapprovedFolder()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 35
    .local v0, "reports":[Ljava/io/File;
    if-nez v0, :cond_d

    .line 36
    const/4 v1, 0x0

    new-array v0, v1, [Ljava/io/File;

    .line 38
    .end local v0    # "reports":[Ljava/io/File;
    :cond_d
    return-object v0
.end method
