.class public Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;
.super Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;
.source "NTRUEncryptionPrivateKeyParameters.java"


# instance fields
.field public fp:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

.field public h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

.field public t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 11
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 67
    invoke-direct {p0, v7, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 69
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->polyType:I

    if-ne v0, v7, :cond_30

    .line 71
    iget v1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    .line 72
    .local v1, "N":I
    iget v2, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->df1:I

    .line 73
    .local v2, "df1":I
    iget v3, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->df2:I

    .line 74
    .local v3, "df2":I
    iget v4, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->df3:I

    .line 75
    .local v4, "df3Ones":I
    iget-boolean v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->fastFp:Z

    if-eqz v0, :cond_2b

    iget v5, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->df3:I

    .line 76
    .local v5, "df3NegOnes":I
    :goto_16
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    iget v7, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-static {p1, v0, v7}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary(Ljava/io/InputStream;II)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-object v0, p1

    .line 77
    invoke-static/range {v0 .. v5}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->fromBinary(Ljava/io/InputStream;IIIII)Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 86
    .end local v1    # "N":I
    .end local v2    # "df1":I
    .end local v3    # "df2":I
    .end local v4    # "df3Ones":I
    .end local v5    # "df3NegOnes":I
    :goto_27
    invoke-direct {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->init()V

    .line 87
    return-void

    .line 75
    .restart local v1    # "N":I
    .restart local v2    # "df1":I
    .restart local v3    # "df2":I
    .restart local v4    # "df3Ones":I
    :cond_2b
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->df3:I

    add-int/lit8 v5, v0, -0x1

    goto :goto_16

    .line 81
    .end local v1    # "N":I
    .end local v2    # "df1":I
    .end local v3    # "df2":I
    .end local v4    # "df3Ones":I
    :cond_30
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    iget v7, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-static {p1, v0, v7}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary(Ljava/io/InputStream;II)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 82
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    invoke-static {p1, v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary3Tight(Ljava/io/InputStream;I)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v6

    .line 83
    .local v6, "fInt":Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    iget-boolean v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->sparse:Z

    if-eqz v0, :cond_4c

    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/SparseTernaryPolynomial;

    invoke-direct {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/SparseTernaryPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    :goto_49
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    goto :goto_27

    :cond_4c
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;

    invoke-direct {v0, v6}, Lorg/spongycastle/pqc/math/ntru/polynomial/DenseTernaryPolynomial;-><init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;)V

    goto :goto_49
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 6
    .param p1, "h"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p2, "t"    # Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;
    .param p3, "fp"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p4, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    .prologue
    .line 37
    const/4 v0, 0x1

    invoke-direct {p0, v0, p4}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 39
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 40
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    .line 41
    iput-object p3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->fp:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 42
    return-void
.end method

.method public constructor <init>([BLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 4
    .param p1, "b"    # [B
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;-><init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 55
    return-void
.end method

.method private init()V
    .registers 4

    .prologue
    .line 94
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget-boolean v0, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->fastFp:Z

    if-eqz v0, :cond_1a

    .line 96
    new-instance v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget v1, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    invoke-direct {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;-><init>(I)V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->fp:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 97
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->fp:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v0, v0, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->coeffs:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 103
    :goto_19
    return-void

    .line 101
    :cond_1a
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-interface {v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->invertF3()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->fp:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    goto :goto_19
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 158
    if-ne p0, p1, :cond_5

    .line 197
    :cond_4
    :goto_4
    return v1

    .line 162
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 164
    goto :goto_4

    .line 166
    :cond_9
    instance-of v3, p1, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;

    if-nez v3, :cond_f

    move v1, v2

    .line 168
    goto :goto_4

    :cond_f
    move-object v0, p1

    .line 170
    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;

    .line 171
    .local v0, "other":Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-nez v3, :cond_1c

    .line 173
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-eqz v3, :cond_28

    move v1, v2

    .line 175
    goto :goto_4

    .line 178
    :cond_1c
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    move v1, v2

    .line 180
    goto :goto_4

    .line 182
    :cond_28
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v3, :cond_32

    .line 184
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-eqz v3, :cond_3e

    move v1, v2

    .line 186
    goto :goto_4

    .line 189
    :cond_32
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3e

    move v1, v2

    .line 191
    goto :goto_4

    .line 193
    :cond_3e
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 195
    goto :goto_4
.end method

.method public getEncoded()[B
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 113
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget v4, v4, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary(I)[B

    move-result-object v0

    .line 116
    .local v0, "hBytes":[B
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    instance-of v3, v3, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    if-eqz v3, :cond_28

    .line 118
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    check-cast v3, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/ntru/polynomial/ProductFormPolynomial;->toBinary()[B

    move-result-object v2

    .line 125
    .local v2, "tBytes":[B
    :goto_19
    array-length v3, v0

    array-length v4, v2

    add-int/2addr v3, v4

    new-array v1, v3, [B

    .line 127
    .local v1, "res":[B
    array-length v3, v0

    invoke-static {v0, v5, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    array-length v3, v0

    array-length v4, v2

    invoke-static {v2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    return-object v1

    .line 122
    .end local v1    # "res":[B
    .end local v2    # "tBytes":[B
    :cond_28
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-interface {v3}, Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;->toIntegerPolynomial()Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary3Tight()[B

    move-result-object v2

    .restart local v2    # "tBytes":[B
    goto :goto_19
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 148
    const/16 v0, 0x1f

    .line 149
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 150
    .local v1, "result":I
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-nez v2, :cond_1d

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 151
    mul-int/lit8 v4, v1, 0x1f

    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    if-nez v2, :cond_24

    move v2, v3

    :goto_12
    add-int v1, v4, v2

    .line 152
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-nez v4, :cond_2b

    :goto_1a
    add-int v1, v2, v3

    .line 153
    return v1

    .line 150
    :cond_1d
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->hashCode()I

    move-result v2

    goto :goto_9

    .line 151
    :cond_24
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->t:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_12

    .line 152
    :cond_2b
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    goto :goto_1a
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPrivateKeyParameters;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 144
    return-void
.end method
