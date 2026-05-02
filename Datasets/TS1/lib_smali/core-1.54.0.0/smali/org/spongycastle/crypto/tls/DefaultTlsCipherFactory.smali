.class public Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;
.super Lorg/spongycastle/crypto/tls/AbstractTlsCipherFactory;
.source "DefaultTlsCipherFactory.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Lorg/spongycastle/crypto/tls/AbstractTlsCipherFactory;-><init>()V

    return-void
.end method


# virtual methods
.method protected createAEADBlockCipher_AES_CCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    .registers 3

    .prologue
    .line 172
    new-instance v0, Lorg/spongycastle/crypto/modes/CCMBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESEngine()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createAEADBlockCipher_AES_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    .registers 3

    .prologue
    .line 178
    new-instance v0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESEngine()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createAEADBlockCipher_Camellia_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    .registers 3

    .prologue
    .line 184
    new-instance v0, Lorg/spongycastle/crypto/modes/GCMBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaEngine()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createAESBlockCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 3

    .prologue
    .line 167
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESEngine()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createAESCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;
    .registers 11
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    .line 83
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V

    return-object v0
.end method

.method protected createAESEngine()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 157
    new-instance v0, Lorg/spongycastle/crypto/engines/AESEngine;

    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/AESEngine;-><init>()V

    return-object v0
.end method

.method protected createCamelliaBlockCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 3

    .prologue
    .line 189
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaEngine()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createCamelliaCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;
    .registers 11
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    .line 90
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    .line 91
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V

    return-object v0
.end method

.method protected createCamelliaEngine()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 162
    new-instance v0, Lorg/spongycastle/crypto/engines/CamelliaEngine;

    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/CamelliaEngine;-><init>()V

    return-object v0
.end method

.method protected createChaCha20Poly1305(Lorg/spongycastle/crypto/tls/TlsContext;)Lorg/spongycastle/crypto/tls/TlsCipher;
    .registers 3
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/tls/Chacha20Poly1305;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;)V

    return-object v0
.end method

.method public createCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsCipher;
    .registers 7
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "encryptionAlgorithm"    # I
    .param p3, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x8

    const/16 v1, 0x20

    const/16 v0, 0x10

    .line 25
    sparse-switch p2, :sswitch_data_74

    .line 75
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 28
    :sswitch_11
    invoke-virtual {p0, p1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createDESedeCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    .line 73
    :goto_15
    return-object v0

    .line 31
    :sswitch_16
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createChaCha20Poly1305(Lorg/spongycastle/crypto/tls/TlsContext;)Lorg/spongycastle/crypto/tls/TlsCipher;

    move-result-object v0

    goto :goto_15

    .line 33
    :sswitch_1b
    invoke-virtual {p0, p1, v0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    goto :goto_15

    .line 36
    :sswitch_20
    invoke-virtual {p0, p1, v0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_CCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 39
    :sswitch_25
    invoke-virtual {p0, p1, v0, v2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_CCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 42
    :sswitch_2a
    invoke-virtual {p0, p1, v1, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_CCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 45
    :sswitch_2f
    invoke-virtual {p0, p1, v1, v2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_CCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 48
    :sswitch_34
    invoke-virtual {p0, p1, v0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 50
    :sswitch_39
    invoke-virtual {p0, p1, v1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAESCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    goto :goto_15

    .line 53
    :sswitch_3e
    invoke-virtual {p0, p1, v1, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_AES_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 55
    :sswitch_43
    invoke-virtual {p0, p1, v0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    goto :goto_15

    .line 58
    :sswitch_48
    invoke-virtual {p0, p1, v0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_Camellia_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 60
    :sswitch_4d
    invoke-virtual {p0, p1, v1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCamelliaCipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    goto :goto_15

    .line 63
    :sswitch_52
    invoke-virtual {p0, p1, v1, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createCipher_Camellia_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    move-result-object v0

    goto :goto_15

    .line 65
    :sswitch_57
    const/16 v0, 0xc

    invoke-virtual {p0, p1, v0, v1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSalsa20Cipher(Lorg/spongycastle/crypto/tls/TlsContext;III)Lorg/spongycastle/crypto/tls/TlsStreamCipher;

    move-result-object v0

    goto :goto_15

    .line 67
    :sswitch_5e
    invoke-virtual {p0, p1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createNullCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsNullCipher;

    move-result-object v0

    goto :goto_15

    .line 69
    :sswitch_63
    invoke-virtual {p0, p1, v0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createRC4Cipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsStreamCipher;

    move-result-object v0

    goto :goto_15

    .line 71
    :sswitch_68
    const/16 v0, 0x14

    invoke-virtual {p0, p1, v0, v1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSalsa20Cipher(Lorg/spongycastle/crypto/tls/TlsContext;III)Lorg/spongycastle/crypto/tls/TlsStreamCipher;

    move-result-object v0

    goto :goto_15

    .line 73
    :sswitch_6f
    invoke-virtual {p0, p1, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSEEDCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    move-result-object v0

    goto :goto_15

    .line 25
    :sswitch_data_74
    .sparse-switch
        0x0 -> :sswitch_5e
        0x2 -> :sswitch_63
        0x7 -> :sswitch_11
        0x8 -> :sswitch_1b
        0x9 -> :sswitch_39
        0xa -> :sswitch_34
        0xb -> :sswitch_3e
        0xc -> :sswitch_43
        0xd -> :sswitch_4d
        0xe -> :sswitch_6f
        0xf -> :sswitch_20
        0x10 -> :sswitch_25
        0x11 -> :sswitch_2a
        0x12 -> :sswitch_2f
        0x13 -> :sswitch_48
        0x14 -> :sswitch_52
        0x64 -> :sswitch_57
        0x65 -> :sswitch_68
        0x66 -> :sswitch_16
    .end sparse-switch
.end method

.method protected createCipher_AES_CCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;
    .registers 10
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_AES_CCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v2

    .line 103
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_AES_CCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v3

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/modes/AEADBlockCipher;Lorg/spongycastle/crypto/modes/AEADBlockCipher;II)V

    return-object v0
.end method

.method protected createCipher_AES_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;
    .registers 10
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_AES_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v2

    .line 110
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_AES_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v3

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/modes/AEADBlockCipher;Lorg/spongycastle/crypto/modes/AEADBlockCipher;II)V

    return-object v0
.end method

.method protected createCipher_Camellia_GCM(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsAEADCipher;
    .registers 10
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsAEADCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_Camellia_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v2

    .line 117
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createAEADBlockCipher_Camellia_GCM()Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-result-object v3

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsAEADCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/modes/AEADBlockCipher;Lorg/spongycastle/crypto/modes/AEADBlockCipher;II)V

    return-object v0
.end method

.method protected createDESedeBlockCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 3

    .prologue
    .line 194
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    new-instance v1, Lorg/spongycastle/crypto/engines/DESedeEngine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/DESedeEngine;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createDESedeCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsBlockCipher;
    .registers 10
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createDESedeBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createDESedeBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    .line 124
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    const/16 v6, 0x18

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V

    return-object v0
.end method

.method protected createHMACDigest(I)Lorg/spongycastle/crypto/Digest;
    .registers 4
    .param p1, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    packed-switch p1, :pswitch_data_2c

    .line 229
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 217
    :pswitch_b
    const/4 v0, 0x0

    .line 227
    :goto_c
    return-object v0

    .line 219
    :pswitch_d
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_c

    .line 221
    :pswitch_13
    const/4 v0, 0x2

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_c

    .line 223
    :pswitch_19
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_c

    .line 225
    :pswitch_1f
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_c

    .line 227
    :pswitch_25
    const/4 v0, 0x6

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_c

    .line 214
    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_b
        :pswitch_d
        :pswitch_13
        :pswitch_19
        :pswitch_1f
        :pswitch_25
    .end packed-switch
.end method

.method protected createNullCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsNullCipher;
    .registers 6
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsNullCipher;

    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v1

    .line 131
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/spongycastle/crypto/tls/TlsNullCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;)V

    return-object v0
.end method

.method protected createRC4Cipher(Lorg/spongycastle/crypto/tls/TlsContext;II)Lorg/spongycastle/crypto/tls/TlsStreamCipher;
    .registers 12
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "cipherKeySize"    # I
    .param p3, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createRC4StreamCipher()Lorg/spongycastle/crypto/StreamCipher;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createRC4StreamCipher()Lorg/spongycastle/crypto/StreamCipher;

    move-result-object v3

    .line 138
    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    invoke-virtual {p0, p3}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    const/4 v7, 0x0

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/crypto/tls/TlsStreamCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IZ)V

    return-object v0
.end method

.method protected createRC4StreamCipher()Lorg/spongycastle/crypto/StreamCipher;
    .registers 2

    .prologue
    .line 199
    new-instance v0, Lorg/spongycastle/crypto/engines/RC4Engine;

    invoke-direct {v0}, Lorg/spongycastle/crypto/engines/RC4Engine;-><init>()V

    return-object v0
.end method

.method protected createSEEDBlockCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 3

    .prologue
    .line 209
    new-instance v0, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    new-instance v1, Lorg/spongycastle/crypto/engines/SEEDEngine;

    invoke-direct {v1}, Lorg/spongycastle/crypto/engines/SEEDEngine;-><init>()V

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    return-object v0
.end method

.method protected createSEEDCipher(Lorg/spongycastle/crypto/tls/TlsContext;I)Lorg/spongycastle/crypto/tls/TlsBlockCipher;
    .registers 10
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSEEDBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSEEDBlockCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    .line 152
    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    const/16 v6, 0x10

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V

    return-object v0
.end method

.method protected createSalsa20Cipher(Lorg/spongycastle/crypto/tls/TlsContext;III)Lorg/spongycastle/crypto/tls/TlsStreamCipher;
    .registers 13
    .param p1, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p2, "rounds"    # I
    .param p3, "cipherKeySize"    # I
    .param p4, "macAlgorithm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsStreamCipher;

    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSalsa20StreamCipher(I)Lorg/spongycastle/crypto/StreamCipher;

    move-result-object v2

    invoke-virtual {p0, p2}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createSalsa20StreamCipher(I)Lorg/spongycastle/crypto/StreamCipher;

    move-result-object v3

    .line 145
    invoke-virtual {p0, p4}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    invoke-virtual {p0, p4}, Lorg/spongycastle/crypto/tls/DefaultTlsCipherFactory;->createHMACDigest(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    const/4 v7, 0x1

    move-object v1, p1

    move v6, p3

    invoke-direct/range {v0 .. v7}, Lorg/spongycastle/crypto/tls/TlsStreamCipher;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/StreamCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;IZ)V

    return-object v0
.end method

.method protected createSalsa20StreamCipher(I)Lorg/spongycastle/crypto/StreamCipher;
    .registers 3
    .param p1, "rounds"    # I

    .prologue
    .line 204
    new-instance v0, Lorg/spongycastle/crypto/engines/Salsa20Engine;

    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/engines/Salsa20Engine;-><init>(I)V

    return-object v0
.end method
