.class public Lcom/jcraft/jsch/KeyPairPKCS8;
.super Lcom/jcraft/jsch/KeyPair;
.source "KeyPairPKCS8.java"


# static fields
.field private static final aes128cbc:[B

.field private static final aes192cbc:[B

.field private static final aes256cbc:[B

.field private static final begin:[B

.field private static final dsaEncryption:[B

.field private static final end:[B

.field private static final pbeWithMD5AndDESCBC:[B

.field private static final pbes2:[B

.field private static final pbkdf2:[B

.field private static final rsaEncryption:[B


# instance fields
.field private kpair:Lcom/jcraft/jsch/KeyPair;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x9

    .line 36
    new-array v0, v1, [B

    fill-array-data v0, :array_4c

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->rsaEncryption:[B

    .line 41
    const/4 v0, 0x7

    new-array v0, v0, [B

    fill-array-data v0, :array_56

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->dsaEncryption:[B

    .line 46
    new-array v0, v1, [B

    fill-array-data v0, :array_5e

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->pbes2:[B

    .line 51
    new-array v0, v1, [B

    fill-array-data v0, :array_68

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->pbkdf2:[B

    .line 56
    new-array v0, v1, [B

    fill-array-data v0, :array_72

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->aes128cbc:[B

    .line 61
    new-array v0, v1, [B

    fill-array-data v0, :array_7c

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->aes192cbc:[B

    .line 66
    new-array v0, v1, [B

    fill-array-data v0, :array_86

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->aes256cbc:[B

    .line 71
    new-array v0, v1, [B

    fill-array-data v0, :array_90

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->pbeWithMD5AndDESCBC:[B

    .line 85
    const-string v0, "-----BEGIN DSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->begin:[B

    .line 86
    const-string v0, "-----END DSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->end:[B

    return-void

    .line 36
    :array_4c
    .array-data 1
        0x2at
        -0x7at
        0x48t
        -0x7at
        -0x9t
        0xdt
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 41
    nop

    :array_56
    .array-data 1
        0x2at
        -0x7at
        0x48t
        -0x32t
        0x38t
        0x4t
        0x1t
    .end array-data

    .line 46
    :array_5e
    .array-data 1
        0x2at
        -0x7at
        0x48t
        -0x7at
        -0x9t
        0xdt
        0x1t
        0x5t
        0xdt
    .end array-data

    .line 51
    nop

    :array_68
    .array-data 1
        0x2at
        -0x7at
        0x48t
        -0x7at
        -0x9t
        0xdt
        0x1t
        0x5t
        0xct
    .end array-data

    .line 56
    nop

    :array_72
    .array-data 1
        0x60t
        -0x7at
        0x48t
        0x1t
        0x65t
        0x3t
        0x4t
        0x1t
        0x2t
    .end array-data

    .line 61
    nop

    :array_7c
    .array-data 1
        0x60t
        -0x7at
        0x48t
        0x1t
        0x65t
        0x3t
        0x4t
        0x1t
        0x16t
    .end array-data

    .line 66
    nop

    :array_86
    .array-data 1
        0x60t
        -0x7at
        0x48t
        0x1t
        0x65t
        0x3t
        0x4t
        0x1t
        0x2at
    .end array-data

    .line 71
    nop

    :array_90
    .array-data 1
        0x2at
        -0x7at
        0x48t
        -0x7at
        -0x9t
        0xdt
        0x1t
        0x5t
        0x3t
    .end array-data
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .registers 3
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/KeyPair;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    .line 80
    return-void
.end method


# virtual methods
.method public decrypt([B)Z
    .registers 27
    .param p1, "_passphrase"    # [B

    .prologue
    .line 222
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/KeyPairPKCS8;->isEncrypted()Z

    move-result v5

    if-nez v5, :cond_8

    .line 223
    const/4 v5, 0x1

    .line 330
    :goto_7
    return v5

    .line 225
    :cond_8
    if-nez p1, :cond_14

    .line 226
    invoke-virtual/range {p0 .. p0}, Lcom/jcraft/jsch/KeyPairPKCS8;->isEncrypted()Z

    move-result v5

    if-nez v5, :cond_12

    const/4 v5, 0x1

    goto :goto_7

    :cond_12
    const/4 v5, 0x0

    goto :goto_7

    .line 257
    :cond_14
    const/4 v11, 0x0

    .line 258
    .local v11, "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    :try_start_15
    new-instance v9, Lcom/jcraft/jsch/KeyPair$ASN1;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->data:[B

    move-object/from16 v0, p0

    invoke-direct {v9, v0, v5}, Lcom/jcraft/jsch/KeyPair$ASN1;-><init>(Lcom/jcraft/jsch/KeyPair;[B)V

    .line 260
    .local v9, "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual {v9}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 262
    const/4 v5, 0x1

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v4

    .line 264
    .local v4, "_data":[B
    const/4 v5, 0x0

    aget-object v17, v11, v5

    .line 265
    .local v17, "pbes":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual/range {v17 .. v17}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 266
    const/4 v5, 0x0

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v18

    .line 267
    .local v18, "pbesid":[B
    const/4 v5, 0x1

    aget-object v19, v11, v5

    .line 269
    .local v19, "pbesparam":Lcom/jcraft/jsch/KeyPair$ASN1;
    const/16 v23, 0x0

    .line 270
    .local v23, "salt":[B
    const/4 v14, 0x0

    .line 271
    .local v14, "iterations":I
    const/4 v15, 0x0

    .line 272
    .local v15, "iv":[B
    const/4 v13, 0x0

    .line 274
    .local v13, "encryptfuncid":[B
    sget-object v5, Lcom/jcraft/jsch/KeyPairPKCS8;->pbes2:[B

    move-object/from16 v0, v18

    invoke-static {v0, v5}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v5

    if-eqz v5, :cond_9f

    .line 275
    invoke-virtual/range {v19 .. v19}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 276
    const/4 v5, 0x0

    aget-object v20, v11, v5

    .line 277
    .local v20, "pbkdf":Lcom/jcraft/jsch/KeyPair$ASN1;
    const/4 v5, 0x1

    aget-object v12, v11, v5

    .line 278
    .local v12, "encryptfunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual/range {v20 .. v20}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 279
    const/4 v5, 0x0

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v22

    .line 280
    .local v22, "pbkdfid":[B
    const/4 v5, 0x1

    aget-object v21, v11, v5

    .line 281
    .local v21, "pbkdffunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual/range {v21 .. v21}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 282
    const/4 v5, 0x0

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v23

    .line 283
    new-instance v5, Ljava/math/BigInteger;

    const/4 v6, 0x1

    aget-object v6, v11, v6

    invoke-virtual {v6}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v5}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 286
    invoke-virtual {v12}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v11

    .line 287
    const/4 v5, 0x0

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v13

    .line 288
    const/4 v5, 0x1

    aget-object v5, v11, v5

    invoke-virtual {v5}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v15

    .line 298
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/jcraft/jsch/KeyPairPKCS8;->getCipher([B)Lcom/jcraft/jsch/Cipher;

    move-result-object v3

    .line 299
    .local v3, "cipher":Lcom/jcraft/jsch/Cipher;
    if-nez v3, :cond_af

    const/4 v5, 0x0

    goto/16 :goto_7

    .line 290
    .end local v3    # "cipher":Lcom/jcraft/jsch/Cipher;
    .end local v12    # "encryptfunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v20    # "pbkdf":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v21    # "pbkdffunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v22    # "pbkdfid":[B
    :cond_9f
    sget-object v5, Lcom/jcraft/jsch/KeyPairPKCS8;->pbeWithMD5AndDESCBC:[B

    move-object/from16 v0, v18

    invoke-static {v0, v5}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z
    :try_end_a6
    .catch Lcom/jcraft/jsch/KeyPair$ASN1Exception; {:try_start_15 .. :try_end_a6} :catch_103
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_a6} :catch_ff

    move-result v5

    if-eqz v5, :cond_ac

    .line 292
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 295
    :cond_ac
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 301
    .restart local v3    # "cipher":Lcom/jcraft/jsch/Cipher;
    .restart local v12    # "encryptfunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v20    # "pbkdf":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v21    # "pbkdffunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v22    # "pbkdfid":[B
    :cond_af
    const/16 v16, 0x0

    .line 303
    .local v16, "key":[B
    :try_start_b1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v5, "pbkdf"

    invoke-static {v5}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 304
    .local v10, "c":Ljava/lang/Class;
    invoke-virtual {v10}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/PBKDF;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/PBKDF;

    move-object/from16 v24, v0

    .line 305
    .local v24, "tmp":Lcom/jcraft/jsch/PBKDF;
    invoke-interface {v3}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v5

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2, v14, v5}, Lcom/jcraft/jsch/PBKDF;->getKey([B[BII)[B
    :try_end_d7
    .catch Ljava/lang/Exception; {:try_start_b1 .. :try_end_d7} :catch_105
    .catch Lcom/jcraft/jsch/KeyPair$ASN1Exception; {:try_start_b1 .. :try_end_d7} :catch_103

    move-result-object v16

    .line 310
    .end local v10    # "c":Ljava/lang/Class;
    .end local v24    # "tmp":Lcom/jcraft/jsch/PBKDF;
    :goto_d8
    if-nez v16, :cond_dd

    .line 311
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 314
    :cond_dd
    const/4 v5, 0x1

    :try_start_de
    move-object/from16 v0, v16

    invoke-interface {v3, v5, v0, v15}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 315
    invoke-static/range {v16 .. v16}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 316
    array-length v5, v4

    new-array v7, v5, [B

    .line 317
    .local v7, "plain":[B
    const/4 v5, 0x0

    array-length v6, v4

    const/4 v8, 0x0

    invoke-interface/range {v3 .. v8}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V

    .line 318
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/jcraft/jsch/KeyPairPKCS8;->parse([B)Z

    move-result v5

    if-eqz v5, :cond_100

    .line 319
    const/4 v5, 0x0

    move-object/from16 v0, p0

    iput-boolean v5, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->encrypted:Z
    :try_end_fc
    .catch Lcom/jcraft/jsch/KeyPair$ASN1Exception; {:try_start_de .. :try_end_fc} :catch_103
    .catch Ljava/lang/Exception; {:try_start_de .. :try_end_fc} :catch_ff

    .line 320
    const/4 v5, 0x1

    goto/16 :goto_7

    .line 326
    .end local v3    # "cipher":Lcom/jcraft/jsch/Cipher;
    .end local v4    # "_data":[B
    .end local v7    # "plain":[B
    .end local v9    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v12    # "encryptfunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v13    # "encryptfuncid":[B
    .end local v14    # "iterations":I
    .end local v15    # "iv":[B
    .end local v16    # "key":[B
    .end local v17    # "pbes":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v18    # "pbesid":[B
    .end local v19    # "pbesparam":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v20    # "pbkdf":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v21    # "pbkdffunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v22    # "pbkdfid":[B
    .end local v23    # "salt":[B
    :catch_ff
    move-exception v5

    .line 330
    :cond_100
    :goto_100
    const/4 v5, 0x0

    goto/16 :goto_7

    .line 323
    :catch_103
    move-exception v5

    goto :goto_100

    .line 307
    .restart local v3    # "cipher":Lcom/jcraft/jsch/Cipher;
    .restart local v4    # "_data":[B
    .restart local v9    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v12    # "encryptfunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v13    # "encryptfuncid":[B
    .restart local v14    # "iterations":I
    .restart local v15    # "iv":[B
    .restart local v16    # "key":[B
    .restart local v17    # "pbes":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v18    # "pbesid":[B
    .restart local v19    # "pbesparam":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v20    # "pbkdf":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v21    # "pbkdffunc":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v22    # "pbkdfid":[B
    .restart local v23    # "salt":[B
    :catch_105
    move-exception v5

    goto :goto_d8
.end method

.method public forSSHAgent()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->forSSHAgent()[B

    move-result-object v0

    return-object v0
.end method

.method generate(I)V
    .registers 2
    .param p1, "key_size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 83
    return-void
.end method

.method getBegin()[B
    .registers 2

    .prologue
    .line 88
    sget-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->begin:[B

    return-object v0
.end method

.method getCipher([B)Lcom/jcraft/jsch/Cipher;
    .registers 12
    .param p1, "id"    # [B

    .prologue
    const/4 v9, 0x4

    .line 334
    const/4 v2, 0x0

    .line 335
    .local v2, "cipher":Lcom/jcraft/jsch/Cipher;
    const/4 v5, 0x0

    .line 337
    .local v5, "name":Ljava/lang/String;
    :try_start_3
    sget-object v6, Lcom/jcraft/jsch/KeyPairPKCS8;->aes128cbc:[B

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v6

    if-eqz v6, :cond_22

    .line 338
    const-string v5, "aes128-cbc"

    .line 346
    :cond_d
    :goto_d
    iget-object v6, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-static {v5}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 347
    .local v1, "c":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/jcraft/jsch/Cipher;

    move-object v0, v6

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v2, v0

    .line 361
    .end local v1    # "c":Ljava/lang/Class;
    :cond_21
    :goto_21
    return-object v2

    .line 340
    :cond_22
    sget-object v6, Lcom/jcraft/jsch/KeyPairPKCS8;->aes192cbc:[B

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 341
    const-string v5, "aes192-cbc"

    goto :goto_d

    .line 343
    :cond_2d
    sget-object v6, Lcom/jcraft/jsch/KeyPairPKCS8;->aes256cbc:[B

    invoke-static {p1, v6}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 344
    const-string v5, "aes256-cbc"
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_37} :catch_38

    goto :goto_d

    .line 349
    :catch_38
    move-exception v3

    .line 350
    .local v3, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v6

    invoke-interface {v6, v9}, Lcom/jcraft/jsch/Logger;->isEnabled(I)Z

    move-result v6

    if-eqz v6, :cond_21

    .line 351
    const-string v4, ""

    .line 352
    .local v4, "message":Ljava/lang/String;
    if-nez v5, :cond_79

    .line 353
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "unknown oid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p1}, Lcom/jcraft/jsch/Util;->toHex([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 358
    :goto_5e
    invoke-static {}, Lcom/jcraft/jsch/JSch;->getLogger()Lcom/jcraft/jsch/Logger;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "PKCS8: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v9, v7}, Lcom/jcraft/jsch/Logger;->log(ILjava/lang/String;)V

    goto :goto_21

    .line 356
    :cond_79
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "function "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " is not supported"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_5e
.end method

.method getEnd()[B
    .registers 2

    .prologue
    .line 89
    sget-object v0, Lcom/jcraft/jsch/KeyPairPKCS8;->end:[B

    return-object v0
.end method

.method public getKeySize()I
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->getKeySize()I

    move-result v0

    return v0
.end method

.method public getKeyType()I
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->getKeyType()I

    move-result v0

    return v0
.end method

.method getKeyTypeName()[B
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->getKeyTypeName()[B

    move-result-object v0

    return-object v0
.end method

.method getPrivateKey()[B
    .registers 2

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPublicKeyBlob()[B
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v0

    return-object v0
.end method

.method public getSignature([B)[B
    .registers 3
    .param p1, "data"    # [B

    .prologue
    .line 210
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0, p1}, Lcom/jcraft/jsch/KeyPair;->getSignature([B)[B

    move-result-object v0

    return-object v0
.end method

.method public getVerifier()Lcom/jcraft/jsch/Signature;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    invoke-virtual {v0}, Lcom/jcraft/jsch/KeyPair;->getVerifier()Lcom/jcraft/jsch/Signature;

    move-result-object v0

    return-object v0
.end method

.method parse([B)Z
    .registers 24
    .param p1, "plain"    # [B

    .prologue
    .line 112
    :try_start_0
    new-instance v19, Ljava/util/Vector;

    invoke-direct/range {v19 .. v19}, Ljava/util/Vector;-><init>()V

    .line 114
    .local v19, "values":Ljava/util/Vector;
    const/4 v13, 0x0

    .line 115
    .local v13, "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    new-instance v11, Lcom/jcraft/jsch/KeyPair$ASN1;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v11, v0, v1}, Lcom/jcraft/jsch/KeyPair$ASN1;-><init>(Lcom/jcraft/jsch/KeyPair;[B)V

    .line 116
    .local v11, "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual {v11}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v13

    .line 118
    const/4 v3, 0x1

    aget-object v17, v13, v3

    .line 119
    .local v17, "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    const/4 v3, 0x2

    aget-object v16, v13, v3

    .line 121
    .local v16, "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual/range {v17 .. v17}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v13

    .line 122
    const/4 v3, 0x0

    aget-object v3, v13, v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v18

    .line 123
    .local v18, "privateKeyAlgorithmID":[B
    const/4 v3, 0x1

    aget-object v3, v13, v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v13

    .line 124
    array-length v3, v13

    if-lez v3, :cond_40

    .line 125
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_2f
    array-length v3, v13

    if-ge v15, v3, :cond_40

    .line 126
    aget-object v3, v13, v15

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 125
    add-int/lit8 v15, v15, 0x1

    goto :goto_2f

    .line 130
    .end local v15    # "i":I
    :cond_40
    invoke-virtual/range {v16 .. v16}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v9

    .line 132
    .local v9, "_data":[B
    const/4 v10, 0x0

    .line 133
    .local v10, "_kpair":Lcom/jcraft/jsch/KeyPair;
    sget-object v3, Lcom/jcraft/jsch/KeyPairPKCS8;->rsaEncryption:[B

    move-object/from16 v0, v18

    invoke-static {v0, v3}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 134
    new-instance v10, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-direct {v10, v3}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 135
    .restart local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Lcom/jcraft/jsch/KeyPair;->copy(Lcom/jcraft/jsch/KeyPair;)V

    .line 136
    invoke-virtual {v10, v9}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 137
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;
    :try_end_67
    .catch Lcom/jcraft/jsch/KeyPair$ASN1Exception; {:try_start_0 .. :try_end_67} :catch_12b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_67} :catch_13a

    .line 195
    :cond_67
    :goto_67
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    if-eqz v3, :cond_13e

    const/4 v3, 0x1

    .end local v9    # "_data":[B
    .end local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .end local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v18    # "privateKeyAlgorithmID":[B
    .end local v19    # "values":Ljava/util/Vector;
    :goto_6e
    return v3

    .line 140
    .restart local v9    # "_data":[B
    .restart local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .restart local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v18    # "privateKeyAlgorithmID":[B
    .restart local v19    # "values":Ljava/util/Vector;
    :cond_6f
    :try_start_6f
    sget-object v3, Lcom/jcraft/jsch/KeyPairPKCS8;->dsaEncryption:[B

    move-object/from16 v0, v18

    invoke-static {v0, v3}, Lcom/jcraft/jsch/Util;->array_equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 141
    new-instance v11, Lcom/jcraft/jsch/KeyPair$ASN1;

    .end local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    move-object/from16 v0, p0

    invoke-direct {v11, v0, v9}, Lcom/jcraft/jsch/KeyPair$ASN1;-><init>(Lcom/jcraft/jsch/KeyPair;[B)V

    .line 142
    .restart local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    invoke-virtual/range {v19 .. v19}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_12f

    .line 151
    invoke-virtual {v11}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v13

    .line 152
    const/4 v3, 0x1

    aget-object v3, v13, v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v12

    .line 153
    .local v12, "bar":[B
    const/4 v3, 0x0

    aget-object v3, v13, v3

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContents()[Lcom/jcraft/jsch/KeyPair$ASN1;

    move-result-object v13

    .line 154
    const/4 v15, 0x0

    .restart local v15    # "i":I
    :goto_99
    array-length v3, v13

    if-ge v15, v3, :cond_aa

    .line 155
    aget-object v3, v13, v15

    invoke-virtual {v3}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 154
    add-int/lit8 v15, v15, 0x1

    goto :goto_99

    .line 157
    :cond_aa
    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 166
    .end local v12    # "bar":[B
    .end local v15    # "i":I
    :goto_af
    const/4 v3, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v4, v0

    .line 167
    .local v4, "P_array":[B
    const/4 v3, 0x1

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v5, v0

    .line 168
    .local v5, "Q_array":[B
    const/4 v3, 0x2

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v6, v0

    .line 169
    .local v6, "G_array":[B
    const/4 v3, 0x3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v8, v0

    .line 171
    .local v8, "prv_array":[B
    new-instance v3, Ljava/math/BigInteger;

    invoke-direct {v3, v6}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v20, Ljava/math/BigInteger;

    move-object/from16 v0, v20

    invoke-direct {v0, v8}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v21, Ljava/math/BigInteger;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Ljava/math/BigInteger;-><init>([B)V

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v3, v0, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v7

    .line 176
    .local v7, "pub_array":[B
    new-instance v2, Lcom/jcraft/jsch/KeyPairDSA;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-direct/range {v2 .. v8}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V

    .line 179
    .local v2, "_key":Lcom/jcraft/jsch/KeyPairDSA;
    invoke-virtual {v2}, Lcom/jcraft/jsch/KeyPairDSA;->getPrivateKey()[B

    move-result-object p1

    .line 181
    new-instance v10, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->jsch:Lcom/jcraft/jsch/JSch;

    invoke-direct {v10, v3}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 182
    .restart local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Lcom/jcraft/jsch/KeyPair;->copy(Lcom/jcraft/jsch/KeyPair;)V

    .line 183
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v3

    if-eqz v3, :cond_67

    .line 184
    move-object/from16 v0, p0

    iput-object v10, v0, Lcom/jcraft/jsch/KeyPairPKCS8;->kpair:Lcom/jcraft/jsch/KeyPair;

    goto/16 :goto_67

    .line 188
    .end local v2    # "_key":Lcom/jcraft/jsch/KeyPairDSA;
    .end local v4    # "P_array":[B
    .end local v5    # "Q_array":[B
    .end local v6    # "G_array":[B
    .end local v7    # "pub_array":[B
    .end local v8    # "prv_array":[B
    .end local v9    # "_data":[B
    .end local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .end local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v18    # "privateKeyAlgorithmID":[B
    .end local v19    # "values":Ljava/util/Vector;
    :catch_12b
    move-exception v14

    .line 189
    .local v14, "e":Lcom/jcraft/jsch/KeyPair$ASN1Exception;
    const/4 v3, 0x0

    goto/16 :goto_6e

    .line 163
    .end local v14    # "e":Lcom/jcraft/jsch/KeyPair$ASN1Exception;
    .restart local v9    # "_data":[B
    .restart local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .restart local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v18    # "privateKeyAlgorithmID":[B
    .restart local v19    # "values":Ljava/util/Vector;
    :cond_12f
    invoke-virtual {v11}, Lcom/jcraft/jsch/KeyPair$ASN1;->getContent()[B

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_138
    .catch Lcom/jcraft/jsch/KeyPair$ASN1Exception; {:try_start_6f .. :try_end_138} :catch_12b
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_138} :catch_13a

    goto/16 :goto_af

    .line 191
    .end local v9    # "_data":[B
    .end local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .end local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .end local v18    # "privateKeyAlgorithmID":[B
    .end local v19    # "values":Ljava/util/Vector;
    :catch_13a
    move-exception v14

    .line 193
    .local v14, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto/16 :goto_6e

    .line 195
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v9    # "_data":[B
    .restart local v10    # "_kpair":Lcom/jcraft/jsch/KeyPair;
    .restart local v11    # "asn1":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v13    # "contents":[Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v16    # "privateKey":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v17    # "privateKeyAlgorithm":Lcom/jcraft/jsch/KeyPair$ASN1;
    .restart local v18    # "privateKeyAlgorithmID":[B
    .restart local v19    # "values":Ljava/util/Vector;
    :cond_13e
    const/4 v3, 0x0

    goto/16 :goto_6e
.end method
