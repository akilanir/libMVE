.class public Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
.super Ljava/util/zip/ZipEntry;
.source "ZipArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# static fields
.field public static final CRC_UNKNOWN:I = -0x1

.field private static final EMPTY:[B

.field public static final PLATFORM_FAT:I = 0x0

.field public static final PLATFORM_UNIX:I = 0x3

.field private static final SHORT_MASK:I = 0xffff

.field private static final SHORT_SHIFT:I = 0x10

.field private static final noExtraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;


# instance fields
.field private externalAttributes:J

.field private extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

.field private gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

.field private internalAttributes:I

.field private method:I

.field private name:Ljava/lang/String;

.field private platform:I

.field private rawName:[B

.field private size:J

.field private unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 58
    new-array v0, v1, [B

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->EMPTY:[B

    .line 88
    new-array v0, v1, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    sput-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 151
    const-string v0, ""

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 5
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;

    .prologue
    .line 166
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_21

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_21

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .end local p2    # "entryName":Ljava/lang/String;
    :cond_21
    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/lang/String;)V

    .line 168
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 169
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 171
    :cond_31
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setTime(J)V

    .line 173
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 99
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->method:I

    .line 78
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->size:J

    .line 80
    iput v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 81
    iput v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 82
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 84
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 85
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 86
    iput-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 87
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    .line 100
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public constructor <init>(Ljava/util/zip/ZipEntry;)V
    .registers 7
    .param p1, "entry"    # Ljava/util/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 113
    invoke-direct {p0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 70
    const/4 v1, -0x1

    iput v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->method:I

    .line 78
    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->size:J

    .line 80
    iput v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 81
    iput v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 82
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 84
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 85
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 86
    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 87
    new-instance v1, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    invoke-direct {v1}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;-><init>()V

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    .line 114
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getExtra()[B

    move-result-object v0

    .line 116
    .local v0, "extra":[B
    if-eqz v0, :cond_46

    .line 117
    const/4 v1, 0x1

    sget-object v2, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 124
    :goto_38
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getMethod()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 125
    invoke-virtual {p1}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v1

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->size:J

    .line 126
    return-void

    .line 122
    :cond_46
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    goto :goto_38
.end method

.method public constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .registers 5
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;-><init>(Ljava/util/zip/ZipEntry;)V

    .line 139
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setInternalAttributes(I)V

    .line 140
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 141
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 142
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setPlatform(I)V

    .line 143
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    move-result-object v0

    .line 144
    .local v0, "other":Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    if-nez v0, :cond_2a

    const/4 v1, 0x0

    :goto_26
    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setGeneralPurposeBit(Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;)V

    .line 146
    return-void

    .line 144
    :cond_2a
    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    goto :goto_26
.end method

.method private copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 3
    .param p1, "src"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    .line 386
    array-length v0, p1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method private copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 6
    .param p1, "src"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .param p2, "length"    # I

    .prologue
    const/4 v2, 0x0

    .line 390
    new-array v0, p2, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 391
    .local v0, "cpy":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v1, p1

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 392
    return-object v0
.end method

.method private getAllExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 3

    .prologue
    .line 406
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 407
    .local v0, "allExtraFieldsNoCopy":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-ne v0, v1, :cond_c

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .end local v0    # "allExtraFieldsNoCopy":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_c
    return-object v0
.end method

.method private getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 2

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-nez v0, :cond_9

    .line 380
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getUnparseableOnly()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 382
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v0, :cond_12

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMergedFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    goto :goto_8

    :cond_12
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    goto :goto_8
.end method

.method private getMergedFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 4

    .prologue
    .line 396
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 397
    .local v0, "zipExtraFields":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v1, v1

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    aput-object v2, v0, v1

    .line 398
    return-object v0
.end method

.method private getParseableExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 3

    .prologue
    .line 370
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getParseableExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 371
    .local v0, "parseableExtraFields":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-ne v0, v1, :cond_c

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .end local v0    # "parseableExtraFields":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_c
    return-object v0
.end method

.method private getParseableExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 2

    .prologue
    .line 363
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-nez v0, :cond_7

    .line 364
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 366
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    goto :goto_6
.end method

.method private getUnparseableOnly()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 4

    .prologue
    .line 402
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-nez v0, :cond_7

    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->noExtraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    :goto_6
    return-object v0

    :cond_7
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    aput-object v2, v0, v1

    goto :goto_6
.end method

.method private mergeExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;Z)V
    .registers 11
    .param p1, "f"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .param p2, "local"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 720
    iget-object v6, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-nez v6, :cond_9

    .line 721
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 744
    :goto_8
    return-void

    .line 723
    :cond_9
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_c
    if-ge v4, v5, :cond_3b

    aget-object v2, v0, v4

    .line 725
    .local v2, "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    instance-of v6, v2, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v6, :cond_1e

    .line 726
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 730
    .local v3, "existing":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :goto_16
    if-nez v3, :cond_27

    .line 731
    invoke-virtual {p0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->addExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 723
    :goto_1b
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 728
    .end local v3    # "existing":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_1e
    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v3

    .restart local v3    # "existing":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    goto :goto_16

    .line 733
    :cond_27
    if-eqz p2, :cond_32

    .line 734
    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getLocalFileDataData()[B

    move-result-object v1

    .line 735
    .local v1, "b":[B
    array-length v6, v1

    invoke-interface {v3, v1, v7, v6}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->parseFromLocalFileData([BII)V

    goto :goto_1b

    .line 737
    .end local v1    # "b":[B
    :cond_32
    invoke-interface {v2}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getCentralDirectoryData()[B

    move-result-object v1

    .line 738
    .restart local v1    # "b":[B
    array-length v6, v1

    invoke-interface {v3, v1, v7, v6}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->parseFromCentralDirectoryData([BII)V

    goto :goto_1b

    .line 742
    .end local v1    # "b":[B
    .end local v2    # "element":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v3    # "existing":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_3b
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    goto :goto_8
.end method


# virtual methods
.method public addAsFirstExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V
    .registers 8
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 443
    instance-of v3, p1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v3, :cond_e

    .line 444
    check-cast p1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .end local p1    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 457
    :cond_a
    :goto_a
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 458
    return-void

    .line 446
    .restart local p1    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_e
    invoke-interface {p1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v3

    if-eqz v3, :cond_1f

    .line 447
    invoke-interface {p1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V

    .line 449
    :cond_1f
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 450
    .local v0, "copy":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-eqz v3, :cond_3f

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v3, v3

    add-int/lit8 v1, v3, 0x1

    .line 451
    .local v1, "newLen":I
    :goto_2a
    new-array v3, v1, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 452
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    aput-object p1, v3, v5

    .line 453
    if-eqz v0, :cond_a

    .line 454
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    invoke-static {v0, v5, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_a

    .end local v1    # "newLen":I
    :cond_3f
    move v1, v2

    .line 450
    goto :goto_2a
.end method

.method public addExtraField(Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V
    .registers 5
    .param p1, "ze"    # Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    .line 418
    instance-of v1, p1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v1, :cond_c

    .line 419
    check-cast p1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .end local p1    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 432
    :goto_8
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 433
    return-void

    .line 421
    .restart local p1    # "ze":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_c
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-nez v1, :cond_19

    .line 422
    const/4 v1, 0x1

    new-array v1, v1, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    goto :goto_8

    .line 424
    :cond_19
    invoke-interface {p1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    if-eqz v1, :cond_2a

    .line 425
    invoke-interface {p1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->removeExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V

    .line 427
    :cond_2a
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v2, v2

    add-int/lit8 v2, v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->copyOf([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;I)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 428
    .local v0, "zipExtraFields":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-object p1, v0, v1

    .line 429
    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    goto :goto_8
.end method

.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 181
    invoke-super {p0}, Ljava/util/zip/ZipEntry;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 183
    .local v0, "e":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setInternalAttributes(I)V

    .line 184
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 185
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V

    .line 186
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 13
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 755
    if-ne p0, p1, :cond_6

    move v6, v5

    .line 779
    :cond_5
    :goto_5
    return v6

    .line 758
    :cond_6
    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    if-ne v7, v8, :cond_5

    move-object v2, p1

    .line 761
    check-cast v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 762
    .local v2, "other":Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    .line 763
    .local v1, "myName":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    .line 764
    .local v4, "otherName":Ljava/lang/String;
    if-nez v1, :cond_ba

    .line 765
    if-nez v4, :cond_5

    .line 771
    :cond_21
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getComment()Ljava/lang/String;

    move-result-object v0

    .line 772
    .local v0, "myComment":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getComment()Ljava/lang/String;

    move-result-object v3

    .line 773
    .local v3, "otherComment":Ljava/lang/String;
    if-nez v0, :cond_2d

    .line 774
    const-string v0, ""

    .line 776
    :cond_2d
    if-nez v3, :cond_31

    .line 777
    const-string v3, ""

    .line 779
    :cond_31
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getInternalAttributes()I

    move-result v8

    if-ne v7, v8, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v8

    if-ne v7, v8, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getMethod()I

    move-result v8

    if-ne v7, v8, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getSize()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCrc()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCompressedSize()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    move-result-object v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getCentralDirectoryExtra()[B

    move-result-object v8

    invoke-static {v7, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v7

    if-eqz v7, :cond_c2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    move-result-object v7

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getLocalFileDataExtra()[B

    move-result-object v8

    invoke-static {v7, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v7

    if-eqz v7, :cond_c2

    iget-object v7, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    iget-object v8, v2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    invoke-virtual {v7, v8}, Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_c2

    :goto_b7
    move v6, v5

    goto/16 :goto_5

    .line 768
    .end local v0    # "myComment":Ljava/lang/String;
    .end local v3    # "otherComment":Ljava/lang/String;
    :cond_ba
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_21

    goto/16 :goto_5

    .restart local v0    # "myComment":Ljava/lang/String;
    .restart local v3    # "otherComment":Ljava/lang/String;
    :cond_c2
    move v5, v6

    .line 779
    goto :goto_b7
.end method

.method public getCentralDirectoryExtra()[B
    .registers 2

    .prologue
    .line 584
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->mergeCentralDirectoryData([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[B

    move-result-object v0

    return-object v0
.end method

.method public getExternalAttributes()J
    .registers 3

    .prologue
    .line 249
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    return-wide v0
.end method

.method public getExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 7
    .param p1, "type"    # Lorg/apache/commons/compress/archivers/zip/ZipShort;

    .prologue
    .line 502
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-eqz v4, :cond_1a

    .line 503
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_1a

    aget-object v1, v0, v2

    .line 504
    .local v1, "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    invoke-interface {v1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 509
    .end local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v1    # "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :goto_16
    return-object v1

    .line 503
    .restart local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .restart local v1    # "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 509
    .end local v0    # "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v1    # "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_1a
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public getExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 2

    .prologue
    .line 344
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getParseableExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    return-object v0
.end method

.method public getExtraFields(Z)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    .registers 3
    .param p1, "includeUnparseable"    # Z

    .prologue
    .line 357
    if-eqz p1, :cond_7

    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    :goto_6
    return-object v0

    :cond_7
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getParseableExtraFields()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    goto :goto_6
.end method

.method public getGeneralPurposeBit()Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;
    .registers 2

    .prologue
    .line 698
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    return-object v0
.end method

.method public getInternalAttributes()I
    .registers 2

    .prologue
    .line 228
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    return v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 4

    .prologue
    .line 747
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getLocalFileDataExtra()[B
    .registers 2

    .prologue
    .line 575
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExtra()[B

    move-result-object v0

    .line 576
    .local v0, "extra":[B
    if-eqz v0, :cond_7

    .end local v0    # "extra":[B
    :goto_6
    return-object v0

    .restart local v0    # "extra":[B
    :cond_7
    sget-object v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->EMPTY:[B

    goto :goto_6
.end method

.method public getMethod()I
    .registers 2

    .prologue
    .line 199
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->method:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 593
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    if-nez v0, :cond_9

    invoke-super {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    goto :goto_8
.end method

.method public getPlatform()I
    .registers 2

    .prologue
    .line 305
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    return v0
.end method

.method public getRawName()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 670
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    if-eqz v1, :cond_13

    .line 671
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    array-length v1, v1

    new-array v0, v1, [B

    .line 672
    .local v0, "b":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 675
    .end local v0    # "b":[B
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 628
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->size:J

    return-wide v0
.end method

.method public getUnixMode()I
    .registers 5

    .prologue
    .line 281
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_7

    const/4 v0, 0x0

    :goto_6
    return v0

    :cond_7
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getExternalAttributes()J

    move-result-wide v0

    const/16 v2, 0x10

    shr-long/2addr v0, v2

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_6
.end method

.method public getUnparseableExtraFieldData()Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;
    .registers 2

    .prologue
    .line 520
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 689
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isDirectory()Z
    .registers 3

    .prologue
    .line 602
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isUnixSymlink()Z
    .registers 3

    .prologue
    const v1, 0xa000

    .line 294
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getUnixMode()I

    move-result v0

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public removeExtraField(Lorg/apache/commons/compress/archivers/zip/ZipShort;)V
    .registers 9
    .param p1, "type"    # Lorg/apache/commons/compress/archivers/zip/ZipShort;

    .prologue
    .line 465
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    if-nez v5, :cond_a

    .line 466
    new-instance v5, Ljava/util/NoSuchElementException;

    invoke-direct {v5}, Ljava/util/NoSuchElementException;-><init>()V

    throw v5

    .line 469
    :cond_a
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 470
    .local v4, "newResult":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipExtraField;>;"
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_13
    if-ge v2, v3, :cond_27

    aget-object v1, v0, v2

    .line 471
    .local v1, "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    invoke-interface {v1}, Lorg/apache/commons/compress/archivers/zip/ZipExtraField;->getHeaderId()Lorg/apache/commons/compress/archivers/zip/ZipShort;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/commons/compress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_24

    .line 472
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 470
    :cond_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 475
    .end local v1    # "extraField":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_27
    iget-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    array-length v5, v5

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ne v5, v6, :cond_36

    .line 476
    new-instance v5, Ljava/util/NoSuchElementException;

    invoke-direct {v5}, Ljava/util/NoSuchElementException;-><init>()V

    throw v5

    .line 478
    :cond_36
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iput-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 479
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 480
    return-void
.end method

.method public removeUnparseableExtraFieldData()V
    .registers 2

    .prologue
    .line 488
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-nez v0, :cond_a

    .line 489
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 491
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 492
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 493
    return-void
.end method

.method public setCentralDirectoryExtra([B)V
    .registers 6
    .param p1, "b"    # [B

    .prologue
    .line 561
    const/4 v2, 0x0

    :try_start_1
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    .line 564
    .local v0, "central":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->mergeExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;Z)V
    :try_end_b
    .catch Ljava/util/zip/ZipException; {:try_start_1 .. :try_end_b} :catch_c

    .line 568
    return-void

    .line 565
    .end local v0    # "central":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :catch_c
    move-exception v1

    .line 566
    .local v1, "e":Ljava/util/zip/ZipException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/util/zip/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setExternalAttributes(J)V
    .registers 3
    .param p1, "value"    # J

    .prologue
    .line 257
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->externalAttributes:J

    .line 258
    return-void
.end method

.method protected setExtra()V
    .registers 2

    .prologue
    .line 552
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getAllExtraFieldsNoCopy()[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->mergeLocalFileDataData([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)[B

    move-result-object v0

    invoke-super {p0, v0}, Ljava/util/zip/ZipEntry;->setExtra([B)V

    .line 553
    return-void
.end method

.method public setExtra([B)V
    .registers 7
    .param p1, "extra"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 534
    const/4 v2, 0x1

    :try_start_1
    sget-object v3, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;->READ:Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;

    invoke-static {p1, v2, v3}, Lorg/apache/commons/compress/archivers/zip/ExtraFieldUtils;->parse([BZLorg/apache/commons/compress/archivers/zip/ExtraFieldUtils$UnparseableExtraField;)[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    move-result-object v1

    .line 537
    .local v1, "local":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->mergeExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;Z)V
    :try_end_b
    .catch Ljava/util/zip/ZipException; {:try_start_1 .. :try_end_b} :catch_c

    .line 543
    return-void

    .line 538
    .end local v1    # "local":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :catch_c
    move-exception v0

    .line 540
    .local v0, "e":Ljava/util/zip/ZipException;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error parsing extra fields for entry: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/zip/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setExtraFields([Lorg/apache/commons/compress/archivers/zip/ZipExtraField;)V
    .registers 8
    .param p1, "fields"    # [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .prologue
    .line 321
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v4, "newFields":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/compress/archivers/zip/ZipExtraField;>;"
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_1b

    aget-object v1, v0, v2

    .line 323
    .local v1, "field":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    instance-of v5, v1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    if-eqz v5, :cond_17

    .line 324
    check-cast v1, Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .end local v1    # "field":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    iput-object v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->unparseableExtra:Lorg/apache/commons/compress/archivers/zip/UnparseableExtraFieldData;

    .line 322
    :goto_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 326
    .restart local v1    # "field":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_17
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 329
    .end local v1    # "field":Lorg/apache/commons/compress/archivers/zip/ZipExtraField;
    :cond_1b
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    iput-object v5, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->extraFields:[Lorg/apache/commons/compress/archivers/zip/ZipExtraField;

    .line 330
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExtra()V

    .line 331
    return-void
.end method

.method public setGeneralPurposeBit(Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;)V
    .registers 2
    .param p1, "b"    # Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    .prologue
    .line 707
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->gpb:Lorg/apache/commons/compress/archivers/zip/GeneralPurposeBit;

    .line 708
    return-void
.end method

.method public setInternalAttributes(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 236
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->internalAttributes:I

    .line 237
    return-void
.end method

.method public setMethod(I)V
    .registers 5
    .param p1, "method"    # I

    .prologue
    .line 211
    if-gez p1, :cond_1b

    .line 212
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ZIP compression method can not be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 215
    :cond_1b
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->method:I

    .line 216
    return-void
.end method

.method protected setName(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 610
    if-eqz p1, :cond_18

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->getPlatform()I

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 612
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 614
    :cond_18
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->name:Ljava/lang/String;

    .line 615
    return-void
.end method

.method protected setName(Ljava/lang/String;[B)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "rawName"    # [B

    .prologue
    .line 655
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 656
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->rawName:[B

    .line 657
    return-void
.end method

.method protected setPlatform(I)V
    .registers 2
    .param p1, "platform"    # I

    .prologue
    .line 313
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 314
    return-void
.end method

.method public setSize(J)V
    .registers 5
    .param p1, "size"    # J

    .prologue
    .line 639
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_e

    .line 640
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid entry size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 642
    :cond_e
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->size:J

    .line 643
    return-void
.end method

.method public setUnixMode(I)V
    .registers 5
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x0

    .line 267
    shl-int/lit8 v2, p1, 0x10

    and-int/lit16 v0, p1, 0x80

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    :goto_8
    or-int/2addr v0, v2

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_11

    const/16 v1, 0x10

    :cond_11
    or-int/2addr v0, v1

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->setExternalAttributes(J)V

    .line 273
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;->platform:I

    .line 274
    return-void

    :cond_1a
    move v0, v1

    .line 267
    goto :goto_8
.end method
