.class public Lcom/sun/mail/auth/Ntlm;
.super Ljava/lang/Object;
.source "Ntlm.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static hex:[C


# instance fields
.field private cipher:Ljavax/crypto/Cipher;

.field private fac:Ljavax/crypto/SecretKeyFactory;

.field private hostname:Ljava/lang/String;

.field private logger:Lcom/sun/mail/util/MailLogger;

.field private md4:Lcom/sun/mail/auth/MD4;

.field private ntdomain:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private type1:[B

.field private type3:[B

.field private username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    const-class v0, Lcom/sun/mail/auth/Ntlm;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_15

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    .line 352
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_18

    sput-object v0, Lcom/sun/mail/auth/Ntlm;->hex:[C

    return-void

    .line 71
    :cond_15
    const/4 v0, 0x0

    goto :goto_9

    .line 352
    nop

    :array_18
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/sun/mail/util/MailLogger;)V
    .registers 10
    .param p1, "ntdomain"    # Ljava/lang/String;
    .param p2, "hostname"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "logger"    # Lcom/sun/mail/util/MailLogger;

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    const/16 v1, 0x2e

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 124
    .local v0, "i":I
    if-eq v0, v2, :cond_11

    .line 125
    invoke-virtual {p2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 127
    :cond_11
    const/16 v1, 0x5c

    invoke-virtual {p3, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 128
    if-eq v0, v2, :cond_41

    .line 129
    invoke-virtual {p3, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 130
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 134
    :cond_29
    :goto_29
    iput-object p1, p0, Lcom/sun/mail/auth/Ntlm;->ntdomain:Ljava/lang/String;

    .line 135
    iput-object p2, p0, Lcom/sun/mail/auth/Ntlm;->hostname:Ljava/lang/String;

    .line 136
    iput-object p3, p0, Lcom/sun/mail/auth/Ntlm;->username:Ljava/lang/String;

    .line 137
    iput-object p4, p0, Lcom/sun/mail/auth/Ntlm;->password:Ljava/lang/String;

    .line 138
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "DEBUG NTLM"

    invoke-virtual {p5, v1, v2}, Lcom/sun/mail/util/MailLogger;->getLogger(Ljava/lang/Class;Ljava/lang/String;)Lcom/sun/mail/util/MailLogger;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    .line 139
    invoke-direct {p0}, Lcom/sun/mail/auth/Ntlm;->init0()V

    .line 140
    return-void

    .line 131
    :cond_41
    if-nez p1, :cond_29

    .line 132
    const-string p1, ""

    goto :goto_29
.end method

.method private calcLMHash()[B
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 208
    const/16 v12, 0x8

    new-array v6, v12, [B

    fill-array-data v6, :array_88

    .line 209
    .local v6, "magic":[B
    const/4 v9, 0x0

    .line 211
    .local v9, "pwb":[B
    :try_start_8
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->password:Ljava/lang/String;

    sget-object v13, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "iso-8859-1"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_15
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_15} :catch_7d

    move-result-object v9

    .line 216
    :cond_16
    const/16 v12, 0xe

    new-array v10, v12, [B

    .line 217
    .local v10, "pwb1":[B
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->password:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v5

    .line 218
    .local v5, "len":I
    const/16 v12, 0xe

    if-le v5, v12, :cond_26

    .line 219
    const/16 v5, 0xe

    .line 220
    :cond_26
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v9, v12, v10, v13, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    new-instance v0, Ljavax/crypto/spec/DESKeySpec;

    const/4 v12, 0x0

    invoke-direct {p0, v10, v12}, Lcom/sun/mail/auth/Ntlm;->makeDesKey([BI)[B

    move-result-object v12

    invoke-direct {v0, v12}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 223
    .local v0, "dks1":Ljavax/crypto/spec/DESKeySpec;
    new-instance v1, Ljavax/crypto/spec/DESKeySpec;

    const/4 v12, 0x7

    invoke-direct {p0, v10, v12}, Lcom/sun/mail/auth/Ntlm;->makeDesKey([BI)[B

    move-result-object v12

    invoke-direct {v1, v12}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 225
    .local v1, "dks2":Ljavax/crypto/spec/DESKeySpec;
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    invoke-virtual {v12, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v3

    .line 226
    .local v3, "key1":Ljavax/crypto/SecretKey;
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    invoke-virtual {v12, v1}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v4

    .line 227
    .local v4, "key2":Ljavax/crypto/SecretKey;
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v13, 0x1

    invoke-virtual {v12, v13, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 228
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v13, 0x0

    const/16 v14, 0x8

    invoke-virtual {v12, v6, v13, v14}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v7

    .line 229
    .local v7, "out1":[B
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v13, 0x1

    invoke-virtual {v12, v13, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 230
    iget-object v12, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v13, 0x0

    const/16 v14, 0x8

    invoke-virtual {v12, v6, v13, v14}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v8

    .line 232
    .local v8, "out2":[B
    const/16 v12, 0x15

    new-array v11, v12, [B

    .line 233
    .local v11, "result":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v14, 0x8

    invoke-static {v7, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 234
    const/4 v12, 0x0

    const/16 v13, 0x8

    const/16 v14, 0x8

    invoke-static {v8, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 235
    return-object v11

    .line 212
    .end local v0    # "dks1":Ljavax/crypto/spec/DESKeySpec;
    .end local v1    # "dks2":Ljavax/crypto/spec/DESKeySpec;
    .end local v3    # "key1":Ljavax/crypto/SecretKey;
    .end local v4    # "key2":Ljavax/crypto/SecretKey;
    .end local v5    # "len":I
    .end local v7    # "out1":[B
    .end local v8    # "out2":[B
    .end local v10    # "pwb1":[B
    .end local v11    # "result":[B
    :catch_7d
    move-exception v2

    .line 214
    .local v2, "ex":Ljava/io/UnsupportedEncodingException;
    sget-boolean v12, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v12, :cond_16

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12

    .line 208
    :array_88
    .array-data 1
        0x4bt
        0x47t
        0x53t
        0x21t
        0x40t
        0x23t
        0x24t
        0x25t
    .end array-data
.end method

.method private calcNTHash()[B
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 239
    const/4 v2, 0x0

    .line 241
    .local v2, "pw":[B
    :try_start_2
    iget-object v4, p0, Lcom/sun/mail/auth/Ntlm;->password:Ljava/lang/String;

    const-string v5, "UnicodeLittleUnmarked"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_9} :catch_1a

    move-result-object v2

    .line 245
    :cond_a
    iget-object v4, p0, Lcom/sun/mail/auth/Ntlm;->md4:Lcom/sun/mail/auth/MD4;

    invoke-virtual {v4, v2}, Lcom/sun/mail/auth/MD4;->digest([B)[B

    move-result-object v1

    .line 246
    .local v1, "out":[B
    const/16 v4, 0x15

    new-array v3, v4, [B

    .line 247
    .local v3, "result":[B
    const/16 v4, 0x10

    invoke-static {v1, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 248
    return-object v3

    .line 242
    .end local v1    # "out":[B
    .end local v3    # "result":[B
    :catch_1a
    move-exception v0

    .line 243
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v4, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v4, :cond_a

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4
.end method

.method private calcResponse([B[B)[B
    .registers 16
    .param p1, "key"    # [B
    .param p2, "text"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 258
    sget-boolean v10, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v10, :cond_f

    array-length v10, p1

    const/16 v11, 0x15

    if-eq v10, v11, :cond_f

    new-instance v10, Ljava/lang/AssertionError;

    invoke-direct {v10}, Ljava/lang/AssertionError;-><init>()V

    throw v10

    .line 259
    :cond_f
    new-instance v0, Ljavax/crypto/spec/DESKeySpec;

    const/4 v10, 0x0

    invoke-direct {p0, p1, v10}, Lcom/sun/mail/auth/Ntlm;->makeDesKey([BI)[B

    move-result-object v10

    invoke-direct {v0, v10}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 260
    .local v0, "dks1":Ljavax/crypto/spec/DESKeySpec;
    new-instance v1, Ljavax/crypto/spec/DESKeySpec;

    const/4 v10, 0x7

    invoke-direct {p0, p1, v10}, Lcom/sun/mail/auth/Ntlm;->makeDesKey([BI)[B

    move-result-object v10

    invoke-direct {v1, v10}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 261
    .local v1, "dks2":Ljavax/crypto/spec/DESKeySpec;
    new-instance v2, Ljavax/crypto/spec/DESKeySpec;

    const/16 v10, 0xe

    invoke-direct {p0, p1, v10}, Lcom/sun/mail/auth/Ntlm;->makeDesKey([BI)[B

    move-result-object v10

    invoke-direct {v2, v10}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 262
    .local v2, "dks3":Ljavax/crypto/spec/DESKeySpec;
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    invoke-virtual {v10, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v3

    .line 263
    .local v3, "key1":Ljavax/crypto/SecretKey;
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    invoke-virtual {v10, v1}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v4

    .line 264
    .local v4, "key2":Ljavax/crypto/SecretKey;
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    invoke-virtual {v10, v2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v5

    .line 265
    .local v5, "key3":Ljavax/crypto/SecretKey;
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x1

    invoke-virtual {v10, v11, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 266
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-virtual {v10, p2, v11, v12}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v6

    .line 267
    .local v6, "out1":[B
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x1

    invoke-virtual {v10, v11, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 268
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-virtual {v10, p2, v11, v12}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v7

    .line 269
    .local v7, "out2":[B
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x1

    invoke-virtual {v10, v11, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 270
    iget-object v10, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-virtual {v10, p2, v11, v12}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v8

    .line 271
    .local v8, "out3":[B
    const/16 v10, 0x18

    new-array v9, v10, [B

    .line 272
    .local v9, "result":[B
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v6, v10, v9, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 273
    const/4 v10, 0x0

    const/16 v11, 0x8

    const/16 v12, 0x8

    invoke-static {v7, v10, v9, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 274
    const/4 v10, 0x0

    const/16 v11, 0x10

    const/16 v12, 0x8

    invoke-static {v8, v10, v9, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 275
    return-object v9
.end method

.method private copybytes([BILjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "dest"    # [B
    .param p2, "destpos"    # I
    .param p3, "src"    # Ljava/lang/String;
    .param p4, "enc"    # Ljava/lang/String;

    .prologue
    .line 144
    :try_start_0
    invoke-virtual {p3, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 145
    .local v1, "x":[B
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_9} :catch_a

    .line 149
    .end local v1    # "x":[B
    :cond_9
    return-void

    .line 146
    :catch_a
    move-exception v0

    .line 147
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v2, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v2, :cond_9

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method private init0()V
    .registers 10

    .prologue
    const/16 v8, 0x20

    const/16 v7, 0xc

    const/16 v6, 0x18

    const/16 v5, 0x9

    const/4 v4, 0x0

    .line 87
    const/16 v1, 0x100

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    .line 88
    const/16 v1, 0x100

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    .line 89
    new-array v1, v5, [B

    fill-array-data v1, :array_96

    iget-object v2, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    invoke-static {v1, v4, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/4 v2, 0x3

    aput-byte v2, v1, v7

    .line 92
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v2, 0xd

    const/16 v3, -0x4e

    aput-byte v3, v1, v2

    .line 93
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v2, 0x1c

    aput-byte v8, v1, v2

    .line 94
    new-array v1, v5, [B

    fill-array-data v1, :array_a0

    iget-object v2, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    invoke-static {v1, v4, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 96
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    aput-byte v6, v1, v7

    .line 97
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0xe

    aput-byte v6, v1, v2

    .line 98
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0x14

    aput-byte v6, v1, v2

    .line 99
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0x16

    aput-byte v6, v1, v2

    .line 100
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0x40

    aput-byte v2, v1, v8

    .line 101
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0x3c

    const/4 v3, 0x1

    aput-byte v3, v1, v2

    .line 102
    iget-object v1, p0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    const/16 v2, 0x3d

    const/16 v3, -0x7e

    aput-byte v3, v1, v2

    .line 105
    :try_start_67
    const-string v1, "DES"

    invoke-static {v1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->fac:Ljavax/crypto/SecretKeyFactory;

    .line 106
    const-string v1, "DES/ECB/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->cipher:Ljavax/crypto/Cipher;

    .line 107
    new-instance v1, Lcom/sun/mail/auth/MD4;

    invoke-direct {v1}, Lcom/sun/mail/auth/MD4;-><init>()V

    iput-object v1, p0, Lcom/sun/mail/auth/Ntlm;->md4:Lcom/sun/mail/auth/MD4;
    :try_end_7e
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_67 .. :try_end_7e} :catch_7f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_67 .. :try_end_7e} :catch_8a

    .line 113
    :cond_7e
    return-void

    .line 108
    :catch_7f
    move-exception v0

    .line 109
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    sget-boolean v1, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v1, :cond_7e

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 110
    .end local v0    # "e":Ljavax/crypto/NoSuchPaddingException;
    :catch_8a
    move-exception v0

    .line 111
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    sget-boolean v1, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v1, :cond_7e

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 89
    nop

    :array_96
    .array-data 1
        0x4et
        0x54t
        0x4ct
        0x4dt
        0x53t
        0x53t
        0x50t
        0x0t
        0x1t
    .end array-data

    .line 94
    nop

    :array_a0
    .array-data 1
        0x4et
        0x54t
        0x4ct
        0x4dt
        0x53t
        0x53t
        0x50t
        0x0t
        0x3t
    .end array-data
.end method

.method private makeDesKey([BI)[B
    .registers 9
    .param p1, "input"    # [B
    .param p2, "off"    # I

    .prologue
    .line 191
    array-length v3, p1

    new-array v1, v3, [I

    .line 192
    .local v1, "in":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v3, v1

    if-ge v0, v3, :cond_17

    .line 193
    aget-byte v3, p1, v0

    if-gez v3, :cond_14

    aget-byte v3, p1, v0

    add-int/lit16 v3, v3, 0x100

    :goto_f
    aput v3, v1, v0

    .line 192
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 193
    :cond_14
    aget-byte v3, p1, v0

    goto :goto_f

    .line 195
    :cond_17
    const/16 v3, 0x8

    new-array v2, v3, [B

    .line 196
    .local v2, "out":[B
    const/4 v3, 0x0

    add-int/lit8 v4, p2, 0x0

    aget v4, v1, v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 197
    const/4 v3, 0x1

    add-int/lit8 v4, p2, 0x0

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x7

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x1

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x1

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 198
    const/4 v3, 0x2

    add-int/lit8 v4, p2, 0x1

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x6

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x2

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x2

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 199
    const/4 v3, 0x3

    add-int/lit8 v4, p2, 0x2

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x5

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x3

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x3

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 200
    const/4 v3, 0x4

    add-int/lit8 v4, p2, 0x3

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x4

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x4

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x4

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 201
    const/4 v3, 0x5

    add-int/lit8 v4, p2, 0x4

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x3

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x5

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 202
    const/4 v3, 0x6

    add-int/lit8 v4, p2, 0x5

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x2

    and-int/lit16 v4, v4, 0xff

    add-int/lit8 v5, p2, 0x6

    aget v5, v1, v5

    shr-int/lit8 v5, v5, 0x6

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 203
    const/4 v3, 0x7

    add-int/lit8 v4, p2, 0x6

    aget v4, v1, v4

    shl-int/lit8 v4, v4, 0x1

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 204
    return-object v2
.end method

.method private static toHex([B)Ljava/lang/String;
    .registers 6
    .param p0, "b"    # [B

    .prologue
    .line 356
    new-instance v1, Ljava/lang/StringBuffer;

    array-length v2, p0

    mul-int/lit8 v2, v2, 0x3

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 357
    .local v1, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v2, p0

    if-ge v0, v2, :cond_2e

    .line 358
    sget-object v2, Lcom/sun/mail/auth/Ntlm;->hex:[C

    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lcom/sun/mail/auth/Ntlm;->hex:[C

    aget-byte v4, p0, v0

    and-int/lit8 v4, v4, 0xf

    aget-char v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x20

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 357
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 359
    :cond_2e
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public generateType1Msg(I)Ljava/lang/String;
    .registers 16
    .param p1, "flags"    # I

    .prologue
    const/16 v13, 0x19

    const/16 v12, 0x18

    const/16 v11, 0x11

    const/16 v9, 0x10

    const/4 v10, 0x0

    .line 153
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->ntdomain:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    .line 154
    .local v0, "dlen":I
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    rem-int/lit16 v7, v0, 0x100

    int-to-byte v7, v7

    aput-byte v7, v6, v9

    .line 155
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    div-int/lit16 v7, v0, 0x100

    int-to-byte v7, v7

    aput-byte v7, v6, v11

    .line 156
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x12

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    aget-byte v8, v8, v9

    aput-byte v8, v6, v7

    .line 157
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x13

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    aget-byte v8, v8, v11

    aput-byte v8, v6, v7

    .line 158
    if-nez v0, :cond_3e

    .line 159
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0xd

    aget-byte v8, v6, v7

    and-int/lit8 v8, v8, -0x11

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 161
    :cond_3e
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->hostname:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v2

    .line 162
    .local v2, "hlen":I
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    rem-int/lit16 v7, v2, 0x100

    int-to-byte v7, v7

    aput-byte v7, v6, v12

    .line 163
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    div-int/lit16 v7, v2, 0x100

    int-to-byte v7, v7

    aput-byte v7, v6, v13

    .line 164
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x1a

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    aget-byte v8, v8, v12

    aput-byte v8, v6, v7

    .line 165
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x1b

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    aget-byte v8, v8, v13

    aput-byte v8, v6, v7

    .line 167
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x20

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->hostname:Ljava/lang/String;

    const-string v9, "iso-8859-1"

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/sun/mail/auth/Ntlm;->copybytes([BILjava/lang/String;Ljava/lang/String;)V

    .line 168
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    add-int/lit8 v7, v2, 0x20

    iget-object v8, p0, Lcom/sun/mail/auth/Ntlm;->ntdomain:Ljava/lang/String;

    const-string v9, "iso-8859-1"

    invoke-direct {p0, v6, v7, v8, v9}, Lcom/sun/mail/auth/Ntlm;->copybytes([BILjava/lang/String;Ljava/lang/String;)V

    .line 169
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x14

    add-int/lit8 v8, v2, 0x20

    rem-int/lit16 v8, v8, 0x100

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 170
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    const/16 v7, 0x15

    add-int/lit8 v8, v2, 0x20

    div-int/lit16 v8, v8, 0x100

    int-to-byte v8, v8

    aput-byte v8, v6, v7

    .line 172
    add-int/lit8 v6, v2, 0x20

    add-int/2addr v6, v0

    new-array v3, v6, [B

    .line 173
    .local v3, "msg":[B
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->type1:[B

    add-int/lit8 v7, v2, 0x20

    add-int/2addr v7, v0

    invoke-static {v6, v10, v3, v10, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 174
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    sget-object v7, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v6

    if-eqz v6, :cond_c5

    .line 175
    iget-object v6, p0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "type 1 message: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Lcom/sun/mail/auth/Ntlm;->toHex([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V

    .line 177
    :cond_c5
    const/4 v4, 0x0

    .line 179
    .local v4, "result":Ljava/lang/String;
    :try_start_c6
    new-instance v5, Ljava/lang/String;

    invoke-static {v3}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v6

    const-string v7, "iso-8859-1"

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_d1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_c6 .. :try_end_d1} :catch_d3

    .end local v4    # "result":Ljava/lang/String;
    .local v5, "result":Ljava/lang/String;
    move-object v4, v5

    .line 183
    .end local v5    # "result":Ljava/lang/String;
    .restart local v4    # "result":Ljava/lang/String;
    :cond_d2
    return-object v4

    .line 180
    :catch_d3
    move-exception v1

    .line 181
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v6, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v6, :cond_d2

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6
.end method

.method public generateType3Msg(Ljava/lang/String;)Ljava/lang/String;
    .registers 26
    .param p1, "challenge"    # Ljava/lang/String;

    .prologue
    .line 283
    const/16 v17, 0x0

    .line 285
    .local v17, "type2":[B
    :try_start_2
    const-string v19, "us-ascii"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/sun/mail/util/BASE64DecoderStream;->decode([B)[B
    :try_end_f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_f} :catch_2c4
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_f} :catch_2cf

    move-result-object v17

    .line 290
    :cond_10
    const/16 v19, 0x8

    :try_start_12
    move/from16 v0, v19

    new-array v12, v0, [B

    .line 291
    .local v12, "nonce":[B
    const/16 v19, 0x18

    const/16 v20, 0x0

    const/16 v21, 0x8

    move-object/from16 v0, v17

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 293
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->username:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    mul-int/lit8 v18, v19, 0x2

    .line 294
    .local v18, "ulen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x24

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x26

    move/from16 v0, v18

    rem-int/lit16 v0, v0, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x27

    move/from16 v0, v18

    div-int/lit16 v0, v0, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->ntdomain:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    mul-int/lit8 v4, v19, 0x2

    .line 297
    .local v4, "dlen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x1e

    rem-int/lit16 v0, v4, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 298
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x1f

    div-int/lit16 v0, v4, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->hostname:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    mul-int/lit8 v7, v19, 0x2

    .line 300
    .local v7, "hlen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x2c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x2e

    rem-int/lit16 v0, v7, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 301
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x2d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v21, v0

    const/16 v22, 0x2f

    div-int/lit16 v0, v7, 0x100

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v21, v22

    aput-byte v23, v19, v20

    .line 303
    const/16 v8, 0x40

    .line 304
    .local v8, "l":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->ntdomain:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "UnicodeLittleUnmarked"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/sun/mail/auth/Ntlm;->copybytes([BILjava/lang/String;Ljava/lang/String;)V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x20

    const/16 v21, 0x40

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x21

    const/16 v21, 0x0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 307
    add-int/2addr v8, v4

    .line 308
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->username:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "UnicodeLittleUnmarked"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/sun/mail/auth/Ntlm;->copybytes([BILjava/lang/String;Ljava/lang/String;)V

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x28

    rem-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 310
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x29

    div-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 311
    add-int v8, v8, v18

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->hostname:Ljava/lang/String;

    move-object/from16 v20, v0

    const-string v21, "UnicodeLittleUnmarked"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/sun/mail/auth/Ntlm;->copybytes([BILjava/lang/String;Ljava/lang/String;)V

    .line 313
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x30

    rem-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x31

    div-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 315
    add-int/2addr v8, v7

    .line 317
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/auth/Ntlm;->calcLMHash()[B

    move-result-object v9

    .line 318
    .local v9, "lmhash":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v12}, Lcom/sun/mail/auth/Ntlm;->calcResponse([B[B)[B

    move-result-object v10

    .line 319
    .local v10, "lmresponse":[B
    invoke-direct/range {p0 .. p0}, Lcom/sun/mail/auth/Ntlm;->calcNTHash()[B

    move-result-object v13

    .line 320
    .local v13, "nthash":[B
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v12}, Lcom/sun/mail/auth/Ntlm;->calcResponse([B[B)[B

    move-result-object v14

    .line 321
    .local v14, "ntresponse":[B
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v20, v0

    const/16 v21, 0x18

    move/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v10, v0, v1, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 322
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x10

    rem-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 323
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x11

    div-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 324
    add-int/lit8 v8, v8, 0x18

    .line 325
    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v20, v0

    const/16 v21, 0x18

    move/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v14, v0, v1, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x18

    rem-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x19

    div-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 328
    add-int/lit8 v8, v8, 0x18

    .line 329
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x38

    rem-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x39

    div-int/lit16 v0, v8, 0x100

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-byte v0, v0

    move/from16 v21, v0

    aput-byte v21, v19, v20

    .line 332
    new-array v11, v8, [B

    .line 333
    .local v11, "msg":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->type3:[B

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-static {v0, v1, v11, v2, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    move-object/from16 v19, v0

    sget-object v20, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-virtual/range {v19 .. v20}, Lcom/sun/mail/util/MailLogger;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v19

    if-eqz v19, :cond_2af

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "type 3 message: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-static {v11}, Lcom/sun/mail/auth/Ntlm;->toHex([B)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/sun/mail/util/MailLogger;->fine(Ljava/lang/String;)V
    :try_end_2af
    .catch Ljava/security/GeneralSecurityException; {:try_start_12 .. :try_end_2af} :catch_2cf

    .line 337
    :cond_2af
    const/4 v15, 0x0

    .line 339
    .local v15, "result":Ljava/lang/String;
    :try_start_2b0
    new-instance v16, Ljava/lang/String;

    invoke-static {v11}, Lcom/sun/mail/util/BASE64EncoderStream;->encode([B)[B

    move-result-object v19

    const-string v20, "iso-8859-1"

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_2c1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2b0 .. :try_end_2c1} :catch_2e6
    .catch Ljava/security/GeneralSecurityException; {:try_start_2b0 .. :try_end_2c1} :catch_2cf

    .end local v15    # "result":Ljava/lang/String;
    .local v16, "result":Ljava/lang/String;
    move-object/from16 v15, v16

    .line 348
    .end local v4    # "dlen":I
    .end local v7    # "hlen":I
    .end local v8    # "l":I
    .end local v9    # "lmhash":[B
    .end local v10    # "lmresponse":[B
    .end local v11    # "msg":[B
    .end local v12    # "nonce":[B
    .end local v13    # "nthash":[B
    .end local v14    # "ntresponse":[B
    .end local v16    # "result":Ljava/lang/String;
    .end local v18    # "ulen":I
    :cond_2c3
    :goto_2c3
    return-object v15

    .line 286
    :catch_2c4
    move-exception v6

    .line 288
    .local v6, "ex":Ljava/io/UnsupportedEncodingException;
    :try_start_2c5
    sget-boolean v19, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v19, :cond_10

    new-instance v19, Ljava/lang/AssertionError;

    invoke-direct/range {v19 .. v19}, Ljava/lang/AssertionError;-><init>()V

    throw v19
    :try_end_2cf
    .catch Ljava/security/GeneralSecurityException; {:try_start_2c5 .. :try_end_2cf} :catch_2cf

    .line 345
    .end local v6    # "ex":Ljava/io/UnsupportedEncodingException;
    :catch_2cf
    move-exception v6

    .line 347
    .local v6, "ex":Ljava/security/GeneralSecurityException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/mail/auth/Ntlm;->logger:Lcom/sun/mail/util/MailLogger;

    move-object/from16 v19, v0

    sget-object v20, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v21, "GeneralSecurityException"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2, v6}, Lcom/sun/mail/util/MailLogger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 348
    const-string v15, ""

    goto :goto_2c3

    .line 340
    .end local v6    # "ex":Ljava/security/GeneralSecurityException;
    .restart local v4    # "dlen":I
    .restart local v7    # "hlen":I
    .restart local v8    # "l":I
    .restart local v9    # "lmhash":[B
    .restart local v10    # "lmresponse":[B
    .restart local v11    # "msg":[B
    .restart local v12    # "nonce":[B
    .restart local v13    # "nthash":[B
    .restart local v14    # "ntresponse":[B
    .restart local v15    # "result":Ljava/lang/String;
    .restart local v18    # "ulen":I
    :catch_2e6
    move-exception v5

    .line 341
    .local v5, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_2e7
    sget-boolean v19, Lcom/sun/mail/auth/Ntlm;->$assertionsDisabled:Z

    if-nez v19, :cond_2c3

    new-instance v19, Ljava/lang/AssertionError;

    invoke-direct/range {v19 .. v19}, Ljava/lang/AssertionError;-><init>()V

    throw v19
    :try_end_2f1
    .catch Ljava/security/GeneralSecurityException; {:try_start_2e7 .. :try_end_2f1} :catch_2cf
.end method
