.class public Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
.super Ljava/lang/Object;
.source "DumpArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;,
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;,
        Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    }
.end annotation


# instance fields
.field private atime:J

.field private ctime:J

.field private generation:I

.field private gid:I

.field private final header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

.field private ino:I

.field private isDeleted:Z

.field private mode:I

.field private mtime:J

.field private name:Ljava/lang/String;

.field private nlink:I

.field private offset:J

.field private originalName:Ljava/lang/String;

.field private permissions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;",
            ">;"
        }
    .end annotation
.end field

.field private simpleName:Ljava/lang/String;

.field private size:J

.field private final summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

.field private type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

.field private uid:I

.field private volume:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 185
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 198
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 215
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 185
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 198
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 223
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 224
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 225
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;ILorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "simpleName"    # Ljava/lang/String;
    .param p3, "ino"    # I
    .param p4, "type"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .prologue
    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    sget-object v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->UNKNOWN:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 185
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 195
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    .line 198
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 237
    invoke-virtual {p0, p4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V

    .line 238
    invoke-virtual {p0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setName(Ljava/lang/String;)V

    .line 239
    iput-object p2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 240
    iput p3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    .line 241
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    .line 242
    return-void
.end method

.method static parse([B)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .registers 15
    .param p0, "buffer"    # [B

    .prologue
    const/16 v13, 0x200

    const-wide/16 v11, 0x3e8

    const/4 v10, 0x0

    .line 440
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;-><init>()V

    .line 441
    .local v0, "entry":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    iget-object v1, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    .line 443
    .local v1, "header":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;
    invoke-static {p0, v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v6

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;
    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$002(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;)Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    .line 449
    const/16 v6, 0xc

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->volume:I
    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$102(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 451
    const/16 v6, 0x14

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->ino:I
    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$202(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    .line 455
    const/16 v6, 0x20

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v3

    .line 458
    .local v3, "m":I
    shr-int/lit8 v6, v3, 0xc

    and-int/lit8 v6, v6, 0xf

    invoke-static {v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->find(I)Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V

    .line 461
    invoke-virtual {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setMode(I)V

    .line 463
    const/16 v6, 0x22

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert16([BI)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    .line 465
    const/16 v6, 0x28

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert64([BI)J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setSize(J)V

    .line 467
    const/16 v6, 0x30

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v11

    const/16 v8, 0x34

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 469
    .local v4, "t":J
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setAccessTime(Ljava/util/Date;)V

    .line 470
    const/16 v6, 0x38

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v11

    const/16 v8, 0x3c

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 472
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setLastModifiedDate(Ljava/util/Date;)V

    .line 473
    const/16 v6, 0x40

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    int-to-long v6, v6

    mul-long/2addr v6, v11

    const/16 v8, 0x44

    invoke-static {p0, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v8

    div-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    add-long v4, v6, v8

    .line 475
    iput-wide v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    .line 481
    const/16 v6, 0x8c

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    .line 482
    const/16 v6, 0x90

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setUserId(I)V

    .line 483
    const/16 v6, 0x94

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    invoke-virtual {v0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->setGroupId(I)V

    .line 485
    const/16 v6, 0xa0

    invoke-static {p0, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v6

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I
    invoke-static {v1, v6}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$302(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 487
    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I
    invoke-static {v1, v10}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$402(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 489
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_c3
    if-ge v2, v13, :cond_d7

    # getter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$300(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    move-result v6

    if-ge v2, v6, :cond_d7

    .line 490
    add-int/lit16 v6, v2, 0xa4

    aget-byte v6, p0, v6

    if-nez v6, :cond_d4

    .line 491
    # operator++ for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$408(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    .line 489
    :cond_d4
    add-int/lit8 v2, v2, 0x1

    goto :goto_c3

    .line 495
    :cond_d7
    const/16 v6, 0xa4

    # getter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->cdata:[B
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$500(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)[B

    move-result-object v7

    invoke-static {p0, v6, v7, v10, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 497
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getVolume()I

    move-result v6

    iput v6, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    .line 500
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 404
    if-ne p1, p0, :cond_5

    .line 425
    :cond_4
    :goto_4
    return v1

    .line 406
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

    .line 407
    goto :goto_4

    :cond_17
    move-object v0, p1

    .line 410
    check-cast v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .line 412
    .local v0, "rhs":Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    if-eqz v3, :cond_22

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    if-nez v3, :cond_24

    :cond_22
    move v1, v2

    .line 413
    goto :goto_4

    .line 416
    :cond_24
    iget v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    iget v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    if-eq v3, v4, :cond_2c

    move v1, v2

    .line 417
    goto :goto_4

    .line 420
    :cond_2c
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-nez v3, :cond_34

    iget-object v3, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-nez v3, :cond_42

    :cond_34
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->summary:Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;

    invoke-virtual {v3, v4}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveSummary;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_42
    move v1, v2

    .line 422
    goto :goto_4
.end method

.method public getAccessTime()Ljava/util/Date;
    .registers 4

    .prologue
    .line 728
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->atime:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .registers 4

    .prologue
    .line 289
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method getEntrySize()J
    .registers 3

    .prologue
    .line 704
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    return-wide v0
.end method

.method public getGeneration()I
    .registers 2

    .prologue
    .line 305
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    return v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 760
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->gid:I

    return v0
.end method

.method public getHeaderCount()I
    .registers 2

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getCount()I

    move-result v0

    return v0
.end method

.method public getHeaderHoles()I
    .registers 2

    .prologue
    .line 385
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getHoles()I

    move-result v0

    return v0
.end method

.method public getHeaderType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;
    .registers 2

    .prologue
    .line 369
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveConstants$SEGMENT_TYPE;

    move-result-object v0

    return-object v0
.end method

.method public getIno()I
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getIno()I

    move-result v0

    return v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 4

    .prologue
    .line 600
    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mtime:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 672
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 567
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNlink()I
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    return v0
.end method

.method public getOffset()J
    .registers 3

    .prologue
    .line 337
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    return-wide v0
.end method

.method getOriginalName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 575
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->originalName:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissions()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;",
            ">;"
        }
    .end annotation

    .prologue
    .line 689
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    return-object v0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 697
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_9

    const-wide/16 v0, -0x1

    :goto_8
    return-wide v0

    :cond_9
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    goto :goto_8
.end method

.method public getType()Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;
    .registers 2

    .prologue
    .line 656
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    return-object v0
.end method

.method public getUserId()I
    .registers 2

    .prologue
    .line 744
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->uid:I

    return v0
.end method

.method public getVolume()I
    .registers 2

    .prologue
    .line 353
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 399
    iget v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ino:I

    return v0
.end method

.method public isBlkDev()Z
    .registers 3

    .prologue
    .line 640
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->BLKDEV:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isChrDev()Z
    .registers 3

    .prologue
    .line 632
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->CHRDEV:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isDeleted()Z
    .registers 2

    .prologue
    .line 321
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDeleted:Z

    return v0
.end method

.method public isDirectory()Z
    .registers 3

    .prologue
    .line 608
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->DIRECTORY:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFifo()Z
    .registers 3

    .prologue
    .line 648
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->FIFO:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFile()Z
    .registers 3

    .prologue
    .line 616
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->FILE:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSocket()Z
    .registers 3

    .prologue
    .line 624
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    sget-object v1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;->SOCKET:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSparseRecord(I)Z
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 394
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    invoke-virtual {v0, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->getCdata(I)I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setAccessTime(Ljava/util/Date;)V
    .registers 4
    .param p1, "atime"    # Ljava/util/Date;

    .prologue
    .line 736
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->atime:J

    .line 737
    return-void
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .registers 4
    .param p1, "ctime"    # Ljava/util/Date;

    .prologue
    .line 297
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->ctime:J

    .line 298
    return-void
.end method

.method public setDeleted(Z)V
    .registers 2
    .param p1, "isDeleted"    # Z

    .prologue
    .line 329
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDeleted:Z

    .line 330
    return-void
.end method

.method public setGeneration(I)V
    .registers 2
    .param p1, "generation"    # I

    .prologue
    .line 313
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->generation:I

    .line 314
    return-void
.end method

.method public setGroupId(I)V
    .registers 2
    .param p1, "gid"    # I

    .prologue
    .line 768
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->gid:I

    .line 769
    return-void
.end method

.method public setLastModifiedDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "mtime"    # Ljava/util/Date;

    .prologue
    .line 720
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mtime:J

    .line 721
    return-void
.end method

.method public setMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 680
    and-int/lit16 v0, p1, 0xfff

    iput v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->mode:I

    .line 681
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$PERMISSION;->find(I)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->permissions:Ljava/util/Set;

    .line 682
    return-void
.end method

.method public final setName(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 583
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->originalName:Ljava/lang/String;

    .line 584
    if-eqz p1, :cond_32

    .line 585
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_25

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_25

    .line 586
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 588
    :cond_25
    const-string v0, "./"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 589
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 592
    :cond_32
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->name:Ljava/lang/String;

    .line 593
    return-void
.end method

.method public setNlink(I)V
    .registers 2
    .param p1, "nlink"    # I

    .prologue
    .line 281
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->nlink:I

    .line 282
    return-void
.end method

.method public setOffset(J)V
    .registers 3
    .param p1, "offset"    # J

    .prologue
    .line 345
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->offset:J

    .line 346
    return-void
.end method

.method protected setSimpleName(Ljava/lang/String;)V
    .registers 2
    .param p1, "simpleName"    # Ljava/lang/String;

    .prologue
    .line 257
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->simpleName:Ljava/lang/String;

    .line 258
    return-void
.end method

.method public setSize(J)V
    .registers 3
    .param p1, "size"    # J

    .prologue
    .line 712
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->size:J

    .line 713
    return-void
.end method

.method public setType(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;)V
    .registers 2
    .param p1, "type"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .prologue
    .line 664
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->type:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TYPE;

    .line 665
    return-void
.end method

.method public setUserId(I)V
    .registers 2
    .param p1, "uid"    # I

    .prologue
    .line 752
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->uid:I

    .line 753
    return-void
.end method

.method public setVolume(I)V
    .registers 2
    .param p1, "volume"    # I

    .prologue
    .line 361
    iput p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->volume:I

    .line 362
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 430
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method update([B)V
    .registers 7
    .param p1, "buffer"    # [B

    .prologue
    const/16 v4, 0x200

    const/4 v3, 0x0

    .line 507
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    const/16 v2, 0x10

    invoke-static {p1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->volume:I
    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$102(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 508
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    const/16 v2, 0xa0

    invoke-static {p1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveUtil;->convert32([BI)I

    move-result v2

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I
    invoke-static {v1, v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$302(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 510
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    # setter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I
    invoke-static {v1, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$402(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;I)I

    .line 512
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1f
    if-ge v0, v4, :cond_37

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    # getter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->count:I
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$300(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    move-result v1

    if-ge v0, v1, :cond_37

    .line 513
    add-int/lit16 v1, v0, 0xa4

    aget-byte v1, p1, v1

    if-nez v1, :cond_34

    .line 514
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    # operator++ for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->holes:I
    invoke-static {v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$408(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)I

    .line 512
    :cond_34
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 518
    :cond_37
    const/16 v1, 0xa4

    iget-object v2, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->header:Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;

    # getter for: Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->cdata:[B
    invoke-static {v2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;->access$500(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry$TapeSegmentHeader;)[B

    move-result-object v2

    invoke-static {p1, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 519
    return-void
.end method
