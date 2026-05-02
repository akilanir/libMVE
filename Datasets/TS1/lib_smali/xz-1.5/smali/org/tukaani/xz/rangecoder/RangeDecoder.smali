.class public abstract Lorg/tukaani/xz/rangecoder/RangeDecoder;
.super Lorg/tukaani/xz/rangecoder/RangeCoder;


# instance fields
.field code:I

.field range:I


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/rangecoder/RangeCoder;-><init>()V

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    return-void
.end method


# virtual methods
.method public decodeBit([SI)I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/high16 v3, -0x80000000

    invoke-virtual {p0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->normalize()V

    aget-short v0, p1, p2

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    ushr-int/lit8 v1, v1, 0xb

    mul-int/2addr v1, v0

    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    xor-int/2addr v2, v3

    xor-int/2addr v3, v1

    if-ge v2, v3, :cond_1e

    iput v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    rsub-int v1, v0, 0x800

    ushr-int/lit8 v1, v1, 0x5

    add-int/2addr v0, v1

    int-to-short v0, v0

    aput-short v0, p1, p2

    const/4 v0, 0x0

    :goto_1d
    return v0

    :cond_1e
    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    sub-int/2addr v2, v1

    iput v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    sub-int v1, v2, v1

    iput v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    ushr-int/lit8 v1, v0, 0x5

    sub-int/2addr v0, v1

    int-to-short v0, v0

    aput-short v0, p1, p2

    const/4 v0, 0x1

    goto :goto_1d
.end method

.method public decodeBitTree([S)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    :cond_1
    shl-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    or-int/2addr v0, v1

    array-length v1, p1

    if-lt v0, v1, :cond_1

    array-length v1, p1

    sub-int/2addr v0, v1

    return v0
.end method

.method public decodeDirectBits(I)I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :cond_1
    invoke-virtual {p0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->normalize()V

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    ushr-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    sub-int/2addr v1, v2

    ushr-int/lit8 v1, v1, 0x1f

    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    iget v3, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->range:I

    add-int/lit8 v4, v1, -0x1

    and-int/2addr v3, v4

    sub-int/2addr v2, v3

    iput v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoder;->code:I

    shl-int/lit8 v0, v0, 0x1

    rsub-int/lit8 v1, v1, 0x1

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, -0x1

    if-nez p1, :cond_1

    return v0
.end method

.method public decodeReverseBitTree([S)I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    move v2, v1

    move v1, v0

    :goto_4
    invoke-virtual {p0, p1, v2}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v4

    shl-int/lit8 v2, v2, 0x1

    or-int v3, v2, v4

    add-int/lit8 v2, v1, 0x1

    shl-int v1, v4, v1

    or-int/2addr v0, v1

    array-length v1, p1

    if-lt v3, v1, :cond_15

    return v0

    :cond_15
    move v1, v2

    move v2, v3

    goto :goto_4
.end method

.method public abstract normalize()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
