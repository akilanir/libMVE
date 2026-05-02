.class public Linfo/guardianproject/netcipher/client/StrongConstants;
.super Ljava/lang/Object;
.source "StrongConstants.java"


# static fields
.field public static final ENABLED_CIPHERS:[Ljava/lang/String;

.field public static final ENABLED_PROTOCOLS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 9
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"

    aput-object v1, v0, v3

    const-string v1, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"

    aput-object v1, v0, v4

    const-string v1, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"

    aput-object v1, v0, v5

    const-string v1, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"

    aput-object v1, v0, v6

    const/4 v1, 0x4

    const-string v2, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "TLS_ECDHE_RSA_WITH_RC4_128_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "TLS_ECDHE_ECDSA_WITH_RC4_128_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "TLS_RSA_WITH_AES_128_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "TLS_RSA_WITH_AES_256_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "SSL_RSA_WITH_3DES_EDE_CBC_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "SSL_RSA_WITH_RC4_128_SHA"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "SSL_RSA_WITH_RC4_128_MD5"

    aput-object v2, v0, v1

    sput-object v0, Linfo/guardianproject/netcipher/client/StrongConstants;->ENABLED_CIPHERS:[Ljava/lang/String;

    .line 26
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "TLSv1.2"

    aput-object v1, v0, v3

    const-string v1, "TLSv1.1"

    aput-object v1, v0, v4

    const-string v1, "TLSv1"

    aput-object v1, v0, v5

    sput-object v0, Linfo/guardianproject/netcipher/client/StrongConstants;->ENABLED_PROTOCOLS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
