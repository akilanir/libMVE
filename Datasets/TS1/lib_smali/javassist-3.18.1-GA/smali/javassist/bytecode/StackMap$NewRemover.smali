.class Ljavassist/bytecode/StackMap$NewRemover;
.super Ljavassist/bytecode/StackMap$SimpleCopy;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NewRemover"
.end annotation


# instance fields
.field posOfNew:I


# direct methods
.method constructor <init>(Ljavassist/bytecode/StackMap;I)V
    .registers 3
    .param p1, "map"    # Ljavassist/bytecode/StackMap;
    .param p2, "where"    # I

    .prologue
    .line 450
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMap$SimpleCopy;-><init>(Ljavassist/bytecode/StackMap;)V

    .line 451
    iput p2, p0, Ljavassist/bytecode/StackMap$NewRemover;->posOfNew:I

    .line 452
    return-void
.end method

.method private stackTypeInfoArray(III)I
    .registers 14
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    const/16 v9, 0x8

    const/4 v8, 0x7

    .line 459
    move v4, p1

    .line 460
    .local v4, "p":I
    const/4 v1, 0x0

    .line 461
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_6
    if-ge v2, p3, :cond_29

    .line 462
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->info:[B

    aget-byte v5, v6, v4

    .line 463
    .local v5, "tag":B
    if-ne v5, v8, :cond_13

    .line 464
    add-int/lit8 v4, v4, 0x3

    .line 461
    :goto_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 465
    :cond_13
    if-ne v5, v9, :cond_26

    .line 466
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->info:[B

    add-int/lit8 v7, v4, 0x1

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 467
    .local v3, "offsetOfNew":I
    iget v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->posOfNew:I

    if-ne v3, v6, :cond_23

    .line 468
    add-int/lit8 v1, v1, 0x1

    .line 470
    :cond_23
    add-int/lit8 v4, v4, 0x3

    .line 471
    goto :goto_10

    .line 473
    .end local v3    # "offsetOfNew":I
    :cond_26
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 476
    .end local v5    # "tag":B
    :cond_29
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->writer:Ljavassist/bytecode/StackMap$Writer;

    sub-int v7, p3, v1

    invoke-virtual {v6, v7}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 477
    const/4 v2, 0x0

    :goto_31
    if-ge v2, p3, :cond_63

    .line 478
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->info:[B

    aget-byte v5, v6, p1

    .line 479
    .restart local v5    # "tag":B
    if-ne v5, v8, :cond_49

    .line 480
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->info:[B

    add-int/lit8 v7, p1, 0x1

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    .line 481
    .local v0, "clazz":I
    invoke-virtual {p0, p1, v0}, Ljavassist/bytecode/StackMap$NewRemover;->objectVariable(II)V

    .line 482
    add-int/lit8 p1, p1, 0x3

    .line 477
    .end local v0    # "clazz":I
    :goto_46
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 484
    :cond_49
    if-ne v5, v9, :cond_5d

    .line 485
    iget-object v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->info:[B

    add-int/lit8 v7, p1, 0x1

    invoke-static {v6, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 486
    .restart local v3    # "offsetOfNew":I
    iget v6, p0, Ljavassist/bytecode/StackMap$NewRemover;->posOfNew:I

    if-eq v3, v6, :cond_5a

    .line 487
    invoke-virtual {p0, p1, v3}, Ljavassist/bytecode/StackMap$NewRemover;->uninitialized(II)V

    .line 489
    :cond_5a
    add-int/lit8 p1, p1, 0x3

    .line 490
    goto :goto_46

    .line 492
    .end local v3    # "offsetOfNew":I
    :cond_5d
    invoke-virtual {p0, p1, v5}, Ljavassist/bytecode/StackMap$NewRemover;->typeInfo(IB)V

    .line 493
    add-int/lit8 p1, p1, 0x1

    goto :goto_46

    .line 497
    .end local v5    # "tag":B
    :cond_63
    return p1
.end method


# virtual methods
.method public stack(III)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I

    .prologue
    .line 455
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/StackMap$NewRemover;->stackTypeInfoArray(III)I

    move-result v0

    return v0
.end method
