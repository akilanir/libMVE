.class public Lorg/apache/commons/io/filefilter/AgeFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "AgeFileFilter.java"


# instance fields
.field private acceptOlder:Z

.field private cutoff:J


# direct methods
.method public constructor <init>(J)V
    .registers 4
    .param p1, "cutoff"    # J

    .prologue
    .line 59
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(JZ)V

    .line 60
    return-void
.end method

.method public constructor <init>(JZ)V
    .registers 4
    .param p1, "cutoff"    # J
    .param p3, "acceptOlder"    # Z

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 71
    iput-boolean p3, p0, Lorg/apache/commons/io/filefilter/AgeFileFilter;->acceptOlder:Z

    .line 72
    iput-wide p1, p0, Lorg/apache/commons/io/filefilter/AgeFileFilter;->cutoff:J

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "cutoffReference"    # Ljava/io/File;

    .prologue
    .line 105
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/io/File;Z)V

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 5
    .param p1, "cutoffReference"    # Ljava/io/File;
    .param p2, "acceptOlder"    # Z

    .prologue
    .line 119
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p2}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(JZ)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .registers 3
    .param p1, "cutoffDate"    # Ljava/util/Date;

    .prologue
    .line 82
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(Ljava/util/Date;Z)V

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Z)V
    .registers 5
    .param p1, "cutoffDate"    # Ljava/util/Date;
    .param p2, "acceptOlder"    # Z

    .prologue
    .line 94
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, p2}, Lorg/apache/commons/io/filefilter/AgeFileFilter;-><init>(JZ)V

    .line 95
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 136
    iget-wide v1, p0, Lorg/apache/commons/io/filefilter/AgeFileFilter;->cutoff:J

    invoke-static {p1, v1, v2}, Lorg/apache/commons/io/FileUtils;->isFileNewer(Ljava/io/File;J)Z

    move-result v0

    .line 137
    .local v0, "newer":Z
    iget-boolean v1, p0, Lorg/apache/commons/io/filefilter/AgeFileFilter;->acceptOlder:Z

    if-eqz v1, :cond_d

    if-nez v0, :cond_e

    const/4 v0, 0x1

    .end local v0    # "newer":Z
    :cond_d
    :goto_d
    return v0

    .restart local v0    # "newer":Z
    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
