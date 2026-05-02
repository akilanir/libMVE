.class Lorg/tukaani/xz/LZMA2Encoder;
.super Lorg/tukaani/xz/LZMA2Coder;

# interfaces
.implements Lorg/tukaani/xz/FilterEncoder;


# instance fields
.field private final options:Lorg/tukaani/xz/LZMA2Options;

.field private final props:[B


# direct methods
.method constructor <init>(Lorg/tukaani/xz/LZMA2Options;)V
    .registers 5

    const/4 v2, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/LZMA2Coder;-><init>()V

    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2Encoder;->props:[B

    invoke-virtual {p1}, Lorg/tukaani/xz/LZMA2Options;->getPresetDict()[B

    move-result-object v0

    if-eqz v0, :cond_17

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "XZ doesn\'t support a preset dictionary for now"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_17
    invoke-virtual {p1}, Lorg/tukaani/xz/LZMA2Options;->getMode()I

    move-result v0

    if-nez v0, :cond_2a

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2Encoder;->props:[B

    aput-byte v2, v0, v2

    :goto_21
    invoke-virtual {p1}, Lorg/tukaani/xz/LZMA2Options;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/tukaani/xz/LZMA2Options;

    iput-object v0, p0, Lorg/tukaani/xz/LZMA2Encoder;->options:Lorg/tukaani/xz/LZMA2Options;

    return-void

    :cond_2a
    invoke-virtual {p1}, Lorg/tukaani/xz/LZMA2Options;->getDictSize()I

    move-result v0

    const/16 v1, 0x1000

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/LZMA2Encoder;->props:[B

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->getDistSlot(I)I

    move-result v0

    add-int/lit8 v0, v0, -0x17

    int-to-byte v0, v0

    aput-byte v0, v1, v2

    goto :goto_21
.end method


# virtual methods
.method public getFilterID()J
    .registers 3

    const-wide/16 v0, 0x21

    return-wide v0
.end method

.method public getFilterProps()[B
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2Encoder;->props:[B

    return-object v0
.end method

.method public getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/LZMA2Encoder;->options:Lorg/tukaani/xz/LZMA2Options;

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/LZMA2Options;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;

    move-result-object v0

    return-object v0
.end method

.method public supportsFlushing()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
