.class final Lorg/tukaani/xz/lz/Hash234;
.super Lorg/tukaani/xz/lz/CRC32Hash;


# static fields
.field private static final HASH_2_MASK:I = 0x3ff

.field private static final HASH_2_SIZE:I = 0x400

.field private static final HASH_3_MASK:I = 0xffff

.field private static final HASH_3_SIZE:I = 0x10000


# instance fields
.field private final hash2Table:[I

.field private hash2Value:I

.field private final hash3Table:[I

.field private hash3Value:I

.field private final hash4Mask:I

.field private final hash4Table:[I

.field private hash4Value:I


# direct methods
.method constructor <init>(I)V
    .registers 4

    const/4 v1, 0x0

    invoke-direct {p0}, Lorg/tukaani/xz/lz/CRC32Hash;-><init>()V

    const/16 v0, 0x400

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Table:[I

    const/high16 v0, 0x10000

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Table:[I

    iput v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Value:I

    iput v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Value:I

    iput v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Value:I

    invoke-static {p1}, Lorg/tukaani/xz/lz/Hash234;->getHash4Size(I)I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Table:[I

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Table:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Mask:I

    return-void
.end method

.method static getHash4Size(I)I
    .registers 3

    add-int/lit8 v0, p0, -0x1

    ushr-int/lit8 v1, v0, 0x1

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x2

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x4

    or-int/2addr v0, v1

    ushr-int/lit8 v1, v0, 0x8

    or-int/2addr v0, v1

    ushr-int/lit8 v0, v0, 0x1

    const v1, 0xffff

    or-int/2addr v0, v1

    const/high16 v1, 0x1000000

    if-le v0, v1, :cond_1a

    ushr-int/lit8 v0, v0, 0x1

    :cond_1a
    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method static getMemoryUsage(I)I
    .registers 3

    const v0, 0x10400

    invoke-static {p0}, Lorg/tukaani/xz/lz/Hash234;->getHash4Size(I)I

    move-result v1

    add-int/2addr v0, v1

    div-int/lit16 v0, v0, 0x100

    add-int/lit8 v0, v0, 0x4

    return v0
.end method


# virtual methods
.method calcHashes([BI)V
    .registers 6

    sget-object v0, Lorg/tukaani/xz/lz/Hash234;->crcTable:[I

    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    aget v0, v0, v1

    add-int/lit8 v1, p2, 0x1

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    xor-int/2addr v0, v1

    and-int/lit16 v1, v0, 0x3ff

    iput v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Value:I

    add-int/lit8 v1, p2, 0x2

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    xor-int/2addr v0, v1

    const v1, 0xffff

    and-int/2addr v1, v0

    iput v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Value:I

    sget-object v1, Lorg/tukaani/xz/lz/Hash234;->crcTable:[I

    add-int/lit8 v2, p2, 0x3

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    aget v1, v1, v2

    shl-int/lit8 v1, v1, 0x5

    xor-int/2addr v0, v1

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Mask:I

    and-int/2addr v0, v1

    iput v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Value:I

    return-void
.end method

.method getHash2Pos()I
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Value:I

    aget v0, v0, v1

    return v0
.end method

.method getHash3Pos()I
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Value:I

    aget v0, v0, v1

    return v0
.end method

.method getHash4Pos()I
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Value:I

    aget v0, v0, v1

    return v0
.end method

.method normalize(I)V
    .registers 3

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Table:[I

    invoke-static {v0, p1}, Lorg/tukaani/xz/lz/LZEncoder;->normalize([II)V

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Table:[I

    invoke-static {v0, p1}, Lorg/tukaani/xz/lz/LZEncoder;->normalize([II)V

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Table:[I

    invoke-static {v0, p1}, Lorg/tukaani/xz/lz/LZEncoder;->normalize([II)V

    return-void
.end method

.method updateTables(I)V
    .registers 4

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash2Value:I

    aput p1, v0, v1

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash3Value:I

    aput p1, v0, v1

    iget-object v0, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Table:[I

    iget v1, p0, Lorg/tukaani/xz/lz/Hash234;->hash4Value:I

    aput p1, v0, v1

    return-void
.end method
