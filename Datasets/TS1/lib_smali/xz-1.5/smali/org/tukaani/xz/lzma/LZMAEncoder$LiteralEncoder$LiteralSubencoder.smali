.class Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;
.super Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LiteralSubencoder"
.end annotation


# instance fields
.field private final this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;


# direct methods
.method private constructor <init>(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)V
    .registers 2

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder;-><init>(Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;)V

    return-void
.end method

.method constructor <init>(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;Lorg/tukaani/xz/lzma/LZMAEncoder$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;-><init>(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)V

    return-void
.end method


# virtual methods
.method encode()V
    .registers 10

    const/high16 v7, 0x10000

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v0

    iget-object v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v1

    iget v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v0

    or-int/lit16 v0, v0, 0x100

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v1

    iget-object v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->isLiteral()Z

    move-result v1

    if-eqz v1, :cond_4b

    :cond_26
    ushr-int/lit8 v1, v0, 0x8

    ushr-int/lit8 v2, v0, 0x7

    and-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v3

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v3

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->probs:[S

    invoke-virtual {v3, v4, v1, v2}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    shl-int/lit8 v0, v0, 0x1

    if-lt v0, v7, :cond_26

    :goto_3f
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v0

    iget-object v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    return-void

    :cond_4b
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v1

    iget-object v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v2}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v2

    iget-object v2, v2, Lorg/tukaani/xz/lzma/LZMAEncoder;->reps:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v3

    iget v3, v3, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v2

    const/16 v1, 0x100

    move v8, v1

    move v1, v2

    move v2, v0

    move v0, v8

    :cond_73
    shl-int/lit8 v1, v1, 0x1

    and-int v3, v1, v0

    add-int/2addr v3, v0

    ushr-int/lit8 v4, v2, 0x8

    add-int/2addr v3, v4

    ushr-int/lit8 v4, v2, 0x7

    and-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->this$1:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    invoke-static {v5}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;

    move-result-object v5

    invoke-static {v5}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v5

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->probs:[S

    invoke-virtual {v5, v6, v3, v4}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    shl-int/lit8 v2, v2, 0x1

    xor-int v3, v1, v2

    xor-int/lit8 v3, v3, -0x1

    and-int/2addr v0, v3

    if-lt v2, v7, :cond_73

    goto :goto_3f
.end method

.method getMatchedPrice(II)I
    .registers 9

    const/4 v1, 0x0

    const/16 v0, 0x100

    or-int/lit16 v2, p1, 0x100

    :cond_5
    shl-int/lit8 p2, p2, 0x1

    and-int v3, p2, v0

    add-int/2addr v3, v0

    ushr-int/lit8 v4, v2, 0x8

    add-int/2addr v3, v4

    ushr-int/lit8 v4, v2, 0x7

    and-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->probs:[S

    aget-short v3, v5, v3

    invoke-static {v3, v4}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v3

    add-int/2addr v1, v3

    shl-int/lit8 v2, v2, 0x1

    xor-int v3, p2, v2

    xor-int/lit8 v3, v3, -0x1

    and-int/2addr v0, v3

    const/high16 v3, 0x10000

    if-lt v2, v3, :cond_5

    return v1
.end method

.method getNormalPrice(I)I
    .registers 7

    const/4 v0, 0x0

    or-int/lit16 v1, p1, 0x100

    :cond_3
    ushr-int/lit8 v2, v1, 0x8

    ushr-int/lit8 v3, v1, 0x7

    and-int/lit8 v3, v3, 0x1

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->probs:[S

    aget-short v2, v4, v2

    invoke-static {v2, v3}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v2

    add-int/2addr v0, v2

    shl-int/lit8 v1, v1, 0x1

    const/high16 v2, 0x10000

    if-lt v1, v2, :cond_3

    return v0
.end method
