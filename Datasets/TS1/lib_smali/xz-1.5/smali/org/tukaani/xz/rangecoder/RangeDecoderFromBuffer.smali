.class public final Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;
.super Lorg/tukaani/xz/rangecoder/RangeDecoder;


# static fields
.field private static final INIT_SIZE:I = 0x5


# instance fields
.field private final buf:[B

.field private end:I

.field private pos:I


# direct methods
.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;-><init>()V

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->end:I

    add-int/lit8 v0, p1, -0x5

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->buf:[B

    return-void
.end method


# virtual methods
.method public isFinished()Z
    .registers 3

    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->end:I

    if-ne v0, v1, :cond_c

    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->code:I

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isInBufferOK()Z
    .registers 3

    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->end:I

    if-gt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public normalize()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->range:I

    const/high16 v1, -0x1000000

    and-int/2addr v0, v1

    if-nez v0, :cond_20

    :try_start_7
    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->code:I

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->buf:[B

    iget v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->code:I

    iget v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->range:I

    shl-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->range:I
    :try_end_20
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_20} :catch_21

    :cond_20
    return-void

    :catch_21
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0
.end method

.method public prepareInputBuffer(Ljava/io/DataInputStream;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v0, 0x5

    if-ge p2, v0, :cond_a

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_a
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    if-eqz v0, :cond_16

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    invoke-direct {v0}, Lorg/tukaani/xz/CorruptedInputException;-><init>()V

    throw v0

    :cond_16
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->code:I

    const/4 v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->range:I

    iput v2, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->pos:I

    add-int/lit8 v0, p2, -0x5

    iput v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->end:I

    iget-object v0, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->buf:[B

    iget v1, p0, Lorg/tukaani/xz/rangecoder/RangeDecoderFromBuffer;->end:I

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/DataInputStream;->readFully([BII)V

    return-void
.end method
