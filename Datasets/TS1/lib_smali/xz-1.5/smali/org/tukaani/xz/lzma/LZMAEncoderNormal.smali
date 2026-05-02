.class final Lorg/tukaani/xz/lzma/LZMAEncoderNormal;
.super Lorg/tukaani/xz/lzma/LZMAEncoder;


# static fields
.field static final $assertionsDisabled:Z

.field private static EXTRA_SIZE_AFTER:I = 0x0

.field private static EXTRA_SIZE_BEFORE:I = 0x0

.field private static final OPTS:I = 0x1000

.field static class$org$tukaani$xz$lzma$LZMAEncoderNormal:Ljava/lang/Class;


# instance fields
.field private matches:Lorg/tukaani/xz/lz/Matches;

.field private final nextState:Lorg/tukaani/xz/lzma/State;

.field private optCur:I

.field private optEnd:I

.field private final opts:[Lorg/tukaani/xz/lzma/Optimum;

.field private final repLens:[I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v1, 0x1000

    sget-object v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->class$org$tukaani$xz$lzma$LZMAEncoderNormal:Ljava/lang/Class;

    if-nez v0, :cond_1c

    const-string v0, "org.tukaani.xz.lzma.LZMAEncoderNormal"

    invoke-static {v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->class$org$tukaani$xz$lzma$LZMAEncoderNormal:Ljava/lang/Class;

    :goto_e
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    :goto_15
    sput-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->$assertionsDisabled:Z

    sput v1, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_BEFORE:I

    sput v1, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_AFTER:I

    return-void

    :cond_1c
    sget-object v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->class$org$tukaani$xz$lzma$LZMAEncoderNormal:Ljava/lang/Class;

    goto :goto_e

    :cond_1f
    const/4 v0, 0x0

    goto :goto_15
.end method

.method constructor <init>(Lorg/tukaani/xz/rangecoder/RangeEncoder;IIIIIIII)V
    .registers 18

    sget v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_BEFORE:I

    invoke-static {p6, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    sget v2, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_AFTER:I

    const/16 v4, 0x111

    move v0, p5

    move v3, p7

    move/from16 v5, p8

    move/from16 v6, p9

    invoke-static/range {v0 .. v6}, Lorg/tukaani/xz/lz/LZEncoder;->getInstance(IIIIIII)Lorg/tukaani/xz/lz/LZEncoder;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p7

    invoke-direct/range {v0 .. v7}, Lorg/tukaani/xz/lzma/LZMAEncoder;-><init>(Lorg/tukaani/xz/rangecoder/RangeEncoder;Lorg/tukaani/xz/lz/LZEncoder;IIIII)V

    const/16 v0, 0x1000

    new-array v0, v0, [Lorg/tukaani/xz/lzma/Optimum;

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    new-instance v0, Lorg/tukaani/xz/lzma/State;

    invoke-direct {v0}, Lorg/tukaani/xz/lzma/State;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    const/4 v0, 0x0

    :goto_37
    const/16 v1, 0x1000

    if-ge v0, v1, :cond_47

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    new-instance v2, Lorg/tukaani/xz/lzma/Optimum;

    invoke-direct {v2}, Lorg/tukaani/xz/lzma/Optimum;-><init>()V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_37

    :cond_47
    return-void
.end method

.method private calc1BytePrices(IIII)V
    .registers 15

    const/4 v9, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0, v7}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v2, v2, v7

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v3

    iget v8, v0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->literalEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v3, v6}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v3

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v4, v4, v5

    iget-object v5, v4, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    move v4, p1

    invoke-virtual/range {v0 .. v5}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getPrice(IIIILorg/tukaani/xz/lzma/State;)I

    move-result v0

    add-int v3, v8, v0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v4, v4, 0x1

    aget-object v0, v0, v4

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v3, v0, :cond_fe

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v4, v4, 0x1

    aget-object v0, v0, v4

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    const/4 v5, -0x1

    invoke-virtual {v0, v3, v4, v5}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    move v0, v6

    :goto_55
    if-ne v2, v1, :cond_97

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v5, v5, 0x1

    aget-object v4, v4, v5

    iget v4, v4, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    if-eq v4, v5, :cond_71

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v5, v5, 0x1

    aget-object v4, v4, v5

    iget v4, v4, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    if-eqz v4, :cond_97

    :cond_71
    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v4, v4, v5

    iget-object v4, v4, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, p4, v4, p2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getShortRepPrice(ILorg/tukaani/xz/lzma/State;I)I

    move-result v4

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v8, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v8, v8, 0x1

    aget-object v5, v5, v8

    iget v5, v5, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-gt v4, v5, :cond_97

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v5, v5, 0x1

    aget-object v0, v0, v5

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    invoke-virtual {v0, v4, v5, v7}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    move v0, v6

    :cond_97
    if-nez v0, :cond_fd

    if-eq v2, v1, :cond_fd

    if-le p3, v9, :cond_fd

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    add-int/lit8 v1, p3, -0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v4

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v2, v2, v7

    invoke-virtual {v1, v6, v2, v0}, Lorg/tukaani/xz/lz/LZEncoder;->getMatchLen(III)I

    move-result v0

    if-lt v0, v9, :cond_fd

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v4

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    add-int/lit8 v1, p1, 0x1

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->posMask:I

    and-int/2addr v1, v2

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v7, v0, v2, v1}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getLongRepAndLenPrice(IILorg/tukaani/xz/lzma/State;I)I

    move-result v1

    add-int/2addr v1, v3

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    :goto_da
    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v2, v0, :cond_ec

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    goto :goto_da

    :cond_ec
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v2, v2, v0

    iget v2, v2, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v1, v2, :cond_fd

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v2, v0

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    invoke-virtual {v0, v1, v2, v7}, Lorg/tukaani/xz/lzma/Optimum;->set2(III)V

    :cond_fd
    return-void

    :cond_fe
    move v0, v7

    goto/16 :goto_55
.end method

.method private calcLongRepPrices(IIII)I
    .registers 18

    const/4 v7, 0x2

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    move/from16 v0, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v10

    const/4 v1, 0x0

    move v9, v1

    move v1, v7

    :goto_c
    const/4 v2, 0x4

    if-ge v9, v2, :cond_110

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v3, v3, v4

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v3, v3, v9

    invoke-virtual {v2, v3, v10}, Lorg/tukaani/xz/lz/LZEncoder;->getMatchLen(II)I

    move-result v8

    const/4 v2, 0x2

    if-ge v8, v2, :cond_28

    move v7, v1

    :cond_23
    :goto_23
    add-int/lit8 v1, v9, 0x1

    move v9, v1

    move v1, v7

    goto :goto_c

    :cond_28
    :goto_28
    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/2addr v3, v8

    if-ge v2, v3, :cond_3d

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    goto :goto_28

    :cond_3d
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    move/from16 v0, p4

    invoke-virtual {p0, v0, v9, v2, p2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getLongRepPrice(IILorg/tukaani/xz/lzma/State;I)I

    move-result v3

    move v2, v8

    :goto_4c
    const/4 v4, 0x2

    if-lt v2, v4, :cond_70

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLenEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;

    invoke-virtual {v4, v2, p2}, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->getPrice(II)I

    move-result v4

    add-int/2addr v4, v3

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/2addr v6, v2

    aget-object v5, v5, v6

    iget v5, v5, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v4, v5, :cond_6d

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/2addr v6, v2

    aget-object v5, v5, v6

    iget v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    invoke-virtual {v5, v4, v6, v9}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    :cond_6d
    add-int/lit8 v2, v2, -0x1

    goto :goto_4c

    :cond_70
    if-nez v9, :cond_111

    add-int/lit8 v1, v8, 0x1

    move v7, v1

    :goto_75
    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    sub-int v2, p3, v8

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    add-int/lit8 v4, v8, 0x1

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v5, v5, v6

    iget-object v5, v5, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v5, v5, v9

    invoke-virtual {v2, v4, v5, v1}, Lorg/tukaani/xz/lz/LZEncoder;->getMatchLen(III)I

    move-result v11

    const/4 v1, 0x2

    if-lt v11, v1, :cond_23

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLenEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;

    invoke-virtual {v1, v8, p2}, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->getPrice(II)I

    move-result v1

    add-int v12, v3, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->updateLongRep()V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v2, 0x0

    invoke-virtual {v1, v8, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(II)I

    move-result v2

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v3

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v4, 0x1

    invoke-virtual {v1, v8, v4}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(II)I

    move-result v4

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->literalEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    add-int v5, p1, v8

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual/range {v1 .. v6}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getPrice(IIIILorg/tukaani/xz/lzma/State;)I

    move-result v1

    add-int/2addr v1, v12

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    add-int v2, p1, v8

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->posMask:I

    and-int/2addr v2, v3

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v3, v11, v4, v2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getLongRepAndLenPrice(IILorg/tukaani/xz/lzma/State;I)I

    move-result v2

    add-int/2addr v2, v1

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/2addr v1, v8

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v11

    :goto_e8
    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v3, v1, :cond_fa

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    goto :goto_e8

    :cond_fa
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v3, v3, v1

    iget v3, v3, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v2, v3, :cond_23

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v3, v1

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    const/4 v6, 0x0

    move v4, v9

    move v5, v8

    invoke-virtual/range {v1 .. v6}, Lorg/tukaani/xz/lzma/Optimum;->set3(IIIII)V

    goto/16 :goto_23

    :cond_110
    return v1

    :cond_111
    move v7, v1

    goto/16 :goto_75
.end method

.method private calcNormalMatchPrices(IIIII)V
    .registers 18

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    if-le v1, p3, :cond_36

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    const/4 v2, 0x0

    iput v2, v1, Lorg/tukaani/xz/lz/Matches;->count:I

    :goto_13
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    aget v1, v1, v2

    if-ge v1, p3, :cond_28

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v1, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lorg/tukaani/xz/lz/Matches;->count:I

    goto :goto_13

    :cond_28
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v3, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v4, v3, 0x1

    iput v4, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    aput p3, v1, v3

    :cond_36
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    move/from16 v0, p5

    if-ge v1, v0, :cond_47

    :goto_46
    return-void

    :cond_47
    :goto_47
    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v3, v3, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v4, v4, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v4, v4, -0x1

    aget v3, v3, v4

    add-int/2addr v2, v3

    if-ge v1, v2, :cond_68

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    goto :goto_47

    :cond_68
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    move/from16 v0, p4

    invoke-virtual {p0, v0, v1}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getNormalMatchPrice(ILorg/tukaani/xz/lzma/State;)I

    move-result v8

    const/4 v1, 0x0

    :goto_77
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v2, v2, Lorg/tukaani/xz/lz/Matches;->len:[I

    aget v2, v2, v1

    move/from16 v0, p5

    if-le v0, v2, :cond_84

    add-int/lit8 v1, v1, 0x1

    goto :goto_77

    :cond_84
    move v7, v1

    :goto_85
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->dist:[I

    aget v9, v1, v7

    move/from16 v0, p5

    invoke-virtual {p0, v8, v9, v0, p2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getMatchAndLenPrice(IIII)I

    move-result v10

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int v2, v2, p5

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v10, v1, :cond_ac

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int v2, v2, p5

    aget-object v1, v1, v2

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v3, v9, 0x4

    invoke-virtual {v1, v10, v2, v3}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    :cond_ac
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->len:[I

    aget v1, v1, v7

    move/from16 v0, p5

    if-eq v0, v1, :cond_bb

    move v1, v7

    :cond_b7
    add-int/lit8 p5, p5, 0x1

    move v7, v1

    goto :goto_85

    :cond_bb
    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    sub-int v2, p3, p5

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    add-int/lit8 v3, p5, 0x1

    invoke-virtual {v2, v3, v9, v1}, Lorg/tukaani/xz/lz/LZEncoder;->getMatchLen(III)I

    move-result v11

    const/4 v1, 0x2

    if-lt v11, v1, :cond_149

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->updateMatch()V

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v2, 0x0

    move/from16 v0, p5

    invoke-virtual {v1, v0, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(II)I

    move-result v2

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v3

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    const/4 v4, 0x1

    move/from16 v0, p5

    invoke-virtual {v1, v0, v4}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(II)I

    move-result v4

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->literalEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    add-int v5, p1, p5

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual/range {v1 .. v6}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getPrice(IIIILorg/tukaani/xz/lzma/State;)I

    move-result v1

    add-int/2addr v1, v10

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    add-int v2, p1, p5

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->posMask:I

    and-int/2addr v2, v3

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->nextState:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v3, v11, v4, v2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getLongRepAndLenPrice(IILorg/tukaani/xz/lzma/State;I)I

    move-result v2

    add-int/2addr v2, v1

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int v1, v1, p5

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v1, v11

    :goto_121
    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v3, v1, :cond_133

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    goto :goto_121

    :cond_133
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v3, v3, v1

    iget v3, v3, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v2, v3, :cond_149

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v3, v1

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v4, v9, 0x4

    const/4 v6, 0x0

    move/from16 v5, p5

    invoke-virtual/range {v1 .. v6}, Lorg/tukaani/xz/lzma/Optimum;->set3(IIIII)V

    :cond_149
    add-int/lit8 v1, v7, 0x1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    if-ne v1, v2, :cond_b7

    goto/16 :goto_46
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

.method private convertOpts()I
    .registers 5

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    :cond_c
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v1, v2

    iget-boolean v1, v2, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    if-eqz v1, :cond_6c

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v0

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iput v3, v1, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v0

    const/4 v3, -0x1

    iput v3, v1, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    add-int/lit8 v1, v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget-boolean v0, v2, Lorg/tukaani/xz/lzma/Optimum;->hasPrev2:Z

    if-eqz v0, :cond_42

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v1

    add-int/lit8 v3, v1, 0x1

    iput v3, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v1

    iget v3, v2, Lorg/tukaani/xz/lzma/Optimum;->backPrev2:I

    iput v3, v0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    iput v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget v0, v2, Lorg/tukaani/xz/lzma/Optimum;->optPrev2:I

    move v1, v0

    :cond_42
    :goto_42
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v1

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v2, v2, v1

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iput v3, v2, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    if-gtz v1, :cond_c

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    return v0

    :cond_6c
    move v1, v0

    goto :goto_42
.end method

.method static getMemoryUsage(III)I
    .registers 6

    sget v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_BEFORE:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    sget v1, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->EXTRA_SIZE_AFTER:I

    const/16 v2, 0x111

    invoke-static {p0, v0, v1, v2, p2}, Lorg/tukaani/xz/lz/LZEncoder;->getMemoryUsage(IIIII)I

    move-result v0

    add-int/lit16 v0, v0, 0x100

    return v0
.end method

.method private updateOptStateAndReps()V
    .registers 9

    const/4 v1, 0x1

    const/4 v7, 0x4

    const/4 v6, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v2

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    sget-boolean v2, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->$assertionsDisabled:Z

    if-nez v2, :cond_19

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    if-lt v0, v2, :cond_19

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_19
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-boolean v2, v2, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    if-eqz v2, :cond_ab

    add-int/lit8 v0, v0, -0x1

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-boolean v2, v2, Lorg/tukaani/xz/lzma/Optimum;->hasPrev2:Z

    if-eqz v2, :cond_99

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v4, v4, v5

    iget v4, v4, Lorg/tukaani/xz/lzma/Optimum;->optPrev2:I

    aget-object v3, v3, v4

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2, v3}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget v2, v2, Lorg/tukaani/xz/lzma/Optimum;->backPrev2:I

    if-ge v2, v7, :cond_8d

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->updateLongRep()V

    :goto_5d
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    :goto_68
    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v2, v2, -0x1

    if-ne v0, v2, :cond_f0

    sget-boolean v1, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->$assertionsDisabled:Z

    if-nez v1, :cond_bd

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    if-eqz v1, :cond_bd

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_bd

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_8d
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2}, Lorg/tukaani/xz/lzma/State;->updateMatch()V

    goto :goto_5d

    :cond_99
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v3, v3, v0

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2, v3}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    goto :goto_5d

    :cond_ab
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v3, v3, v0

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v2, v3}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    goto :goto_68

    :cond_bd
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    if-nez v1, :cond_e4

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->updateShortRep()V

    :goto_d2
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v1, v0

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    invoke-static {v0, v6, v1, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_e3
    :goto_e3
    return-void

    :cond_e4
    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/State;->updateLiteral()V

    goto :goto_d2

    :cond_f0
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-boolean v2, v2, Lorg/tukaani/xz/lzma/Optimum;->prev1IsLiteral:Z

    if-eqz v2, :cond_14f

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-boolean v2, v2, Lorg/tukaani/xz/lzma/Optimum;->hasPrev2:Z

    if-eqz v2, :cond_14f

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v2

    iget v2, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev2:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v3

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->backPrev2:I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v3, v3, v4

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->updateLongRep()V

    move v3, v2

    move v2, v0

    :goto_121
    if-ge v2, v7, :cond_18a

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v4

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v4, v4, v3

    iget-object v4, v4, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v4, v4, v2

    aput v4, v0, v6

    move v0, v1

    :goto_136
    if-gt v0, v2, :cond_173

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v4

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v4, v4, v3

    iget-object v4, v4, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    add-int/lit8 v5, v0, -0x1

    aget v4, v4, v5

    aput v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_136

    :cond_14f
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget v2, v2, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    if-ge v2, v7, :cond_166

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v3, v3, v4

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->updateLongRep()V

    move v3, v0

    goto :goto_121

    :cond_166
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v3, v3, v4

    iget-object v3, v3, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v3}, Lorg/tukaani/xz/lzma/State;->updateMatch()V

    move v3, v0

    goto :goto_121

    :cond_173
    :goto_173
    if-ge v0, v7, :cond_e3

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    aget v2, v2, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_173

    :cond_18a
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v4

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    add-int/lit8 v2, v2, -0x4

    aput v2, v0, v6

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v3

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v2, v2, v3

    iget-object v2, v2, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    const/4 v3, 0x3

    invoke-static {v0, v6, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_e3
.end method


# virtual methods
.method getNextSymbol()I
    .registers 15

    const/4 v13, 0x4

    const/4 v12, -0x1

    const/4 v9, 0x1

    const/4 v11, 0x2

    const/4 v8, 0x0

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v0, v1, :cond_2b

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v1

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->optPrev:I

    iput v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v1, v1, v2

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    iput v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    :goto_2a
    return v0

    :cond_2b
    sget-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->$assertionsDisabled:Z

    if-nez v0, :cond_3b

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-eq v0, v1, :cond_3b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_3b
    iput v8, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iput v8, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    iput v12, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->readAhead:I

    if-ne v0, v12, :cond_4b

    invoke-virtual {p0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getMatches()Lorg/tukaani/xz/lz/Matches;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    :cond_4b
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZEncoder;->getAvail()I

    move-result v0

    const/16 v1, 0x111

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v2, v11, :cond_5b

    move v0, v9

    goto :goto_2a

    :cond_5b
    move v1, v8

    move v6, v8

    :goto_5d
    if-ge v1, v13, :cond_88

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->reps:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getMatchLen(II)I

    move-result v3

    aput v3, v0, v1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v1

    if-ge v0, v11, :cond_7c

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aput v8, v0, v1

    move v0, v6

    :goto_78
    add-int/lit8 v1, v1, 0x1

    move v6, v0

    goto :goto_5d

    :cond_7c
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v3, v3, v6

    if-le v0, v3, :cond_274

    move v0, v1

    goto :goto_78

    :cond_88
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v6

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    if-lt v0, v1, :cond_a0

    iput v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v6

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->skip(I)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v6

    goto :goto_2a

    :cond_a0
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v0, v0, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lez v0, :cond_271

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v0, v0, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v1, v1, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v1, v1, Lorg/tukaani/xz/lz/Matches;->dist:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v2, v2, -0x1

    aget v1, v1, v2

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    if-lt v0, v2, :cond_cd

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->skip(I)V

    goto/16 :goto_2a

    :cond_cd
    move v7, v0

    :goto_ce
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0, v8}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->reps:[I

    aget v2, v2, v8

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v2

    if-ge v7, v11, :cond_ed

    if-eq v1, v2, :cond_ed

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v6

    if-ge v0, v11, :cond_ed

    move v0, v9

    goto/16 :goto_2a

    :cond_ed
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZEncoder;->getPos()I

    move-result v4

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->posMask:I

    and-int v10, v4, v0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0, v9}, Lorg/tukaani/xz/lz/LZEncoder;->getByte(I)I

    move-result v3

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->literalEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;

    iget-object v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual/range {v0 .. v5}, Lorg/tukaani/xz/lzma/LZMAEncoder$LiteralEncoder;->getPrice(IIIILorg/tukaani/xz/lzma/State;)I

    move-result v0

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v3, v3, v9

    invoke-virtual {v3, v0, v8, v12}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v0, v10}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getAnyMatchPrice(Lorg/tukaani/xz/lzma/State;I)I

    move-result v3

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v3, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getAnyRepPrice(ILorg/tukaani/xz/lzma/State;)I

    move-result v5

    if-ne v2, v1, :cond_12f

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v5, v0, v10}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getShortRepPrice(ILorg/tukaani/xz/lzma/State;I)I

    move-result v0

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v9

    iget v1, v1, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v0, v1, :cond_12f

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v9

    invoke-virtual {v1, v0, v8, v8}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    :cond_12f
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v6

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v0, v11, :cond_158

    sget-boolean v0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->$assertionsDisabled:Z

    if-nez v0, :cond_14d

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-eqz v0, :cond_14d

    new-instance v0, Ljava/lang/AssertionError;

    iget v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(I)V

    throw v0

    :cond_14d
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v9

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->backPrev:I

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->back:I

    move v0, v9

    goto/16 :goto_2a

    :cond_158
    invoke-virtual {p0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->updatePrices()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v0, v0, v8

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0, v1}, Lorg/tukaani/xz/lzma/State;->set(Lorg/tukaani/xz/lzma/State;)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->reps:[I

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v8

    iget-object v1, v1, Lorg/tukaani/xz/lzma/Optimum;->reps:[I

    invoke-static {v0, v8, v1, v8, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    :goto_173
    if-lt v0, v11, :cond_17f

    iget-object v1, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/tukaani/xz/lzma/Optimum;->reset()V

    add-int/lit8 v0, v0, -0x1

    goto :goto_173

    :cond_17f
    move v1, v8

    :goto_180
    if-ge v1, v13, :cond_1ad

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v1

    if-ge v0, v11, :cond_18c

    :goto_188
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_180

    :cond_18c
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v5, v1, v2, v10}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getLongRepPrice(IILorg/tukaani/xz/lzma/State;I)I

    move-result v2

    :cond_192
    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLenEncoder:Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;

    invoke-virtual {v6, v0, v10}, Lorg/tukaani/xz/lzma/LZMAEncoder$LengthEncoder;->getPrice(II)I

    move-result v6

    add-int/2addr v6, v2

    iget-object v9, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v9, v9, v0

    iget v9, v9, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v6, v9, :cond_1a8

    iget-object v9, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v9, v9, v0

    invoke-virtual {v9, v6, v8, v1}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    :cond_1a8
    add-int/lit8 v0, v0, -0x1

    if-ge v0, v11, :cond_192

    goto :goto_188

    :cond_1ad
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->repLens:[I

    aget v0, v0, v8

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0, v11}, Ljava/lang/Math;->max(II)I

    move-result v1

    if-gt v1, v7, :cond_1f8

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v3, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getNormalMatchPrice(ILorg/tukaani/xz/lzma/State;)I

    move-result v2

    move v0, v8

    :goto_1c0
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v3, v3, Lorg/tukaani/xz/lz/Matches;->len:[I

    aget v3, v3, v0

    if-le v1, v3, :cond_1cd

    add-int/lit8 v0, v0, 0x1

    goto :goto_1c0

    :cond_1cb
    add-int/lit8 v1, v1, 0x1

    :cond_1cd
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v3, v3, Lorg/tukaani/xz/lz/Matches;->dist:[I

    aget v3, v3, v0

    invoke-virtual {p0, v2, v3, v1, v10}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getMatchAndLenPrice(IIII)I

    move-result v5

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v6, v6, v1

    iget v6, v6, Lorg/tukaani/xz/lzma/Optimum;->price:I

    if-ge v5, v6, :cond_1e8

    iget-object v6, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    aget-object v6, v6, v1

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {v6, v5, v8, v3}, Lorg/tukaani/xz/lzma/Optimum;->set1(III)V

    :cond_1e8
    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v3, v3, Lorg/tukaani/xz/lz/Matches;->len:[I

    aget v3, v3, v0

    if-ne v1, v3, :cond_1cb

    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v3, v3, Lorg/tukaani/xz/lz/Matches;->count:I

    if-ne v0, v3, :cond_1cb

    :cond_1f8
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->lz:Lorg/tukaani/xz/lz/LZEncoder;

    invoke-virtual {v0}, Lorg/tukaani/xz/lz/LZEncoder;->getAvail()I

    move-result v0

    const/16 v1, 0xfff

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    move v1, v4

    :cond_205
    :goto_205
    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    if-ge v0, v2, :cond_22b

    invoke-virtual {p0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getMatches()Lorg/tukaani/xz/lz/Matches;

    move-result-object v0

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v0, v0, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lez v0, :cond_231

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v0, v0, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v2, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v2, v2, -0x1

    aget v0, v0, v2

    iget v2, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->niceLen:I

    if-lt v0, v2, :cond_231

    :cond_22b
    invoke-direct {p0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->convertOpts()I

    move-result v0

    goto/16 :goto_2a

    :cond_231
    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v1, v1, 0x1

    iget v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->posMask:I

    and-int v2, v1, v0

    invoke-direct {p0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->updateOptStateAndReps()V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v4

    iget v0, v0, Lorg/tukaani/xz/lzma/Optimum;->price:I

    iget-object v4, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v4, v4, v5

    iget-object v4, v4, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v4, v2}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getAnyMatchPrice(Lorg/tukaani/xz/lzma/State;I)I

    move-result v4

    add-int/2addr v4, v0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->opts:[Lorg/tukaani/xz/lzma/Optimum;

    iget v5, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    aget-object v0, v0, v5

    iget-object v0, v0, Lorg/tukaani/xz/lzma/Optimum;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {p0, v4, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->getAnyRepPrice(ILorg/tukaani/xz/lzma/State;)I

    move-result v0

    invoke-direct {p0, v1, v2, v3, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->calc1BytePrices(IIII)V

    if-lt v3, v11, :cond_205

    invoke-direct {p0, v1, v2, v3, v0}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->calcLongRepPrices(IIII)I

    move-result v5

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v0, v0, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lez v0, :cond_205

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->calcNormalMatchPrices(IIIII)V

    goto :goto_205

    :cond_271
    move v7, v8

    goto/16 :goto_ce

    :cond_274
    move v0, v6

    goto/16 :goto_78
.end method

.method public reset()V
    .registers 2

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optCur:I

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMAEncoderNormal;->optEnd:I

    invoke-super {p0}, Lorg/tukaani/xz/lzma/LZMAEncoder;->reset()V

    return-void
.end method
