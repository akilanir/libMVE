.class Lorg/tukaani/xz/DeltaOutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# static fields
.field private static final FILTER_BUF_SIZE:I = 0x1000


# instance fields
.field private final delta:Lorg/tukaani/xz/delta/DeltaEncoder;

.field private exception:Ljava/io/IOException;

.field private final filterBuf:[B

.field private finished:Z

.field private out:Lorg/tukaani/xz/FinishableOutputStream;

.field private final tempBuf:[B


# direct methods
.method constructor <init>(Lorg/tukaani/xz/FinishableOutputStream;Lorg/tukaani/xz/DeltaOptions;)V
    .registers 5

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->filterBuf:[B

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->finished:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->tempBuf:[B

    iput-object p1, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    new-instance v0, Lorg/tukaani/xz/delta/DeltaEncoder;

    invoke-virtual {p2}, Lorg/tukaani/xz/DeltaOptions;->getDistance()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/delta/DeltaEncoder;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->delta:Lorg/tukaani/xz/delta/DeltaEncoder;

    return-void
.end method

.method static getMemoryUsage()I
    .registers 1

    const/4 v0, 0x5

    return v0
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    if-eqz v0, :cond_c

    :try_start_4
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_13

    :cond_9
    :goto_9
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_13
    move-exception v0

    iget-object v1, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_9

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    goto :goto_9

    :cond_1b
    return-void
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->finished:Z

    if-nez v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_b
    :try_start_b
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->finish()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_14

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->finished:Z

    :cond_13
    return-void

    :catch_14
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    :try_start_13
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->flush()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_18} :catch_19

    return-void

    :catch_19
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

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

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/DeltaOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v3, 0x1000

    if-ltz p2, :cond_f

    if-ltz p3, :cond_f

    add-int v0, p2, p3

    if-ltz v0, :cond_f

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_15

    :cond_f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_15
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_1c
    iget-boolean v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->finished:Z

    if-eqz v0, :cond_28

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28
    :goto_28
    if-le p3, v3, :cond_3f

    :try_start_2a
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->delta:Lorg/tukaani/xz/delta/DeltaEncoder;

    const/16 v1, 0x1000

    iget-object v2, p0, Lorg/tukaani/xz/DeltaOutputStream;->filterBuf:[B

    invoke-virtual {v0, p1, p2, v1, v2}, Lorg/tukaani/xz/delta/DeltaEncoder;->encode([BII[B)V

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/DeltaOutputStream;->filterBuf:[B

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/FinishableOutputStream;->write([B)V

    add-int/lit16 p2, p2, 0x1000

    add-int/lit16 p3, p3, -0x1000

    goto :goto_28

    :cond_3f
    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->delta:Lorg/tukaani/xz/delta/DeltaEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/DeltaOutputStream;->filterBuf:[B

    invoke-virtual {v0, p1, p2, p3, v1}, Lorg/tukaani/xz/delta/DeltaEncoder;->encode([BII[B)V

    iget-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/DeltaOutputStream;->filterBuf:[B

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p3}, Lorg/tukaani/xz/FinishableOutputStream;->write([BII)V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_4e} :catch_4f

    return-void

    :catch_4f
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method
