.class Lorg/tukaani/xz/LZMA2OutputStream;
.super Lorg/tukaani/xz/FinishableOutputStream;


# static fields
.field static final $assertionsDisabled:Z

.field static final COMPRESSED_SIZE_MAX:I = 0x10000

.field static class$org$tukaani$xz$LZMA2OutputStream:Ljava/lang/Class;


# instance fields
.field private dictResetNeeded:Z

.field private exception:Ljava/io/IOException;

.field private finished:Z

.field private final lz:Lorg/tukaani/xz/lz/LZEncoder;

.field private final lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

.field private out:Lorg/tukaani/xz/FinishableOutputStream;

.field private final outData:Ljava/io/DataOutputStream;

.field private pendingSize:I

.field private final props:I

.field private propsNeeded:Z

.field private final rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

.field private stateResetNeeded:Z

.field private final tempBuf:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/LZMA2OutputStream;->class$org$tukaani$xz$LZMA2OutputStream:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.LZMA2OutputStream"

    invoke-static {v0}, Lorg/tukaani/xz/LZMA2OutputStream;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/LZMA2OutputStream;->class$org$tukaani$xz$LZMA2OutputStream:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/LZMA2OutputStream;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/LZMA2OutputStream;->class$org$tukaani$xz$LZMA2OutputStream:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(Lorg/tukaani/xz/FinishableOutputStream;Lorg/tukaani/xz/LZMA2Options;)V
    .registers 14

    const/4 v10, 0x0

    const/4 v1, 0x1

    invoke-direct {p0}, Lorg/tukaani/xz/FinishableOutputStream;-><init>()V

    iput-boolean v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    iput-boolean v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->stateResetNeeded:Z

    iput-boolean v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->propsNeeded:Z

    iput v10, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    iput-boolean v10, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    new-array v0, v1, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->tempBuf:[B

    if-nez p1, :cond_1e

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    :cond_1e
    iput-object p1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    new-instance v0, Lorg/tukaani/xz/rangecoder/RangeEncoder;

    const/high16 v1, 0x10000

    invoke-direct {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeEncoder;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getDictSize()I

    move-result v5

    invoke-static {v5}, Lorg/tukaani/xz/LZMA2OutputStream;->getExtraSizeBefore(I)I

    move-result v6

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getLc()I

    move-result v1

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getLp()I

    move-result v2

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getPb()I

    move-result v3

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getMode()I

    move-result v4

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getNiceLen()I

    move-result v7

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getMatchFinder()I

    move-result v8

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getDepthLimit()I

    move-result v9

    invoke-static/range {v0 .. v9}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getInstance(Lorg/tukaani/xz/rangecoder/RangeEncoder;IIIIIIIII)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getLZEncoder()Lorg/tukaani/xz/lz/LZEncoder;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getPresetDict()[B

    move-result-object v0

    if-eqz v0, :cond_74

    array-length v1, v0

    if-lez v1, :cond_74

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v1, v5, v0}, Lorg/tukaani/xz/lz/LZEncoder;->setPresetDict(I[B)V

    iput-boolean v10, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    :cond_74
    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getPb()I

    move-result v0

    mul-int/lit8 v0, v0, 0x5

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getLp()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x9

    invoke-virtual {p2}, Lorg/tukaani/xz/LZMA2Options;->getLc()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->props:I

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

.method private static getExtraSizeBefore(I)I
    .registers 2

    const/high16 v0, 0x10000

    if-le v0, p0, :cond_6

    sub-int/2addr v0, p0

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method static getMemoryUsage(Lorg/tukaani/xz/LZMA2Options;)I
    .registers 5

    invoke-virtual {p0}, Lorg/tukaani/xz/LZMA2Options;->getDictSize()I

    move-result v0

    invoke-static {v0}, Lorg/tukaani/xz/LZMA2OutputStream;->getExtraSizeBefore(I)I

    move-result v1

    invoke-virtual {p0}, Lorg/tukaani/xz/LZMA2Options;->getMode()I

    move-result v2

    invoke-virtual {p0}, Lorg/tukaani/xz/LZMA2Options;->getMatchFinder()I

    move-result v3

    invoke-static {v2, v0, v1, v3}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getMemoryUsage(IIII)I

    move-result v0

    add-int/lit8 v0, v0, 0x46

    return v0
.end method

.method private writeChunk()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->finish()I

    move-result v1

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getUncompressedSize()I

    move-result v0

    sget-boolean v2, Lorg/tukaani/xz/LZMA2OutputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_18

    if-gtz v1, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    :cond_18
    sget-boolean v2, Lorg/tukaani/xz/LZMA2OutputStream;->$assertionsDisabled:Z

    if-nez v2, :cond_24

    if-gtz v0, :cond_24

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(I)V

    throw v1

    :cond_24
    add-int/lit8 v2, v1, 0x2

    if-ge v2, v0, :cond_3c

    invoke-direct {p0, v0, v1}, Lorg/tukaani/xz/LZMA2OutputStream;->writeLZMA(II)V

    :goto_2b
    iget v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    sub-int v0, v1, v0

    iput v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->resetUncompressedSize()V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->reset()V

    return-void

    :cond_3c
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->reset()V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getUncompressedSize()I

    move-result v0

    sget-boolean v1, Lorg/tukaani/xz/LZMA2OutputStream;->$assertionsDisabled:Z

    if-nez v1, :cond_53

    if-gtz v0, :cond_53

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(I)V

    throw v1

    :cond_53
    invoke-direct {p0, v0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeUncompressed(I)V

    goto :goto_2b
.end method

.method private writeEndMarker()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-boolean v0, Lorg/tukaani/xz/LZMA2OutputStream;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_e
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_15
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZEncoder;->setFinishing()V

    :goto_1a
    :try_start_1a
    iget v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    if-lez v0, :cond_2b

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->encodeForLZMA2()Z

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeChunk()V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_26} :catch_27

    goto :goto_1a

    :catch_27
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_2b
    :try_start_2b
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/FinishableOutputStream;->write(I)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_31} :catch_27

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    return-void
.end method

.method private writeLZMA(II)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->propsNeeded:Z

    if-eqz v0, :cond_3f

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    if-eqz v0, :cond_3c

    const/16 v0, 0xe0

    :goto_b
    add-int/lit8 v1, p1, -0x1

    ushr-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeShort(I)V

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->propsNeeded:Z

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    iget v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->props:I

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    :cond_2e
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->rc:Lorg/tukaani/xz/rangecoder/RangeEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->write(Ljava/io/OutputStream;)V

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2OutputStream;->propsNeeded:Z

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2OutputStream;->stateResetNeeded:Z

    iput-boolean v2, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    return-void

    :cond_3c
    const/16 v0, 0xc0

    goto :goto_b

    :cond_3f
    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->stateResetNeeded:Z

    if-eqz v0, :cond_46

    const/16 v0, 0xa0

    goto :goto_b

    :cond_46
    const/16 v0, 0x80

    goto :goto_b
.end method

.method private writeUncompressed(I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x1

    :goto_1
    if-lez p1, :cond_28

    const/high16 v0, 0x10000

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    if-eqz v0, :cond_26

    move v0, v1

    :goto_10
    invoke-virtual {v3, v0}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->outData:Ljava/io/DataOutputStream;

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v0, v3}, Ljava/io/DataOutputStream;->writeShort(I)V

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v3, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0, v3, p1, v2}, Lorg/tukaani/xz/lz/LZEncoder;->copyUncompressed(Ljava/io/OutputStream;II)V

    sub-int/2addr p1, v2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->dictResetNeeded:Z

    goto :goto_1

    :cond_26
    const/4 v0, 0x2

    goto :goto_10

    :cond_28
    iput-boolean v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->stateResetNeeded:Z

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    if-nez v0, :cond_b

    :try_start_8
    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeEndMarker()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_22

    :cond_b
    :goto_b
    :try_start_b
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_1a

    :cond_10
    :goto_10
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    :cond_13
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :catch_1a
    move-exception v0

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    if-nez v1, :cond_10

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

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

    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    if-nez v0, :cond_f

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeEndMarker()V

    :try_start_7
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->finish()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    :cond_f
    return-void

    :catch_10
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0
.end method

.method public flush()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_7
    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_13

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    :try_start_13
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZEncoder;->setFlushing()V

    :goto_18
    iget v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    if-lez v0, :cond_29

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->encodeForLZMA2()Z

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeChunk()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_24} :catch_25

    goto :goto_18

    :catch_25
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_29
    :try_start_29
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->out:Lorg/tukaani/xz/FinishableOutputStream;

    invoke-virtual {v0}, Lorg/tukaani/xz/FinishableOutputStream;->flush()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_2e} :catch_25

    return-void
.end method

.method public write(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->tempBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->tempBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/tukaani/xz/LZMA2OutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .registers 6
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
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_1a
    iget-boolean v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->finished:Z

    if-eqz v0, :cond_26

    new-instance v0, Lorg/tukaani/xz/XZIOException;

    const-string v1, "Stream finished or closed"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/XZIOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_26
    :goto_26
    if-lez p3, :cond_45

    :try_start_28
    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0, p1, p2, p3}, Lorg/tukaani/xz/lz/LZEncoder;->fillWindow([BII)I

    move-result v0

    add-int/2addr p2, v0

    sub-int/2addr p3, v0

    iget v1, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->pendingSize:I

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->lzma:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->encodeForLZMA2()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2OutputStream;->writeChunk()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_40} :catch_41

    goto :goto_26

    :catch_41
    move-exception v0

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2OutputStream;->exception:Ljava/io/IOException;

    throw v0

    :cond_45
    return-void
.end method
