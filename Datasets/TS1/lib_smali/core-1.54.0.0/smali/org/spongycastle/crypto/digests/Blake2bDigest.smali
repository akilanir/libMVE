.class public Lorg/spongycastle/crypto/digests/Blake2bDigest;
.super Ljava/lang/Object;
.source "Blake2bDigest.java"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;


# static fields
.field private static final BLOCK_LENGTH_BYTES:I = 0x80

.field private static final blake2b_IV:[J

.field private static final blake2b_sigma:[[B

.field private static rOUNDS:I


# instance fields
.field private buffer:[B

.field private bufferPos:I

.field private chainValue:[J

.field private digestLength:I

.field private f0:J

.field private internalState:[J

.field private key:[B

.field private keyLength:I

.field private personalization:[B

.field private salt:[B

.field private t0:J

.field private t1:J


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/16 v5, 0xc

    const/16 v4, 0x8

    const/16 v3, 0x10

    .line 46
    new-array v0, v4, [J

    fill-array-data v0, :array_76

    sput-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    .line 56
    new-array v0, v5, [[B

    const/4 v1, 0x0

    new-array v2, v3, [B

    fill-array-data v2, :array_9a

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-array v2, v3, [B

    fill-array-data v2, :array_a6

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-array v2, v3, [B

    fill-array-data v2, :array_b2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-array v2, v3, [B

    fill-array-data v2, :array_be

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-array v2, v3, [B

    fill-array-data v2, :array_ca

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v3, [B

    fill-array-data v2, :array_d6

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v3, [B

    fill-array-data v2, :array_e2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v3, [B

    fill-array-data v2, :array_ee

    aput-object v2, v0, v1

    new-array v1, v3, [B

    fill-array-data v1, :array_fa

    aput-object v1, v0, v4

    const/16 v1, 0x9

    new-array v2, v3, [B

    fill-array-data v2, :array_106

    aput-object v2, v0, v1

    const/16 v1, 0xa

    new-array v2, v3, [B

    fill-array-data v2, :array_112

    aput-object v2, v0, v1

    const/16 v1, 0xb

    new-array v2, v3, [B

    fill-array-data v2, :array_11e

    aput-object v2, v0, v1

    sput-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    .line 72
    sput v5, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rOUNDS:I

    return-void

    .line 46
    :array_76
    .array-data 8
        0x6a09e667f3bcc908L    # 6.344059688352415E202
        -0x4498517a7b3558c5L    # -1.5671250923562117E-22
        0x3c6ef372fe94f82bL    # 1.342284505169847E-17
        -0x5ab00ac5a0e2c90fL
        0x510e527fade682d1L    # 2.876275032471325E82
        -0x64fa9773d4c193e1L
        0x1f83d9abfb41bd6bL    # 7.229011495228878E-157
        0x5be0cd19137e2179L    # 3.816167663240759E134
    .end array-data

    .line 56
    :array_9a
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
    .end array-data

    :array_a6
    .array-data 1
        0xet
        0xat
        0x4t
        0x8t
        0x9t
        0xft
        0xdt
        0x6t
        0x1t
        0xct
        0x0t
        0x2t
        0xbt
        0x7t
        0x5t
        0x3t
    .end array-data

    :array_b2
    .array-data 1
        0xbt
        0x8t
        0xct
        0x0t
        0x5t
        0x2t
        0xft
        0xdt
        0xat
        0xet
        0x3t
        0x6t
        0x7t
        0x1t
        0x9t
        0x4t
    .end array-data

    :array_be
    .array-data 1
        0x7t
        0x9t
        0x3t
        0x1t
        0xdt
        0xct
        0xbt
        0xet
        0x2t
        0x6t
        0x5t
        0xat
        0x4t
        0x0t
        0xft
        0x8t
    .end array-data

    :array_ca
    .array-data 1
        0x9t
        0x0t
        0x5t
        0x7t
        0x2t
        0x4t
        0xat
        0xft
        0xet
        0x1t
        0xbt
        0xct
        0x6t
        0x8t
        0x3t
        0xdt
    .end array-data

    :array_d6
    .array-data 1
        0x2t
        0xct
        0x6t
        0xat
        0x0t
        0xbt
        0x8t
        0x3t
        0x4t
        0xdt
        0x7t
        0x5t
        0xft
        0xet
        0x1t
        0x9t
    .end array-data

    :array_e2
    .array-data 1
        0xct
        0x5t
        0x1t
        0xft
        0xet
        0xdt
        0x4t
        0xat
        0x0t
        0x7t
        0x6t
        0x3t
        0x9t
        0x2t
        0x8t
        0xbt
    .end array-data

    :array_ee
    .array-data 1
        0xdt
        0xbt
        0x7t
        0xet
        0xct
        0x1t
        0x3t
        0x9t
        0x5t
        0x0t
        0xft
        0x4t
        0x8t
        0x6t
        0x2t
        0xat
    .end array-data

    :array_fa
    .array-data 1
        0x6t
        0xft
        0xet
        0x9t
        0xbt
        0x3t
        0x0t
        0x8t
        0xct
        0x2t
        0xdt
        0x7t
        0x1t
        0x4t
        0xat
        0x5t
    .end array-data

    :array_106
    .array-data 1
        0xat
        0x2t
        0x8t
        0x4t
        0x7t
        0x6t
        0x1t
        0x5t
        0xft
        0xbt
        0x9t
        0xet
        0x3t
        0xct
        0xdt
        0x0t
    .end array-data

    :array_112
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
    .end array-data

    :array_11e
    .array-data 1
        0xet
        0xat
        0x4t
        0x8t
        0x9t
        0xft
        0xdt
        0x6t
        0x1t
        0xct
        0x0t
        0x2t
        0xbt
        0x7t
        0x5t
        0x3t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 114
    const/16 v0, 0x200

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;-><init>(I)V

    .line 115
    return-void
.end method

.method public constructor <init>(I)V
    .registers 7
    .param p1, "digestLength"    # I

    .prologue
    const-wide/16 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/16 v0, 0x40

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 77
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 78
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 79
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 82
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 96
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 98
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 100
    const/16 v0, 0x10

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 102
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 105
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 106
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 107
    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 130
    const/16 v0, 0xa0

    if-eq p1, v0, :cond_3d

    const/16 v0, 0x100

    if-eq p1, v0, :cond_3d

    const/16 v0, 0x180

    if-eq p1, v0, :cond_3d

    const/16 v0, 0x200

    if-eq p1, v0, :cond_3d

    .line 132
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Blake2b digest restricted to one of [160, 256, 384, 512]"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_3d
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 136
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 137
    div-int/lit8 v0, p1, 0x8

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 138
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 139
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/Blake2bDigest;)V
    .registers 7
    .param p1, "digest"    # Lorg/spongycastle/crypto/digests/Blake2bDigest;

    .prologue
    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/16 v0, 0x40

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 77
    iput v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 78
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 79
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 82
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 96
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 98
    iput v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 100
    const/16 v0, 0x10

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 102
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 105
    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 106
    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 107
    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 119
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 120
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 121
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 122
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 123
    iget v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 124
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([J)[J

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 125
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 126
    return-void
.end method

.method public constructor <init>([B)V
    .registers 9
    .param p1, "key"    # [B

    .prologue
    const/16 v6, 0x80

    const-wide/16 v4, 0x0

    const/16 v3, 0x40

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 77
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 78
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 79
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 82
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 96
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 98
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 100
    const/16 v0, 0x10

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 102
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 105
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 106
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 107
    iput-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 152
    new-array v0, v6, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 153
    if-eqz p1, :cond_4e

    .line 155
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 156
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 158
    array-length v0, p1

    if-le v0, v3, :cond_43

    .line 160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Keys > 64 are not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :cond_43
    array-length v0, p1

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 164
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 165
    iput v6, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 167
    :cond_4e
    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 168
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 169
    return-void
.end method

.method public constructor <init>([BI[B[B)V
    .registers 12
    .param p1, "key"    # [B
    .param p2, "digestLength"    # I
    .param p3, "salt"    # [B
    .param p4, "personalization"    # [B

    .prologue
    const-wide/16 v5, 0x0

    const/16 v4, 0x40

    const/4 v1, 0x0

    const/16 v3, 0x10

    const/4 v2, 0x0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 77
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 78
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 79
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 82
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 96
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 98
    iput v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 100
    new-array v0, v3, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    .line 102
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 105
    iput-wide v5, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 106
    iput-wide v5, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 107
    iput-wide v5, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 187
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    .line 188
    const/4 v0, 0x1

    if-lt p2, v0, :cond_30

    if-le p2, v4, :cond_38

    .line 190
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid digest length (required: 1 - 64)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_38
    iput p2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    .line 194
    if-eqz p3, :cond_51

    .line 196
    array-length v0, p3

    if-eq v0, v3, :cond_47

    .line 198
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "salt length must be exactly 16 bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 201
    :cond_47
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    .line 202
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    array-length v1, p3

    invoke-static {p3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    :cond_51
    if-eqz p4, :cond_68

    .line 206
    array-length v0, p4

    if-eq v0, v3, :cond_5e

    .line 208
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "personalization length must be exactly 16 bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_5e
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    .line 212
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    array-length v1, p4

    invoke-static {p4, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 215
    :cond_68
    if-eqz p1, :cond_8d

    .line 217
    array-length v0, p1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    .line 218
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    array-length v0, p1

    if-le v0, v4, :cond_80

    .line 222
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Keys > 64 are not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_80
    array-length v0, p1

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    .line 226
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 227
    const/16 v0, 0x80

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 229
    :cond_8d
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 230
    return-void
.end method

.method private G(JJIIII)V
    .registers 14
    .param p1, "m1"    # J
    .param p3, "m2"    # J
    .param p5, "posA"    # I
    .param p6, "posB"    # I
    .param p7, "posC"    # I
    .param p8, "posD"    # I

    .prologue
    .line 481
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p5

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p6

    add-long/2addr v1, v3

    add-long/2addr v1, p1

    aput-wide v1, v0, p5

    .line 482
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p8

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p5

    xor-long/2addr v1, v3

    const/16 v3, 0x20

    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    move-result-wide v1

    aput-wide v1, v0, p8

    .line 484
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p7

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p8

    add-long/2addr v1, v3

    aput-wide v1, v0, p7

    .line 485
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p6

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p7

    xor-long/2addr v1, v3

    const/16 v3, 0x18

    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    move-result-wide v1

    aput-wide v1, v0, p6

    .line 487
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p5

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p6

    add-long/2addr v1, v3

    add-long/2addr v1, p3

    aput-wide v1, v0, p5

    .line 488
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p8

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p5

    xor-long/2addr v1, v3

    const/16 v3, 0x10

    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    move-result-wide v1

    aput-wide v1, v0, p8

    .line 490
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p7

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p8

    add-long/2addr v1, v3

    aput-wide v1, v0, p7

    .line 491
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v1, v1, p6

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, p7

    xor-long/2addr v1, v3

    const/16 v3, 0x3f

    invoke-direct {p0, v1, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rotr64(JI)J

    move-result-wide v1

    aput-wide v1, v0, p6

    .line 493
    return-void
.end method

.method private final bytes2long([BI)J
    .registers 10
    .param p1, "byteArray"    # [B
    .param p2, "offset"    # I

    .prologue
    const-wide/16 v5, 0xff

    .line 515
    aget-byte v0, p1, p2

    int-to-long v0, v0

    and-long/2addr v0, v5

    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x8

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x3

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x4

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x5

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x6

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    add-int/lit8 v2, p2, 0x7

    aget-byte v2, p1, v2

    int-to-long v2, v2

    and-long/2addr v2, v5

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private compress([BI)V
    .registers 16
    .param p1, "message"    # [B
    .param p2, "messagePos"    # I

    .prologue
    .line 438
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->initializeInternalState()V

    .line 440
    const/16 v0, 0x10

    new-array v10, v0, [J

    .line 441
    .local v10, "m":[J
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_8
    const/16 v0, 0x10

    if-ge v9, v0, :cond_18

    .line 443
    mul-int/lit8 v0, v9, 0x8

    add-int/2addr v0, p2

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    move-result-wide v0

    aput-wide v0, v10, v9

    .line 441
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    .line 446
    :cond_18
    const/4 v12, 0x0

    .local v12, "round":I
    :goto_19
    sget v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->rOUNDS:I

    if-ge v12, v0, :cond_109

    .line 451
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v3, 0x1

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/16 v7, 0x8

    const/16 v8, 0xc

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 453
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v1, 0x2

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v3, 0x3

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x1

    const/4 v6, 0x5

    const/16 v7, 0x9

    const/16 v8, 0xd

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 455
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v1, 0x4

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v3, 0x5

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x2

    const/4 v6, 0x6

    const/16 v7, 0xa

    const/16 v8, 0xe

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 457
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v1, 0x6

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/4 v3, 0x7

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x3

    const/4 v6, 0x7

    const/16 v7, 0xb

    const/16 v8, 0xf

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 460
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v1, 0x8

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v3, 0x9

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x0

    const/4 v6, 0x5

    const/16 v7, 0xa

    const/16 v8, 0xf

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 462
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v1, 0xa

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v3, 0xb

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x1

    const/4 v6, 0x6

    const/16 v7, 0xb

    const/16 v8, 0xc

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 464
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v1, 0xc

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v3, 0xd

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x2

    const/4 v6, 0x7

    const/16 v7, 0x8

    const/16 v8, 0xd

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 466
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v1, 0xe

    aget-byte v0, v0, v1

    aget-wide v1, v10, v0

    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_sigma:[[B

    aget-object v0, v0, v12

    const/16 v3, 0xf

    aget-byte v0, v0, v3

    aget-wide v3, v10, v0

    const/4 v5, 0x3

    const/4 v6, 0x4

    const/16 v7, 0x9

    const/16 v8, 0xe

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->G(JJIIII)V

    .line 446
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_19

    .line 471
    :cond_109
    const/4 v11, 0x0

    .local v11, "offset":I
    :goto_10a
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    array-length v0, v0

    if-ge v11, v0, :cond_126

    .line 473
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v1, v1, v11

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    aget-wide v3, v3, v11

    xor-long/2addr v1, v3

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    add-int/lit8 v4, v11, 0x8

    aget-wide v3, v3, v4

    xor-long/2addr v1, v3

    aput-wide v1, v0, v11

    .line 471
    add-int/lit8 v11, v11, 0x1

    goto :goto_10a

    .line 476
    :cond_126
    return-void
.end method

.method private init()V
    .registers 11

    .prologue
    const/4 v9, 0x7

    const/4 v8, 0x6

    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x0

    .line 236
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    if-nez v0, :cond_a1

    .line 238
    const/16 v0, 0x8

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 240
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    sget-object v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v1, v1, v5

    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    iget v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->keyLength:I

    shl-int/lit8 v4, v4, 0x8

    or-int/2addr v3, v4

    const/high16 v4, 0x1010000

    or-int/2addr v3, v4

    int-to-long v3, v3

    xor-long/2addr v1, v3

    aput-wide v1, v0, v5

    .line 245
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const/4 v1, 0x1

    sget-object v2, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v3, 0x1

    aget-wide v2, v2, v3

    aput-wide v2, v0, v1

    .line 246
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v3, 0x2

    aget-wide v2, v2, v3

    aput-wide v2, v0, v1

    .line 250
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    const/4 v1, 0x3

    sget-object v2, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v3, 0x3

    aget-wide v2, v2, v3

    aput-wide v2, v0, v1

    .line 252
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    sget-object v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v1, v1, v6

    aput-wide v1, v0, v6

    .line 253
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    sget-object v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v1, v1, v7

    aput-wide v1, v0, v7

    .line 254
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    if-eqz v0, :cond_71

    .line 256
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v1, v0, v6

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    invoke-direct {p0, v3, v5}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    move-result-wide v3

    xor-long/2addr v1, v3

    aput-wide v1, v0, v6

    .line 257
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v1, v0, v7

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    const/16 v4, 0x8

    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    move-result-wide v3

    xor-long/2addr v1, v3

    aput-wide v1, v0, v7

    .line 260
    :cond_71
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    sget-object v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v1, v1, v8

    aput-wide v1, v0, v8

    .line 261
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    sget-object v1, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v1, v1, v9

    aput-wide v1, v0, v9

    .line 262
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    if-eqz v0, :cond_a1

    .line 264
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v1, v0, v8

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    invoke-direct {p0, v3, v5}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    move-result-wide v3

    xor-long/2addr v1, v3

    aput-wide v1, v0, v8

    .line 265
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v1, v0, v9

    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->personalization:[B

    const/16 v4, 0x8

    invoke-direct {p0, v3, v4}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bytes2long([BI)J

    move-result-wide v3

    xor-long/2addr v1, v3

    aput-wide v1, v0, v9

    .line 268
    :cond_a1
    return-void
.end method

.method private initializeInternalState()V
    .registers 7

    .prologue
    const/4 v5, 0x4

    const/4 v3, 0x0

    .line 273
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 274
    sget-object v0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    array-length v2, v2

    invoke-static {v0, v3, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 275
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    const/16 v1, 0xc

    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    sget-object v4, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    aget-wide v4, v4, v5

    xor-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 276
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    const/16 v1, 0xd

    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    sget-object v4, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v5, 0x5

    aget-wide v4, v4, v5

    xor-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 277
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    const/16 v1, 0xe

    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    sget-object v4, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v5, 0x6

    aget-wide v4, v4, v5

    xor-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 278
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    const/16 v1, 0xf

    sget-object v2, Lorg/spongycastle/crypto/digests/Blake2bDigest;->blake2b_IV:[J

    const/4 v3, 0x7

    aget-wide v2, v2, v3

    aput-wide v2, v0, v1

    .line 279
    return-void
.end method

.method private final long2bytes(J)[B
    .registers 7
    .param p1, "longValue"    # J

    .prologue
    const/16 v3, 0x8

    .line 504
    new-array v0, v3, [B

    const/4 v1, 0x0

    long-to-int v2, p1

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    shr-long v2, p1, v3

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x10

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    const/16 v2, 0x18

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x20

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x28

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x30

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x38

    shr-long v2, p1, v2

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method private rotr64(JI)J
    .registers 8
    .param p1, "x"    # J
    .param p3, "rot"    # I

    .prologue
    .line 497
    ushr-long v0, p1, p3

    rsub-int/lit8 v2, p3, 0x40

    shl-long v2, p1, v2

    or-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public clearKey()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 562
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    if-eqz v0, :cond_f

    .line 564
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 565
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 567
    :cond_f
    return-void
.end method

.method public clearSalt()V
    .registers 3

    .prologue
    .line 575
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    if-eqz v0, :cond_a

    .line 577
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->salt:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 579
    :cond_a
    return-void
.end method

.method public doFinal([BI)I
    .registers 12
    .param p1, "out"    # [B
    .param p2, "outOffset"    # I

    .prologue
    const-wide/16 v7, 0x0

    const/4 v6, 0x0

    .line 382
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 383
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    iget v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 386
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    cmp-long v2, v2, v7

    if-gez v2, :cond_26

    iget v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    int-to-long v2, v2

    iget-wide v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    neg-long v4, v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_26

    .line 388
    iget-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 390
    :cond_26
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-direct {p0, v2, v6}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 391
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v2, v6}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 392
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->internalState:[J

    invoke-static {v2, v7, v8}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 394
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_36
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    array-length v2, v2

    if-ge v1, v2, :cond_68

    mul-int/lit8 v2, v1, 0x8

    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    if-ge v2, v3, :cond_68

    .line 396
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    aget-wide v2, v2, v1

    invoke-direct {p0, v2, v3}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->long2bytes(J)[B

    move-result-object v0

    .line 398
    .local v0, "bytes":[B
    mul-int/lit8 v2, v1, 0x8

    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    add-int/lit8 v3, v3, -0x8

    if-ge v2, v3, :cond_5c

    .line 400
    mul-int/lit8 v2, v1, 0x8

    add-int/2addr v2, p2

    const/16 v3, 0x8

    invoke-static {v0, v6, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 394
    :goto_59
    add-int/lit8 v1, v1, 0x1

    goto :goto_36

    .line 404
    :cond_5c
    mul-int/lit8 v2, v1, 0x8

    add-int/2addr v2, p2

    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    mul-int/lit8 v4, v1, 0x8

    sub-int/2addr v3, v4

    invoke-static {v0, v6, p1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_59

    .line 408
    .end local v0    # "bytes":[B
    :cond_68
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    invoke-static {v2, v7, v8}, Lorg/spongycastle/util/Arrays;->fill([JJ)V

    .line 410
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->reset()V

    .line 412
    iget v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    return v2
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 532
    const-string v0, "Blake2b"

    return-object v0
.end method

.method public getByteLength()I
    .registers 2

    .prologue
    .line 553
    const/16 v0, 0x80

    return v0
.end method

.method public getDigestSize()I
    .registers 2

    .prologue
    .line 542
    iget v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->digestLength:I

    return v0
.end method

.method public reset()V
    .registers 5

    .prologue
    const-wide/16 v0, 0x0

    const/4 v3, 0x0

    .line 422
    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 423
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->f0:J

    .line 424
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 425
    iput-wide v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 426
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->chainValue:[J

    .line 427
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    if-eqz v0, :cond_20

    .line 429
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    iget-object v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->key:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 430
    const/16 v0, 0x80

    iput v0, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 432
    :cond_20
    invoke-direct {p0}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->init()V

    .line 433
    return-void
.end method

.method public update(B)V
    .registers 8
    .param p1, "b"    # B

    .prologue
    const/4 v5, 0x0

    .line 288
    const/4 v0, 0x0

    .line 291
    .local v0, "remainingLength":I
    iget v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    rsub-int v0, v1, 0x80

    .line 292
    if-nez v0, :cond_30

    .line 294
    iget-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    const-wide/16 v3, 0x80

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 295
    iget-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1e

    .line 297
    iget-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 299
    :cond_1e
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-direct {p0, v1, v5}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 300
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v1, v5}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 301
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    aput-byte p1, v1, v5

    .line 302
    const/4 v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 309
    :goto_2f
    return-void

    .line 305
    :cond_30
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    iget v2, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    aput-byte p1, v1, v2

    .line 306
    iget v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    goto :goto_2f
.end method

.method public update([BII)V
    .registers 16
    .param p1, "message"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    const-wide/16 v10, 0x80

    const-wide/16 v8, 0x1

    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    .line 321
    if-eqz p1, :cond_b

    if-nez p3, :cond_c

    .line 369
    :cond_b
    :goto_b
    return-void

    .line 324
    :cond_c
    const/4 v2, 0x0

    .line 326
    .local v2, "remainingLength":I
    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    if-eqz v3, :cond_3a

    .line 330
    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    rsub-int v2, v3, 0x80

    .line 331
    if-ge v2, p3, :cond_58

    .line 333
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    iget v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    invoke-static {p1, p2, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 335
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    add-long/2addr v3, v10

    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 336
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    cmp-long v3, v3, v6

    if-nez v3, :cond_2e

    .line 338
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    add-long/2addr v3, v8

    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 340
    :cond_2e
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-direct {p0, v3, v5}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 341
    iput v5, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    .line 342
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    invoke-static {v3, v5}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 353
    :cond_3a
    add-int v3, p2, p3

    add-int/lit8 v0, v3, -0x80

    .line 354
    .local v0, "blockWiseLastPos":I
    add-int v1, p2, v2

    .local v1, "messagePos":I
    :goto_40
    if-ge v1, v0, :cond_65

    .line 357
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    add-long/2addr v3, v10

    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    .line 358
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t0:J

    cmp-long v3, v3, v6

    if-nez v3, :cond_52

    .line 360
    iget-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    add-long/2addr v3, v8

    iput-wide v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->t1:J

    .line 362
    :cond_52
    invoke-direct {p0, p1, v1}, Lorg/spongycastle/crypto/digests/Blake2bDigest;->compress([BI)V

    .line 354
    add-int/lit16 v1, v1, 0x80

    goto :goto_40

    .line 345
    .end local v0    # "blockWiseLastPos":I
    .end local v1    # "messagePos":I
    :cond_58
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    iget v4, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    invoke-static {p1, p2, v3, v4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 346
    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    add-int/2addr v3, p3

    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    goto :goto_b

    .line 366
    .restart local v0    # "blockWiseLastPos":I
    .restart local v1    # "messagePos":I
    :cond_65
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->buffer:[B

    add-int v4, p2, p3

    sub-int/2addr v4, v1

    invoke-static {p1, v1, v3, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 368
    iget v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    add-int v4, p2, p3

    sub-int/2addr v4, v1

    add-int/2addr v3, v4

    iput v3, p0, Lorg/spongycastle/crypto/digests/Blake2bDigest;->bufferPos:I

    goto :goto_b
.end method
