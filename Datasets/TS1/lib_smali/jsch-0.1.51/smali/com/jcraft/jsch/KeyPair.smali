.class public abstract Lcom/jcraft/jsch/KeyPair;
.super Ljava/lang/Object;
.source "KeyPair.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jcraft/jsch/KeyPair$ASN1;,
        Lcom/jcraft/jsch/KeyPair$ASN1Exception;
    }
.end annotation


# static fields
.field public static final DSA:I = 0x1

.field public static final ERROR:I = 0x0

.field public static final RSA:I = 0x2

.field public static final UNKNOWN:I = 0x3

.field static final VENDOR_FSECURE:I = 0x1

.field static final VENDOR_OPENSSH:I = 0x0

.field static final VENDOR_PKCS8:I = 0x3

.field static final VENDOR_PUTTY:I = 0x2

.field private static final cr:[B

.field static header:[[B

.field private static final header1:[Ljava/lang/String;

.field private static final header2:[Ljava/lang/String;

.field private static final header3:[Ljava/lang/String;

.field private static space:[B


# instance fields
.field private cipher:Lcom/jcraft/jsch/Cipher;

.field protected data:[B

.field protected encrypted:Z

.field private hash:Lcom/jcraft/jsch/HASH;

.field private iv:[B

.field jsch:Lcom/jcraft/jsch/JSch;

.field private passphrase:[B

.field protected publicKeyComment:Ljava/lang/String;

.field private publickeyblob:[B

.field private random:Lcom/jcraft/jsch/Random;

.field vendor:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v2, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 50
    const-string v0, "\n"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->cr:[B

    .line 97
    new-array v0, v2, [[B

    const-string v1, "Proc-Type: 4,ENCRYPTED"

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "DEK-Info: DES-EDE3-CBC,"

    invoke-static {v1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v1

    aput-object v1, v0, v4

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header:[[B

    .line 159
    const-string v0, " "

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->space:[B

    .line 927
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "PuTTY-User-Key-File-2: "

    aput-object v1, v0, v3

    const-string v1, "Encryption: "

    aput-object v1, v0, v4

    const-string v1, "Comment: "

    aput-object v1, v0, v2

    const/4 v1, 0x3

    const-string v2, "Public-Lines: "

    aput-object v2, v0, v1

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header1:[Ljava/lang/String;

    .line 934
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Private-Lines: "

    aput-object v1, v0, v3

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header2:[Ljava/lang/String;

    .line 938
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "Private-MAC: "

    aput-object v1, v0, v3

    sput-object v0, Lcom/jcraft/jsch/KeyPair;->header3:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .registers 5
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput v2, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 84
    const-string v0, "no comment"

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    .line 478
    iput-boolean v2, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 479
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->data:[B

    .line 480
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->iv:[B

    .line 481
    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    .line 94
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    .line 95
    return-void
.end method

.method private static a2b(B)B
    .registers 2
    .param p0, "c"    # B

    .prologue
    .line 911
    const/16 v0, 0x30

    if-gt v0, p0, :cond_c

    const/16 v0, 0x39

    if-gt p0, v0, :cond_c

    add-int/lit8 v0, p0, -0x30

    int-to-byte v0, v0

    .line 912
    :goto_b
    return v0

    :cond_c
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    int-to-byte v0, v0

    goto :goto_b
.end method

.method private static b2a(B)B
    .registers 2
    .param p0, "c"    # B

    .prologue
    .line 915
    if-ltz p0, :cond_a

    const/16 v0, 0x9

    if-gt p0, v0, :cond_a

    add-int/lit8 v0, p0, 0x30

    int-to-byte v0, v0

    .line 916
    :goto_9
    return v0

    :cond_a
    add-int/lit8 v0, p0, -0xa

    add-int/lit8 v0, v0, 0x41

    int-to-byte v0, v0

    goto :goto_9
.end method

.method private decrypt([B[B[B)[B
    .registers 11
    .param p1, "data"    # [B
    .param p2, "passphrase"    # [B
    .param p3, "iv"    # [B

    .prologue
    .line 316
    :try_start_0
    invoke-virtual {p0, p2, p3}, Lcom/jcraft/jsch/KeyPair;->genKey([B[B)[B

    move-result-object v6

    .line 317
    .local v6, "key":[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v1, 0x1

    invoke-interface {v0, v1, v6, p3}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 318
    invoke-static {v6}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 319
    array-length v0, p1

    new-array v4, v0, [B

    .line 320
    .local v4, "plain":[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    array-length v3, p1

    const/4 v5, 0x0

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_19} :catch_1a

    .line 326
    .end local v4    # "plain":[B
    .end local v6    # "key":[B
    :goto_19
    return-object v4

    .line 323
    :catch_1a
    move-exception v0

    .line 326
    const/4 v4, 0x0

    goto :goto_19
.end method

.method private encrypt([B[[B[B)[B
    .registers 16
    .param p1, "plain"    # [B
    .param p2, "_iv"    # [[B
    .param p3, "passphrase"    # [B

    .prologue
    const/4 v3, 0x0

    .line 276
    if-nez p3, :cond_4

    .line 308
    .end local p1    # "plain":[B
    :goto_3
    return-object p1

    .line 278
    .restart local p1    # "plain":[B
    :cond_4
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    if-nez v0, :cond_e

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genCipher()Lcom/jcraft/jsch/Cipher;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 279
    :cond_e
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v0

    new-array v9, v0, [B

    aput-object v9, p2, v3

    .line 281
    .local v9, "iv":[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    if-nez v0, :cond_22

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genRandom()Lcom/jcraft/jsch/Random;

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    .line 282
    :cond_22
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    array-length v2, v9

    invoke-interface {v0, v9, v3, v2}, Lcom/jcraft/jsch/Random;->fill([BII)V

    .line 284
    invoke-virtual {p0, p3, v9}, Lcom/jcraft/jsch/KeyPair;->genKey([B[B)[B

    move-result-object v10

    .line 285
    .local v10, "key":[B
    move-object v1, p1

    .line 290
    .local v1, "encoded":[B
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v0}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v6

    .line 291
    .local v6, "bsize":I
    array-length v0, v1

    div-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x1

    mul-int/2addr v0, v6

    new-array v7, v0, [B

    .line 292
    .local v7, "foo":[B
    array-length v0, v1

    invoke-static {v1, v3, v7, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 293
    array-length v0, v1

    rem-int/2addr v0, v6

    sub-int v11, v6, v0

    .line 294
    .local v11, "padding":I
    array-length v0, v7

    add-int/lit8 v8, v0, -0x1

    .local v8, "i":I
    :goto_45
    array-length v0, v7

    sub-int/2addr v0, v11

    if-gt v0, v8, :cond_4f

    .line 295
    int-to-byte v0, v11

    aput-byte v0, v7, v8

    .line 294
    add-int/lit8 v8, v8, -0x1

    goto :goto_45

    .line 297
    :cond_4f
    move-object v1, v7

    .line 301
    :try_start_50
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    invoke-interface {v0, v2, v10, v9}, Lcom/jcraft/jsch/Cipher;->init(I[B[B)V

    .line 302
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    const/4 v2, 0x0

    array-length v3, v1

    const/4 v5, 0x0

    move-object v4, v1

    invoke-interface/range {v0 .. v5}, Lcom/jcraft/jsch/Cipher;->update([BII[BI)V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_5f} :catch_64

    .line 307
    :goto_5f
    invoke-static {v10}, Lcom/jcraft/jsch/Util;->bzero([B)V

    move-object p1, v1

    .line 308
    goto :goto_3

    .line 304
    :catch_64
    move-exception v0

    goto :goto_5f
.end method

.method private genCipher()Lcom/jcraft/jsch/Cipher;
    .registers 3

    .prologue
    .line 392
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v1, "3des-cbc"

    invoke-static {v1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 393
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jcraft/jsch/Cipher;

    check-cast v1, Lcom/jcraft/jsch/Cipher;

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_16} :catch_19

    .line 397
    .end local v0    # "c":Ljava/lang/Class;
    :goto_16
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    return-object v1

    .line 395
    :catch_19
    move-exception v1

    goto :goto_16
.end method

.method private genHash()Lcom/jcraft/jsch/HASH;
    .registers 3

    .prologue
    .line 381
    :try_start_0
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v1, "md5"

    invoke-static {v1}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 382
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jcraft/jsch/HASH;

    check-cast v1, Lcom/jcraft/jsch/HASH;

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 383
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v1}, Lcom/jcraft/jsch/HASH;->init()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b} :catch_1e

    .line 387
    .end local v0    # "c":Ljava/lang/Class;
    :goto_1b
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    return-object v1

    .line 385
    :catch_1e
    move-exception v1

    goto :goto_1b
.end method

.method public static genKeyPair(Lcom/jcraft/jsch/JSch;I)Lcom/jcraft/jsch/KeyPair;
    .registers 3
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 53
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->genKeyPair(Lcom/jcraft/jsch/JSch;II)Lcom/jcraft/jsch/KeyPair;

    move-result-object v0

    return-object v0
.end method

.method public static genKeyPair(Lcom/jcraft/jsch/JSch;II)Lcom/jcraft/jsch/KeyPair;
    .registers 5
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "type"    # I
    .param p2, "key_size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 56
    const/4 v0, 0x0

    .line 57
    .local v0, "kpair":Lcom/jcraft/jsch/KeyPair;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_f

    new-instance v0, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v0    # "kpair":Lcom/jcraft/jsch/KeyPair;
    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 59
    .restart local v0    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :cond_9
    :goto_9
    if-eqz v0, :cond_e

    .line 60
    invoke-virtual {v0, p2}, Lcom/jcraft/jsch/KeyPair;->generate(I)V

    .line 62
    :cond_e
    return-object v0

    .line 58
    :cond_f
    const/4 v1, 0x2

    if-ne p1, v1, :cond_9

    new-instance v0, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v0    # "kpair":Lcom/jcraft/jsch/KeyPair;
    invoke-direct {v0, p0}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .restart local v0    # "kpair":Lcom/jcraft/jsch/KeyPair;
    goto :goto_9
.end method

.method private genRandom()Lcom/jcraft/jsch/Random;
    .registers 6

    .prologue
    .line 369
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    if-nez v2, :cond_1a

    .line 371
    :try_start_4
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v2, "random"

    invoke-static {v2}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 372
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jcraft/jsch/Random;

    check-cast v2, Lcom/jcraft/jsch/Random;

    iput-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_1a} :catch_1d

    .line 376
    .end local v0    # "c":Ljava/lang/Class;
    :cond_1a
    :goto_1a
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPair;->random:Lcom/jcraft/jsch/Random;

    return-object v2

    .line 374
    :catch_1d
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connect: random "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1a
.end method

.method public static load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;
    .registers 5
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "prvkey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 510
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".pub"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 511
    .local v0, "pubkey":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 512
    const/4 v0, 0x0

    .line 514
    :cond_1f
    invoke-static {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v1

    return-object v1
.end method

.method public static load(Lcom/jcraft/jsch/JSch;Ljava/lang/String;Ljava/lang/String;)Lcom/jcraft/jsch/KeyPair;
    .registers 9
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "prvfile"    # Ljava/lang/String;
    .param p2, "pubfile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 518
    const/4 v2, 0x0

    .line 519
    .local v2, "prvkey":[B
    const/4 v3, 0x0

    .line 522
    .local v3, "pubkey":[B
    :try_start_2
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->fromFile(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_28

    move-result-object v2

    .line 528
    move-object v0, p2

    .line 529
    .local v0, "_pubfile":Ljava/lang/String;
    if-nez p2, :cond_1c

    .line 530
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".pub"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 534
    :cond_1c
    :try_start_1c
    invoke-static {v0}, Lcom/jcraft/jsch/Util;->fromFile(Ljava/lang/String;)[B
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1f} :catch_33

    move-result-object v3

    .line 543
    :cond_20
    :try_start_20
    invoke-static {p0, v2, v3}, Lcom/jcraft/jsch/KeyPair;->load(Lcom/jcraft/jsch/JSch;[B[B)Lcom/jcraft/jsch/KeyPair;
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_40

    move-result-object v4

    .line 546
    invoke-static {v2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    return-object v4

    .line 524
    .end local v0    # "_pubfile":Ljava/lang/String;
    :catch_28
    move-exception v1

    .line 525
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 536
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "_pubfile":Ljava/lang/String;
    :catch_33
    move-exception v1

    .line 537
    .restart local v1    # "e":Ljava/io/IOException;
    if-eqz p2, :cond_20

    .line 538
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 546
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_40
    move-exception v4

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->bzero([B)V

    throw v4
.end method

.method public static load(Lcom/jcraft/jsch/JSch;[B[B)Lcom/jcraft/jsch/KeyPair;
    .registers 41
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "prvkey"    # [B
    .param p2, "pubkey"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 552
    const/16 v33, 0x8

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 553
    .local v19, "iv":[B
    const/4 v13, 0x1

    .line 554
    .local v13, "encrypted":Z
    const/4 v11, 0x0

    .line 556
    .local v11, "data":[B
    const/16 v26, 0x0

    .line 558
    .local v26, "publickeyblob":[B
    const/16 v29, 0x0

    .line 559
    .local v29, "type":I
    const/16 v31, 0x0

    .line 560
    .local v31, "vendor":I
    const-string v24, ""

    .line 561
    .local v24, "publicKeyComment":Ljava/lang/String;
    const/4 v10, 0x0

    .line 564
    .local v10, "cipher":Lcom/jcraft/jsch/Cipher;
    if-nez p2, :cond_af

    if-eqz p1, :cond_af

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v33, v0

    const/16 v34, 0xb

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_af

    const/16 v33, 0x0

    aget-byte v33, p1, v33

    if-nez v33, :cond_af

    const/16 v33, 0x1

    aget-byte v33, p1, v33

    if-nez v33, :cond_af

    const/16 v33, 0x2

    aget-byte v33, p1, v33

    if-nez v33, :cond_af

    const/16 v33, 0x3

    aget-byte v33, p1, v33

    const/16 v34, 0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_af

    .line 569
    new-instance v8, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-direct {v8, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 570
    .local v8, "buf":Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    invoke-virtual {v8, v0}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 571
    new-instance v7, Ljava/lang/String;

    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v33

    move-object/from16 v0, v33

    invoke-direct {v7, v0}, Ljava/lang/String;-><init>([B)V

    .line 572
    .local v7, "_type":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/jcraft/jsch/Buffer;->rewind()V

    .line 574
    const/16 v21, 0x0

    .line 575
    .local v21, "kpair":Lcom/jcraft/jsch/KeyPair;
    const-string v33, "ssh-rsa"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_74

    .line 576
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPairRSA;->fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v21

    .line 907
    .end local v7    # "_type":Ljava/lang/String;
    .end local v8    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :cond_73
    :goto_73
    return-object v21

    .line 578
    .restart local v7    # "_type":Ljava/lang/String;
    .restart local v8    # "buf":Lcom/jcraft/jsch/Buffer;
    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :cond_74
    const-string v33, "ssh-dss"

    move-object/from16 v0, v33

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_85

    .line 579
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPairDSA;->fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;

    move-result-object v21

    goto :goto_73

    .line 582
    :cond_85
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: invalid key "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    new-instance v35, Ljava/lang/String;

    const/16 v36, 0x4

    const/16 v37, 0x7

    move-object/from16 v0, v35

    move-object/from16 v1, p1

    move/from16 v2, v36

    move/from16 v3, v37

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 588
    .end local v7    # "_type":Ljava/lang/String;
    .end local v8    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :cond_af
    move-object/from16 v8, p1

    .line 590
    .local v8, "buf":[B
    if-eqz v8, :cond_be

    .line 591
    :try_start_b3
    move-object/from16 v0, p0

    invoke-static {v0, v8}, Lcom/jcraft/jsch/KeyPair;->loadPPK(Lcom/jcraft/jsch/JSch;[B)Lcom/jcraft/jsch/KeyPair;

    move-result-object v23

    .line 592
    .local v23, "ppk":Lcom/jcraft/jsch/KeyPair;
    if-eqz v23, :cond_be

    move-object/from16 v21, v23

    .line 593
    goto :goto_73

    .line 596
    .end local v23    # "ppk":Lcom/jcraft/jsch/KeyPair;
    :cond_be
    if-eqz v8, :cond_175

    array-length v0, v8

    move/from16 v22, v0

    .line 597
    .local v22, "len":I
    :goto_c3
    const/4 v15, 0x0

    .line 600
    .local v15, "i":I
    :goto_c4
    move/from16 v0, v22

    if-ge v15, v0, :cond_10a

    .line 601
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_179

    add-int/lit8 v33, v15, 0x4

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_179

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_179

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_179

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_179

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_179

    .line 609
    :cond_10a
    :goto_10a
    move/from16 v0, v22

    if-ge v15, v0, :cond_5ba

    .line 610
    aget-byte v33, v8, v15

    const/16 v34, 0x42

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2eb

    add-int/lit8 v33, v15, 0x3

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_2eb

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2eb

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x47

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2eb

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x49

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2eb

    .line 611
    add-int/lit8 v15, v15, 0x6

    .line 612
    add-int/lit8 v33, v15, 0x2

    move/from16 v0, v33

    move/from16 v1, v22

    if-lt v0, v1, :cond_17d

    .line 613
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33
    :try_end_16b
    .catch Ljava/lang/Exception; {:try_start_b3 .. :try_end_16b} :catch_16b

    .line 872
    .end local v15    # "i":I
    .end local v22    # "len":I
    :catch_16b
    move-exception v12

    .line 873
    .local v12, "e":Ljava/lang/Exception;
    instance-of v0, v12, Lcom/jcraft/jsch/JSchException;

    move/from16 v33, v0

    if-eqz v33, :cond_9bc

    check-cast v12, Lcom/jcraft/jsch/JSchException;

    .end local v12    # "e":Ljava/lang/Exception;
    throw v12

    .line 596
    :cond_175
    const/16 v22, 0x0

    goto/16 :goto_c3

    .line 606
    .restart local v15    # "i":I
    .restart local v22    # "len":I
    :cond_179
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_c4

    .line 614
    :cond_17d
    :try_start_17d
    aget-byte v33, v8, v15

    const/16 v34, 0x44

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1a5

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1a5

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1a5

    const/16 v29, 0x1

    .line 641
    :goto_1a1
    add-int/lit8 v15, v15, 0x3

    .line 642
    goto/16 :goto_10a

    .line 615
    :cond_1a5
    aget-byte v33, v8, v15

    const/16 v34, 0x52

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1ca

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1ca

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1ca

    const/16 v29, 0x2

    goto :goto_1a1

    .line 616
    :cond_1ca
    aget-byte v33, v8, v15

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1f1

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1f1

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x48

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_1f1

    .line 617
    const/16 v29, 0x3

    .line 618
    const/16 v31, 0x1

    goto :goto_1a1

    .line 620
    :cond_1f1
    add-int/lit8 v33, v15, 0x6

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_254

    aget-byte v33, v8, v15

    const/16 v34, 0x50

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x52

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x49

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x56

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x54

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_254

    .line 624
    const/16 v29, 0x3

    .line 625
    const/16 v31, 0x3

    .line 626
    const/4 v13, 0x0

    .line 627
    add-int/lit8 v15, v15, 0x3

    goto/16 :goto_1a1

    .line 629
    :cond_254
    add-int/lit8 v33, v15, 0x8

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_2ce

    aget-byte v33, v8, v15

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x4e

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x43

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x52

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x59

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x50

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x54

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    add-int/lit8 v33, v15, 0x8

    aget-byte v33, v8, v33

    const/16 v34, 0x44

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_2ce

    .line 634
    const/16 v29, 0x3

    .line 635
    const/16 v31, 0x3

    .line 636
    add-int/lit8 v15, v15, 0x5

    goto/16 :goto_1a1

    .line 639
    :cond_2ce
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 644
    :cond_2eb
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x35

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x36

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_39d

    .line 646
    add-int/lit8 v15, v15, 0x8

    .line 647
    const-string v33, "aes256-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_380

    .line 648
    const-string v33, "aes256-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 649
    .local v9, "c":Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 651
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 652
    goto/16 :goto_10a

    .line 654
    .end local v9    # "c":Ljava/lang/Class;
    :cond_380
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes256-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 658
    :cond_39d
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x31

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x39

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_44f

    .line 660
    add-int/lit8 v15, v15, 0x8

    .line 661
    const-string v33, "aes192-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_432

    .line 662
    const-string v33, "aes192-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 663
    .restart local v9    # "c":Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 665
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 666
    goto/16 :goto_10a

    .line 668
    .end local v9    # "c":Ljava/lang/Class;
    :cond_432
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes192-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 672
    :cond_44f
    aget-byte v33, v8, v15

    const/16 v34, 0x41

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x7

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x45

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x53

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x31

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x5

    aget-byte v33, v8, v33

    const/16 v34, 0x32

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x6

    aget-byte v33, v8, v33

    const/16 v34, 0x38

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    add-int/lit8 v33, v15, 0x7

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_501

    .line 674
    add-int/lit8 v15, v15, 0x8

    .line 675
    const-string v33, "aes128-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v33

    if-eqz v33, :cond_4e4

    .line 676
    const-string v33, "aes128-cbc"

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 677
    .restart local v9    # "c":Ljava/lang/Class;
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/jcraft/jsch/Cipher;

    move-object/from16 v0, v33

    check-cast v0, Lcom/jcraft/jsch/Cipher;

    move-object v10, v0

    .line 679
    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v33

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v19, v0

    .line 680
    goto/16 :goto_10a

    .line 682
    .end local v9    # "c":Ljava/lang/Class;
    :cond_4e4
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "privatekey: aes128-cbc is not available "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 686
    :cond_501
    aget-byte v33, v8, v15

    const/16 v34, 0x43

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_572

    add-int/lit8 v33, v15, 0x3

    move/from16 v0, v33

    move/from16 v1, v22

    if-ge v0, v1, :cond_572

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x42

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_572

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x43

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_572

    add-int/lit8 v33, v15, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2c

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_572

    .line 687
    add-int/lit8 v15, v15, 0x4

    .line 688
    const/16 v17, 0x0

    .local v17, "ii":I
    move/from16 v16, v15

    .end local v15    # "i":I
    .local v16, "i":I
    :goto_53d
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v33, v0

    move/from16 v0, v17

    move/from16 v1, v33

    if-ge v0, v1, :cond_56e

    .line 689
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "i":I
    .restart local v15    # "i":I
    aget-byte v33, v8, v16

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/KeyPair;->a2b(B)B

    move-result v33

    shl-int/lit8 v33, v33, 0x4

    move/from16 v0, v33

    and-int/lit16 v0, v0, 0xf0

    move/from16 v33, v0

    add-int/lit8 v16, v15, 0x1

    .end local v15    # "i":I
    .restart local v16    # "i":I
    aget-byte v34, v8, v15

    invoke-static/range {v34 .. v34}, Lcom/jcraft/jsch/KeyPair;->a2b(B)B

    move-result v34

    and-int/lit8 v34, v34, 0xf

    add-int v33, v33, v34

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    aput-byte v33, v19, v17

    .line 688
    add-int/lit8 v17, v17, 0x1

    goto :goto_53d

    :cond_56e
    move/from16 v15, v16

    .line 691
    .end local v16    # "i":I
    .restart local v15    # "i":I
    goto/16 :goto_10a

    .line 693
    .end local v17    # "ii":I
    :cond_572
    aget-byte v33, v8, v15

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_597

    add-int/lit8 v33, v15, 0x1

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_597

    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_597

    .line 694
    add-int/lit8 v15, v15, 0x1

    .line 695
    goto/16 :goto_10a

    .line 697
    :cond_597
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_636

    add-int/lit8 v33, v15, 0x1

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_636

    .line 698
    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_5db

    add-int/lit8 v15, v15, 0x2

    .line 719
    :cond_5ba
    :goto_5ba
    if-eqz v8, :cond_6e9

    .line 721
    if-nez v29, :cond_63a

    .line 722
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 699
    :cond_5db
    add-int/lit8 v33, v15, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_601

    add-int/lit8 v33, v15, 0x2

    array-length v0, v8

    move/from16 v34, v0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ge v0, v1, :cond_601

    add-int/lit8 v33, v15, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_601

    .line 701
    add-int/lit8 v15, v15, 0x3

    goto :goto_5ba

    .line 703
    :cond_601
    const/16 v18, 0x0

    .line 704
    .local v18, "inheader":Z
    add-int/lit8 v20, v15, 0x1

    .local v20, "j":I
    :goto_605
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v20

    move/from16 v1, v33

    if-ge v0, v1, :cond_618

    .line 705
    aget-byte v33, v8, v20

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_626

    .line 709
    :cond_618
    :goto_618
    if-nez v18, :cond_636

    .line 710
    add-int/lit8 v15, v15, 0x1

    .line 711
    const/16 v33, 0x3

    move/from16 v0, v31

    move/from16 v1, v33

    if-eq v0, v1, :cond_5ba

    .line 712
    const/4 v13, 0x0

    goto :goto_5ba

    .line 707
    :cond_626
    aget-byte v33, v8, v20

    const/16 v34, 0x3a

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_633

    const/16 v18, 0x1

    goto :goto_618

    .line 704
    :cond_633
    add-int/lit8 v20, v20, 0x1

    goto :goto_605

    .line 716
    .end local v18    # "inheader":Z
    .end local v20    # "j":I
    :cond_636
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_10a

    .line 725
    :cond_63a
    move/from16 v27, v15

    .line 726
    .local v27, "start":I
    :goto_63c
    move/from16 v0, v22

    if-ge v15, v0, :cond_64a

    .line 727
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_66f

    .line 731
    :cond_64a
    sub-int v33, v22, v15

    if-eqz v33, :cond_652

    sub-int v33, v15, v27

    if-nez v33, :cond_672

    .line 732
    :cond_652
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 728
    :cond_66f
    add-int/lit8 v15, v15, 0x1

    goto :goto_63c

    .line 736
    :cond_672
    sub-int v33, v15, v27

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v28, v0

    .line 737
    .local v28, "tmp":[B
    const/16 v33, 0x0

    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v34, v0

    move/from16 v0, v27

    move-object/from16 v1, v28

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v8, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 738
    move-object/from16 v4, v28

    .line 740
    .local v4, "_buf":[B
    const/16 v27, 0x0

    .line 741
    const/4 v15, 0x0

    .line 743
    array-length v6, v4

    .line 744
    .local v6, "_len":I
    :goto_692
    if-ge v15, v6, :cond_6d8

    .line 745
    aget-byte v33, v4, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_6ce

    .line 746
    add-int/lit8 v33, v15, -0x1

    aget-byte v33, v4, v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_6c8

    const/16 v32, 0x1

    .line 748
    .local v32, "xd":Z
    :goto_6ac
    add-int/lit8 v34, v15, 0x1

    if-eqz v32, :cond_6cb

    const/16 v33, 0x1

    :goto_6b2
    sub-int v33, v15, v33

    add-int/lit8 v35, v15, 0x1

    sub-int v35, v6, v35

    move/from16 v0, v34

    move/from16 v1, v33

    move/from16 v2, v35

    invoke-static {v4, v0, v4, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 749
    if-eqz v32, :cond_6c5

    add-int/lit8 v6, v6, -0x1

    .line 750
    :cond_6c5
    add-int/lit8 v6, v6, -0x1

    .line 751
    goto :goto_692

    .line 746
    .end local v32    # "xd":Z
    :cond_6c8
    const/16 v32, 0x0

    goto :goto_6ac

    .line 748
    .restart local v32    # "xd":Z
    :cond_6cb
    const/16 v33, 0x0

    goto :goto_6b2

    .line 753
    .end local v32    # "xd":Z
    :cond_6ce
    aget-byte v33, v4, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_779

    .line 757
    :cond_6d8
    sub-int v33, v15, v27

    if-lez v33, :cond_6e6

    .line 758
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v4, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v11

    .line 760
    :cond_6e6
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 763
    .end local v4    # "_buf":[B
    .end local v6    # "_len":I
    .end local v27    # "start":I
    .end local v28    # "tmp":[B
    :cond_6e9
    if-eqz v11, :cond_79f

    array-length v0, v11

    move/from16 v33, v0

    const/16 v34, 0x4

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_79f

    const/16 v33, 0x0

    aget-byte v33, v11, v33

    const/16 v34, 0x3f

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_79f

    const/16 v33, 0x1

    aget-byte v33, v11, v33

    const/16 v34, 0x6f

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_79f

    const/16 v33, 0x2

    aget-byte v33, v11, v33

    const/16 v34, -0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_79f

    const/16 v33, 0x3

    aget-byte v33, v11, v33

    const/16 v34, -0x15

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_79f

    .line 770
    new-instance v4, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v4, v11}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 771
    .local v4, "_buf":Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 772
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 773
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v7

    .line 775
    .local v7, "_type":[B
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v33

    invoke-static/range {v33 .. v33}, Lcom/jcraft/jsch/Util;->byte2str([B)Ljava/lang/String;

    move-result-object v5

    .line 777
    .local v5, "_cipher":Ljava/lang/String;
    const-string v33, "3des-cbc"

    move-object/from16 v0, v33

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_77d

    .line 778
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 779
    array-length v0, v11

    move/from16 v33, v0

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getOffSet()I

    move-result v34

    sub-int v33, v33, v34

    move/from16 v0, v33

    new-array v14, v0, [B

    .line 780
    .local v14, "foo":[B
    invoke-virtual {v4, v14}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 781
    move-object v11, v14

    .line 782
    const/4 v13, 0x1

    .line 783
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "unknown privatekey format: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 754
    .end local v5    # "_cipher":Ljava/lang/String;
    .end local v7    # "_type":[B
    .end local v14    # "foo":[B
    .local v4, "_buf":[B
    .restart local v6    # "_len":I
    .restart local v27    # "start":I
    .restart local v28    # "tmp":[B
    :cond_779
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_692

    .line 785
    .end local v6    # "_len":I
    .end local v27    # "start":I
    .end local v28    # "tmp":[B
    .local v4, "_buf":Lcom/jcraft/jsch/Buffer;
    .restart local v5    # "_cipher":Ljava/lang/String;
    .restart local v7    # "_type":[B
    :cond_77d
    const-string v33, "none"

    move-object/from16 v0, v33

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_79f

    .line 786
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 787
    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getInt()I

    .line 789
    const/4 v13, 0x0

    .line 791
    array-length v0, v11

    move/from16 v33, v0

    invoke-virtual {v4}, Lcom/jcraft/jsch/Buffer;->getOffSet()I

    move-result v34

    sub-int v33, v33, v34

    move/from16 v0, v33

    new-array v14, v0, [B

    .line 792
    .restart local v14    # "foo":[B
    invoke-virtual {v4, v14}, Lcom/jcraft/jsch/Buffer;->getByte([B)V
    :try_end_79e
    .catch Ljava/lang/Exception; {:try_start_17d .. :try_end_79e} :catch_16b

    .line 793
    move-object v11, v14

    .line 797
    .end local v4    # "_buf":Lcom/jcraft/jsch/Buffer;
    .end local v5    # "_cipher":Ljava/lang/String;
    .end local v7    # "_type":[B
    .end local v14    # "foo":[B
    :cond_79f
    if-eqz p2, :cond_893

    .line 799
    move-object/from16 v8, p2

    .line 800
    :try_start_7a3
    array-length v0, v8

    move/from16 v22, v0

    .line 801
    array-length v0, v8

    move/from16 v33, v0

    const/16 v34, 0x4

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_8eb

    const/16 v33, 0x0

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8eb

    const/16 v33, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8eb

    const/16 v33, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8eb

    const/16 v33, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8eb

    .line 804
    const/16 v30, 0x1

    .line 805
    .local v30, "valid":Z
    const/4 v15, 0x0

    .line 806
    :cond_7e4
    add-int/lit8 v15, v15, 0x1

    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-le v0, v15, :cond_7f7

    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_7e4

    .line 807
    :cond_7f7
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-gt v0, v15, :cond_800

    const/16 v30, 0x0

    .line 809
    :cond_800
    :goto_800
    if-eqz v30, :cond_827

    .line 810
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_862

    .line 811
    const/16 v18, 0x0

    .line 812
    .restart local v18    # "inheader":Z
    add-int/lit8 v20, v15, 0x1

    .restart local v20    # "j":I
    :goto_810
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v20

    move/from16 v1, v33

    if-ge v0, v1, :cond_823

    .line 813
    aget-byte v33, v8, v20

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_852

    .line 816
    :cond_823
    :goto_823
    if-nez v18, :cond_862

    .line 817
    add-int/lit8 v15, v15, 0x1

    .line 823
    .end local v18    # "inheader":Z
    .end local v20    # "j":I
    :cond_827
    array-length v0, v8

    move/from16 v33, v0

    move/from16 v0, v33

    if-gt v0, v15, :cond_830

    const/16 v30, 0x0

    .line 825
    :cond_830
    move/from16 v27, v15

    .line 826
    .restart local v27    # "start":I
    :goto_832
    if-eqz v30, :cond_86f

    move/from16 v0, v22

    if-ge v15, v0, :cond_86f

    .line 827
    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_865

    .line 828
    add-int/lit8 v33, v15, 0x1

    sub-int v34, v22, v15

    add-int/lit8 v34, v34, -0x1

    move/from16 v0, v33

    move/from16 v1, v34

    invoke-static {v8, v0, v8, v15, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 829
    add-int/lit8 v22, v22, -0x1

    .line 830
    goto :goto_832

    .line 814
    .end local v27    # "start":I
    .restart local v18    # "inheader":Z
    .restart local v20    # "j":I
    :cond_852
    aget-byte v33, v8, v20

    const/16 v34, 0x3a

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_85f

    const/16 v18, 0x1

    goto :goto_823

    .line 812
    :cond_85f
    add-int/lit8 v20, v20, 0x1

    goto :goto_810

    .line 821
    .end local v18    # "inheader":Z
    .end local v20    # "j":I
    :cond_862
    add-int/lit8 v15, v15, 0x1

    goto :goto_800

    .line 832
    .restart local v27    # "start":I
    :cond_865
    aget-byte v33, v8, v15

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8d8

    .line 835
    :cond_86f
    if-eqz v30, :cond_893

    .line 836
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v8, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v26

    .line 837
    if-eqz p1, :cond_885

    const/16 v33, 0x3

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_893

    .line 838
    :cond_885
    const/16 v33, 0x8

    aget-byte v33, v26, v33
    :try_end_889
    .catch Ljava/lang/Exception; {:try_start_7a3 .. :try_end_889} :catch_a2f

    const/16 v34, 0x64

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_8dc

    const/16 v29, 0x1

    .line 879
    .end local v27    # "start":I
    .end local v30    # "valid":Z
    :cond_893
    :goto_893
    const/16 v21, 0x0

    .line 880
    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    const/16 v33, 0x1

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_9da

    new-instance v21, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 884
    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :cond_8a6
    :goto_8a6
    if-eqz v21, :cond_73

    .line 885
    move-object/from16 v0, v21

    iput-boolean v13, v0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 886
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    .line 887
    move/from16 v0, v31

    move-object/from16 v1, v21

    iput v0, v1, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 888
    move-object/from16 v0, v24

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 889
    move-object/from16 v0, v21

    iput-object v10, v0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 891
    if-eqz v13, :cond_a00

    .line 892
    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, v21

    iput-boolean v0, v1, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 893
    move-object/from16 v0, v19

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/jcraft/jsch/KeyPair;->iv:[B

    .line 894
    move-object/from16 v0, v21

    iput-object v11, v0, Lcom/jcraft/jsch/KeyPair;->data:[B

    goto/16 :goto_73

    .line 833
    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    .restart local v27    # "start":I
    .restart local v30    # "valid":Z
    :cond_8d8
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_832

    .line 839
    :cond_8dc
    const/16 v33, 0x8

    :try_start_8de
    aget-byte v33, v26, v33

    const/16 v34, 0x72

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_893

    const/16 v29, 0x2

    goto :goto_893

    .line 844
    .end local v27    # "start":I
    .end local v30    # "valid":Z
    :cond_8eb
    const/16 v33, 0x0

    aget-byte v33, v8, v33

    const/16 v34, 0x73

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_893

    const/16 v33, 0x1

    aget-byte v33, v8, v33

    const/16 v34, 0x73

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_893

    const/16 v33, 0x2

    aget-byte v33, v8, v33

    const/16 v34, 0x68

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_893

    const/16 v33, 0x3

    aget-byte v33, v8, v33

    const/16 v34, 0x2d

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_893

    .line 845
    if-nez p1, :cond_936

    array-length v0, v8

    move/from16 v33, v0

    const/16 v34, 0x7

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_936

    .line 847
    const/16 v33, 0x4

    aget-byte v33, v8, v33

    const/16 v34, 0x64

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9a4

    const/16 v29, 0x1

    .line 850
    :cond_936
    :goto_936
    const/4 v15, 0x0

    .line 851
    :goto_937
    move/from16 v0, v22

    if-ge v15, v0, :cond_945

    aget-byte v33, v8, v15

    const/16 v34, 0x20

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9b3

    :cond_945
    add-int/lit8 v15, v15, 0x1

    .line 852
    move/from16 v0, v22

    if-ge v15, v0, :cond_a32

    .line 853
    move/from16 v27, v15

    .line 854
    .restart local v27    # "start":I
    :goto_94d
    move/from16 v0, v22

    if-ge v15, v0, :cond_95b

    aget-byte v33, v8, v15

    const/16 v34, 0x20

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9b6

    .line 855
    :cond_95b
    sub-int v33, v15, v27

    move/from16 v0, v27

    move/from16 v1, v33

    invoke-static {v8, v0, v1}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v26

    move/from16 v16, v15

    .line 857
    .end local v15    # "i":I
    .end local v27    # "start":I
    .restart local v16    # "i":I
    :goto_967
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "i":I
    .restart local v15    # "i":I
    move/from16 v0, v16

    move/from16 v1, v22

    if-ge v0, v1, :cond_893

    .line 858
    move/from16 v27, v15

    .line 859
    .restart local v27    # "start":I
    :goto_971
    move/from16 v0, v22

    if-ge v15, v0, :cond_97f

    aget-byte v33, v8, v15

    const/16 v34, 0xa

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_9b9

    .line 860
    :cond_97f
    if-lez v15, :cond_98f

    add-int/lit8 v33, v15, -0x1

    aget-byte v33, v8, v33

    const/16 v34, 0xd

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_98f

    add-int/lit8 v15, v15, -0x1

    .line 861
    :cond_98f
    move/from16 v0, v27

    if-ge v0, v15, :cond_893

    .line 862
    new-instance v25, Ljava/lang/String;

    sub-int v33, v15, v27

    move-object/from16 v0, v25

    move/from16 v1, v27

    move/from16 v2, v33

    invoke-direct {v0, v8, v1, v2}, Ljava/lang/String;-><init>([BII)V

    .end local v24    # "publicKeyComment":Ljava/lang/String;
    .local v25, "publicKeyComment":Ljava/lang/String;
    move-object/from16 v24, v25

    .end local v25    # "publicKeyComment":Ljava/lang/String;
    .restart local v24    # "publicKeyComment":Ljava/lang/String;
    goto/16 :goto_893

    .line 848
    .end local v27    # "start":I
    :cond_9a4
    const/16 v33, 0x4

    aget-byte v33, v8, v33
    :try_end_9a8
    .catch Ljava/lang/Exception; {:try_start_8de .. :try_end_9a8} :catch_a2f

    const/16 v34, 0x72

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_936

    const/16 v29, 0x2

    goto :goto_936

    .line 851
    :cond_9b3
    add-int/lit8 v15, v15, 0x1

    goto :goto_937

    .line 854
    .restart local v27    # "start":I
    :cond_9b6
    add-int/lit8 v15, v15, 0x1

    goto :goto_94d

    .line 859
    :cond_9b9
    add-int/lit8 v15, v15, 0x1

    goto :goto_971

    .line 874
    .end local v15    # "i":I
    .end local v22    # "len":I
    .end local v27    # "start":I
    .restart local v12    # "e":Ljava/lang/Exception;
    :cond_9bc
    instance-of v0, v12, Ljava/lang/Throwable;

    move/from16 v33, v0

    if-eqz v33, :cond_9d0

    .line 875
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v33

    move-object/from16 v1, v34

    invoke-direct {v0, v1, v12}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v33

    .line 876
    :cond_9d0
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 881
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v15    # "i":I
    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    .restart local v22    # "len":I
    :cond_9da
    const/16 v33, 0x2

    move/from16 v0, v29

    move/from16 v1, v33

    if-ne v0, v1, :cond_9ed

    new-instance v21, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;)V

    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    goto/16 :goto_8a6

    .line 882
    :cond_9ed
    const/16 v33, 0x3

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_8a6

    new-instance v21, Lcom/jcraft/jsch/KeyPairPKCS8;

    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/jcraft/jsch/KeyPairPKCS8;-><init>(Lcom/jcraft/jsch/JSch;)V

    .restart local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    goto/16 :goto_8a6

    .line 897
    :cond_a00
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v33

    if-eqz v33, :cond_a12

    .line 898
    const/16 v33, 0x0

    move/from16 v0, v33

    move-object/from16 v1, v21

    iput-boolean v0, v1, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    goto/16 :goto_73

    .line 902
    :cond_a12
    new-instance v33, Lcom/jcraft/jsch/JSchException;

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "invalid privatekey: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 868
    .end local v21    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :catch_a2f
    move-exception v33

    goto/16 :goto_893

    :cond_a32
    move/from16 v16, v15

    .end local v15    # "i":I
    .restart local v16    # "i":I
    goto/16 :goto_967
.end method

.method static loadPPK(Lcom/jcraft/jsch/JSch;[B)Lcom/jcraft/jsch/KeyPair;
    .registers 23
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 943
    const/16 v18, 0x0

    .line 944
    .local v18, "pubkey":[B
    const/16 v16, 0x0

    .line 945
    .local v16, "prvkey":[B
    const/4 v14, 0x0

    .line 947
    .local v14, "lines":I
    new-instance v10, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 948
    .local v10, "buffer":Lcom/jcraft/jsch/Buffer;
    new-instance v20, Ljava/util/Hashtable;

    invoke-direct/range {v20 .. v20}, Ljava/util/Hashtable;-><init>()V

    .line 951
    .local v20, "v":Ljava/util/Hashtable;
    :cond_11
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 955
    const-string v3, "PuTTY-User-Key-File-2"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 956
    .local v19, "typ":Ljava/lang/String;
    if-nez v19, :cond_27

    .line 957
    const/4 v2, 0x0

    .line 1043
    :goto_26
    return-object v2

    .line 960
    :cond_27
    const-string v3, "Public-Lines"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 961
    invoke-static {v10, v14}, Lcom/jcraft/jsch/KeyPair;->parseLines(Lcom/jcraft/jsch/Buffer;I)[B

    move-result-object v18

    .line 964
    :cond_39
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 968
    const-string v3, "Private-Lines"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    .line 969
    invoke-static {v10, v14}, Lcom/jcraft/jsch/KeyPair;->parseLines(Lcom/jcraft/jsch/Buffer;I)[B

    move-result-object v16

    .line 972
    :cond_53
    move-object/from16 v0, v20

    invoke-static {v10, v0}, Lcom/jcraft/jsch/KeyPair;->parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z

    move-result v3

    if-nez v3, :cond_53

    .line 976
    const/4 v3, 0x0

    move-object/from16 v0, v16

    array-length v8, v0

    move-object/from16 v0, v16

    invoke-static {v0, v3, v8}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v16

    .line 977
    const/4 v3, 0x0

    move-object/from16 v0, v18

    array-length v8, v0

    move-object/from16 v0, v18

    invoke-static {v0, v3, v8}, Lcom/jcraft/jsch/Util;->fromBase64([BII)[B

    move-result-object v18

    .line 979
    const/4 v2, 0x0

    .line 981
    .local v2, "kpair":Lcom/jcraft/jsch/KeyPair;
    const-string v3, "ssh-rsa"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b5

    .line 983
    new-instance v9, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 984
    .local v9, "_buf":Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 986
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v13

    .line 987
    .local v13, "len":I
    new-array v3, v13, [B

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 988
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v0, v3, [B

    move-object/from16 v17, v0

    .line 989
    .local v17, "pub_array":[B
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 990
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v15, v3, [B

    .line 991
    .local v15, "n_array":[B
    invoke-virtual {v9, v15}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 993
    new-instance v2, Lcom/jcraft/jsch/KeyPairRSA;

    .end local v2    # "kpair":Lcom/jcraft/jsch/KeyPair;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v2, v0, v15, v1, v3}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B)V

    .line 1017
    .end local v15    # "n_array":[B
    .end local v17    # "pub_array":[B
    .restart local v2    # "kpair":Lcom/jcraft/jsch/KeyPair;
    :goto_b0
    if-nez v2, :cond_105

    .line 1018
    const/4 v2, 0x0

    goto/16 :goto_26

    .line 995
    .end local v9    # "_buf":Lcom/jcraft/jsch/Buffer;
    .end local v13    # "len":I
    :cond_b5
    const-string v3, "ssh-dss"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_102

    .line 996
    new-instance v9, Lcom/jcraft/jsch/Buffer;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 997
    .restart local v9    # "_buf":Lcom/jcraft/jsch/Buffer;
    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 999
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v13

    .line 1000
    .restart local v13    # "len":I
    new-array v3, v13, [B

    invoke-virtual {v9, v3}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 1002
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v4, v3, [B

    .line 1003
    .local v4, "p_array":[B
    invoke-virtual {v9, v4}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 1004
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v5, v3, [B

    .line 1005
    .local v5, "q_array":[B
    invoke-virtual {v9, v5}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 1006
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v6, v3, [B

    .line 1007
    .local v6, "g_array":[B
    invoke-virtual {v9, v6}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 1008
    invoke-virtual {v9}, Lcom/jcraft/jsch/Buffer;->getInt()I

    move-result v3

    new-array v7, v3, [B

    .line 1009
    .local v7, "y_array":[B
    invoke-virtual {v9, v7}, Lcom/jcraft/jsch/Buffer;->getByte([B)V

    .line 1011
    new-instance v2, Lcom/jcraft/jsch/KeyPairDSA;

    .end local v2    # "kpair":Lcom/jcraft/jsch/KeyPair;
    const/4 v8, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/jcraft/jsch/KeyPairDSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B[B[B)V

    .line 1012
    .restart local v2    # "kpair":Lcom/jcraft/jsch/KeyPair;
    goto :goto_b0

    .line 1014
    .end local v4    # "p_array":[B
    .end local v5    # "q_array":[B
    .end local v6    # "g_array":[B
    .end local v7    # "y_array":[B
    .end local v9    # "_buf":Lcom/jcraft/jsch/Buffer;
    .end local v13    # "len":I
    :cond_102
    const/4 v2, 0x0

    goto/16 :goto_26

    .line 1020
    .restart local v9    # "_buf":Lcom/jcraft/jsch/Buffer;
    .restart local v13    # "len":I
    :cond_105
    const-string v3, "Encryption"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v8, "none"

    invoke-virtual {v3, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15b

    const/4 v3, 0x1

    :goto_116
    iput-boolean v3, v2, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 1021
    const/4 v3, 0x2

    iput v3, v2, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 1022
    const-string v3, "Comment"

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 1023
    iget-boolean v3, v2, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v3, :cond_16e

    .line 1024
    const-string v3, "aes256-cbc"

    invoke-static {v3}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/jcraft/jsch/Session;->checkCipher(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_166

    .line 1026
    :try_start_137
    const-string v3, "aes256-cbc"

    invoke-static {v3}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 1027
    .local v11, "c":Ljava/lang/Class;
    invoke-virtual {v11}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jcraft/jsch/Cipher;

    check-cast v3, Lcom/jcraft/jsch/Cipher;

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 1028
    iget-object v3, v2, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v3}, Lcom/jcraft/jsch/Cipher;->getIVSize()I

    move-result v3

    new-array v3, v3, [B

    iput-object v3, v2, Lcom/jcraft/jsch/KeyPair;->iv:[B
    :try_end_155
    .catch Ljava/lang/Exception; {:try_start_137 .. :try_end_155} :catch_15d

    .line 1037
    move-object/from16 v0, v16

    iput-object v0, v2, Lcom/jcraft/jsch/KeyPair;->data:[B

    goto/16 :goto_26

    .line 1020
    .end local v11    # "c":Ljava/lang/Class;
    :cond_15b
    const/4 v3, 0x0

    goto :goto_116

    .line 1030
    :catch_15d
    move-exception v12

    .line 1031
    .local v12, "e":Ljava/lang/Exception;
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v8, "The cipher \'aes256-cbc\' is required, but it is not available."

    invoke-direct {v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1035
    .end local v12    # "e":Ljava/lang/Exception;
    :cond_166
    new-instance v3, Lcom/jcraft/jsch/JSchException;

    const-string v8, "The cipher \'aes256-cbc\' is required, but it is not available."

    invoke-direct {v3, v8}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1040
    :cond_16e
    move-object/from16 v0, v16

    iput-object v0, v2, Lcom/jcraft/jsch/KeyPair;->data:[B

    .line 1041
    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    goto/16 :goto_26
.end method

.method private static parseHeader(Lcom/jcraft/jsch/Buffer;Ljava/util/Hashtable;)Z
    .registers 11
    .param p0, "buffer"    # Lcom/jcraft/jsch/Buffer;
    .param p1, "v"    # Ljava/util/Hashtable;

    .prologue
    const/16 v8, 0xd

    const/4 v5, 0x0

    .line 1081
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 1082
    .local v0, "buf":[B
    iget v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1083
    .local v2, "index":I
    const/4 v3, 0x0

    .line 1084
    .local v3, "key":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1085
    .local v4, "value":Ljava/lang/String;
    move v1, v2

    .local v1, "i":I
    :goto_a
    array-length v6, v0

    if-ge v1, v6, :cond_11

    .line 1086
    aget-byte v6, v0, v1

    if-ne v6, v8, :cond_14

    .line 1100
    :cond_11
    :goto_11
    if-nez v3, :cond_33

    .line 1120
    :cond_13
    :goto_13
    return v5

    .line 1089
    :cond_14
    aget-byte v6, v0, v1

    const/16 v7, 0x3a

    if-ne v6, v7, :cond_30

    .line 1090
    new-instance v3, Ljava/lang/String;

    .end local v3    # "key":Ljava/lang/String;
    sub-int v6, v1, v2

    invoke-direct {v3, v0, v2, v6}, Ljava/lang/String;-><init>([BII)V

    .line 1091
    .restart local v3    # "key":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 1092
    array-length v6, v0

    if-ge v1, v6, :cond_2e

    aget-byte v6, v0, v1

    const/16 v7, 0x20

    if-ne v6, v7, :cond_2e

    .line 1093
    add-int/lit8 v1, v1, 0x1

    .line 1095
    :cond_2e
    move v2, v1

    .line 1096
    goto :goto_11

    .line 1085
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 1103
    :cond_33
    move v1, v2

    :goto_34
    array-length v6, v0

    if-ge v1, v6, :cond_50

    .line 1104
    aget-byte v6, v0, v1

    if-ne v6, v8, :cond_5d

    .line 1105
    new-instance v4, Ljava/lang/String;

    .end local v4    # "value":Ljava/lang/String;
    sub-int v6, v1, v2

    invoke-direct {v4, v0, v2, v6}, Ljava/lang/String;-><init>([BII)V

    .line 1106
    .restart local v4    # "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 1107
    array-length v6, v0

    if-ge v1, v6, :cond_4f

    aget-byte v6, v0, v1

    const/16 v7, 0xa

    if-ne v6, v7, :cond_4f

    .line 1108
    add-int/lit8 v1, v1, 0x1

    .line 1110
    :cond_4f
    move v2, v1

    .line 1115
    :cond_50
    if-eqz v4, :cond_57

    .line 1116
    invoke-virtual {p1, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    iput v2, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1120
    :cond_57
    if-eqz v3, :cond_13

    if-eqz v4, :cond_13

    const/4 v5, 0x1

    goto :goto_13

    .line 1103
    :cond_5d
    add-int/lit8 v1, v1, 0x1

    goto :goto_34
.end method

.method private static parseLines(Lcom/jcraft/jsch/Buffer;I)[B
    .registers 13
    .param p0, "buffer"    # Lcom/jcraft/jsch/Buffer;
    .param p1, "lines"    # I

    .prologue
    const/4 v10, 0x0

    .line 1047
    iget-object v0, p0, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 1048
    .local v0, "buf":[B
    iget v4, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1049
    .local v4, "index":I
    const/4 v1, 0x0

    .line 1051
    .local v1, "data":[B
    move v2, v4

    .local v2, "i":I
    move v6, p1

    .line 1052
    .end local p1    # "lines":I
    .local v6, "lines":I
    :goto_8
    add-int/lit8 p1, v6, -0x1

    .end local v6    # "lines":I
    .restart local p1    # "lines":I
    if-lez v6, :cond_51

    .line 1053
    :goto_c
    array-length v8, v0

    if-le v8, v2, :cond_27

    .line 1054
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-byte v8, v0, v2

    const/16 v9, 0xd

    if-ne v8, v9, :cond_56

    .line 1055
    if-nez v1, :cond_32

    .line 1056
    sub-int v8, v3, v4

    add-int/lit8 v8, v8, -0x1

    new-array v1, v8, [B

    .line 1057
    sub-int v8, v3, v4

    add-int/lit8 v8, v8, -0x1

    invoke-static {v0, v4, v1, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v2, v3

    .line 1069
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_27
    :goto_27
    aget-byte v8, v0, v2

    const/16 v9, 0xa

    if-ne v8, v9, :cond_2f

    .line 1070
    add-int/lit8 v2, v2, 0x1

    .line 1071
    :cond_2f
    move v4, v2

    move v6, p1

    .end local p1    # "lines":I
    .restart local v6    # "lines":I
    goto :goto_8

    .line 1060
    .end local v2    # "i":I
    .end local v6    # "lines":I
    .restart local v3    # "i":I
    .restart local p1    # "lines":I
    :cond_32
    array-length v8, v1

    add-int/2addr v8, v3

    sub-int/2addr v8, v4

    add-int/lit8 v8, v8, -0x1

    new-array v7, v8, [B

    .line 1061
    .local v7, "tmp":[B
    array-length v8, v1

    invoke-static {v1, v10, v7, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1062
    array-length v8, v1

    sub-int v9, v3, v4

    add-int/lit8 v9, v9, -0x1

    invoke-static {v0, v4, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1063
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_46
    array-length v8, v1

    if-ge v5, v8, :cond_4e

    aput-byte v10, v1, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_46

    .line 1064
    :cond_4e
    move-object v1, v7

    move v2, v3

    .line 1066
    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_27

    .line 1074
    .end local v5    # "j":I
    .end local v7    # "tmp":[B
    :cond_51
    if-eqz v1, :cond_55

    .line 1075
    iput v4, p0, Lcom/jcraft/jsch/Buffer;->index:I

    .line 1077
    :cond_55
    return-object v1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_56
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_c
.end method


# virtual methods
.method copy(Lcom/jcraft/jsch/KeyPair;)V
    .registers 3
    .param p1, "kpair"    # Lcom/jcraft/jsch/KeyPair;

    .prologue
    .line 1124
    iget-object v0, p1, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    .line 1125
    iget v0, p1, Lcom/jcraft/jsch/KeyPair;->vendor:I

    iput v0, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    .line 1126
    iget-object v0, p1, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 1127
    iget-object v0, p1, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 1128
    return-void
.end method

.method countLength(I)I
    .registers 5
    .param p1, "len"    # I

    .prologue
    .line 343
    const/4 v0, 0x1

    .line 344
    .local v0, "i":I
    const/16 v2, 0x7f

    if-gt p1, v2, :cond_7

    move v1, v0

    .line 349
    .end local v0    # "i":I
    .local v1, "i":I
    :goto_6
    return v1

    .line 345
    .end local v1    # "i":I
    .restart local v0    # "i":I
    :cond_7
    :goto_7
    if-lez p1, :cond_e

    .line 346
    ushr-int/lit8 p1, p1, 0x8

    .line 347
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_e
    move v1, v0

    .line 349
    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_6
.end method

.method public decrypt(Ljava/lang/String;)Z
    .registers 3
    .param p1, "_passphrase"    # Ljava/lang/String;

    .prologue
    .line 485
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_10

    .line 486
    :cond_8
    iget-boolean v0, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-nez v0, :cond_e

    const/4 v0, 0x1

    .line 488
    :goto_d
    return v0

    .line 486
    :cond_e
    const/4 v0, 0x0

    goto :goto_d

    .line 488
    :cond_10
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->decrypt([B)Z

    move-result v0

    goto :goto_d
.end method

.method public decrypt([B)Z
    .registers 8
    .param p1, "_passphrase"    # [B

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 492
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-nez v4, :cond_7

    .line 506
    :cond_6
    :goto_6
    return v2

    .line 495
    :cond_7
    if-nez p1, :cond_f

    .line 496
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v4, :cond_6

    move v2, v3

    goto :goto_6

    .line 498
    :cond_f
    array-length v4, p1

    new-array v0, v4, [B

    .line 499
    .local v0, "bar":[B
    array-length v4, v0

    invoke-static {p1, v3, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 500
    move-object p1, v0

    .line 501
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPair;->data:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPair;->iv:[B

    invoke-direct {p0, v4, p1, v5}, Lcom/jcraft/jsch/KeyPair;->decrypt([B[B[B)[B

    move-result-object v1

    .line 502
    .local v1, "foo":[B
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 503
    invoke-virtual {p0, v1}, Lcom/jcraft/jsch/KeyPair;->parse([B)Z

    move-result v4

    if-eqz v4, :cond_2a

    .line 504
    iput-boolean v3, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    .line 506
    :cond_2a
    iget-boolean v4, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    if-eqz v4, :cond_6

    move v2, v3

    goto :goto_6
.end method

.method public dispose()V
    .registers 2

    .prologue
    .line 920
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 921
    return-void
.end method

.method public finalize()V
    .registers 1

    .prologue
    .line 924
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->dispose()V

    .line 925
    return-void
.end method

.method public abstract forSSHAgent()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method declared-synchronized genKey([B[B)[B
    .registers 17
    .param p1, "passphrase"    # [B
    .param p2, "iv"    # [B

    .prologue
    .line 407
    monitor-enter p0

    :try_start_1
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    if-nez v10, :cond_b

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genCipher()Lcom/jcraft/jsch/Cipher;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    .line 408
    :cond_b
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    if-nez v10, :cond_15

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genHash()Lcom/jcraft/jsch/HASH;

    move-result-object v10

    iput-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 410
    :cond_15
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->cipher:Lcom/jcraft/jsch/Cipher;

    invoke-interface {v10}, Lcom/jcraft/jsch/Cipher;->getBlockSize()I

    move-result v10

    new-array v7, v10, [B

    .line 411
    .local v7, "key":[B
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->getBlockSize()I

    move-result v4

    .line 412
    .local v4, "hsize":I
    array-length v10, v7

    div-int/2addr v10, v4

    mul-int v11, v10, v4

    array-length v10, v7

    rem-int/2addr v10, v4

    if-nez v10, :cond_69

    const/4 v10, 0x0

    :goto_2c
    add-int/2addr v10, v11

    new-array v3, v10, [B
    :try_end_2f
    .catchall {:try_start_1 .. :try_end_2f} :catchall_ae

    .line 415
    .local v3, "hn":[B
    const/4 v9, 0x0

    .line 416
    .local v9, "tmp":[B
    :try_start_30
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    if-nez v10, :cond_77

    .line 417
    const/4 v6, 0x0

    .local v6, "index":I
    :goto_35
    add-int v10, v6, v4

    array-length v11, v3

    if-gt v10, v11, :cond_6f

    .line 418
    if-eqz v9, :cond_43

    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, v9

    invoke-interface {v10, v9, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 419
    :cond_43
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 420
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v12, 0x0

    move-object/from16 v0, p2

    array-length v10, v0

    const/16 v13, 0x8

    if-le v10, v13, :cond_6b

    const/16 v10, 0x8

    :goto_56
    move-object/from16 v0, p2

    invoke-interface {v11, v0, v12, v10}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 421
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v9

    .line 422
    const/4 v10, 0x0

    array-length v11, v9

    invoke-static {v9, v10, v3, v6, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 423
    array-length v10, v9

    add-int/2addr v6, v10

    goto :goto_35

    .end local v3    # "hn":[B
    .end local v6    # "index":I
    .end local v9    # "tmp":[B
    :cond_69
    move v10, v4

    .line 412
    goto :goto_2c

    .line 420
    .restart local v3    # "hn":[B
    .restart local v6    # "index":I
    .restart local v9    # "tmp":[B
    :cond_6b
    move-object/from16 v0, p2

    array-length v10, v0

    goto :goto_56

    .line 425
    :cond_6f
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v7

    invoke-static {v3, v10, v7, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_75} :catch_a7
    .catchall {:try_start_30 .. :try_end_75} :catchall_ae

    .line 454
    .end local v6    # "index":I
    :cond_75
    :goto_75
    monitor-exit p0

    return-object v7

    .line 427
    :cond_77
    :try_start_77
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    const/4 v11, 0x1

    if-ne v10, v11, :cond_b1

    .line 428
    const/4 v6, 0x0

    .restart local v6    # "index":I
    :goto_7d
    add-int v10, v6, v4

    array-length v11, v3

    if-gt v10, v11, :cond_a0

    .line 429
    if-eqz v9, :cond_8b

    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, v9

    invoke-interface {v10, v9, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 430
    :cond_8b
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    const/4 v11, 0x0

    array-length v12, p1

    invoke-interface {v10, p1, v11, v12}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 431
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-interface {v10}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v9

    .line 432
    const/4 v10, 0x0

    array-length v11, v9

    invoke-static {v9, v10, v3, v6, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 433
    array-length v10, v9

    add-int/2addr v6, v10

    goto :goto_7d

    .line 435
    :cond_a0
    const/4 v10, 0x0

    const/4 v11, 0x0

    array-length v12, v7

    invoke-static {v3, v10, v7, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_a6} :catch_a7
    .catchall {:try_start_77 .. :try_end_a6} :catchall_ae

    goto :goto_75

    .line 451
    .end local v6    # "index":I
    :catch_a7
    move-exception v2

    .line 452
    .local v2, "e":Ljava/lang/Exception;
    :try_start_a8
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v10, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_ad
    .catchall {:try_start_a8 .. :try_end_ad} :catchall_ae

    goto :goto_75

    .line 407
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "hn":[B
    .end local v4    # "hsize":I
    .end local v7    # "key":[B
    .end local v9    # "tmp":[B
    :catchall_ae
    move-exception v10

    monitor-exit p0

    throw v10

    .line 437
    .restart local v3    # "hn":[B
    .restart local v4    # "hsize":I
    .restart local v7    # "key":[B
    .restart local v9    # "tmp":[B
    :cond_b1
    :try_start_b1
    iget v10, p0, Lcom/jcraft/jsch/KeyPair;->vendor:I

    const/4 v11, 0x2

    if-ne v10, v11, :cond_75

    .line 438
    iget-object v10, p0, Lcom/jcraft/jsch/KeyPair;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v10, "sha-1"

    invoke-static {v10}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 439
    .local v1, "c":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/jcraft/jsch/HASH;

    move-object v0, v10

    check-cast v0, Lcom/jcraft/jsch/HASH;

    move-object v8, v0

    .line 440
    .local v8, "sha1":Lcom/jcraft/jsch/HASH;
    const/4 v10, 0x4

    new-array v9, v10, [B

    .line 441
    const/16 v10, 0x28

    new-array v7, v10, [B

    .line 442
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_d4
    const/4 v10, 0x2

    if-ge v5, v10, :cond_75

    .line 443
    invoke-interface {v8}, Lcom/jcraft/jsch/HASH;->init()V

    .line 444
    const/4 v10, 0x3

    int-to-byte v11, v5

    aput-byte v11, v9, v10

    .line 445
    const/4 v10, 0x0

    array-length v11, v9

    invoke-interface {v8, v9, v10, v11}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 446
    const/4 v10, 0x0

    array-length v11, p1

    invoke-interface {v8, p1, v10, v11}, Lcom/jcraft/jsch/HASH;->update([BII)V

    .line 447
    invoke-interface {v8}, Lcom/jcraft/jsch/HASH;->digest()[B

    move-result-object v10

    const/4 v11, 0x0

    mul-int/lit8 v12, v5, 0x14

    const/16 v13, 0x14

    invoke-static {v10, v11, v7, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_f4
    .catch Ljava/lang/Exception; {:try_start_b1 .. :try_end_f4} :catch_a7
    .catchall {:try_start_b1 .. :try_end_f4} :catchall_ae

    .line 442
    add-int/lit8 v5, v5, 0x1

    goto :goto_d4
.end method

.method abstract generate(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation
.end method

.method abstract getBegin()[B
.end method

.method abstract getEnd()[B
.end method

.method public getFingerPrint()Ljava/lang/String;
    .registers 3

    .prologue
    .line 269
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    if-nez v1, :cond_a

    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPair;->genHash()Lcom/jcraft/jsch/HASH;

    move-result-object v1

    iput-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    .line 270
    :cond_a
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v0

    .line 271
    .local v0, "kblob":[B
    if-nez v0, :cond_12

    const/4 v1, 0x0

    .line 272
    :goto_11
    return-object v1

    :cond_12
    iget-object v1, p0, Lcom/jcraft/jsch/KeyPair;->hash:Lcom/jcraft/jsch/HASH;

    invoke-static {v1, v0}, Lcom/jcraft/jsch/Util;->getFingerPrint(Lcom/jcraft/jsch/HASH;[B)Ljava/lang/String;

    move-result-object v1

    goto :goto_11
.end method

.method abstract getKeySize()I
.end method

.method public abstract getKeyType()I
.end method

.method abstract getKeyTypeName()[B
.end method

.method abstract getPrivateKey()[B
.end method

.method public getPublicKeyBlob()[B
    .registers 2

    .prologue
    .line 172
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publickeyblob:[B

    return-object v0
.end method

.method public getPublicKeyComment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getSignature([B)[B
.end method

.method public abstract getVerifier()Lcom/jcraft/jsch/Signature;
.end method

.method public isEncrypted()Z
    .registers 2

    .prologue
    .line 483
    iget-boolean v0, p0, Lcom/jcraft/jsch/KeyPair;->encrypted:Z

    return v0
.end method

.method abstract parse([B)Z
.end method

.method public setPassphrase(Ljava/lang/String;)V
    .registers 3
    .param p1, "passphrase"    # Ljava/lang/String;

    .prologue
    .line 461
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_f

    .line 462
    :cond_8
    const/4 v0, 0x0

    check-cast v0, [B

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->setPassphrase([B)V

    .line 467
    :goto_e
    return-void

    .line 465
    :cond_f
    invoke-static {p1}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPair;->setPassphrase([B)V

    goto :goto_e
.end method

.method public setPassphrase([B)V
    .registers 3
    .param p1, "passphrase"    # [B

    .prologue
    .line 473
    if-eqz p1, :cond_6

    array-length v0, p1

    if-nez v0, :cond_6

    .line 474
    const/4 p1, 0x0

    .line 475
    :cond_6
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    .line 476
    return-void
.end method

.method public setPublicKeyComment(Ljava/lang/String;)V
    .registers 2
    .param p1, "publicKeyComment"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/jcraft/jsch/KeyPair;->publicKeyComment:Ljava/lang/String;

    .line 82
    return-void
.end method

.method writeINTEGER([BI[B)I
    .registers 7
    .param p1, "buf"    # [B
    .param p2, "index"    # I
    .param p3, "data"    # [B

    .prologue
    .line 335
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "index":I
    .local v0, "index":I
    const/4 v1, 0x2

    aput-byte v1, p1, p2

    .line 336
    array-length v1, p3

    invoke-virtual {p0, p1, v0, v1}, Lcom/jcraft/jsch/KeyPair;->writeLength([BII)I

    move-result p2

    .line 337
    .end local v0    # "index":I
    .restart local p2    # "index":I
    const/4 v1, 0x0

    array-length v2, p3

    invoke-static {p3, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 338
    array-length v1, p3

    add-int/2addr p2, v1

    .line 339
    return p2
.end method

.method writeLength([BII)I
    .registers 9
    .param p1, "data"    # [B
    .param p2, "index"    # I
    .param p3, "len"    # I

    .prologue
    .line 353
    invoke-virtual {p0, p3}, Lcom/jcraft/jsch/KeyPair;->countLength(I)I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .line 354
    .local v0, "i":I
    if-nez v0, :cond_f

    .line 355
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .local v1, "index":I
    int-to-byte v3, p3

    aput-byte v3, p1, p2

    move p2, v1

    .line 365
    .end local v1    # "index":I
    .restart local p2    # "index":I
    :goto_e
    return v1

    .line 358
    :cond_f
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "index":I
    .restart local v1    # "index":I
    or-int/lit16 v3, v0, 0x80

    int-to-byte v3, v3

    aput-byte v3, p1, p2

    .line 359
    add-int v2, v1, v0

    .line 360
    .local v2, "j":I
    :goto_18
    if-lez v0, :cond_28

    .line 361
    add-int v3, v1, v0

    add-int/lit8 v3, v3, -0x1

    and-int/lit16 v4, p3, 0xff

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 362
    ushr-int/lit8 p3, p3, 0x8

    .line 363
    add-int/lit8 v0, v0, -0x1

    goto :goto_18

    :cond_28
    move p2, v1

    .end local v1    # "index":I
    .restart local p2    # "index":I
    move v1, v2

    .line 365
    goto :goto_e
.end method

.method public writePrivateKey(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/io/OutputStream;[B)V

    .line 109
    return-void
.end method

.method public writePrivateKey(Ljava/io/OutputStream;[B)V
    .registers 11
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "passphrase"    # [B

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 117
    if-nez p2, :cond_6

    .line 118
    iget-object p2, p0, Lcom/jcraft/jsch/KeyPair;->passphrase:[B

    .line 120
    :cond_6
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPrivateKey()[B

    move-result-object v4

    .line 121
    .local v4, "plain":[B
    new-array v0, v6, [[B

    .line 122
    .local v0, "_iv":[[B
    invoke-direct {p0, v4, v0, p2}, Lcom/jcraft/jsch/KeyPair;->encrypt([B[[B[B)[B

    move-result-object v1

    .line 123
    .local v1, "encoded":[B
    if-eq v1, v4, :cond_15

    .line 124
    invoke-static {v4}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 125
    :cond_15
    aget-object v3, v0, v7

    .line 126
    .local v3, "iv":[B
    array-length v6, v1

    invoke-static {v1, v7, v6}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v5

    .line 129
    .local v5, "prv":[B
    :try_start_1c
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getBegin()[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 130
    if-eqz p2, :cond_6a

    .line 131
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->header:[[B

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 132
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->header:[[B

    const/4 v7, 0x1

    aget-object v6, v6, v7

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 133
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_40
    array-length v6, v3

    if-ge v2, v6, :cond_60

    .line 134
    aget-byte v6, v3, v2

    ushr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0xf

    int-to-byte v6, v6

    invoke-static {v6}, Lcom/jcraft/jsch/KeyPair;->b2a(B)B

    move-result v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write(I)V

    .line 135
    aget-byte v6, v3, v2

    and-int/lit8 v6, v6, 0xf

    int-to-byte v6, v6

    invoke-static {v6}, Lcom/jcraft/jsch/KeyPair;->b2a(B)B

    move-result v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write(I)V

    .line 133
    add-int/lit8 v2, v2, 0x1

    goto :goto_40

    .line 137
    :cond_60
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 138
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 140
    .end local v2    # "i":I
    :cond_6a
    const/4 v2, 0x0

    .line 141
    .restart local v2    # "i":I
    :goto_6b
    array-length v6, v5

    if-ge v2, v6, :cond_8a

    .line 142
    add-int/lit8 v6, v2, 0x40

    array-length v7, v5

    if-ge v6, v7, :cond_80

    .line 143
    const/16 v6, 0x40

    invoke-virtual {p1, v5, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 144
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 145
    add-int/lit8 v2, v2, 0x40

    .line 146
    goto :goto_6b

    .line 148
    :cond_80
    array-length v6, v5

    sub-int/2addr v6, v2

    invoke-virtual {p1, v5, v2, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 149
    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    .line 152
    :cond_8a
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getEnd()[B

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V

    sget-object v6, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v6}, Ljava/io/OutputStream;->write([B)V
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_96} :catch_97

    .line 157
    .end local v2    # "i":I
    :goto_96
    return-void

    .line 155
    :catch_97
    move-exception v6

    goto :goto_96
.end method

.method public writePrivateKey(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/lang/String;[B)V

    .line 250
    return-void
.end method

.method public writePrivateKey(Ljava/lang/String;[B)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "passphrase"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 259
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 260
    .local v0, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writePrivateKey(Ljava/io/OutputStream;[B)V

    .line 261
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 262
    return-void
.end method

.method public writePublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 181
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v1

    .line 182
    .local v1, "pubblob":[B
    array-length v2, v1

    invoke-static {v1, v3, v2}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v0

    .line 184
    .local v0, "pub":[B
    :try_start_a
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getKeyTypeName()[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    sget-object v2, Lcom/jcraft/jsch/KeyPair;->space:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 185
    const/4 v2, 0x0

    array-length v3, v0

    invoke-virtual {p1, v0, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    sget-object v2, Lcom/jcraft/jsch/KeyPair;->space:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 186
    invoke-static {p2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 187
    sget-object v2, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_2c} :catch_2d

    .line 191
    :goto_2c
    return-void

    .line 189
    :catch_2d
    move-exception v2

    goto :goto_2c
.end method

.method public writePublicKey(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 201
    .local v0, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writePublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 202
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 203
    return-void
.end method

.method public writeSECSHPublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 9
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "comment"    # Ljava/lang/String;

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v3

    .line 213
    .local v3, "pubblob":[B
    const/4 v4, 0x0

    array-length v5, v3

    invoke-static {v3, v4, v5}, Lcom/jcraft/jsch/Util;->toBase64([BII)[B

    move-result-object v2

    .line 215
    .local v2, "pub":[B
    :try_start_a
    const-string v4, "---- BEGIN SSH2 PUBLIC KEY ----"

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 216
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Comment: \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 217
    const/4 v0, 0x0

    .line 218
    .local v0, "index":I
    :goto_3e
    array-length v4, v2

    if-ge v0, v4, :cond_54

    .line 219
    const/16 v1, 0x46

    .line 220
    .local v1, "len":I
    array-length v4, v2

    sub-int/2addr v4, v0

    if-ge v4, v1, :cond_4a

    array-length v4, v2

    sub-int v1, v4, v0

    .line 221
    :cond_4a
    invoke-virtual {p1, v2, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    .line 222
    add-int/2addr v0, v1

    .line 223
    goto :goto_3e

    .line 224
    .end local v1    # "len":I
    :cond_54
    const-string v4, "---- END SSH2 PUBLIC KEY ----"

    invoke-static {v4}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V

    sget-object v4, Lcom/jcraft/jsch/KeyPair;->cr:[B

    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_62} :catch_63

    .line 228
    .end local v0    # "index":I
    :goto_62
    return-void

    .line 226
    :catch_63
    move-exception v4

    goto :goto_62
.end method

.method public writeSECSHPublicKey(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "comment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 239
    .local v0, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0, v0, p2}, Lcom/jcraft/jsch/KeyPair;->writeSECSHPublicKey(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 240
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 241
    return-void
.end method

.method writeSEQUENCE([BII)I
    .registers 6
    .param p1, "buf"    # [B
    .param p2, "index"    # I
    .param p3, "len"    # I

    .prologue
    .line 330
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "index":I
    .local v0, "index":I
    const/16 v1, 0x30

    aput-byte v1, p1, p2

    .line 331
    invoke-virtual {p0, p1, v0, p3}, Lcom/jcraft/jsch/KeyPair;->writeLength([BII)I

    move-result p2

    .line 332
    .end local v0    # "index":I
    .restart local p2    # "index":I
    return p2
.end method
