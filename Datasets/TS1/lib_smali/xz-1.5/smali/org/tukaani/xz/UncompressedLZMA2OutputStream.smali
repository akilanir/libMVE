.class Lorg/tukaani/xz/UncompressedLZMA2OutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# instance fields
.field private dictResetNeeded:Z

.field private exception:Ljava/io/IOException;

.field private finished:Z

.field private out:Lorg/tukaani/xz/FinishableOutputStream;

.field private final outData:Ljava/io/DataOutputStream;

.field private final tempBuf:[B

.field private final uncompBuf:[B

.field private uncompPos:I


# direct methods
.method constructor <init>(Lorg/tukaani/xz/FinishableOutputStream;)V
    .registers 5

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    const/high16 v0, 0x10000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompBuf:[B

    iput v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    iput-boolean v2, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->dictResetNeeded:Z

    iput-boolean v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    new-array v0, v2, [B

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->tempBuf:[B

    if-nez p1, :cond_20

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_20
    iput-object p1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    return-void
.end method

.method static getMemoryUsage()I
    .registers 1

    const/16 v0, 0x46

    return v0
.end method

.method private writeChunk()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->dictResetNeeded:Z

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_8
    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    iget v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompBuf:[B

    iget v2, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/DataOutputStream;->write([BII)V

    iput v3, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    iput-boolean v3, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->dictResetNeeded:Z

    return-void

    :cond_22
    const/4 v0, 0x2

    goto :goto_8
.end method

.method private writeEndMarker()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    :try_start_13
    iget v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    if-lez v0, :cond_1a

    invoke-direct {p0}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->writeChunk()V

    :cond_1a
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/FinishableOutputStream;->write(I)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_20} :catch_21

    return-void

    :catch_21
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    if-nez v0, :cond_b

    :try_start_8
    invoke-direct {p0}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->writeEndMarker()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_22

    :cond_b
    :goto_b
    :try_start_b
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_1a

    :cond_10
    :goto_10
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_1a
    move-exception v0

    iget-object v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_10

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    goto :goto_10

    :catch_22
    move-exception v0

    goto :goto_b

    :cond_24
    return-void
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    if-nez v0, :cond_f

    invoke-direct {p0}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->writeEndMarker()V

    :try_start_7
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->finish()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    :cond_f
    return-void

    :catch_10
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    :try_start_13
    iget v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    if-lez v0, :cond_1a

    invoke-direct {p0}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->writeChunk()V

    :cond_1a
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->flush()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1f} :catch_20

    return-void

    :catch_20
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public write(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p2, :cond_d

    if-ltz p3, :cond_d

    add-int v0, p2, p3

    if-ltz v0, :cond_d

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_13

    :cond_d
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_1a
    iget-boolean v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_26

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    :goto_26
    if-lez p3, :cond_4e

    :try_start_28
    iget-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompBuf:[B

    array-length v0, v0

    iget v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    sub-int/2addr v0, v1

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompBuf:[B

    iget v2, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sub-int/2addr p3, v0

    iget v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    iget v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompPos:I

    iget-object v1, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->uncompBuf:[B

    array-length v1, v1

    if-ne v0, v1, :cond_26

    invoke-direct {p0}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->writeChunk()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_49} :catch_4a

    goto :goto_26

    :catch_4a
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_4e
    return-void
.end method
