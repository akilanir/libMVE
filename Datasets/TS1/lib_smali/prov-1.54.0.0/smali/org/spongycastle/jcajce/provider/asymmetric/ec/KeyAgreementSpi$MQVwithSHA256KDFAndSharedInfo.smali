.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi$MQVwithSHA256KDFAndSharedInfo;
.super Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;
.source "KeyAgreementSpi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MQVwithSHA256KDFAndSharedInfo"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .line 382
    const-string v0, "ECMQVwithSHA256KDF"

    new-instance v1, Lorg/spongycastle/crypto/agreement/ECMQVBasicAgreement;

    invoke-direct {v1}, Lorg/spongycastle/crypto/agreement/ECMQVBasicAgreement;-><init>()V

    new-instance v2, Lorg/spongycastle/crypto/generators/KDF2BytesGenerator;

    new-instance v3, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v3}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/generators/KDF2BytesGenerator;-><init>(Lorg/spongycastle/crypto/Digest;)V

    invoke-direct {p0, v0, v1, v2}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/KeyAgreementSpi;-><init>(Ljava/lang/String;Lorg/spongycastle/crypto/BasicAgreement;Lorg/spongycastle/crypto/DerivationFunction;)V

    .line 383
    return-void
.end method
