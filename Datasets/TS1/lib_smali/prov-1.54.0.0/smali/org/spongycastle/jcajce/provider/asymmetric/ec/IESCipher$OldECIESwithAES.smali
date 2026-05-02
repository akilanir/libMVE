.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAES;
.super Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher;
.source "IESCipher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OldECIESwithAES"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 617
    new-instance v0, Lorg/spongycastle/crypto/engines/AESEngine;

    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/AESEngine;-><init>()V

    invoke-direct {p0, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 618
    return-void
.end method
