.class public Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameters;
.source "AES.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/AES;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlgParamsGCM"
.end annotation


# instance fields
.field private gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 517
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameters;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetEncoded()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 555
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/GCMParameters;->getEncoded()[B

    move-result-object v0

    return-object v0
.end method

.method protected engineGetEncoded(Ljava/lang/String;)[B
    .registers 4
    .param p1, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 561
    invoke-virtual {p0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 563
    new-instance v0, Ljava/io/IOException;

    const-string v1, "unknown format specified"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 566
    :cond_e
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/GCMParameters;->getEncoded()[B

    move-result-object v0

    return-object v0
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;)V
    .registers 5
    .param p1, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 525
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->isGcmSpec(Ljava/security/spec/AlgorithmParameterSpec;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 527
    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->extractGcmParameters(Ljava/security/spec/AlgorithmParameterSpec;)Lorg/spongycastle/asn1/cms/GCMParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    .line 533
    return-void

    .line 531
    :cond_d
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AlgorithmParameterSpec class not recognized: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineInit([B)V
    .registers 3
    .param p1, "params"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 538
    invoke-static {p1}, Lorg/spongycastle/asn1/cms/GCMParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/GCMParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    .line 539
    return-void
.end method

.method protected engineInit([BLjava/lang/String;)V
    .registers 5
    .param p1, "params"    # [B
    .param p2, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 544
    invoke-virtual {p0, p2}, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->isASN1FormatString(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 546
    new-instance v0, Ljava/io/IOException;

    const-string v1, "unknown format specified"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 549
    :cond_e
    invoke-static {p1}, Lorg/spongycastle/asn1/cms/GCMParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/GCMParameters;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    .line 550
    return-void
.end method

.method protected engineToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 571
    const-string v0, "GCM"

    return-object v0
.end method

.method protected localEngineGetParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 5
    .param p1, "paramSpec"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 577
    const-class v0, Ljava/security/spec/AlgorithmParameterSpec;

    if-eq p1, v0, :cond_a

    invoke-static {p1}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->isGcmSpec(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 579
    :cond_a
    invoke-static {}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecExists()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 581
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    invoke-virtual {v0}, Lorg/spongycastle/asn1/cms/GCMParameters;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->extractGcmSpec(Lorg/spongycastle/asn1/ASN1Primitive;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v0

    .line 587
    :goto_1a
    return-object v0

    .line 583
    :cond_1b
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/GCMParameters;->getNonce()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    goto :goto_1a

    .line 585
    :cond_27
    const-class v0, Ljavax/crypto/spec/IvParameterSpec;

    if-ne p1, v0, :cond_37

    .line 587
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamsGCM;->gcmParams:Lorg/spongycastle/asn1/cms/GCMParameters;

    invoke-virtual {v1}, Lorg/spongycastle/asn1/cms/GCMParameters;->getNonce()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    goto :goto_1a

    .line 590
    :cond_37
    new-instance v0, Ljava/security/spec/InvalidParameterSpecException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AlgorithmParameterSpec not recognized: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
