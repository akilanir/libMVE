.class public final Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
.super Ljava/lang/Object;
.source "ByteQuadsCanonicalizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;
    }
.end annotation


# static fields
.field private static final DEFAULT_T_SIZE:I = 0x40

.field static final MAX_ENTRIES_FOR_REUSE:I = 0x1770

.field private static final MAX_T_SIZE:I = 0x10000

.field static final MIN_HASH_SIZE:I = 0x10

.field private static final MULT:I = 0x21

.field private static final MULT2:I = 0x1003f

.field private static final MULT3:I = 0x1f


# instance fields
.field protected _count:I

.field protected final _failOnDoS:Z

.field protected _hashArea:[I

.field private _hashShared:Z

.field protected _hashSize:I

.field protected _intern:Z

.field protected _longNameOffset:I

.field protected _names:[Ljava/lang/String;

.field private transient _needRehash:Z

.field protected final _parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

.field protected _secondaryStart:I

.field private final _seed:I

.field protected _spilloverEnd:I

.field protected final _tableInfo:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected _tertiaryShift:I

.field protected _tertiaryStart:I


# direct methods
.method private constructor <init>(IZIZ)V
    .registers 8
    .param p1, "sz"    # I
    .param p2, "intern"    # Z
    .param p3, "seed"    # I
    .param p4, "failOnDoS"    # Z

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 224
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    .line 225
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    .line 226
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    .line 228
    const/16 v1, 0x10

    if-ge p1, v1, :cond_1e

    .line 229
    const/16 p1, 0x10

    .line 241
    :cond_12
    :goto_12
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 242
    return-void

    .line 233
    :cond_1e
    add-int/lit8 v1, p1, -0x1

    and-int/2addr v1, p1

    if-eqz v1, :cond_12

    .line 234
    const/16 v0, 0x10

    .line 235
    .local v0, "curr":I
    :goto_25
    if-ge v0, p1, :cond_29

    .line 236
    add-int/2addr v0, v0

    goto :goto_25

    .line 238
    :cond_29
    move p1, v0

    goto :goto_12
.end method

.method private constructor <init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;ZIZLcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V
    .registers 8
    .param p1, "parent"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .param p2, "intern"    # Z
    .param p3, "seed"    # I
    .param p4, "failOnDoS"    # Z
    .param p5, "state"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .prologue
    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    iput-object p1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 251
    iput p3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    .line 252
    iput-boolean p2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    .line 253
    iput-boolean p4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    .line 254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    .line 257
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 258
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->size:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 259
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .line 260
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .line 261
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->tertiaryShift:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    .line 263
    iget-object v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->mainHash:[I

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 264
    iget-object v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->names:[Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 266
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->spilloverEnd:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 267
    iget v0, p5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->longNameOffset:I

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 271
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 272
    return-void
.end method

.method private _appendLongName([II)I
    .registers 9
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I

    .prologue
    .line 939
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 942
    .local v2, "start":I
    add-int v4, v2, p2

    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v5, v5

    if-le v4, v5, :cond_29

    .line 944
    add-int v4, v2, p2

    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v5, v5

    sub-int v3, v4, v5

    .line 946
    .local v3, "toAdd":I
    const/16 v4, 0x1000

    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 948
    .local v0, "minAdd":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v4, v4

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int v1, v4, v5

    .line 949
    .local v1, "newSize":I
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {v4, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 951
    .end local v0    # "minAdd":I
    .end local v1    # "newSize":I
    .end local v3    # "toAdd":I
    :cond_29
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {p1, v4, v5, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 952
    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    add-int/2addr v4, p2

    iput v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 953
    return v2
.end method

.method private final _calcOffset(I)I
    .registers 4
    .param p1, "hash"    # I

    .prologue
    .line 609
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    add-int/lit8 v1, v1, -0x1

    and-int v0, p1, v1

    .line 611
    .local v0, "ix":I
    shl-int/lit8 v1, v0, 0x2

    return v1
.end method

.method static _calcTertiaryShift(I)I
    .registers 3
    .param p0, "primarySlots"    # I

    .prologue
    .line 1191
    shr-int/lit8 v0, p0, 0x2

    .line 1194
    .local v0, "tertSlots":I
    const/16 v1, 0x40

    if-ge v0, v1, :cond_8

    .line 1195
    const/4 v1, 0x4

    .line 1204
    :goto_7
    return v1

    .line 1197
    :cond_8
    const/16 v1, 0x100

    if-gt v0, v1, :cond_e

    .line 1198
    const/4 v1, 0x5

    goto :goto_7

    .line 1200
    :cond_e
    const/16 v1, 0x400

    if-gt v0, v1, :cond_14

    .line 1201
    const/4 v1, 0x6

    goto :goto_7

    .line 1204
    :cond_14
    const/4 v1, 0x7

    goto :goto_7
.end method

.method private _findOffsetForAdd(I)I
    .registers 11
    .param p1, "hash"    # I

    .prologue
    const/4 v8, 0x1

    .line 890
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v3

    .line 891
    .local v3, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 892
    .local v2, "hashArea":[I
    add-int/lit8 v5, v3, 0x3

    aget v5, v2, v5

    if-nez v5, :cond_f

    move v4, v3

    .line 934
    :cond_e
    :goto_e
    return v4

    .line 897
    :cond_f
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v3, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int v4, v5, v6

    .line 898
    .local v4, "offset2":I
    add-int/lit8 v5, v4, 0x3

    aget v5, v2, v5

    if-eqz v5, :cond_e

    .line 904
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v6, v6, 0x2

    shr-int v6, v3, v6

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v6, v7

    add-int v4, v5, v6

    .line 905
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int v0, v8, v5

    .line 906
    .local v0, "bucketSize":I
    add-int v1, v4, v0

    .local v1, "end":I
    :goto_30
    if-ge v4, v1, :cond_3b

    .line 907
    add-int/lit8 v5, v4, 0x3

    aget v5, v2, v5

    if-eqz v5, :cond_e

    .line 906
    add-int/lit8 v4, v4, 0x4

    goto :goto_30

    .line 914
    :cond_3b
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 915
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    add-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 925
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v1, v5, 0x3

    .line 926
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-lt v5, v1, :cond_54

    .line 927
    iget-boolean v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_failOnDoS:Z

    if-eqz v5, :cond_52

    .line 928
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_reportTooManyCollisions()V

    .line 932
    :cond_52
    iput-boolean v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    :cond_54
    move v4, v3

    .line 934
    goto :goto_e
.end method

.method private _findSecondary(II)Ljava/lang/String;
    .registers 13
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v9, 0x1

    .line 626
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v7, v7, 0x2

    shr-int v7, p1, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v7, v8

    add-int v4, v6, v7

    .line 627
    .local v4, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 628
    .local v2, "hashArea":[I
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int v0, v9, v6

    .line 629
    .local v0, "bucketSize":I
    add-int v1, v4, v0

    .local v1, "end":I
    :goto_17
    if-ge v4, v1, :cond_2f

    .line 630
    add-int/lit8 v6, v4, 0x3

    aget v3, v2, v6

    .line 631
    .local v3, "len":I
    aget v6, v2, v4

    if-ne p2, v6, :cond_2a

    if-ne v9, v3, :cond_2a

    .line 632
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    .line 646
    .end local v3    # "len":I
    :cond_29
    :goto_29
    return-object v5

    .line 634
    .restart local v3    # "len":I
    :cond_2a
    if-eqz v3, :cond_29

    .line 629
    add-int/lit8 v4, v4, 0x4

    goto :goto_17

    .line 641
    .end local v3    # "len":I
    :cond_2f
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v4

    :goto_33
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v4, v6, :cond_29

    .line 642
    aget v6, v2, v4

    if-ne p2, v6, :cond_48

    add-int/lit8 v6, v4, 0x3

    aget v6, v2, v6

    if-ne v9, v6, :cond_48

    .line 643
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    goto :goto_29

    .line 641
    :cond_48
    add-int/lit8 v4, v4, 0x4

    goto :goto_33
.end method

.method private _findSecondary(III)Ljava/lang/String;
    .registers 14
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I
    .param p3, "q2"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v9, 0x2

    .line 651
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v7, v7, 0x2

    shr-int v7, p1, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v7, v8

    add-int v4, v6, v7

    .line 652
    .local v4, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 654
    .local v2, "hashArea":[I
    const/4 v6, 0x1

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int v0, v6, v7

    .line 655
    .local v0, "bucketSize":I
    add-int v1, v4, v0

    .local v1, "end":I
    :goto_18
    if-ge v4, v1, :cond_36

    .line 656
    add-int/lit8 v6, v4, 0x3

    aget v3, v2, v6

    .line 657
    .local v3, "len":I
    aget v6, v2, v4

    if-ne p2, v6, :cond_31

    add-int/lit8 v6, v4, 0x1

    aget v6, v2, v6

    if-ne p3, v6, :cond_31

    if-ne v9, v3, :cond_31

    .line 658
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    .line 669
    .end local v3    # "len":I
    :cond_30
    :goto_30
    return-object v5

    .line 660
    .restart local v3    # "len":I
    :cond_31
    if-eqz v3, :cond_30

    .line 655
    add-int/lit8 v4, v4, 0x4

    goto :goto_18

    .line 664
    .end local v3    # "len":I
    :cond_36
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v4

    :goto_3a
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v4, v6, :cond_30

    .line 665
    aget v6, v2, v4

    if-ne p2, v6, :cond_55

    add-int/lit8 v6, v4, 0x1

    aget v6, v2, v6

    if-ne p3, v6, :cond_55

    add-int/lit8 v6, v4, 0x3

    aget v6, v2, v6

    if-ne v9, v6, :cond_55

    .line 666
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    goto :goto_30

    .line 664
    :cond_55
    add-int/lit8 v4, v4, 0x4

    goto :goto_3a
.end method

.method private _findSecondary(IIII)Ljava/lang/String;
    .registers 15
    .param p1, "origOffset"    # I
    .param p2, "q1"    # I
    .param p3, "q2"    # I
    .param p4, "q3"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v9, 0x3

    .line 674
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v7, v7, 0x2

    shr-int v7, p1, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v7, v8

    add-int v4, v6, v7

    .line 675
    .local v4, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 677
    .local v2, "hashArea":[I
    const/4 v6, 0x1

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int v0, v6, v7

    .line 678
    .local v0, "bucketSize":I
    add-int v1, v4, v0

    .local v1, "end":I
    :goto_18
    if-ge v4, v1, :cond_3c

    .line 679
    add-int/lit8 v6, v4, 0x3

    aget v3, v2, v6

    .line 680
    .local v3, "len":I
    aget v6, v2, v4

    if-ne p2, v6, :cond_37

    add-int/lit8 v6, v4, 0x1

    aget v6, v2, v6

    if-ne p3, v6, :cond_37

    add-int/lit8 v6, v4, 0x2

    aget v6, v2, v6

    if-ne p4, v6, :cond_37

    if-ne v9, v3, :cond_37

    .line 681
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    .line 693
    .end local v3    # "len":I
    :cond_36
    :goto_36
    return-object v5

    .line 683
    .restart local v3    # "len":I
    :cond_37
    if-eqz v3, :cond_36

    .line 678
    add-int/lit8 v4, v4, 0x4

    goto :goto_18

    .line 687
    .end local v3    # "len":I
    :cond_3c
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v4

    :goto_40
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v4, v6, :cond_36

    .line 688
    aget v6, v2, v4

    if-ne p2, v6, :cond_61

    add-int/lit8 v6, v4, 0x1

    aget v6, v2, v6

    if-ne p3, v6, :cond_61

    add-int/lit8 v6, v4, 0x2

    aget v6, v2, v6

    if-ne p4, v6, :cond_61

    add-int/lit8 v6, v4, 0x3

    aget v6, v2, v6

    if-ne v9, v6, :cond_61

    .line 690
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    goto :goto_36

    .line 687
    :cond_61
    add-int/lit8 v4, v4, 0x4

    goto :goto_40
.end method

.method private _findSecondary(II[II)Ljava/lang/String;
    .registers 14
    .param p1, "origOffset"    # I
    .param p2, "hash"    # I
    .param p3, "q"    # [I
    .param p4, "qlen"    # I

    .prologue
    const/4 v5, 0x0

    .line 698
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    add-int/lit8 v7, v7, 0x2

    shr-int v7, p1, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int/2addr v7, v8

    add-int v4, v6, v7

    .line 699
    .local v4, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 701
    .local v2, "hashArea":[I
    const/4 v6, 0x1

    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    shl-int v0, v6, v7

    .line 702
    .local v0, "bucketSize":I
    add-int v1, v4, v0

    .local v1, "end":I
    :goto_17
    if-ge v4, v1, :cond_2f

    .line 703
    add-int/lit8 v6, v4, 0x3

    aget v3, v2, v6

    .line 704
    .local v3, "len":I
    aget v6, v2, v4

    if-ne p2, v6, :cond_2a

    if-ne p4, v3, :cond_2a

    .line 705
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    .line 718
    .end local v3    # "len":I
    :cond_29
    :goto_29
    return-object v5

    .line 707
    .restart local v3    # "len":I
    :cond_2a
    if-eqz v3, :cond_29

    .line 702
    add-int/lit8 v4, v4, 0x4

    goto :goto_17

    .line 711
    .end local v3    # "len":I
    :cond_2f
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v4

    :goto_33
    iget v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    if-ge v4, v6, :cond_29

    .line 712
    aget v6, v2, v4

    if-ne p2, v6, :cond_52

    add-int/lit8 v6, v4, 0x3

    aget v6, v2, v6

    if-ne p4, v6, :cond_52

    .line 713
    add-int/lit8 v6, v4, 0x1

    aget v6, v2, v6

    invoke-direct {p0, p3, p4, v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v6

    if-eqz v6, :cond_52

    .line 714
    iget-object v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    goto :goto_29

    .line 711
    :cond_52
    add-int/lit8 v4, v4, 0x4

    goto :goto_33
.end method

.method private final _spilloverStart()I
    .registers 3

    .prologue
    .line 1172
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1173
    .local v0, "offset":I
    shl-int/lit8 v1, v0, 0x3

    sub-int/2addr v1, v0

    return v1
.end method

.method private _verifyLongName([III)Z
    .registers 11
    .param p1, "q"    # [I
    .param p2, "qlen"    # I
    .param p3, "spillOffset"    # I

    .prologue
    const/4 v4, 0x0

    .line 723
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 725
    .local v0, "hashArea":[I
    const/4 v1, 0x0

    .line 727
    .local v1, "ix":I
    packed-switch p2, :pswitch_data_78

    .line 729
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName2([III)Z

    move-result v4

    .line 744
    :cond_b
    :goto_b
    return v4

    .line 731
    :pswitch_c
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .local v2, "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .local v3, "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_19

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_19
    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .line 733
    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    :pswitch_1b
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_28

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_28
    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .line 735
    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    :pswitch_2a
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_37

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_37
    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .line 737
    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    :pswitch_39
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_46

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_46
    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .line 739
    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    :pswitch_48
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_55

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .line 740
    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_55
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    aget v5, p1, v2

    add-int/lit8 p3, v3, 0x1

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    aget v6, v0, v3

    if-ne v5, v6, :cond_b

    .line 741
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    aget v5, p1, v1

    add-int/lit8 v3, p3, 0x1

    .end local p3    # "spillOffset":I
    .restart local v3    # "spillOffset":I
    aget v6, v0, p3

    if-eq v5, v6, :cond_6c

    move v1, v2

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    move p3, v3

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_b

    .line 742
    .end local v1    # "ix":I
    .end local p3    # "spillOffset":I
    .restart local v2    # "ix":I
    .restart local v3    # "spillOffset":I
    :cond_6c
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    aget v5, p1, v2

    add-int/lit8 p3, v3, 0x1

    .end local v3    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    aget v6, v0, v3

    if-ne v5, v6, :cond_b

    .line 744
    const/4 v4, 0x1

    goto :goto_b

    .line 727
    :pswitch_data_78
    .packed-switch 0x4
        :pswitch_48
        :pswitch_39
        :pswitch_2a
        :pswitch_1b
        :pswitch_c
    .end packed-switch
.end method

.method private _verifyLongName2([III)Z
    .registers 9
    .param p1, "q"    # [I
    .param p2, "qlen"    # I
    .param p3, "spillOffset"    # I

    .prologue
    .line 749
    const/4 v0, 0x0

    .line 751
    .local v0, "ix":I
    :goto_1
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "ix":I
    .local v1, "ix":I
    aget v3, p1, v0

    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, p3, 0x1

    .end local p3    # "spillOffset":I
    .local v2, "spillOffset":I
    aget v4, v4, p3

    if-eq v3, v4, :cond_f

    .line 752
    const/4 v3, 0x0

    .line 755
    :goto_e
    return v3

    .line 754
    :cond_f
    if-lt v1, p2, :cond_13

    .line 755
    const/4 v3, 0x1

    goto :goto_e

    :cond_13
    move v0, v1

    .end local v1    # "ix":I
    .restart local v0    # "ix":I
    move p3, v2

    .end local v2    # "spillOffset":I
    .restart local p3    # "spillOffset":I
    goto :goto_1
.end method

.method private _verifyNeedForRehash()V
    .registers 8

    .prologue
    .line 863
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shr-int/lit8 v2, v2, 0x1

    if-le v1, v2, :cond_2c

    .line 864
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v2

    sub-int/2addr v1, v2

    shr-int/lit8 v0, v1, 0x2

    .line 865
    .local v0, "spillCount":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v1, v1, 0x1

    shr-int/lit8 v1, v1, 0x7

    if-gt v0, v1, :cond_29

    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    int-to-double v1, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    int-to-double v3, v3

    const-wide v5, 0x3fe999999999999aL    # 0.8

    mul-double/2addr v3, v5

    cmpl-double v1, v1, v3

    if-lez v1, :cond_2c

    .line 867
    :cond_29
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 870
    .end local v0    # "spillCount":I
    :cond_2c
    return-void
.end method

.method private _verifySharing()V
    .registers 3

    .prologue
    .line 874
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    if-eqz v0, :cond_1f

    .line 875
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 876
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 877
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 879
    :cond_1f
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    if-eqz v0, :cond_26

    .line 880
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->rehash()V

    .line 882
    :cond_26
    return-void
.end method

.method public static createRoot()Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .registers 6

    .prologue
    .line 288
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 290
    .local v0, "now":J
    long-to-int v3, v0

    const/16 v4, 0x20

    ushr-long v4, v0, v4

    long-to-int v4, v4

    add-int/2addr v3, v4

    or-int/lit8 v2, v3, 0x1

    .line 291
    .local v2, "seed":I
    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->createRoot(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    move-result-object v3

    return-object v3
.end method

.method protected static createRoot(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .registers 4
    .param p0, "seed"    # I

    .prologue
    const/4 v2, 0x1

    .line 299
    new-instance v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    const/16 v1, 0x40

    invoke-direct {v0, v1, v2, p0, v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;-><init>(IZIZ)V

    return-object v0
.end method

.method private mergeChild(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V
    .registers 5
    .param p1, "childState"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .prologue
    .line 335
    iget v0, p1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    .line 336
    .local v0, "childCount":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    .line 340
    .local v1, "currState":Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;
    iget v2, v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    if-ne v0, v2, :cond_f

    .line 353
    :goto_e
    return-void

    .line 348
    :cond_f
    const/16 v2, 0x1770

    if-le v0, v2, :cond_19

    .line 350
    const/16 v2, 0x40

    invoke-static {v2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->createInitial(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-result-object p1

    .line 352
    :cond_19
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_e
.end method

.method private nukeSymbols(Z)V
    .registers 4
    .param p1, "fill"    # Z

    .prologue
    const/4 v1, 0x0

    .line 1149
    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 1151
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 1153
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_longNameOffset:I

    .line 1154
    if-eqz p1, :cond_1c

    .line 1155
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 1156
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1158
    :cond_1c
    return-void
.end method

.method private rehash()V
    .registers 18

    .prologue
    .line 1064
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_needRehash:Z

    .line 1066
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 1070
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 1071
    .local v9, "oldHashArea":[I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 1072
    .local v10, "oldNames":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget v11, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1073
    .local v11, "oldSize":I
    move-object/from16 v0, p0

    iget v7, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 1074
    .local v7, "oldCount":I
    add-int v5, v11, v11

    .line 1075
    .local v5, "newSize":I
    move-object/from16 v0, p0

    iget v8, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    .line 1080
    .local v8, "oldEnd":I
    const/high16 v14, 0x10000

    if-le v5, v14, :cond_2b

    .line 1081
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->nukeSymbols(Z)V

    .line 1142
    :cond_2a
    return-void

    .line 1085
    :cond_2b
    array-length v14, v9

    shl-int/lit8 v15, v11, 0x3

    add-int/2addr v14, v15

    new-array v14, v14, [I

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 1086
    move-object/from16 v0, p0

    iput v5, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    .line 1087
    shl-int/lit8 v14, v5, 0x2

    move-object/from16 v0, p0

    iput v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .line 1088
    move-object/from16 v0, p0

    iget v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v15, v15, 0x1

    add-int/2addr v14, v15

    move-object/from16 v0, p0

    iput v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .line 1089
    invoke-static {v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcTertiaryShift(I)I

    move-result v14

    move-object/from16 v0, p0

    iput v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryShift:I

    .line 1092
    array-length v14, v10

    shl-int/lit8 v14, v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    .line 1093
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->nukeSymbols(Z)V

    .line 1100
    const/4 v1, 0x0

    .line 1101
    .local v1, "copyCount":I
    const/16 v14, 0x10

    new-array v12, v14, [I

    .line 1102
    .local v12, "q":[I
    const/4 v6, 0x0

    .local v6, "offset":I
    move v2, v8

    .local v2, "end":I
    :goto_6c
    if-ge v6, v2, :cond_cc

    .line 1103
    add-int/lit8 v14, v6, 0x3

    aget v3, v9, v14

    .line 1104
    .local v3, "len":I
    if-nez v3, :cond_77

    .line 1102
    :goto_74
    add-int/lit8 v6, v6, 0x4

    goto :goto_6c

    .line 1107
    :cond_77
    add-int/lit8 v1, v1, 0x1

    .line 1108
    shr-int/lit8 v14, v6, 0x2

    aget-object v4, v10, v14

    .line 1109
    .local v4, "name":Ljava/lang/String;
    packed-switch v3, :pswitch_data_f2

    .line 1126
    array-length v14, v12

    if-le v3, v14, :cond_85

    .line 1127
    new-array v12, v3, [I

    .line 1130
    :cond_85
    add-int/lit8 v14, v6, 0x1

    aget v13, v9, v14

    .line 1131
    .local v13, "qoff":I
    const/4 v14, 0x0

    invoke-static {v9, v13, v12, v14, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1132
    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v12, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    goto :goto_74

    .line 1111
    .end local v13    # "qoff":I
    :pswitch_93
    const/4 v14, 0x0

    aget v15, v9, v6

    aput v15, v12, v14

    .line 1112
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v12, v14}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    goto :goto_74

    .line 1115
    :pswitch_9f
    const/4 v14, 0x0

    aget v15, v9, v6

    aput v15, v12, v14

    .line 1116
    const/4 v14, 0x1

    add-int/lit8 v15, v6, 0x1

    aget v15, v9, v15

    aput v15, v12, v14

    .line 1117
    const/4 v14, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v12, v14}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    goto :goto_74

    .line 1120
    :pswitch_b2
    const/4 v14, 0x0

    aget v15, v9, v6

    aput v15, v12, v14

    .line 1121
    const/4 v14, 0x1

    add-int/lit8 v15, v6, 0x1

    aget v15, v9, v15

    aput v15, v12, v14

    .line 1122
    const/4 v14, 0x2

    add-int/lit8 v15, v6, 0x2

    aget v15, v9, v15

    aput v15, v12, v14

    .line 1123
    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v12, v14}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    goto :goto_74

    .line 1139
    .end local v3    # "len":I
    .end local v4    # "name":Ljava/lang/String;
    :cond_cc
    if-eq v1, v7, :cond_2a

    .line 1140
    new-instance v14, Ljava/lang/IllegalStateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Failed rehash(): old count="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ", copyCount="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1109
    nop

    :pswitch_data_f2
    .packed-switch 0x1
        :pswitch_93
        :pswitch_9f
        :pswitch_b2
    .end packed-switch
.end method


# virtual methods
.method protected _reportTooManyCollisions()V
    .registers 4

    .prologue
    .line 1179
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    const/16 v1, 0x400

    if-gt v0, v1, :cond_7

    .line 1180
    return-void

    .line 1182
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Spill-over slots in symbol table with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries, hash area of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slots is now full (all "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shr-int/lit8 v2, v2, 0x3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " slots -- suspect a DoS attack based on hash collisions."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " You can disable the check via `JsonFactory.Feature.FAIL_ON_SYMBOL_HASH_OVERFLOW`"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addName(Ljava/lang/String;I)Ljava/lang/String;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I

    .prologue
    .line 765
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 766
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v1, :cond_d

    .line 767
    sget-object v1, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 769
    :cond_d
    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v0

    .line 770
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v1, v0

    .line 771
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x3

    const/4 v3, 0x1

    aput v3, v1, v2

    .line 772
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v2, v0, 0x2

    aput-object p1, v1, v2

    .line 773
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 774
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 775
    return-object p1
.end method

.method public addName(Ljava/lang/String;II)Ljava/lang/String;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I
    .param p3, "q2"    # I

    .prologue
    .line 779
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 780
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v2, :cond_d

    .line 781
    sget-object v2, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v2, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 783
    :cond_d
    if-nez p3, :cond_38

    invoke-virtual {p0, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v0

    .line 784
    .local v0, "hash":I
    :goto_13
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v1

    .line 785
    .local v1, "offset":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v2, v1

    .line 786
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v3, v1, 0x1

    aput p3, v2, v3

    .line 787
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v3, v1, 0x3

    const/4 v4, 0x2

    aput v4, v2, v3

    .line 788
    iget-object v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v3, v1, 0x2

    aput-object p1, v2, v3

    .line 789
    iget v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 790
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 791
    return-object p1

    .line 783
    .end local v0    # "hash":I
    .end local v1    # "offset":I
    :cond_38
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v0

    goto :goto_13
.end method

.method public addName(Ljava/lang/String;III)Ljava/lang/String;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q1"    # I
    .param p3, "q2"    # I
    .param p4, "q3"    # I

    .prologue
    .line 795
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 796
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v1, :cond_d

    .line 797
    sget-object v1, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 799
    :cond_d
    invoke-virtual {p0, p2, p3, p4}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v1

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v0

    .line 800
    .local v0, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput p2, v1, v0

    .line 801
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x1

    aput p3, v1, v2

    .line 802
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x2

    aput p4, v1, v2

    .line 803
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v2, v0, 0x3

    const/4 v3, 0x3

    aput v3, v1, v2

    .line 804
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v2, v0, 0x2

    aput-object p1, v1, v2

    .line 805
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 806
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 807
    return-object p1
.end method

.method public addName(Ljava/lang/String;[II)Ljava/lang/String;
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "q"    # [I
    .param p3, "qlen"    # I

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 812
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifySharing()V

    .line 813
    iget-boolean v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_intern:Z

    if-eqz v3, :cond_10

    .line 814
    sget-object v3, Lcom/fasterxml/jackson/core/util/InternCache;->instance:Lcom/fasterxml/jackson/core/util/InternCache;

    invoke-virtual {v3, p1}, Lcom/fasterxml/jackson/core/util/InternCache;->intern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 818
    :cond_10
    packed-switch p3, :pswitch_data_a4

    .line 844
    invoke-virtual {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash([II)I

    move-result v0

    .line 845
    .local v0, "hash":I
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v2

    .line 847
    .local v2, "offset":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aput v0, v3, v2

    .line 848
    invoke-direct {p0, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_appendLongName([II)I

    move-result v1

    .line 849
    .local v1, "longStart":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x1

    aput v1, v3, v4

    .line 850
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x3

    aput p3, v3, v4

    .line 853
    .end local v0    # "hash":I
    .end local v1    # "longStart":I
    :goto_2f
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v4, v2, 0x2

    aput-object p1, v3, v4

    .line 856
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    .line 857
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyNeedForRehash()V

    .line 858
    return-object p1

    .line 821
    .end local v2    # "offset":I
    :pswitch_3f
    aget v3, p2, v6

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v3

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v2

    .line 822
    .restart local v2    # "offset":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v4, p2, v6

    aput v4, v3, v2

    .line 823
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x3

    aput v7, v3, v4

    goto :goto_2f

    .line 828
    .end local v2    # "offset":I
    :pswitch_56
    aget v3, p2, v6

    aget v4, p2, v7

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v3

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v2

    .line 829
    .restart local v2    # "offset":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v4, p2, v6

    aput v4, v3, v2

    .line 830
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x1

    aget v5, p2, v7

    aput v5, v3, v4

    .line 831
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x3

    aput v8, v3, v4

    goto :goto_2f

    .line 836
    .end local v2    # "offset":I
    :pswitch_77
    aget v3, p2, v6

    aget v4, p2, v7

    aget v5, p2, v8

    invoke-virtual {p0, v3, v4, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v3

    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findOffsetForAdd(I)I

    move-result v2

    .line 837
    .restart local v2    # "offset":I
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v4, p2, v6

    aput v4, v3, v2

    .line 838
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x1

    aget v5, p2, v7

    aput v5, v3, v4

    .line 839
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x2

    aget v5, p2, v8

    aput v5, v3, v4

    .line 840
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    add-int/lit8 v4, v2, 0x3

    const/4 v5, 0x3

    aput v5, v3, v4

    goto :goto_2f

    .line 818
    nop

    :pswitch_data_a4
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_56
        :pswitch_77
    .end packed-switch
.end method

.method public bucketCount()I
    .registers 2

    .prologue
    .line 373
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    return v0
.end method

.method public calcHash(I)I
    .registers 4
    .param p1, "q1"    # I

    .prologue
    .line 978
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int v0, p1, v1

    .line 984
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0x10

    add-int/2addr v0, v1

    .line 985
    shl-int/lit8 v1, v0, 0x3

    xor-int/2addr v0, v1

    .line 986
    ushr-int/lit8 v1, v0, 0xc

    add-int/2addr v0, v1

    .line 987
    return v0
.end method

.method public calcHash(II)I
    .registers 5
    .param p1, "q1"    # I
    .param p2, "q2"    # I

    .prologue
    .line 994
    move v0, p1

    .line 996
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 997
    ushr-int/lit8 v1, v0, 0x9

    xor-int/2addr v0, v1

    .line 998
    mul-int/lit8 v1, p2, 0x21

    add-int/2addr v0, v1

    .line 999
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int/2addr v0, v1

    .line 1000
    ushr-int/lit8 v1, v0, 0x10

    add-int/2addr v0, v1

    .line 1001
    ushr-int/lit8 v1, v0, 0x4

    xor-int/2addr v0, v1

    .line 1002
    shl-int/lit8 v1, v0, 0x3

    add-int/2addr v0, v1

    .line 1004
    return v0
.end method

.method public calcHash(III)I
    .registers 6
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I

    .prologue
    .line 1009
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int v0, p1, v1

    .line 1010
    .local v0, "hash":I
    ushr-int/lit8 v1, v0, 0x9

    add-int/2addr v0, v1

    .line 1011
    mul-int/lit8 v0, v0, 0x1f

    .line 1012
    add-int/2addr v0, p2

    .line 1013
    mul-int/lit8 v0, v0, 0x21

    .line 1014
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 1015
    xor-int/2addr v0, p3

    .line 1017
    ushr-int/lit8 v1, v0, 0x4

    add-int/2addr v0, v1

    .line 1019
    ushr-int/lit8 v1, v0, 0xf

    add-int/2addr v0, v1

    .line 1020
    shl-int/lit8 v1, v0, 0x9

    xor-int/2addr v0, v1

    .line 1022
    return v0
.end method

.method public calcHash([II)I
    .registers 8
    .param p1, "q"    # [I
    .param p2, "qlen"    # I

    .prologue
    .line 1027
    const/4 v3, 0x4

    if-ge p2, v3, :cond_9

    .line 1028
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 1035
    :cond_9
    const/4 v3, 0x0

    aget v3, p1, v3

    iget v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    xor-int v0, v3, v4

    .line 1036
    .local v0, "hash":I
    ushr-int/lit8 v3, v0, 0x9

    add-int/2addr v0, v3

    .line 1037
    const/4 v3, 0x1

    aget v3, p1, v3

    add-int/2addr v0, v3

    .line 1038
    ushr-int/lit8 v3, v0, 0xf

    add-int/2addr v0, v3

    .line 1039
    mul-int/lit8 v0, v0, 0x21

    .line 1040
    const/4 v3, 0x2

    aget v3, p1, v3

    xor-int/2addr v0, v3

    .line 1041
    ushr-int/lit8 v3, v0, 0x4

    add-int/2addr v0, v3

    .line 1043
    const/4 v1, 0x3

    .local v1, "i":I
    :goto_24
    if-ge v1, p2, :cond_2f

    .line 1044
    aget v2, p1, v1

    .line 1045
    .local v2, "next":I
    shr-int/lit8 v3, v2, 0x15

    xor-int/2addr v2, v3

    .line 1046
    add-int/2addr v0, v2

    .line 1043
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 1048
    .end local v2    # "next":I
    :cond_2f
    const v3, 0x1003f

    mul-int/2addr v0, v3

    .line 1051
    ushr-int/lit8 v3, v0, 0x13

    add-int/2addr v0, v3

    .line 1052
    shl-int/lit8 v3, v0, 0x5

    xor-int/2addr v0, v3

    .line 1053
    return v0
.end method

.method public findName(I)Ljava/lang/String;
    .registers 10
    .param p1, "q1"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x1

    .line 470
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(I)I

    move-result v5

    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v2

    .line 472
    .local v2, "offset":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 474
    .local v0, "hashArea":[I
    add-int/lit8 v5, v2, 0x3

    aget v1, v0, v5

    .line 476
    .local v1, "len":I
    if-ne v1, v7, :cond_1d

    .line 477
    aget v5, v0, v2

    if-ne v5, p1, :cond_1f

    .line 478
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v2, 0x2

    aget-object v4, v4, v5

    .line 497
    :cond_1c
    :goto_1c
    return-object v4

    .line 480
    :cond_1d
    if-eqz v1, :cond_1c

    .line 484
    :cond_1f
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v2, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int v3, v5, v6

    .line 486
    .local v3, "offset2":I
    add-int/lit8 v5, v3, 0x3

    aget v1, v0, v5

    .line 488
    if-ne v1, v7, :cond_38

    .line 489
    aget v4, v0, v3

    if-ne v4, p1, :cond_3a

    .line 490
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v3, 0x2

    aget-object v4, v4, v5

    goto :goto_1c

    .line 492
    :cond_38
    if-eqz v1, :cond_1c

    .line 497
    :cond_3a
    invoke-direct {p0, v2, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_1c
.end method

.method public findName(II)Ljava/lang/String;
    .registers 11
    .param p1, "q1"    # I
    .param p2, "q2"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x2

    .line 502
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(II)I

    move-result v5

    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v2

    .line 504
    .local v2, "offset":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 506
    .local v0, "hashArea":[I
    add-int/lit8 v5, v2, 0x3

    aget v1, v0, v5

    .line 508
    .local v1, "len":I
    if-ne v1, v7, :cond_23

    .line 509
    aget v5, v0, v2

    if-ne p1, v5, :cond_25

    add-int/lit8 v5, v2, 0x1

    aget v5, v0, v5

    if-ne p2, v5, :cond_25

    .line 510
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v2, 0x2

    aget-object v4, v4, v5

    .line 527
    :cond_22
    :goto_22
    return-object v4

    .line 512
    :cond_23
    if-eqz v1, :cond_22

    .line 516
    :cond_25
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v2, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int v3, v5, v6

    .line 518
    .local v3, "offset2":I
    add-int/lit8 v5, v3, 0x3

    aget v1, v0, v5

    .line 520
    if-ne v1, v7, :cond_44

    .line 521
    aget v4, v0, v3

    if-ne p1, v4, :cond_46

    add-int/lit8 v4, v3, 0x1

    aget v4, v0, v4

    if-ne p2, v4, :cond_46

    .line 522
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v3, 0x2

    aget-object v4, v4, v5

    goto :goto_22

    .line 524
    :cond_44
    if-eqz v1, :cond_22

    .line 527
    :cond_46
    invoke-direct {p0, v2, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(III)Ljava/lang/String;

    move-result-object v4

    goto :goto_22
.end method

.method public findName(III)Ljava/lang/String;
    .registers 12
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x3

    .line 532
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash(III)I

    move-result v5

    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v2

    .line 533
    .local v2, "offset":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 534
    .local v0, "hashArea":[I
    add-int/lit8 v5, v2, 0x3

    aget v1, v0, v5

    .line 536
    .local v1, "len":I
    if-ne v1, v7, :cond_29

    .line 537
    aget v5, v0, v2

    if-ne p1, v5, :cond_2b

    add-int/lit8 v5, v2, 0x1

    aget v5, v0, v5

    if-ne v5, p2, :cond_2b

    add-int/lit8 v5, v2, 0x2

    aget v5, v0, v5

    if-ne v5, p3, :cond_2b

    .line 538
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v2, 0x2

    aget-object v4, v4, v5

    .line 555
    :cond_28
    :goto_28
    return-object v4

    .line 540
    :cond_29
    if-eqz v1, :cond_28

    .line 544
    :cond_2b
    iget v5, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v6, v2, 0x3

    shl-int/lit8 v6, v6, 0x2

    add-int v3, v5, v6

    .line 546
    .local v3, "offset2":I
    add-int/lit8 v5, v3, 0x3

    aget v1, v0, v5

    .line 548
    if-ne v1, v7, :cond_50

    .line 549
    aget v4, v0, v3

    if-ne p1, v4, :cond_52

    add-int/lit8 v4, v3, 0x1

    aget v4, v0, v4

    if-ne v4, p2, :cond_52

    add-int/lit8 v4, v3, 0x2

    aget v4, v0, v4

    if-ne v4, p3, :cond_52

    .line 550
    iget-object v4, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v5, v3, 0x2

    aget-object v4, v4, v5

    goto :goto_28

    .line 552
    :cond_50
    if-eqz v1, :cond_28

    .line 555
    :cond_52
    invoke-direct {p0, v2, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(IIII)Ljava/lang/String;

    move-result-object v4

    goto :goto_28
.end method

.method public findName([II)Ljava/lang/String;
    .registers 14
    .param p1, "q"    # [I
    .param p2, "qlen"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 564
    const/4 v7, 0x4

    if-ge p2, v7, :cond_27

    .line 565
    const/4 v6, 0x3

    if-ne p2, v6, :cond_15

    .line 566
    aget v6, p1, v8

    aget v7, p1, v9

    aget v8, p1, v10

    invoke-virtual {p0, v6, v7, v8}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(III)Ljava/lang/String;

    move-result-object v6

    .line 601
    :cond_14
    :goto_14
    return-object v6

    .line 568
    :cond_15
    if-ne p2, v10, :cond_20

    .line 569
    aget v6, p1, v8

    aget v7, p1, v9

    invoke-virtual {p0, v6, v7}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(II)Ljava/lang/String;

    move-result-object v6

    goto :goto_14

    .line 571
    :cond_20
    aget v6, p1, v8

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_14

    .line 573
    :cond_27
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->calcHash([II)I

    move-result v0

    .line 574
    .local v0, "hash":I
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_calcOffset(I)I

    move-result v4

    .line 576
    .local v4, "offset":I
    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    .line 578
    .local v1, "hashArea":[I
    add-int/lit8 v7, v4, 0x3

    aget v2, v1, v7

    .line 580
    .local v2, "len":I
    aget v7, v1, v4

    if-ne v0, v7, :cond_4c

    if-ne v2, p2, :cond_4c

    .line 582
    add-int/lit8 v7, v4, 0x1

    aget v7, v1, v7

    invoke-direct {p0, p1, p2, v7}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v7

    if-eqz v7, :cond_4c

    .line 583
    iget-object v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v7, v4, 0x2

    aget-object v6, v6, v7

    goto :goto_14

    .line 586
    :cond_4c
    if-eqz v2, :cond_14

    .line 590
    iget v7, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    shr-int/lit8 v8, v4, 0x3

    shl-int/lit8 v8, v8, 0x2

    add-int v5, v7, v8

    .line 592
    .local v5, "offset2":I
    add-int/lit8 v7, v5, 0x3

    aget v3, v1, v7

    .line 593
    .local v3, "len2":I
    aget v7, v1, v5

    if-ne v0, v7, :cond_71

    if-ne v3, p2, :cond_71

    .line 594
    add-int/lit8 v7, v5, 0x1

    aget v7, v1, v7

    invoke-direct {p0, p1, p2, v7}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_verifyLongName([III)Z

    move-result v7

    if-eqz v7, :cond_71

    .line 595
    iget-object v6, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_names:[Ljava/lang/String;

    shr-int/lit8 v7, v5, 0x2

    aget-object v6, v6, v7

    goto :goto_14

    .line 598
    :cond_71
    if-eqz v2, :cond_14

    .line 601
    invoke-direct {p0, v4, v0, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_findSecondary(II[II)Ljava/lang/String;

    move-result-object v6

    goto :goto_14
.end method

.method public hashSeed()I
    .registers 2

    .prologue
    .line 382
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    return v0
.end method

.method public makeChild(I)Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .registers 8
    .param p1, "flags"    # I

    .prologue
    .line 307
    new-instance v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->INTERN_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v2

    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_seed:I

    sget-object v1, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->FAIL_ON_SYMBOL_HASH_OVERFLOW:Lcom/fasterxml/jackson/core/JsonFactory$Feature;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/JsonFactory$Feature;->enabledIn(I)Z

    move-result v4

    iget-object v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;-><init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;ZIZLcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V

    return-object v0
.end method

.method public maybeDirty()Z
    .registers 2

    .prologue
    .line 380
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public primaryCount()I
    .registers 5

    .prologue
    .line 391
    const/4 v0, 0x0

    .line 392
    .local v0, "count":I
    const/4 v2, 0x3

    .local v2, "offset":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    .local v1, "end":I
    :goto_4
    if-ge v2, v1, :cond_11

    .line 393
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v2

    if-eqz v3, :cond_e

    .line 394
    add-int/lit8 v0, v0, 0x1

    .line 392
    :cond_e
    add-int/lit8 v2, v2, 0x4

    goto :goto_4

    .line 397
    :cond_11
    return v0
.end method

.method public release()V
    .registers 3

    .prologue
    .line 324
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->maybeDirty()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 325
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_parent:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    new-instance v1, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    invoke-direct {v1, p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;-><init>(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;)V

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->mergeChild(Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;)V

    .line 329
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashShared:Z

    .line 331
    :cond_17
    return-void
.end method

.method public secondaryCount()I
    .registers 5

    .prologue
    .line 405
    const/4 v0, 0x0

    .line 406
    .local v0, "count":I
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_secondaryStart:I

    add-int/lit8 v2, v3, 0x3

    .line 407
    .local v2, "offset":I
    iget v1, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    .local v1, "end":I
    :goto_7
    if-ge v2, v1, :cond_14

    .line 408
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v2

    if-eqz v3, :cond_11

    .line 409
    add-int/lit8 v0, v0, 0x1

    .line 407
    :cond_11
    add-int/lit8 v2, v2, 0x4

    goto :goto_7

    .line 412
    :cond_14
    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 363
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    if-eqz v0, :cond_f

    .line 364
    iget-object v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tableInfo:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;

    iget v0, v0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer$TableInfo;->count:I

    .line 367
    :goto_e
    return v0

    :cond_f
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    goto :goto_e
.end method

.method public spilloverCount()I
    .registers 3

    .prologue
    .line 436
    iget v0, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverEnd:I

    invoke-direct {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_spilloverStart()I

    move-result v1

    sub-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public tertiaryCount()I
    .registers 5

    .prologue
    .line 420
    const/4 v0, 0x0

    .line 421
    .local v0, "count":I
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_tertiaryStart:I

    add-int/lit8 v2, v3, 0x3

    .line 422
    .local v2, "offset":I
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    add-int v1, v2, v3

    .local v1, "end":I
    :goto_9
    if-ge v2, v1, :cond_16

    .line 423
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v2

    if-eqz v3, :cond_13

    .line 424
    add-int/lit8 v0, v0, 0x1

    .line 422
    :cond_13
    add-int/lit8 v2, v2, 0x4

    goto :goto_9

    .line 427
    :cond_16
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 10

    .prologue
    .line 452
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->primaryCount()I

    move-result v0

    .line 453
    .local v0, "pri":I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->secondaryCount()I

    move-result v1

    .line 454
    .local v1, "sec":I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->tertiaryCount()I

    move-result v3

    .line 455
    .local v3, "tert":I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->spilloverCount()I

    move-result v2

    .line 456
    .local v2, "spill":I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->totalCount()I

    move-result v4

    .line 457
    .local v4, "total":I
    const-string v5, "[%s: size=%d, hashSize=%d, %d/%d/%d/%d pri/sec/ter/spill (=%s), total:%d]"

    const/16 v6, 0xa

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_count:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget v8, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/16 v7, 0x8

    add-int v8, v0, v1

    add-int/2addr v8, v3

    add-int/2addr v8, v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/16 v7, 0x9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public totalCount()I
    .registers 5

    .prologue
    .line 441
    const/4 v0, 0x0

    .line 442
    .local v0, "count":I
    const/4 v2, 0x3

    .local v2, "offset":I
    iget v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashSize:I

    shl-int/lit8 v1, v3, 0x3

    .local v1, "end":I
    :goto_6
    if-ge v2, v1, :cond_13

    .line 443
    iget-object v3, p0, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->_hashArea:[I

    aget v3, v3, v2

    if-eqz v3, :cond_10

    .line 444
    add-int/lit8 v0, v0, 0x1

    .line 442
    :cond_10
    add-int/lit8 v2, v2, 0x4

    goto :goto_6

    .line 447
    :cond_13
    return v0
.end method
