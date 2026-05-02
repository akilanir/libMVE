.class Lorg/tukaani/xz/SimpleOutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# static fields
.field static final $assertionsDisabled:Z

.field private static final FILTER_BUF_SIZE:I = 0x1000

.field static class$org$tukaani$xz$SimpleOutputStream:Ljava/lang/Class;


# instance fields
.field private exception:Ljava/io/IOException;

.field private final filterBuf:[B

.field private finished:Z

.field private out:Lorg/tukaani/xz/FinishableOutputStream;

.field private pos:I

.field private final simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

.field private final tempBuf:[B

.field private unfiltered:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/SimpleOutputStream;->class$org$tukaani$xz$SimpleOutputStream:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.SimpleOutputStream"

    invoke-static {v0}, Lorg/tukaani/xz/SimpleOutputStream;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/SimpleOutputStream;->class$org$tukaani$xz$SimpleOutputStream:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/SimpleOutputStream;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/SimpleOutputStream;->class$org$tukaani$xz$SimpleOutputStream:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(Lorg/tukaani/xz/FinishableOutputStream;Lorg/tukaani/xz/simple/SimpleFilter;)V
    .registers 5

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iput v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iput v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    iput-boolean v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->tempBuf:[B

    if-nez p1, :cond_20

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_20
    iput-object p1, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    iput-object p2, p0, Lorg/tukaani/xz/SimpleOutputStream;->simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    throw v0
.end method

.method static getMemoryUsage()I
    .registers 1

    const/4 v0, 0x5

    return v0
.end method

.method private writePending()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-boolean v0, Lorg/tukaani/xz/SimpleOutputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_e
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_15
    :try_start_15
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    iget-object v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v2, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    invoke-virtual {v0, v1, v2, v3}, Lorg/tukaani/xz/FinishableOutputStream;->write([BII)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_20} :catch_24

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    return-void

    :catch_24
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

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

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    if-nez v0, :cond_b

    :try_start_8
    invoke-direct {p0}, Lorg/tukaani/xz/SimpleOutputStream;->writePending()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_22

    :cond_b
    :goto_b
    :try_start_b
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_1a

    :cond_10
    :goto_10
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_1a
    move-exception v0

    iget-object v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_10

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

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

    iget-boolean v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    if-nez v0, :cond_c

    invoke-direct {p0}, Lorg/tukaani/xz/SimpleOutputStream;->writePending()V

    :try_start_7
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->finish()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_d

    :cond_c
    return-void

    :catch_d
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Flushing is not supported"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

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

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/SimpleOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x0

    if-ltz p2, :cond_e

    if-ltz p3, :cond_e

    add-int v0, p2, p3

    if-ltz v0, :cond_e

    add-int v0, p2, p3

    array-length v1, p1

    if-le v0, v1, :cond_14

    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    :cond_14
    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_1b
    iget-boolean v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->finished:Z

    if-eqz v0, :cond_50

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_27
    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    sub-int/2addr v1, v0

    iput v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    :try_start_2c
    iget-object v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    iget-object v2, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v3, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    invoke-virtual {v1, v2, v3, v0}, Lorg/tukaani/xz/FinishableOutputStream;->write([BII)V
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_35} :catch_88

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    add-int/2addr v0, v1

    const/16 v1, 0x1000

    if-ne v0, v1, :cond_50

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget-object v2, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v3, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    invoke-static {v0, v1, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v4, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    :cond_50
    if-lez p3, :cond_8c

    iget v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    add-int/2addr v0, v1

    rsub-int v0, v0, 0x1000

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v2, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    add-int/2addr v2, v3

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr p2, v0

    sub-int/2addr p3, v0

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    iget-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

    iget-object v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->filterBuf:[B

    iget v2, p0, Lorg/tukaani/xz/SimpleOutputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    invoke-interface {v0, v1, v2, v3}, Lorg/tukaani/xz/simple/SimpleFilter;->code([BII)I

    move-result v0

    sget-boolean v1, Lorg/tukaani/xz/SimpleOutputStream;->$assertionsDisabled:Z

    if-nez v1, :cond_27

    iget v1, p0, Lorg/tukaani/xz/SimpleOutputStream;->unfiltered:I

    if-le v0, v1, :cond_27

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :catch_88
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleOutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_8c
    return-void
.end method
