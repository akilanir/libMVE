.class public Lorg/spongycastle/crypto/macs/Poly1305;
.super Ljava/lang/Object;
.source "Poly1305.java"

# interfaces
.implements Lorg/spongycastle/crypto/Mac;


# static fields
.field private static final BLOCK_SIZE:I = 0x10


# instance fields
.field private final cipher:Lorg/spongycastle/crypto/BlockCipher;

.field private final currentBlock:[B

.field private currentBlockOffset:I

.field private h0:I

.field private h1:I

.field private h2:I

.field private h3:I

.field private h4:I

.field private k0:I

.field private k1:I

.field private k2:I

.field private k3:I

.field private r0:I

.field private r1:I

.field private r2:I

.field private r3:I

.field private r4:I

.field private s1:I

.field private s2:I

.field private s3:I

.field private s4:I

.field private final singleByte:[B


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    .line 47
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 4
    .param p1, "cipher"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    const/16 v1, 0x10

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    .line 47
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 68
    invoke-interface {p1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    if-eq v0, v1, :cond_1f

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Poly1305 requires a 128 bit block cipher."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1f
    iput-object p1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 73
    return-void
.end method

.method private static final mul32x32_64(II)J
    .registers 6
    .param p0, "i1"    # I
    .param p1, "i2"    # I

    .prologue
    .line 304
    int-to-long v0, p0

    int-to-long v2, p1

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private processBlock()V
    .registers 30

    .prologue
    .line 198
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    move/from16 v23, v0

    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_39

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    move/from16 v24, v0

    const/16 v25, 0x1

    aput-byte v25, v23, v24

    .line 201
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    move/from16 v23, v0

    add-int/lit8 v4, v23, 0x1

    .local v4, "i":I
    :goto_26
    const/16 v23, 0x10

    move/from16 v0, v23

    if-ge v4, v0, :cond_39

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-byte v24, v23, v4

    .line 201
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 207
    .end local v4    # "i":I
    :cond_39
    const-wide v23, 0xffffffffL

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    and-long v5, v23, v25

    .line 208
    .local v5, "t0":J
    const-wide v23, 0xffffffffL

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v25, v0

    const/16 v26, 0x4

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    and-long v7, v23, v25

    .line 209
    .local v7, "t1":J
    const-wide v23, 0xffffffffL

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v25, v0

    const/16 v26, 0x8

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    and-long v9, v23, v25

    .line 210
    .local v9, "t2":J
    const-wide v23, 0xffffffffL

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    move-object/from16 v25, v0

    const/16 v26, 0xc

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v25

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v25, v0

    and-long v11, v23, v25

    .line 212
    .local v11, "t3":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide/32 v25, 0x3ffffff

    and-long v25, v25, v5

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 213
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const/16 v25, 0x20

    shl-long v25, v7, v25

    or-long v25, v25, v5

    const/16 v27, 0x1a

    ushr-long v25, v25, v27

    const-wide/32 v27, 0x3ffffff

    and-long v25, v25, v27

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 214
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const/16 v25, 0x20

    shl-long v25, v9, v25

    or-long v25, v25, v7

    const/16 v27, 0x14

    ushr-long v25, v25, v27

    const-wide/32 v27, 0x3ffffff

    and-long v25, v25, v27

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 215
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const/16 v25, 0x20

    shl-long v25, v11, v25

    or-long v25, v25, v9

    const/16 v27, 0xe

    ushr-long v25, v25, v27

    const-wide/32 v27, 0x3ffffff

    and-long v25, v25, v27

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 216
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const/16 v25, 0x8

    ushr-long v25, v11, v25

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 218
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    move/from16 v23, v0

    const/16 v24, 0x10

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_165

    .line 220
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v23, v0

    const/high16 v24, 0x1000000

    add-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 223
    :cond_165
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    move/from16 v24, v0

    invoke-static/range {v23 .. v24}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v23

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s1:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v13, v23, v25

    .line 224
    .local v13, "tp0":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    move/from16 v24, v0

    invoke-static/range {v23 .. v24}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v23

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v15, v23, v25

    .line 225
    .local v15, "tp1":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    move/from16 v24, v0

    invoke-static/range {v23 .. v24}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v23

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v17, v23, v25

    .line 226
    .local v17, "tp2":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    move/from16 v24, v0

    invoke-static/range {v23 .. v24}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v23

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v19, v23, v25

    .line 227
    .local v19, "tp3":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r4:I

    move/from16 v24, v0

    invoke-static/range {v23 .. v24}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v23

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v23, v23, v25

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    move/from16 v26, v0

    invoke-static/range {v25 .. v26}, Lorg/spongycastle/crypto/macs/Poly1305;->mul32x32_64(II)J

    move-result-wide v25

    add-long v21, v23, v25

    .line 230
    .local v21, "tp4":J
    long-to-int v0, v13

    move/from16 v23, v0

    const v24, 0x3ffffff

    and-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    const/16 v23, 0x1a

    ushr-long v2, v13, v23

    .line 231
    .local v2, "b":J
    add-long/2addr v15, v2

    long-to-int v0, v15

    move/from16 v23, v0

    const v24, 0x3ffffff

    and-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    const/16 v23, 0x1a

    ushr-long v23, v15, v23

    const-wide/16 v25, -0x1

    and-long v2, v23, v25

    .line 232
    add-long v17, v17, v2

    move-wide/from16 v0, v17

    long-to-int v0, v0

    move/from16 v23, v0

    const v24, 0x3ffffff

    and-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    const/16 v23, 0x1a

    ushr-long v23, v17, v23

    const-wide/16 v25, -0x1

    and-long v2, v23, v25

    .line 233
    add-long v19, v19, v2

    move-wide/from16 v0, v19

    long-to-int v0, v0

    move/from16 v23, v0

    const v24, 0x3ffffff

    and-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    const/16 v23, 0x1a

    ushr-long v2, v19, v23

    .line 234
    add-long v21, v21, v2

    move-wide/from16 v0, v21

    long-to-int v0, v0

    move/from16 v23, v0

    const v24, 0x3ffffff

    and-int v23, v23, v24

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    const/16 v23, 0x1a

    ushr-long v2, v21, v23

    .line 235
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x5

    mul-long v25, v25, v2

    add-long v23, v23, v25

    move-wide/from16 v0, v23

    long-to-int v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 236
    return-void
.end method

.method private setKey([B[B)V
    .registers 13
    .param p1, "key"    # [B
    .param p2, "nonce"    # [B

    .prologue
    const/16 v9, 0x10

    const/4 v8, 0x0

    .line 114
    iget-object v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    if-eqz v5, :cond_14

    if-eqz p2, :cond_c

    array-length v5, p2

    if-eq v5, v9, :cond_14

    .line 116
    :cond_c
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Poly1305 requires a 128 bit IV."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 119
    :cond_14
    invoke-static {p1}, Lorg/spongycastle/crypto/generators/Poly1305KeyGenerator;->checkKey([B)V

    .line 122
    invoke-static {p1, v9}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v1

    .line 123
    .local v1, "t0":I
    const/16 v5, 0x14

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v2

    .line 124
    .local v2, "t1":I
    const/16 v5, 0x18

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v3

    .line 125
    .local v3, "t2":I
    const/16 v5, 0x1c

    invoke-static {p1, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v4

    .line 127
    .local v4, "t3":I
    const v5, 0x3ffffff

    and-int/2addr v5, v1

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r0:I

    ushr-int/lit8 v1, v1, 0x1a

    shl-int/lit8 v5, v2, 0x6

    or-int/2addr v1, v5

    .line 128
    const v5, 0x3ffff03

    and-int/2addr v5, v1

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    ushr-int/lit8 v2, v2, 0x14

    shl-int/lit8 v5, v3, 0xc

    or-int/2addr v2, v5

    .line 129
    const v5, 0x3ffc0ff

    and-int/2addr v5, v2

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    ushr-int/lit8 v3, v3, 0xe

    shl-int/lit8 v5, v4, 0x12

    or-int/2addr v3, v5

    .line 130
    const v5, 0x3f03fff

    and-int/2addr v5, v3

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    ushr-int/lit8 v4, v4, 0x8

    .line 131
    const v5, 0xfffff

    and-int/2addr v5, v4

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r4:I

    .line 134
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r1:I

    mul-int/lit8 v5, v5, 0x5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s1:I

    .line 135
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r2:I

    mul-int/lit8 v5, v5, 0x5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s2:I

    .line 136
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r3:I

    mul-int/lit8 v5, v5, 0x5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s3:I

    .line 137
    iget v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->r4:I

    mul-int/lit8 v5, v5, 0x5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->s4:I

    .line 140
    iget-object v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    if-nez v5, :cond_97

    .line 142
    move-object v0, p1

    .line 152
    .local v0, "kBytes":[B
    :goto_79
    invoke-static {v0, v8}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k0:I

    .line 153
    const/4 v5, 0x4

    invoke-static {v0, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k1:I

    .line 154
    const/16 v5, 0x8

    invoke-static {v0, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k2:I

    .line 155
    const/16 v5, 0xc

    invoke-static {v0, v5}, Lorg/spongycastle/util/Pack;->littleEndianToInt([BI)I

    move-result v5

    iput v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->k3:I

    .line 156
    return-void

    .line 147
    .end local v0    # "kBytes":[B
    :cond_97
    new-array v0, v9, [B

    .line 148
    .restart local v0    # "kBytes":[B
    iget-object v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    const/4 v6, 0x1

    new-instance v7, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v7, p1, v8, v9}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    invoke-interface {v5, v6, v7}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 149
    iget-object v5, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v5, p2, v8, v0, v8}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    goto :goto_79
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 27
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 242
    add-int/lit8 v18, p2, 0x10

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_15

    .line 244
    new-instance v18, Lorg/spongycastle/crypto/DataLengthException;

    const-string v19, "Output buffer is too short."

    invoke-direct/range {v18 .. v19}, Lorg/spongycastle/crypto/DataLengthException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 247
    :cond_15
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    move/from16 v18, v0

    if-lez v18, :cond_20

    .line 250
    invoke-direct/range {p0 .. p0}, Lorg/spongycastle/crypto/macs/Poly1305;->processBlock()V

    .line 255
    :cond_20
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    ushr-int/lit8 v3, v18, 0x1a

    .line 256
    .local v3, "b":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    const v19, 0x3ffffff

    and-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 257
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    add-int v18, v18, v3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    ushr-int/lit8 v3, v18, 0x1a

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    const v19, 0x3ffffff

    and-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 258
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    add-int v18, v18, v3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    ushr-int/lit8 v3, v18, 0x1a

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    const v19, 0x3ffffff

    and-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 259
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    add-int v18, v18, v3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    ushr-int/lit8 v3, v18, 0x1a

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    const v19, 0x3ffffff

    and-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 260
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v18, v0

    add-int v18, v18, v3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v18, v0

    ushr-int/lit8 v3, v18, 0x1a

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v18, v0

    const v19, 0x3ffffff

    and-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 261
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    mul-int/lit8 v19, v3, 0x5

    add-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 264
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    add-int/lit8 v12, v18, 0x5

    .local v12, "g0":I
    ushr-int/lit8 v3, v12, 0x1a

    const v18, 0x3ffffff

    and-int v12, v12, v18

    .line 265
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    add-int v13, v18, v3

    .local v13, "g1":I
    ushr-int/lit8 v3, v13, 0x1a

    const v18, 0x3ffffff

    and-int v13, v13, v18

    .line 266
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    add-int v14, v18, v3

    .local v14, "g2":I
    ushr-int/lit8 v3, v14, 0x1a

    const v18, 0x3ffffff

    and-int v14, v14, v18

    .line 267
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    add-int v15, v18, v3

    .local v15, "g3":I
    ushr-int/lit8 v3, v15, 0x1a

    const v18, 0x3ffffff

    and-int v15, v15, v18

    .line 268
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v18, v0

    add-int v18, v18, v3

    const/high16 v19, 0x4000000

    sub-int v16, v18, v19

    .line 270
    .local v16, "g4":I
    ushr-int/lit8 v18, v16, 0x1f

    add-int/lit8 v3, v18, -0x1

    .line 271
    xor-int/lit8 v17, v3, -0x1

    .line 272
    .local v17, "nb":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    and-int v18, v18, v17

    and-int v19, v12, v3

    or-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 273
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    and-int v18, v18, v17

    and-int v19, v13, v3

    or-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    .line 274
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    and-int v18, v18, v17

    and-int v19, v14, v3

    or-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    .line 275
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    and-int v18, v18, v17

    and-int v19, v15, v3

    or-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    .line 276
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v18, v0

    and-int v18, v18, v17

    and-int v19, v16, v3

    or-int v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    .line 278
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v19, v0

    shl-int/lit8 v19, v19, 0x1a

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    const-wide v20, 0xffffffffL

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->k0:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    and-long v20, v20, v22

    add-long v4, v18, v20

    .line 279
    .local v4, "f0":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    move/from16 v18, v0

    ushr-int/lit8 v18, v18, 0x6

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v19, v0

    shl-int/lit8 v19, v19, 0x14

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    const-wide v20, 0xffffffffL

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->k1:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    and-long v20, v20, v22

    add-long v6, v18, v20

    .line 280
    .local v6, "f1":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    move/from16 v18, v0

    ushr-int/lit8 v18, v18, 0xc

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v19, v0

    shl-int/lit8 v19, v19, 0xe

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    const-wide v20, 0xffffffffL

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->k2:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    and-long v20, v20, v22

    add-long v8, v18, v20

    .line 281
    .local v8, "f2":J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    move/from16 v18, v0

    ushr-int/lit8 v18, v18, 0x12

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    move/from16 v19, v0

    shl-int/lit8 v19, v19, 0x8

    or-int v18, v18, v19

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0xffffffffL

    and-long v18, v18, v20

    const-wide v20, 0xffffffffL

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/crypto/macs/Poly1305;->k3:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    and-long v20, v20, v22

    add-long v10, v18, v20

    .line 283
    .local v10, "f3":J
    long-to-int v0, v4

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 284
    const/16 v18, 0x20

    ushr-long v18, v4, v18

    add-long v6, v6, v18

    .line 285
    long-to-int v0, v6

    move/from16 v18, v0

    add-int/lit8 v19, p2, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 286
    const/16 v18, 0x20

    ushr-long v18, v6, v18

    add-long v8, v8, v18

    .line 287
    long-to-int v0, v8

    move/from16 v18, v0

    add-int/lit8 v19, p2, 0x8

    move/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 288
    const/16 v18, 0x20

    ushr-long v18, v8, v18

    add-long v10, v10, v18

    .line 289
    long-to-int v0, v10

    move/from16 v18, v0

    add-int/lit8 v19, p2, 0xc

    move/from16 v0, v18

    move-object/from16 v1, p1

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Lorg/spongycastle/util/Pack;->intToLittleEndian(I[BI)V

    .line 291
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/crypto/macs/Poly1305;->reset()V

    .line 292
    const/16 v18, 0x10

    return v18
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    if-nez v0, :cond_7

    const-string v0, "Poly1305"

    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Poly1305-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getMacSize()I
    .registers 2

    .prologue
    .line 165
    const/16 v0, 0x10

    return v0
.end method

.method public init(Lorg/spongycastle/crypto/CipherParameters;)V
    .registers 7
    .param p1, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 86
    const/4 v2, 0x0

    .line 88
    .local v2, "nonce":[B
    iget-object v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->cipher:Lorg/spongycastle/crypto/BlockCipher;

    if-eqz v3, :cond_1c

    .line 90
    instance-of v3, p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-nez v3, :cond_11

    .line 92
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Poly1305 requires an IV when used with a block cipher."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_11
    move-object v0, p1

    .line 95
    check-cast v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 96
    .local v0, "ivParams":Lorg/spongycastle/crypto/params/ParametersWithIV;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v2

    .line 97
    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object p1

    .line 100
    .end local v0    # "ivParams":Lorg/spongycastle/crypto/params/ParametersWithIV;
    :cond_1c
    instance-of v3, p1, Lorg/spongycastle/crypto/params/KeyParameter;

    if-nez v3, :cond_28

    .line 102
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Poly1305 requires a key."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_28
    move-object v1, p1

    .line 105
    check-cast v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 107
    .local v1, "keyParams":Lorg/spongycastle/crypto/params/KeyParameter;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/params/KeyParameter;->getKey()[B

    move-result-object v3

    invoke-direct {p0, v3, v2}, Lorg/spongycastle/crypto/macs/Poly1305;->setKey([B[B)V

    .line 109
    invoke-virtual {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->reset()V

    .line 110
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 297
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 299
    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h4:I

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h3:I

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h2:I

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h1:I

    iput v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->h0:I

    .line 300
    return-void
.end method

.method public update(B)V
    .registers 5
    .param p1, "in"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 171
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    aput-byte p1, v0, v2

    .line 172
    iget-object v0, p0, Lorg/spongycastle/crypto/macs/Poly1305;->singleByte:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/spongycastle/crypto/macs/Poly1305;->update([BII)V

    .line 173
    return-void
.end method

.method public update([BII)V
    .registers 9
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 179
    const/4 v0, 0x0

    .line 180
    .local v0, "copied":I
    :goto_1
    if-le p3, v0, :cond_29

    .line 182
    iget v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    const/16 v3, 0x10

    if-ne v2, v3, :cond_f

    .line 184
    invoke-direct {p0}, Lorg/spongycastle/crypto/macs/Poly1305;->processBlock()V

    .line 185
    const/4 v2, 0x0

    iput v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    .line 188
    :cond_f
    sub-int v2, p3, v0

    iget v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    rsub-int/lit8 v3, v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 189
    .local v1, "toCopy":I
    add-int v2, v0, p2

    iget-object v3, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlock:[B

    iget v4, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    invoke-static {p1, v2, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 190
    add-int/2addr v0, v1

    .line 191
    iget v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/spongycastle/crypto/macs/Poly1305;->currentBlockOffset:I

    goto :goto_1

    .line 194
    .end local v1    # "toCopy":I
    :cond_29
    return-void
.end method
