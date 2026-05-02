.class public Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;
.super Ljava/lang/Object;
.source "BCRainbowPrivateKey.java"

# interfaces
.implements Ljava/security/PrivateKey;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private A1inv:[[S

.field private A2inv:[[S

.field private b1:[S

.field private b2:[S

.field private layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

.field private vi:[I


# direct methods
.method public constructor <init>(Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;)V
    .registers 9
    .param p1, "params"    # Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;

    .prologue
    .line 91
    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getInvA1()[[S

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getB1()[S

    move-result-object v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getInvA2()[[S

    move-result-object v3

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getB2()[S

    move-result-object v4

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getVi()[I

    move-result-object v5

    invoke-virtual {p1}, Lorg/spongycastle/pqc/crypto/rainbow/RainbowPrivateKeyParameters;->getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    move-result-object v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;-><init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;)V
    .registers 9
    .param p1, "keySpec"    # Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;

    .prologue
    .line 84
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getInvA1()[[S

    move-result-object v1

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getB1()[S

    move-result-object v2

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getInvA2()[[S

    move-result-object v3

    .line 85
    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getB2()[S

    move-result-object v4

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getVi()[I

    move-result-object v5

    invoke-virtual {p1}, Lorg/spongycastle/pqc/jcajce/spec/RainbowPrivateKeySpec;->getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    move-result-object v6

    move-object v0, p0

    .line 84
    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;-><init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V

    .line 86
    return-void
.end method

.method public constructor <init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V
    .registers 7
    .param p1, "A1inv"    # [[S
    .param p2, "b1"    # [S
    .param p3, "A2inv"    # [[S
    .param p4, "b2"    # [S
    .param p5, "vi"    # [I
    .param p6, "layers"    # [Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A1inv:[[S

    .line 70
    iput-object p2, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b1:[S

    .line 71
    iput-object p3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A2inv:[[S

    .line 72
    iput-object p4, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b2:[S

    .line 73
    iput-object p5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->vi:[I

    .line 74
    iput-object p6, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    .line 75
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 162
    if-eqz p1, :cond_8

    instance-of v5, p1, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;

    if-nez v5, :cond_9

    .line 183
    :cond_8
    :goto_8
    return v4

    :cond_9
    move-object v2, p1

    .line 166
    check-cast v2, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;

    .line 168
    .local v2, "otherKey":Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;
    const/4 v0, 0x1

    .line 170
    .local v0, "eq":Z
    if-eqz v0, :cond_7b

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A1inv:[[S

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getInvA1()[[S

    move-result-object v6

    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[S[[S)Z

    move-result v5

    if-eqz v5, :cond_7b

    move v0, v3

    .line 171
    :goto_1c
    if-eqz v0, :cond_7d

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A2inv:[[S

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getInvA2()[[S

    move-result-object v6

    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([[S[[S)Z

    move-result v5

    if-eqz v5, :cond_7d

    move v0, v3

    .line 172
    :goto_2b
    if-eqz v0, :cond_7f

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b1:[S

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getB1()[S

    move-result-object v6

    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([S[S)Z

    move-result v5

    if-eqz v5, :cond_7f

    move v0, v3

    .line 173
    :goto_3a
    if-eqz v0, :cond_81

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b2:[S

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getB2()[S

    move-result-object v6

    invoke-static {v5, v6}, Lorg/spongycastle/pqc/crypto/rainbow/util/RainbowUtil;->equals([S[S)Z

    move-result v5

    if-eqz v5, :cond_81

    move v0, v3

    .line 174
    :goto_49
    if-eqz v0, :cond_83

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->vi:[I

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getVi()[I

    move-result-object v6

    invoke-static {v5, v6}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v5

    if-eqz v5, :cond_83

    move v0, v3

    .line 175
    :goto_58
    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    array-length v3, v3

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    move-result-object v5

    array-length v5, v5

    if-ne v3, v5, :cond_8

    .line 179
    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    array-length v3, v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_67
    if-ltz v1, :cond_85

    .line 181
    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    aget-object v3, v3, v1

    invoke-virtual {v2}, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    move-result-object v4

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->equals(Ljava/lang/Object;)Z

    move-result v3

    and-int/2addr v0, v3

    .line 179
    add-int/lit8 v1, v1, -0x1

    goto :goto_67

    .end local v1    # "i":I
    :cond_7b
    move v0, v4

    .line 170
    goto :goto_1c

    :cond_7d
    move v0, v4

    .line 171
    goto :goto_2b

    :cond_7f
    move v0, v4

    .line 172
    goto :goto_3a

    :cond_81
    move v0, v4

    .line 173
    goto :goto_49

    :cond_83
    move v0, v4

    .line 174
    goto :goto_58

    .restart local v1    # "i":I
    :cond_85
    move v4, v0

    .line 183
    goto :goto_8
.end method

.method public final getAlgorithm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 210
    const-string v0, "Rainbow"

    return-object v0
.end method

.method public getB1()[S
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b1:[S

    return-object v0
.end method

.method public getB2()[S
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b2:[S

    return-object v0
.end method

.method public getEncoded()[B
    .registers 12

    .prologue
    const/4 v9, 0x0

    .line 215
    new-instance v0, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;

    iget-object v1, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A1inv:[[S

    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b1:[S

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A2inv:[[S

    iget-object v4, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b2:[S

    iget-object v5, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->vi:[I

    iget-object v6, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;-><init>([[S[S[[S[S[I[Lorg/spongycastle/pqc/crypto/rainbow/Layer;)V

    .line 220
    .local v0, "privateKey":Lorg/spongycastle/pqc/asn1/RainbowPrivateKey;
    :try_start_12
    new-instance v7, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    sget-object v1, Lorg/spongycastle/pqc/asn1/PQCObjectIdentifiers;->rainbow:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    sget-object v2, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    invoke-direct {v7, v1, v2}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 221
    .local v7, "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    new-instance v10, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;

    invoke-direct {v10, v7, v0}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;-><init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_20} :catch_25

    .line 230
    .local v10, "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :try_start_20
    invoke-virtual {v10}, Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;->getEncoded()[B
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_23} :catch_2a

    move-result-object v9

    .line 236
    .end local v7    # "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .end local v10    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :goto_24
    return-object v9

    .line 223
    :catch_25
    move-exception v8

    .line 225
    .local v8, "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_24

    .line 233
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v7    # "algorithmIdentifier":Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .restart local v10    # "pki":Lorg/spongycastle/asn1/pkcs/PrivateKeyInfo;
    :catch_2a
    move-exception v8

    .line 235
    .restart local v8    # "e":Ljava/io/IOException;
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_24
.end method

.method public getFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 242
    const-string v0, "PKCS#8"

    return-object v0
.end method

.method public getInvA1()[[S
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A1inv:[[S

    return-object v0
.end method

.method public getInvA2()[[S
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A2inv:[[S

    return-object v0
.end method

.method public getLayers()[Lorg/spongycastle/pqc/crypto/rainbow/Layer;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    return-object v0
.end method

.method public getVi()[I
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->vi:[I

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 188
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    array-length v0, v2

    .line 190
    .local v0, "hash":I
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A1inv:[[S

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([[S)I

    move-result v3

    add-int v0, v2, v3

    .line 191
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b1:[S

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([S)I

    move-result v3

    add-int v0, v2, v3

    .line 192
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->A2inv:[[S

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([[S)I

    move-result v3

    add-int v0, v2, v3

    .line 193
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->b2:[S

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([S)I

    move-result v3

    add-int v0, v2, v3

    .line 194
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->vi:[I

    invoke-static {v3}, Lorg/spongycastle/util/Arrays;->hashCode([I)I

    move-result v3

    add-int v0, v2, v3

    .line 196
    iget-object v2, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    array-length v2, v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_3a
    if-ltz v1, :cond_4b

    .line 198
    mul-int/lit8 v2, v0, 0x25

    iget-object v3, p0, Lorg/spongycastle/pqc/jcajce/provider/rainbow/BCRainbowPrivateKey;->layers:[Lorg/spongycastle/pqc/crypto/rainbow/Layer;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lorg/spongycastle/pqc/crypto/rainbow/Layer;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 196
    add-int/lit8 v1, v1, -0x1

    goto :goto_3a

    .line 202
    :cond_4b
    return v0
.end method
