.class Ljavassist/bytecode/CodeIterator$Table;
.super Ljavassist/bytecode/CodeIterator$Switcher;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Table"
.end annotation


# instance fields
.field high:I

.field low:I


# direct methods
.method constructor <init>(IIII[ILjavassist/bytecode/CodeIterator$Pointers;)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "defaultByte"    # I
    .param p3, "low"    # I
    .param p4, "high"    # I
    .param p5, "offsets"    # [I
    .param p6, "ptrs"    # Ljavassist/bytecode/CodeIterator$Pointers;

    .prologue
    .line 1555
    invoke-direct {p0, p1, p2, p5, p6}, Ljavassist/bytecode/CodeIterator$Switcher;-><init>(II[ILjavassist/bytecode/CodeIterator$Pointers;)V

    .line 1556
    iput p3, p0, Ljavassist/bytecode/CodeIterator$Table;->low:I

    .line 1557
    iput p4, p0, Ljavassist/bytecode/CodeIterator$Table;->high:I

    .line 1558
    return-void
.end method


# virtual methods
.method tableSize()I
    .registers 2

    .prologue
    .line 1573
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Table;->offsets:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x8

    return v0
.end method

.method write2(I[B)I
    .registers 7
    .param p1, "dest"    # I
    .param p2, "newcode"    # [B

    .prologue
    .line 1561
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Table;->low:I

    invoke-static {v2, p2, p1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1562
    iget v2, p0, Ljavassist/bytecode/CodeIterator$Table;->high:I

    add-int/lit8 v3, p1, 0x4

    invoke-static {v2, p2, v3}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1563
    iget-object v2, p0, Ljavassist/bytecode/CodeIterator$Table;->offsets:[I

    array-length v1, v2

    .line 1564
    .local v1, "n":I
    add-int/lit8 p1, p1, 0x8

    .line 1565
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    if-ge v0, v1, :cond_20

    .line 1566
    iget-object v2, p0, Ljavassist/bytecode/CodeIterator$Table;->offsets:[I

    aget v2, v2, v0

    invoke-static {v2, p2, p1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1567
    add-int/lit8 p1, p1, 0x4

    .line 1565
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1570
    :cond_20
    mul-int/lit8 v2, v1, 0x4

    add-int/lit8 v2, v2, 0x8

    return v2
.end method
