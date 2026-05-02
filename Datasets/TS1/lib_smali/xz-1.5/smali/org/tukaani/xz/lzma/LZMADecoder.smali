.class public final Lorg/tukaani/xz/lzma/LZMADecoder;
.super Lorg/tukaani/xz/lzma/LZMACoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tukaani/xz/lzma/LZMADecoder$1;,
        Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;,
        Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;
    }
.end annotation


# instance fields
.field private final literalDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

.field private final lz:Lorg/tukaani/xz/lz/LZDecoder;

.field private final matchLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

.field private final rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

.field private final repLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;


# direct methods
.method public constructor <init>(Lorg/tukaani/xz/lz/LZDecoder;Lorg/tukaani/xz/rangecoder/RangeDecoder;III)V
    .registers 8

    const/4 v1, 0x0

    invoke-direct {p0, p5}, Lorg/tukaani/xz/lzma/LZMACoder;-><init>(I)V

    new-instance v0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-direct {v0, p0, v1}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;-><init>(Lorg/tukaani/xz/lzma/LZMADecoder;Lorg/tukaani/xz/lzma/LZMADecoder$1;)V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->matchLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    new-instance v0, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-direct {v0, p0, v1}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;-><init>(Lorg/tukaani/xz/lzma/LZMADecoder;Lorg/tukaani/xz/lzma/LZMADecoder$1;)V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->repLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    iput-object p1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    iput-object p2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    new-instance v0, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-direct {v0, p0, p3, p4}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;-><init>(Lorg/tukaani/xz/lzma/LZMADecoder;II)V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->literalDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-virtual {p0}, Lorg/tukaani/xz/lzma/LZMADecoder;->reset()V

    return-void
.end method

.method static access$200(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/lz/LZDecoder;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    return-object v0
.end method

.method static access$400(Lorg/tukaani/xz/lzma/LZMADecoder;)Lorg/tukaani/xz/rangecoder/RangeDecoder;
    .registers 2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    return-object v0
.end method

.method private decodeMatch(I)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->updateMatch()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    const/4 v1, 0x3

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v2, v2, v4

    aput v2, v0, v1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v1, v1, v3

    aput v1, v0, v4

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v1, v1, v6

    aput v1, v0, v3

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->matchLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->decode(I)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->distSlots:[[S

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->getDistState(I)I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBitTree([S)I

    move-result v1

    const/4 v2, 0x4

    if-ge v1, v2, :cond_3d

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aput v1, v2, v6

    :goto_3c
    return v0

    :cond_3d
    shr-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, -0x1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    and-int/lit8 v4, v1, 0x1

    or-int/lit8 v4, v4, 0x2

    shl-int/2addr v4, v2

    aput v4, v3, v6

    const/16 v3, 0xe

    if-ge v1, v3, :cond_62

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v3, v2, v6

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->distSpecial:[[S

    add-int/lit8 v1, v1, -0x4

    aget-object v1, v5, v1

    invoke-virtual {v4, v1}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeReverseBitTree([S)I

    move-result v1

    or-int/2addr v1, v3

    aput v1, v2, v6

    goto :goto_3c

    :cond_62
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v3, v1, v6

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    add-int/lit8 v2, v2, -0x4

    invoke-virtual {v4, v2}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeDirectBits(I)I

    move-result v2

    shl-int/lit8 v2, v2, 0x4

    or-int/2addr v2, v3

    aput v2, v1, v6

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v2, v1, v6

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->distAlign:[S

    invoke-virtual {v3, v4}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeReverseBitTree([S)I

    move-result v3

    or-int/2addr v2, v3

    aput v2, v1, v6

    goto :goto_3c
.end method

.method private decodeRepMatch(I)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v6, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v1, 0x1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isRep0:[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_2d

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isRep0Long:[[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v0, v2, p1}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_4d

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->updateShortRep()V

    move v0, v1

    :goto_2c
    return v0

    :cond_2d
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isRep1:[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_59

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v0, v0, v1

    :goto_41
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v3, v3, v5

    aput v3, v2, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aput v0, v1, v5

    :cond_4d
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->updateLongRep()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->repLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-virtual {v0, p1}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->decode(I)I

    move-result v0

    goto :goto_2c

    :cond_59
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isRep2:[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v0

    if-nez v0, :cond_76

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v0, v0, v4

    :goto_6d
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v3, v3, v1

    aput v3, v2, v4

    goto :goto_41

    :cond_76
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v0, v0, v6

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v3, v3, v4

    aput v3, v2, v6

    goto :goto_6d
.end method


# virtual methods
.method public decode()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZDecoder;->repeatPending()V

    :goto_5
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZDecoder;->hasSpace()Z

    move-result v0

    if-eqz v0, :cond_52

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZDecoder;->getPos()I

    move-result v0

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->posMask:I

    and-int/2addr v0, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isMatch:[[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v1, v2, v0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v1

    if-nez v1, :cond_2e

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->literalDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->decode()V

    goto :goto_5

    :cond_2e
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->isRep:[S

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->get()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->decodeBit([SI)I

    move-result v1

    if-nez v1, :cond_4d

    invoke-direct {p0, v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->decodeMatch(I)I

    move-result v0

    :goto_42
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->lz:Lorg/tukaani/xz/lz/LZDecoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    invoke-virtual {v1, v2, v0}, Lorg/tukaani/xz/lz/LZDecoder;->repeat(II)V

    goto :goto_5

    :cond_4d
    invoke-direct {p0, v0}, Lorg/tukaani/xz/lzma/LZMADecoder;->decodeRepMatch(I)I

    move-result v0

    goto :goto_42

    :cond_52
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->rc:Lorg/tukaani/xz/rangecoder/RangeDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/rangecoder/RangeDecoder;->normalize()V

    return-void
.end method

.method public endMarkerDetected()Z
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->reps:[I

    aget v1, v1, v0

    const/4 v2, -0x1

    if-ne v1, v2, :cond_9

    const/4 v0, 0x1

    :cond_9
    return v0
.end method

.method public reset()V
    .registers 2

    invoke-super {p0}, Lorg/tukaani/xz/lzma/LZMACoder;->reset()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->literalDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LiteralDecoder;->reset()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->matchLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->reset()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMADecoder;->repLenDecoder:Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/LZMADecoder$LengthDecoder;->reset()V

    return-void
.end method
