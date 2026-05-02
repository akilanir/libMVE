.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
.super Ljava/lang/Object;
.source "DumpArchiveSummary.java"


# instance fields
.field private devname:Ljava/lang/String;

.field private dumpDate:J

.field private filesys:Ljava/lang/String;

.field private firstrec:I

.field private flags:I

.field private hostname:Ljava/lang/String;

.field private label:Ljava/lang/String;

.field private level:I

.field private ntrec:I

.field private previousDumpDate:J

.field private volume:I


# direct methods
.method constructor <init>([BLorg/apache/commons/compress/archivers/zip/ZipEncoding;)V
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "encoding"    # Lorg/apache/commons/compress/archivers/zip/ZipEncoding;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v3, 0x3e8

    const/16 v2, 0x40

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v3

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    .line 48
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    int-to-long v0, v0

    mul-long/2addr v0, v3

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    .line 49
    const/16 v0, 0xc

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    .line 50
    const/16 v0, 0x2a4

    const/16 v1, 0x10

    invoke-static {p2, p1, v0, v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->decode(Lorg/apache/commons/compress/archivers/zip/ZipEncoding;[BII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    .line 51
    const/16 v0, 0x2b4

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    .line 52
    const/16 v0, 0x2b8

    invoke-static {p2, p1, v0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->decode(Lorg/apache/commons/compress/archivers/zip/ZipEncoding;[BII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    .line 53
    const/16 v0, 0x2f8

    invoke-static {p2, p1, v0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->decode(Lorg/apache/commons/compress/archivers/zip/ZipEncoding;[BII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    .line 54
    const/16 v0, 0x338

    invoke-static {p2, p1, v0, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->decode(Lorg/apache/commons/compress/archivers/zip/ZipEncoding;[BII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    .line 55
    const/16 v0, 0x378

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    .line 56
    const/16 v0, 0x37c

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    .line 57
    const/16 v0, 0x380

    invoke-static {p1, v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    .line 60
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 311
    if-ne p0, p1, :cond_5

    .line 334
    :cond_4
    :goto_4
    return v1

    .line 315
    :cond_5
    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    :cond_15
    move v1, v2

    .line 316
    goto :goto_4

    :cond_17
    move-object v0, p1

    .line 319
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 321
    .local v0, "rhs":Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;
    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    iget-wide v5, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_24

    move v1, v2

    .line 322
    goto :goto_4

    .line 325
    :cond_24
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_38

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getHostname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3a

    :cond_38
    move v1, v2

    .line 327
    goto :goto_4

    .line 330
    :cond_3a
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4e

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->getDevname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_4e
    move v1, v2

    .line 331
    goto :goto_4
.end method

.method public getDevname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    return-object v0
.end method

.method public getDumpDate()Ljava/util/Date;
    .registers 4

    .prologue
    .line 67
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getFilesystem()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstRecord()I
    .registers 2

    .prologue
    .line 216
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    return v0
.end method

.method public getFlags()I
    .registers 2

    .prologue
    .line 200
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    return v0
.end method

.method public getHostname()Ljava/lang/String;
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public getLabel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getLevel()I
    .registers 2

    .prologue
    .line 119
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    return v0
.end method

.method public getNTRec()I
    .registers 2

    .prologue
    .line 233
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    return v0
.end method

.method public getPreviousDumpDate()Ljava/util/Date;
    .registers 4

    .prologue
    .line 83
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getVolume()I
    .registers 2

    .prologue
    .line 99
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    return v0
.end method

.method public hashCode()I
    .registers 8

    .prologue
    .line 290
    const/16 v0, 0x11

    .line 292
    .local v0, "hash":I
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    if-eqz v1, :cond_c

    .line 293
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 296
    :cond_c
    int-to-long v1, v0

    const-wide/16 v3, 0x1f

    iget-wide v5, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    mul-long/2addr v3, v5

    add-long/2addr v1, v3

    long-to-int v0, v1

    .line 298
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    if-eqz v1, :cond_22

    .line 299
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/lit8 v0, v1, 0x11

    .line 302
    :cond_22
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    if-eqz v1, :cond_30

    .line 303
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/lit8 v0, v1, 0x11

    .line 306
    :cond_30
    return v0
.end method

.method public isCompressed()Z
    .registers 3

    .prologue
    .line 269
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isExtendedAttributes()Z
    .registers 3

    .prologue
    const v1, 0x8000

    .line 285
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isMetaDataOnly()Z
    .registers 3

    .prologue
    .line 277
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isNewHeader()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 251
    iget v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isNewInode()Z
    .registers 3

    .prologue
    .line 260
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setDevname(Ljava/lang/String;)V
    .registers 2
    .param p1, "devname"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->devname:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setDumpDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "dumpDate"    # Ljava/util/Date;

    .prologue
    .line 75
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->dumpDate:J

    .line 76
    return-void
.end method

.method public setFilesystem(Ljava/lang/String;)V
    .registers 2
    .param p1, "filesystem"    # Ljava/lang/String;

    .prologue
    .line 160
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->filesys:Ljava/lang/String;

    .line 161
    return-void
.end method

.method public setFirstRecord(I)V
    .registers 2
    .param p1, "firstrec"    # I

    .prologue
    .line 224
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->firstrec:I

    .line 225
    return-void
.end method

.method public setFlags(I)V
    .registers 2
    .param p1, "flags"    # I

    .prologue
    .line 208
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->flags:I

    .line 209
    return-void
.end method

.method public setHostname(Ljava/lang/String;)V
    .registers 2
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->hostname:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .registers 2
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 144
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->label:Ljava/lang/String;

    .line 145
    return-void
.end method

.method public setLevel(I)V
    .registers 2
    .param p1, "level"    # I

    .prologue
    .line 127
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->level:I

    .line 128
    return-void
.end method

.method public setNTRec(I)V
    .registers 2
    .param p1, "ntrec"    # I

    .prologue
    .line 241
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->ntrec:I

    .line 242
    return-void
.end method

.method public setPreviousDumpDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "previousDumpDate"    # Ljava/util/Date;

    .prologue
    .line 91
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->previousDumpDate:J

    .line 92
    return-void
.end method

.method public setVolume(I)V
    .registers 2
    .param p1, "volume"    # I

    .prologue
    .line 107
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->volume:I

    .line 108
    return-void
.end method
