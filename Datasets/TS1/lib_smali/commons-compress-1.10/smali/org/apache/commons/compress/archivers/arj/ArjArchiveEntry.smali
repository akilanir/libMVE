.class public Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;
.super Ljava/lang/Object;
.source "ArjArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry$HostOs;
    }
.end annotation


# instance fields
.field private final localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    .line 38
    return-void
.end method

.method constructor <init>(Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;)V
    .registers 2
    .param p1, "localFileHeader"    # Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    .line 42
    return-void
.end method


# virtual methods
.method public getHostOs()I
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->hostOS:I

    return v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 7

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->isHostOsUnix()Z

    move-result v2

    if-eqz v2, :cond_15

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v2, v2, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->dateTimeModified:I

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    mul-long v0, v2, v4

    .line 93
    .local v0, "ts":J
    :goto_f
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    return-object v2

    .line 91
    .end local v0    # "ts":J
    :cond_15
    const-wide v2, 0xffffffffL

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v4, v4, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->dateTimeModified:I

    int-to-long v4, v4

    and-long/2addr v2, v4

    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    move-result-wide v0

    goto :goto_f
.end method

.method getMethod()I
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->method:I

    return v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->fileAccessMode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 50
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->arjFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_19

    .line 51
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->name:Ljava/lang/String;

    const-string v1, "/"

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-static {v2}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    :goto_18
    return-object v0

    :cond_19
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->name:Ljava/lang/String;

    goto :goto_18
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget-wide v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->originalSize:J

    return-wide v0
.end method

.method public getUnixMode()I
    .registers 2

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->isHostOsUnix()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->getMode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isDirectory()Z
    .registers 3

    .prologue
    .line 72
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->localFileHeader:Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;

    iget v0, v0, Lorg/apache/commons/compress/archivers/arj/LocalFileHeader;->fileType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isHostOsUnix()Z
    .registers 3

    .prologue
    .line 134
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->getHostOs()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_f

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveEntry;->getHostOs()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_11

    :cond_f
    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method
