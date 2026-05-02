.class Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;
.super Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/tukaani/xz/lzma/LZMAEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LiteralEncoder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;
    }
.end annotation


# static fields
.field static final $assertionsDisabled:Z


# instance fields
.field subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

.field private final this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->class$org$tukaani$xz$lzma$LZMAEncoder:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.lzma.LZMAEncoder"

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->class$org$tukaani$xz$lzma$LZMAEncoder:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->class$org$tukaani$xz$lzma$LZMAEncoder:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(Lorg/tukaani/xz/lzma/LZMAEncoder;II)V
    .registers 8

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    invoke-direct {p0, p1, p2, p3}, Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;-><init>(Lorg/tukaani/xz/lzma/LZMACoder;II)V

    const/4 v0, 0x1

    add-int v1, p2, p3

    shl-int/2addr v0, v1

    new-array v0, v0, [Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    const/4 v0, 0x0

    :goto_e
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    new-instance v2, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;-><init>(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;Lorg/tukaani/xz/lzma/LZMAEncoder$1;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_20
    return-void
.end method

.method static access$100(Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;)Lorg/tukaani/xz/lzma/LZMAEncoder;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    return-object v0
.end method


# virtual methods
.method encode()V
    .registers 4

    sget-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    if-gez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget-object v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget-object v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v1}, Lorg/tukaani/xz/lz/LZEncoder;->getPos()I

    move-result v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget v2, v2, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getSubcoderIndex(II)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    aget-object v0, v1, v0

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->encode()V

    return-void
.end method

.method encodeInit()V
    .registers 3

    sget-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->readAhead:I

    if-gez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->encode()V

    return-void
.end method

.method getPrice(IIIILorg/tukaani/xz/lzma/State;)I
    .registers 9

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget-object v0, v0, Lorg/tukaani/xz/lzma/LZMAEncoder;->isMatch:[[S

    invoke-virtual {p5}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v1

    aget-object v0, v0, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->this$0:Lorg/tukaani/xz/lzma/LZMAEncoder;

    iget v1, v1, Lorg/tukaani/xz/lzma/LZMAEncoder;->posMask:I

    and-int/2addr v1, p4

    aget-short v0, v0, v1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/tukaani/xz/rangecoder/RangeEncoder;->getBitPrice(II)I

    move-result v1

    invoke-virtual {p0, p3, p4}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getSubcoderIndex(II)I

    move-result v0

    invoke-virtual {p5}, Lorg/tukaani/xz/lzma/State;->isLiteral()Z

    move-result v2

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    aget-object v0, v2, v0

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->getNormalPrice(I)I

    move-result v0

    :goto_28
    add-int/2addr v0, v1

    return v0

    :cond_2a
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    aget-object v0, v2, v0

    invoke-virtual {v0, p1, p2}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->getMatchedPrice(II)I

    move-result v0

    goto :goto_28
.end method

.method reset()V
    .registers 3

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    array-length v1, v1

    if-ge v0, v1, :cond_10

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->subencoders:[Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder$LiteralSubencoder;->reset()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_10
    return-void
.end method
