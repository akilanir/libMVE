.class abstract Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMACoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "LengthCoder"
.end annotation


# static fields
.field static final HIGH_SYMBOLS:I = 0x100

.field static final LOW_SYMBOLS:I = 0x8

.field static final MID_SYMBOLS:I = 0x8


# instance fields
.field final choice:[S

.field final high:[S

.field final low:[[S

.field final mid:[[S

.field private final this$0:Lorg/tukaani/xz/lzma/LZMACoder;


# direct methods
.method constructor <init>(Lorg/tukaani/xz/lzma/LZMACoder;)V
    .registers 6

    const/16 v3, 0x10

    const/16 v2, 0x8

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->this$0:Lorg/tukaani/xz/lzma/LZMACoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->choice:[S

    filled-new-array {v3, v2}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->low:[[S

    filled-new-array {v3, v2}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->mid:[[S

    const/16 v0, 0x100

    new-array v0, v0, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->high:[S

    return-void
.end method


# virtual methods
.method reset()V
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->choice:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    move v0, v1

    :goto_7
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->low:[[S

    array-length v2, v2

    if-ge v0, v2, :cond_16

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->low:[[S

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_16
    :goto_16
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->low:[[S

    array-length v0, v0

    if-ge v1, v0, :cond_25

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->mid:[[S

    aget-object v0, v0, v1

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    :cond_25
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;->high:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    return-void
.end method
