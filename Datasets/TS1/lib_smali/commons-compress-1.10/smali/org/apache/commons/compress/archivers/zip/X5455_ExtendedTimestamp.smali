.class public Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;
.super Ljava/lang/Object;
.source "X5455_ExtendedTimestamp.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ACCESS_TIME_BIT:B = 0x2t

.field public static final CREATE_TIME_BIT:B = 0x4t

.field private static final HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

.field public static final MODIFY_TIME_BIT:B = 0x1t

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

.field private bit0_modifyTimePresent:Z

.field private bit1_accessTimePresent:Z

.field private bit2_createTimePresent:Z

.field private createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

.field private flags:B

.field private modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 84
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    const/16 v1, 0x5455

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .registers 9
    .param p0, "d"    # Ljava/util/Date;

    .prologue
    .line 512
    if-nez p0, :cond_4

    const/4 v4, 0x0

    .line 519
    :goto_3
    return-object v4

    .line 514
    :cond_4
    const-wide v0, 0x100000000L

    .line 515
    .local v0, "TWO_TO_32":J
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    div-long v2, v4, v6

    .line 516
    .local v2, "l":J
    const-wide v4, 0x100000000L

    cmp-long v4, v2, v4

    if-ltz v4, :cond_33

    .line 517
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot set an X5455 timestamp larger than 2^32: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 519
    :cond_33
    new-instance v4, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v4, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>(J)V

    goto :goto_3
.end method

.method private reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 254
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->setFlags(B)V

    .line 255
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 256
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 257
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 258
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 551
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 556
    instance-of v2, p1, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;

    if-eqz v2, :cond_4f

    move-object v0, p1

    .line 557
    check-cast v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;

    .line 561
    .local v0, "xf":Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;
    iget-byte v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v2, v2, 0x7

    iget-byte v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v3, v3, 0x7

    if-ne v2, v3, :cond_4f

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eq v2, v3, :cond_26

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    :cond_26
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eq v2, v3, :cond_3a

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    :cond_3a
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eq v2, v3, :cond_4e

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v2, :cond_4f

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    :cond_4e
    const/4 v1, 0x1

    .line 566
    .end local v0    # "xf":Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;
    :cond_4f
    return v1
.end method

.method public getAccessJavaTime()Ljava/util/Date;
    .registers 6

    .prologue
    .line 378
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v0, :cond_13

    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getAccessTime()Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    return-object v0
.end method

.method public getCentralDirectoryData()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 198
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v2

    new-array v0, v2, [B

    .line 199
    .local v0, "centralData":[B
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getLocalFileDataData()[B

    move-result-object v1

    .line 203
    .local v1, "localData":[B
    array-length v2, v0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .registers 3

    .prologue
    .line 158
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    if-eqz v0, :cond_d

    const/4 v0, 0x4

    :goto_7
    add-int/lit8 v0, v0, 0x1

    invoke-direct {v1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    return-object v1

    :cond_d
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getCreateJavaTime()Ljava/util/Date;
    .registers 6

    .prologue
    .line 396
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v0, :cond_13

    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getCreateTime()Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .registers 2

    .prologue
    .line 355
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    return-object v0
.end method

.method public getFlags()B
    .registers 2

    .prologue
    .line 295
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    return v0
.end method

.method public getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .registers 2

    .prologue
    .line 130
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->HEADER_ID:Lorg/apache/commons/compress/archivers/zip/ZipShort;

    return-object v0
.end method

.method public getLocalFileDataData()[B
    .registers 7

    .prologue
    const/4 v5, 0x4

    const/4 v4, 0x0

    .line 170
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getLocalFileDataLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->getValue()I

    move-result v3

    new-array v0, v3, [B

    .line 171
    .local v0, "data":[B
    const/4 v1, 0x0

    .line 172
    .local v1, "pos":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "pos":I
    .local v2, "pos":I
    aput-byte v4, v0, v1

    .line 173
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    if-eqz v3, :cond_5c

    .line 174
    aget-byte v3, v0, v4

    or-int/lit8 v3, v3, 0x1

    int-to-byte v3, v3

    aput-byte v3, v0, v4

    .line 175
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v3

    invoke-static {v3, v4, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 176
    add-int/lit8 v1, v2, 0x4

    .line 178
    .end local v2    # "pos":I
    .restart local v1    # "pos":I
    :goto_27
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    if-eqz v3, :cond_41

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v3, :cond_41

    .line 179
    aget-byte v3, v0, v4

    or-int/lit8 v3, v3, 0x2

    int-to-byte v3, v3

    aput-byte v3, v0, v4

    .line 180
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v3

    invoke-static {v3, v4, v0, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 181
    add-int/lit8 v1, v1, 0x4

    .line 183
    :cond_41
    iget-boolean v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    if-eqz v3, :cond_5b

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v3, :cond_5b

    .line 184
    aget-byte v3, v0, v4

    or-int/lit8 v3, v3, 0x4

    int-to-byte v3, v3

    aput-byte v3, v0, v4

    .line 185
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getBytes()[B

    move-result-object v3

    invoke-static {v3, v4, v0, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    add-int/lit8 v1, v1, 0x4

    .line 188
    :cond_5b
    return-object v0

    .end local v1    # "pos":I
    .restart local v2    # "pos":I
    :cond_5c
    move v1, v2

    .end local v2    # "pos":I
    .restart local v1    # "pos":I
    goto :goto_27
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/compress/archivers/zip/ZipShort;
    .registers 6

    .prologue
    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 140
    new-instance v3, Lorg/apache/commons/compress/archivers/zip/ZipShort;

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    if-eqz v0, :cond_22

    move v0, v1

    :goto_9
    add-int/lit8 v4, v0, 0x1

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    if-eqz v0, :cond_24

    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v0, :cond_24

    move v0, v1

    :goto_14
    add-int/2addr v0, v4

    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    if-eqz v4, :cond_26

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v4, :cond_26

    :goto_1d
    add-int/2addr v0, v1

    invoke-direct {v3, v0}, Lorg/apache/commons/compress/archivers/zip/ZipShort;-><init>(I)V

    return-object v3

    :cond_22
    move v0, v2

    goto :goto_9

    :cond_24
    move v0, v2

    goto :goto_14

    :cond_26
    move v1, v2

    goto :goto_1d
.end method

.method public getModifyJavaTime()Ljava/util/Date;
    .registers 6

    .prologue
    .line 366
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v0, :cond_13

    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->getValue()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getModifyTime()Lorg/apache/commons/compress/archivers/zip/ZipLong;
    .registers 2

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 572
    iget-byte v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v1, v1, 0x7

    mul-int/lit8 v0, v1, -0x7b

    .line 573
    .local v0, "hc":I
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v1, :cond_11

    .line 574
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 576
    :cond_11
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v1, :cond_22

    .line 579
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->hashCode()I

    move-result v1

    const/16 v2, 0xb

    invoke-static {v1, v2}, Ljava/lang/Integer;->rotateLeft(II)I

    move-result v1

    xor-int/2addr v0, v1

    .line 581
    :cond_22
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v1, :cond_33

    .line 582
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;->hashCode()I

    move-result v1

    const/16 v2, 0x16

    invoke-static {v1, v2}, Ljava/lang/Integer;->rotateLeft(II)I

    move-result v1

    xor-int/2addr v0, v1

    .line 584
    :cond_33
    return v0
.end method

.method public isBit0_modifyTimePresent()Z
    .registers 2

    .prologue
    .line 304
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    return v0
.end method

.method public isBit1_accessTimePresent()Z
    .registers 2

    .prologue
    .line 313
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    return v0
.end method

.method public isBit2_createTimePresent()Z
    .registers 2

    .prologue
    .line 322
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    return v0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .registers 4
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->reset()V

    .line 246
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->parseFromLocalFileData([BII)V

    .line 247
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .registers 7
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->reset()V

    .line 219
    add-int v0, p2, p3

    .line 220
    .local v0, "len":I
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "offset":I
    .local v1, "offset":I
    aget-byte v2, p1, p2

    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->setFlags(B)V

    .line 221
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    if-eqz v2, :cond_3c

    .line 222
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v2, p1, v1}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 223
    add-int/lit8 p2, v1, 0x4

    .line 228
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :goto_19
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    if-eqz v2, :cond_2a

    add-int/lit8 v2, p2, 0x4

    if-gt v2, v0, :cond_2a

    .line 229
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v2, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 230
    add-int/lit8 p2, p2, 0x4

    .line 232
    :cond_2a
    iget-boolean v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    if-eqz v2, :cond_3b

    add-int/lit8 v2, p2, 0x4

    if-gt v2, v0, :cond_3b

    .line 233
    new-instance v2, Lorg/apache/commons/compress/archivers/zip/ZipLong;

    invoke-direct {v2, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipLong;-><init>([BI)V

    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 234
    add-int/lit8 p2, p2, 0x4

    .line 236
    :cond_3b
    return-void

    .end local p2    # "offset":I
    .restart local v1    # "offset":I
    :cond_3c
    move p2, v1

    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_19
.end method

.method public setAccessJavaTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "d"    # Ljava/util/Date;

    .prologue
    .line 484
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->setAccessTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    return-void
.end method

.method public setAccessTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .registers 3
    .param p1, "l"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 431
    if-eqz p1, :cond_11

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 432
    if-eqz p1, :cond_13

    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    or-int/lit8 v0, v0, 0x2

    :goto_b
    int-to-byte v0, v0

    iput-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 434
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 435
    return-void

    .line 431
    :cond_11
    const/4 v0, 0x0

    goto :goto_3

    .line 432
    :cond_13
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v0, v0, -0x3

    goto :goto_b
.end method

.method public setCreateJavaTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "d"    # Ljava/util/Date;

    .prologue
    .line 499
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->setCreateTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    return-void
.end method

.method public setCreateTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .registers 3
    .param p1, "l"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 450
    if-eqz p1, :cond_11

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 451
    if-eqz p1, :cond_13

    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    or-int/lit8 v0, v0, 0x4

    :goto_b
    int-to-byte v0, v0

    iput-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 453
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 454
    return-void

    .line 450
    :cond_11
    const/4 v0, 0x0

    goto :goto_3

    .line 451
    :cond_13
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v0, v0, -0x5

    goto :goto_b
.end method

.method public setFlags(B)V
    .registers 6
    .param p1, "flags"    # B

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 275
    iput-byte p1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 276
    and-int/lit8 v0, p1, 0x1

    if-ne v0, v1, :cond_1b

    move v0, v1

    :goto_9
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 277
    and-int/lit8 v0, p1, 0x2

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1d

    move v0, v1

    :goto_11
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 278
    and-int/lit8 v0, p1, 0x4

    const/4 v3, 0x4

    if-ne v0, v3, :cond_1f

    :goto_18
    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 279
    return-void

    :cond_1b
    move v0, v2

    .line 276
    goto :goto_9

    :cond_1d
    move v0, v2

    .line 277
    goto :goto_11

    :cond_1f
    move v1, v2

    .line 278
    goto :goto_18
.end method

.method public setModifyJavaTime(Ljava/util/Date;)V
    .registers 3
    .param p1, "d"    # Ljava/util/Date;

    .prologue
    .line 469
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/compress/archivers/zip/ZipLong;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->setModifyTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V

    return-void
.end method

.method public setModifyTime(Lorg/apache/commons/compress/archivers/zip/ZipLong;)V
    .registers 3
    .param p1, "l"    # Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .prologue
    .line 412
    if-eqz p1, :cond_11

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 413
    if-eqz p1, :cond_13

    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    or-int/lit8 v0, v0, 0x1

    :goto_b
    int-to-byte v0, v0

    iput-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 415
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    .line 416
    return-void

    .line 412
    :cond_11
    const/4 v0, 0x0

    goto :goto_3

    .line 413
    :cond_13
    iget-byte v0, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    and-int/lit8 v0, v0, -0x2

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 531
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 532
    .local v1, "buf":Ljava/lang/StringBuilder;
    const-string v4, "0x5455 Zip Extra Field: Flags="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    iget-byte v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipUtil;->unsignedIntToSignedByte(I)B

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    if-eqz v4, :cond_38

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v4, :cond_38

    .line 535
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getModifyJavaTime()Ljava/util/Date;

    move-result-object v3

    .line 536
    .local v3, "m":Ljava/util/Date;
    const-string v4, " Modify:["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .end local v3    # "m":Ljava/util/Date;
    :cond_38
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    if-eqz v4, :cond_53

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v4, :cond_53

    .line 539
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getAccessJavaTime()Ljava/util/Date;

    move-result-object v0

    .line 540
    .local v0, "a":Ljava/util/Date;
    const-string v4, " Access:["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 542
    .end local v0    # "a":Ljava/util/Date;
    :cond_53
    iget-boolean v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    if-eqz v4, :cond_6e

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/compress/archivers/zip/ZipLong;

    if-eqz v4, :cond_6e

    .line 543
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp;->getCreateJavaTime()Ljava/util/Date;

    move-result-object v2

    .line 544
    .local v2, "c":Ljava/util/Date;
    const-string v4, " Create:["

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    .end local v2    # "c":Ljava/util/Date;
    :cond_6e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
