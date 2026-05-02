.class public Lorg/tukaani/xz/XZInputStream;
.super Ljava/io/InputStream;


# instance fields
.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private in:Ljava/io/InputStream;

.field private final memoryLimit:I

.field private final tempBuf:[B

.field private xzIn:Lorg/tukaani/xz/SingleXZInputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lorg/tukaani/xz/XZInputStream;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/XZInputStream;->endReached:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/XZInputStream;->tempBuf:[B

    iput-object p1, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    iput p2, p0, Lorg/tukaani/xz/XZInputStream;->memoryLimit:I

    new-instance v0, Lorg/tukaani/xz/SingleXZInputStream;

    invoke-direct {v0, p1, p2}, Lorg/tukaani/xz/SingleXZInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;

    return-void
.end method

.method private prepareNextStream()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x1

    new-instance v0, Ljava/io/DataInputStream;

    iget-object v1, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    const/16 v1, 0xc

    new-array v1, v1, [B

    :cond_e
    invoke-virtual {v0, v1, v5, v4}, Ljava/io/DataInputStream;->read([BII)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_18

    iput-boolean v4, p0, Lorg/tukaani/xz/XZInputStream;->endReached:Z

    :goto_17
    return-void

    :cond_18
    invoke-virtual {v0, v1, v4, v6}, Ljava/io/DataInputStream;->readFully([BII)V

    aget-byte v2, v1, v5

    if-nez v2, :cond_2c

    aget-byte v2, v1, v4

    if-nez v2, :cond_2c

    const/4 v2, 0x2

    aget-byte v2, v1, v2

    if-nez v2, :cond_2c

    aget-byte v2, v1, v6

    if-eqz v2, :cond_e

    :cond_2c
    const/4 v2, 0x4

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    :try_start_32
    new-instance v0, Lorg/tukaani/xz/SingleXZInputStream;

    iget-object v2, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    iget v3, p0, Lorg/tukaani/xz/XZInputStream;->memoryLimit:I

    invoke-direct {v0, v2, v3, v1}, Lorg/tukaani/xz/SingleXZInputStream;-><init>(Ljava/io/InputStream;I[B)V

    iput-object v0, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;
    :try_end_3d
    .catch Lorg/tukaani/xz/XZFormatException; {:try_start_32 .. :try_end_3d} :catch_3e

    goto :goto_17

    :catch_3e
    move-exception v0

    new-instance v0, Lorg/tukaani/xz/CorruptedInputException;

    const-string v1, "Garbage after a valid XZ Stream"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/CorruptedInputException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;

    if-nez v0, :cond_19

    const/4 v0, 0x0

    :goto_18
    return v0

    :cond_19
    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/SingleXZInputStream;->available()I

    move-result v0

    goto :goto_18
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    throw v0
.end method

.method public read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v0, -0x1

    iget-object v1, p0, Lorg/tukaani/xz/XZInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/XZInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, -0x1

    if-ltz p2, :cond_f

    if-ltz p3, :cond_f

    add-int v2, p2, p3

    if-ltz v2, :cond_f

    add-int v2, p2, p3

    array-length v3, p1

    if-le v2, v3, :cond_15

    :cond_f
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_15
    if-nez p3, :cond_19

    move v0, v1

    :cond_18
    :goto_18
    return v0

    :cond_19
    iget-object v2, p0, Lorg/tukaani/xz/XZInputStream;->in:Ljava/io/InputStream;

    if-nez v2, :cond_25

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_25
    iget-object v2, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    if-eqz v2, :cond_2c

    iget-object v0, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2c
    iget-boolean v2, p0, Lorg/tukaani/xz/XZInputStream;->endReached:Z

    if-nez v2, :cond_18

    move v2, p3

    move v3, p2

    :cond_32
    :goto_32
    if-lez v2, :cond_5b

    :try_start_34
    iget-object v4, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;

    if-nez v4, :cond_43

    invoke-direct {p0}, Lorg/tukaani/xz/XZInputStream;->prepareNextStream()V

    iget-boolean v4, p0, Lorg/tukaani/xz/XZInputStream;->endReached:Z

    if-eqz v4, :cond_43

    if-eqz v1, :cond_18

    move v0, v1

    goto :goto_18

    :cond_43
    iget-object v4, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;

    invoke-virtual {v4, p1, v3, v2}, Lorg/tukaani/xz/SingleXZInputStream;->read([BII)I

    move-result v4

    if-lez v4, :cond_4f

    add-int/2addr v1, v4

    add-int/2addr v3, v4

    sub-int/2addr v2, v4

    goto :goto_32

    :cond_4f
    if-ne v4, v0, :cond_32

    const/4 v4, 0x0

    iput-object v4, p0, Lorg/tukaani/xz/XZInputStream;->xzIn:Lorg/tukaani/xz/SingleXZInputStream;
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_54} :catch_55

    goto :goto_32

    :catch_55
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/XZInputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_5b

    throw v0

    :cond_5b
    move v0, v1

    goto :goto_18
.end method
