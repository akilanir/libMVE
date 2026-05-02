.class public Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;
.super Ljava/lang/Object;
.source "TlsExtensionsUtils.java"


# static fields
.field public static final EXT_encrypt_then_mac:Ljava/lang/Integer;

.field public static final EXT_extended_master_secret:Ljava/lang/Integer;

.field public static final EXT_heartbeat:Ljava/lang/Integer;

.field public static final EXT_max_fragment_length:Ljava/lang/Integer;

.field public static final EXT_server_name:Ljava/lang/Integer;

.field public static final EXT_status_request:Ljava/lang/Integer;

.field public static final EXT_truncated_hmac:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    const/16 v0, 0x16

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_encrypt_then_mac:Ljava/lang/Integer;

    .line 13
    const/16 v0, 0x17

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_extended_master_secret:Ljava/lang/Integer;

    .line 14
    const/16 v0, 0xf

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_heartbeat:Ljava/lang/Integer;

    .line 15
    const/4 v0, 0x1

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_max_fragment_length:Ljava/lang/Integer;

    .line 16
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_server_name:Ljava/lang/Integer;

    .line 17
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    .line 18
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_truncated_hmac:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addEncryptThenMACExtension(Ljava/util/Hashtable;)V
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 27
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_encrypt_then_mac:Ljava/lang/Integer;

    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createEncryptThenMACExtension()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    return-void
.end method

.method public static addExtendedMasterSecretExtension(Ljava/util/Hashtable;)V
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 32
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_extended_master_secret:Ljava/lang/Integer;

    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createExtendedMasterSecretExtension()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public static addHeartbeatExtension(Ljava/util/Hashtable;Lorg/spongycastle/crypto/tls/HeartbeatExtension;)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "heartbeatExtension"    # Lorg/spongycastle/crypto/tls/HeartbeatExtension;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 38
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_heartbeat:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createHeartbeatExtension(Lorg/spongycastle/crypto/tls/HeartbeatExtension;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-void
.end method

.method public static addMaxFragmentLengthExtension(Ljava/util/Hashtable;S)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "maxFragmentLength"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_max_fragment_length:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createMaxFragmentLengthExtension(S)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public static addServerNameExtension(Ljava/util/Hashtable;Lorg/spongycastle/crypto/tls/ServerNameList;)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "serverNameList"    # Lorg/spongycastle/crypto/tls/ServerNameList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_server_name:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createServerNameExtension(Lorg/spongycastle/crypto/tls/ServerNameList;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    return-void
.end method

.method public static addStatusRequestExtension(Ljava/util/Hashtable;Lorg/spongycastle/crypto/tls/CertificateStatusRequest;)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "statusRequest"    # Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createStatusRequestExtension(Lorg/spongycastle/crypto/tls/CertificateStatusRequest;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    return-void
.end method

.method public static addTruncatedHMacExtension(Ljava/util/Hashtable;)V
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 61
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_truncated_hmac:Ljava/lang/Integer;

    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createTruncatedHMacExtension()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public static createEmptyExtensionData()[B
    .registers 1

    .prologue
    .line 112
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    return-object v0
.end method

.method public static createEncryptThenMACExtension()[B
    .registers 1

    .prologue
    .line 117
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createEmptyExtensionData()[B

    move-result-object v0

    return-object v0
.end method

.method public static createExtendedMasterSecretExtension()[B
    .registers 1

    .prologue
    .line 122
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createEmptyExtensionData()[B

    move-result-object v0

    return-object v0
.end method

.method public static createHeartbeatExtension(Lorg/spongycastle/crypto/tls/HeartbeatExtension;)[B
    .registers 4
    .param p0, "heartbeatExtension"    # Lorg/spongycastle/crypto/tls/HeartbeatExtension;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    if-nez p0, :cond_a

    .line 130
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 133
    :cond_a
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 135
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/HeartbeatExtension;->encode(Ljava/io/OutputStream;)V

    .line 137
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static createMaxFragmentLengthExtension(S)[B
    .registers 3
    .param p0, "maxFragmentLength"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(S)V

    .line 145
    const/4 v1, 0x1

    new-array v0, v1, [B

    .line 146
    .local v0, "extensionData":[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 147
    return-object v0
.end method

.method public static createServerNameExtension(Lorg/spongycastle/crypto/tls/ServerNameList;)[B
    .registers 4
    .param p0, "serverNameList"    # Lorg/spongycastle/crypto/tls/ServerNameList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    if-nez p0, :cond_a

    .line 155
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 158
    :cond_a
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 160
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/ServerNameList;->encode(Ljava/io/OutputStream;)V

    .line 162
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static createStatusRequestExtension(Lorg/spongycastle/crypto/tls/CertificateStatusRequest;)[B
    .registers 4
    .param p0, "statusRequest"    # Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    if-nez p0, :cond_a

    .line 170
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 173
    :cond_a
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 175
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->encode(Ljava/io/OutputStream;)V

    .line 177
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static createTruncatedHMacExtension()[B
    .registers 1

    .prologue
    .line 182
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->createEmptyExtensionData()[B

    move-result-object v0

    return-object v0
.end method

.method public static ensureExtensionsInitialised(Ljava/util/Hashtable;)Ljava/util/Hashtable;
    .registers 1
    .param p0, "extensions"    # Ljava/util/Hashtable;

    .prologue
    .line 22
    if-nez p0, :cond_7

    new-instance p0, Ljava/util/Hashtable;

    .end local p0    # "extensions":Ljava/util/Hashtable;
    invoke-direct {p0}, Ljava/util/Hashtable;-><init>()V

    :cond_7
    return-object p0
.end method

.method public static getHeartbeatExtension(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/HeartbeatExtension;
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_heartbeat:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 68
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readHeartbeatExtension([B)Lorg/spongycastle/crypto/tls/HeartbeatExtension;

    move-result-object v1

    goto :goto_9
.end method

.method public static getMaxFragmentLengthExtension(Ljava/util/Hashtable;)S
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_max_fragment_length:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 75
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, -0x1

    :goto_9
    return v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readMaxFragmentLengthExtension([B)S

    move-result v1

    goto :goto_9
.end method

.method public static getServerNameExtension(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/ServerNameList;
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_server_name:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 82
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readServerNameExtension([B)Lorg/spongycastle/crypto/tls/ServerNameList;

    move-result-object v1

    goto :goto_9
.end method

.method public static getStatusRequestExtension(Ljava/util/Hashtable;)Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_status_request:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 89
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readStatusRequestExtension([B)Lorg/spongycastle/crypto/tls/CertificateStatusRequest;

    move-result-object v1

    goto :goto_9
.end method

.method public static hasEncryptThenMACExtension(Ljava/util/Hashtable;)Z
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_encrypt_then_mac:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 95
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readEncryptThenMACExtension([B)Z

    move-result v1

    goto :goto_9
.end method

.method public static hasExtendedMasterSecretExtension(Ljava/util/Hashtable;)Z
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_extended_master_secret:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 101
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readExtendedMasterSecretExtension([B)Z

    move-result v1

    goto :goto_9
.end method

.method public static hasTruncatedHMacExtension(Ljava/util/Hashtable;)Z
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->EXT_truncated_hmac:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 107
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readTruncatedHMacExtension([B)Z

    move-result v1

    goto :goto_9
.end method

.method private static readEmptyExtensionData([B)Z
    .registers 3
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    if-nez p0, :cond_a

    .line 189
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'extensionData\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_a
    array-length v0, p0

    if-eqz v0, :cond_15

    .line 194
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x2f

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 197
    :cond_15
    const/4 v0, 0x1

    return v0
.end method

.method public static readEncryptThenMACExtension([B)Z
    .registers 2
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readEmptyExtensionData([B)Z

    move-result v0

    return v0
.end method

.method public static readExtendedMasterSecretExtension([B)Z
    .registers 2
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readEmptyExtensionData([B)Z

    move-result v0

    return v0
.end method

.method public static readHeartbeatExtension([B)Lorg/spongycastle/crypto/tls/HeartbeatExtension;
    .registers 5
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    if-nez p0, :cond_a

    .line 215
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'extensionData\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 218
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 220
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/HeartbeatExtension;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/HeartbeatExtension;

    move-result-object v1

    .line 222
    .local v1, "heartbeatExtension":Lorg/spongycastle/crypto/tls/HeartbeatExtension;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 224
    return-object v1
.end method

.method public static readMaxFragmentLengthExtension([B)S
    .registers 3
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    if-nez p0, :cond_a

    .line 232
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'extensionData\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_a
    array-length v0, p0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_16

    .line 237
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x32

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 240
    :cond_16
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8([BI)S

    move-result v0

    return v0
.end method

.method public static readServerNameExtension([B)Lorg/spongycastle/crypto/tls/ServerNameList;
    .registers 5
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    if-nez p0, :cond_a

    .line 248
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'extensionData\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 251
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 253
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/ServerNameList;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ServerNameList;

    move-result-object v1

    .line 255
    .local v1, "serverNameList":Lorg/spongycastle/crypto/tls/ServerNameList;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 257
    return-object v1
.end method

.method public static readStatusRequestExtension([B)Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    .registers 5
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    if-nez p0, :cond_a

    .line 265
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'extensionData\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 268
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 270
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/CertificateStatusRequest;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/CertificateStatusRequest;

    move-result-object v1

    .line 272
    .local v1, "statusRequest":Lorg/spongycastle/crypto/tls/CertificateStatusRequest;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 274
    return-object v1
.end method

.method public static readTruncatedHMacExtension([B)Z
    .registers 2
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsExtensionsUtils;->readEmptyExtensionData([B)Z

    move-result v0

    return v0
.end method
