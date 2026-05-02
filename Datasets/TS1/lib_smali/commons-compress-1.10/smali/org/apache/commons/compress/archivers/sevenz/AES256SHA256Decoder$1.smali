.class Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;
.super Ljava/io/InputStream;
.source "AES256SHA256Decoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder;->decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private cipherInputStream:Ljavax/crypto/CipherInputStream;

.field private isInitialized:Z

.field final synthetic this$0:Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder;

.field final synthetic val$archiveName:Ljava/lang/String;

.field final synthetic val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

.field final synthetic val$in:Ljava/io/InputStream;

.field final synthetic val$passwordBytes:[B


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder;Lorg/apache/commons/compress/archivers/sevenz/Coder;Ljava/lang/String;[BLjava/io/InputStream;)V
    .registers 7

    .prologue
    .line 36
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->this$0:Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder;

    iput-object p2, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    iput-object p3, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$archiveName:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$passwordBytes:[B

    iput-object p5, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$in:Ljava/io/InputStream;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->isInitialized:Z

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    return-void
.end method

.method private init()Ljavax/crypto/CipherInputStream;
    .registers 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->isInitialized:Z

    move/from16 v23, v0

    if-eqz v23, :cond_f

    .line 42
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    move-object/from16 v23, v0

    .line 99
    :goto_e
    return-object v23

    .line 44
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aget-byte v23, v23, v24

    move/from16 v0, v23

    and-int/lit16 v7, v0, 0xff

    .line 45
    .local v7, "byte0":I
    and-int/lit8 v20, v7, 0x3f

    .line 46
    .local v20, "numCyclesPower":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v23, v0

    const/16 v24, 0x1

    aget-byte v23, v23, v24

    move/from16 v0, v23

    and-int/lit16 v8, v0, 0xff

    .line 47
    .local v8, "byte1":I
    shr-int/lit8 v23, v7, 0x6

    and-int/lit8 v23, v23, 0x1

    and-int/lit8 v24, v8, 0xf

    add-int v15, v23, v24

    .line 48
    .local v15, "ivSize":I
    shr-int/lit8 v23, v7, 0x7

    and-int/lit8 v23, v23, 0x1

    shr-int/lit8 v24, v8, 0x4

    add-int v22, v23, v24

    .line 49
    .local v22, "saltSize":I
    add-int/lit8 v23, v22, 0x2

    add-int v23, v23, v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_83

    .line 50
    new-instance v23, Ljava/io/IOException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Salt size + IV size too long in "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$archiveName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 52
    :cond_83
    move/from16 v0, v22

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 53
    .local v21, "salt":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v23, v0

    const/16 v24, 0x2

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    move-object/from16 v2, v21

    move/from16 v3, v25

    move/from16 v4, v22

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 54
    const/16 v23, 0x10

    move/from16 v0, v23

    new-array v14, v0, [B

    .line 55
    .local v14, "iv":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$coder:Lorg/apache/commons/compress/archivers/sevenz/Coder;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    move-object/from16 v23, v0

    add-int/lit8 v24, v22, 0x2

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v14, v2, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 57
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$passwordBytes:[B

    move-object/from16 v23, v0

    if-nez v23, :cond_d9

    .line 58
    new-instance v23, Lorg/apache/commons/compress/PasswordRequiredException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$archiveName:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Lorg/apache/commons/compress/PasswordRequiredException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 61
    :cond_d9
    const/16 v23, 0x3f

    move/from16 v0, v20

    move/from16 v1, v23

    if-ne v0, v1, :cond_161

    .line 62
    const/16 v23, 0x20

    move/from16 v0, v23

    new-array v6, v0, [B

    .line 63
    .local v6, "aesKeyBytes":[B
    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v22

    invoke-static {v0, v1, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$passwordBytes:[B

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$passwordBytes:[B

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    array-length v0, v6

    move/from16 v26, v0

    sub-int v26, v26, v22

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->min(II)I

    move-result v25

    move-object/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v22

    move/from16 v3, v25

    invoke-static {v0, v1, v6, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    :goto_11d
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    const-string v23, "AES"

    move-object/from16 v0, v23

    invoke-direct {v5, v6, v0}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 95
    .local v5, "aesKey":Ljavax/crypto/SecretKey;
    :try_start_126
    const-string v23, "AES/CBC/NoPadding"

    invoke-static/range {v23 .. v23}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v9

    .line 96
    .local v9, "cipher":Ljavax/crypto/Cipher;
    const/16 v23, 0x2

    new-instance v24, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v24

    invoke-direct {v0, v14}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v9, v0, v5, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 97
    new-instance v23, Ljavax/crypto/CipherInputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$in:Ljava/io/InputStream;

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-direct {v0, v1, v9}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    .line 98
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->isInitialized:Z

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    move-object/from16 v23, v0
    :try_end_15f
    .catch Ljava/security/GeneralSecurityException; {:try_start_126 .. :try_end_15f} :catch_1c2

    goto/16 :goto_e

    .line 69
    .end local v5    # "aesKey":Ljavax/crypto/SecretKey;
    .end local v6    # "aesKeyBytes":[B
    .end local v9    # "cipher":Ljavax/crypto/Cipher;
    :cond_161
    :try_start_161
    const-string v23, "SHA-256"

    invoke-static/range {v23 .. v23}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_166
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_161 .. :try_end_166} :catch_1a9

    move-result-object v10

    .line 78
    .local v10, "digest":Ljava/security/MessageDigest;
    const/16 v23, 0x8

    move/from16 v0, v23

    new-array v11, v0, [B

    .line 79
    .local v11, "extra":[B
    const-wide/16 v16, 0x0

    .local v16, "j":J
    :goto_16f
    const-wide/16 v23, 0x1

    shl-long v23, v23, v20

    cmp-long v23, v16, v23

    if-gez v23, :cond_1bc

    .line 80
    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 81
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->val$passwordBytes:[B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v10, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 82
    invoke-virtual {v10, v11}, Ljava/security/MessageDigest;->update([B)V

    .line 83
    const/16 v18, 0x0

    .local v18, "k":I
    :goto_18c
    array-length v0, v11

    move/from16 v23, v0

    move/from16 v0, v18

    move/from16 v1, v23

    if-ge v0, v1, :cond_1a4

    .line 84
    aget-byte v23, v11, v18

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    int-to-byte v0, v0

    move/from16 v23, v0

    aput-byte v23, v11, v18

    .line 85
    aget-byte v23, v11, v18

    if-eqz v23, :cond_1b9

    .line 79
    :cond_1a4
    const-wide/16 v23, 0x1

    add-long v16, v16, v23

    goto :goto_16f

    .line 70
    .end local v10    # "digest":Ljava/security/MessageDigest;
    .end local v11    # "extra":[B
    .end local v16    # "j":J
    .end local v18    # "k":I
    :catch_1a9
    move-exception v19

    .line 71
    .local v19, "noSuchAlgorithmException":Ljava/security/NoSuchAlgorithmException;
    new-instance v13, Ljava/io/IOException;

    const-string v23, "SHA-256 is unsupported by your Java implementation"

    move-object/from16 v0, v23

    invoke-direct {v13, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 72
    .local v13, "ioe":Ljava/io/IOException;
    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 73
    throw v13

    .line 83
    .end local v13    # "ioe":Ljava/io/IOException;
    .end local v19    # "noSuchAlgorithmException":Ljava/security/NoSuchAlgorithmException;
    .restart local v10    # "digest":Ljava/security/MessageDigest;
    .restart local v11    # "extra":[B
    .restart local v16    # "j":J
    .restart local v18    # "k":I
    :cond_1b9
    add-int/lit8 v18, v18, 0x1

    goto :goto_18c

    .line 90
    .end local v18    # "k":I
    :cond_1bc
    invoke-virtual {v10}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    .restart local v6    # "aesKeyBytes":[B
    goto/16 :goto_11d

    .line 100
    .end local v10    # "digest":Ljava/security/MessageDigest;
    .end local v11    # "extra":[B
    .end local v16    # "j":J
    .restart local v5    # "aesKey":Ljavax/crypto/SecretKey;
    :catch_1c2
    move-exception v12

    .line 101
    .local v12, "generalSecurityException":Ljava/security/GeneralSecurityException;
    new-instance v13, Ljava/io/IOException;

    const-string v23, "Decryption error (do you have the JCE Unlimited Strength Jurisdiction Policy Files installed?)"

    move-object/from16 v0, v23

    invoke-direct {v13, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 103
    .restart local v13    # "ioe":Ljava/io/IOException;
    invoke-virtual {v13, v12}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 104
    throw v13
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 124
    return-void
.end method

.method public read()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->init()Ljavax/crypto/CipherInputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/crypto/CipherInputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder$1;->init()Ljavax/crypto/CipherInputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljavax/crypto/CipherInputStream;->read([BII)I

    move-result v0

    return v0
.end method
