.class abstract Ljavassist/bytecode/CodeIterator$Switcher;
.super Ljavassist/bytecode/CodeIterator$Branch;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Switcher"
.end annotation


# instance fields
.field defaultByte:I

.field gap:I

.field offsets:[I

.field pointers:Ljavassist/bytecode/CodeIterator$Pointers;


# direct methods
.method constructor <init>(II[ILjavassist/bytecode/CodeIterator$Pointers;)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "defaultByte"    # I
    .param p3, "offsets"    # [I
    .param p4, "ptrs"    # Ljavassist/bytecode/CodeIterator$Pointers;

    .prologue
    .line 1476
    invoke-direct {p0, p1}, Ljavassist/bytecode/CodeIterator$Branch;-><init>(I)V

    .line 1477
    and-int/lit8 v0, p1, 0x3

    rsub-int/lit8 v0, v0, 0x3

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    .line 1478
    iput p2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    .line 1479
    iput-object p3, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    .line 1480
    iput-object p4, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pointers:Ljavassist/bytecode/CodeIterator$Pointers;

    .line 1481
    return-void
.end method


# virtual methods
.method adjustOffsets(II)V
    .registers 6
    .param p1, "size"    # I
    .param p2, "nops"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 1541
    iget-object v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pointers:Ljavassist/bytecode/CodeIterator$Pointers;

    iget v2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pos:I

    add-int/2addr v2, p1

    invoke-virtual {v1, v2, p2}, Ljavassist/bytecode/CodeIterator$Pointers;->shiftForSwitch(II)V

    .line 1542
    iget v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    if-ne v1, p1, :cond_11

    .line 1543
    iget v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    sub-int/2addr v1, p2

    iput v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    .line 1545
    :cond_11
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    iget-object v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    array-length v1, v1

    if-ge v0, v1, :cond_27

    .line 1546
    iget-object v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_24

    .line 1547
    iget-object v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    aget v2, v1, v0

    sub-int/2addr v2, p2

    aput v2, v1, v0

    .line 1545
    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1548
    :cond_27
    return-void
.end method

.method deltaSize()I
    .registers 3

    .prologue
    .line 1505
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    iget v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->orgPos:I

    and-int/lit8 v1, v1, 0x3

    rsub-int/lit8 v1, v1, 0x3

    sub-int/2addr v0, v1

    return v0
.end method

.method gapChanged()I
    .registers 4

    .prologue
    .line 1494
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pos:I

    and-int/lit8 v2, v2, 0x3

    rsub-int/lit8 v1, v2, 0x3

    .line 1495
    .local v1, "newGap":I
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    if-le v1, v2, :cond_11

    .line 1496
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    sub-int v0, v1, v2

    .line 1497
    .local v0, "diff":I
    iput v1, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    .line 1501
    .end local v0    # "diff":I
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method shift(IIZ)V
    .registers 9
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z

    .prologue
    .line 1484
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pos:I

    .line 1485
    .local v2, "p":I
    iget v3, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    invoke-static {v2, v3, p1, p2, p3}, Ljavassist/bytecode/CodeIterator$Switcher;->shiftOffset(IIIIZ)I

    move-result v3

    iput v3, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    .line 1486
    iget-object v3, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    array-length v1, v3

    .line 1487
    .local v1, "num":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-ge v0, v1, :cond_1f

    .line 1488
    iget-object v3, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    iget-object v4, p0, Ljavassist/bytecode/CodeIterator$Switcher;->offsets:[I

    aget v4, v4, v0

    invoke-static {v2, v4, p1, p2, p3}, Ljavassist/bytecode/CodeIterator$Switcher;->shiftOffset(IIIIZ)I

    move-result v4

    aput v4, v3, v0

    .line 1487
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 1490
    :cond_1f
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/CodeIterator$Branch;->shift(IIZ)V

    .line 1491
    return-void
.end method

.method abstract tableSize()I
.end method

.method write(I[BI[B)I
    .registers 15
    .param p1, "src"    # I
    .param p2, "code"    # [B
    .param p3, "dest"    # I
    .param p4, "newcode"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1509
    iget v7, p0, Ljavassist/bytecode/CodeIterator$Switcher;->pos:I

    and-int/lit8 v7, v7, 0x3

    rsub-int/lit8 v4, v7, 0x3

    .line 1510
    .local v4, "padding":I
    iget v7, p0, Ljavassist/bytecode/CodeIterator$Switcher;->gap:I

    sub-int v2, v7, v4

    .line 1511
    .local v2, "nops":I
    iget v7, p0, Ljavassist/bytecode/CodeIterator$Switcher;->orgPos:I

    and-int/lit8 v7, v7, 0x3

    rsub-int/lit8 v7, v7, 0x3

    add-int/lit8 v7, v7, 0x5

    invoke-virtual {p0}, Ljavassist/bytecode/CodeIterator$Switcher;->tableSize()I

    move-result v8

    add-int v0, v7, v8

    .line 1512
    .local v0, "bytecodeSize":I
    if-lez v2, :cond_1e

    .line 1513
    invoke-virtual {p0, v0, v2}, Ljavassist/bytecode/CodeIterator$Switcher;->adjustOffsets(II)V

    .line 1515
    :cond_1e
    add-int/lit8 v1, p3, 0x1

    .end local p3    # "dest":I
    .local v1, "dest":I
    aget-byte v7, p2, p1

    aput-byte v7, p4, p3

    move v5, v4

    .line 1516
    .end local v4    # "padding":I
    .local v5, "padding":I
    :goto_25
    add-int/lit8 v4, v5, -0x1

    .end local v5    # "padding":I
    .restart local v4    # "padding":I
    if-lez v5, :cond_30

    .line 1517
    add-int/lit8 p3, v1, 0x1

    .end local v1    # "dest":I
    .restart local p3    # "dest":I
    aput-byte v9, p4, v1

    move v5, v4

    .end local v4    # "padding":I
    .restart local v5    # "padding":I
    move v1, p3

    .end local p3    # "dest":I
    .restart local v1    # "dest":I
    goto :goto_25

    .line 1519
    .end local v5    # "padding":I
    .restart local v4    # "padding":I
    :cond_30
    iget v7, p0, Ljavassist/bytecode/CodeIterator$Switcher;->defaultByte:I

    invoke-static {v7, p4, v1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1520
    add-int/lit8 v7, v1, 0x4

    invoke-virtual {p0, v7, p4}, Ljavassist/bytecode/CodeIterator$Switcher;->write2(I[B)I

    move-result v6

    .line 1521
    .local v6, "size":I
    add-int/lit8 v7, v6, 0x4

    add-int p3, v1, v7

    .end local v1    # "dest":I
    .restart local p3    # "dest":I
    move v3, v2

    .end local v2    # "nops":I
    .local v3, "nops":I
    move v1, p3

    .line 1522
    .end local p3    # "dest":I
    .restart local v1    # "dest":I
    :goto_41
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "nops":I
    .restart local v2    # "nops":I
    if-lez v3, :cond_4c

    .line 1523
    add-int/lit8 p3, v1, 0x1

    .end local v1    # "dest":I
    .restart local p3    # "dest":I
    aput-byte v9, p4, v1

    move v3, v2

    .end local v2    # "nops":I
    .restart local v3    # "nops":I
    move v1, p3

    .end local p3    # "dest":I
    .restart local v1    # "dest":I
    goto :goto_41

    .line 1525
    .end local v3    # "nops":I
    .restart local v2    # "nops":I
    :cond_4c
    iget v7, p0, Ljavassist/bytecode/CodeIterator$Switcher;->orgPos:I

    and-int/lit8 v7, v7, 0x3

    rsub-int/lit8 v7, v7, 0x3

    add-int/lit8 v7, v7, 0x5

    add-int/2addr v7, v6

    return v7
.end method

.method abstract write2(I[B)I
.end method
