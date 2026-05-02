.class public Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;
.super Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;
.source "NTRUEncryptionPublicKeyParameters.java"


# instance fields
.field public h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 56
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    iget v1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-static {p1, v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary(Ljava/io/InputStream;II)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 4
    .param p1, "h"    # Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 27
    iput-object p1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 28
    return-void
.end method

.method public constructor <init>([BLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionKeyParameters;-><init>(ZLorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;)V

    .line 41
    iget v0, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->N:I

    iget v1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-static {p1, v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->fromBinary([BII)Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    .line 42
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 94
    if-ne p0, p1, :cond_5

    .line 129
    :cond_4
    :goto_4
    return v1

    .line 98
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 100
    goto :goto_4

    .line 102
    :cond_9
    instance-of v3, p1, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;

    if-nez v3, :cond_f

    move v1, v2

    .line 104
    goto :goto_4

    :cond_f
    move-object v0, p1

    .line 106
    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;

    .line 107
    .local v0, "other":Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-nez v3, :cond_1c

    .line 109
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-eqz v3, :cond_28

    move v1, v2

    .line 111
    goto :goto_4

    .line 114
    :cond_1c
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    move v1, v2

    .line 116
    goto :goto_4

    .line 118
    :cond_28
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-nez v3, :cond_32

    .line 120
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-eqz v3, :cond_4

    move v1, v2

    .line 122
    goto :goto_4

    .line 125
    :cond_32
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 127
    goto :goto_4
.end method

.method public getEncoded()[B
    .registers 3

    .prologue
    .line 67
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    iget v1, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->q:I

    invoke-virtual {v0, v1}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->toBinary(I)[B

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 85
    const/16 v0, 0x1f

    .line 86
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 87
    .local v1, "result":I
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    if-nez v2, :cond_14

    move v2, v3

    :goto_9
    add-int/lit8 v1, v2, 0x1f

    .line 88
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    if-nez v4, :cond_1b

    :goto_11
    add-int v1, v2, v3

    .line 89
    return v1

    .line 87
    :cond_14
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_9

    .line 88
    :cond_1b
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;

    invoke-virtual {v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionParameters;->hashCode()I

    move-result v3

    goto :goto_11
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
    .line 80
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUEncryptionPublicKeyParameters;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 81
    return-void
.end method
