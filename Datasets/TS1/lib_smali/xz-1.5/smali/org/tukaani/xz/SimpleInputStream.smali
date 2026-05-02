.class Lorg/tukaani/xz/SimpleInputStream;
.super Ljava/io/InputStream;


# static fields
.field static final $assertionsDisabled:Z

.field private static final FILTER_BUF_SIZE:I = 0x1000

.field static class$org$tukaani$xz$SimpleInputStream:Ljava/lang/Class;


# instance fields
.field private endReached:Z

.field private exception:Ljava/io/IOException;

.field private final filterBuf:[B

.field private filtered:I

.field private in:Ljava/io/InputStream;

.field private pos:I

.field private final simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

.field private final tempBuf:[B

.field private unfiltered:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/SimpleInputStream;->class$org$tukaani$xz$SimpleInputStream:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.SimpleInputStream"

    invoke-static {v0}, Lorg/tukaani/xz/SimpleInputStream;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/SimpleInputStream;->class$org$tukaani$xz$SimpleInputStream:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/SimpleInputStream;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/SimpleInputStream;->class$org$tukaani$xz$SimpleInputStream:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(Ljava/io/InputStream;Lorg/tukaani/xz/simple/SimpleFilter;)V
    .registers 5

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    iput v1, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iput v1, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    iput v1, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    iput-boolean v1, p0, Lorg/tukaani/xz/SimpleInputStream;->endReached:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->tempBuf:[B

    if-nez p1, :cond_22

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_22
    sget-boolean v0, Lorg/tukaani/xz/SimpleInputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_2e

    if-nez p2, :cond_2e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_2e
    iput-object p1, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    iput-object p2, p0, Lorg/tukaani/xz/SimpleInputStream;->simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

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


# virtual methods
.method public available()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_c

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_13
    iget v0, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

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

    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    :try_start_5
    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_d

    iput-object v1, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    iput-object v1, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

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

    iget-object v1, p0, Lorg/tukaani/xz/SimpleInputStream;->tempBuf:[B

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v3, v2}, Lorg/tukaani/xz/SimpleInputStream;->read([BII)I

    move-result v1

    if-ne v1, v0, :cond_c

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->tempBuf:[B

    aget-byte v0, v0, v3

    and-int/lit16 v0, v0, 0xff

    goto :goto_b
.end method

.method public read([BII)I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, -0x1

    const/4 v0, 0x0

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
    if-nez p3, :cond_18

    :cond_17
    :goto_17
    return v0

    :cond_18
    iget-object v2, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    if-nez v2, :cond_24

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_24
    iget-object v2, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    if-eqz v2, :cond_51

    iget-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2b
    :try_start_2b
    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    add-int/2addr v2, v3

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    add-int/2addr v2, v3

    rsub-int v2, v2, 0x1000

    iget-object v3, p0, Lorg/tukaani/xz/SimpleInputStream;->in:Ljava/io/InputStream;

    iget-object v4, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    iget v5, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget v6, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    add-int/2addr v5, v6

    iget v6, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    if-ne v2, v1, :cond_a5

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/tukaani/xz/SimpleInputStream;->endReached:Z

    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    const/4 v2, 0x0

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    :cond_51
    :goto_51
    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    iget v4, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    invoke-static {v3, v4, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    add-int/2addr v3, v2

    iput v3, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    sub-int/2addr v3, v2

    iput v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    add-int/2addr p2, v2

    sub-int/2addr p3, v2

    add-int/2addr v0, v2

    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    add-int/2addr v2, v3

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    add-int/2addr v2, v3

    const/16 v3, 0x1000

    if-ne v2, v3, :cond_89

    iget-object v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget-object v4, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    const/4 v5, 0x0

    iget v6, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    iget v7, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    add-int/2addr v6, v7

    invoke-static {v2, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 v2, 0x0

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    :cond_89
    if-eqz p3, :cond_8f

    iget-boolean v2, p0, Lorg/tukaani/xz/SimpleInputStream;->endReached:Z

    if-eqz v2, :cond_93

    :cond_8f
    if-gtz v0, :cond_17

    move v0, v1

    goto :goto_17

    :cond_93
    sget-boolean v2, Lorg/tukaani/xz/SimpleInputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_2b

    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    if-eqz v2, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_a1} :catch_a1

    :catch_a1
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/SimpleInputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_a5
    :try_start_a5
    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    add-int/2addr v2, v3

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    iget-object v2, p0, Lorg/tukaani/xz/SimpleInputStream;->simpleFilter:Lorg/tukaani/xz/simple/SimpleFilter;

    iget-object v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filterBuf:[B

    iget v4, p0, Lorg/tukaani/xz/SimpleInputStream;->pos:I

    iget v5, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    invoke-interface {v2, v3, v4, v5}, Lorg/tukaani/xz/simple/SimpleFilter;->code([BII)I

    move-result v2

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    sget-boolean v2, Lorg/tukaani/xz/SimpleInputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_c8

    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    if-le v2, v3, :cond_c8

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_c8
    iget v2, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I

    iget v3, p0, Lorg/tukaani/xz/SimpleInputStream;->filtered:I

    sub-int/2addr v2, v3

    iput v2, p0, Lorg/tukaani/xz/SimpleInputStream;->unfiltered:I
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_cf} :catch_a1

    goto :goto_51
.end method
