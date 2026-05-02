.class public Lorg/spongycastle/crypto/paddings/PKCS7Padding;
.super Ljava/lang/Object;
.source "PKCS7Padding.java"

# interfaces
.implements Lorg/spongycastle/crypto/paddings/BlockCipherPadding;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addPadding([BI)I
    .registers 5
    .param p1, "in"    # [B
    .param p2, "inOff"    # I

    .prologue
    .line 42
    array-length v1, p1

    sub-int/2addr v1, p2

    int-to-byte v0, v1

    .line 44
    .local v0, "code":B
    :goto_3
    array-length v1, p1

    if-ge p2, v1, :cond_b

    .line 46
    aput-byte v0, p1, p2

    .line 47
    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    .line 50
    :cond_b
    return v0
.end method

.method public getPaddingName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    const-string v0, "PKCS7"

    return-object v0
.end method

.method public init(Ljava/security/SecureRandom;)V
    .registers 2
    .param p1, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 22
    return-void
.end method

.method public padCount([B)I
    .registers 10
    .param p1, "in"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/InvalidCipherTextException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 59
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    aget-byte v4, p1, v4

    and-int/lit16 v0, v4, 0xff

    .line 60
    .local v0, "count":I
    int-to-byte v1, v0

    .line 63
    .local v1, "countAsbyte":B
    array-length v4, p1

    if-le v0, v4, :cond_26

    move v7, v5

    :goto_e
    if-nez v0, :cond_28

    move v4, v5

    :goto_11
    or-int v2, v7, v4

    .line 65
    .local v2, "failed":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_14
    array-length v4, p1

    if-ge v3, v4, :cond_2e

    .line 67
    array-length v4, p1

    sub-int/2addr v4, v3

    if-gt v4, v0, :cond_2a

    move v4, v5

    :goto_1c
    aget-byte v7, p1, v3

    if-eq v7, v1, :cond_2c

    move v7, v5

    :goto_21
    and-int/2addr v4, v7

    or-int/2addr v2, v4

    .line 65
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .end local v2    # "failed":Z
    .end local v3    # "i":I
    :cond_26
    move v7, v6

    .line 63
    goto :goto_e

    :cond_28
    move v4, v6

    goto :goto_11

    .restart local v2    # "failed":Z
    .restart local v3    # "i":I
    :cond_2a
    move v4, v6

    .line 67
    goto :goto_1c

    :cond_2c
    move v7, v6

    goto :goto_21

    .line 70
    :cond_2e
    if-eqz v2, :cond_38

    .line 72
    new-instance v4, Lorg/spongycastle/crypto/InvalidCipherTextException;

    const-string v5, "pad block corrupted"

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/InvalidCipherTextException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 75
    :cond_38
    return v0
.end method
