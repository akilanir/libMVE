.class public final Lorg/spongycastle/crypto/tls/ProtocolVersion;
.super Ljava/lang/Object;
.source "ProtocolVersion.java"


# static fields
.field public static final DTLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field public static final DTLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field public static final SSLv3:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field public static final TLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field public static final TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

.field public static final TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;


# instance fields
.field private name:Ljava/lang/String;

.field private version:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 9
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/16 v1, 0x300

    const-string v2, "SSL 3.0"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->SSLv3:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 10
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/16 v1, 0x301

    const-string v2, "TLS 1.0"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 11
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/16 v1, 0x302

    const-string v2, "TLS 1.1"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 12
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const/16 v1, 0x303

    const-string v2, "TLS 1.2"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 13
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const v1, 0xfeff

    const-string v2, "DTLS 1.0"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 14
    new-instance v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    const v1, 0xfefd

    const-string v2, "DTLS 1.2"

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "v"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const v0, 0xffff

    and-int/2addr v0, p1

    iput v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    .line 22
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->name:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public static get(II)Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 4
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x2f

    .line 106
    sparse-switch p0, :sswitch_data_38

    .line 138
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 110
    :sswitch_b
    packed-switch p1, :pswitch_data_42

    .line 121
    const-string v0, "TLS"

    invoke-static {p0, p1, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getUnknownVersion(IILjava/lang/String;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    .line 134
    :goto_14
    return-object v0

    .line 113
    :pswitch_15
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->SSLv3:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 115
    :pswitch_18
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 117
    :pswitch_1b
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 119
    :pswitch_1e
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 125
    :sswitch_21
    packed-switch p1, :pswitch_data_4e

    .line 134
    const-string v0, "DTLS"

    invoke-static {p0, p1, v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getUnknownVersion(IILjava/lang/String;)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    goto :goto_14

    .line 128
    :pswitch_2b
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 130
    :pswitch_2e
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 132
    :pswitch_34
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_14

    .line 106
    nop

    :sswitch_data_38
    .sparse-switch
        0x3 -> :sswitch_b
        0xfe -> :sswitch_21
    .end sparse-switch

    .line 110
    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_15
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
    .end packed-switch

    .line 125
    :pswitch_data_4e
    .packed-switch 0xfd
        :pswitch_34
        :pswitch_2e
        :pswitch_2b
    .end packed-switch
.end method

.method private static getUnknownVersion(IILjava/lang/String;)Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 8
    .param p0, "major"    # I
    .param p1, "minor"    # I
    .param p2, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 152
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 154
    shl-int/lit8 v2, p0, 0x8

    or-int v1, v2, p1

    .line 155
    .local v1, "v":I
    const/high16 v2, 0x10000

    or-int/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "hex":Ljava/lang/String;
    new-instance v2, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " 0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/spongycastle/crypto/tls/ProtocolVersion;-><init>(ILjava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 90
    if-eq p0, p1, :cond_e

    instance-of v0, p1, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-eqz v0, :cond_10

    check-cast p1, Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .end local p1    # "other":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public equals(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 4
    .param p1, "other"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 95
    if-eqz p1, :cond_a

    iget v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    iget v1, p1, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public getEquivalentTLSVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v0

    if-nez v0, :cond_7

    .line 65
    .end local p0    # "this":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :goto_6
    return-object p0

    .line 61
    .restart local p0    # "this":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    :cond_7
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->DTLSv10:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-ne p0, v0, :cond_e

    .line 63
    sget-object p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_6

    .line 65
    :cond_e
    sget-object p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_6
.end method

.method public getFullVersion()I
    .registers 2

    .prologue
    .line 27
    iget v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    return v0
.end method

.method public getMajorVersion()I
    .registers 2

    .prologue
    .line 32
    iget v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    shr-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public getMinorVersion()I
    .registers 2

    .prologue
    .line 37
    iget v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->version:I

    return v0
.end method

.method public isDTLS()Z
    .registers 3

    .prologue
    .line 42
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v0

    const/16 v1, 0xfe

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 7
    .param p1, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v3

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v4

    if-eq v3, v4, :cond_d

    .line 75
    :goto_c
    return v2

    .line 74
    :cond_d
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v3

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v4

    sub-int v0, v3, v4

    .line 75
    .local v0, "diffMinorVersion":I
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v3

    if-eqz v3, :cond_23

    if-gtz v0, :cond_21

    :cond_1f
    :goto_1f
    move v2, v1

    goto :goto_c

    :cond_21
    move v1, v2

    goto :goto_1f

    :cond_23
    if-gez v0, :cond_1f

    move v1, v2

    goto :goto_1f
.end method

.method public isLaterVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 7
    .param p1, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 80
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v3

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v4

    if-eq v3, v4, :cond_d

    .line 85
    :goto_c
    return v2

    .line 84
    :cond_d
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v3

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v4

    sub-int v0, v3, v4

    .line 85
    .local v0, "diffMinorVersion":I
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    move-result v3

    if-eqz v3, :cond_23

    if-lez v0, :cond_21

    :cond_1f
    :goto_1f
    move v2, v1

    goto :goto_c

    :cond_21
    move v1, v2

    goto :goto_1f

    :cond_23
    if-ltz v0, :cond_1f

    move v1, v2

    goto :goto_1f
.end method

.method public isSSL()Z
    .registers 2

    .prologue
    .line 47
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->SSLv3:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    if-ne p0, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isTLS()Z
    .registers 3

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->name:Ljava/lang/String;

    return-object v0
.end method
