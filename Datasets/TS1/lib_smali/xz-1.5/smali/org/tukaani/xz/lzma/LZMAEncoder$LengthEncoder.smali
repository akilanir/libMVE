.class Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;
.super Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMAEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LengthEncoder"
.end annotation


# static fields
.field private static final PRICE_UPDATE_INTERVAL:I = 0x20


# instance fields
.field private final counters:[I

.field private final prices:[[I

.field private final this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;


# direct methods
.method constructor <init>(Lorg/tukaani/xz/lzma/LZMAEncoder;II)V
    .registers 7

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-direct {p0, p1}, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;-><init>(Lorg/tukaani/xz/lzma/LZMACoder;)V

    const/4 v0, 0x1

    shl-int/2addr v0, p2

    new-array v1, v0, [I

    iput-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    add-int/lit8 v1, p3, -0x2

    add-int/lit8 v1, v1, 0x1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    return-void
.end method

.method private updatePrices(I)V
    .registers 10

    const/4 v7, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    aget-short v0, v0, v1

    invoke-static {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v2

    move v0, v1

    :goto_b
    const/16 v3, 0x8

    if-ge v0, v3, :cond_21

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    aget-object v3, v3, p1

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->low:[[S

    aget-object v4, v4, p1

    invoke-static {v4, v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitTreePrice([SI)I

    move-result v4

    add-int/2addr v4, v2

    aput v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_21
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    aget-short v2, v2, v1

    invoke-static {v2, v7}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v2

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    aget-short v3, v3, v7

    invoke-static {v3, v1}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v1

    :goto_31
    const/16 v3, 0x10

    if-ge v0, v3, :cond_4b

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    aget-object v3, v3, p1

    add-int v4, v2, v1

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->mid:[[S

    aget-object v5, v5, p1

    add-int/lit8 v6, v0, -0x8

    invoke-static {v5, v6}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitTreePrice([SI)I

    move-result v5

    add-int/2addr v4, v5

    aput v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    :cond_4b
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    aget-short v1, v1, v7

    invoke-static {v1, v7}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v1

    :goto_53
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    aget-object v3, v3, p1

    array-length v3, v3

    if-ge v0, v3, :cond_70

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    aget-object v3, v3, p1

    add-int v4, v2, v1

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->high:[S

    add-int/lit8 v6, v0, -0x8

    add-int/lit8 v6, v6, -0x8

    invoke-static {v5, v6}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitTreePrice([SI)I

    move-result v5

    add-int/2addr v4, v5

    aput v4, v3, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_53

    :cond_70
    return-void
.end method


# virtual methods
.method encode(II)V
    .registers 9

    const/16 v5, 0x8

    const/4 v4, 0x1

    const/4 v3, 0x0

    add-int/lit8 v0, p1, -0x2

    if-ge v0, v5, :cond_29

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    invoke-virtual {v1, v2, v3, v3}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->low:[[S

    aget-object v2, v2, p2

    invoke-virtual {v1, v2, v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBitTree([SI)V

    :goto_20
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    aget v1, v0, p2

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, p2

    return-void

    :cond_29
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    invoke-virtual {v1, v2, v3, v4}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    add-int/lit8 v0, v0, -0x8

    if-ge v0, v5, :cond_51

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    invoke-virtual {v1, v2, v4, v3}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->mid:[[S

    aget-object v2, v2, p2

    invoke-virtual {v1, v2, v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBitTree([SI)V

    goto :goto_20

    :cond_51
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->choice:[S

    invoke-virtual {v1, v2, v4, v4}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBit([SII)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-static {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder;->access$200(Lorg/tukaani/xz/lzma/LZMAEncoder;)Lorg/tukaani/xz/rangecoder/RangeEncoder;

    move-result-object v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->high:[S

    add-int/lit8 v0, v0, -0x8

    invoke-virtual {v1, v2, v0}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->encodeBitTree([SI)V

    goto :goto_20
.end method

.method getPrice(II)I
    .registers 5

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->prices:[[I

    aget-object v0, v0, p2

    add-int/lit8 v1, p1, -0x2

    aget v0, v0, v1

    return v0
.end method

.method reset()V
    .registers 4

    const/4 v1, 0x0

    invoke-super {p0}, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->reset()V

    move v0, v1

    :goto_5
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    array-length v2, v2

    if-ge v0, v2, :cond_11

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_11
    return-void
.end method

.method updatePrices()V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    array-length v1, v1

    if-ge v0, v1, :cond_18

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    aget v1, v1, v0

    if-gtz v1, :cond_15

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->counters:[I

    const/16 v2, 0x20

    aput v2, v1, v0

    invoke-direct {p0, v0}, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->updatePrices(I)V

    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_18
    return-void
.end method
