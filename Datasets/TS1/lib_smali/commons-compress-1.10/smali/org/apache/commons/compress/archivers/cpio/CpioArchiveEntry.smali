.class public Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
.super Ljava/lang/Object;
.source "CpioArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/cpio/CpioConstants;
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# instance fields
.field private final alignmentBoundary:I

.field private chksum:J

.field private final fileFormat:S

.field private filesize:J

.field private gid:J

.field private final headerSize:I

.field private inode:J

.field private maj:J

.field private min:J

.field private mode:J

.field private mtime:J

.field private name:Ljava/lang/String;

.field private nlink:J

.field private rmaj:J

.field private rmin:J

.field private uid:J


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 4
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;

    .prologue
    .line 313
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(SLjava/io/File;Ljava/lang/String;)V

    .line 314
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 236
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(SLjava/lang/String;)V

    .line 237
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "size"    # J

    .prologue
    .line 272
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(Ljava/lang/String;)V

    .line 273
    invoke-virtual {p0, p2, p3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setSize(J)V

    .line 274
    return-void
.end method

.method public constructor <init>(S)V
    .registers 6
    .param p1, "format"    # S

    .prologue
    const/16 v3, 0x6e

    const/4 v2, 0x4

    const-wide/16 v0, 0x0

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->chksum:J

    .line 166
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->filesize:J

    .line 168
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->gid:J

    .line 170
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->inode:J

    .line 172
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->maj:J

    .line 174
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->min:J

    .line 176
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    .line 178
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mtime:J

    .line 182
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->nlink:J

    .line 184
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmaj:J

    .line 186
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmin:J

    .line 188
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->uid:J

    .line 205
    packed-switch p1, :pswitch_data_48

    .line 223
    :pswitch_23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown header type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :pswitch_2b
    iput v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    .line 208
    iput v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    .line 225
    :goto_2f
    iput-short p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->fileFormat:S

    .line 226
    return-void

    .line 211
    :pswitch_32
    iput v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    .line 212
    iput v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    goto :goto_2f

    .line 215
    :pswitch_37
    const/16 v0, 0x4c

    iput v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    .line 216
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    goto :goto_2f

    .line 219
    :pswitch_3f
    const/16 v0, 0x1a

    iput v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    .line 220
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    goto :goto_2f

    .line 205
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_32
        :pswitch_23
        :pswitch_37
        :pswitch_23
        :pswitch_23
        :pswitch_23
        :pswitch_3f
    .end packed-switch
.end method

.method public constructor <init>(SLjava/io/File;Ljava/lang/String;)V
    .registers 8
    .param p1, "format"    # S
    .param p2, "inputFile"    # Ljava/io/File;
    .param p3, "entryName"    # Ljava/lang/String;

    .prologue
    .line 339
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v0

    :goto_a
    invoke-direct {p0, p1, p3, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(SLjava/lang/String;J)V

    .line 340
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 341
    const-wide/16 v0, 0x4000

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setMode(J)V

    .line 349
    :goto_18
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setTime(J)V

    .line 350
    return-void

    .line 339
    :cond_23
    const-wide/16 v0, 0x0

    goto :goto_a

    .line 342
    :cond_26
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 343
    const-wide/32 v0, 0x8000

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setMode(J)V

    goto :goto_18

    .line 345
    :cond_33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot determine type of file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(SLjava/lang/String;)V
    .registers 3
    .param p1, "format"    # S
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 258
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(S)V

    .line 259
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public constructor <init>(SLjava/lang/String;J)V
    .registers 5
    .param p1, "format"    # S
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "size"    # J

    .prologue
    .line 298
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;-><init>(SLjava/lang/String;)V

    .line 299
    invoke-virtual {p0, p3, p4}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->setSize(J)V

    .line 300
    return-void
.end method

.method private checkNewFormat()V
    .registers 2

    .prologue
    .line 356
    iget-short v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->fileFormat:S

    and-int/lit8 v0, v0, 0x3

    if-nez v0, :cond_c

    .line 357
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 359
    :cond_c
    return-void
.end method

.method private checkOldFormat()V
    .registers 2

    .prologue
    .line 365
    iget-short v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->fileFormat:S

    and-int/lit8 v0, v0, 0xc

    if-nez v0, :cond_c

    .line 366
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 368
    :cond_c
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 877
    if-ne p0, p1, :cond_5

    .line 891
    :cond_4
    :goto_4
    return v1

    .line 880
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 881
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 883
    check-cast v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;

    .line 884
    .local v0, "other":Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 885
    iget-object v3, v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 886
    goto :goto_4

    .line 888
    :cond_20
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 889
    goto :goto_4
.end method

.method public getAlignmentBoundary()I
    .registers 2

    .prologue
    .line 462
    iget v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    return v0
.end method

.method public getChksum()J
    .registers 3

    .prologue
    .line 378
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 379
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->chksum:J

    return-wide v0
.end method

.method public getDataPadCount()I
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 489
    iget v4, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    if-nez v4, :cond_6

    .line 495
    :cond_5
    :goto_5
    return v3

    .line 490
    :cond_6
    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->filesize:J

    .line 491
    .local v1, "size":J
    iget v4, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    int-to-long v4, v4

    rem-long v4, v1, v4

    long-to-int v0, v4

    .line 492
    .local v0, "remain":I
    if-lez v0, :cond_5

    .line 493
    iget v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    sub-int/2addr v3, v0

    goto :goto_5
.end method

.method public getDevice()J
    .registers 3

    .prologue
    .line 391
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkOldFormat()V

    .line 392
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->min:J

    return-wide v0
.end method

.method public getDeviceMaj()J
    .registers 3

    .prologue
    .line 404
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 405
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->maj:J

    return-wide v0
.end method

.method public getDeviceMin()J
    .registers 3

    .prologue
    .line 415
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 416
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->min:J

    return-wide v0
.end method

.method public getFormat()S
    .registers 2

    .prologue
    .line 435
    iget-short v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->fileFormat:S

    return v0
.end method

.method public getGID()J
    .registers 3

    .prologue
    .line 444
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->gid:J

    return-wide v0
.end method

.method public getHeaderPadCount()I
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 471
    iget v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    if-nez v3, :cond_6

    .line 480
    :cond_5
    :goto_5
    return v2

    .line 472
    :cond_6
    iget v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    add-int/lit8 v1, v3, 0x1

    .line 473
    .local v1, "size":I
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    if-eqz v3, :cond_15

    .line 474
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    .line 476
    :cond_15
    iget v3, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    rem-int v0, v1, v3

    .line 477
    .local v0, "remain":I
    if-lez v0, :cond_5

    .line 478
    iget v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->alignmentBoundary:I

    sub-int/2addr v2, v0

    goto :goto_5
.end method

.method public getHeaderSize()I
    .registers 2

    .prologue
    .line 453
    iget v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->headerSize:I

    return v0
.end method

.method public getInode()J
    .registers 3

    .prologue
    .line 504
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->inode:J

    return-wide v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 6

    .prologue
    .line 585
    new-instance v0, Ljava/util/Date;

    const-wide/16 v1, 0x3e8

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->getTime()J

    move-result-wide v3

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getMode()J
    .registers 5

    .prologue
    .line 513
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_16

    const-string v0, "TRAILER!!!"

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const-wide/32 v0, 0x8000

    :goto_15
    return-wide v0

    :cond_16
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    goto :goto_15
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 522
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNumberOfLinks()J
    .registers 5

    .prologue
    .line 531
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->nlink:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_11

    const-wide/16 v0, 0x2

    :goto_10
    return-wide v0

    :cond_11
    const-wide/16 v0, 0x1

    goto :goto_10

    :cond_14
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->nlink:J

    goto :goto_10
.end method

.method public getRemoteDevice()J
    .registers 3

    .prologue
    .line 545
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkOldFormat()V

    .line 546
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmin:J

    return-wide v0
.end method

.method public getRemoteDeviceMaj()J
    .registers 3

    .prologue
    .line 558
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 559
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmaj:J

    return-wide v0
.end method

.method public getRemoteDeviceMin()J
    .registers 3

    .prologue
    .line 571
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 572
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmin:J

    return-wide v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 426
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->filesize:J

    return-wide v0
.end method

.method public getTime()J
    .registers 3

    .prologue
    .line 581
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mtime:J

    return-wide v0
.end method

.method public getUID()J
    .registers 3

    .prologue
    .line 594
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->uid:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 866
    const/16 v0, 0x1f

    .line 867
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 868
    .local v1, "result":I
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    if-nez v2, :cond_b

    const/4 v2, 0x0

    :goto_8
    add-int/lit8 v1, v2, 0x1f

    .line 869
    return v1

    .line 868
    :cond_b
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_8
.end method

.method public isBlockDevice()Z
    .registers 5

    .prologue
    .line 603
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/16 v2, 0x6000

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isCharacterDevice()Z
    .registers 5

    .prologue
    .line 612
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/16 v2, 0x2000

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isDirectory()Z
    .registers 5

    .prologue
    .line 621
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/16 v2, 0x4000

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isNetwork()Z
    .registers 5

    .prologue
    .line 630
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/32 v2, 0x9000

    cmp-long v0, v0, v2

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isPipe()Z
    .registers 5

    .prologue
    .line 639
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/16 v2, 0x1000

    cmp-long v0, v0, v2

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isRegularFile()Z
    .registers 5

    .prologue
    .line 648
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/32 v2, 0x8000

    cmp-long v0, v0, v2

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isSocket()Z
    .registers 5

    .prologue
    .line 657
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/32 v2, 0xc000

    cmp-long v0, v0, v2

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public isSymbolicLink()Z
    .registers 5

    .prologue
    .line 666
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioUtil;->fileType(J)J

    move-result-wide v0

    const-wide/32 v2, 0xa000

    cmp-long v0, v0, v2

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public setChksum(J)V
    .registers 3
    .param p1, "chksum"    # J

    .prologue
    .line 677
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 678
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->chksum:J

    .line 679
    return-void
.end method

.method public setDevice(J)V
    .registers 3
    .param p1, "device"    # J

    .prologue
    .line 691
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkOldFormat()V

    .line 692
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->min:J

    .line 693
    return-void
.end method

.method public setDeviceMaj(J)V
    .registers 3
    .param p1, "maj"    # J

    .prologue
    .line 702
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 703
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->maj:J

    .line 704
    return-void
.end method

.method public setDeviceMin(J)V
    .registers 3
    .param p1, "min"    # J

    .prologue
    .line 713
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 714
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->min:J

    .line 715
    return-void
.end method

.method public setGID(J)V
    .registers 3
    .param p1, "gid"    # J

    .prologue
    .line 738
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->gid:J

    .line 739
    return-void
.end method

.method public setInode(J)V
    .registers 3
    .param p1, "inode"    # J

    .prologue
    .line 748
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->inode:J

    .line 749
    return-void
.end method

.method public setMode(J)V
    .registers 8
    .param p1, "mode"    # J

    .prologue
    .line 758
    const-wide/32 v2, 0xf000

    and-long v0, p1, v2

    .line 759
    .local v0, "maskedMode":J
    long-to-int v2, v0

    sparse-switch v2, :sswitch_data_38

    .line 770
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown mode. Full: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1, p2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Masked: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 776
    :sswitch_34
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mode:J

    .line 777
    return-void

    .line 759
    nop

    :sswitch_data_38
    .sparse-switch
        0x1000 -> :sswitch_34
        0x2000 -> :sswitch_34
        0x4000 -> :sswitch_34
        0x6000 -> :sswitch_34
        0x8000 -> :sswitch_34
        0x9000 -> :sswitch_34
        0xa000 -> :sswitch_34
        0xc000 -> :sswitch_34
    .end sparse-switch
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 786
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->name:Ljava/lang/String;

    .line 787
    return-void
.end method

.method public setNumberOfLinks(J)V
    .registers 3
    .param p1, "nlink"    # J

    .prologue
    .line 796
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->nlink:J

    .line 797
    return-void
.end method

.method public setRemoteDevice(J)V
    .registers 3
    .param p1, "device"    # J

    .prologue
    .line 809
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkOldFormat()V

    .line 810
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmin:J

    .line 811
    return-void
.end method

.method public setRemoteDeviceMaj(J)V
    .registers 3
    .param p1, "rmaj"    # J

    .prologue
    .line 823
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 824
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmaj:J

    .line 825
    return-void
.end method

.method public setRemoteDeviceMin(J)V
    .registers 3
    .param p1, "rmin"    # J

    .prologue
    .line 837
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->checkNewFormat()V

    .line 838
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->rmin:J

    .line 839
    return-void
.end method

.method public setSize(J)V
    .registers 6
    .param p1, "size"    # J

    .prologue
    .line 724
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_f

    const-wide v0, 0xffffffffL

    cmp-long v0, p1, v0

    if-lez v0, :cond_2e

    .line 725
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid entry size <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 728
    :cond_2e
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->filesize:J

    .line 729
    return-void
.end method

.method public setTime(J)V
    .registers 3
    .param p1, "time"    # J

    .prologue
    .line 848
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->mtime:J

    .line 849
    return-void
.end method

.method public setUID(J)V
    .registers 3
    .param p1, "uid"    # J

    .prologue
    .line 858
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveEntry;->uid:J

    .line 859
    return-void
.end method
