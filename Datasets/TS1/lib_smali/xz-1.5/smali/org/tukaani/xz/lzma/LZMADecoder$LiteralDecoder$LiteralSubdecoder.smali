.class Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;
.super Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LiteralSubdecoder"
.end annotation


# instance fields
.field private final this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;


# direct methods
.method private constructor <init>(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)V
    .registers 2

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder$LiteralSubcoder;-><init>(Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;)V

    return-void
.end method

.method constructor <init>(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;Lorg/tukaani/xz/lzma/LZMADecoder$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;-><init>(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)V

    return-void
.end method


# virtual methods
.method decode()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v1, 0x100

    const/4 v0, 0x1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v2}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v2

    iget-object v2, v2, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->isLiteral()Z

    move-result v2

    if-eqz v2, :cond_41

    :cond_11
    shl-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v3

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v3

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->probs:[S

    invoke-virtual {v3, v4, v0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    or-int/2addr v0, v2

    if-lt v0, v1, :cond_11

    move v3, v0

    :goto_27
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v0

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$200(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/lz/LZDecoder;

    move-result-object v0

    int-to-byte v1, v3

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/lz/LZDecoder;->putByte(B)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v0

    iget-object v0, v0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    return-void

    :cond_41
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v2}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v2

    invoke-static {v2}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$200(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/lz/LZDecoder;

    move-result-object v2

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v3}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v3

    iget-object v3, v3, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    const/4 v4, 0x0

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Lorg/tukaani/xz/lz/LZDecoder;->getByte(I)I

    move-result v2

    move v3, v0

    move v0, v1

    :cond_5c
    shl-int/lit8 v2, v2, 0x1

    and-int v4, v2, v0

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->this$1:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-static {v5}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->access$300(Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;)Lorg/tukaani/xz/lzma/LZMADecoder;

    move-result-object v5

    invoke-static {v5}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v5

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder$LiteralSubdecoder;->probs:[S

    add-int v7, v0, v4

    add-int/2addr v7, v3

    invoke-virtual {v5, v6, v7}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v5

    shl-int/lit8 v3, v3, 0x1

    or-int/2addr v3, v5

    rsub-int/lit8 v5, v5, 0x0

    xor-int/lit8 v4, v4, -0x1

    xor-int/2addr v4, v5

    and-int/2addr v0, v4

    if-lt v3, v1, :cond_5c

    goto :goto_27
.end method
