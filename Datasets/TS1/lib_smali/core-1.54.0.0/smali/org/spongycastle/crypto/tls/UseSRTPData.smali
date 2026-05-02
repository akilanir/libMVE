.class public Lorg/spongycastle/crypto/tls/UseSRTPData;
.super Ljava/lang/Object;
.source "UseSRTPData.java"


# instance fields
.field protected mki:[B

.field protected protectionProfiles:[I


# direct methods
.method public constructor <init>([I[B)V
    .registers 5
    .param p1, "protectionProfiles"    # [I
    .param p2, "mki"    # [B

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    if-eqz p1, :cond_f

    array-length v0, p1

    const/4 v1, 0x1

    if-lt v0, v1, :cond_f

    array-length v0, p1

    const v1, 0x8000

    if-lt v0, v1, :cond_17

    .line 20
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'protectionProfiles\' must have length from 1 to (2^15 - 1)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_17
    if-nez p2, :cond_20

    .line 26
    sget-object p2, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 33
    :cond_1b
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->protectionProfiles:[I

    .line 34
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->mki:[B

    .line 35
    return-void

    .line 28
    :cond_20
    array-length v0, p2

    const/16 v1, 0xff

    if-le v0, v1, :cond_1b

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'mki\' cannot be longer than 255 bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getMki()[B
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->mki:[B

    return-object v0
.end method

.method public getProtectionProfiles()[I
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/UseSRTPData;->protectionProfiles:[I

    return-object v0
.end method
