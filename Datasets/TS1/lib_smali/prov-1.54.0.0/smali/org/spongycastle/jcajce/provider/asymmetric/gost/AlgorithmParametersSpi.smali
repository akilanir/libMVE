.class public Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;
.super Ljava/security/AlgorithmParametersSpi;
.source "AlgorithmParametersSpi.java"


# instance fields
.field currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/security/AlgorithmParametersSpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetEncoded()[B
    .registers 7

    .prologue
    .line 49
    new-instance v1, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    invoke-virtual {v3}, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;->getPublicKeyParamSetOID()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    new-instance v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    invoke-virtual {v4}, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;->getDigestParamSetOID()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    new-instance v4, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    invoke-virtual {v5}, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;->getEncryptionParamSetOID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, v3, v4}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 53
    .local v1, "gost3410P":Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;
    :try_start_26
    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;->getEncoded(Ljava/lang/String;)[B
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2b} :catch_2d

    move-result-object v2

    return-object v2

    .line 55
    :catch_2d
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Error encoding GOST3410Parameters"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineGetEncoded(Ljava/lang/String;)[B
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "X.509"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 66
    :cond_e
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->engineGetEncoded()[B

    move-result-object v0

    .line 69
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method protected engineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 29
    if-nez p1, :cond_a

    .line 31
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "argument to getParameterSpec must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_a
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v0

    return-object v0
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 4
    .param p1, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 88
    instance-of v0, p1, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    if-nez v0, :cond_c

    .line 90
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "GOST3410ParameterSpec required to initialise a GOST3410 algorithm parameters object"

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_c
    check-cast p1, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    .end local p1    # "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    .line 94
    return-void
.end method

.method protected engineInit([B)V
    .registers 6
    .param p1, "params"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    :try_start_0
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 104
    .local v1, "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    new-instance v2, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;

    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    invoke-static {v2}, Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;->fromPublicKeyAlg(Lorg/spongycastle/asn1/cryptopro/GOST3410PublicKeyAlgParameters;)Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;
    :try_end_11
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_11} :catch_1b

    .line 115
    return-void

    .line 107
    .end local v1    # "seq":Lorg/spongycastle/asn1/ASN1Sequence;
    :catch_12
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a valid GOST3410 Parameter encoding."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 111
    .end local v0    # "e":Ljava/lang/ClassCastException;
    :catch_1b
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Not a valid GOST3410 Parameter encoding."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineInit([BLjava/lang/String;)V
    .registers 6
    .param p1, "params"    # [B
    .param p2, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0, p2}, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const-string v0, "X.509"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 124
    :cond_e
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->engineInit([B)V

    .line 130
    return-void

    .line 128
    :cond_12
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown parameter format "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    const-string v0, "GOST3410 Parameters"

    return-object v0
.end method

.method protected isASN1FormatString(Ljava/lang/String;)Z
    .registers 3
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 22
    if-eqz p1, :cond_a

    const-string v0, "ASN.1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 4
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 76
    const-class v0, Lorg/spongycastle/jce/spec/GOST3410PublicKeyParameterSetSpec;

    if-eq p1, v0, :cond_8

    const-class v0, Ljava/security/spec/AlgorithmParameterSpec;

    if-ne p1, v0, :cond_b

    .line 78
    :cond_8
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/gost/AlgorithmParametersSpi;->currentSpec:Lorg/spongycastle/jce/spec/GOST3410ParameterSpec;

    return-object v0

    .line 81
    :cond_b
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    const-string v1, "unknown parameter spec passed to GOST3410 parameters object."

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
