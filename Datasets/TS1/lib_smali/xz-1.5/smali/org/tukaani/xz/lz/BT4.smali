.class final Lorg/tukaani/xz/lz/BT4;
.super Lorg/tukaani/xz/lz/LZEncoder;


# instance fields
.field private cyclicPos:I

.field private final cyclicSize:I

.field private final depthLimit:I

.field private final hash:Lorg/tukaani/xz/lz/Hash234;

.field private lzPos:I

.field private final matches:Lorg/tukaani/xz/lz/Matches;

.field private final tree:[I


# direct methods
.method constructor <init>(IIIIII)V
    .registers 9

    invoke-direct/range {p0 .. p5}, Lorg/tukaani/xz/lz/LZEncoder;-><init>(IIIII)V

    const/4 v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    iget v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    iput v0, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    new-instance v0, Lorg/tukaani/xz/lz/Hash234;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/lz/Hash234;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    new-instance v0, Lorg/tukaani/xz/lz/Matches;

    add-int/lit8 v1, p4, -0x1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/lz/Matches;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    if-lez p6, :cond_2b

    :goto_28
    iput p6, p0, Lorg/tukaani/xz/lz/BT4;->depthLimit:I

    return-void

    :cond_2b
    div-int/lit8 v0, p4, 0x2

    add-int/lit8 p6, v0, 0x10

    goto :goto_28
.end method

.method static getMemoryUsage(I)I
    .registers 3

    invoke-static {p0}, Lorg/tukaani/xz/lz/Hash234;->getMemoryUsage(I)I

    move-result v0

    div-int/lit16 v1, p0, 0x80

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method private movePos()I
    .registers 4

    const v2, 0x7fffffff

    iget v0, p0, Lorg/tukaani/xz/lz/BT4;->niceLen:I

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/tukaani/xz/lz/BT4;->movePos(II)I

    move-result v0

    if-eqz v0, :cond_35

    iget v1, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    if-ne v1, v2, :cond_28

    iget v1, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    sub-int v1, v2, v1

    iget-object v2, p0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v2, v1}, Lorg/tukaani/xz/lz/Hash234;->normalize(I)V

    iget-object v2, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    invoke-static {v2, v1}, Lorg/tukaani/xz/lz/BT4;->normalize([II)V

    iget v2, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    sub-int v1, v2, v1

    iput v1, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    :cond_28
    iget v1, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    iget v2, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    if-ne v1, v2, :cond_35

    const/4 v1, 0x0

    iput v1, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    :cond_35
    return v0
.end method

.method private skip(II)V
    .registers 15

    const/4 v1, 0x0

    iget v3, p0, Lorg/tukaani/xz/lz/BT4;->depthLimit:I

    iget v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v0, 0x1

    iget v0, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    shl-int/lit8 v0, v0, 0x1

    move v4, v2

    move v5, v3

    move v3, v0

    move v2, v1

    move v0, v1

    :goto_12
    iget v6, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    sub-int v8, v6, p2

    add-int/lit8 v6, v5, -0x1

    if-eqz v5, :cond_1e

    iget v5, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    if-lt v8, v5, :cond_27

    :cond_1e
    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput v1, v0, v4

    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput v1, v0, v3

    :goto_26
    return-void

    :cond_27
    iget v5, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    sub-int v7, v5, v8

    iget v5, p0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    if-le v8, v5, :cond_60

    iget v5, p0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    :goto_31
    add-int/2addr v5, v7

    shl-int/lit8 v7, v5, 0x1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v5

    iget-object v9, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v10, v5

    sub-int/2addr v10, v8

    aget-byte v9, v9, v10

    iget-object v10, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v11, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v11, v5

    aget-byte v10, v10, v11

    if-ne v9, v10, :cond_73

    :cond_49
    add-int/lit8 v5, v5, 0x1

    if-ne v5, p1, :cond_62

    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    iget-object v1, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget v1, v1, v7

    aput v1, v0, v3

    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    iget-object v1, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    add-int/lit8 v2, v7, 0x1

    aget v1, v1, v2

    aput v1, v0, v4

    goto :goto_26

    :cond_60
    move v5, v1

    goto :goto_31

    :cond_62
    iget-object v9, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v10, v5

    sub-int/2addr v10, v8

    aget-byte v9, v9, v10

    iget-object v10, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v11, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v11, v5

    aget-byte v10, v10, v11

    if-eq v9, v10, :cond_49

    :cond_73
    iget-object v9, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v10, v5

    sub-int v8, v10, v8

    aget-byte v8, v9, v8

    and-int/lit16 v8, v8, 0xff

    iget-object v9, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v10, v5

    aget-byte v9, v9, v10

    and-int/lit16 v9, v9, 0xff

    if-ge v8, v9, :cond_97

    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput p2, v0, v3

    add-int/lit8 v3, v7, 0x1

    iget-object v0, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget p2, v0, v3

    move v0, v5

    :goto_94
    move v5, v6

    goto/16 :goto_12

    :cond_97
    iget-object v2, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput p2, v2, v4

    iget-object v2, p0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget p2, v2, v7

    move v2, v5

    move v4, v7

    goto :goto_94
.end method


# virtual methods
.method public getMatches()Lorg/tukaani/xz/lz/Matches;
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    const/4 v2, 0x0

    iput v2, v1, Lorg/tukaani/xz/lz/Matches;->count:I

    move-object/from16 v0, p0

    iget v3, v0, Lorg/tukaani/xz/lz/BT4;->matchLenMax:I

    move-object/from16 v0, p0

    iget v2, v0, Lorg/tukaani/xz/lz/BT4;->niceLen:I

    invoke-direct/range {p0 .. p0}, Lorg/tukaani/xz/lz/BT4;->movePos()I

    move-result v1

    if-ge v1, v3, :cond_248

    if-nez v1, :cond_1c

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    :goto_1b
    return-object v1

    :cond_1c
    if-le v2, v1, :cond_241

    move v2, v1

    :goto_1f
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v5, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    invoke-virtual {v3, v4, v5}, Lorg/tukaani/xz/lz/Hash234;->calcHashes([BI)V

    move-object/from16 v0, p0

    iget v3, v0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v4}, Lorg/tukaani/xz/lz/Hash234;->getHash2Pos()I

    move-result v4

    sub-int v5, v3, v4

    move-object/from16 v0, p0

    iget v3, v0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v4}, Lorg/tukaani/xz/lz/Hash234;->getHash3Pos()I

    move-result v4

    sub-int v4, v3, v4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v3}, Lorg/tukaani/xz/lz/Hash234;->getHash4Pos()I

    move-result v9

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    move-object/from16 v0, p0

    iget v6, v0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    invoke-virtual {v3, v6}, Lorg/tukaani/xz/lz/Hash234;->updateTables(I)V

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v6, v0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    if-ge v5, v6, :cond_98

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    sub-int/2addr v7, v5

    aget-byte v6, v6, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v8, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_98

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v6, v6, Lorg/tukaani/xz/lz/Matches;->len:[I

    const/4 v7, 0x0

    const/4 v8, 0x2

    aput v8, v6, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v6, v6, Lorg/tukaani/xz/lz/Matches;->dist:[I

    const/4 v7, 0x0

    add-int/lit8 v8, v5, -0x1

    aput v8, v6, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    const/4 v7, 0x1

    iput v7, v6, Lorg/tukaani/xz/lz/Matches;->count:I

    :cond_98
    if-eq v5, v4, :cond_23e

    move-object/from16 v0, p0

    iget v6, v0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    if-ge v4, v6, :cond_23e

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    sub-int/2addr v7, v4

    aget-byte v6, v6, v7

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v8, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_23e

    const/4 v3, 0x3

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v5, v5, Lorg/tukaani/xz/lz/Matches;->dist:[I

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v7, v6, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v6, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v6, v4, -0x1

    aput v6, v5, v7

    :goto_cc
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v5, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lez v5, :cond_10f

    :goto_d4
    if-ge v3, v2, :cond_f2

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v6, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v6, v3

    sub-int/2addr v6, v4

    aget-byte v5, v5, v6

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v7, v3

    aget-byte v6, v6, v7

    if-ne v5, v6, :cond_f2

    add-int/lit8 v3, v3, 0x1

    goto :goto_d4

    :cond_f2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v4, v4, Lorg/tukaani/xz/lz/Matches;->len:[I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v5, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v5, v5, -0x1

    aput v3, v4, v5

    if-lt v3, v1, :cond_10f

    move-object/from16 v0, p0

    invoke-direct {v0, v1, v9}, Lorg/tukaani/xz/lz/BT4;->skip(II)V

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_1b

    :cond_10f
    const/4 v4, 0x3

    if-ge v3, v4, :cond_113

    const/4 v3, 0x3

    :cond_113
    move-object/from16 v0, p0

    iget v8, v0, Lorg/tukaani/xz/lz/BT4;->depthLimit:I

    move-object/from16 v0, p0

    iget v4, v0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    shl-int/lit8 v4, v4, 0x1

    add-int/lit8 v7, v4, 0x1

    move-object/from16 v0, p0

    iget v4, v0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    shl-int/lit8 v6, v4, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x0

    move v10, v9

    move v9, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    :goto_12e
    move-object/from16 v0, p0

    iget v8, v0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    sub-int v12, v8, v10

    add-int/lit8 v8, v7, -0x1

    if-eqz v7, :cond_13e

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    if-lt v12, v7, :cond_152

    :cond_13e
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    const/4 v2, 0x0

    aput v2, v1, v6

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    const/4 v2, 0x0

    aput v2, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_1b

    :cond_152
    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    sub-int v11, v7, v12

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->cyclicPos:I

    if-le v12, v7, :cond_1eb

    move-object/from16 v0, p0

    iget v7, v0, Lorg/tukaani/xz/lz/BT4;->cyclicSize:I

    :goto_162
    add-int/2addr v7, v11

    shl-int/lit8 v11, v7, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v7

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v14, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v14, v7

    sub-int/2addr v14, v12

    aget-byte v13, v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v15, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v15, v7

    aget-byte v14, v14, v15

    if-ne v13, v14, :cond_238

    :cond_182
    add-int/lit8 v7, v7, 0x1

    if-ge v7, v2, :cond_19f

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v14, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v14, v7

    sub-int/2addr v14, v12

    aget-byte v13, v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v15, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v15, v7

    aget-byte v14, v14, v15

    if-eq v13, v14, :cond_182

    :cond_19f
    if-le v7, v9, :cond_238

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v9, v9, Lorg/tukaani/xz/lz/Matches;->len:[I

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v13, v13, Lorg/tukaani/xz/lz/Matches;->count:I

    aput v7, v9, v13

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v9, v9, Lorg/tukaani/xz/lz/Matches;->dist:[I

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v13, v13, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v14, v12, -0x1

    aput v14, v9, v13

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v13, v9, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v13, v13, 0x1

    iput v13, v9, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lt v7, v1, :cond_1ee

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget v2, v2, v11

    aput v2, v1, v5

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    add-int/lit8 v3, v11, 0x1

    aget v2, v2, v3

    aput v2, v1, v6

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/tukaani/xz/lz/BT4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_1b

    :cond_1eb
    const/4 v7, 0x0

    goto/16 :goto_162

    :cond_1ee
    move v9, v7

    :goto_1ef
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v14, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v14, v9

    sub-int v12, v14, v12

    aget-byte v12, v13, v12

    and-int/lit16 v12, v12, 0xff

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    move-object/from16 v0, p0

    iget v14, v0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    add-int/2addr v14, v9

    aget-byte v13, v13, v14

    and-int/lit16 v13, v13, 0xff

    if-ge v12, v13, :cond_225

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput v10, v3, v5

    add-int/lit8 v5, v11, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget v3, v3, v5

    move/from16 v16, v9

    move v9, v3

    move/from16 v3, v16

    :goto_220
    move v10, v9

    move v9, v7

    move v7, v8

    goto/16 :goto_12e

    :cond_225
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aput v10, v4, v6

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/tukaani/xz/lz/BT4;->tree:[I

    aget v4, v4, v11

    move v6, v11

    move/from16 v16, v9

    move v9, v4

    move/from16 v4, v16

    goto :goto_220

    :cond_238
    move/from16 v16, v7

    move v7, v9

    move/from16 v9, v16

    goto :goto_1ef

    :cond_23e
    move v4, v5

    goto/16 :goto_cc

    :cond_241
    move/from16 v16, v2

    move v2, v1

    move/from16 v1, v16

    goto/16 :goto_1f

    :cond_248
    move v1, v2

    move v2, v3

    goto/16 :goto_1f
.end method

.method public skip(I)V
    .registers 7

    :goto_0
    add-int/lit8 v2, p1, -0x1

    if-lez p1, :cond_2c

    iget v1, p0, Lorg/tukaani/xz/lz/BT4;->niceLen:I

    invoke-direct {p0}, Lorg/tukaani/xz/lz/BT4;->movePos()I

    move-result v0

    if-ge v0, v1, :cond_10

    if-nez v0, :cond_11

    move p1, v2

    goto :goto_0

    :cond_10
    move v0, v1

    :cond_11
    iget-object v1, p0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget-object v3, p0, Lorg/tukaani/xz/lz/BT4;->buf:[B

    iget v4, p0, Lorg/tukaani/xz/lz/BT4;->readPos:I

    invoke-virtual {v1, v3, v4}, Lorg/tukaani/xz/lz/Hash234;->calcHashes([BI)V

    iget-object v1, p0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v1}, Lorg/tukaani/xz/lz/Hash234;->getHash4Pos()I

    move-result v1

    iget-object v3, p0, Lorg/tukaani/xz/lz/BT4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget v4, p0, Lorg/tukaani/xz/lz/BT4;->lzPos:I

    invoke-virtual {v3, v4}, Lorg/tukaani/xz/lz/Hash234;->updateTables(I)V

    invoke-direct {p0, v0, v1}, Lorg/tukaani/xz/lz/BT4;->skip(II)V

    move p1, v2

    goto :goto_0

    :cond_2c
    return-void
.end method
