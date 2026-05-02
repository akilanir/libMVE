.class public Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
.super Ljava/lang/Object;
.source "SevenZArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# instance fields
.field private accessDate:J

.field private compressedCrc:J

.field private compressedSize:J

.field private contentMethods:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private crc:J

.field private creationDate:J

.field private hasAccessDate:Z

.field private hasCrc:Z

.field private hasCreationDate:Z

.field private hasLastModifiedDate:Z

.field private hasStream:Z

.field private hasWindowsAttributes:Z

.field private isAntiItem:Z

.field private isDirectory:Z

.field private lastModifiedDate:J

.field private name:Ljava/lang/String;

.field private size:J

.field private windowsAttributes:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static javaTimeToNtfsTime(Ljava/util/Date;)J
    .registers 8
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    const/4 v2, 0x0

    .line 506
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 507
    .local v0, "ntfsEpoch":Ljava/util/Calendar;
    const-string v1, "GMT+0"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 508
    const/16 v1, 0x641

    const/4 v3, 0x1

    move v4, v2

    move v5, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 509
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 510
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    mul-long/2addr v1, v3

    const-wide/16 v3, 0xa

    mul-long/2addr v1, v3

    return-wide v1
.end method

.method public static ntfsTimeToJavaTime(J)Ljava/util/Date;
    .registers 11
    .param p0, "ntfsTime"    # J

    .prologue
    const/4 v2, 0x0

    .line 492
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 493
    .local v0, "ntfsEpoch":Ljava/util/Calendar;
    const-string v1, "GMT+0"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 494
    const/16 v1, 0x641

    const/4 v3, 0x1

    move v4, v2

    move v5, v2

    move v6, v2

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 495
    const/16 v1, 0xe

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 496
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x2710

    div-long v3, p0, v3

    add-long v7, v1, v3

    .line 497
    .local v7, "realTime":J
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v7, v8}, Ljava/util/Date;-><init>(J)V

    return-object v1
.end method


# virtual methods
.method public getAccessDate()Ljava/util/Date;
    .registers 3

    .prologue
    .line 251
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasAccessDate:Z

    if-eqz v0, :cond_b

    .line 252
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->accessDate:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->ntfsTimeToJavaTime(J)Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 254
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The entry doesn\'t have this timestamp"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getCompressedCrc()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 374
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedCrc:J

    long-to-int v0, v0

    return v0
.end method

.method getCompressedCrcValue()J
    .registers 3

    .prologue
    .line 393
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedCrc:J

    return-wide v0
.end method

.method getCompressedSize()J
    .registers 3

    .prologue
    .line 429
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedSize:J

    return-wide v0
.end method

.method public getContentMethods()Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;"
        }
    .end annotation

    .prologue
    .line 482
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->contentMethods:Ljava/lang/Iterable;

    return-object v0
.end method

.method public getCrc()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 336
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->crc:J

    long-to-int v0, v0

    return v0
.end method

.method public getCrcValue()J
    .registers 3

    .prologue
    .line 355
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->crc:J

    return-wide v0
.end method

.method public getCreationDate()Ljava/util/Date;
    .registers 3

    .prologue
    .line 148
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCreationDate:Z

    if-eqz v0, :cond_b

    .line 149
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->creationDate:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->ntfsTimeToJavaTime(J)Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 151
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The entry doesn\'t have this timestamp"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHasAccessDate()Z
    .registers 2

    .prologue
    .line 233
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasAccessDate:Z

    return v0
.end method

.method public getHasCrc()Z
    .registers 2

    .prologue
    .line 318
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCrc:Z

    return v0
.end method

.method public getHasCreationDate()Z
    .registers 2

    .prologue
    .line 130
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCreationDate:Z

    return v0
.end method

.method public getHasLastModifiedDate()Z
    .registers 2

    .prologue
    .line 181
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasLastModifiedDate:Z

    return v0
.end method

.method public getHasWindowsAttributes()Z
    .registers 2

    .prologue
    .line 284
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasWindowsAttributes:Z

    return v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 3

    .prologue
    .line 200
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasLastModifiedDate:Z

    if-eqz v0, :cond_b

    .line 201
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->lastModifiedDate:J

    invoke-static {v0, v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->ntfsTimeToJavaTime(J)Ljava/util/Date;

    move-result-object v0

    return-object v0

    .line 203
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The entry doesn\'t have this timestamp"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 411
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->size:J

    return-wide v0
.end method

.method public getWindowsAttributes()I
    .registers 2

    .prologue
    .line 300
    iget v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->windowsAttributes:I

    return v0
.end method

.method public hasStream()Z
    .registers 2

    .prologue
    .line 78
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream:Z

    return v0
.end method

.method public isAntiItem()Z
    .registers 2

    .prologue
    .line 113
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isAntiItem:Z

    return v0
.end method

.method public isDirectory()Z
    .registers 2

    .prologue
    .line 95
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory:Z

    return v0
.end method

.method public setAccessDate(J)V
    .registers 3
    .param p1, "ntfsAccessDate"    # J

    .prologue
    .line 265
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->accessDate:J

    .line 266
    return-void
.end method

.method public setAccessDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "accessDate"    # Ljava/util/Date;

    .prologue
    .line 273
    if-eqz p1, :cond_10

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasAccessDate:Z

    .line 274
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasAccessDate:Z

    if-eqz v0, :cond_f

    .line 275
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->accessDate:J

    .line 277
    :cond_f
    return-void

    .line 273
    :cond_10
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public setAntiItem(Z)V
    .registers 2
    .param p1, "isAntiItem"    # Z

    .prologue
    .line 122
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isAntiItem:Z

    .line 123
    return-void
.end method

.method setCompressedCrc(I)V
    .registers 4
    .param p1, "crc"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 384
    int-to-long v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedCrc:J

    .line 385
    return-void
.end method

.method setCompressedCrcValue(J)V
    .registers 3
    .param p1, "crc"    # J

    .prologue
    .line 402
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedCrc:J

    .line 403
    return-void
.end method

.method setCompressedSize(J)V
    .registers 3
    .param p1, "size"    # J

    .prologue
    .line 438
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->compressedSize:J

    .line 439
    return-void
.end method

.method public setContentMethods(Ljava/lang/Iterable;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 456
    .local p1, "methods":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    if-eqz p1, :cond_22

    .line 457
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 458
    .local v1, "l":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    .line 459
    .local v2, "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_b

    .line 461
    .end local v2    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    :cond_1b
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->contentMethods:Ljava/lang/Iterable;

    .line 465
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "l":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;>;"
    :goto_21
    return-void

    .line 463
    :cond_22
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->contentMethods:Ljava/lang/Iterable;

    goto :goto_21
.end method

.method public setCrc(I)V
    .registers 4
    .param p1, "crc"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 346
    int-to-long v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->crc:J

    .line 347
    return-void
.end method

.method public setCrcValue(J)V
    .registers 3
    .param p1, "crc"    # J

    .prologue
    .line 364
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->crc:J

    .line 365
    return-void
.end method

.method public setCreationDate(J)V
    .registers 3
    .param p1, "ntfsCreationDate"    # J

    .prologue
    .line 162
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->creationDate:J

    .line 163
    return-void
.end method

.method public setCreationDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "creationDate"    # Ljava/util/Date;

    .prologue
    .line 170
    if-eqz p1, :cond_10

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCreationDate:Z

    .line 171
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCreationDate:Z

    if-eqz v0, :cond_f

    .line 172
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->creationDate:J

    .line 174
    :cond_f
    return-void

    .line 170
    :cond_10
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public setDirectory(Z)V
    .registers 2
    .param p1, "isDirectory"    # Z

    .prologue
    .line 104
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory:Z

    .line 105
    return-void
.end method

.method public setHasAccessDate(Z)V
    .registers 2
    .param p1, "hasAcessDate"    # Z

    .prologue
    .line 241
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasAccessDate:Z

    .line 242
    return-void
.end method

.method public setHasCrc(Z)V
    .registers 2
    .param p1, "hasCrc"    # Z

    .prologue
    .line 326
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCrc:Z

    .line 327
    return-void
.end method

.method public setHasCreationDate(Z)V
    .registers 2
    .param p1, "hasCreationDate"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasCreationDate:Z

    .line 139
    return-void
.end method

.method public setHasLastModifiedDate(Z)V
    .registers 2
    .param p1, "hasLastModifiedDate"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasLastModifiedDate:Z

    .line 191
    return-void
.end method

.method public setHasStream(Z)V
    .registers 2
    .param p1, "hasStream"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasStream:Z

    .line 87
    return-void
.end method

.method public setHasWindowsAttributes(Z)V
    .registers 2
    .param p1, "hasWindowsAttributes"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasWindowsAttributes:Z

    .line 293
    return-void
.end method

.method public setLastModifiedDate(J)V
    .registers 3
    .param p1, "ntfsLastModifiedDate"    # J

    .prologue
    .line 214
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->lastModifiedDate:J

    .line 215
    return-void
.end method

.method public setLastModifiedDate(Ljava/util/Date;)V
    .registers 4
    .param p1, "lastModifiedDate"    # Ljava/util/Date;

    .prologue
    .line 222
    if-eqz p1, :cond_10

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasLastModifiedDate:Z

    .line 223
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->hasLastModifiedDate:Z

    if-eqz v0, :cond_f

    .line 224
    invoke-static {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->javaTimeToNtfsTime(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->lastModifiedDate:J

    .line 226
    :cond_f
    return-void

    .line 222
    :cond_10
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->name:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setSize(J)V
    .registers 3
    .param p1, "size"    # J

    .prologue
    .line 420
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->size:J

    .line 421
    return-void
.end method

.method public setWindowsAttributes(I)V
    .registers 2
    .param p1, "windowsAttributes"    # I

    .prologue
    .line 308
    iput p1, p0, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->windowsAttributes:I

    .line 309
    return-void
.end method
