.class public Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;
.super Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
.source "NTRUSigningPrivateKeyParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    }
.end annotation


# instance fields
.field private bases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;",
            ">;"
        }
    .end annotation
.end field

.field private publicKey:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;)V
    .registers 7
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 49
    invoke-direct {p0, v2}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;-><init>(Z)V

    .line 50
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    .line 51
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    iget v1, p2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->B:I

    if-gt v0, v1, :cond_20

    .line 54
    new-instance v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    if-eqz v0, :cond_1e

    move v1, v2

    :goto_15
    invoke-direct {v3, p1, p2, v1}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;-><init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;Z)V

    invoke-direct {p0, v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->add(Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;)V

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 54
    :cond_1e
    const/4 v1, 0x0

    goto :goto_15

    .line 56
    :cond_20
    new-instance v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    invoke-virtual {p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->getSigningParameters()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;-><init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningParameters;)V

    iput-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->publicKey:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;)V
    .registers 4
    .param p2, "publicKey"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;",
            ">;",
            "Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;",
            ")V"
        }
    .end annotation

    .prologue
    .line 61
    .local p1, "bases":Ljava/util/List;, "Ljava/util/List<Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;-><init>(Z)V

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    .line 63
    iput-object p2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->publicKey:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    .line 64
    return-void
.end method

.method public constructor <init>([BLorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;)V
    .registers 4
    .param p1, "b"    # [B
    .param p2, "params"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v0, p2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;-><init>(Ljava/io/InputStream;Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;)V

    .line 38
    return-void
.end method

.method private add(Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;)V
    .registers 3
    .param p1, "b"    # Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 10
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 142
    if-ne p0, p1, :cond_6

    move v6, v5

    .line 188
    :cond_5
    :goto_5
    return v6

    .line 146
    :cond_6
    if-eqz p1, :cond_5

    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    if-ne v4, v7, :cond_5

    move-object v3, p1

    .line 154
    check-cast v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;

    .line 155
    .local v3, "other":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    if-nez v4, :cond_27

    move v4, v5

    :goto_1a
    iget-object v7, v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    if-nez v7, :cond_29

    move v7, v5

    :goto_1f
    if-ne v4, v7, :cond_5

    .line 159
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    if-nez v4, :cond_2b

    move v6, v5

    .line 161
    goto :goto_5

    :cond_27
    move v4, v6

    .line 155
    goto :goto_1a

    :cond_29
    move v7, v6

    goto :goto_1f

    .line 163
    :cond_2b
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iget-object v7, v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ne v4, v7, :cond_5

    .line 167
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3a
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_7f

    .line 169
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    .line 170
    .local v0, "basis1":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    iget-object v4, v3, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    .line 171
    .local v1, "basis2":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    iget-object v7, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->f:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 175
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    iget-object v7, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->fPrime:Lorg/spongycastle/pqc/math/ntru/polynomial/Polynomial;

    invoke-virtual {v4, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 179
    if-eqz v2, :cond_72

    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    iget-object v7, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->h:Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;

    invoke-virtual {v4, v7}, Lorg/spongycastle/pqc/math/ntru/polynomial/IntegerPolynomial;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 183
    :cond_72
    iget-object v4, v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    iget-object v7, v1, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->params:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;

    invoke-virtual {v4, v7}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningKeyGenerationParameters;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_3a

    .end local v0    # "basis1":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    .end local v1    # "basis2":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    :cond_7f
    move v6, v5

    .line 188
    goto :goto_5
.end method

.method public getBasis(I)Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    return-object v0
.end method

.method public getEncoded()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 101
    .local v1, "os":Ljava/io/ByteArrayOutputStream;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_21

    .line 104
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    if-eqz v0, :cond_1f

    const/4 v3, 0x1

    :goto_19
    invoke-virtual {v2, v1, v3}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->encode(Ljava/io/OutputStream;Z)V

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 104
    :cond_1f
    const/4 v3, 0x0

    goto :goto_19

    .line 107
    :cond_21
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->publicKey:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    invoke-virtual {v2}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;->getEncoded()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 109
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public getPublicKey()Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->publicKey:Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPublicKeyParameters;

    return-object v0
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 127
    const/16 v1, 0x1f

    .line 128
    .local v1, "prime":I
    const/4 v2, 0x1

    .line 129
    .local v2, "result":I
    mul-int/lit8 v2, v2, 0x1f

    .line 130
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    if-nez v4, :cond_b

    move v3, v2

    .line 136
    .end local v2    # "result":I
    .local v3, "result":I
    :goto_a
    return v3

    .line 131
    .end local v3    # "result":I
    .restart local v2    # "result":I
    :cond_b
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->hashCode()I

    move-result v4

    add-int/lit8 v2, v4, 0x1f

    .line 132
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->bases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_19
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;

    .line 134
    .local v0, "basis":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    invoke-virtual {v0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;->hashCode()I

    move-result v5

    add-int/2addr v2, v5

    .line 135
    goto :goto_19

    .end local v0    # "basis":Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters$Basis;
    :cond_2b
    move v3, v2

    .line 136
    .end local v2    # "result":I
    .restart local v3    # "result":I
    goto :goto_a
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
    .line 121
    invoke-virtual {p0}, Lorg/spongycastle/pqc/crypto/ntru/NTRUSigningPrivateKeyParameters;->getEncoded()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 122
    return-void
.end method
