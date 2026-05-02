.class public Lorg/tukaani/xz/DeltaInputStream;
.super Ljava/io/InputStream;


# static fields
.field public static final DISTANCE_MAX:I = 0x100

.field public static final DISTANCE_MIN:I = 0x1


# instance fields
.field private final delta:Lorg/tukaani/xz/delta/DeltaDecoder;

.field private exception:Ljava/io/IOException;

.field private in:Ljava/io/InputStream;

.field private final tempBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 4

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->tempBuf:[B

    if-nez p1, :cond_13

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_13
    iput-object p1, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    new-instance v0, Lorg/tukaani/xz/delta/DeltaDecoder;

    invoke-direct {v0, p2}, Lorg/tukaani/xz/delta/DeltaDecoder;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->delta:Lorg/tukaani/xz/delta/DeltaDecoder;

    return-void
.end method


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

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

    iget-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/DeltaInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, -0x1

    if-nez p3, :cond_5

    const/4 v0, 0x0

    :cond_4
    :goto_4
    return v0

    :cond_5
    iget-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    if-nez v1, :cond_11

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    iget-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    if-eqz v1, :cond_18

    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_18
    :try_start_18
    iget-object v1, p0, Lorg/tukaani/xz/DeltaInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1d} :catch_27

    move-result v1

    if-eq v1, v0, :cond_4

    iget-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->delta:Lorg/tukaani/xz/delta/DeltaDecoder;

    invoke-virtual {v0, p1, p2, v1}, Lorg/tukaani/xz/delta/DeltaDecoder;->decode([BII)V

    move v0, v1

    goto :goto_4

    :catch_27
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/DeltaInputStream;->exception:Ljava/io/IOException;

    throw v0
.end method
