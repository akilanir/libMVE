.class public Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithAESCBC;
.super Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher;
.source "IESCipher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OldECIESwithAESCBC"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 635
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    new-instance v1, Lorg/spongycastle/crypto/engines/AESEngine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/AESEngine;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    const/16 v1, 0x10

    invoke-direct {p0, v0, v1}, Lorg/spongycastle/jcajce/provider/asymmetric/ec/IESCipher$OldECIESwithCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    .line 636
    return-void
.end method
