.class public Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
.super Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
.source "GF2nONBElement.java"


# static fields
.field private static final MAXLONG:I = 0x40

.field private static final mBitmask:[J

.field private static final mIBY64:[I

.field private static final mMaxmask:[J


# instance fields
.field private mBit:I

.field private mLength:I

.field private mPol:[J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x40

    .line 23
    new-array v0, v1, [J

    fill-array-data v0, :array_1a

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    .line 46
    new-array v0, v1, [J

    fill-array-data v0, :array_11e

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mMaxmask:[J

    .line 73
    const/16 v0, 0x180

    new-array v0, v0, [I

    fill-array-data v0, :array_222

    sput-object v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mIBY64:[I

    return-void

    .line 23
    :array_1a
    .array-data 8
        0x1
        0x2
        0x4
        0x8
        0x10
        0x20
        0x40
        0x80
        0x100
        0x200
        0x400
        0x800
        0x1000
        0x2000
        0x4000
        0x8000
        0x10000
        0x20000
        0x40000
        0x80000
        0x100000
        0x200000
        0x400000
        0x800000
        0x1000000
        0x2000000
        0x4000000
        0x8000000
        0x10000000
        0x20000000
        0x40000000
        0x80000000L
        0x100000000L
        0x200000000L
        0x400000000L
        0x800000000L
        0x1000000000L
        0x2000000000L
        0x4000000000L
        0x8000000000L
        0x10000000000L
        0x20000000000L
        0x40000000000L
        0x80000000000L
        0x100000000000L
        0x200000000000L
        0x400000000000L
        0x800000000000L
        0x1000000000000L
        0x2000000000000L
        0x4000000000000L
        0x8000000000000L
        0x10000000000000L
        0x20000000000000L
        0x40000000000000L
        0x80000000000000L
        0x100000000000000L
        0x200000000000000L
        0x400000000000000L
        0x800000000000000L
        0x1000000000000000L
        0x2000000000000000L
        0x4000000000000000L    # 2.0
        -0x8000000000000000L
    .end array-data

    .line 46
    :array_11e
    .array-data 8
        0x1
        0x3
        0x7
        0xf
        0x1f
        0x3f
        0x7f
        0xff
        0x1ff
        0x3ff
        0x7ff
        0xfff
        0x1fff
        0x3fff
        0x7fff
        0xffff
        0x1ffff
        0x3ffff
        0x7ffff
        0xfffff
        0x1fffff
        0x3fffff
        0x7fffff
        0xffffff
        0x1ffffff
        0x3ffffff
        0x7ffffff
        0xfffffff
        0x1fffffff
        0x3fffffff
        0x7fffffff
        0xffffffffL
        0x1ffffffffL
        0x3ffffffffL
        0x7ffffffffL
        0xfffffffffL
        0x1fffffffffL
        0x3fffffffffL
        0x7fffffffffL
        0xffffffffffL
        0x1ffffffffffL
        0x3ffffffffffL
        0x7ffffffffffL
        0xfffffffffffL
        0x1fffffffffffL
        0x3fffffffffffL
        0x7fffffffffffL
        0xffffffffffffL
        0x1ffffffffffffL
        0x3ffffffffffffL    # 5.562684646268E-309
        0x7ffffffffffffL
        0xfffffffffffffL
        0x1fffffffffffffL
        0x3fffffffffffffL
        0x7fffffffffffffL
        0xffffffffffffffL
        0x1ffffffffffffffL    # 4.77830972673648E-299
        0x3ffffffffffffffL
        0x7ffffffffffffffL
        0xfffffffffffffffL
        0x1fffffffffffffffL
        0x3fffffffffffffffL    # 1.9999999999999998
        0x7fffffffffffffffL
        -0x1
    .end array-data

    .line 73
    :array_222
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x2
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x3
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x4
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
        0x5
    .end array-data
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V
    .registers 3
    .param p1, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .prologue
    .line 211
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;-><init>()V

    .line 213
    iget-object v0, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 214
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getDegree()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    .line 215
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    .line 216
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 217
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 218
    invoke-direct {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->getElement()[J

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([J)V

    .line 219
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;
    .param p2, "val"    # Ljava/math/BigInteger;

    .prologue
    .line 176
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;-><init>()V

    .line 177
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 178
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getDegree()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    .line 179
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    .line 180
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 181
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 182
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign(Ljava/math/BigInteger;)V

    .line 183
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;Ljava/security/SecureRandom;)V
    .registers 11
    .param p1, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;
    .param p2, "rand"    # Ljava/security/SecureRandom;

    .prologue
    const/4 v7, 0x0

    .line 130
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;-><init>()V

    .line 131
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 132
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getDegree()I

    move-result v3

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    .line 133
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v3

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    .line 134
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v3

    iput v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 135
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v3, v3, [J

    iput-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 136
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    const/4 v4, 0x1

    if-le v3, v4, :cond_4a

    .line 138
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_26
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_37

    .line 140
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v4

    aput-wide v4, v3, v0

    .line 138
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 142
    :cond_37
    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v1

    .line 143
    .local v1, "last":J
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v4, v4, -0x1

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    rsub-int/lit8 v5, v5, 0x40

    ushr-long v5, v1, v5

    aput-wide v5, v3, v4

    .line 150
    .end local v0    # "j":I
    .end local v1    # "last":J
    :goto_49
    return-void

    .line 147
    :cond_4a
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    invoke-virtual {p2}, Ljava/security/SecureRandom;->nextLong()J

    move-result-wide v4

    aput-wide v4, v3, v7

    .line 148
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v4, v4, v7

    iget v6, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    rsub-int/lit8 v6, v6, 0x40

    ushr-long/2addr v4, v6

    aput-wide v4, v3, v7

    goto :goto_49
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;[B)V
    .registers 4
    .param p1, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;
    .param p2, "e"    # [B

    .prologue
    .line 159
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;-><init>()V

    .line 160
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 161
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getDegree()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    .line 162
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    .line 163
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 164
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 165
    invoke-direct {p0, p2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([B)V

    .line 166
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;[J)V
    .registers 4
    .param p1, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;
    .param p2, "val"    # [J

    .prologue
    .line 193
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;-><init>()V

    .line 194
    iput-object p1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    .line 195
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->getDegree()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    .line 196
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    .line 197
    invoke-virtual {p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 198
    iput-object p2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 199
    return-void
.end method

.method public static ONE(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    .registers 7
    .param p0, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .prologue
    .line 251
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v1

    .line 252
    .local v1, "mLength":I
    new-array v2, v1, [J

    .line 255
    .local v2, "polynomial":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    add-int/lit8 v3, v1, -0x1

    if-ge v0, v3, :cond_12

    .line 257
    const-wide/16 v3, -0x1

    aput-wide v3, v2, v0

    .line 255
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 259
    :cond_12
    add-int/lit8 v3, v1, -0x1

    sget-object v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mMaxmask:[J

    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBBit()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    aget-wide v4, v4, v5

    aput-wide v4, v2, v3

    .line 261
    new-instance v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v3, p0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;[J)V

    return-object v3
.end method

.method public static ZERO(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    .registers 3
    .param p0, "gf2n"    # Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    .prologue
    .line 239
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->getONBLength()I

    move-result v1

    new-array v0, v1, [J

    .line 240
    .local v0, "polynomial":[J
    new-instance v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v1, p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;[J)V

    return-object v1
.end method

.method private assign(Ljava/math/BigInteger;)V
    .registers 3
    .param p1, "val"    # Ljava/math/BigInteger;

    .prologue
    .line 296
    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([B)V

    .line 297
    return-void
.end method

.method private assign([B)V
    .registers 11
    .param p1, "val"    # [B

    .prologue
    .line 320
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v1, v1, [J

    iput-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 321
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_7
    array-length v1, p1

    if-ge v0, v1, :cond_25

    .line 323
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    ushr-int/lit8 v2, v0, 0x3

    aget-wide v3, v1, v2

    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v0

    aget-byte v5, p1, v5

    int-to-long v5, v5

    const-wide/16 v7, 0xff

    and-long/2addr v5, v7

    and-int/lit8 v7, v0, 0x7

    shl-int/lit8 v7, v7, 0x3

    shl-long/2addr v5, v7

    or-long/2addr v3, v5

    aput-wide v3, v1, v2

    .line 321
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 325
    :cond_25
    return-void
.end method

.method private assign([J)V
    .registers 5
    .param p1, "val"    # [J

    .prologue
    const/4 v2, 0x0

    .line 306
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 307
    return-void
.end method

.method private getElement()[J
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 450
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    array-length v1, v1

    new-array v0, v1, [J

    .line 451
    .local v0, "result":[J
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 453
    return-object v0
.end method

.method private getElementReverseOrder()[J
    .registers 8

    .prologue
    .line 464
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    array-length v2, v2

    new-array v1, v2, [J

    .line 465
    .local v1, "result":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    if-ge v0, v2, :cond_25

    .line 467
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    sub-int/2addr v2, v0

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->testBit(I)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 469
    ushr-int/lit8 v2, v0, 0x6

    aget-wide v3, v1, v2

    sget-object v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    and-int/lit8 v6, v0, 0x3f

    aget-wide v5, v5, v6

    or-long/2addr v3, v5

    aput-wide v3, v1, v2

    .line 465
    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 472
    :cond_25
    return-object v1
.end method


# virtual methods
.method public add(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .registers 3
    .param p1, "addend"    # Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 497
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 498
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V

    .line 499
    return-object v0
.end method

.method public addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V
    .registers 9
    .param p1, "addend"    # Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 510
    instance-of v1, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    if-nez v1, :cond_a

    .line 512
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1

    .line 514
    :cond_a
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    move-object v1, p1

    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    iget-object v1, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    invoke-virtual {v2, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 516
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    throw v1

    .line 519
    :cond_1d
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    if-ge v0, v1, :cond_33

    .line 521
    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v3, v2, v0

    move-object v1, p1

    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    iget-object v1, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v5, v1, v0

    xor-long/2addr v3, v5

    aput-wide v3, v2, v0

    .line 519
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 523
    :cond_33
    return-void
.end method

.method assignOne()V
    .registers 6

    .prologue
    .line 282
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_10

    .line 284
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    const-wide/16 v2, -0x1

    aput-wide v2, v1, v0

    .line 282
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 286
    :cond_10
    iget-object v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v2, v2, -0x1

    sget-object v3, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mMaxmask:[J

    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v4, v4, -0x1

    aget-wide v3, v3, v4

    aput-wide v3, v1, v2

    .line 287
    return-void
.end method

.method assignZero()V
    .registers 2

    .prologue
    .line 273
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 274
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 228
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 383
    if-eqz p1, :cond_7

    instance-of v3, p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    if-nez v3, :cond_8

    .line 398
    :cond_7
    :goto_7
    return v2

    :cond_8
    move-object v1, p1

    .line 388
    check-cast v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .line 390
    .local v1, "otherElem":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    if-ge v0, v3, :cond_1f

    .line 392
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v3, v3, v0

    iget-object v5, v1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v5, v5, v0

    cmp-long v3, v3, v5

    if-nez v3, :cond_7

    .line 390
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 398
    :cond_1f
    const/4 v2, 0x1

    goto :goto_7
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 406
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public increase()Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 2

    .prologue
    .line 532
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 533
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->increaseThis()V

    .line 534
    return-object v0
.end method

.method public increaseThis()V
    .registers 2

    .prologue
    .line 542
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    check-cast v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    invoke-static {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->ONE(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->addToThis(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V

    .line 543
    return-void
.end method

.method public invert()Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArithmeticException;
        }
    .end annotation

    .prologue
    .line 815
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 816
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->invertThis()V

    .line 817
    return-object v0
.end method

.method public invertThis()V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArithmeticException;
        }
    .end annotation

    .prologue
    const-wide/16 v11, 0x0

    .line 829
    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->isZero()Z

    move-result v7

    if-eqz v7, :cond_e

    .line 831
    new-instance v7, Ljava/lang/ArithmeticException;

    invoke-direct {v7}, Ljava/lang/ArithmeticException;-><init>()V

    throw v7

    .line 833
    :cond_e
    const/16 v6, 0x1f

    .line 836
    .local v6, "r":I
    const/4 v0, 0x0

    .local v0, "found":Z
    :goto_11
    if-nez v0, :cond_27

    if-ltz v6, :cond_27

    .line 839
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    int-to-long v7, v7

    sget-object v9, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v9, v9, v6

    and-long/2addr v7, v9

    cmp-long v7, v7, v11

    if-eqz v7, :cond_24

    .line 841
    const/4 v0, 0x1

    .line 836
    :cond_24
    add-int/lit8 v6, v6, -0x1

    goto :goto_11

    .line 844
    :cond_27
    add-int/lit8 v6, v6, 0x1

    .line 846
    iget-object v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    check-cast v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    invoke-static {v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->ZERO(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;)Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-result-object v4

    .line 847
    .local v4, "m":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    new-instance v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v5, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 849
    .local v5, "n":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    const/4 v3, 0x1

    .line 851
    .local v3, "k":I
    add-int/lit8 v1, v6, -0x1

    .local v1, "i":I
    :goto_39
    if-ltz v1, :cond_68

    .line 853
    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->clone()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "m":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    check-cast v4, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;

    .line 854
    .restart local v4    # "m":Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    const/4 v2, 0x1

    .local v2, "j":I
    :goto_42
    if-gt v2, v3, :cond_4a

    .line 856
    invoke-virtual {v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->squareThis()V

    .line 854
    add-int/lit8 v2, v2, 0x1

    goto :goto_42

    .line 859
    :cond_4a
    invoke-virtual {v5, v4}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->multiplyThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V

    .line 861
    shl-int/lit8 v3, v3, 0x1

    .line 862
    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    add-int/lit8 v7, v7, -0x1

    int-to-long v7, v7

    sget-object v9, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v9, v9, v1

    and-long/2addr v7, v9

    cmp-long v7, v7, v11

    if-eqz v7, :cond_65

    .line 864
    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->squareThis()V

    .line 866
    invoke-virtual {v5, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->multiplyThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V

    .line 868
    add-int/lit8 v3, v3, 0x1

    .line 851
    :cond_65
    add-int/lit8 v1, v1, -0x1

    goto :goto_39

    .line 871
    .end local v2    # "j":I
    :cond_68
    invoke-virtual {v5}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;->squareThis()V

    .line 872
    return-void
.end method

.method public isOne()Z
    .registers 9

    .prologue
    const-wide/16 v6, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 357
    const/4 v1, 0x1

    .line 359
    .local v1, "result":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v4, v4, -0x1

    if-ge v0, v4, :cond_1f

    if-eqz v1, :cond_1f

    .line 361
    if-eqz v1, :cond_1d

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v4, v4, v0

    and-long/2addr v4, v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_1d

    move v1, v2

    .line 359
    :goto_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1d
    move v1, v3

    .line 361
    goto :goto_1a

    .line 365
    :cond_1f
    if-eqz v1, :cond_41

    .line 367
    if-eqz v1, :cond_42

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v5, v5, -0x1

    aget-wide v4, v4, v5

    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mMaxmask:[J

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v7, v7, -0x1

    aget-wide v6, v6, v7

    and-long/2addr v4, v6

    sget-object v6, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mMaxmask:[J

    iget v7, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v7, v7, -0x1

    aget-wide v6, v6, v7

    cmp-long v4, v4, v6

    if-nez v4, :cond_42

    move v1, v2

    .line 371
    :cond_41
    :goto_41
    return v1

    :cond_42
    move v1, v3

    .line 367
    goto :goto_41
.end method

.method public isZero()Z
    .registers 7

    .prologue
    .line 339
    const/4 v1, 0x1

    .line 341
    .local v1, "result":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    if-ge v0, v2, :cond_1d

    if-eqz v1, :cond_1d

    .line 343
    if-eqz v1, :cond_1b

    iget-object v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v2, v2, v0

    const-wide/16 v4, -0x1

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_1b

    const/4 v1, 0x1

    .line 341
    :goto_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 343
    :cond_1b
    const/4 v1, 0x0

    goto :goto_18

    .line 346
    :cond_1d
    return v1
.end method

.method public multiply(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .registers 3
    .param p1, "factor"    # Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 554
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 555
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0, p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->multiplyThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V

    .line 556
    return-object v0
.end method

.method public multiplyThisBy(Lorg/spongycastle/pqc/math/linearalgebra/GFElement;)V
    .registers 27
    .param p1, "factor"    # Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 568
    move-object/from16 v0, p1

    instance-of v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move/from16 v21, v0

    if-nez v21, :cond_10

    .line 570
    new-instance v21, Ljava/lang/RuntimeException;

    const-string v22, "The elements have different representation: not yet implemented"

    invoke-direct/range {v21 .. v22}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 573
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    move-object/from16 v22, v0

    move-object/from16 v21, p1

    check-cast v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    move-object/from16 v21, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_30

    .line 575
    new-instance v21, Ljava/lang/RuntimeException;

    invoke-direct/range {v21 .. v21}, Ljava/lang/RuntimeException;-><init>()V

    throw v21

    .line 578
    :cond_30
    invoke-virtual/range {p0 .. p1}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_3a

    .line 580
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->squareThis()V

    .line 741
    .end local p1    # "factor":Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    :goto_39
    return-void

    .line 585
    .restart local p1    # "factor":Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    :cond_3a
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 586
    .local v6, "a":[J
    check-cast p1, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    .end local p1    # "factor":Lorg/spongycastle/pqc/math/linearalgebra/GFElement;
    move-object/from16 v0, p1

    iget-object v7, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 587
    .local v7, "b":[J
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    move/from16 v21, v0

    move/from16 v0, v21

    new-array v10, v0, [J

    .line 589
    .local v10, "c":[J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    move-object/from16 v21, v0

    check-cast v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;->mMult:[[I

    move-object/from16 v17, v0

    .line 592
    .local v17, "m":[[I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    move/from16 v21, v0

    add-int/lit8 v12, v21, -0x1

    .line 593
    .local v12, "degf":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    move/from16 v21, v0

    add-int/lit8 v11, v21, -0x1

    .line 594
    .local v11, "degb":I
    const/16 v20, 0x0

    .line 596
    .local v20, "s":I
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    const/16 v22, 0x3f

    aget-wide v4, v21, v22

    .line 597
    .local v4, "TWOTOMAXLONGM1":J
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v2, v21, v11

    .line 606
    .local v2, "TWOTODEGB":J
    const/16 v16, 0x0

    .local v16, "k":I
    :goto_7a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    move/from16 v21, v0

    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_209

    .line 609
    const/16 v20, 0x0

    .line 611
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_89
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v15, v0, :cond_fc

    .line 616
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mIBY64:[I

    aget v13, v21, v15

    .line 620
    .local v13, "fielda":I
    and-int/lit8 v8, v15, 0x3f

    .line 624
    .local v8, "bita":I
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mIBY64:[I

    aget-object v22, v17, v15

    const/16 v23, 0x0

    aget v22, v22, v23

    aget v14, v21, v22

    .line 628
    .local v14, "fieldb":I
    aget-object v21, v17, v15

    const/16 v22, 0x0

    aget v21, v21, v22

    and-int/lit8 v9, v21, 0x3f

    .line 630
    .local v9, "bitb":I
    aget-wide v21, v6, v13

    sget-object v23, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v23, v23, v8

    and-long v21, v21, v23

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-eqz v21, :cond_f9

    .line 633
    aget-wide v21, v7, v14

    sget-object v23, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v23, v23, v9

    and-long v21, v21, v23

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-eqz v21, :cond_c9

    .line 635
    xor-int/lit8 v20, v20, 0x1

    .line 638
    :cond_c9
    aget-object v21, v17, v15

    const/16 v22, 0x1

    aget v21, v21, v22

    const/16 v22, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_f9

    .line 643
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mIBY64:[I

    aget-object v22, v17, v15

    const/16 v23, 0x1

    aget v22, v22, v23

    aget v14, v21, v22

    .line 647
    aget-object v21, v17, v15

    const/16 v22, 0x1

    aget v21, v21, v22

    and-int/lit8 v9, v21, 0x3f

    .line 649
    aget-wide v21, v7, v14

    sget-object v23, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v23, v23, v9

    and-long v21, v21, v23

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-eqz v21, :cond_f9

    .line 651
    xor-int/lit8 v20, v20, 0x1

    .line 611
    :cond_f9
    add-int/lit8 v15, v15, 0x1

    goto :goto_89

    .line 657
    .end local v8    # "bita":I
    .end local v9    # "bitb":I
    .end local v13    # "fielda":I
    .end local v14    # "fieldb":I
    :cond_fc
    sget-object v21, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mIBY64:[I

    aget v13, v21, v16

    .line 658
    .restart local v13    # "fielda":I
    and-int/lit8 v8, v16, 0x3f

    .line 660
    .restart local v8    # "bita":I
    if-eqz v20, :cond_10e

    .line 662
    aget-wide v21, v10, v13

    sget-object v23, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v23, v23, v8

    xor-long v21, v21, v23

    aput-wide v21, v10, v13

    .line 668
    :cond_10e
    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_1b6

    .line 673
    aget-wide v21, v6, v12

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x1

    cmp-long v21, v21, v23

    if-nez v21, :cond_151

    const/16 v19, 0x1

    .line 675
    .local v19, "old":Z
    :goto_12a
    add-int/lit8 v15, v12, -0x1

    :goto_12c
    if-ltz v15, :cond_157

    .line 677
    aget-wide v21, v6, v15

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-eqz v21, :cond_154

    const/16 v18, 0x1

    .line 679
    .local v18, "now":Z
    :goto_13c
    aget-wide v21, v6, v15

    const/16 v23, 0x1

    ushr-long v21, v21, v23

    aput-wide v21, v6, v15

    .line 681
    if-eqz v19, :cond_14c

    .line 683
    aget-wide v21, v6, v15

    xor-long v21, v21, v4

    aput-wide v21, v6, v15

    .line 686
    :cond_14c
    move/from16 v19, v18

    .line 675
    add-int/lit8 v15, v15, -0x1

    goto :goto_12c

    .line 673
    .end local v18    # "now":Z
    .end local v19    # "old":Z
    :cond_151
    const/16 v19, 0x0

    goto :goto_12a

    .line 677
    .restart local v19    # "old":Z
    :cond_154
    const/16 v18, 0x0

    goto :goto_13c

    .line 688
    :cond_157
    aget-wide v21, v6, v12

    const/16 v23, 0x1

    ushr-long v21, v21, v23

    aput-wide v21, v6, v12

    .line 690
    if-eqz v19, :cond_167

    .line 692
    aget-wide v21, v6, v12

    xor-long v21, v21, v2

    aput-wide v21, v6, v12

    .line 697
    :cond_167
    aget-wide v21, v7, v12

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x1

    cmp-long v21, v21, v23

    if-nez v21, :cond_19c

    const/16 v19, 0x1

    .line 699
    :goto_175
    add-int/lit8 v15, v12, -0x1

    :goto_177
    if-ltz v15, :cond_1a2

    .line 701
    aget-wide v21, v7, v15

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x0

    cmp-long v21, v21, v23

    if-eqz v21, :cond_19f

    const/16 v18, 0x1

    .line 703
    .restart local v18    # "now":Z
    :goto_187
    aget-wide v21, v7, v15

    const/16 v23, 0x1

    ushr-long v21, v21, v23

    aput-wide v21, v7, v15

    .line 705
    if-eqz v19, :cond_197

    .line 707
    aget-wide v21, v7, v15

    xor-long v21, v21, v4

    aput-wide v21, v7, v15

    .line 710
    :cond_197
    move/from16 v19, v18

    .line 699
    add-int/lit8 v15, v15, -0x1

    goto :goto_177

    .line 697
    .end local v18    # "now":Z
    :cond_19c
    const/16 v19, 0x0

    goto :goto_175

    .line 701
    :cond_19f
    const/16 v18, 0x0

    goto :goto_187

    .line 713
    :cond_1a2
    aget-wide v21, v7, v12

    const/16 v23, 0x1

    ushr-long v21, v21, v23

    aput-wide v21, v7, v12

    .line 715
    if-eqz v19, :cond_1b2

    .line 717
    aget-wide v21, v7, v12

    xor-long v21, v21, v2

    aput-wide v21, v7, v12

    .line 606
    :cond_1b2
    :goto_1b2
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_7a

    .line 722
    .end local v19    # "old":Z
    :cond_1b6
    const/16 v21, 0x0

    aget-wide v21, v6, v21

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x1

    cmp-long v21, v21, v23

    if-nez v21, :cond_203

    const/16 v19, 0x1

    .line 723
    .restart local v19    # "old":Z
    :goto_1c6
    const/16 v21, 0x0

    const/16 v22, 0x0

    aget-wide v22, v6, v22

    const/16 v24, 0x1

    ushr-long v22, v22, v24

    aput-wide v22, v6, v21

    .line 725
    if-eqz v19, :cond_1dc

    .line 727
    const/16 v21, 0x0

    aget-wide v22, v6, v21

    xor-long v22, v22, v2

    aput-wide v22, v6, v21

    .line 730
    :cond_1dc
    const/16 v21, 0x0

    aget-wide v21, v7, v21

    const-wide/16 v23, 0x1

    and-long v21, v21, v23

    const-wide/16 v23, 0x1

    cmp-long v21, v21, v23

    if-nez v21, :cond_206

    const/16 v19, 0x1

    .line 731
    :goto_1ec
    const/16 v21, 0x0

    const/16 v22, 0x0

    aget-wide v22, v7, v22

    const/16 v24, 0x1

    ushr-long v22, v22, v24

    aput-wide v22, v7, v21

    .line 733
    if-eqz v19, :cond_1b2

    .line 735
    const/16 v21, 0x0

    aget-wide v22, v7, v21

    xor-long v22, v22, v2

    aput-wide v22, v7, v21

    goto :goto_1b2

    .line 722
    .end local v19    # "old":Z
    :cond_203
    const/16 v19, 0x0

    goto :goto_1c6

    .line 730
    .restart local v19    # "old":Z
    :cond_206
    const/16 v19, 0x0

    goto :goto_1ec

    .line 739
    .end local v8    # "bita":I
    .end local v13    # "fielda":I
    .end local v15    # "i":I
    .end local v19    # "old":Z
    :cond_209
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([J)V

    goto/16 :goto_39
.end method

.method reverseOrder()V
    .registers 2

    .prologue
    .line 481
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->getElementReverseOrder()[J

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    .line 482
    return-void
.end method

.method public solveQuadraticEquation()Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 976
    invoke-virtual/range {p0 .. p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->trace()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 978
    new-instance v15, Ljava/lang/RuntimeException;

    invoke-direct {v15}, Ljava/lang/RuntimeException;-><init>()V

    throw v15

    .line 981
    :cond_10
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    const/16 v16, 0x3f

    aget-wide v5, v15, v16

    .line 982
    .local v5, "TWOTOMAXLONGM1":J
    const-wide/16 v7, 0x0

    .line 983
    .local v7, "ZERO":J
    const-wide/16 v3, 0x1

    .line 985
    .local v3, "ONE":J
    move-object/from16 v0, p0

    iget v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    new-array v12, v15, [J

    .line 986
    .local v12, "p":[J
    const-wide/16 v13, 0x0

    .line 987
    .local v13, "z":J
    const/4 v11, 0x1

    .line 988
    .local v11, "j":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_24
    move-object/from16 v0, p0

    iget v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v15, v15, -0x1

    if-ge v10, v15, :cond_9f

    .line 991
    const/4 v11, 0x1

    :goto_2d
    const/16 v15, 0x40

    if-ge v11, v15, :cond_71

    .line 995
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v15, v15, v11

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    move-object/from16 v17, v0

    aget-wide v17, v17, v10

    and-long v15, v15, v17

    cmp-long v15, v15, v7

    if-eqz v15, :cond_4e

    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    add-int/lit8 v16, v11, -0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v13

    cmp-long v15, v15, v7

    if-nez v15, :cond_6e

    :cond_4e
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v15, v15, v10

    sget-object v17, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v17, v17, v11

    and-long v15, v15, v17

    cmp-long v15, v15, v7

    if-nez v15, :cond_69

    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    add-int/lit8 v16, v11, -0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v13

    cmp-long v15, v15, v7

    if-eqz v15, :cond_6e

    .line 997
    :cond_69
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v15, v15, v11

    xor-long/2addr v13, v15

    .line 991
    :cond_6e
    add-int/lit8 v11, v11, 0x1

    goto :goto_2d

    .line 1000
    :cond_71
    aput-wide v13, v12, v10

    .line 1002
    and-long v15, v5, v13

    cmp-long v15, v15, v7

    if-eqz v15, :cond_86

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    add-int/lit8 v16, v10, 0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v3

    cmp-long v15, v15, v3

    if-eqz v15, :cond_99

    :cond_86
    and-long v15, v5, v13

    cmp-long v15, v15, v7

    if-nez v15, :cond_9d

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    add-int/lit8 v16, v10, 0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v3

    cmp-long v15, v15, v7

    if-nez v15, :cond_9d

    .line 1005
    :cond_99
    move-wide v13, v7

    .line 988
    :goto_9a
    add-int/lit8 v10, v10, 0x1

    goto :goto_24

    .line 1009
    :cond_9d
    move-wide v13, v3

    goto :goto_9a

    .line 1013
    :cond_9f
    move-object/from16 v0, p0

    iget v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    and-int/lit8 v9, v15, 0x3f

    .line 1015
    .local v9, "b":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    move-object/from16 v0, p0

    iget v0, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    aget-wide v1, v15, v16

    .line 1017
    .local v1, "LASTLONG":J
    const/4 v11, 0x1

    :goto_b4
    if-ge v11, v9, :cond_e6

    .line 1019
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v15, v15, v11

    and-long/2addr v15, v1

    cmp-long v15, v15, v7

    if-eqz v15, :cond_ca

    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    add-int/lit8 v16, v11, -0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v13

    cmp-long v15, v15, v7

    if-nez v15, :cond_e3

    :cond_ca
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v15, v15, v11

    and-long/2addr v15, v1

    cmp-long v15, v15, v7

    if-nez v15, :cond_de

    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    add-int/lit8 v16, v11, -0x1

    aget-wide v15, v15, v16

    and-long/2addr v15, v13

    cmp-long v15, v15, v7

    if-eqz v15, :cond_e3

    .line 1021
    :cond_de
    sget-object v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v15, v15, v11

    xor-long/2addr v13, v15

    .line 1017
    :cond_e3
    add-int/lit8 v11, v11, 0x1

    goto :goto_b4

    .line 1024
    :cond_e6
    move-object/from16 v0, p0

    iget v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v15, v15, -0x1

    aput-wide v13, v12, v15

    .line 1025
    new-instance v16, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mField:Lorg/spongycastle/pqc/math/linearalgebra/GF2nField;

    check-cast v15, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;

    move-object/from16 v0, v16

    invoke-direct {v0, v15, v12}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBField;[J)V

    return-object v16
.end method

.method public square()Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 2

    .prologue
    .line 750
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 751
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->squareThis()V

    .line 752
    return-object v0
.end method

.method public squareRoot()Lorg/spongycastle/pqc/math/linearalgebra/GF2nElement;
    .registers 2

    .prologue
    .line 881
    new-instance v0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;

    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;-><init>(Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;)V

    .line 882
    .local v0, "result":Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->squareRootThis()V

    .line 883
    return-object v0
.end method

.method public squareRootThis()V
    .registers 13

    .prologue
    .line 892
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->getElement()[J

    move-result-object v7

    .line 894
    .local v7, "pol":[J
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v3, v8, -0x1

    .line 895
    .local v3, "f":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v2, v8, -0x1

    .line 899
    .local v2, "b":I
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    const/16 v9, 0x3f

    aget-wide v0, v8, v9

    .line 902
    .local v0, "TWOTOMAXLONGM1":J
    const/4 v8, 0x0

    aget-wide v8, v7, v8

    const-wide/16 v10, 0x1

    and-long/2addr v8, v10

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_45

    const/4 v6, 0x1

    .line 904
    .local v6, "old":Z
    :goto_1f
    move v4, v3

    .local v4, "i":I
    :goto_20
    if-ltz v4, :cond_4f

    .line 906
    aget-wide v8, v7, v4

    const-wide/16 v10, 0x1

    and-long/2addr v8, v10

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_47

    const/4 v5, 0x1

    .line 907
    .local v5, "now":Z
    :goto_2e
    aget-wide v8, v7, v4

    const/4 v10, 0x1

    ushr-long/2addr v8, v10

    aput-wide v8, v7, v4

    .line 909
    if-eqz v6, :cond_41

    .line 911
    if-ne v4, v3, :cond_49

    .line 913
    aget-wide v8, v7, v4

    sget-object v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v10, v10, v2

    xor-long/2addr v8, v10

    aput-wide v8, v7, v4

    .line 920
    :cond_41
    :goto_41
    move v6, v5

    .line 904
    add-int/lit8 v4, v4, -0x1

    goto :goto_20

    .line 902
    .end local v4    # "i":I
    .end local v5    # "now":Z
    .end local v6    # "old":Z
    :cond_45
    const/4 v6, 0x0

    goto :goto_1f

    .line 906
    .restart local v4    # "i":I
    .restart local v6    # "old":Z
    :cond_47
    const/4 v5, 0x0

    goto :goto_2e

    .line 917
    .restart local v5    # "now":Z
    :cond_49
    aget-wide v8, v7, v4

    xor-long/2addr v8, v0

    aput-wide v8, v7, v4

    goto :goto_41

    .line 922
    .end local v5    # "now":Z
    :cond_4f
    invoke-direct {p0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([J)V

    .line 923
    return-void
.end method

.method public squareThis()V
    .registers 13

    .prologue
    .line 761
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->getElement()[J

    move-result-object v7

    .line 763
    .local v7, "pol":[J
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v3, v8, -0x1

    .line 764
    .local v3, "f":I
    iget v8, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v2, v8, -0x1

    .line 768
    .local v2, "b":I
    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    const/16 v9, 0x3f

    aget-wide v0, v8, v9

    .line 771
    .local v0, "TWOTOMAXLONGM1":J
    aget-wide v8, v7, v3

    sget-object v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v10, v10, v2

    and-long/2addr v8, v10

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_40

    const/4 v6, 0x1

    .line 773
    .local v6, "old":Z
    :goto_20
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_21
    if-ge v4, v3, :cond_44

    .line 776
    aget-wide v8, v7, v4

    and-long/2addr v8, v0

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_42

    const/4 v5, 0x1

    .line 778
    .local v5, "now":Z
    :goto_2d
    aget-wide v8, v7, v4

    const/4 v10, 0x1

    shl-long/2addr v8, v10

    aput-wide v8, v7, v4

    .line 780
    if-eqz v6, :cond_3c

    .line 782
    aget-wide v8, v7, v4

    const-wide/16 v10, 0x1

    xor-long/2addr v8, v10

    aput-wide v8, v7, v4

    .line 785
    :cond_3c
    move v6, v5

    .line 773
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    .line 771
    .end local v4    # "i":I
    .end local v5    # "now":Z
    .end local v6    # "old":Z
    :cond_40
    const/4 v6, 0x0

    goto :goto_20

    .line 776
    .restart local v4    # "i":I
    .restart local v6    # "old":Z
    :cond_42
    const/4 v5, 0x0

    goto :goto_2d

    .line 787
    :cond_44
    aget-wide v8, v7, v3

    sget-object v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v10, v10, v2

    and-long/2addr v8, v10

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-eqz v8, :cond_72

    const/4 v5, 0x1

    .line 789
    .restart local v5    # "now":Z
    :goto_52
    aget-wide v8, v7, v3

    const/4 v10, 0x1

    shl-long/2addr v8, v10

    aput-wide v8, v7, v3

    .line 791
    if-eqz v6, :cond_61

    .line 793
    aget-wide v8, v7, v3

    const-wide/16 v10, 0x1

    xor-long/2addr v8, v10

    aput-wide v8, v7, v3

    .line 798
    :cond_61
    if-eqz v5, :cond_6e

    .line 800
    aget-wide v8, v7, v3

    sget-object v10, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    add-int/lit8 v11, v2, 0x1

    aget-wide v10, v10, v11

    xor-long/2addr v8, v10

    aput-wide v8, v7, v3

    .line 803
    :cond_6e
    invoke-direct {p0, v7}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->assign([J)V

    .line 804
    return-void

    .line 787
    .end local v5    # "now":Z
    :cond_72
    const/4 v5, 0x0

    goto :goto_52
.end method

.method testBit(I)Z
    .registers 9
    .param p1, "index"    # I

    .prologue
    const/4 v2, 0x0

    .line 436
    if-ltz p1, :cond_7

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    if-le p1, v3, :cond_8

    .line 441
    :cond_7
    :goto_7
    return v2

    .line 440
    :cond_8
    iget-object v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    ushr-int/lit8 v4, p1, 0x6

    aget-wide v3, v3, v4

    sget-object v5, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    and-int/lit8 v6, p1, 0x3f

    aget-wide v5, v5, v6

    and-long v0, v3, v5

    .line 441
    .local v0, "test":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-eqz v3, :cond_7

    const/4 v2, 0x1

    goto :goto_7
.end method

.method public testRightmostBit()Z
    .registers 5

    .prologue
    .line 422
    iget-object v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    iget v1, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v1, v1, -0x1

    aget-wide v0, v0, v1

    sget-object v2, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    add-int/lit8 v3, v3, -0x1

    aget-wide v2, v2, v3

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public toByteArray()[B
    .registers 10

    .prologue
    .line 1138
    iget v3, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mDegree:I

    add-int/lit8 v3, v3, -0x1

    shr-int/lit8 v3, v3, 0x3

    add-int/lit8 v1, v3, 0x1

    .line 1139
    .local v1, "k":I
    new-array v2, v1, [B

    .line 1141
    .local v2, "result":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_2b

    .line 1143
    sub-int v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    iget-object v4, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    ushr-int/lit8 v5, v0, 0x3

    aget-wide v4, v4, v5

    const-wide/16 v6, 0xff

    and-int/lit8 v8, v0, 0x7

    shl-int/lit8 v8, v8, 0x3

    shl-long/2addr v6, v8

    and-long/2addr v4, v6

    and-int/lit8 v6, v0, 0x7

    shl-int/lit8 v6, v6, 0x3

    ushr-long/2addr v4, v6

    long-to-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 1141
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1145
    :cond_2b
    return-object v2
.end method

.method public toFlexiBigInt()Ljava/math/BigInteger;
    .registers 4

    .prologue
    .line 1125
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-virtual {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->toByteArray()[B

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1039
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(I)Ljava/lang/String;
    .registers 15
    .param p1, "radix"    # I

    .prologue
    const-wide/16 v11, 0x0

    const/16 v10, 0x10

    .line 1052
    const-string v5, ""

    .line 1054
    .local v5, "s":Ljava/lang/String;
    invoke-direct {p0}, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->getElement()[J

    move-result-object v1

    .line 1055
    .local v1, "a":[J
    iget v2, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 1057
    .local v2, "b":I
    const/4 v6, 0x2

    if-ne p1, v6, :cond_8b

    .line 1060
    add-int/lit8 v4, v2, -0x1

    .local v4, "j":I
    :goto_11
    if-ltz v4, :cond_4a

    .line 1062
    array-length v6, v1

    add-int/lit8 v6, v6, -0x1

    aget-wide v6, v1, v6

    const-wide/16 v8, 0x1

    shl-long/2addr v8, v4

    and-long/2addr v6, v8

    cmp-long v6, v6, v11

    if-nez v6, :cond_36

    .line 1064
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1060
    :goto_33
    add-int/lit8 v4, v4, -0x1

    goto :goto_11

    .line 1068
    :cond_36
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "1"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_33

    .line 1072
    :cond_4a
    array-length v6, v1

    add-int/lit8 v3, v6, -0x2

    .local v3, "i":I
    :goto_4d
    if-ltz v3, :cond_258

    .line 1074
    const/16 v4, 0x3f

    :goto_51
    if-ltz v4, :cond_88

    .line 1076
    aget-wide v6, v1, v3

    sget-object v8, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v8, v8, v4

    and-long/2addr v6, v8

    cmp-long v6, v6, v11

    if-nez v6, :cond_74

    .line 1078
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1074
    :goto_71
    add-int/lit8 v4, v4, -0x1

    goto :goto_51

    .line 1082
    :cond_74
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "1"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_71

    .line 1072
    :cond_88
    add-int/lit8 v3, v3, -0x1

    goto :goto_4d

    .line 1087
    .end local v3    # "i":I
    .end local v4    # "j":I
    :cond_8b
    if-ne p1, v10, :cond_258

    .line 1089
    new-array v0, v10, [C

    fill-array-data v0, :array_25a

    .line 1091
    .local v0, "HEX_CHARS":[C
    array-length v6, v1

    add-int/lit8 v3, v6, -0x1

    .restart local v3    # "i":I
    :goto_95
    if-ltz v3, :cond_258

    .line 1093
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x3c

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1094
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x38

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1095
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x34

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1096
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x30

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1097
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x2c

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1098
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x28

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1099
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x24

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1100
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x20

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1101
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x1c

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1102
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x18

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1103
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x14

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1104
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    ushr-long/2addr v7, v10

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1105
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0xc

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1106
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/16 v9, 0x8

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1107
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    const/4 v9, 0x4

    ushr-long/2addr v7, v9

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1108
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v1, v3

    long-to-int v7, v7

    and-int/lit8 v7, v7, 0xf

    aget-char v7, v0, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1109
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1091
    add-int/lit8 v3, v3, -0x1

    goto/16 :goto_95

    .line 1112
    .end local v0    # "HEX_CHARS":[C
    .end local v3    # "i":I
    :cond_258
    return-object v5

    .line 1089
    nop

    :array_25a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public trace()I
    .registers 12

    .prologue
    const-wide/16 v9, 0x0

    .line 936
    const/4 v4, 0x0

    .line 938
    .local v4, "result":I
    iget v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mLength:I

    add-int/lit8 v3, v5, -0x1

    .line 940
    .local v3, "max":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v3, :cond_24

    .line 943
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_b
    const/16 v5, 0x40

    if-ge v2, v5, :cond_21

    .line 946
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v5, v5, v1

    sget-object v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v7, v7, v2

    and-long/2addr v5, v7

    cmp-long v5, v5, v9

    if-eqz v5, :cond_1e

    .line 948
    xor-int/lit8 v4, v4, 0x1

    .line 943
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 940
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 953
    .end local v2    # "j":I
    :cond_24
    iget v0, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBit:I

    .line 955
    .local v0, "b":I
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_27
    if-ge v2, v0, :cond_3b

    .line 958
    iget-object v5, p0, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mPol:[J

    aget-wide v5, v5, v3

    sget-object v7, Lorg/spongycastle/pqc/math/linearalgebra/GF2nONBElement;->mBitmask:[J

    aget-wide v7, v7, v2

    and-long/2addr v5, v7

    cmp-long v5, v5, v9

    if-eqz v5, :cond_38

    .line 960
    xor-int/lit8 v4, v4, 0x1

    .line 955
    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 963
    :cond_3b
    return v4
.end method
