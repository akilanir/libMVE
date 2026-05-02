.class public Lorg/spongycastle/crypto/tls/CertChainType;
.super Ljava/lang/Object;
.source "CertChainType.java"


# static fields
.field public static final individual_certs:S = 0x0s

.field public static final pkipath:S = 0x1s


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isValid(S)Z
    .registers 2
    .param p0, "certChainType"    # S

    .prologue
    const/4 v0, 0x1

    .line 13
    if-ltz p0, :cond_6

    if-gt p0, v0, :cond_6

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
