.class Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;
.super Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMADecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LengthDecoder"
.end annotation


# instance fields
.field private final this$0:Lorg/tukaani/xz/lzma/LZMADecoder;


# direct methods
.method private constructor <init>(Lorg/tukaani/xz/lzma/LZMADecoder;)V
    .registers 2

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;-><init>(Lorg/tukaani/xz/lzma/LZMACoder;)V

    return-void
.end method

.method constructor <init>(Lorg/tukaani/xz/lzma/LZMADecoder;Lorg/tukaani/xz/lzma/LZMADecoder$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;-><init>(Lorg/tukaani/xz/lzma/LZMADecoder;)V

    return-void
.end method


# virtual methods
.method decode(I)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->choice:[S

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->low:[[S

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBitTree([S)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    :goto_1f
    return v0

    :cond_20
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->choice:[S

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->mid:[[S

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBitTree([S)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x8

    goto :goto_1f

    :cond_42
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->this$0:Lorg/tukaani/xz/lzma/LZMADecoder;

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;

    move-result-object v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->high:[S

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBitTree([S)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x8

    goto :goto_1f
.end method
