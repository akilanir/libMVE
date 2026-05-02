.class abstract Lorg/tukaani/xz/lzma/LZMACoder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/tukaani/xz/lzma/LZMACoder$LengthCoder;,
        Lorg/tukaani/xz/lzma/LZMACoder$LiteralCoder;
    }
.end annotation


# static fields
.field static final ALIGN_BITS:I = 0x4

.field static final ALIGN_MASK:I = 0xf

.field static final ALIGN_SIZE:I = 0x10

.field static final DIST_MODEL_END:I = 0xe

.field static final DIST_MODEL_START:I = 0x4

.field static final DIST_SLOTS:I = 0x40

.field static final DIST_STATES:I = 0x4

.field static final FULL_DISTANCES:I = 0x80

.field static final MATCH_LEN_MAX:I = 0x111

.field static final MATCH_LEN_MIN:I = 0x2

.field static final POS_STATES_MAX:I = 0x10

.field static final REPS:I = 0x4


# instance fields
.field final distAlign:[S

.field final distSlots:[[S

.field final distSpecial:[[S

.field final isMatch:[[S

.field final isRep:[S

.field final isRep0:[S

.field final isRep0Long:[[S

.field final isRep1:[S

.field final isRep2:[S

.field final posMask:I

.field final reps:[I

.field final state:Lorg/tukaani/xz/lzma/State;


# direct methods
.method constructor <init>(I)V
    .registers 9

    const/16 v6, 0x8

    const/4 v5, 0x2

    const/16 v4, 0x10

    const/4 v3, 0x4

    const/16 v2, 0xc

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v3, [I

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->reps:[I

    new-instance v0, Lorg/tukaani/xz/lzma/State;

    invoke-direct {v0}, Lorg/tukaani/xz/lzma/State;-><init>()V

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->state:Lorg/tukaani/xz/lzma/State;

    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isMatch:[[S

    new-array v0, v2, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep:[S

    new-array v0, v2, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep0:[S

    new-array v0, v2, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep1:[S

    new-array v0, v2, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep2:[S

    filled-new-array {v2, v4}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep0Long:[[S

    const/16 v0, 0x40

    filled-new-array {v3, v0}, [I

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSlots:[[S

    const/16 v0, 0xa

    new-array v0, v0, [[S

    const/4 v1, 0x0

    new-array v2, v5, [S

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-array v2, v5, [S

    aput-object v2, v0, v1

    new-array v1, v3, [S

    aput-object v1, v0, v5

    const/4 v1, 0x3

    new-array v2, v3, [S

    aput-object v2, v0, v1

    new-array v1, v6, [S

    aput-object v1, v0, v3

    const/4 v1, 0x5

    new-array v2, v6, [S

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v4, [S

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v4, [S

    aput-object v2, v0, v1

    const/16 v1, 0x20

    new-array v1, v1, [S

    aput-object v1, v0, v6

    const/16 v1, 0x9

    const/16 v2, 0x20

    new-array v2, v2, [S

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSpecial:[[S

    new-array v0, v4, [S

    iput-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distAlign:[S

    const/4 v0, 0x1

    shl-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->posMask:I

    return-void
.end method

.method static final getDistState(I)I
    .registers 2

    const/4 v0, 0x6

    if-ge p0, v0, :cond_6

    add-int/lit8 v0, p0, -0x2

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x3

    goto :goto_5
.end method


# virtual methods
.method reset()V
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->reps:[I

    aput v1, v0, v1

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->reps:[I

    const/4 v2, 0x1

    aput v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->reps:[I

    const/4 v2, 0x2

    aput v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->reps:[I

    const/4 v2, 0x3

    aput v1, v0, v2

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->state:Lorg/tukaani/xz/lzma/State;

    invoke-virtual {v0}, Lorg/tukaani/xz/lzma/State;->reset()V

    move v0, v1

    :goto_1a
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isMatch:[[S

    array-length v2, v2

    if-ge v0, v2, :cond_29

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isMatch:[[S

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_29
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep0:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep1:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep2:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    move v0, v1

    :goto_3e
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep0Long:[[S

    array-length v2, v2

    if-ge v0, v2, :cond_4d

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->isRep0Long:[[S

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3e

    :cond_4d
    move v0, v1

    :goto_4e
    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSlots:[[S

    array-length v2, v2

    if-ge v0, v2, :cond_5d

    iget-object v2, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSlots:[[S

    aget-object v2, v2, v0

    invoke-static {v2}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4e

    :cond_5d
    :goto_5d
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSpecial:[[S

    array-length v0, v0

    if-ge v1, v0, :cond_6c

    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distSpecial:[[S

    aget-object v0, v0, v1

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5d

    :cond_6c
    iget-object v0, p0, Lorg/tukaani/xz/lzma/LZMACoder;->distAlign:[S

    invoke-static {v0}, Lorg/tukaani/xz/rangecoder/RangeCoder;->initProbs([S)V

    return-void
.end method
