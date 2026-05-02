.class public Lorg/apache/commons/compress/utils/BitInputStream;
.super Ljava/lang/Object;
.source "BitInputStream.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final MASKS:[J

.field private static final MAXIMUM_CACHE_SIZE:I = 0x3f


# instance fields
.field private bitsCached:J

.field private bitsCachedSize:I

.field private final byteOrder:Ljava/nio/ByteOrder;

.field private final in:Ljava/io/InputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 33
    const/16 v1, 0x40

    new-array v1, v1, [J

    sput-object v1, Lorg/apache/commons/compress/utils/BitInputStream;->MASKS:[J

    .line 36
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_7
    const/16 v1, 0x3f

    if-gt v0, v1, :cond_1d

    .line 37
    sget-object v1, Lorg/apache/commons/compress/utils/BitInputStream;->MASKS:[J

    sget-object v2, Lorg/apache/commons/compress/utils/BitInputStream;->MASKS:[J

    add-int/lit8 v3, v0, -0x1

    aget-wide v2, v2, v3

    const/4 v4, 0x1

    shl-long/2addr v2, v4

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    aput-wide v2, v1, v0

    .line 36
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 39
    :cond_1d
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "byteOrder"    # Ljava/nio/ByteOrder;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    .line 44
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    .line 53
    iput-object p1, p0, Lorg/apache/commons/compress/utils/BitInputStream;->in:Ljava/io/InputStream;

    .line 54
    iput-object p2, p0, Lorg/apache/commons/compress/utils/BitInputStream;->byteOrder:Ljava/nio/ByteOrder;

    .line 55
    return-void
.end method


# virtual methods
.method public clearBitCache()V
    .registers 3

    .prologue
    .line 66
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    .line 67
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    .line 68
    return-void
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/commons/compress/utils/BitInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 59
    return-void
.end method

.method public readBits(I)J
    .registers 10
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    if-ltz p1, :cond_6

    const/16 v4, 0x3f

    if-le p1, v4, :cond_23

    .line 82
    :cond_6
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "count must not be negative or greater than 63"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 89
    .local v2, "nextByte":J
    :cond_e
    iget-object v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->byteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_35

    .line 90
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    iget v6, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    shl-long v6, v2, v6

    or-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    .line 95
    :goto_1d
    iget v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    add-int/lit8 v4, v4, 0x8

    iput v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    .line 84
    .end local v2    # "nextByte":J
    :cond_23
    iget v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    if-ge v4, p1, :cond_42

    .line 85
    iget-object v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v4

    int-to-long v2, v4

    .line 86
    .restart local v2    # "nextByte":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_e

    .line 106
    .end local v2    # "nextByte":J
    :goto_34
    return-wide v2

    .line 92
    .restart local v2    # "nextByte":J
    :cond_35
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    iput-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    .line 93
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    or-long/2addr v4, v2

    iput-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    goto :goto_1d

    .line 99
    .end local v2    # "nextByte":J
    :cond_42
    iget-object v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->byteOrder:Ljava/nio/ByteOrder;

    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v4, v5, :cond_5c

    .line 100
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    sget-object v6, Lorg/apache/commons/compress/utils/BitInputStream;->MASKS:[J

    aget-wide v6, v6, p1

    and-long v0, v4, v6

    .line 101
    .local v0, "bitsOut":J
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    ushr-long/2addr v4, p1

    iput-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    .line 105
    :goto_55
    iget v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    sub-int/2addr v4, p1

    iput v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    move-wide v2, v0

    .line 106
    goto :goto_34

    .line 103
    .end local v0    # "bitsOut":J
    :cond_5c
    iget-wide v4, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCached:J

    iget v6, p0, Lorg/apache/commons/compress/utils/BitInputStream;->bitsCachedSize:I

    sub-int/2addr v6, p1

    shr-long/2addr v4, v6

    sget-object v6, Lorg/apache/commons/compress/utils/BitInputStream;->MASKS:[J

    aget-wide v6, v6, p1

    and-long v0, v4, v6

    .restart local v0    # "bitsOut":J
    goto :goto_55
.end method
