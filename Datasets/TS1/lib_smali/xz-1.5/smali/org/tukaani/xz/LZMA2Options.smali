.class public Lorg/tukaani/xz/LZMA2Options;
.super Lorg/tukaani/xz/FilterOptions;


# static fields
.field static final $assertionsDisabled:Z

.field public static final DICT_SIZE_DEFAULT:I = 0x800000

.field public static final DICT_SIZE_MAX:I = 0x30000000

.field public static final DICT_SIZE_MIN:I = 0x1000

.field public static final LC_DEFAULT:I = 0x3

.field public static final LC_LP_MAX:I = 0x4

.field public static final LP_DEFAULT:I = 0x0

.field public static final MF_BT4:I = 0x14

.field public static final MF_HC4:I = 0x4

.field public static final MODE_FAST:I = 0x1

.field public static final MODE_NORMAL:I = 0x2

.field public static final MODE_UNCOMPRESSED:I = 0x0

.field public static final NICE_LEN_MAX:I = 0x111

.field public static final NICE_LEN_MIN:I = 0x8

.field public static final PB_DEFAULT:I = 0x2

.field public static final PB_MAX:I = 0x4

.field public static final PRESET_DEFAULT:I = 0x6

.field public static final PRESET_MAX:I = 0x9

.field public static final PRESET_MIN:I

.field static class$org$tukaani$xz$LZMA2Options:Ljava/lang/Class;

.field private static final presetToDepthLimit:[I

.field private static final presetToDictSize:[I


# instance fields
.field private depthLimit:I

.field private dictSize:I

.field private lc:I

.field private lp:I

.field private mf:I

.field private mode:I

.field private niceLen:I

.field private pb:I

.field private presetDict:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/LZMA2Options;->class$org$tukaani$xz$LZMA2Options:Ljava/lang/Class;

    if-nez v0, :cond_27

    const-string v0, "org.tukaani.xz.LZMA2Options"

    invoke-static {v0}, Lorg/tukaani/xz/LZMA2Options;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/LZMA2Options;->class$org$tukaani$xz$LZMA2Options:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_2a

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/LZMA2Options;->$assertionsDisabled:Z

    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_2c

    sput-object v0, Lorg/tukaani/xz/LZMA2Options;->presetToDictSize:[I

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_44

    sput-object v0, Lorg/tukaani/xz/LZMA2Options;->presetToDepthLimit:[I

    return-void

    :cond_27
    sget-object v0, Lorg/tukaani/xz/LZMA2Options;->class$org$tukaani$xz$LZMA2Options:Ljava/lang/Class;

    goto :goto_c

    :cond_2a
    const/4 v0, 0x0

    goto :goto_13

    :array_2c
    .array-data 4
        0x40000
        0x100000
        0x200000
        0x400000
        0x400000
        0x800000
        0x800000
        0x1000000
        0x2000000
        0x4000000
    .end array-data

    :array_44
    .array-data 4
        0x4
        0x8
        0x18
        0x30
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lorg/tukaani/xz/FilterOptions;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2Options;->presetDict:[B

    const/4 v0, 0x6

    :try_start_7
    invoke-virtual {p0, v0}, Lorg/tukaani/xz/LZMA2Options;->setPreset(I)V
    :try_end_a
    .catch Lorg/tukaani/xz/UnsupportedOptionsException; {:try_start_7 .. :try_end_a} :catch_b

    return-void

    :catch_b
    move-exception v0

    sget-boolean v0, Lorg/tukaani/xz/LZMA2Options;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_16
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method public constructor <init>(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    invoke-direct {p0}, Lorg/tukaani/xz/FilterOptions;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2Options;->presetDict:[B

    invoke-virtual {p0, p1}, Lorg/tukaani/xz/LZMA2Options;->setPreset(I)V

    return-void
.end method

.method public constructor <init>(IIIIIIII)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    invoke-direct {p0}, Lorg/tukaani/xz/FilterOptions;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2Options;->presetDict:[B

    invoke-virtual {p0, p1}, Lorg/tukaani/xz/LZMA2Options;->setDictSize(I)V

    invoke-virtual {p0, p2, p3}, Lorg/tukaani/xz/LZMA2Options;->setLcLp(II)V

    invoke-virtual {p0, p4}, Lorg/tukaani/xz/LZMA2Options;->setPb(I)V

    invoke-virtual {p0, p5}, Lorg/tukaani/xz/LZMA2Options;->setMode(I)V

    invoke-virtual {p0, p6}, Lorg/tukaani/xz/LZMA2Options;->setNiceLen(I)V

    invoke-virtual {p0, p7}, Lorg/tukaani/xz/LZMA2Options;->setMatchFinder(I)V

    invoke-virtual {p0, p8}, Lorg/tukaani/xz/LZMA2Options;->setDepthLimit(I)V

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


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    sget-boolean v0, Lorg/tukaani/xz/LZMA2Options;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method public getDecoderMemoryUsage()I
    .registers 3

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->dictSize:I

    add-int/lit8 v0, v0, -0x1

    ushr-int/lit8 v1, v0, 0x2

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x3

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x4

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x8

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lorg/tukaani/xz/LZMA2InputStream;->getMemoryUsage(I)I

    move-result v0

    return v0
.end method

.method public getDepthLimit()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->depthLimit:I

    return v0
.end method

.method public getDictSize()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->dictSize:I

    return v0
.end method

.method public getEncoderMemoryUsage()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    if-nez v0, :cond_9

    invoke-static {}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;->getMemoryUsage()I

    move-result v0

    :goto_8
    return v0

    :cond_9
    invoke-static {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->getMemoryUsage(Lorg/tukaani/xz/LZMA2Options;)I

    move-result v0

    goto :goto_8
.end method

.method getFilterEncoder()Lorg/tukaani/xz/FilterEncoder;
    .registers 2

    new-instance v0, Lorg/tukaani/xz/LZMA2Encoder;

    invoke-direct {v0, p0}, Lorg/tukaani/xz/LZMA2Encoder;-><init>(Lorg/tukaani/xz/LZMA2Options;)V

    return-object v0
.end method

.method public getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lorg/tukaani/xz/LZMA2InputStream;

    iget v1, p0, Lorg/tukaani/xz/LZMA2Options;->dictSize:I

    invoke-direct {v0, p1, v1}, Lorg/tukaani/xz/LZMA2InputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method public getLc()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->lc:I

    return v0
.end method

.method public getLp()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->lp:I

    return v0
.end method

.method public getMatchFinder()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->mf:I

    return v0
.end method

.method public getMode()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    return v0
.end method

.method public getNiceLen()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->niceLen:I

    return v0
.end method

.method public getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
    .registers 3

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    if-nez v0, :cond_a

    new-instance v0, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/UncompressedLZMA2OutputStream;-><init>(Lorg/tukaani/xz/FinishableOutputStream;)V

    :goto_9
    return-object v0

    :cond_a
    new-instance v0, Lorg/tukaani/xz/LZMA2OutputStream;

    invoke-direct {v0, p1, p0}, Lorg/tukaani/xz/LZMA2OutputStream;-><init>(Lorg/tukaani/xz/FinishableOutputStream;Lorg/tukaani/xz/LZMA2Options;)V

    goto :goto_9
.end method

.method public getPb()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->pb:I

    return v0
.end method

.method public getPresetDict()[B
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2Options;->presetDict:[B

    return-object v0
.end method

.method public setDepthLimit(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    if-gez p1, :cond_1b

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Depth limit cannot be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->depthLimit:I

    return-void
.end method

.method public setDictSize(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/16 v0, 0x1000

    if-ge p1, v0, :cond_23

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "LZMA2 dictionary size must be at least 4 KiB: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " B"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_23
    const/high16 v0, 0x30000000

    if-le p1, v0, :cond_46

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "LZMA2 dictionary size must not exceed 768 MiB: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " B"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_46
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->dictSize:I

    return-void
.end method

.method public setLc(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->lp:I

    invoke-virtual {p0, p1, v0}, Lorg/tukaani/xz/LZMA2Options;->setLcLp(II)V

    return-void
.end method

.method public setLcLp(II)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/4 v1, 0x4

    if-ltz p1, :cond_d

    if-ltz p2, :cond_d

    if-gt p1, v1, :cond_d

    if-gt p2, v1, :cond_d

    add-int v0, p1, p2

    if-le v0, v1, :cond_30

    :cond_d
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "lc + lp must not exceed 4: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " + "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_30
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->lc:I

    iput p2, p0, Lorg/tukaani/xz/LZMA2Options;->lp:I

    return-void
.end method

.method public setLp(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    iget v0, p0, Lorg/tukaani/xz/LZMA2Options;->lc:I

    invoke-virtual {p0, v0, p1}, Lorg/tukaani/xz/LZMA2Options;->setLcLp(II)V

    return-void
.end method

.method public setMatchFinder(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/4 v0, 0x4

    if-eq p1, v0, :cond_20

    const/16 v0, 0x14

    if-eq p1, v0, :cond_20

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported match finder: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->mf:I

    return-void
.end method

.method public setMode(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_1e

    :cond_5
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported compression mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1e
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    return-void
.end method

.method public setNiceLen(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/16 v0, 0x8

    if-ge p1, v0, :cond_1d

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Minimum nice length of matches is 8 bytes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    const/16 v0, 0x111

    if-le p1, v0, :cond_3a

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Maximum nice length of matches is 273: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3a
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->niceLen:I

    return-void
.end method

.method public setPb(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    if-ltz p1, :cond_5

    const/4 v0, 0x4

    if-le p1, v0, :cond_1e

    :cond_5
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "pb must not exceed 4: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1e
    iput p1, p0, Lorg/tukaani/xz/LZMA2Options;->pb:I

    return-void
.end method

.method public setPreset(I)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-ltz p1, :cond_b

    const/16 v0, 0x9

    if-le p1, v0, :cond_24

    :cond_b
    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported preset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_24
    iput v4, p0, Lorg/tukaani/xz/LZMA2Options;->lc:I

    iput v1, p0, Lorg/tukaani/xz/LZMA2Options;->lp:I

    iput v3, p0, Lorg/tukaani/xz/LZMA2Options;->pb:I

    sget-object v0, Lorg/tukaani/xz/LZMA2Options;->presetToDictSize:[I

    aget v0, v0, p1

    iput v0, p0, Lorg/tukaani/xz/LZMA2Options;->dictSize:I

    if-gt p1, v4, :cond_46

    iput v2, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    iput v5, p0, Lorg/tukaani/xz/LZMA2Options;->mf:I

    if-gt p1, v2, :cond_43

    const/16 v0, 0x80

    :goto_3a
    iput v0, p0, Lorg/tukaani/xz/LZMA2Options;->niceLen:I

    sget-object v0, Lorg/tukaani/xz/LZMA2Options;->presetToDepthLimit:[I

    aget v0, v0, p1

    iput v0, p0, Lorg/tukaani/xz/LZMA2Options;->depthLimit:I

    :goto_42
    return-void

    :cond_43
    const/16 v0, 0x111

    goto :goto_3a

    :cond_46
    iput v3, p0, Lorg/tukaani/xz/LZMA2Options;->mode:I

    const/16 v0, 0x14

    iput v0, p0, Lorg/tukaani/xz/LZMA2Options;->mf:I

    if-ne p1, v5, :cond_55

    const/16 v0, 0x10

    :goto_50
    iput v0, p0, Lorg/tukaani/xz/LZMA2Options;->niceLen:I

    iput v1, p0, Lorg/tukaani/xz/LZMA2Options;->depthLimit:I

    goto :goto_42

    :cond_55
    const/4 v0, 0x5

    if-ne p1, v0, :cond_5b

    const/16 v0, 0x20

    goto :goto_50

    :cond_5b
    const/16 v0, 0x40

    goto :goto_50
.end method

.method public setPresetDict([B)V
    .registers 2

    iput-object p1, p0, Lorg/tukaani/xz/LZMA2Options;->presetDict:[B

    return-void
.end method
