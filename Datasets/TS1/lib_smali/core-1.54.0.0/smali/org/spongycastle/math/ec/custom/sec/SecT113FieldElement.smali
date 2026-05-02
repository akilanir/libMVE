.class public Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;
.super Lorg/spongycastle/math/ec/ECFieldElement;
.source "SecT113FieldElement.java"


# instance fields
.field protected x:[J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 25
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/math/BigInteger;)V
    .registers 4
    .param p1, "x"    # Ljava/math/BigInteger;

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 15
    if-eqz p1, :cond_13

    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-ltz v0, :cond_13

    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    const/16 v1, 0x71

    if-le v0, v1, :cond_1b

    .line 17
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "x value invalid for SecT113FieldElement"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_1b
    invoke-static {p1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->fromBigInteger(Ljava/math/BigInteger;)[J

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 21
    return-void
.end method

.method protected constructor <init>([J)V
    .registers 2
    .param p1, "x"    # [J

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/spongycastle/math/ec/ECFieldElement;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 31
    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 5
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 70
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 71
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v2, p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->add([J[J[J)V

    .line 72
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public addOne()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3

    .prologue
    .line 77
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 78
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->addOne([J[J)V

    .line 79
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public divide(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 116
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->invert()Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 203
    if-ne p1, p0, :cond_4

    .line 205
    const/4 v1, 0x1

    .line 214
    :goto_3
    return v1

    .line 208
    :cond_4
    instance-of v1, p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    if-nez v1, :cond_a

    .line 210
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 213
    check-cast v0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .line 214
    .local v0, "o":Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    iget-object v2, v0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v2}, Lorg/spongycastle/math/raw/Nat128;->eq64([J[J)Z

    move-result v1

    goto :goto_3
.end method

.method public getFieldName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    const-string v0, "SecT113Field"

    return-object v0
.end method

.method public getFieldSize()I
    .registers 2

    .prologue
    .line 65
    const/16 v0, 0x71

    return v0
.end method

.method public getK1()I
    .registers 2

    .prologue
    .line 188
    const/16 v0, 0x9

    return v0
.end method

.method public getK2()I
    .registers 2

    .prologue
    .line 193
    const/4 v0, 0x0

    return v0
.end method

.method public getK3()I
    .registers 2

    .prologue
    .line 198
    const/4 v0, 0x0

    return v0
.end method

.method public getM()I
    .registers 2

    .prologue
    .line 183
    const/16 v0, 0x71

    return v0
.end method

.method public getRepresentation()I
    .registers 2

    .prologue
    .line 178
    const/4 v0, 0x2

    return v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 219
    const v0, 0x1b971

    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v1, v2, v3}, Lorg/spongycastle/util/Arrays;->hashCode([JII)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public invert()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3

    .prologue
    .line 164
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 165
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->invert([J[J)V

    .line 166
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public isOne()Z
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat128;->isOne64([J)Z

    move-result v0

    return v0
.end method

.method public isZero()Z
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat128;->isZero64([J)Z

    move-result v0

    return v0
.end method

.method public multiply(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 5
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 90
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 91
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v2, p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiply([J[J[J)V

    .line 92
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public multiplyMinusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 5
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p2, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p3, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 97
    invoke-virtual {p0, p1, p2, p3}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    return-object v0
.end method

.method public multiplyPlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 11
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p2, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p3, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .local v0, "ax":[J
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p1    # "b":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v1, p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 103
    .local v1, "bx":[J
    check-cast p2, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p2    # "x":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v3, p2, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .local v3, "xx":[J
    check-cast p3, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p3    # "y":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v4, p3, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 105
    .local v4, "yx":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v2

    .line 106
    .local v2, "tt":[J
    invoke-static {v0, v1, v2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiplyAddToExt([J[J[J)V

    .line 107
    invoke-static {v3, v4, v2}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiplyAddToExt([J[J[J)V

    .line 109
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v5

    .line 110
    .local v5, "z":[J
    invoke-static {v2, v5}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    .line 111
    new-instance v6, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v6, v5}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v6
.end method

.method public negate()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 1

    .prologue
    .line 121
    return-object p0
.end method

.method public sqrt()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3

    .prologue
    .line 171
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 172
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->sqrt([J[J)V

    .line 173
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public square()Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3

    .prologue
    .line 126
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 127
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->square([J[J)V

    .line 128
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v1
.end method

.method public squareMinusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 4
    .param p1, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p2, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 133
    invoke-virtual {p0, p1, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->squarePlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    return-object v0
.end method

.method public squarePlusProduct(Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 9
    .param p1, "x"    # Lorg/spongycastle/math/ec/ECFieldElement;
    .param p2, "y"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 138
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 139
    .local v0, "ax":[J
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p1    # "x":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v2, p1, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .local v2, "xx":[J
    check-cast p2, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p2    # "y":Lorg/spongycastle/math/ec/ECFieldElement;
    iget-object v3, p2, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    .line 141
    .local v3, "yx":[J
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->createExt64()[J

    move-result-object v1

    .line 142
    .local v1, "tt":[J
    invoke-static {v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareAddToExt([J[J)V

    .line 143
    invoke-static {v2, v3, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->multiplyAddToExt([J[J[J)V

    .line 145
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v4

    .line 146
    .local v4, "z":[J
    invoke-static {v1, v4}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->reduce([J[J)V

    .line 147
    new-instance v5, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    invoke-direct {v5, v4}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    return-object v5
.end method

.method public squarePow(I)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 4
    .param p1, "pow"    # I

    .prologue
    .line 152
    const/4 v1, 0x1

    if-ge p1, v1, :cond_4

    .line 159
    .end local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;
    :goto_3
    return-object p0

    .line 157
    .restart local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;
    :cond_4
    invoke-static {}, Lorg/spongycastle/math/raw/Nat128;->create64()[J

    move-result-object v0

    .line 158
    .local v0, "z":[J
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v1, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113Field;->squareN([JI[J)V

    .line 159
    new-instance p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;

    .end local p0    # "this":Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;
    invoke-direct {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;-><init>([J)V

    goto :goto_3
.end method

.method public subtract(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;
    .registers 3
    .param p1, "b"    # Lorg/spongycastle/math/ec/ECFieldElement;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->add(Lorg/spongycastle/math/ec/ECFieldElement;)Lorg/spongycastle/math/ec/ECFieldElement;

    move-result-object v0

    return-object v0
.end method

.method public testBitZero()Z
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 50
    iget-object v1, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    aget-wide v1, v1, v0

    const-wide/16 v3, 0x1

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_f

    const/4 v0, 0x1

    :cond_f
    return v0
.end method

.method public toBigInteger()Ljava/math/BigInteger;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lorg/spongycastle/math/ec/custom/sec/SecT113FieldElement;->x:[J

    invoke-static {v0}, Lorg/spongycastle/math/raw/Nat128;->toBigInteger64([J)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method
