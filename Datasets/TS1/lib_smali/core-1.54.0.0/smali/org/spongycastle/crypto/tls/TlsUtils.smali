.class public Lorg/spongycastle/crypto/tls/TlsUtils;
.super Ljava/lang/Object;
.source "TlsUtils.java"


# static fields
.field public static final EMPTY_BYTES:[B

.field public static final EMPTY_INTS:[I

.field public static final EMPTY_LONGS:[J

.field public static final EMPTY_SHORTS:[S

.field public static final EXT_signature_algorithms:Ljava/lang/Integer;

.field static final SSL3_CONST:[[B

.field static final SSL_CLIENT:[B

.field static final SSL_SERVER:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 46
    new-array v0, v1, [B

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 47
    new-array v0, v1, [S

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_SHORTS:[S

    .line 48
    new-array v0, v1, [I

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_INTS:[I

    .line 49
    new-array v0, v1, [J

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_LONGS:[J

    .line 51
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EXT_signature_algorithms:Ljava/lang/Integer;

    .line 1376
    new-array v0, v2, [B

    fill-array-data v0, :array_30

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL_CLIENT:[B

    .line 1377
    new-array v0, v2, [B

    fill-array-data v0, :array_36

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL_SERVER:[B

    .line 1380
    invoke-static {}, Lorg/spongycastle/crypto/tls/TlsUtils;->genSSL3Const()[[B

    move-result-object v0

    sput-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL3_CONST:[[B

    return-void

    .line 1376
    nop

    :array_30
    .array-data 1
        0x43t
        0x4ct
        0x4et
        0x54t
    .end array-data

    .line 1377
    :array_36
    .array-data 1
        0x53t
        0x52t
        0x56t
        0x52t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static PRF(Lorg/spongycastle/crypto/tls/TlsContext;[BLjava/lang/String;[BI)[B
    .registers 13
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "secret"    # [B
    .param p2, "asciiLabel"    # Ljava/lang/String;
    .param p3, "seed"    # [B
    .param p4, "size"    # I

    .prologue
    .line 946
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v5

    .line 948
    .local v5, "version":Lorg/spongycastle/crypto/tls/ProtocolVersion;
    invoke-virtual {v5}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isSSL()Z

    move-result v6

    if-eqz v6, :cond_12

    .line 950
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "No PRF available for SSLv3 session"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 953
    :cond_12
    invoke-static {p2}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 954
    .local v1, "label":[B
    invoke-static {v1, p3}, Lorg/spongycastle/crypto/tls/TlsUtils;->concat([B[B)[B

    move-result-object v2

    .line 956
    .local v2, "labelSeed":[B
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v6

    invoke-virtual {v6}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getPrfAlgorithm()I

    move-result v3

    .line 958
    .local v3, "prfAlgorithm":I
    if-nez v3, :cond_29

    .line 960
    invoke-static {p1, v1, v2, p4}, Lorg/spongycastle/crypto/tls/TlsUtils;->PRF_legacy([B[B[BI)[B

    move-result-object v0

    .line 966
    :goto_28
    return-object v0

    .line 963
    :cond_29
    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->createPRFHash(I)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    .line 964
    .local v4, "prfDigest":Lorg/spongycastle/crypto/Digest;
    new-array v0, p4, [B

    .line 965
    .local v0, "buf":[B
    invoke-static {v4, p1, v2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->hmac_hash(Lorg/spongycastle/crypto/Digest;[B[B[B)V

    goto :goto_28
.end method

.method public static PRF_legacy([BLjava/lang/String;[BI)[B
    .registers 7
    .param p0, "secret"    # [B
    .param p1, "asciiLabel"    # Ljava/lang/String;
    .param p2, "seed"    # [B
    .param p3, "size"    # I

    .prologue
    .line 971
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 972
    .local v0, "label":[B
    invoke-static {v0, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->concat([B[B)[B

    move-result-object v1

    .line 974
    .local v1, "labelSeed":[B
    invoke-static {p0, v0, v1, p3}, Lorg/spongycastle/crypto/tls/TlsUtils;->PRF_legacy([B[B[BI)[B

    move-result-object v2

    return-object v2
.end method

.method static PRF_legacy([B[B[BI)[B
    .registers 12
    .param p0, "secret"    # [B
    .param p1, "label"    # [B
    .param p2, "labelSeed"    # [B
    .param p3, "size"    # I

    .prologue
    const/4 v7, 0x0

    .line 979
    array-length v6, p0

    add-int/lit8 v6, v6, 0x1

    div-int/lit8 v5, v6, 0x2

    .line 980
    .local v5, "s_half":I
    new-array v3, v5, [B

    .line 981
    .local v3, "s1":[B
    new-array v4, v5, [B

    .line 982
    .local v4, "s2":[B
    invoke-static {p0, v7, v3, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 983
    array-length v6, p0

    sub-int/2addr v6, v5

    invoke-static {p0, v6, v4, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 985
    new-array v0, p3, [B

    .line 986
    .local v0, "b1":[B
    new-array v1, p3, [B

    .line 987
    .local v1, "b2":[B
    const/4 v6, 0x1

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v6

    invoke-static {v6, v3, p2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->hmac_hash(Lorg/spongycastle/crypto/Digest;[B[B[B)V

    .line 988
    const/4 v6, 0x2

    invoke-static {v6}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v6

    invoke-static {v6, v4, p2, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->hmac_hash(Lorg/spongycastle/crypto/Digest;[B[B[B)V

    .line 989
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_27
    if-ge v2, p3, :cond_34

    .line 991
    aget-byte v6, v0, v2

    aget-byte v7, v1, v2

    xor-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v0, v2

    .line 989
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 993
    :cond_34
    return-object v0
.end method

.method public static addSignatureAlgorithmsExtension(Ljava/util/Hashtable;Ljava/util/Vector;)V
    .registers 4
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "supportedSignatureAlgorithms"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 798
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EXT_signature_algorithms:Ljava/lang/Integer;

    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->createSignatureAlgorithmsExtension(Ljava/util/Vector;)[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    return-void
.end method

.method static calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B
    .registers 7
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "size"    # I

    .prologue
    .line 1045
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v1

    .line 1046
    .local v1, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getMasterSecret()[B

    move-result-object v0

    .line 1047
    .local v0, "master_secret":[B
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getServerRandom()[B

    move-result-object v3

    .line 1048
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getClientRandom()[B

    move-result-object v4

    .line 1047
    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->concat([B[B)[B

    move-result-object v2

    .line 1050
    .local v2, "seed":[B
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 1052
    invoke-static {v0, v2, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock_SSL([B[BI)[B

    move-result-object v3

    .line 1055
    :goto_1e
    return-object v3

    :cond_1f
    const-string v3, "key expansion"

    invoke-static {p0, v0, v3, v2, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->PRF(Lorg/spongycastle/crypto/tls/TlsContext;[BLjava/lang/String;[BI)[B

    move-result-object v3

    goto :goto_1e
.end method

.method static calculateKeyBlock_SSL([B[BI)[B
    .registers 13
    .param p0, "master_secret"    # [B
    .param p1, "random"    # [B
    .param p2, "size"    # I

    .prologue
    const/4 v9, 0x0

    .line 1060
    const/4 v8, 0x1

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v1

    .line 1061
    .local v1, "md5":Lorg/spongycastle/crypto/Digest;
    const/4 v8, 0x2

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v4

    .line 1062
    .local v4, "sha1":Lorg/spongycastle/crypto/Digest;
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    .line 1063
    .local v2, "md5Size":I
    invoke-interface {v4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v8

    new-array v5, v8, [B

    .line 1064
    .local v5, "shatmp":[B
    add-int v8, p2, v2

    new-array v7, v8, [B

    .line 1066
    .local v7, "tmp":[B
    const/4 v0, 0x0

    .local v0, "i":I
    const/4 v3, 0x0

    .line 1067
    .local v3, "pos":I
    :goto_1b
    if-ge v3, p2, :cond_3f

    .line 1069
    sget-object v8, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL3_CONST:[[B

    aget-object v6, v8, v0

    .line 1071
    .local v6, "ssl3Const":[B
    array-length v8, v6

    invoke-interface {v4, v6, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1072
    array-length v8, p0

    invoke-interface {v4, p0, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1073
    array-length v8, p1

    invoke-interface {v4, p1, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1074
    invoke-interface {v4, v5, v9}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 1076
    array-length v8, p0

    invoke-interface {v1, p0, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1077
    array-length v8, v5

    invoke-interface {v1, v5, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1078
    invoke-interface {v1, v7, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 1080
    add-int/2addr v3, v2

    .line 1081
    add-int/lit8 v0, v0, 0x1

    .line 1082
    goto :goto_1b

    .line 1084
    .end local v6    # "ssl3Const":[B
    :cond_3f
    invoke-static {v7, v9, p2}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    move-result-object v8

    return-object v8
.end method

.method static calculateMasterSecret(Lorg/spongycastle/crypto/tls/TlsContext;[B)[B
    .registers 7
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "pre_master_secret"    # [B

    .prologue
    .line 1089
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v1

    .line 1092
    .local v1, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    iget-boolean v3, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    if-eqz v3, :cond_17

    .line 1094
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getSessionHash()[B

    move-result-object v2

    .line 1101
    .local v2, "seed":[B
    :goto_c
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 1103
    invoke-static {p1, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateMasterSecret_SSL([B[B)[B

    move-result-object v3

    .line 1110
    :goto_16
    return-object v3

    .line 1098
    .end local v2    # "seed":[B
    :cond_17
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getClientRandom()[B

    move-result-object v3

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getServerRandom()[B

    move-result-object v4

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->concat([B[B)[B

    move-result-object v2

    .restart local v2    # "seed":[B
    goto :goto_c

    .line 1106
    :cond_24
    iget-boolean v3, v1, Lorg/spongycastle/crypto/tls/SecurityParameters;->extendedMasterSecret:Z

    if-eqz v3, :cond_31

    const-string v0, "extended master secret"

    .line 1110
    .local v0, "asciiLabel":Ljava/lang/String;
    :goto_2a
    const/16 v3, 0x30

    invoke-static {p0, p1, v0, v2, v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->PRF(Lorg/spongycastle/crypto/tls/TlsContext;[BLjava/lang/String;[BI)[B

    move-result-object v3

    goto :goto_16

    .line 1106
    .end local v0    # "asciiLabel":Ljava/lang/String;
    :cond_31
    const-string v0, "master secret"

    goto :goto_2a
.end method

.method static calculateMasterSecret_SSL([B[B)[B
    .registers 12
    .param p0, "pre_master_secret"    # [B
    .param p1, "random"    # [B

    .prologue
    const/4 v9, 0x0

    .line 1115
    const/4 v8, 0x1

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v1

    .line 1116
    .local v1, "md5":Lorg/spongycastle/crypto/Digest;
    const/4 v8, 0x2

    invoke-static {v8}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v5

    .line 1117
    .local v5, "sha1":Lorg/spongycastle/crypto/Digest;
    invoke-interface {v1}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v2

    .line 1118
    .local v2, "md5Size":I
    invoke-interface {v5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v8

    new-array v6, v8, [B

    .line 1120
    .local v6, "shatmp":[B
    mul-int/lit8 v8, v2, 0x3

    new-array v4, v8, [B

    .line 1121
    .local v4, "rval":[B
    const/4 v3, 0x0

    .line 1123
    .local v3, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1b
    const/4 v8, 0x3

    if-ge v0, v8, :cond_40

    .line 1125
    sget-object v8, Lorg/spongycastle/crypto/tls/TlsUtils;->SSL3_CONST:[[B

    aget-object v7, v8, v0

    .line 1127
    .local v7, "ssl3Const":[B
    array-length v8, v7

    invoke-interface {v5, v7, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1128
    array-length v8, p0

    invoke-interface {v5, p0, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1129
    array-length v8, p1

    invoke-interface {v5, p1, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1130
    invoke-interface {v5, v6, v9}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 1132
    array-length v8, p0

    invoke-interface {v1, p0, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1133
    array-length v8, v6

    invoke-interface {v1, v6, v9, v8}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 1134
    invoke-interface {v1, v4, v3}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 1136
    add-int/2addr v3, v2

    .line 1123
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 1139
    .end local v7    # "ssl3Const":[B
    :cond_40
    return-object v4
.end method

.method static calculateVerifyData(Lorg/spongycastle/crypto/tls/TlsContext;Ljava/lang/String;[B)[B
    .registers 7
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "asciiLabel"    # Ljava/lang/String;
    .param p2, "handshakeHash"    # [B

    .prologue
    .line 1144
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1153
    .end local p2    # "handshakeHash":[B
    :goto_6
    return-object p2

    .line 1149
    .restart local p2    # "handshakeHash":[B
    :cond_7
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    move-result-object v1

    .line 1150
    .local v1, "securityParameters":Lorg/spongycastle/crypto/tls/SecurityParameters;
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getMasterSecret()[B

    move-result-object v0

    .line 1151
    .local v0, "master_secret":[B
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SecurityParameters;->getVerifyDataLength()I

    move-result v2

    .line 1153
    .local v2, "verify_data_length":I
    invoke-static {p0, v0, p1, p2, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->PRF(Lorg/spongycastle/crypto/tls/TlsContext;[BLjava/lang/String;[BI)[B

    move-result-object p2

    goto :goto_6
.end method

.method public static checkUint16(I)V
    .registers 3
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint16(I)Z

    move-result v0

    if-nez v0, :cond_e

    .line 81
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 83
    :cond_e
    return-void
.end method

.method public static checkUint16(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint16(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 89
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 91
    :cond_e
    return-void
.end method

.method public static checkUint24(I)V
    .registers 3
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint24(I)Z

    move-result v0

    if-nez v0, :cond_e

    .line 97
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 99
    :cond_e
    return-void
.end method

.method public static checkUint24(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint24(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 105
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 107
    :cond_e
    return-void
.end method

.method public static checkUint32(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint32(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 113
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 115
    :cond_e
    return-void
.end method

.method public static checkUint48(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint48(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 121
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 123
    :cond_e
    return-void
.end method

.method public static checkUint64(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint64(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 129
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 131
    :cond_e
    return-void
.end method

.method public static checkUint8(I)V
    .registers 3
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint8(I)Z

    move-result v0

    if-nez v0, :cond_e

    .line 65
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 67
    :cond_e
    return-void
.end method

.method public static checkUint8(J)V
    .registers 4
    .param p0, "i"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint8(J)Z

    move-result v0

    if-nez v0, :cond_e

    .line 73
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 75
    :cond_e
    return-void
.end method

.method public static checkUint8(S)V
    .registers 3
    .param p0, "i"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isValidUint8(S)Z

    move-result v0

    if-nez v0, :cond_e

    .line 57
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 59
    :cond_e
    return-void
.end method

.method public static cloneHash(SLorg/spongycastle/crypto/Digest;)Lorg/spongycastle/crypto/Digest;
    .registers 4
    .param p0, "hashAlgorithm"    # S
    .param p1, "hash"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 1186
    packed-switch p0, :pswitch_data_3c

    .line 1201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown HashAlgorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1189
    :pswitch_b
    new-instance v0, Lorg/spongycastle/crypto/digests/MD5Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/MD5Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/MD5Digest;-><init>(Lorg/spongycastle/crypto/digests/MD5Digest;)V

    .line 1199
    :goto_12
    return-object v0

    .line 1191
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_13
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA1Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/SHA1Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA1Digest;)V

    goto :goto_12

    .line 1193
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_1b
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA224Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/SHA224Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/SHA224Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA224Digest;)V

    goto :goto_12

    .line 1195
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_23
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA256Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/SHA256Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA256Digest;)V

    goto :goto_12

    .line 1197
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_2b
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA384Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/SHA384Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/SHA384Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA384Digest;)V

    goto :goto_12

    .line 1199
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_33
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA512Digest;

    check-cast p1, Lorg/spongycastle/crypto/digests/SHA512Digest;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/digests/SHA512Digest;-><init>(Lorg/spongycastle/crypto/digests/SHA512Digest;)V

    goto :goto_12

    .line 1186
    nop

    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_b
        :pswitch_13
        :pswitch_1b
        :pswitch_23
        :pswitch_2b
        :pswitch_33
    .end packed-switch
.end method

.method public static clonePRFHash(ILorg/spongycastle/crypto/Digest;)Lorg/spongycastle/crypto/Digest;
    .registers 3
    .param p0, "prfAlgorithm"    # I
    .param p1, "hash"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 1218
    packed-switch p0, :pswitch_data_14

    .line 1223
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getHashAlgorithmForPRFAlgorithm(I)S

    move-result v0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->cloneHash(SLorg/spongycastle/crypto/Digest;)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :goto_b
    return-object v0

    .line 1221
    .restart local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    :pswitch_c
    new-instance v0, Lorg/spongycastle/crypto/tls/CombinedHash;

    check-cast p1, Lorg/spongycastle/crypto/tls/CombinedHash;

    .end local p1    # "hash":Lorg/spongycastle/crypto/Digest;
    invoke-direct {v0, p1}, Lorg/spongycastle/crypto/tls/CombinedHash;-><init>(Lorg/spongycastle/crypto/tls/CombinedHash;)V

    goto :goto_b

    .line 1218
    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method static concat([B[B)[B
    .registers 6
    .param p0, "a"    # [B
    .param p1, "b"    # [B

    .prologue
    const/4 v3, 0x0

    .line 998
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 999
    .local v0, "c":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1000
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1001
    return-object v0
.end method

.method public static createHash(Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)Lorg/spongycastle/crypto/Digest;
    .registers 2
    .param p0, "signatureAndHashAlgorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .prologue
    .line 1179
    if-nez p0, :cond_8

    new-instance v0, Lorg/spongycastle/crypto/tls/CombinedHash;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/CombinedHash;-><init>()V

    .line 1181
    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    goto :goto_7
.end method

.method public static createHash(S)Lorg/spongycastle/crypto/Digest;
    .registers 3
    .param p0, "hashAlgorithm"    # S

    .prologue
    .line 1158
    packed-switch p0, :pswitch_data_30

    .line 1173
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown HashAlgorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1161
    :pswitch_b
    new-instance v0, Lorg/spongycastle/crypto/digests/MD5Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/MD5Digest;-><init>()V

    .line 1171
    :goto_10
    return-object v0

    .line 1163
    :pswitch_11
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA1Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA1Digest;-><init>()V

    goto :goto_10

    .line 1165
    :pswitch_17
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA224Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA224Digest;-><init>()V

    goto :goto_10

    .line 1167
    :pswitch_1d
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA256Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA256Digest;-><init>()V

    goto :goto_10

    .line 1169
    :pswitch_23
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA384Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA384Digest;-><init>()V

    goto :goto_10

    .line 1171
    :pswitch_29
    new-instance v0, Lorg/spongycastle/crypto/digests/SHA512Digest;

    invoke-direct {v0}, Lorg/spongycastle/crypto/digests/SHA512Digest;-><init>()V

    goto :goto_10

    .line 1158
    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_b
        :pswitch_11
        :pswitch_17
        :pswitch_1d
        :pswitch_23
        :pswitch_29
    .end packed-switch
.end method

.method public static createPRFHash(I)Lorg/spongycastle/crypto/Digest;
    .registers 2
    .param p0, "prfAlgorithm"    # I

    .prologue
    .line 1207
    packed-switch p0, :pswitch_data_12

    .line 1212
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getHashAlgorithmForPRFAlgorithm(I)S

    move-result v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->createHash(S)Lorg/spongycastle/crypto/Digest;

    move-result-object v0

    :goto_b
    return-object v0

    .line 1210
    :pswitch_c
    new-instance v0, Lorg/spongycastle/crypto/tls/CombinedHash;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/CombinedHash;-><init>()V

    goto :goto_b

    .line 1207
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public static createSignatureAlgorithmsExtension(Ljava/util/Vector;)[B
    .registers 3
    .param p0, "supportedSignatureAlgorithms"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 825
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 828
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->encodeSupportedSignatureAlgorithms(Ljava/util/Vector;ZLjava/io/OutputStream;)V

    .line 830
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static createTlsSigner(S)Lorg/spongycastle/crypto/tls/TlsSigner;
    .registers 3
    .param p0, "clientCertificateType"    # S

    .prologue
    .line 1363
    sparse-switch p0, :sswitch_data_1e

    .line 1372
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'clientCertificateType\' is not a type with signing capability"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1366
    :sswitch_b
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsDSSSigner;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsDSSSigner;-><init>()V

    .line 1370
    :goto_10
    return-object v0

    .line 1368
    :sswitch_11
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsECDSASigner;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsECDSASigner;-><init>()V

    goto :goto_10

    .line 1370
    :sswitch_17
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsRSASigner;

    invoke-direct {v0}, Lorg/spongycastle/crypto/tls/TlsRSASigner;-><init>()V

    goto :goto_10

    .line 1363
    nop

    :sswitch_data_1e
    .sparse-switch
        0x1 -> :sswitch_17
        0x2 -> :sswitch_b
        0x40 -> :sswitch_11
    .end sparse-switch
.end method

.method public static encodeOpaque8([B)[B
    .registers 2
    .param p0, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 420
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 421
    array-length v0, p0

    int-to-byte v0, v0

    invoke-static {p0, v0}, Lorg/spongycastle/util/Arrays;->prepend([BB)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeSupportedSignatureAlgorithms(Ljava/util/Vector;ZLjava/io/OutputStream;)V
    .registers 8
    .param p0, "supportedSignatureAlgorithms"    # Ljava/util/Vector;
    .param p1, "allowAnonymous"    # Z
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 861
    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_12

    .line 862
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v3

    const v4, 0x8000

    if-lt v3, v4, :cond_1a

    .line 864
    :cond_12
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'supportedSignatureAlgorithms\' must have length from 1 to (2^15 - 1)"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 869
    :cond_1a
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v3

    mul-int/lit8 v2, v3, 0x2

    .line 870
    .local v2, "length":I
    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 871
    invoke-static {v2, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 872
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_27
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v1, v3, :cond_49

    .line 874
    invoke-virtual {p0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 875
    .local v0, "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    if-nez p1, :cond_43

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v3

    if-nez v3, :cond_43

    .line 881
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "SignatureAlgorithm.anonymous MUST NOT appear in the signature_algorithms extension"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 884
    :cond_43
    invoke-virtual {v0, p2}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->encode(Ljava/io/OutputStream;)V

    .line 872
    add-int/lit8 v1, v1, 0x1

    goto :goto_27

    .line 886
    .end local v0    # "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :cond_49
    return-void
.end method

.method public static encodeUint16ArrayWithUint16Length([I)[B
    .registers 4
    .param p0, "uints"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 433
    array-length v2, p0

    mul-int/lit8 v0, v2, 0x2

    .line 434
    .local v0, "length":I
    add-int/lit8 v2, v0, 0x2

    new-array v1, v2, [B

    .line 435
    .local v1, "result":[B
    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16ArrayWithUint16Length([I[BI)V

    .line 436
    return-object v1
.end method

.method public static encodeUint8ArrayWithUint8Length([S)[B
    .registers 3
    .param p0, "uints"    # [S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 426
    array-length v1, p0

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [B

    .line 427
    .local v0, "result":[B
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8ArrayWithUint8Length([S[BI)V

    .line 428
    return-object v0
.end method

.method private static genSSL3Const()[[B
    .registers 5

    .prologue
    .line 1384
    const/16 v3, 0xa

    .line 1385
    .local v3, "n":I
    new-array v0, v3, [[B

    .line 1386
    .local v0, "arr":[[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v3, :cond_16

    .line 1388
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [B

    .line 1389
    .local v1, "b":[B
    add-int/lit8 v4, v2, 0x41

    int-to-byte v4, v4

    invoke-static {v1, v4}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 1390
    aput-object v1, v0, v2

    .line 1386
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1392
    .end local v1    # "b":[B
    :cond_16
    return-object v0
.end method

.method public static getCipherType(I)I
    .registers 3
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1404
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getEncryptionAlgorithm(I)I

    move-result v0

    sparse-switch v0, :sswitch_data_16

    .line 1436
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 1415
    :sswitch_f
    const/4 v0, 0x2

    .line 1433
    :goto_10
    return v0

    .line 1427
    :sswitch_11
    const/4 v0, 0x1

    goto :goto_10

    .line 1433
    :sswitch_13
    const/4 v0, 0x0

    goto :goto_10

    .line 1404
    nop

    :sswitch_data_16
    .sparse-switch
        0x1 -> :sswitch_13
        0x2 -> :sswitch_13
        0x3 -> :sswitch_11
        0x4 -> :sswitch_11
        0x5 -> :sswitch_11
        0x6 -> :sswitch_11
        0x7 -> :sswitch_11
        0x8 -> :sswitch_11
        0x9 -> :sswitch_11
        0xa -> :sswitch_f
        0xb -> :sswitch_f
        0xc -> :sswitch_11
        0xd -> :sswitch_11
        0xe -> :sswitch_11
        0xf -> :sswitch_f
        0x10 -> :sswitch_f
        0x11 -> :sswitch_f
        0x12 -> :sswitch_f
        0x13 -> :sswitch_f
        0x14 -> :sswitch_f
        0x64 -> :sswitch_13
        0x65 -> :sswitch_13
        0x66 -> :sswitch_f
    .end sparse-switch
.end method

.method static getClientCertificateType(Lorg/spongycastle/crypto/tls/Certificate;Lorg/spongycastle/crypto/tls/Certificate;)S
    .registers 9
    .param p0, "clientCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .param p1, "serverCertificate"    # Lorg/spongycastle/crypto/tls/Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2b

    .line 1266
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/Certificate;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1268
    const/4 v4, -0x1

    .line 1321
    :goto_9
    return v4

    .line 1271
    :cond_a
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lorg/spongycastle/crypto/tls/Certificate;->getCertificateAt(I)Lorg/spongycastle/asn1/x509/Certificate;

    move-result-object v3

    .line 1272
    .local v3, "x509Cert":Lorg/spongycastle/asn1/x509/Certificate;
    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/Certificate;->getSubjectPublicKeyInfo()Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;

    move-result-object v1

    .line 1275
    .local v1, "keyInfo":Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;
    :try_start_13
    invoke-static {v1}, Lorg/spongycastle/crypto/util/PublicKeyFactory;->createKey(Lorg/spongycastle/asn1/x509/SubjectPublicKeyInfo;)Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;

    move-result-object v2

    .line 1276
    .local v2, "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;->isPrivate()Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 1278
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v5, 0x50

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v4
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_25} :catch_25

    .line 1328
    .end local v2    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :catch_25
    move-exception v0

    .line 1330
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v4, v6, v0}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(SLjava/lang/Throwable;)V

    throw v4

    .line 1296
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "publicKey":Lorg/spongycastle/crypto/params/AsymmetricKeyParameter;
    :cond_2c
    :try_start_2c
    instance-of v4, v2, Lorg/spongycastle/crypto/params/RSAKeyParameters;

    if-eqz v4, :cond_37

    .line 1298
    const/16 v4, 0x80

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    .line 1299
    const/4 v4, 0x1

    goto :goto_9

    .line 1306
    :cond_37
    instance-of v4, v2, Lorg/spongycastle/crypto/params/DSAPublicKeyParameters;

    if-eqz v4, :cond_42

    .line 1308
    const/16 v4, 0x80

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    .line 1309
    const/4 v4, 0x2

    goto :goto_9

    .line 1317
    :cond_42
    instance-of v4, v2, Lorg/spongycastle/crypto/params/ECPublicKeyParameters;

    if-eqz v4, :cond_4e

    .line 1319
    const/16 v4, 0x80

    invoke-static {v3, v4}, Lorg/spongycastle/crypto/tls/TlsUtils;->validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V

    .line 1321
    const/16 v4, 0x40

    goto :goto_9

    .line 1326
    :cond_4e
    new-instance v4, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v5, 0x2b

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v4
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_56} :catch_25
.end method

.method public static getDefaultDSSSignatureAlgorithms()Ljava/util/Vector;
    .registers 2

    .prologue
    const/4 v1, 0x2

    .line 711
    new-instance v0, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    invoke-direct {v0, v1, v1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;-><init>(SS)V

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->vectorOfOne(Ljava/lang/Object;)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultECDSASignatureAlgorithms()Ljava/util/Vector;
    .registers 3

    .prologue
    .line 716
    new-instance v0, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    const/4 v1, 0x2

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;-><init>(SS)V

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->vectorOfOne(Ljava/lang/Object;)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultRSASignatureAlgorithms()Ljava/util/Vector;
    .registers 3

    .prologue
    .line 721
    new-instance v0, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;-><init>(SS)V

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->vectorOfOne(Ljava/lang/Object;)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultSupportedSignatureAlgorithms()Ljava/util/Vector;
    .registers 8

    .prologue
    .line 726
    const/4 v5, 0x5

    new-array v0, v5, [S

    fill-array-data v0, :array_2c

    .line 728
    .local v0, "hashAlgorithms":[S
    const/4 v5, 0x3

    new-array v4, v5, [S

    fill-array-data v4, :array_36

    .line 731
    .local v4, "signatureAlgorithms":[S
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 732
    .local v3, "result":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    array-length v5, v4

    if-ge v1, v5, :cond_2b

    .line 734
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_16
    array-length v5, v0

    if-ge v2, v5, :cond_28

    .line 736
    new-instance v5, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    aget-short v6, v0, v2

    aget-short v7, v4, v1

    invoke-direct {v5, v6, v7}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;-><init>(SS)V

    invoke-virtual {v3, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 734
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 732
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 739
    .end local v2    # "j":I
    :cond_2b
    return-object v3

    .line 726
    :array_2c
    .array-data 2
        0x2s
        0x3s
        0x4s
        0x5s
        0x6s
    .end array-data

    .line 728
    nop

    :array_36
    .array-data 2
        0x1s
        0x2s
        0x3s
    .end array-data
.end method

.method public static getEncryptionAlgorithm(I)I
    .registers 6
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v0, 0x8

    const/4 v4, 0x2

    const/16 v2, 0xd

    const/16 v1, 0x9

    const/4 v3, 0x0

    .line 1442
    sparse-switch p0, :sswitch_data_58

    .line 1736
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 1460
    :sswitch_13
    const/4 v0, 0x7

    .line 1733
    :goto_14
    :sswitch_14
    return v0

    .line 1465
    :sswitch_15
    const/16 v0, 0x66

    goto :goto_14

    .line 1505
    :sswitch_18
    const/16 v0, 0xf

    goto :goto_14

    .line 1512
    :sswitch_1b
    const/16 v0, 0x10

    goto :goto_14

    .line 1526
    :sswitch_1e
    const/16 v0, 0xa

    goto :goto_14

    :sswitch_21
    move v0, v1

    .line 1544
    goto :goto_14

    :sswitch_23
    move v0, v1

    .line 1551
    goto :goto_14

    :sswitch_25
    move v0, v1

    .line 1561
    goto :goto_14

    .line 1568
    :sswitch_27
    const/16 v0, 0x11

    goto :goto_14

    .line 1575
    :sswitch_2a
    const/16 v0, 0x12

    goto :goto_14

    .line 1589
    :sswitch_2d
    const/16 v0, 0xb

    goto :goto_14

    .line 1596
    :sswitch_30
    const/16 v0, 0xc

    goto :goto_14

    .line 1611
    :sswitch_33
    const/16 v0, 0xc

    goto :goto_14

    .line 1625
    :sswitch_36
    const/16 v0, 0x13

    goto :goto_14

    :sswitch_39
    move v0, v2

    .line 1632
    goto :goto_14

    :sswitch_3b
    move v0, v2

    .line 1639
    goto :goto_14

    :sswitch_3d
    move v0, v2

    .line 1649
    goto :goto_14

    .line 1663
    :sswitch_3f
    const/16 v0, 0x14

    goto :goto_14

    .line 1673
    :sswitch_42
    const/16 v0, 0x64

    goto :goto_14

    :sswitch_45
    move v0, v3

    .line 1676
    goto :goto_14

    :sswitch_47
    move v0, v3

    .line 1687
    goto :goto_14

    :sswitch_49
    move v0, v3

    .line 1694
    goto :goto_14

    :sswitch_4b
    move v0, v3

    .line 1700
    goto :goto_14

    :sswitch_4d
    move v0, v4

    .line 1704
    goto :goto_14

    :sswitch_4f
    move v0, v4

    .line 1716
    goto :goto_14

    .line 1726
    :sswitch_51
    const/16 v0, 0x65

    goto :goto_14

    .line 1733
    :sswitch_54
    const/16 v0, 0xe

    goto :goto_14

    .line 1442
    nop

    :sswitch_data_58
    .sparse-switch
        0x1 -> :sswitch_45
        0x2 -> :sswitch_47
        0x4 -> :sswitch_4d
        0x5 -> :sswitch_4f
        0xa -> :sswitch_13
        0xd -> :sswitch_13
        0x10 -> :sswitch_13
        0x13 -> :sswitch_13
        0x16 -> :sswitch_13
        0x18 -> :sswitch_4d
        0x2c -> :sswitch_47
        0x2d -> :sswitch_47
        0x2e -> :sswitch_47
        0x2f -> :sswitch_14
        0x30 -> :sswitch_14
        0x31 -> :sswitch_14
        0x32 -> :sswitch_14
        0x33 -> :sswitch_14
        0x35 -> :sswitch_21
        0x36 -> :sswitch_21
        0x37 -> :sswitch_21
        0x38 -> :sswitch_21
        0x39 -> :sswitch_21
        0x3b -> :sswitch_49
        0x3c -> :sswitch_14
        0x3d -> :sswitch_23
        0x3e -> :sswitch_14
        0x3f -> :sswitch_14
        0x40 -> :sswitch_14
        0x41 -> :sswitch_30
        0x42 -> :sswitch_30
        0x43 -> :sswitch_30
        0x44 -> :sswitch_30
        0x45 -> :sswitch_30
        0x67 -> :sswitch_14
        0x68 -> :sswitch_23
        0x69 -> :sswitch_23
        0x6a -> :sswitch_23
        0x6b -> :sswitch_23
        0x84 -> :sswitch_39
        0x85 -> :sswitch_39
        0x86 -> :sswitch_39
        0x87 -> :sswitch_39
        0x88 -> :sswitch_39
        0x8a -> :sswitch_4f
        0x8b -> :sswitch_13
        0x8c -> :sswitch_14
        0x8d -> :sswitch_21
        0x8e -> :sswitch_4f
        0x8f -> :sswitch_13
        0x90 -> :sswitch_14
        0x91 -> :sswitch_21
        0x92 -> :sswitch_4f
        0x93 -> :sswitch_13
        0x94 -> :sswitch_14
        0x95 -> :sswitch_21
        0x96 -> :sswitch_54
        0x97 -> :sswitch_54
        0x98 -> :sswitch_54
        0x99 -> :sswitch_54
        0x9a -> :sswitch_54
        0x9c -> :sswitch_1e
        0x9d -> :sswitch_2d
        0x9e -> :sswitch_1e
        0x9f -> :sswitch_2d
        0xa0 -> :sswitch_1e
        0xa1 -> :sswitch_2d
        0xa2 -> :sswitch_1e
        0xa3 -> :sswitch_2d
        0xa4 -> :sswitch_1e
        0xa5 -> :sswitch_2d
        0xa8 -> :sswitch_1e
        0xa9 -> :sswitch_2d
        0xaa -> :sswitch_1e
        0xab -> :sswitch_2d
        0xac -> :sswitch_1e
        0xad -> :sswitch_2d
        0xae -> :sswitch_14
        0xaf -> :sswitch_25
        0xb0 -> :sswitch_49
        0xb1 -> :sswitch_4b
        0xb2 -> :sswitch_14
        0xb3 -> :sswitch_25
        0xb4 -> :sswitch_49
        0xb5 -> :sswitch_4b
        0xb6 -> :sswitch_14
        0xb7 -> :sswitch_25
        0xb8 -> :sswitch_49
        0xb9 -> :sswitch_4b
        0xba -> :sswitch_33
        0xbb -> :sswitch_33
        0xbc -> :sswitch_33
        0xbd -> :sswitch_33
        0xbe -> :sswitch_33
        0xc0 -> :sswitch_3b
        0xc1 -> :sswitch_3b
        0xc2 -> :sswitch_3b
        0xc3 -> :sswitch_3b
        0xc4 -> :sswitch_3b
        0xc001 -> :sswitch_47
        0xc002 -> :sswitch_4f
        0xc003 -> :sswitch_13
        0xc004 -> :sswitch_14
        0xc005 -> :sswitch_21
        0xc006 -> :sswitch_47
        0xc007 -> :sswitch_4f
        0xc008 -> :sswitch_13
        0xc009 -> :sswitch_14
        0xc00a -> :sswitch_21
        0xc00b -> :sswitch_47
        0xc00c -> :sswitch_4f
        0xc00d -> :sswitch_13
        0xc00e -> :sswitch_14
        0xc00f -> :sswitch_21
        0xc010 -> :sswitch_47
        0xc011 -> :sswitch_4f
        0xc012 -> :sswitch_13
        0xc013 -> :sswitch_14
        0xc014 -> :sswitch_21
        0xc016 -> :sswitch_4f
        0xc01a -> :sswitch_13
        0xc01b -> :sswitch_13
        0xc01c -> :sswitch_13
        0xc01d -> :sswitch_14
        0xc01e -> :sswitch_14
        0xc01f -> :sswitch_14
        0xc020 -> :sswitch_21
        0xc021 -> :sswitch_21
        0xc022 -> :sswitch_21
        0xc023 -> :sswitch_14
        0xc024 -> :sswitch_25
        0xc025 -> :sswitch_14
        0xc026 -> :sswitch_25
        0xc027 -> :sswitch_14
        0xc028 -> :sswitch_25
        0xc029 -> :sswitch_14
        0xc02a -> :sswitch_25
        0xc02b -> :sswitch_1e
        0xc02c -> :sswitch_2d
        0xc02d -> :sswitch_1e
        0xc02e -> :sswitch_2d
        0xc02f -> :sswitch_1e
        0xc030 -> :sswitch_2d
        0xc031 -> :sswitch_1e
        0xc032 -> :sswitch_2d
        0xc033 -> :sswitch_4f
        0xc034 -> :sswitch_13
        0xc035 -> :sswitch_14
        0xc036 -> :sswitch_21
        0xc037 -> :sswitch_14
        0xc038 -> :sswitch_25
        0xc039 -> :sswitch_47
        0xc03a -> :sswitch_49
        0xc03b -> :sswitch_4b
        0xc072 -> :sswitch_33
        0xc073 -> :sswitch_3d
        0xc074 -> :sswitch_33
        0xc075 -> :sswitch_3d
        0xc076 -> :sswitch_33
        0xc077 -> :sswitch_3d
        0xc078 -> :sswitch_33
        0xc079 -> :sswitch_3d
        0xc07a -> :sswitch_36
        0xc07b -> :sswitch_3f
        0xc07c -> :sswitch_36
        0xc07d -> :sswitch_3f
        0xc07e -> :sswitch_36
        0xc07f -> :sswitch_3f
        0xc080 -> :sswitch_36
        0xc081 -> :sswitch_3f
        0xc082 -> :sswitch_36
        0xc083 -> :sswitch_3f
        0xc086 -> :sswitch_36
        0xc087 -> :sswitch_3f
        0xc088 -> :sswitch_36
        0xc089 -> :sswitch_3f
        0xc08a -> :sswitch_36
        0xc08b -> :sswitch_3f
        0xc08c -> :sswitch_36
        0xc08d -> :sswitch_3f
        0xc08e -> :sswitch_36
        0xc08f -> :sswitch_3f
        0xc090 -> :sswitch_36
        0xc091 -> :sswitch_3f
        0xc092 -> :sswitch_36
        0xc093 -> :sswitch_3f
        0xc094 -> :sswitch_33
        0xc095 -> :sswitch_3d
        0xc096 -> :sswitch_33
        0xc097 -> :sswitch_3d
        0xc098 -> :sswitch_33
        0xc099 -> :sswitch_3d
        0xc09a -> :sswitch_33
        0xc09b -> :sswitch_3d
        0xc09c -> :sswitch_18
        0xc09d -> :sswitch_27
        0xc09e -> :sswitch_18
        0xc09f -> :sswitch_27
        0xc0a0 -> :sswitch_1b
        0xc0a1 -> :sswitch_2a
        0xc0a2 -> :sswitch_1b
        0xc0a3 -> :sswitch_2a
        0xc0a4 -> :sswitch_18
        0xc0a5 -> :sswitch_27
        0xc0a6 -> :sswitch_18
        0xc0a7 -> :sswitch_27
        0xc0a8 -> :sswitch_1b
        0xc0a9 -> :sswitch_2a
        0xc0aa -> :sswitch_1b
        0xc0ab -> :sswitch_2a
        0xc0ac -> :sswitch_18
        0xc0ad -> :sswitch_27
        0xc0ae -> :sswitch_1b
        0xc0af -> :sswitch_2a
        0xcc13 -> :sswitch_15
        0xcc14 -> :sswitch_15
        0xcc15 -> :sswitch_15
        0xe410 -> :sswitch_42
        0xe411 -> :sswitch_51
        0xe412 -> :sswitch_42
        0xe413 -> :sswitch_51
        0xe414 -> :sswitch_42
        0xe415 -> :sswitch_51
        0xe416 -> :sswitch_42
        0xe417 -> :sswitch_51
        0xe418 -> :sswitch_42
        0xe419 -> :sswitch_51
        0xe41a -> :sswitch_42
        0xe41b -> :sswitch_51
        0xe41c -> :sswitch_42
        0xe41d -> :sswitch_51
        0xe41e -> :sswitch_42
        0xe41f -> :sswitch_51
    .end sparse-switch
.end method

.method public static getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "extensionType"    # Ljava/lang/Integer;

    .prologue
    .line 760
    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    goto :goto_3
.end method

.method public static getHashAlgorithmForPRFAlgorithm(I)S
    .registers 3
    .param p0, "prfAlgorithm"    # I

    .prologue
    .line 1229
    packed-switch p0, :pswitch_data_18

    .line 1238
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown PRFAlgorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1232
    :pswitch_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "legacy PRF not a valid algorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1234
    :pswitch_13
    const/4 v0, 0x4

    .line 1236
    :goto_14
    return v0

    :pswitch_15
    const/4 v0, 0x5

    goto :goto_14

    .line 1229
    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_b
        :pswitch_13
        :pswitch_15
    .end packed-switch
.end method

.method public static getKeyExchangeAlgorithm(I)I
    .registers 3
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1742
    sparse-switch p0, :sswitch_data_38

    .line 2008
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 1758
    :sswitch_b
    const/4 v0, 0x7

    .line 2005
    :goto_c
    return v0

    .line 1774
    :sswitch_d
    const/16 v0, 0x9

    goto :goto_c

    .line 1790
    :sswitch_10
    const/4 v0, 0x3

    goto :goto_c

    .line 1813
    :sswitch_12
    const/16 v0, 0xe

    goto :goto_c

    .line 1836
    :sswitch_15
    const/4 v0, 0x5

    goto :goto_c

    .line 1851
    :sswitch_17
    const/16 v0, 0x10

    goto :goto_c

    .line 1866
    :sswitch_1a
    const/16 v0, 0x12

    goto :goto_c

    .line 1888
    :sswitch_1d
    const/16 v0, 0x11

    goto :goto_c

    .line 1903
    :sswitch_20
    const/16 v0, 0x18

    goto :goto_c

    .line 1921
    :sswitch_23
    const/16 v0, 0x13

    goto :goto_c

    .line 1944
    :sswitch_26
    const/16 v0, 0xd

    goto :goto_c

    .line 1971
    :sswitch_29
    const/4 v0, 0x1

    goto :goto_c

    .line 1990
    :sswitch_2b
    const/16 v0, 0xf

    goto :goto_c

    .line 1995
    :sswitch_2e
    const/16 v0, 0x15

    goto :goto_c

    .line 2000
    :sswitch_31
    const/16 v0, 0x16

    goto :goto_c

    .line 2005
    :sswitch_34
    const/16 v0, 0x17

    goto :goto_c

    .line 1742
    nop

    :sswitch_data_38
    .sparse-switch
        0x1 -> :sswitch_29
        0x2 -> :sswitch_29
        0x4 -> :sswitch_29
        0x5 -> :sswitch_29
        0xa -> :sswitch_29
        0xd -> :sswitch_b
        0x10 -> :sswitch_d
        0x13 -> :sswitch_10
        0x16 -> :sswitch_15
        0x2c -> :sswitch_26
        0x2d -> :sswitch_12
        0x2e -> :sswitch_2b
        0x2f -> :sswitch_29
        0x30 -> :sswitch_b
        0x31 -> :sswitch_d
        0x32 -> :sswitch_10
        0x33 -> :sswitch_15
        0x35 -> :sswitch_29
        0x36 -> :sswitch_b
        0x37 -> :sswitch_d
        0x38 -> :sswitch_10
        0x39 -> :sswitch_15
        0x3b -> :sswitch_29
        0x3c -> :sswitch_29
        0x3d -> :sswitch_29
        0x3e -> :sswitch_b
        0x3f -> :sswitch_d
        0x40 -> :sswitch_10
        0x41 -> :sswitch_29
        0x42 -> :sswitch_b
        0x43 -> :sswitch_d
        0x44 -> :sswitch_10
        0x45 -> :sswitch_15
        0x67 -> :sswitch_15
        0x68 -> :sswitch_b
        0x69 -> :sswitch_d
        0x6a -> :sswitch_10
        0x6b -> :sswitch_15
        0x84 -> :sswitch_29
        0x85 -> :sswitch_b
        0x86 -> :sswitch_d
        0x87 -> :sswitch_10
        0x88 -> :sswitch_15
        0x8a -> :sswitch_26
        0x8b -> :sswitch_26
        0x8c -> :sswitch_26
        0x8d -> :sswitch_26
        0x8e -> :sswitch_12
        0x8f -> :sswitch_12
        0x90 -> :sswitch_12
        0x91 -> :sswitch_12
        0x92 -> :sswitch_2b
        0x93 -> :sswitch_2b
        0x94 -> :sswitch_2b
        0x95 -> :sswitch_2b
        0x96 -> :sswitch_29
        0x97 -> :sswitch_b
        0x98 -> :sswitch_d
        0x99 -> :sswitch_10
        0x9a -> :sswitch_15
        0x9c -> :sswitch_29
        0x9d -> :sswitch_29
        0x9e -> :sswitch_15
        0x9f -> :sswitch_15
        0xa0 -> :sswitch_d
        0xa1 -> :sswitch_d
        0xa2 -> :sswitch_10
        0xa3 -> :sswitch_10
        0xa4 -> :sswitch_b
        0xa5 -> :sswitch_b
        0xa8 -> :sswitch_26
        0xa9 -> :sswitch_26
        0xaa -> :sswitch_12
        0xab -> :sswitch_12
        0xac -> :sswitch_2b
        0xad -> :sswitch_2b
        0xae -> :sswitch_26
        0xaf -> :sswitch_26
        0xb0 -> :sswitch_26
        0xb1 -> :sswitch_26
        0xb2 -> :sswitch_12
        0xb3 -> :sswitch_12
        0xb4 -> :sswitch_12
        0xb5 -> :sswitch_12
        0xb6 -> :sswitch_2b
        0xb7 -> :sswitch_2b
        0xb8 -> :sswitch_2b
        0xb9 -> :sswitch_2b
        0xba -> :sswitch_29
        0xbb -> :sswitch_b
        0xbc -> :sswitch_d
        0xbd -> :sswitch_10
        0xbe -> :sswitch_15
        0xc0 -> :sswitch_29
        0xc1 -> :sswitch_b
        0xc2 -> :sswitch_d
        0xc3 -> :sswitch_10
        0xc4 -> :sswitch_15
        0xc001 -> :sswitch_17
        0xc002 -> :sswitch_17
        0xc003 -> :sswitch_17
        0xc004 -> :sswitch_17
        0xc005 -> :sswitch_17
        0xc006 -> :sswitch_1d
        0xc007 -> :sswitch_1d
        0xc008 -> :sswitch_1d
        0xc009 -> :sswitch_1d
        0xc00a -> :sswitch_1d
        0xc00b -> :sswitch_1a
        0xc00c -> :sswitch_1a
        0xc00d -> :sswitch_1a
        0xc00e -> :sswitch_1a
        0xc00f -> :sswitch_1a
        0xc010 -> :sswitch_23
        0xc011 -> :sswitch_23
        0xc012 -> :sswitch_23
        0xc013 -> :sswitch_23
        0xc014 -> :sswitch_23
        0xc01a -> :sswitch_2e
        0xc01b -> :sswitch_34
        0xc01c -> :sswitch_31
        0xc01d -> :sswitch_2e
        0xc01e -> :sswitch_34
        0xc01f -> :sswitch_31
        0xc020 -> :sswitch_2e
        0xc021 -> :sswitch_34
        0xc022 -> :sswitch_31
        0xc023 -> :sswitch_1d
        0xc024 -> :sswitch_1d
        0xc025 -> :sswitch_17
        0xc026 -> :sswitch_17
        0xc027 -> :sswitch_23
        0xc028 -> :sswitch_23
        0xc029 -> :sswitch_1a
        0xc02a -> :sswitch_1a
        0xc02b -> :sswitch_1d
        0xc02c -> :sswitch_1d
        0xc02d -> :sswitch_17
        0xc02e -> :sswitch_17
        0xc02f -> :sswitch_23
        0xc030 -> :sswitch_23
        0xc031 -> :sswitch_1a
        0xc032 -> :sswitch_1a
        0xc033 -> :sswitch_20
        0xc034 -> :sswitch_20
        0xc035 -> :sswitch_20
        0xc036 -> :sswitch_20
        0xc037 -> :sswitch_20
        0xc038 -> :sswitch_20
        0xc039 -> :sswitch_20
        0xc03a -> :sswitch_20
        0xc03b -> :sswitch_20
        0xc072 -> :sswitch_1d
        0xc073 -> :sswitch_1d
        0xc074 -> :sswitch_17
        0xc075 -> :sswitch_17
        0xc076 -> :sswitch_23
        0xc077 -> :sswitch_23
        0xc078 -> :sswitch_1a
        0xc079 -> :sswitch_1a
        0xc07a -> :sswitch_29
        0xc07b -> :sswitch_29
        0xc07c -> :sswitch_15
        0xc07d -> :sswitch_15
        0xc07e -> :sswitch_d
        0xc07f -> :sswitch_d
        0xc080 -> :sswitch_10
        0xc081 -> :sswitch_10
        0xc082 -> :sswitch_b
        0xc083 -> :sswitch_b
        0xc086 -> :sswitch_1d
        0xc087 -> :sswitch_1d
        0xc088 -> :sswitch_17
        0xc089 -> :sswitch_17
        0xc08a -> :sswitch_23
        0xc08b -> :sswitch_23
        0xc08c -> :sswitch_1a
        0xc08d -> :sswitch_1a
        0xc08e -> :sswitch_26
        0xc08f -> :sswitch_26
        0xc090 -> :sswitch_12
        0xc091 -> :sswitch_12
        0xc092 -> :sswitch_2b
        0xc093 -> :sswitch_2b
        0xc094 -> :sswitch_26
        0xc095 -> :sswitch_26
        0xc096 -> :sswitch_12
        0xc097 -> :sswitch_12
        0xc098 -> :sswitch_2b
        0xc099 -> :sswitch_2b
        0xc09a -> :sswitch_20
        0xc09b -> :sswitch_20
        0xc09c -> :sswitch_29
        0xc09d -> :sswitch_29
        0xc09e -> :sswitch_15
        0xc09f -> :sswitch_15
        0xc0a0 -> :sswitch_29
        0xc0a1 -> :sswitch_29
        0xc0a2 -> :sswitch_15
        0xc0a3 -> :sswitch_15
        0xc0a4 -> :sswitch_26
        0xc0a5 -> :sswitch_26
        0xc0a6 -> :sswitch_12
        0xc0a7 -> :sswitch_12
        0xc0a8 -> :sswitch_26
        0xc0a9 -> :sswitch_26
        0xc0aa -> :sswitch_12
        0xc0ab -> :sswitch_12
        0xc0ac -> :sswitch_1d
        0xc0ad -> :sswitch_1d
        0xc0ae -> :sswitch_1d
        0xc0af -> :sswitch_1d
        0xcc13 -> :sswitch_23
        0xcc14 -> :sswitch_1d
        0xcc15 -> :sswitch_15
        0xe410 -> :sswitch_29
        0xe411 -> :sswitch_29
        0xe412 -> :sswitch_23
        0xe413 -> :sswitch_23
        0xe414 -> :sswitch_1d
        0xe415 -> :sswitch_1d
        0xe416 -> :sswitch_26
        0xe417 -> :sswitch_26
        0xe418 -> :sswitch_20
        0xe419 -> :sswitch_20
        0xe41a -> :sswitch_2b
        0xe41b -> :sswitch_2b
        0xe41c -> :sswitch_12
        0xe41d -> :sswitch_12
        0xe41e -> :sswitch_15
        0xe41f -> :sswitch_15
    .end sparse-switch
.end method

.method public static getMACAlgorithm(I)I
    .registers 3
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2014
    sparse-switch p0, :sswitch_data_16

    .line 2258
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v1, 0x50

    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v0

    .line 2087
    :sswitch_b
    const/4 v0, 0x0

    .line 2255
    :goto_c
    return v0

    .line 2091
    :sswitch_d
    const/4 v0, 0x1

    goto :goto_c

    .line 2190
    :sswitch_f
    const/4 v0, 0x2

    goto :goto_c

    .line 2233
    :sswitch_11
    const/4 v0, 0x3

    goto :goto_c

    .line 2255
    :sswitch_13
    const/4 v0, 0x4

    goto :goto_c

    .line 2014
    nop

    :sswitch_data_16
    .sparse-switch
        0x1 -> :sswitch_d
        0x2 -> :sswitch_f
        0x4 -> :sswitch_d
        0x5 -> :sswitch_f
        0xa -> :sswitch_f
        0xd -> :sswitch_f
        0x10 -> :sswitch_f
        0x13 -> :sswitch_f
        0x16 -> :sswitch_f
        0x2c -> :sswitch_f
        0x2d -> :sswitch_f
        0x2e -> :sswitch_f
        0x2f -> :sswitch_f
        0x30 -> :sswitch_f
        0x31 -> :sswitch_f
        0x32 -> :sswitch_f
        0x33 -> :sswitch_f
        0x35 -> :sswitch_f
        0x36 -> :sswitch_f
        0x37 -> :sswitch_f
        0x38 -> :sswitch_f
        0x39 -> :sswitch_f
        0x3b -> :sswitch_11
        0x3c -> :sswitch_11
        0x3d -> :sswitch_11
        0x3e -> :sswitch_11
        0x3f -> :sswitch_11
        0x40 -> :sswitch_11
        0x41 -> :sswitch_f
        0x42 -> :sswitch_f
        0x43 -> :sswitch_f
        0x44 -> :sswitch_f
        0x45 -> :sswitch_f
        0x67 -> :sswitch_11
        0x68 -> :sswitch_11
        0x69 -> :sswitch_11
        0x6a -> :sswitch_11
        0x6b -> :sswitch_11
        0x84 -> :sswitch_f
        0x85 -> :sswitch_f
        0x86 -> :sswitch_f
        0x87 -> :sswitch_f
        0x88 -> :sswitch_f
        0x8a -> :sswitch_f
        0x8b -> :sswitch_f
        0x8c -> :sswitch_f
        0x8d -> :sswitch_f
        0x8e -> :sswitch_f
        0x8f -> :sswitch_f
        0x90 -> :sswitch_f
        0x91 -> :sswitch_f
        0x92 -> :sswitch_f
        0x93 -> :sswitch_f
        0x94 -> :sswitch_f
        0x95 -> :sswitch_f
        0x96 -> :sswitch_f
        0x97 -> :sswitch_f
        0x98 -> :sswitch_f
        0x99 -> :sswitch_f
        0x9a -> :sswitch_f
        0x9c -> :sswitch_b
        0x9d -> :sswitch_b
        0x9e -> :sswitch_b
        0x9f -> :sswitch_b
        0xa0 -> :sswitch_b
        0xa1 -> :sswitch_b
        0xa2 -> :sswitch_b
        0xa3 -> :sswitch_b
        0xa4 -> :sswitch_b
        0xa5 -> :sswitch_b
        0xa8 -> :sswitch_b
        0xa9 -> :sswitch_b
        0xaa -> :sswitch_b
        0xab -> :sswitch_b
        0xac -> :sswitch_b
        0xad -> :sswitch_b
        0xae -> :sswitch_11
        0xaf -> :sswitch_13
        0xb0 -> :sswitch_11
        0xb1 -> :sswitch_13
        0xb2 -> :sswitch_11
        0xb3 -> :sswitch_13
        0xb4 -> :sswitch_11
        0xb5 -> :sswitch_13
        0xb6 -> :sswitch_11
        0xb7 -> :sswitch_13
        0xb8 -> :sswitch_11
        0xb9 -> :sswitch_13
        0xba -> :sswitch_11
        0xbb -> :sswitch_11
        0xbc -> :sswitch_11
        0xbd -> :sswitch_11
        0xbe -> :sswitch_11
        0xc0 -> :sswitch_11
        0xc1 -> :sswitch_11
        0xc2 -> :sswitch_11
        0xc3 -> :sswitch_11
        0xc4 -> :sswitch_11
        0xc001 -> :sswitch_f
        0xc002 -> :sswitch_f
        0xc003 -> :sswitch_f
        0xc004 -> :sswitch_f
        0xc005 -> :sswitch_f
        0xc006 -> :sswitch_f
        0xc007 -> :sswitch_f
        0xc008 -> :sswitch_f
        0xc009 -> :sswitch_f
        0xc00a -> :sswitch_f
        0xc00b -> :sswitch_f
        0xc00c -> :sswitch_f
        0xc00d -> :sswitch_f
        0xc00e -> :sswitch_f
        0xc00f -> :sswitch_f
        0xc010 -> :sswitch_f
        0xc011 -> :sswitch_f
        0xc012 -> :sswitch_f
        0xc013 -> :sswitch_f
        0xc014 -> :sswitch_f
        0xc01a -> :sswitch_f
        0xc01b -> :sswitch_f
        0xc01c -> :sswitch_f
        0xc01d -> :sswitch_f
        0xc01e -> :sswitch_f
        0xc01f -> :sswitch_f
        0xc020 -> :sswitch_f
        0xc021 -> :sswitch_f
        0xc022 -> :sswitch_f
        0xc023 -> :sswitch_11
        0xc024 -> :sswitch_13
        0xc025 -> :sswitch_11
        0xc026 -> :sswitch_13
        0xc027 -> :sswitch_11
        0xc028 -> :sswitch_13
        0xc029 -> :sswitch_11
        0xc02a -> :sswitch_13
        0xc02b -> :sswitch_b
        0xc02c -> :sswitch_b
        0xc02d -> :sswitch_b
        0xc02e -> :sswitch_b
        0xc02f -> :sswitch_b
        0xc030 -> :sswitch_b
        0xc031 -> :sswitch_b
        0xc032 -> :sswitch_b
        0xc033 -> :sswitch_f
        0xc034 -> :sswitch_f
        0xc035 -> :sswitch_f
        0xc036 -> :sswitch_f
        0xc037 -> :sswitch_11
        0xc038 -> :sswitch_13
        0xc039 -> :sswitch_f
        0xc03a -> :sswitch_11
        0xc03b -> :sswitch_13
        0xc072 -> :sswitch_11
        0xc073 -> :sswitch_13
        0xc074 -> :sswitch_11
        0xc075 -> :sswitch_13
        0xc076 -> :sswitch_11
        0xc077 -> :sswitch_13
        0xc078 -> :sswitch_11
        0xc079 -> :sswitch_13
        0xc07a -> :sswitch_b
        0xc07b -> :sswitch_b
        0xc07c -> :sswitch_b
        0xc07d -> :sswitch_b
        0xc07e -> :sswitch_b
        0xc07f -> :sswitch_b
        0xc080 -> :sswitch_b
        0xc081 -> :sswitch_b
        0xc082 -> :sswitch_b
        0xc083 -> :sswitch_b
        0xc086 -> :sswitch_b
        0xc087 -> :sswitch_b
        0xc088 -> :sswitch_b
        0xc089 -> :sswitch_b
        0xc08a -> :sswitch_b
        0xc08b -> :sswitch_b
        0xc08c -> :sswitch_b
        0xc08d -> :sswitch_b
        0xc08e -> :sswitch_b
        0xc08f -> :sswitch_b
        0xc090 -> :sswitch_b
        0xc091 -> :sswitch_b
        0xc092 -> :sswitch_b
        0xc093 -> :sswitch_b
        0xc094 -> :sswitch_11
        0xc095 -> :sswitch_13
        0xc096 -> :sswitch_11
        0xc097 -> :sswitch_13
        0xc098 -> :sswitch_11
        0xc099 -> :sswitch_13
        0xc09a -> :sswitch_11
        0xc09b -> :sswitch_13
        0xc09c -> :sswitch_b
        0xc09d -> :sswitch_b
        0xc09e -> :sswitch_b
        0xc09f -> :sswitch_b
        0xc0a0 -> :sswitch_b
        0xc0a1 -> :sswitch_b
        0xc0a2 -> :sswitch_b
        0xc0a3 -> :sswitch_b
        0xc0a4 -> :sswitch_b
        0xc0a5 -> :sswitch_b
        0xc0a6 -> :sswitch_b
        0xc0a7 -> :sswitch_b
        0xc0a8 -> :sswitch_b
        0xc0a9 -> :sswitch_b
        0xc0aa -> :sswitch_b
        0xc0ab -> :sswitch_b
        0xc0ac -> :sswitch_b
        0xc0ad -> :sswitch_b
        0xc0ae -> :sswitch_b
        0xc0af -> :sswitch_b
        0xcc13 -> :sswitch_b
        0xcc14 -> :sswitch_b
        0xcc15 -> :sswitch_b
        0xe410 -> :sswitch_f
        0xe411 -> :sswitch_f
        0xe412 -> :sswitch_f
        0xe413 -> :sswitch_f
        0xe414 -> :sswitch_f
        0xe415 -> :sswitch_f
        0xe416 -> :sswitch_f
        0xe417 -> :sswitch_f
        0xe418 -> :sswitch_f
        0xe419 -> :sswitch_f
        0xe41a -> :sswitch_f
        0xe41b -> :sswitch_f
        0xe41c -> :sswitch_f
        0xe41d -> :sswitch_f
        0xe41e -> :sswitch_f
        0xe41f -> :sswitch_f
    .end sparse-switch
.end method

.method public static getMinimumVersion(I)Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 2
    .param p0, "ciphersuite"    # I

    .prologue
    .line 2264
    sparse-switch p0, :sswitch_data_a

    .line 2381
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->SSLv3:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    :goto_5
    return-object v0

    .line 2378
    :sswitch_6
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    goto :goto_5

    .line 2264
    nop

    :sswitch_data_a
    .sparse-switch
        0x3b -> :sswitch_6
        0x3c -> :sswitch_6
        0x3d -> :sswitch_6
        0x3e -> :sswitch_6
        0x3f -> :sswitch_6
        0x40 -> :sswitch_6
        0x67 -> :sswitch_6
        0x68 -> :sswitch_6
        0x69 -> :sswitch_6
        0x6a -> :sswitch_6
        0x6b -> :sswitch_6
        0x9c -> :sswitch_6
        0x9d -> :sswitch_6
        0x9e -> :sswitch_6
        0x9f -> :sswitch_6
        0xa0 -> :sswitch_6
        0xa1 -> :sswitch_6
        0xa2 -> :sswitch_6
        0xa3 -> :sswitch_6
        0xa4 -> :sswitch_6
        0xa5 -> :sswitch_6
        0xa8 -> :sswitch_6
        0xa9 -> :sswitch_6
        0xaa -> :sswitch_6
        0xab -> :sswitch_6
        0xac -> :sswitch_6
        0xad -> :sswitch_6
        0xba -> :sswitch_6
        0xbb -> :sswitch_6
        0xbc -> :sswitch_6
        0xbd -> :sswitch_6
        0xbe -> :sswitch_6
        0xbf -> :sswitch_6
        0xc0 -> :sswitch_6
        0xc1 -> :sswitch_6
        0xc2 -> :sswitch_6
        0xc3 -> :sswitch_6
        0xc4 -> :sswitch_6
        0xc5 -> :sswitch_6
        0xc023 -> :sswitch_6
        0xc024 -> :sswitch_6
        0xc025 -> :sswitch_6
        0xc026 -> :sswitch_6
        0xc027 -> :sswitch_6
        0xc028 -> :sswitch_6
        0xc029 -> :sswitch_6
        0xc02a -> :sswitch_6
        0xc02b -> :sswitch_6
        0xc02c -> :sswitch_6
        0xc02d -> :sswitch_6
        0xc02e -> :sswitch_6
        0xc02f -> :sswitch_6
        0xc030 -> :sswitch_6
        0xc031 -> :sswitch_6
        0xc032 -> :sswitch_6
        0xc072 -> :sswitch_6
        0xc073 -> :sswitch_6
        0xc074 -> :sswitch_6
        0xc075 -> :sswitch_6
        0xc076 -> :sswitch_6
        0xc077 -> :sswitch_6
        0xc078 -> :sswitch_6
        0xc079 -> :sswitch_6
        0xc07a -> :sswitch_6
        0xc07b -> :sswitch_6
        0xc07c -> :sswitch_6
        0xc07d -> :sswitch_6
        0xc07e -> :sswitch_6
        0xc07f -> :sswitch_6
        0xc080 -> :sswitch_6
        0xc081 -> :sswitch_6
        0xc082 -> :sswitch_6
        0xc083 -> :sswitch_6
        0xc084 -> :sswitch_6
        0xc085 -> :sswitch_6
        0xc086 -> :sswitch_6
        0xc087 -> :sswitch_6
        0xc088 -> :sswitch_6
        0xc089 -> :sswitch_6
        0xc08a -> :sswitch_6
        0xc08b -> :sswitch_6
        0xc08c -> :sswitch_6
        0xc08d -> :sswitch_6
        0xc08e -> :sswitch_6
        0xc08f -> :sswitch_6
        0xc090 -> :sswitch_6
        0xc091 -> :sswitch_6
        0xc092 -> :sswitch_6
        0xc093 -> :sswitch_6
        0xc09c -> :sswitch_6
        0xc09d -> :sswitch_6
        0xc09e -> :sswitch_6
        0xc09f -> :sswitch_6
        0xc0a0 -> :sswitch_6
        0xc0a1 -> :sswitch_6
        0xc0a2 -> :sswitch_6
        0xc0a3 -> :sswitch_6
        0xc0a4 -> :sswitch_6
        0xc0a5 -> :sswitch_6
        0xc0a6 -> :sswitch_6
        0xc0a7 -> :sswitch_6
        0xc0a8 -> :sswitch_6
        0xc0a9 -> :sswitch_6
        0xc0aa -> :sswitch_6
        0xc0ab -> :sswitch_6
        0xc0ac -> :sswitch_6
        0xc0ad -> :sswitch_6
        0xc0ae -> :sswitch_6
        0xc0af -> :sswitch_6
        0xcc13 -> :sswitch_6
        0xcc14 -> :sswitch_6
        0xcc15 -> :sswitch_6
    .end sparse-switch
.end method

.method public static getOIDForHashAlgorithm(S)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .registers 3
    .param p0, "hashAlgorithm"    # S

    .prologue
    .line 1244
    packed-switch p0, :pswitch_data_1e

    .line 1259
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "unknown HashAlgorithm"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1247
    :pswitch_b
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->md5:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 1257
    :goto_d
    return-object v0

    .line 1249
    :pswitch_e
    sget-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_SHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_d

    .line 1251
    :pswitch_11
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_d

    .line 1253
    :pswitch_14
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_d

    .line 1255
    :pswitch_17
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_d

    .line 1257
    :pswitch_1a
    sget-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    goto :goto_d

    .line 1244
    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
    .end packed-switch
.end method

.method public static getSignatureAlgorithmsExtension(Ljava/util/Hashtable;)Ljava/util/Vector;
    .registers 3
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 811
    sget-object v1, Lorg/spongycastle/crypto/tls/TlsUtils;->EXT_signature_algorithms:Ljava/lang/Integer;

    invoke-static {p0, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 812
    .local v0, "extensionData":[B
    if-nez v0, :cond_a

    const/4 v1, 0x0

    :goto_9
    return-object v1

    :cond_a
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readSignatureAlgorithmsExtension([B)Ljava/util/Vector;

    move-result-object v1

    goto :goto_9
.end method

.method public static getSignatureAndHashAlgorithm(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/tls/TlsSignerCredentials;)Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .registers 5
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;
    .param p1, "signerCredentials"    # Lorg/spongycastle/crypto/tls/TlsSignerCredentials;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 746
    const/4 v0, 0x0

    .line 747
    .local v0, "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 749
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsSignerCredentials;->getSignatureAndHashAlgorithm()Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v0

    .line 750
    if-nez v0, :cond_15

    .line 752
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v2, 0x50

    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 755
    :cond_15
    return-object v0
.end method

.method public static hasExpectedEmptyExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;S)Z
    .registers 5
    .param p0, "extensions"    # Ljava/util/Hashtable;
    .param p1, "extensionType"    # Ljava/lang/Integer;
    .param p2, "alertDescription"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 766
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->getExtensionData(Ljava/util/Hashtable;Ljava/lang/Integer;)[B

    move-result-object v0

    .line 767
    .local v0, "extension_data":[B
    if-nez v0, :cond_8

    .line 769
    const/4 v1, 0x0

    .line 775
    :goto_7
    return v1

    .line 771
    :cond_8
    array-length v1, v0

    if-eqz v1, :cond_11

    .line 773
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v1, p2}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v1

    .line 775
    :cond_11
    const/4 v1, 0x1

    goto :goto_7
.end method

.method public static hasSigningCapability(S)Z
    .registers 2
    .param p0, "clientCertificateType"    # S

    .prologue
    .line 1350
    sparse-switch p0, :sswitch_data_8

    .line 1357
    const/4 v0, 0x0

    :goto_4
    return v0

    .line 1355
    :sswitch_5
    const/4 v0, 0x1

    goto :goto_4

    .line 1350
    nop

    :sswitch_data_8
    .sparse-switch
        0x1 -> :sswitch_5
        0x2 -> :sswitch_5
        0x40 -> :sswitch_5
    .end sparse-switch
.end method

.method static hmac_hash(Lorg/spongycastle/crypto/Digest;[B[B[B)V
    .registers 15
    .param p0, "digest"    # Lorg/spongycastle/crypto/Digest;
    .param p1, "secret"    # [B
    .param p2, "seed"    # [B
    .param p3, "out"    # [B

    .prologue
    const/4 v10, 0x0

    .line 1006
    new-instance v5, Lorg/spongycastle/crypto/macs/HMac;

    invoke-direct {v5, p0}, Lorg/spongycastle/crypto/macs/HMac;-><init>(Lorg/spongycastle/crypto/Digest;)V

    .line 1007
    .local v5, "mac":Lorg/spongycastle/crypto/macs/HMac;
    new-instance v7, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-direct {v7, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    invoke-virtual {v5, v7}, Lorg/spongycastle/crypto/macs/HMac;->init(Lorg/spongycastle/crypto/CipherParameters;)V

    .line 1008
    move-object v0, p2

    .line 1009
    .local v0, "a":[B
    invoke-interface {p0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v6

    .line 1010
    .local v6, "size":I
    array-length v7, p3

    add-int/2addr v7, v6

    add-int/lit8 v7, v7, -0x1

    div-int v4, v7, v6

    .line 1011
    .local v4, "iterations":I
    invoke-virtual {v5}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v7

    new-array v1, v7, [B

    .line 1012
    .local v1, "buf":[B
    invoke-virtual {v5}, Lorg/spongycastle/crypto/macs/HMac;->getMacSize()I

    move-result v7

    new-array v2, v7, [B

    .line 1013
    .local v2, "buf2":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_26
    if-ge v3, v4, :cond_4b

    .line 1015
    array-length v7, v0

    invoke-virtual {v5, v0, v10, v7}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 1016
    invoke-virtual {v5, v1, v10}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 1017
    move-object v0, v1

    .line 1018
    array-length v7, v0

    invoke-virtual {v5, v0, v10, v7}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 1019
    array-length v7, p2

    invoke-virtual {v5, p2, v10, v7}, Lorg/spongycastle/crypto/macs/HMac;->update([BII)V

    .line 1020
    invoke-virtual {v5, v2, v10}, Lorg/spongycastle/crypto/macs/HMac;->doFinal([BI)I

    .line 1021
    mul-int v7, v6, v3

    array-length v8, p3

    mul-int v9, v6, v3

    sub-int/2addr v8, v9

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v2, v10, p3, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1013
    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    .line 1023
    :cond_4b
    return-void
.end method

.method public static importSession([BLorg/spongycastle/crypto/tls/SessionParameters;)Lorg/spongycastle/crypto/tls/TlsSession;
    .registers 3
    .param p0, "sessionID"    # [B
    .param p1, "sessionParameters"    # Lorg/spongycastle/crypto/tls/SessionParameters;

    .prologue
    .line 780
    new-instance v0, Lorg/spongycastle/crypto/tls/TlsSessionImpl;

    invoke-direct {v0, p0, p1}, Lorg/spongycastle/crypto/tls/TlsSessionImpl;-><init>([BLorg/spongycastle/crypto/tls/SessionParameters;)V

    return-object v0
.end method

.method public static isAEADCipherSuite(I)Z
    .registers 3
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2387
    const/4 v0, 0x2

    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getCipherType(I)I

    move-result v1

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static isBlockCipherSuite(I)Z
    .registers 3
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 2392
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getCipherType(I)I

    move-result v1

    if-ne v0, v1, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z
    .registers 2
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 185
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isSSL()Z

    move-result v0

    return v0
.end method

.method public static isSignatureAlgorithmsExtensionAllowed(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 3
    .param p0, "clientVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 785
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getEquivalentTLSVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isStreamCipherSuite(I)Z
    .registers 2
    .param p0, "ciphersuite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2397
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getCipherType(I)I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isTLSv11(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 3
    .param p0, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 190
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv11:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getEquivalentTLSVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isTLSv11(Lorg/spongycastle/crypto/tls/TlsContext;)Z
    .registers 2
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 195
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv11(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isTLSv12(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 3
    .param p0, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 200
    sget-object v0, Lorg/spongycastle/crypto/tls/ProtocolVersion;->TLSv12:Lorg/spongycastle/crypto/tls/ProtocolVersion;

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getEquivalentTLSVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isTLSv12(Lorg/spongycastle/crypto/tls/TlsContext;)Z
    .registers 2
    .param p0, "context"    # Lorg/spongycastle/crypto/tls/TlsContext;

    .prologue
    .line 205
    invoke-interface {p0}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv12(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isValidCipherSuiteForVersion(ILorg/spongycastle/crypto/tls/ProtocolVersion;)Z
    .registers 4
    .param p0, "cipherSuite"    # I
    .param p1, "serverVersion"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .prologue
    .line 2402
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->getMinimumVersion(I)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getEquivalentTLSVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isEqualOrEarlierVersionOf(Lorg/spongycastle/crypto/tls/ProtocolVersion;)Z

    move-result v0

    return v0
.end method

.method public static isValidUint16(I)Z
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 150
    const v0, 0xffff

    and-int/2addr v0, p0

    if-ne v0, p0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isValidUint16(J)Z
    .registers 4
    .param p0, "i"    # J

    .prologue
    .line 155
    const-wide/32 v0, 0xffff

    and-long/2addr v0, p0

    cmp-long v0, v0, p0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isValidUint24(I)Z
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 160
    const v0, 0xffffff

    and-int/2addr v0, p0

    if-ne v0, p0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isValidUint24(J)Z
    .registers 4
    .param p0, "i"    # J

    .prologue
    .line 165
    const-wide/32 v0, 0xffffff

    and-long/2addr v0, p0

    cmp-long v0, v0, p0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public static isValidUint32(J)Z
    .registers 4
    .param p0, "i"    # J

    .prologue
    .line 170
    const-wide v0, 0xffffffffL

    and-long/2addr v0, p0

    cmp-long v0, v0, p0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static isValidUint48(J)Z
    .registers 4
    .param p0, "i"    # J

    .prologue
    .line 175
    const-wide v0, 0xffffffffffffL

    and-long/2addr v0, p0

    cmp-long v0, v0, p0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static isValidUint64(J)Z
    .registers 3
    .param p0, "i"    # J

    .prologue
    .line 180
    const/4 v0, 0x1

    return v0
.end method

.method public static isValidUint8(I)Z
    .registers 2
    .param p0, "i"    # I

    .prologue
    .line 140
    and-int/lit16 v0, p0, 0xff

    if-ne v0, p0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isValidUint8(J)Z
    .registers 4
    .param p0, "i"    # J

    .prologue
    .line 145
    const-wide/16 v0, 0xff

    and-long/2addr v0, p0

    cmp-long v0, v0, p0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static isValidUint8(S)Z
    .registers 2
    .param p0, "i"    # S

    .prologue
    .line 135
    and-int/lit16 v0, p0, 0xff

    if-ne v0, p0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static parseSupportedSignatureAlgorithms(ZLjava/io/InputStream;)Ljava/util/Vector;
    .registers 9
    .param p0, "allowAnonymous"    # Z
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 892
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v3

    .line 893
    .local v3, "length":I
    const/4 v5, 0x2

    if-lt v3, v5, :cond_b

    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_13

    .line 895
    :cond_b
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v6, 0x32

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 897
    :cond_13
    div-int/lit8 v0, v3, 0x2

    .line 898
    .local v0, "count":I
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4, v0}, Ljava/util/Vector;-><init>(I)V

    .line 899
    .local v4, "supportedSignatureAlgorithms":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    if-ge v2, v0, :cond_37

    .line 901
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    move-result-object v1

    .line 902
    .local v1, "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    if-nez p0, :cond_31

    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v5

    if-nez v5, :cond_31

    .line 908
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v6, 0x2f

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 910
    :cond_31
    invoke-virtual {v4, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 899
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 912
    .end local v1    # "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :cond_37
    return-object v4
.end method

.method public static readASN1Object([B)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5
    .param p0, "encoding"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x32

    .line 659
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 660
    .local v0, "asn1":Lorg/spongycastle/asn1/ASN1InputStream;
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 661
    .local v1, "result":Lorg/spongycastle/asn1/ASN1Primitive;
    if-nez v1, :cond_13

    .line 663
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 665
    :cond_13
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v2

    if-eqz v2, :cond_1f

    .line 667
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 669
    :cond_1f
    return-object v1
.end method

.method public static readAllOrNothing(ILjava/io/InputStream;)[B
    .registers 5
    .param p0, "length"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 536
    const/4 v2, 0x1

    if-ge p0, v2, :cond_6

    .line 538
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 550
    :cond_5
    :goto_5
    return-object v0

    .line 540
    :cond_6
    new-array v0, p0, [B

    .line 541
    .local v0, "buf":[B
    invoke-static {p1, v0}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    move-result v1

    .line 542
    .local v1, "read":I
    if-nez v1, :cond_10

    .line 544
    const/4 v0, 0x0

    goto :goto_5

    .line 546
    :cond_10
    if-eq v1, p0, :cond_5

    .line 548
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2
.end method

.method public static readDERObject([B)Lorg/spongycastle/asn1/ASN1Primitive;
    .registers 5
    .param p0, "encoding"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 678
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readASN1Object([B)Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object v1

    .line 679
    .local v1, "result":Lorg/spongycastle/asn1/ASN1Primitive;
    const-string v2, "DER"

    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->getEncoded(Ljava/lang/String;)[B

    move-result-object v0

    .line 680
    .local v0, "check":[B
    invoke-static {v0, p0}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    move-result v2

    if-nez v2, :cond_18

    .line 682
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x32

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2

    .line 684
    :cond_18
    return-object v1
.end method

.method public static readFully([BLjava/io/InputStream;)V
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 571
    array-length v0, p0

    .line 572
    .local v0, "length":I
    if-lez v0, :cond_f

    invoke-static {p1, p0}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    move-result v1

    if-eq v0, v1, :cond_f

    .line 574
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 576
    :cond_f
    return-void
.end method

.method public static readFully(ILjava/io/InputStream;)[B
    .registers 4
    .param p0, "length"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 556
    const/4 v1, 0x1

    if-ge p0, v1, :cond_6

    .line 558
    sget-object v0, Lorg/spongycastle/crypto/tls/TlsUtils;->EMPTY_BYTES:[B

    .line 565
    :cond_5
    return-object v0

    .line 560
    :cond_6
    new-array v0, p0, [B

    .line 561
    .local v0, "buf":[B
    invoke-static {p1, v0}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    move-result v1

    if-eq p0, v1, :cond_5

    .line 563
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method public static readOpaque16(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 588
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v0

    .line 589
    .local v0, "length":I
    invoke-static {v0, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    return-object v1
.end method

.method public static readOpaque24(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 595
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24(Ljava/io/InputStream;)I

    move-result v0

    .line 596
    .local v0, "length":I
    invoke-static {v0, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    return-object v1
.end method

.method public static readOpaque8(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 581
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v0

    .line 582
    .local v0, "length":S
    invoke-static {v0, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    return-object v1
.end method

.method public static readSignatureAlgorithmsExtension([B)Ljava/util/Vector;
    .registers 5
    .param p0, "extensionData"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 843
    if-nez p0, :cond_a

    .line 845
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'extensionData\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 848
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 851
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    invoke-static {v2, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->parseSupportedSignatureAlgorithms(ZLjava/io/InputStream;)Ljava/util/Vector;

    move-result-object v1

    .line 853
    .local v1, "supported_signature_algorithms":Ljava/util/Vector;
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsProtocol;->assertEmpty(Ljava/io/ByteArrayInputStream;)V

    .line 855
    return-object v1
.end method

.method public static readUint16(Ljava/io/InputStream;)I
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 459
    .local v0, "i1":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 460
    .local v1, "i2":I
    if-gez v1, :cond_10

    .line 462
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 464
    :cond_10
    shl-int/lit8 v2, v0, 0x8

    or-int/2addr v2, v1

    return v2
.end method

.method public static readUint16([BI)I
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 469
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v0, v1, 0x8

    .line 470
    .local v0, "n":I
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 471
    return v0
.end method

.method public static readUint16Array(ILjava/io/InputStream;)[I
    .registers 5
    .param p0, "count"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 613
    new-array v1, p0, [I

    .line 614
    .local v1, "uints":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p0, :cond_e

    .line 616
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v2

    aput v2, v1, v0

    .line 614
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 618
    :cond_e
    return-object v1
.end method

.method public static readUint24(Ljava/io/InputStream;)I
    .registers 6
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 477
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 478
    .local v0, "i1":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 479
    .local v1, "i2":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 480
    .local v2, "i3":I
    if-gez v2, :cond_14

    .line 482
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 484
    :cond_14
    shl-int/lit8 v3, v0, 0x10

    shl-int/lit8 v4, v1, 0x8

    or-int/2addr v3, v4

    or-int/2addr v3, v2

    return v3
.end method

.method public static readUint24([BI)I
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 489
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v0, v1, 0x10

    .line 490
    .local v0, "n":I
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 491
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 492
    return v0
.end method

.method public static readUint32(Ljava/io/InputStream;)J
    .registers 9
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 498
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 499
    .local v0, "i1":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 500
    .local v1, "i2":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 501
    .local v2, "i3":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 502
    .local v3, "i4":I
    if-gez v3, :cond_18

    .line 504
    new-instance v4, Ljava/io/EOFException;

    invoke-direct {v4}, Ljava/io/EOFException;-><init>()V

    throw v4

    .line 506
    :cond_18
    shl-int/lit8 v4, v0, 0x2

    shl-int/lit8 v5, v1, 0x10

    or-int/2addr v4, v5

    shl-int/lit8 v5, v2, 0x8

    or-int/2addr v4, v5

    or-int/2addr v4, v3

    int-to-long v4, v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    return-wide v4
.end method

.method public static readUint32([BI)J
    .registers 7
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 511
    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v0, v1, 0x18

    .line 512
    .local v0, "n":I
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 513
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 514
    add-int/lit8 p1, p1, 0x1

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 515
    int-to-long v1, v0

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    return-wide v1
.end method

.method public static readUint48(Ljava/io/InputStream;)J
    .registers 9
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide v6, 0xffffffffL

    .line 521
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24(Ljava/io/InputStream;)I

    move-result v0

    .line 522
    .local v0, "hi":I
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24(Ljava/io/InputStream;)I

    move-result v1

    .line 523
    .local v1, "lo":I
    int-to-long v2, v0

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    int-to-long v4, v1

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method public static readUint48([BI)J
    .registers 10
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    const-wide v6, 0xffffffffL

    .line 528
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    move-result v0

    .line 529
    .local v0, "hi":I
    add-int/lit8 v2, p1, 0x3

    invoke-static {p0, v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint24([BI)I

    move-result v1

    .line 530
    .local v1, "lo":I
    int-to-long v2, v0

    and-long/2addr v2, v6

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    int-to-long v4, v1

    and-long/2addr v4, v6

    or-long/2addr v2, v4

    return-wide v2
.end method

.method public static readUint8(Ljava/io/InputStream;)S
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 442
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 443
    .local v0, "i":I
    if-gez v0, :cond_c

    .line 445
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 447
    :cond_c
    int-to-short v1, v0

    return v1
.end method

.method public static readUint8([BI)S
    .registers 3
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 452
    aget-byte v0, p0, p1

    int-to-short v0, v0

    return v0
.end method

.method public static readUint8Array(ILjava/io/InputStream;)[S
    .registers 5
    .param p0, "count"    # I
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 602
    new-array v1, p0, [S

    .line 603
    .local v1, "uints":[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p0, :cond_e

    .line 605
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint8(Ljava/io/InputStream;)S

    move-result v2

    aput-short v2, v1, v0

    .line 603
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 607
    :cond_e
    return-object v1
.end method

.method public static readVersion(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 631
    .local v0, "i1":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 632
    .local v1, "i2":I
    if-gez v1, :cond_10

    .line 634
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 636
    :cond_10
    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->get(II)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v2

    return-object v2
.end method

.method public static readVersion([BI)Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 624
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    invoke-static {v0, v1}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->get(II)Lorg/spongycastle/crypto/tls/ProtocolVersion;

    move-result-object v0

    return-object v0
.end method

.method public static readVersionRaw(Ljava/io/InputStream;)I
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 648
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 649
    .local v0, "i1":I
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 650
    .local v1, "i2":I
    if-gez v1, :cond_10

    .line 652
    new-instance v2, Ljava/io/EOFException;

    invoke-direct {v2}, Ljava/io/EOFException;-><init>()V

    throw v2

    .line 654
    :cond_10
    shl-int/lit8 v2, v0, 0x8

    or-int/2addr v2, v1

    return v2
.end method

.method public static readVersionRaw([BI)I
    .registers 4
    .param p0, "buf"    # [B
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 642
    aget-byte v0, p0, p1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    or-int/2addr v0, v1

    return v0
.end method

.method static trackHashAlgorithms(Lorg/spongycastle/crypto/tls/TlsHandshakeHash;Ljava/util/Vector;)V
    .registers 6
    .param p0, "handshakeHash"    # Lorg/spongycastle/crypto/tls/TlsHandshakeHash;
    .param p1, "supportedSignatureAlgorithms"    # Ljava/util/Vector;

    .prologue
    .line 1336
    if-eqz p1, :cond_19

    .line 1338
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v1, v3, :cond_19

    .line 1341
    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 1342
    .local v2, "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v0

    .line 1343
    .local v0, "hashAlgorithm":S
    invoke-interface {p0, v0}, Lorg/spongycastle/crypto/tls/TlsHandshakeHash;->trackHashAlgorithm(S)V

    .line 1338
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 1346
    .end local v0    # "hashAlgorithm":S
    .end local v1    # "i":I
    .end local v2    # "signatureAndHashAlgorithm":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    :cond_19
    return-void
.end method

.method static validateKeyUsage(Lorg/spongycastle/asn1/x509/Certificate;I)V
    .registers 7
    .param p0, "c"    # Lorg/spongycastle/asn1/x509/Certificate;
    .param p1, "keyUsageBits"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1028
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/Certificate;->getTBSCertificate()Lorg/spongycastle/asn1/x509/TBSCertificate;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/x509/TBSCertificate;->getExtensions()Lorg/spongycastle/asn1/x509/Extensions;

    move-result-object v1

    .line 1029
    .local v1, "exts":Lorg/spongycastle/asn1/x509/Extensions;
    if-eqz v1, :cond_25

    .line 1031
    invoke-static {v1}, Lorg/spongycastle/asn1/x509/KeyUsage;->fromExtensions(Lorg/spongycastle/asn1/x509/Extensions;)Lorg/spongycastle/asn1/x509/KeyUsage;

    move-result-object v2

    .line 1032
    .local v2, "ku":Lorg/spongycastle/asn1/x509/KeyUsage;
    if-eqz v2, :cond_25

    .line 1034
    invoke-virtual {v2}, Lorg/spongycastle/asn1/x509/KeyUsage;->getBytes()[B

    move-result-object v3

    const/4 v4, 0x0

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 1035
    .local v0, "bits":I
    and-int v3, v0, p1

    if-eq v3, p1, :cond_25

    .line 1037
    new-instance v3, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v4, 0x2e

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v3

    .line 1041
    .end local v0    # "bits":I
    .end local v2    # "ku":Lorg/spongycastle/asn1/x509/KeyUsage;
    :cond_25
    return-void
.end method

.method private static vectorOfOne(Ljava/lang/Object;)Ljava/util/Vector;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1397
    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    .line 1398
    .local v0, "v":Ljava/util/Vector;
    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1399
    return-object v0
.end method

.method public static verifySupportedSignatureAlgorithm(Ljava/util/Vector;Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;)V
    .registers 6
    .param p0, "supportedSignatureAlgorithms"    # Ljava/util/Vector;
    .param p1, "signatureAlgorithm"    # Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 918
    if-eqz p0, :cond_12

    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_12

    .line 919
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    const v3, 0x8000

    if-lt v2, v3, :cond_1a

    .line 921
    :cond_12
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'supportedSignatureAlgorithms\' must have length from 1 to (2^15 - 1)"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 924
    :cond_1a
    if-nez p1, :cond_24

    .line 926
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'signatureAlgorithm\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 929
    :cond_24
    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v2

    if-eqz v2, :cond_4f

    .line 931
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2b
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_4f

    .line 933
    invoke-virtual {p0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;

    .line 934
    .local v0, "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getHash()S

    move-result v3

    if-ne v2, v3, :cond_4c

    invoke-virtual {v0}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v2

    invoke-virtual {p1}, Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;->getSignature()S

    move-result v3

    if-ne v2, v3, :cond_4c

    .line 936
    return-void

    .line 931
    :cond_4c
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 941
    .end local v0    # "entry":Lorg/spongycastle/crypto/tls/SignatureAndHashAlgorithm;
    .end local v1    # "i":I
    :cond_4f
    new-instance v2, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v3, 0x2f

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v2
.end method

.method public static writeGMTUnixTime([BI)V
    .registers 7
    .param p0, "buf"    # [B
    .param p1, "offset"    # I

    .prologue
    .line 689
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    long-to-int v0, v1

    .line 690
    .local v0, "t":I
    ushr-int/lit8 v1, v0, 0x18

    int-to-byte v1, v1

    aput-byte v1, p0, p1

    .line 691
    add-int/lit8 v1, p1, 0x1

    ushr-int/lit8 v2, v0, 0x10

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 692
    add-int/lit8 v1, p1, 0x2

    ushr-int/lit8 v2, v0, 0x8

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 693
    add-int/lit8 v1, p1, 0x3

    int-to-byte v2, v0

    aput-byte v2, p0, v1

    .line 694
    return-void
.end method

.method public static writeOpaque16([BLjava/io/OutputStream;)V
    .registers 3
    .param p0, "buf"    # [B
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 333
    array-length v0, p0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 334
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 335
    return-void
.end method

.method public static writeOpaque24([BLjava/io/OutputStream;)V
    .registers 3
    .param p0, "buf"    # [B
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 340
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint24(I)V

    .line 341
    array-length v0, p0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint24(ILjava/io/OutputStream;)V

    .line 342
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 343
    return-void
.end method

.method public static writeOpaque8([BLjava/io/OutputStream;)V
    .registers 3
    .param p0, "buf"    # [B
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 325
    array-length v0, p0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(ILjava/io/OutputStream;)V

    .line 326
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 327
    return-void
.end method

.method public static writeUint16(ILjava/io/OutputStream;)V
    .registers 3
    .param p0, "i"    # I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 233
    ushr-int/lit8 v0, p0, 0x8

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 234
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    .line 235
    return-void
.end method

.method public static writeUint16(I[BI)V
    .registers 5
    .param p0, "i"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 239
    ushr-int/lit8 v0, p0, 0x8

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 240
    add-int/lit8 v0, p2, 0x1

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 241
    return-void
.end method

.method public static writeUint16Array([ILjava/io/OutputStream;)V
    .registers 4
    .param p0, "uints"    # [I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 385
    aget v1, p0, v0

    invoke-static {v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 383
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 387
    :cond_c
    return-void
.end method

.method public static writeUint16Array([I[BI)V
    .registers 5
    .param p0, "uints"    # [I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 392
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_e

    .line 394
    aget v1, p0, v0

    invoke-static {v1, p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 395
    add-int/lit8 p2, p2, 0x2

    .line 392
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 397
    :cond_e
    return-void
.end method

.method public static writeUint16ArrayWithUint16Length([ILjava/io/OutputStream;)V
    .registers 4
    .param p0, "uints"    # [I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    array-length v1, p0

    mul-int/lit8 v0, v1, 0x2

    .line 403
    .local v0, "length":I
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 404
    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 405
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16Array([ILjava/io/OutputStream;)V

    .line 406
    return-void
.end method

.method public static writeUint16ArrayWithUint16Length([I[BI)V
    .registers 5
    .param p0, "uints"    # [I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 411
    array-length v1, p0

    mul-int/lit8 v0, v1, 0x2

    .line 412
    .local v0, "length":I
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 413
    invoke-static {v0, p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(I[BI)V

    .line 414
    add-int/lit8 v1, p2, 0x2

    invoke-static {p0, p1, v1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16Array([I[BI)V

    .line 415
    return-void
.end method

.method public static writeUint24(ILjava/io/OutputStream;)V
    .registers 3
    .param p0, "i"    # I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    ushr-int/lit8 v0, p0, 0x10

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 247
    ushr-int/lit8 v0, p0, 0x8

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 248
    int-to-byte v0, p0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 249
    return-void
.end method

.method public static writeUint24(I[BI)V
    .registers 5
    .param p0, "i"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 253
    ushr-int/lit8 v0, p0, 0x10

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 254
    add-int/lit8 v0, p2, 0x1

    ushr-int/lit8 v1, p0, 0x8

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 255
    add-int/lit8 v0, p2, 0x2

    int-to-byte v1, p0

    aput-byte v1, p1, v0

    .line 256
    return-void
.end method

.method public static writeUint32(JLjava/io/OutputStream;)V
    .registers 5
    .param p0, "i"    # J
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    const/16 v0, 0x18

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 262
    const/16 v0, 0x10

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 263
    const/16 v0, 0x8

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 264
    long-to-int v0, p0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 265
    return-void
.end method

.method public static writeUint32(J[BI)V
    .registers 7
    .param p0, "i"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    .line 269
    const/16 v0, 0x18

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    aput-byte v0, p2, p3

    .line 270
    add-int/lit8 v0, p3, 0x1

    const/16 v1, 0x10

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 271
    add-int/lit8 v0, p3, 0x2

    const/16 v1, 0x8

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 272
    add-int/lit8 v0, p3, 0x3

    long-to-int v1, p0

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 273
    return-void
.end method

.method public static writeUint48(JLjava/io/OutputStream;)V
    .registers 5
    .param p0, "i"    # J
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    const/16 v0, 0x28

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 279
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 280
    const/16 v0, 0x18

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 281
    const/16 v0, 0x10

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 282
    const/16 v0, 0x8

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 283
    long-to-int v0, p0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 284
    return-void
.end method

.method public static writeUint48(J[BI)V
    .registers 7
    .param p0, "i"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    .line 288
    const/16 v0, 0x28

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    aput-byte v0, p2, p3

    .line 289
    add-int/lit8 v0, p3, 0x1

    const/16 v1, 0x20

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 290
    add-int/lit8 v0, p3, 0x2

    const/16 v1, 0x18

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 291
    add-int/lit8 v0, p3, 0x3

    const/16 v1, 0x10

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 292
    add-int/lit8 v0, p3, 0x4

    const/16 v1, 0x8

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 293
    add-int/lit8 v0, p3, 0x5

    long-to-int v1, p0

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 294
    return-void
.end method

.method public static writeUint64(JLjava/io/OutputStream;)V
    .registers 5
    .param p0, "i"    # J
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    const/16 v0, 0x38

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 300
    const/16 v0, 0x30

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 301
    const/16 v0, 0x28

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 302
    const/16 v0, 0x20

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 303
    const/16 v0, 0x18

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 304
    const/16 v0, 0x10

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 305
    const/16 v0, 0x8

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 306
    long-to-int v0, p0

    int-to-byte v0, v0

    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write(I)V

    .line 307
    return-void
.end method

.method public static writeUint64(J[BI)V
    .registers 7
    .param p0, "i"    # J
    .param p2, "buf"    # [B
    .param p3, "offset"    # I

    .prologue
    .line 311
    const/16 v0, 0x38

    ushr-long v0, p0, v0

    long-to-int v0, v0

    int-to-byte v0, v0

    aput-byte v0, p2, p3

    .line 312
    add-int/lit8 v0, p3, 0x1

    const/16 v1, 0x30

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 313
    add-int/lit8 v0, p3, 0x2

    const/16 v1, 0x28

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 314
    add-int/lit8 v0, p3, 0x3

    const/16 v1, 0x20

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 315
    add-int/lit8 v0, p3, 0x4

    const/16 v1, 0x18

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 316
    add-int/lit8 v0, p3, 0x5

    const/16 v1, 0x10

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 317
    add-int/lit8 v0, p3, 0x6

    const/16 v1, 0x8

    ushr-long v1, p0, v1

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 318
    add-int/lit8 v0, p3, 0x7

    long-to-int v1, p0

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 319
    return-void
.end method

.method public static writeUint8(ILjava/io/OutputStream;)V
    .registers 2
    .param p0, "i"    # I
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    .line 218
    return-void
.end method

.method public static writeUint8(I[BI)V
    .registers 4
    .param p0, "i"    # I
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 227
    int-to-byte v0, p0

    aput-byte v0, p1, p2

    .line 228
    return-void
.end method

.method public static writeUint8(SLjava/io/OutputStream;)V
    .registers 2
    .param p0, "i"    # S
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    .line 212
    return-void
.end method

.method public static writeUint8(S[BI)V
    .registers 4
    .param p0, "i"    # S
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 222
    int-to-byte v0, p0

    aput-byte v0, p1, p2

    .line 223
    return-void
.end method

.method public static writeUint8Array([SLjava/io/OutputStream;)V
    .registers 4
    .param p0, "uints"    # [S
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 350
    aget-short v1, p0, v0

    invoke-static {v1, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(SLjava/io/OutputStream;)V

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 352
    :cond_c
    return-void
.end method

.method public static writeUint8Array([S[BI)V
    .registers 5
    .param p0, "uints"    # [S
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 357
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_e

    .line 359
    aget-short v1, p0, v0

    invoke-static {v1, p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(S[BI)V

    .line 360
    add-int/lit8 p2, p2, 0x1

    .line 357
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 362
    :cond_e
    return-void
.end method

.method public static writeUint8ArrayWithUint8Length([SLjava/io/OutputStream;)V
    .registers 3
    .param p0, "uints"    # [S
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 368
    array-length v0, p0

    invoke-static {v0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(ILjava/io/OutputStream;)V

    .line 369
    invoke-static {p0, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8Array([SLjava/io/OutputStream;)V

    .line 370
    return-void
.end method

.method public static writeUint8ArrayWithUint8Length([S[BI)V
    .registers 4
    .param p0, "uints"    # [S
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 375
    array-length v0, p0

    invoke-static {v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint8(I)V

    .line 376
    array-length v0, p0

    invoke-static {v0, p1, p2}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8(I[BI)V

    .line 377
    add-int/lit8 v0, p2, 0x1

    invoke-static {p0, p1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint8Array([S[BI)V

    .line 378
    return-void
.end method

.method public static writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;Ljava/io/OutputStream;)V
    .registers 3
    .param p0, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 699
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 700
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 701
    return-void
.end method

.method public static writeVersion(Lorg/spongycastle/crypto/tls/ProtocolVersion;[BI)V
    .registers 5
    .param p0, "version"    # Lorg/spongycastle/crypto/tls/ProtocolVersion;
    .param p1, "buf"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 705
    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMajorVersion()I

    move-result v0

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 706
    add-int/lit8 v0, p2, 0x1

    invoke-virtual {p0}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->getMinorVersion()I

    move-result v1

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 707
    return-void
.end method
