.class Ljavassist/bytecode/CodeIterator$Lookup;
.super Ljavassist/bytecode/CodeIterator$Switcher;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Lookup"
.end annotation


# instance fields
.field matches:[I


# direct methods
.method constructor <init>(II[I[ILjavassist/bytecode/CodeIterator$Pointers;)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "defaultByte"    # I
    .param p3, "matches"    # [I
    .param p4, "offsets"    # [I
    .param p5, "ptrs"    # Ljavassist/bytecode/CodeIterator$Pointers;

    .prologue
    .line 1580
    invoke-direct {p0, p1, p2, p4, p5}, Ljavassist/bytecode/CodeIterator$Switcher;-><init>(II[ILjavassist/bytecode/CodeIterator$Pointers;)V

    .line 1581
    iput-object p3, p0, Ljavassist/bytecode/CodeIterator$Lookup;->matches:[I

    .line 1582
    return-void
.end method


# virtual methods
.method tableSize()I
    .registers 2

    .prologue
    .line 1597
    iget-object v0, p0, Ljavassist/bytecode/CodeIterator$Lookup;->matches:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method write2(I[B)I
    .registers 7
    .param p1, "dest"    # I
    .param p2, "newcode"    # [B

    .prologue
    .line 1585
    iget-object v2, p0, Ljavassist/bytecode/CodeIterator$Lookup;->matches:[I

    array-length v1, v2

    .line 1586
    .local v1, "n":I
    invoke-static {v1, p2, p1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1587
    add-int/lit8 p1, p1, 0x4

    .line 1588
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_20

    .line 1589
    iget-object v2, p0, Ljavassist/bytecode/CodeIterator$Lookup;->matches:[I

    aget v2, v2, v0

    invoke-static {v2, p2, p1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1590
    iget-object v2, p0, Ljavassist/bytecode/CodeIterator$Lookup;->offsets:[I

    aget v2, v2, v0

    add-int/lit8 v3, p1, 0x4

    invoke-static {v2, p2, v3}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1591
    add-int/lit8 p1, p1, 0x8

    .line 1588
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 1594
    :cond_20
    mul-int/lit8 v2, v1, 0x8

    add-int/lit8 v2, v2, 0x4

    return v2
.end method
