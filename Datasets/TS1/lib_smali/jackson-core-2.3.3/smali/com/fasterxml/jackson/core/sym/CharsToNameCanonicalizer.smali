.class public final Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
.super Ljava/lang/Object;
.source "CharsToNameCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;
    }
.end annotation


# static fields
.field protected static final DEFAULT_TABLE_SIZE:I = 0x40

.field public static final HASH_MULT:I = 0x21

.field static final MAX_COLL_CHAIN_FOR_REUSE:I = 0x3f

.field static final MAX_COLL_CHAIN_LENGTH:I = 0xff

.field static final MAX_ENTRIES_FOR_REUSE:I = 0x2ee0

.field protected static final MAX_TABLE_SIZE:I = 0x10000

.field static final sBootstrapSymbolTable:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;


# instance fields
.field protected _buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

.field protected final _canonicalize:Z

.field protected _dirty:Z

.field private final _hashSeed:I

.field protected _indexMask:I

.field protected final _intern:Z

.field protected _longestCollisionList:I

.field protected _parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

.field protected _size:I

.field protected _sizeThreshold:I

.field protected _symbols:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 98
    new-instance v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->sBootstrapSymbolTable:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 99
    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    .line 238
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_intern:Z

    .line 240
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    .line 241
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    .line 242
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 243
    const/16 v0, 0x40

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->initTables(I)V

    .line 244
    return-void
.end method

.method private constructor <init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;ZZ[Ljava/lang/String;[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;III)V
    .registers 11

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 271
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    .line 272
    iput-boolean p3, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_intern:Z

    .line 274
    iput-object p4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 275
    iput-object p5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 276
    iput p6, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 277
    iput p7, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    .line 279
    array-length v0, p4

    .line 280
    invoke-static {v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_thresholdSize(I)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    .line 281
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 282
    iput p8, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 285
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    .line 286
    return-void
.end method

.method private static _thresholdSize(I)I
    .registers 2

    .prologue
    .line 259
    shr-int/lit8 v0, p0, 0x2

    sub-int v0, p0, v0

    return v0
.end method

.method private copyArrays()V
    .registers 3

    .prologue
    .line 579
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 580
    array-length v1, v0

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 581
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 582
    array-length v1, v0

    invoke-static {v0, v1}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 583
    return-void
.end method

.method public static createRoot()Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .registers 4

    .prologue
    .line 218
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 220
    long-to-int v2, v0

    const/16 v3, 0x20

    ushr-long/2addr v0, v3

    long-to-int v0, v0

    add-int/2addr v0, v2

    or-int/lit8 v0, v0, 0x1

    .line 221
    invoke-static {v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->createRoot(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move-result-object v0

    return-object v0
.end method

.method protected static createRoot(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .registers 2

    .prologue
    .line 225
    sget-object v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->sBootstrapSymbolTable:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-direct {v0, p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->makeOrphan(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move-result-object v0

    return-object v0
.end method

.method private initTables(I)V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 248
    new-array v0, p1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 249
    shr-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 251
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 252
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 253
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 255
    invoke-static {p1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_thresholdSize(I)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    .line 256
    return-void
.end method

.method private makeOrphan(I)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .registers 11

    .prologue
    const/4 v2, 0x1

    .line 327
    new-instance v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iget v6, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    move v3, v2

    move v7, p1

    invoke-direct/range {v0 .. v8}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;-><init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;ZZ[Ljava/lang/String;[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;III)V

    return-object v0
.end method

.method private mergeChild(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)V
    .registers 4

    .prologue
    .line 346
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->size()I

    move-result v0

    const/16 v1, 0x2ee0

    if-gt v0, v1, :cond_e

    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    const/16 v1, 0x3f

    if-le v0, v1, :cond_1c

    .line 351
    :cond_e
    monitor-enter p0

    .line 352
    const/16 v0, 0x40

    :try_start_11
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->initTables(I)V

    .line 355
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    .line 356
    monitor-exit p0

    .line 376
    :cond_18
    :goto_18
    return-void

    .line 356
    :catchall_19
    move-exception v0

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_11 .. :try_end_1b} :catchall_19

    throw v0

    .line 360
    :cond_1c
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->size()I

    move-result v0

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->size()I

    move-result v1

    if-le v0, v1, :cond_18

    .line 364
    monitor-enter p0

    .line 365
    :try_start_27
    iget-object v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 366
    iget-object v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 367
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 368
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    .line 369
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 370
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 373
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    .line 374
    monitor-exit p0

    goto :goto_18

    :catchall_44
    move-exception v0

    monitor-exit p0
    :try_end_46
    .catchall {:try_start_27 .. :try_end_46} :catchall_44

    throw v0
.end method

.method private rehash()V
    .registers 13

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 594
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    array-length v4, v0

    .line 595
    add-int v0, v4, v4

    .line 601
    const/high16 v1, 0x10000

    if-le v0, v1, :cond_1b

    .line 606
    iput v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 607
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 608
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 609
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    .line 666
    :cond_1a
    return-void

    .line 613
    :cond_1b
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 614
    iget-object v6, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 615
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 616
    shr-int/lit8 v1, v0, 0x1

    new-array v1, v1, [Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 618
    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    .line 619
    invoke-static {v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_thresholdSize(I)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    move v3, v2

    move v0, v2

    move v1, v2

    .line 627
    :goto_36
    if-ge v3, v4, :cond_6b

    .line 628
    aget-object v7, v5, v3

    .line 629
    if-eqz v7, :cond_50

    .line 630
    add-int/lit8 v1, v1, 0x1

    .line 631
    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v8

    .line 632
    iget-object v9, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v9, v9, v8

    if-nez v9, :cond_53

    .line 633
    iget-object v9, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v7, v9, v8

    .line 627
    :cond_50
    :goto_50
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    .line 635
    :cond_53
    shr-int/lit8 v8, v8, 0x1

    .line 636
    new-instance v9, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iget-object v10, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v10, v10, v8

    invoke-direct {v9, v7, v10}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 637
    iget-object v7, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v9, v7, v8

    .line 638
    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length()I

    move-result v7

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_50

    .line 643
    :cond_6b
    shr-int/lit8 v4, v4, 0x1

    move v3, v2

    move v2, v1

    move v1, v0

    .line 644
    :goto_70
    if-ge v3, v4, :cond_b3

    .line 645
    aget-object v0, v6, v3

    move-object v11, v0

    move v0, v1

    move-object v1, v11

    .line 646
    :goto_77
    if-eqz v1, :cond_ae

    .line 647
    add-int/lit8 v2, v2, 0x1

    .line 648
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->getSymbol()Ljava/lang/String;

    move-result-object v5

    .line 649
    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v7

    .line 650
    iget-object v8, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v8, v8, v7

    if-nez v8, :cond_96

    .line 651
    iget-object v8, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v5, v8, v7

    .line 658
    :goto_91
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->getNext()Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    move-result-object v1

    goto :goto_77

    .line 653
    :cond_96
    shr-int/lit8 v7, v7, 0x1

    .line 654
    new-instance v8, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iget-object v9, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v9, v9, v7

    invoke-direct {v8, v5, v9}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 655
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v8, v5, v7

    .line 656
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length()I

    move-result v5

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_91

    .line 644
    :cond_ae
    add-int/lit8 v1, v3, 0x1

    move v3, v1

    move v1, v0

    goto :goto_70

    .line 661
    :cond_b3
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 663
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    if-eq v2, v0, :cond_1a

    .line 664
    new-instance v0, Ljava/lang/Error;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Internal error on SymbolTable.rehash(): had "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " entries; now have "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public _hashToIndex(I)I
    .registers 4

    .prologue
    .line 532
    ushr-int/lit8 v0, p1, 0xf

    add-int/2addr v0, p1

    .line 533
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_indexMask:I

    and-int/2addr v0, v1

    return v0
.end method

.method public bucketCount()I
    .registers 2

    .prologue
    .line 409
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public calcHash(Ljava/lang/String;)I
    .registers 7

    .prologue
    .line 557
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 559
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    .line 560
    const/4 v0, 0x0

    move v4, v0

    move v0, v1

    move v1, v4

    :goto_a
    if-ge v1, v3, :cond_18

    .line 561
    mul-int/lit8 v0, v0, 0x21

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    add-int/2addr v2, v0

    .line 560
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v2

    goto :goto_a

    .line 564
    :cond_18
    if-nez v0, :cond_1b

    const/4 v0, 0x1

    :cond_1b
    return v0
.end method

.method public calcHash([CII)I
    .registers 8

    .prologue
    .line 547
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    .line 548
    const/4 v0, 0x0

    move v3, v0

    move v0, v1

    move v1, v3

    :goto_6
    if-ge v1, p3, :cond_12

    .line 549
    mul-int/lit8 v0, v0, 0x21

    aget-char v2, p1, v1

    add-int/2addr v2, v0

    .line 548
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    move v0, v2

    goto :goto_6

    .line 552
    :cond_12
    if-nez v0, :cond_15

    const/4 v0, 0x1

    :cond_15
    return v0
.end method

.method public collisionCount()I
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 424
    .line 426
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    array-length v3, v2

    move v1, v0

    :goto_5
    if-ge v1, v3, :cond_13

    aget-object v4, v2, v1

    .line 427
    if-eqz v4, :cond_10

    .line 428
    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length()I

    move-result v4

    add-int/2addr v0, v4

    .line 426
    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 431
    :cond_13
    return v0
.end method

.method public findSymbol([CIII)Ljava/lang/String;
    .registers 12

    .prologue
    const/16 v6, 0xff

    const/4 v5, 0x1

    .line 454
    if-ge p3, v5, :cond_8

    .line 455
    const-string v1, ""

    .line 523
    :cond_7
    :goto_7
    return-object v1

    .line 457
    :cond_8
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_canonicalize:Z

    if-nez v0, :cond_12

    .line 458
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_7

    .line 466
    :cond_12
    invoke-virtual {p0, p4}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v1

    .line 467
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v2, v0, v1

    .line 470
    if-eqz v2, :cond_46

    .line 472
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, p3, :cond_36

    .line 473
    const/4 v0, 0x0

    .line 475
    :cond_23
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int v4, p2, v0

    aget-char v4, p1, v4

    if-eq v3, v4, :cond_31

    .line 480
    :goto_2d
    if-ne v0, p3, :cond_36

    move-object v1, v2

    .line 481
    goto :goto_7

    .line 478
    :cond_31
    add-int/lit8 v0, v0, 0x1

    if-lt v0, p3, :cond_23

    goto :goto_2d

    .line 485
    :cond_36
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    shr-int/lit8 v2, v1, 0x1

    aget-object v0, v0, v2

    .line 486
    if-eqz v0, :cond_46

    .line 487
    invoke-virtual {v0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->find([CII)Ljava/lang/String;

    move-result-object v0

    .line 488
    if-eqz v0, :cond_46

    move-object v1, v0

    .line 489
    goto :goto_7

    .line 494
    :cond_46
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    if-nez v0, :cond_70

    .line 495
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->copyArrays()V

    .line 496
    iput-boolean v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    move v0, v1

    .line 505
    :goto_50
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 506
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_intern:Z

    if-eqz v2, :cond_5f

    .line 507
    sget-object v2, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 509
    :cond_5f
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 511
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aget-object v2, v2, v0

    if-nez v2, :cond_82

    .line 512
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    aput-object v1, v2, v0

    goto :goto_7

    .line 497
    :cond_70
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_sizeThreshold:I

    if-lt v0, v2, :cond_a6

    .line 498
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->rehash()V

    .line 502
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->calcHash([CII)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashToIndex(I)I

    move-result v0

    goto :goto_50

    .line 514
    :cond_82
    shr-int/lit8 v0, v0, 0x1

    .line 515
    new-instance v2, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aget-object v3, v3, v0

    invoke-direct {v2, v1, v3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;)V

    .line 516
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    aput-object v2, v3, v0

    .line 517
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;->length()I

    move-result v0

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 518
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    if-le v0, v6, :cond_7

    .line 519
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->reportTooManyCollisions(I)V

    goto/16 :goto_7

    :cond_a6
    move v0, v1

    goto :goto_50
.end method

.method public hashSeed()I
    .registers 2

    .prologue
    .line 413
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    return v0
.end method

.method public makeChild(ZZ)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .registers 12

    .prologue
    .line 313
    monitor-enter p0

    .line 314
    :try_start_1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_symbols:[Ljava/lang/String;

    .line 315
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_buckets:[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;

    .line 316
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    .line 317
    iget v7, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_hashSeed:I

    .line 318
    iget v8, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    .line 319
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_15

    .line 321
    new-instance v0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move-object v1, p0

    move v2, p1

    move v3, p2

    invoke-direct/range {v0 .. v8}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;-><init>(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;ZZ[Ljava/lang/String;[Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer$Bucket;III)V

    return-object v0

    .line 319
    :catchall_15
    move-exception v0

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_15

    throw v0
.end method

.method public maxCollisionLength()I
    .registers 2

    .prologue
    .line 443
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_longestCollisionList:I

    return v0
.end method

.method public maybeDirty()Z
    .registers 2

    .prologue
    .line 411
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    return v0
.end method

.method public release()V
    .registers 2

    .prologue
    .line 381
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->maybeDirty()Z

    move-result v0

    if-nez v0, :cond_7

    .line 392
    :cond_6
    :goto_6
    return-void

    .line 384
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    if-eqz v0, :cond_6

    .line 385
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-direct {v0, p0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->mergeChild(Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)V

    .line 390
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_dirty:Z

    goto :goto_6
.end method

.method protected reportTooManyCollisions(I)V
    .registers 5

    .prologue
    .line 673
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Longest collision chain in symbol table (of size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") now exceeds maximum, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -- suspect a DoS attack based on hash collisions"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 400
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->_size:I

    return v0
.end method
