.class public Ljavassist/bytecode/CodeAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "CodeAttribute.java"

# interfaces
.implements Ljavassist/bytecode/Opcode;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/CodeAttribute$LdcEntry;,
        Ljavassist/bytecode/CodeAttribute$RuntimeCopyException;
    }
.end annotation


# static fields
.field public static final tag:Ljava/lang/String; = "Code"


# instance fields
.field private attributes:Ljava/util/ArrayList;

.field private exceptions:Ljavassist/bytecode/ExceptionTable;

.field private maxLocals:I

.field private maxStack:I


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;II[BLjavassist/bytecode/ExceptionTable;)V
    .registers 7
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "stack"    # I
    .param p3, "locals"    # I
    .param p4, "code"    # [B
    .param p5, "etable"    # Ljavassist/bytecode/ExceptionTable;

    .prologue
    .line 62
    const-string v0, "Code"

    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 63
    iput p2, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    .line 64
    iput p3, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    .line 65
    iput-object p4, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    .line 66
    iput-object p5, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    .line 68
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 10
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "name_id"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 101
    const/4 v4, 0x0

    check-cast v4, [B

    invoke-direct {p0, p1, p2, v4}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;I[B)V

    .line 102
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    .line 104
    .local v0, "attr_len":I
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    .line 105
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    .line 107
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 108
    .local v1, "code_len":I
    new-array v4, v1, [B

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    .line 109
    iget-object v4, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    invoke-virtual {p3, v4}, Ljava/io/DataInputStream;->readFully([B)V

    .line 111
    new-instance v4, Ljavassist/bytecode/ExceptionTable;

    invoke-direct {v4, p1, p3}, Ljavassist/bytecode/ExceptionTable;-><init>(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)V

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    .line 113
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    .line 114
    invoke-virtual {p3}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 115
    .local v3, "num":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_36
    if-ge v2, v3, :cond_44

    .line 116
    iget-object v4, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {p1, p3}, Ljavassist/bytecode/AttributeInfo;->read(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 115
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 117
    :cond_44
    return-void
.end method

.method private constructor <init>(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;Ljava/util/Map;)V
    .registers 10
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "src"    # Ljavassist/bytecode/CodeAttribute;
    .param p3, "classnames"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 82
    const-string v4, "Code"

    invoke-direct {p0, p1, v4}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 84
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    .line 85
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    .line 86
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getExceptionTable()Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    invoke-virtual {v4, p1, p3}, Ljavassist/bytecode/ExceptionTable;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/ExceptionTable;

    move-result-object v4

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    .line 87
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    .line 88
    invoke-virtual {p2}, Ljavassist/bytecode/CodeAttribute;->getAttributes()Ljava/util/List;

    move-result-object v3

    .line 89
    .local v3, "src_attr":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 90
    .local v2, "num":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2b
    if-ge v1, v2, :cond_3f

    .line 91
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AttributeInfo;

    .line 92
    .local v0, "ai":Ljavassist/bytecode/AttributeInfo;
    iget-object v4, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p3}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 95
    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_3f
    iget-object v4, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    invoke-direct {p2, p1, p3, v4, p0}, Ljavassist/bytecode/CodeAttribute;->copyCode(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljavassist/bytecode/ExceptionTable;Ljavassist/bytecode/CodeAttribute;)[B

    move-result-object v4

    iput-object v4, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    .line 96
    return-void
.end method

.method private static copyCode([BIILjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/CodeAttribute$LdcEntry;
    .registers 22
    .param p0, "code"    # [B
    .param p1, "beginPos"    # I
    .param p2, "endPos"    # I
    .param p3, "srcCp"    # Ljavassist/bytecode/ConstPool;
    .param p4, "newcode"    # [B
    .param p5, "destCp"    # Ljavassist/bytecode/ConstPool;
    .param p6, "classnameMap"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 360
    const/4 v14, 0x0

    .line 362
    .local v14, "ldcEntry":Ljavassist/bytecode/CodeAttribute$LdcEntry;
    move/from16 v10, p1

    .local v10, "i":I
    :goto_3
    move/from16 v0, p2

    if-ge v10, v0, :cond_ab

    .line 363
    invoke-static {p0, v10}, Ljavassist/bytecode/CodeIterator;->nextOpcode([BI)I

    move-result v11

    .line 364
    .local v11, "i2":I
    aget-byte v9, p0, v10

    .line 365
    .local v9, "c":B
    aput-byte v9, p4, v10

    .line 366
    and-int/lit16 v3, v9, 0xff

    sparse-switch v3, :sswitch_data_ac

    .line 416
    :goto_14
    add-int/lit8 v10, v10, 0x1

    if-ge v10, v11, :cond_2b

    .line 417
    aget-byte v3, p0, v10

    aput-byte v3, p4, v10

    goto :goto_14

    .line 380
    :sswitch_1d
    add-int/lit8 v3, v10, 0x1

    move-object v4, p0

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-static/range {v3 .. v8}, Ljavassist/bytecode/CodeAttribute;->copyConstPoolInfo(I[BLjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 362
    :cond_2b
    :goto_2b
    move v10, v11

    goto :goto_3

    .line 384
    :sswitch_2d
    add-int/lit8 v3, v10, 0x1

    aget-byte v3, p0, v3

    and-int/lit16 v12, v3, 0xff

    .line 385
    .local v12, "index":I
    move-object/from16 v0, p3

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-virtual {v0, v12, v1, v2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v12

    .line 386
    const/16 v3, 0x100

    if-ge v12, v3, :cond_47

    .line 387
    add-int/lit8 v3, v10, 0x1

    int-to-byte v4, v12

    aput-byte v4, p4, v3

    goto :goto_2b

    .line 389
    :cond_47
    const/4 v3, 0x0

    aput-byte v3, p4, v10

    .line 390
    add-int/lit8 v3, v10, 0x1

    const/4 v4, 0x0

    aput-byte v4, p4, v3

    .line 391
    new-instance v13, Ljavassist/bytecode/CodeAttribute$LdcEntry;

    invoke-direct {v13}, Ljavassist/bytecode/CodeAttribute$LdcEntry;-><init>()V

    .line 392
    .local v13, "ldc":Ljavassist/bytecode/CodeAttribute$LdcEntry;
    iput v10, v13, Ljavassist/bytecode/CodeAttribute$LdcEntry;->where:I

    .line 393
    iput v12, v13, Ljavassist/bytecode/CodeAttribute$LdcEntry;->index:I

    .line 394
    iput-object v14, v13, Ljavassist/bytecode/CodeAttribute$LdcEntry;->next:Ljavassist/bytecode/CodeAttribute$LdcEntry;

    .line 395
    move-object v14, v13

    .line 397
    goto :goto_2b

    .line 399
    .end local v12    # "index":I
    .end local v13    # "ldc":Ljavassist/bytecode/CodeAttribute$LdcEntry;
    :sswitch_5c
    add-int/lit8 v3, v10, 0x1

    move-object v4, p0

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-static/range {v3 .. v8}, Ljavassist/bytecode/CodeAttribute;->copyConstPoolInfo(I[BLjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 401
    add-int/lit8 v3, v10, 0x3

    add-int/lit8 v4, v10, 0x3

    aget-byte v4, p0, v4

    aput-byte v4, p4, v3

    .line 402
    add-int/lit8 v3, v10, 0x4

    add-int/lit8 v4, v10, 0x4

    aget-byte v4, p0, v4

    aput-byte v4, p4, v3

    goto :goto_2b

    .line 405
    :sswitch_7b
    add-int/lit8 v3, v10, 0x1

    move-object v4, p0

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-static/range {v3 .. v8}, Ljavassist/bytecode/CodeAttribute;->copyConstPoolInfo(I[BLjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 407
    add-int/lit8 v3, v10, 0x3

    const/4 v4, 0x0

    aput-byte v4, p4, v3

    .line 408
    add-int/lit8 v3, v10, 0x4

    const/4 v4, 0x0

    aput-byte v4, p4, v3

    goto :goto_2b

    .line 411
    :sswitch_94
    add-int/lit8 v3, v10, 0x1

    move-object v4, p0

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-static/range {v3 .. v8}, Ljavassist/bytecode/CodeAttribute;->copyConstPoolInfo(I[BLjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 413
    add-int/lit8 v3, v10, 0x3

    add-int/lit8 v4, v10, 0x3

    aget-byte v4, p0, v4

    aput-byte v4, p4, v3

    goto :goto_2b

    .line 423
    .end local v9    # "c":B
    .end local v11    # "i2":I
    :cond_ab
    return-object v14

    .line 366
    :sswitch_data_ac
    .sparse-switch
        0x12 -> :sswitch_2d
        0x13 -> :sswitch_1d
        0x14 -> :sswitch_1d
        0xb2 -> :sswitch_1d
        0xb3 -> :sswitch_1d
        0xb4 -> :sswitch_1d
        0xb5 -> :sswitch_1d
        0xb6 -> :sswitch_1d
        0xb7 -> :sswitch_1d
        0xb8 -> :sswitch_1d
        0xb9 -> :sswitch_5c
        0xba -> :sswitch_7b
        0xbb -> :sswitch_1d
        0xbd -> :sswitch_1d
        0xc0 -> :sswitch_1d
        0xc1 -> :sswitch_1d
        0xc5 -> :sswitch_94
    .end sparse-switch
.end method

.method private copyCode(Ljavassist/bytecode/ConstPool;Ljava/util/Map;Ljavassist/bytecode/ExceptionTable;Ljavassist/bytecode/CodeAttribute;)[B
    .registers 13
    .param p1, "destCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;
    .param p3, "etable"    # Ljavassist/bytecode/ExceptionTable;
    .param p4, "destCa"    # Ljavassist/bytecode/CodeAttribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 346
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->getCodeLength()I

    move-result v2

    .line 347
    .local v2, "len":I
    new-array v4, v2, [B

    .line 348
    .local v4, "newCode":[B
    iput-object v4, p4, Ljavassist/bytecode/CodeAttribute;->info:[B

    .line 349
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Ljavassist/bytecode/CodeAttribute;->copyCode([BIILjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/CodeAttribute$LdcEntry;

    move-result-object v7

    .line 351
    .local v7, "ldc":Ljavassist/bytecode/CodeAttribute$LdcEntry;
    invoke-static {v4, v7, p3, p4}, Ljavassist/bytecode/CodeAttribute$LdcEntry;->doit([BLjavassist/bytecode/CodeAttribute$LdcEntry;Ljavassist/bytecode/ExceptionTable;Ljavassist/bytecode/CodeAttribute;)[B

    move-result-object v0

    return-object v0
.end method

.method private static copyConstPoolInfo(I[BLjavassist/bytecode/ConstPool;[BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V
    .registers 9
    .param p0, "i"    # I
    .param p1, "code"    # [B
    .param p2, "srcCp"    # Ljavassist/bytecode/ConstPool;
    .param p3, "newcode"    # [B
    .param p4, "destCp"    # Ljavassist/bytecode/ConstPool;
    .param p5, "classnameMap"    # Ljava/util/Map;

    .prologue
    .line 429
    aget-byte v1, p1, p0

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v2, p0, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    or-int v0, v1, v2

    .line 430
    .local v0, "index":I
    invoke-virtual {p2, v0, p4, p5}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    .line 431
    shr-int/lit8 v1, v0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p3, p0

    .line 432
    add-int/lit8 v1, p0, 0x1

    int-to-byte v2, v0

    aput-byte v2, p3, v1

    .line 433
    return-void
.end method

.method private static shiftIndex(Ljavassist/bytecode/CodeIterator;II)V
    .registers 15
    .param p0, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p1, "lessThan"    # I
    .param p2, "delta"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/16 v4, 0x84

    const/16 v11, 0x3b

    const/16 v10, 0x36

    const/16 v5, 0x1a

    const/16 v6, 0x15

    .line 496
    invoke-virtual {p0}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v1

    .line 497
    .local v1, "index":I
    invoke-virtual {p0, v1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v2

    .line 498
    .local v2, "opcode":I
    if-ge v2, v6, :cond_15

    .line 547
    :cond_14
    :goto_14
    return-void

    .line 500
    :cond_15
    const/16 v0, 0x4f

    if-ge v2, v0, :cond_3b

    .line 501
    if-ge v2, v5, :cond_1f

    .line 503
    invoke-static {p0, v1, v2, p1, p2}, Ljavassist/bytecode/CodeAttribute;->shiftIndex8(Ljavassist/bytecode/CodeIterator;IIII)V

    goto :goto_14

    .line 505
    :cond_1f
    const/16 v0, 0x2e

    if-ge v2, v0, :cond_2a

    move-object v0, p0

    move v3, p1

    move v4, p2

    .line 507
    invoke-static/range {v0 .. v6}, Ljavassist/bytecode/CodeAttribute;->shiftIndex0(Ljavassist/bytecode/CodeIterator;IIIIII)V

    goto :goto_14

    .line 509
    :cond_2a
    if-lt v2, v10, :cond_14

    .line 511
    if-ge v2, v11, :cond_32

    .line 513
    invoke-static {p0, v1, v2, p1, p2}, Ljavassist/bytecode/CodeAttribute;->shiftIndex8(Ljavassist/bytecode/CodeIterator;IIII)V

    goto :goto_14

    :cond_32
    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, v11

    move v6, v10

    .line 517
    invoke-static/range {v0 .. v6}, Ljavassist/bytecode/CodeAttribute;->shiftIndex0(Ljavassist/bytecode/CodeIterator;IIIIII)V

    goto :goto_14

    .line 520
    :cond_3b
    if-ne v2, v4, :cond_73

    .line 521
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v9

    .line 522
    .local v9, "var":I
    if-lt v9, p1, :cond_14

    .line 525
    add-int/2addr v9, p2

    .line 526
    const/16 v0, 0x100

    if-ge v9, v0, :cond_50

    .line 527
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v9, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    goto :goto_14

    .line 529
    :cond_50
    add-int/lit8 v0, v1, 0x2

    invoke-virtual {p0, v0}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v0

    int-to-byte v7, v0

    .line 530
    .local v7, "plus":I
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Ljavassist/bytecode/CodeIterator;->insertExGap(I)I

    move-result v8

    .line 531
    .local v8, "pos":I
    const/16 v0, 0xc4

    add-int/lit8 v3, v8, -0x3

    invoke-virtual {p0, v0, v3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 532
    add-int/lit8 v0, v8, -0x2

    invoke-virtual {p0, v4, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 533
    add-int/lit8 v0, v8, -0x1

    invoke-virtual {p0, v9, v0}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 534
    add-int/lit8 v0, v8, 0x1

    invoke-virtual {p0, v7, v0}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    goto :goto_14

    .line 537
    .end local v7    # "plus":I
    .end local v8    # "pos":I
    .end local v9    # "var":I
    :cond_73
    const/16 v0, 0xa9

    if-ne v2, v0, :cond_7b

    .line 538
    invoke-static {p0, v1, v2, p1, p2}, Ljavassist/bytecode/CodeAttribute;->shiftIndex8(Ljavassist/bytecode/CodeIterator;IIII)V

    goto :goto_14

    .line 539
    :cond_7b
    const/16 v0, 0xc4

    if-ne v2, v0, :cond_14

    .line 540
    add-int/lit8 v0, v1, 0x2

    invoke-virtual {p0, v0}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v9

    .line 541
    .restart local v9    # "var":I
    if-lt v9, p1, :cond_14

    .line 544
    add-int/2addr v9, p2

    .line 545
    add-int/lit8 v0, v1, 0x2

    invoke-virtual {p0, v9, v0}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    goto :goto_14
.end method

.method private static shiftIndex0(Ljavassist/bytecode/CodeIterator;IIIIII)V
    .registers 11
    .param p0, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p1, "index"    # I
    .param p2, "opcode"    # I
    .param p3, "lessThan"    # I
    .param p4, "delta"    # I
    .param p5, "opcode_i_0"    # I
    .param p6, "opcode_i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 573
    sub-int v2, p2, p5

    rem-int/lit8 v1, v2, 0x4

    .line 574
    .local v1, "var":I
    if-ge v1, p3, :cond_7

    .line 594
    :goto_6
    return-void

    .line 577
    :cond_7
    add-int/2addr v1, p4

    .line 578
    const/4 v2, 0x4

    if-ge v1, v2, :cond_11

    .line 579
    add-int v2, p2, p4

    invoke-virtual {p0, v2, p1}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    goto :goto_6

    .line 581
    :cond_11
    sub-int v2, p2, p5

    div-int/lit8 v2, v2, 0x4

    add-int p2, v2, p6

    .line 582
    const/16 v2, 0x100

    if-ge v1, v2, :cond_29

    .line 583
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljavassist/bytecode/CodeIterator;->insertExGap(I)I

    move-result v0

    .line 584
    .local v0, "pos":I
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, p2, v2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 585
    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    goto :goto_6

    .line 588
    .end local v0    # "pos":I
    :cond_29
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Ljavassist/bytecode/CodeIterator;->insertExGap(I)I

    move-result v0

    .line 589
    .restart local v0    # "pos":I
    const/16 v2, 0xc4

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {p0, v2, v3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 590
    invoke-virtual {p0, p2, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 591
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v1, v2}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    goto :goto_6
.end method

.method private static shiftIndex8(Ljavassist/bytecode/CodeIterator;IIII)V
    .registers 9
    .param p0, "ci"    # Ljavassist/bytecode/CodeIterator;
    .param p1, "index"    # I
    .param p2, "opcode"    # I
    .param p3, "lessThan"    # I
    .param p4, "delta"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 553
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    .line 554
    .local v1, "var":I
    if-ge v1, p3, :cond_9

    .line 566
    :goto_8
    return-void

    .line 557
    :cond_9
    add-int/2addr v1, p4

    .line 558
    const/16 v2, 0x100

    if-ge v1, v2, :cond_14

    .line 559
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v1, v2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    goto :goto_8

    .line 561
    :cond_14
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljavassist/bytecode/CodeIterator;->insertExGap(I)I

    move-result v0

    .line 562
    .local v0, "pos":I
    const/16 v2, 0xc4

    add-int/lit8 v3, v0, -0x2

    invoke-virtual {p0, v2, v3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 563
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, p2, v2}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 564
    invoke-virtual {p0, v1, v0}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    goto :goto_8
.end method


# virtual methods
.method public computeMaxStack()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 240
    new-instance v0, Ljavassist/bytecode/CodeAnalyzer;

    invoke-direct {v0, p0}, Ljavassist/bytecode/CodeAnalyzer;-><init>(Ljavassist/bytecode/CodeAttribute;)V

    invoke-virtual {v0}, Ljavassist/bytecode/CodeAnalyzer;->computeMaxStack()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    .line 241
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    return v0
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 6
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/CodeAttribute$RuntimeCopyException;
        }
    .end annotation

    .prologue
    .line 137
    :try_start_0
    new-instance v1, Ljavassist/bytecode/CodeAttribute;

    invoke-direct {v1, p1, p0, p2}, Ljavassist/bytecode/CodeAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeAttribute;Ljava/util/Map;)V
    :try_end_5
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_5} :catch_6

    return-object v1

    .line 139
    :catch_6
    move-exception v0

    .line 140
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v1, Ljavassist/bytecode/CodeAttribute$RuntimeCopyException;

    const-string v2, "bad bytecode. fatal?"

    invoke-direct {v1, v2}, Ljavassist/bytecode/CodeAttribute$RuntimeCopyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get()[B
    .registers 3

    .prologue
    .line 185
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "CodeAttribute.get()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 307
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->lookup(Ljava/util/ArrayList;Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Ljava/util/List;
    .registers 2

    .prologue
    .line 297
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCode()[B
    .registers 2

    .prologue
    .line 269
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    return-object v0
.end method

.method public getCodeLength()I
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    array-length v0, v0

    return v0
.end method

.method public getDeclaringClass()Ljava/lang/String;
    .registers 3

    .prologue
    .line 214
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 215
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v0}, Ljavassist/bytecode/ConstPool;->getClassName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getExceptionTable()Ljavassist/bytecode/ExceptionTable;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    return-object v0
.end method

.method public getMaxLocals()I
    .registers 2

    .prologue
    .line 248
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    return v0
.end method

.method public getMaxStack()I
    .registers 2

    .prologue
    .line 222
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    return v0
.end method

.method getRefClasses(Ljava/util/Map;)V
    .registers 3
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 206
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->getRefClasses(Ljava/util/List;Ljava/util/Map;)V

    .line 207
    return-void
.end method

.method public insertLocalVar(II)V
    .registers 5
    .param p1, "where"    # I
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 481
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v0

    .line 482
    .local v0, "ci":Ljavassist/bytecode/CodeIterator;
    :goto_4
    invoke-virtual {v0}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 483
    invoke-static {v0, p1, p2}, Ljavassist/bytecode/CodeAttribute;->shiftIndex(Ljavassist/bytecode/CodeIterator;II)V

    goto :goto_4

    .line 485
    :cond_e
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0, v1}, Ljavassist/bytecode/CodeAttribute;->setMaxLocals(I)V

    .line 486
    return-void
.end method

.method public iterator()Ljavassist/bytecode/CodeIterator;
    .registers 2

    .prologue
    .line 281
    new-instance v0, Ljavassist/bytecode/CodeIterator;

    invoke-direct {v0, p0}, Ljavassist/bytecode/CodeIterator;-><init>(Ljavassist/bytecode/CodeAttribute;)V

    return-object v0
.end method

.method public length()I
    .registers 3

    .prologue
    .line 163
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x12

    iget-object v1, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    invoke-virtual {v1}, Ljavassist/bytecode/ExceptionTable;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    iget-object v1, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v1}, Ljavassist/bytecode/AttributeInfo;->getLength(Ljava/util/ArrayList;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v0, p1, p2}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method renameClass(Ljava/util/Map;)V
    .registers 3
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 202
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/util/Map;)V

    .line 203
    return-void
.end method

.method public set([B)V
    .registers 4
    .param p1, "newinfo"    # [B

    .prologue
    .line 194
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "CodeAttribute.set()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAttribute(Ljavassist/bytecode/StackMap;)V
    .registers 4
    .param p1, "sm"    # Ljavassist/bytecode/StackMap;

    .prologue
    .line 334
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    const-string v1, "StackMap"

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 335
    if-eqz p1, :cond_e

    .line 336
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 337
    :cond_e
    return-void
.end method

.method public setAttribute(Ljavassist/bytecode/StackMapTable;)V
    .registers 4
    .param p1, "smt"    # Ljavassist/bytecode/StackMapTable;

    .prologue
    .line 319
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    const-string v1, "StackMapTable"

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 320
    if-eqz p1, :cond_e

    .line 321
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    :cond_e
    return-void
.end method

.method setCode([B)V
    .registers 2
    .param p1, "newinfo"    # [B

    .prologue
    .line 275
    invoke-super {p0, p1}, Ljavassist/bytecode/AttributeInfo;->set([B)V

    return-void
.end method

.method public setMaxLocals(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 255
    iput p1, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    .line 256
    return-void
.end method

.method public setMaxStack(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 229
    iput p1, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    .line 230
    return-void
.end method

.method write(Ljava/io/DataOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->name:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 169
    invoke-virtual {p0}, Ljavassist/bytecode/CodeAttribute;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x6

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 170
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->maxStack:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 171
    iget v0, p0, Ljavassist/bytecode/CodeAttribute;->maxLocals:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 172
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 173
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->info:[B

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 174
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->exceptions:Ljavassist/bytecode/ExceptionTable;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ExceptionTable;->write(Ljava/io/DataOutputStream;)V

    .line 175
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 176
    iget-object v0, p0, Ljavassist/bytecode/CodeAttribute;->attributes:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->writeAll(Ljava/util/ArrayList;Ljava/io/DataOutputStream;)V

    .line 177
    return-void
.end method
