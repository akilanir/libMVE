.class public Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithDESede;
.super Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithCipher;
.source "IESCipher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OldIESwithDESede"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 552
    new-instance v0, Lorg/spongycastle/crypto/engines/DESedeEngine;

    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/DESedeEngine;-><init>()V

    invoke-direct {p0, v0}, Lorg/spongycastle/jcajce/provider/asymmetric/dh/IESCipher$OldIESwithCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 553
    return-void
.end method
