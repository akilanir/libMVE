.class Lorg/tukaani/xz/BCJDecoder;
.super Lorg/tukaani/xz/BCJCoder;

# interfaces
.implements Lorg/tukaani/xz/FilterDecoder;


# static fields
.field static final $assertionsDisabled:Z

.field static class$org$tukaani$xz$BCJDecoder:Ljava/lang/Class;


# instance fields
.field private final filterID:J

.field private final startOffset:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/BCJDecoder;->class$org$tukaani$xz$BCJDecoder:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.BCJDecoder"

    invoke-static {v0}, Lorg/tukaani/xz/BCJDecoder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/BCJDecoder;->class$org$tukaani$xz$BCJDecoder:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/BCJDecoder;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/BCJDecoder;->class$org$tukaani$xz$BCJDecoder:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(J[B)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/4 v4, 0x4

    const/4 v0, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/BCJCoder;-><init>()V

    sget-boolean v1, Lorg/tukaani/xz/BCJDecoder;->$assertionsDisabled:Z

    if-nez v1, :cond_15

    invoke-static {p1, p2}, Lorg/tukaani/xz/BCJDecoder;->isBCJFilterID(J)Z

    move-result v1

    if-nez v1, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_15
    iput-wide p1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    array-length v1, p3

    if-nez v1, :cond_1d

    iput v0, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    :goto_1c
    return-void

    :cond_1d
    array-length v1, p3

    if-ne v1, v4, :cond_31

    move v1, v0

    :goto_21
    if-ge v0, v4, :cond_2e

    aget-byte v2, p3, v0

    and-int/lit16 v2, v2, 0xff

    mul-int/lit8 v3, v0, 0x8

    shl-int/2addr v2, v3

    or-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    :cond_2e
    iput v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    goto :goto_1c

    :cond_31
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported BCJ filter properties"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0
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


# virtual methods
.method public getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 8

    const/4 v5, 0x0

    const/4 v0, 0x0

    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x4

    cmp-long v1, v1, v3

    if-nez v1, :cond_17

    new-instance v0, Lorg/tukaani/xz/simple/X86;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/X86;-><init>(ZI)V

    :cond_11
    :goto_11
    new-instance v1, Lorg/tukaani/xz/SimpleInputStream;

    invoke-direct {v1, p1, v0}, Lorg/tukaani/xz/SimpleInputStream;-><init>(Ljava/io/InputStream;Lorg/tukaani/xz/simple/SimpleFilter;)V

    return-object v1

    :cond_17
    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x5

    cmp-long v1, v1, v3

    if-nez v1, :cond_27

    new-instance v0, Lorg/tukaani/xz/simple/PowerPC;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/PowerPC;-><init>(ZI)V

    goto :goto_11

    :cond_27
    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x6

    cmp-long v1, v1, v3

    if-nez v1, :cond_37

    new-instance v0, Lorg/tukaani/xz/simple/IA64;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/IA64;-><init>(ZI)V

    goto :goto_11

    :cond_37
    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x7

    cmp-long v1, v1, v3

    if-nez v1, :cond_47

    new-instance v0, Lorg/tukaani/xz/simple/ARM;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/ARM;-><init>(ZI)V

    goto :goto_11

    :cond_47
    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x8

    cmp-long v1, v1, v3

    if-nez v1, :cond_57

    new-instance v0, Lorg/tukaani/xz/simple/ARMThumb;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/ARMThumb;-><init>(ZI)V

    goto :goto_11

    :cond_57
    iget-wide v1, p0, Lorg/tukaani/xz/BCJDecoder;->filterID:J

    const-wide/16 v3, 0x9

    cmp-long v1, v1, v3

    if-nez v1, :cond_67

    new-instance v0, Lorg/tukaani/xz/simple/SPARC;

    iget v1, p0, Lorg/tukaani/xz/BCJDecoder;->startOffset:I

    invoke-direct {v0, v5, v1}, Lorg/tukaani/xz/simple/SPARC;-><init>(ZI)V

    goto :goto_11

    :cond_67
    sget-boolean v1, Lorg/tukaani/xz/BCJDecoder;->$assertionsDisabled:Z

    if-nez v1, :cond_11

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public getMemoryUsage()I
    .registers 2

    invoke-static {}, Lorg/tukaani/xz/SimpleInputStream;->getMemoryUsage()I

    move-result v0

    return v0
.end method
