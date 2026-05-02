.class Ljavassist/bytecode/StackMapTable$InsertLocal;
.super Ljavassist/bytecode/StackMapTable$SimpleCopy;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InsertLocal"
.end annotation


# instance fields
.field private varData:I

.field private varIndex:I

.field private varTag:I


# direct methods
.method public constructor <init>([BIII)V
    .registers 5
    .param p1, "data"    # [B
    .param p2, "varIndex"    # I
    .param p3, "varTag"    # I
    .param p4, "varData"    # I

    .prologue
    .line 501
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$SimpleCopy;-><init>([B)V

    .line 502
    iput p2, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varIndex:I

    .line 503
    iput p3, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varTag:I

    .line 504
    iput p4, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varData:I

    .line 505
    return-void
.end method


# virtual methods
.method public fullFrame(II[I[I[I[I)V
    .registers 21
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I

    .prologue
    .line 509
    move-object/from16 v0, p3

    array-length v12, v0

    .line 510
    .local v12, "len":I
    iget v1, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varIndex:I

    if-ge v12, v1, :cond_b

    .line 511
    invoke-super/range {p0 .. p6}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->fullFrame(II[I[I[I[I)V

    .line 536
    :goto_a
    return-void

    .line 515
    :cond_b
    iget v1, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varTag:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_15

    iget v1, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varTag:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_35

    :cond_15
    const/4 v13, 0x2

    .line 516
    .local v13, "typeSize":I
    :goto_16
    add-int v1, v12, v13

    new-array v4, v1, [I

    .line 517
    .local v4, "localTags2":[I
    add-int v1, v12, v13

    new-array v5, v1, [I

    .line 518
    .local v5, "localData2":[I
    iget v9, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varIndex:I

    .line 519
    .local v9, "index":I
    const/4 v10, 0x0

    .line 520
    .local v10, "j":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_22
    if-ge v8, v12, :cond_37

    .line 521
    if-ne v10, v9, :cond_27

    .line 522
    add-int/2addr v10, v13

    .line 524
    :cond_27
    aget v1, p3, v8

    aput v1, v4, v10

    .line 525
    add-int/lit8 v11, v10, 0x1

    .end local v10    # "j":I
    .local v11, "j":I
    aget v1, p4, v8

    aput v1, v5, v10

    .line 520
    add-int/lit8 v8, v8, 0x1

    move v10, v11

    .end local v11    # "j":I
    .restart local v10    # "j":I
    goto :goto_22

    .line 515
    .end local v4    # "localTags2":[I
    .end local v5    # "localData2":[I
    .end local v8    # "i":I
    .end local v9    # "index":I
    .end local v10    # "j":I
    .end local v13    # "typeSize":I
    :cond_35
    const/4 v13, 0x1

    goto :goto_16

    .line 528
    .restart local v4    # "localTags2":[I
    .restart local v5    # "localData2":[I
    .restart local v8    # "i":I
    .restart local v9    # "index":I
    .restart local v10    # "j":I
    .restart local v13    # "typeSize":I
    :cond_37
    iget v1, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varTag:I

    aput v1, v4, v9

    .line 529
    iget v1, p0, Ljavassist/bytecode/StackMapTable$InsertLocal;->varData:I

    aput v1, v5, v9

    .line 530
    const/4 v1, 0x1

    if-le v13, v1, :cond_4c

    .line 531
    add-int/lit8 v1, v9, 0x1

    const/4 v2, 0x0

    aput v2, v4, v1

    .line 532
    add-int/lit8 v1, v9, 0x1

    const/4 v2, 0x0

    aput v2, v5, v1

    :cond_4c
    move-object v1, p0

    move v2, p1

    move/from16 v3, p2

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    .line 535
    invoke-super/range {v1 .. v7}, Ljavassist/bytecode/StackMapTable$SimpleCopy;->fullFrame(II[I[I[I[I)V

    goto :goto_a
.end method
