.class public Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamGenCCM;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameterGenerator;
.source "AES.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/AES;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlgParamGenCCM"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 432
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseAlgorithmParameterGenerator;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGenerateParameters()Ljava/security/AlgorithmParameters;
    .registers 6

    .prologue
    const/16 v3, 0xc

    .line 445
    new-array v1, v3, [B

    .line 447
    .local v1, "iv":[B
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamGenCCM;->random:Ljava/security/SecureRandom;

    if-nez v3, :cond_f

    .line 449
    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamGenCCM;->random:Ljava/security/SecureRandom;

    .line 452
    :cond_f
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamGenCCM;->random:Ljava/security/SecureRandom;

    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 458
    :try_start_14
    const-string v3, "CCM"

    invoke-virtual {p0, v3}, Lorg/spongycastle/jcajce/provider/symmetric/AES$AlgParamGenCCM;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    .line 459
    .local v2, "params":Ljava/security/AlgorithmParameters;
    new-instance v3, Lorg/spongycastle/asn1/cms/CCMParameters;

    const/16 v4, 0xc

    invoke-direct {v3, v1, v4}, Lorg/spongycastle/asn1/cms/CCMParameters;-><init>([BI)V

    invoke-virtual {v3}, Lorg/spongycastle/asn1/cms/CCMParameters;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_28} :catch_29

    .line 466
    return-object v2

    .line 461
    .end local v2    # "params":Ljava/security/AlgorithmParameters;
    :catch_29
    move-exception v0

    .line 463
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method protected engineInit(Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 5
    .param p1, "genParamSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p2, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 440
    new-instance v0, Ljava/security/InvalidAlgorithmParameterException;

    const-string v1, "No supported AlgorithmParameterSpec for AES parameter generation."

    invoke-direct {v0, v1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
