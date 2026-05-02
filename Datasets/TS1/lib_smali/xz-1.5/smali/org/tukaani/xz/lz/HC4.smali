.class final Lorg/tukaani/xz/lz/HC4;
.super Lorg/tukaani/xz/lz/LZEncoder;


# static fields
.field static final $assertionsDisabled:Z

.field static class$org$tukaani$xz$lz$HC4:Ljava/lang/Class;


# instance fields
.field private final chain:[I

.field private cyclicPos:I

.field private final cyclicSize:I

.field private final depthLimit:I

.field private final hash:Lorg/tukaani/xz/lz/Hash234;

.field private lzPos:I

.field private final matches:Lorg/tukaani/xz/lz/Matches;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/lz/HC4;->class$org$tukaani$xz$lz$HC4:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.lz.HC4"

    invoke-static {v0}, Lorg/tukaani/xz/lz/HC4;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/lz/HC4;->class$org$tukaani$xz$lz$HC4:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/lz/HC4;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/lz/HC4;->class$org$tukaani$xz$lz$HC4:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(IIIIII)V
    .registers 9

    invoke-direct/range {p0 .. p5}, Lorg/tukaani/xz/lz/LZEncoder;-><init>(IIIII)V

    const/4 v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    new-instance v0, Lorg/tukaani/xz/lz/Hash234;

    invoke-direct {v0, p1}, Lorg/tukaani/xz/lz/Hash234;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    iget v0, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lz/HC4;->chain:[I

    iget v0, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    iput v0, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    new-instance v0, Lorg/tukaani/xz/lz/Matches;

    add-int/lit8 v1, p4, -0x1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/lz/Matches;-><init>(I)V

    iput-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    if-lez p6, :cond_29

    :goto_26
    iput p6, p0, Lorg/tukaani/xz/lz/HC4;->depthLimit:I

    return-void

    :cond_29
    div-int/lit8 v0, p4, 0x4

    add-int/lit8 p6, v0, 0x4

    goto :goto_26
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

.method static getMemoryUsage(I)I
    .registers 3

    invoke-static {p0}, Lorg/tukaani/xz/lz/Hash234;->getMemoryUsage(I)I

    move-result v0

    div-int/lit16 v1, p0, 0x100

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, 0xa

    return v0
.end method

.method private movePos()I
    .registers 4

    const v2, 0x7fffffff

    const/4 v0, 0x4

    invoke-virtual {p0, v0, v0}, Lorg/tukaani/xz/lz/HC4;->movePos(II)I

    move-result v0

    if-eqz v0, :cond_33

    iget v1, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    if-ne v1, v2, :cond_26

    iget v1, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    sub-int v1, v2, v1

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v2, v1}, Lorg/tukaani/xz/lz/Hash234;->normalize(I)V

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->chain:[I

    invoke-static {v2, v1}, Lorg/tukaani/xz/lz/HC4;->normalize([II)V

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    sub-int v1, v2, v1

    iput v1, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    :cond_26
    iget v1, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    if-ne v1, v2, :cond_33

    const/4 v1, 0x0

    iput v1, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    :cond_33
    return v0
.end method


# virtual methods
.method public getMatches()Lorg/tukaani/xz/lz/Matches;
    .registers 13

    const/4 v8, 0x2

    const/4 v3, 0x3

    const/4 v7, 0x0

    iget-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iput v7, v0, Lorg/tukaani/xz/lz/Matches;->count:I

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->matchLenMax:I

    iget v1, p0, Lorg/tukaani/xz/lz/HC4;->niceLen:I

    invoke-direct {p0}, Lorg/tukaani/xz/lz/HC4;->movePos()I

    move-result v0

    if-ge v0, v2, :cond_15b

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    :goto_15
    return-object v0

    :cond_16
    if-le v1, v0, :cond_156

    move v1, v0

    :goto_19
    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v5, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    invoke-virtual {v2, v4, v5}, Lorg/tukaani/xz/lz/Hash234;->calcHashes([BI)V

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v4}, Lorg/tukaani/xz/lz/Hash234;->getHash2Pos()I

    move-result v4

    sub-int v5, v2, v4

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v4}, Lorg/tukaani/xz/lz/Hash234;->getHash3Pos()I

    move-result v4

    sub-int v4, v2, v4

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v2}, Lorg/tukaani/xz/lz/Hash234;->getHash4Pos()I

    move-result v6

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    invoke-virtual {v2, v9}, Lorg/tukaani/xz/lz/Hash234;->updateTables(I)V

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->chain:[I

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    aput v6, v2, v9

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    if-ge v5, v2, :cond_153

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    sub-int/2addr v9, v5

    aget-byte v2, v2, v9

    iget-object v9, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    aget-byte v9, v9, v10

    if-ne v2, v9, :cond_153

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v2, v2, Lorg/tukaani/xz/lz/Matches;->len:[I

    aput v8, v2, v7

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v2, v2, Lorg/tukaani/xz/lz/Matches;->dist:[I

    add-int/lit8 v9, v5, -0x1

    aput v9, v2, v7

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    const/4 v9, 0x1

    iput v9, v2, Lorg/tukaani/xz/lz/Matches;->count:I

    move v2, v8

    :goto_70
    if-eq v5, v4, :cond_150

    iget v8, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    if-ge v4, v8, :cond_150

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    sub-int/2addr v9, v4

    aget-byte v8, v8, v9

    iget-object v9, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    aget-byte v9, v9, v10

    if-ne v8, v9, :cond_150

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v2, v2, Lorg/tukaani/xz/lz/Matches;->dist:[I

    iget-object v5, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v8, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v9, v8, 0x1

    iput v9, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v5, v4, -0x1

    aput v5, v2, v8

    move v2, v3

    :goto_96
    iget-object v5, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v5, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lez v5, :cond_c4

    :goto_9c
    if-ge v2, v1, :cond_b2

    iget-object v5, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v8, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v8, v2

    sub-int/2addr v8, v4

    aget-byte v5, v5, v8

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v9, v2

    aget-byte v8, v8, v9

    if-ne v5, v8, :cond_b2

    add-int/lit8 v2, v2, 0x1

    goto :goto_9c

    :cond_b2
    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v4, v4, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v5, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v5, v5, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v5, v5, -0x1

    aput v2, v4, v5

    if-lt v2, v0, :cond_c4

    iget-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_15

    :cond_c4
    if-ge v2, v3, :cond_14d

    :goto_c6
    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->depthLimit:I

    move v4, v3

    move v3, v6

    :goto_ca
    iget v5, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    sub-int v6, v5, v3

    add-int/lit8 v3, v2, -0x1

    if-eqz v2, :cond_d6

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    if-lt v6, v2, :cond_da

    :cond_d6
    iget-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_15

    :cond_da
    iget-object v5, p0, Lorg/tukaani/xz/lz/HC4;->chain:[I

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    sub-int v8, v2, v6

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    if-le v6, v2, :cond_145

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicSize:I

    :goto_e6
    add-int/2addr v2, v8

    aget v5, v5, v2

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v8, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v8, v4

    sub-int/2addr v8, v6

    aget-byte v2, v2, v8

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v9, v4

    aget-byte v8, v8, v9

    if-ne v2, v8, :cond_147

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v8, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    sub-int/2addr v8, v6

    aget-byte v2, v2, v8

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    aget-byte v8, v8, v9

    if-ne v2, v8, :cond_147

    move v2, v7

    :cond_10a
    add-int/lit8 v2, v2, 0x1

    if-ge v2, v1, :cond_11f

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v9, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v9, v2

    sub-int/2addr v9, v6

    aget-byte v8, v8, v9

    iget-object v9, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v10, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    add-int/2addr v10, v2

    aget-byte v9, v9, v10

    if-eq v8, v9, :cond_10a

    :cond_11f
    if-le v2, v4, :cond_147

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v4, v4, Lorg/tukaani/xz/lz/Matches;->len:[I

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v8, v8, Lorg/tukaani/xz/lz/Matches;->count:I

    aput v2, v4, v8

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget-object v4, v4, Lorg/tukaani/xz/lz/Matches;->dist:[I

    iget-object v8, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v8, v8, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v6, v6, -0x1

    aput v6, v4, v8

    iget-object v4, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    iget v6, v4, Lorg/tukaani/xz/lz/Matches;->count:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lorg/tukaani/xz/lz/Matches;->count:I

    if-lt v2, v0, :cond_148

    iget-object v0, p0, Lorg/tukaani/xz/lz/HC4;->matches:Lorg/tukaani/xz/lz/Matches;

    goto/16 :goto_15

    :cond_145
    move v2, v7

    goto :goto_e6

    :cond_147
    move v2, v4

    :cond_148
    move v4, v2

    move v2, v3

    move v3, v5

    goto/16 :goto_ca

    :cond_14d
    move v3, v2

    goto/16 :goto_c6

    :cond_150
    move v4, v5

    goto/16 :goto_96

    :cond_153
    move v2, v7

    goto/16 :goto_70

    :cond_156
    move v11, v1

    move v1, v0

    move v0, v11

    goto/16 :goto_19

    :cond_15b
    move v0, v1

    move v1, v2

    goto/16 :goto_19
.end method

.method public skip(I)V
    .registers 6

    sget-boolean v0, Lorg/tukaani/xz/lz/HC4;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-gez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_c
    :goto_c
    add-int/lit8 v0, p1, -0x1

    if-lez p1, :cond_34

    invoke-direct {p0}, Lorg/tukaani/xz/lz/HC4;->movePos()I

    move-result v1

    if-eqz v1, :cond_35

    iget-object v1, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget-object v2, p0, Lorg/tukaani/xz/lz/HC4;->buf:[B

    iget v3, p0, Lorg/tukaani/xz/lz/HC4;->readPos:I

    invoke-virtual {v1, v2, v3}, Lorg/tukaani/xz/lz/Hash234;->calcHashes([BI)V

    iget-object v1, p0, Lorg/tukaani/xz/lz/HC4;->chain:[I

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->cyclicPos:I

    iget-object v3, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    invoke-virtual {v3}, Lorg/tukaani/xz/lz/Hash234;->getHash4Pos()I

    move-result v3

    aput v3, v1, v2

    iget-object v1, p0, Lorg/tukaani/xz/lz/HC4;->hash:Lorg/tukaani/xz/lz/Hash234;

    iget v2, p0, Lorg/tukaani/xz/lz/HC4;->lzPos:I

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/lz/Hash234;->updateTables(I)V

    move p1, v0

    goto :goto_c

    :cond_34
    return-void

    :cond_35
    move p1, v0

    goto :goto_c
.end method
