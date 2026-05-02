.class Ljavassist/bytecode/ByteVector;
.super Ljava/lang/Object;
.source "Bytecode.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private buffer:[B

.field private size:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0x40

    new-array v0, v0, [B

    iput-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ByteVector;->size:I

    .line 29
    return-void
.end method


# virtual methods
.method public add(I)V
    .registers 5
    .param p1, "code"    # I

    .prologue
    .line 60
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ByteVector;->addGap(I)V

    .line 61
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x1

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 62
    return-void
.end method

.method public add(II)V
    .registers 6
    .param p1, "b1"    # I
    .param p2, "b2"    # I

    .prologue
    .line 65
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ByteVector;->addGap(I)V

    .line 66
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x2

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 67
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 68
    return-void
.end method

.method public add(IIII)V
    .registers 8
    .param p1, "b1"    # I
    .param p2, "b2"    # I
    .param p3, "b3"    # I
    .param p4, "b4"    # I

    .prologue
    .line 71
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ByteVector;->addGap(I)V

    .line 72
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x4

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 73
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 74
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x2

    int-to-byte v2, p3

    aput-byte v2, v0, v1

    .line 75
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/lit8 v1, v1, -0x1

    int-to-byte v2, p4

    aput-byte v2, v0, v1

    .line 76
    return-void
.end method

.method public addGap(I)V
    .registers 7
    .param p1, "length"    # I

    .prologue
    const/4 v4, 0x0

    .line 79
    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/2addr v2, p1

    iget-object v3, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    array-length v3, v3

    if-le v2, v3, :cond_21

    .line 80
    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    shl-int/lit8 v1, v2, 0x1

    .line 81
    .local v1, "newSize":I
    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/2addr v2, p1

    if-ge v1, v2, :cond_16

    .line 82
    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int v1, v2, p1

    .line 84
    :cond_16
    new-array v0, v1, [B

    .line 85
    .local v0, "newBuf":[B
    iget-object v2, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v3, p0, Ljavassist/bytecode/ByteVector;->size:I

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    iput-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    .line 89
    .end local v0    # "newBuf":[B
    .end local v1    # "newSize":I
    :cond_21
    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    add-int/2addr v2, p1

    iput v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    .line 90
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 32
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ByteVector;

    .line 33
    .local v0, "bv":Ljavassist/bytecode/ByteVector;
    iget-object v1, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    invoke-virtual {v1}, [B->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    check-cast v1, [B

    iput-object v1, v0, Ljavassist/bytecode/ByteVector;->buffer:[B

    .line 34
    return-object v0
.end method

.method public final copy()[B
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 40
    iget v1, p0, Ljavassist/bytecode/ByteVector;->size:I

    new-array v0, v1, [B

    .line 41
    .local v0, "b":[B
    iget-object v1, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    iget v2, p0, Ljavassist/bytecode/ByteVector;->size:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    return-object v0
.end method

.method public final getSize()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Ljavassist/bytecode/ByteVector;->size:I

    return v0
.end method

.method public read(I)I
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 46
    if-ltz p1, :cond_6

    iget v0, p0, Ljavassist/bytecode/ByteVector;->size:I

    if-gt v0, p1, :cond_c

    .line 47
    :cond_6
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 49
    :cond_c
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public write(II)V
    .registers 5
    .param p1, "offset"    # I
    .param p2, "value"    # I

    .prologue
    .line 53
    if-ltz p1, :cond_6

    iget v0, p0, Ljavassist/bytecode/ByteVector;->size:I

    if-gt v0, p1, :cond_c

    .line 54
    :cond_6
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 56
    :cond_c
    iget-object v0, p0, Ljavassist/bytecode/ByteVector;->buffer:[B

    int-to-byte v1, p2

    aput-byte v1, v0, p1

    .line 57
    return-void
.end method
