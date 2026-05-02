.class public Lcom/jcraft/jsch/KeyPairRSA;
.super Lcom/jcraft/jsch/KeyPair;
.source "KeyPairRSA.java"


# static fields
.field private static final begin:[B

.field private static final end:[B

.field private static final sshrsa:[B


# instance fields
.field private c_array:[B

.field private ep_array:[B

.field private eq_array:[B

.field private key_size:I

.field private n_array:[B

.field private p_array:[B

.field private prv_array:[B

.field private pub_array:[B

.field private q_array:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 90
    const-string v0, "-----BEGIN RSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairRSA;->begin:[B

    .line 91
    const-string v0, "-----END RSA PRIVATE KEY-----"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairRSA;->end:[B

    .line 311
    const-string v0, "ssh-rsa"

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/jcraft/jsch/KeyPairRSA;->sshrsa:[B

    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;)V
    .registers 3
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/jcraft/jsch/JSch;[B[B[B)V
    .registers 6
    .param p1, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p2, "n_array"    # [B
    .param p3, "pub_array"    # [B
    .param p4, "prv_array"    # [B

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/jcraft/jsch/KeyPair;-><init>(Lcom/jcraft/jsch/JSch;)V

    .line 45
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I

    .line 56
    iput-object p2, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    .line 57
    iput-object p3, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    .line 58
    iput-object p4, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    .line 59
    if-eqz p2, :cond_1a

    .line 60
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p2}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    iput v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I

    .line 62
    :cond_1a
    return-void
.end method

.method static fromSSHAgent(Lcom/jcraft/jsch/JSch;Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/KeyPair;
    .registers 9
    .param p0, "jsch"    # Lcom/jcraft/jsch/JSch;
    .param p1, "buf"    # Lcom/jcraft/jsch/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 361
    const/16 v5, 0x8

    const-string v6, "invalid key format"

    invoke-virtual {p1, v5, v6}, Lcom/jcraft/jsch/Buffer;->getBytes(ILjava/lang/String;)[[B

    move-result-object v4

    .line 363
    .local v4, "tmp":[[B
    const/4 v5, 0x1

    aget-object v1, v4, v5

    .line 364
    .local v1, "n_array":[B
    const/4 v5, 0x2

    aget-object v3, v4, v5

    .line 365
    .local v3, "pub_array":[B
    const/4 v5, 0x3

    aget-object v2, v4, v5

    .line 366
    .local v2, "prv_array":[B
    new-instance v0, Lcom/jcraft/jsch/KeyPairRSA;

    invoke-direct {v0, p0, v1, v3, v2}, Lcom/jcraft/jsch/KeyPairRSA;-><init>(Lcom/jcraft/jsch/JSch;[B[B[B)V

    .line 367
    .local v0, "kpair":Lcom/jcraft/jsch/KeyPairRSA;
    const/4 v5, 0x4

    aget-object v5, v4, v5

    iput-object v5, v0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    .line 368
    const/4 v5, 0x5

    aget-object v5, v4, v5

    iput-object v5, v0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    .line 369
    const/4 v5, 0x6

    aget-object v5, v4, v5

    iput-object v5, v0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    .line 370
    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x7

    aget-object v6, v4, v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    iput-object v5, v0, Lcom/jcraft/jsch/KeyPairRSA;->publicKeyComment:Ljava/lang/String;

    .line 371
    const/4 v5, 0x0

    iput v5, v0, Lcom/jcraft/jsch/KeyPairRSA;->vendor:I

    .line 372
    return-object v0
.end method

.method private getCArray()[B
    .registers 4

    .prologue
    .line 408
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    if-nez v0, :cond_1c

    .line 409
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v1, Ljava/math/BigInteger;

    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    invoke-direct {v1, v2}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    .line 411
    :cond_1c
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    return-object v0
.end method

.method private getEPArray()[B
    .registers 4

    .prologue
    .line 394
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    if-nez v0, :cond_22

    .line 395
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v1, Ljava/math/BigInteger;

    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    invoke-direct {v1, v2}, Ljava/math/BigInteger;-><init>([B)V

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    .line 397
    :cond_22
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    return-object v0
.end method

.method private getEQArray()[B
    .registers 4

    .prologue
    .line 401
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    if-nez v0, :cond_22

    .line 402
    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v1, Ljava/math/BigInteger;

    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    invoke-direct {v1, v2}, Ljava/math/BigInteger;-><init>([B)V

    sget-object v2, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    .line 404
    :cond_22
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    return-object v0
.end method


# virtual methods
.method public dispose()V
    .registers 2

    .prologue
    .line 415
    invoke-super {p0}, Lcom/jcraft/jsch/KeyPair;->dispose()V

    .line 416
    iget-object v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    invoke-static {v0}, Lcom/jcraft/jsch/Util;->bzero([B)V

    .line 417
    return-void
.end method

.method public forSSHAgent()[B
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 376
    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairRSA;->isEncrypted()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 377
    new-instance v2, Lcom/jcraft/jsch/JSchException;

    const-string v3, "key is encrypted."

    invoke-direct {v2, v3}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 379
    :cond_e
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0}, Lcom/jcraft/jsch/Buffer;-><init>()V

    .line 380
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    sget-object v2, Lcom/jcraft/jsch/KeyPairRSA;->sshrsa:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 381
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 382
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 383
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 384
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getCArray()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 385
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 386
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 387
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->publicKeyComment:Ljava/lang/String;

    invoke-static {v2}, Lcom/jcraft/jsch/Util;->str2byte(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/jcraft/jsch/Buffer;->putString([B)V

    .line 388
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getLength()I

    move-result v2

    new-array v1, v2, [B

    .line 389
    .local v1, "result":[B
    const/4 v2, 0x0

    array-length v3, v1

    invoke-virtual {v0, v1, v2, v3}, Lcom/jcraft/jsch/Buffer;->getByte([BII)V

    .line 390
    return-object v1
.end method

.method generate(I)V
    .registers 8
    .param p1, "key_size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/jcraft/jsch/JSchException;
        }
    .end annotation

    .prologue
    .line 65
    iput p1, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I

    .line 67
    :try_start_2
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v4, "keypairgen.rsa"

    invoke-static {v4}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 68
    .local v1, "c":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/KeyPairGenRSA;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/KeyPairGenRSA;

    move-object v3, v0

    .line 69
    .local v3, "keypairgen":Lcom/jcraft/jsch/KeyPairGenRSA;
    invoke-interface {v3, p1}, Lcom/jcraft/jsch/KeyPairGenRSA;->init(I)V

    .line 70
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getE()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    .line 71
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getD()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    .line 72
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getN()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    .line 74
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getP()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    .line 75
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getQ()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    .line 76
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getEP()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    .line 77
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getEQ()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    .line 78
    invoke-interface {v3}, Lcom/jcraft/jsch/KeyPairGenRSA;->getC()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_4b} :catch_4c

    .line 88
    return-void

    .line 82
    .end local v1    # "c":Ljava/lang/Class;
    .end local v3    # "keypairgen":Lcom/jcraft/jsch/KeyPairGenRSA;
    :catch_4c
    move-exception v2

    .line 84
    .local v2, "e":Ljava/lang/Exception;
    instance-of v4, v2, Ljava/lang/Throwable;

    if-eqz v4, :cond_5b

    .line 85
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 86
    :cond_5b
    new-instance v4, Lcom/jcraft/jsch/JSchException;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/jcraft/jsch/JSchException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method getBegin()[B
    .registers 2

    .prologue
    .line 93
    sget-object v0, Lcom/jcraft/jsch/KeyPairRSA;->begin:[B

    return-object v0
.end method

.method getEnd()[B
    .registers 2

    .prologue
    .line 94
    sget-object v0, Lcom/jcraft/jsch/KeyPairRSA;->end:[B

    return-object v0
.end method

.method public getKeySize()I
    .registers 2

    .prologue
    .line 316
    iget v0, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I

    return v0
.end method

.method public getKeyType()I
    .registers 2

    .prologue
    .line 313
    const/4 v0, 0x2

    return v0
.end method

.method getKeyTypeName()[B
    .registers 2

    .prologue
    .line 312
    sget-object v0, Lcom/jcraft/jsch/KeyPairRSA;->sshrsa:[B

    return-object v0
.end method

.method getPrivateKey()[B
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 97
    invoke-virtual {p0, v6}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    array-length v5, v5

    invoke-virtual {p0, v5}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v5

    add-int/2addr v4, v5

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    array-length v5, v5

    add-int v0, v4, v5

    .line 108
    .local v0, "content":I
    invoke-virtual {p0, v0}, Lcom/jcraft/jsch/KeyPairRSA;->countLength(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    add-int v3, v4, v0

    .line 111
    .local v3, "total":I
    new-array v2, v3, [B

    .line 112
    .local v2, "plain":[B
    const/4 v1, 0x0

    .line 113
    .local v1, "index":I
    invoke-virtual {p0, v2, v1, v0}, Lcom/jcraft/jsch/KeyPairRSA;->writeSEQUENCE([BII)I

    move-result v1

    .line 114
    new-array v4, v6, [B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 115
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 116
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 117
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 118
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 119
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 120
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 121
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 122
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    invoke-virtual {p0, v2, v1, v4}, Lcom/jcraft/jsch/KeyPairRSA;->writeINTEGER([BI[B)I

    move-result v1

    .line 123
    return-object v2
.end method

.method public getPublicKeyBlob()[B
    .registers 5

    .prologue
    .line 300
    invoke-super {p0}, Lcom/jcraft/jsch/KeyPair;->getPublicKeyBlob()[B

    move-result-object v0

    .line 301
    .local v0, "foo":[B
    if-eqz v0, :cond_7

    .line 308
    .end local v0    # "foo":[B
    :goto_6
    return-object v0

    .line 303
    .restart local v0    # "foo":[B
    :cond_7
    iget-object v2, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    if-nez v2, :cond_d

    const/4 v0, 0x0

    goto :goto_6

    .line 304
    :cond_d
    const/4 v2, 0x3

    new-array v1, v2, [[B

    .line 305
    .local v1, "tmp":[[B
    const/4 v2, 0x0

    sget-object v3, Lcom/jcraft/jsch/KeyPairRSA;->sshrsa:[B

    aput-object v3, v1, v2

    .line 306
    const/4 v2, 0x1

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    aput-object v3, v1, v2

    .line 307
    const/4 v2, 0x2

    iget-object v3, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    aput-object v3, v1, v2

    .line 308
    invoke-static {v1}, Lcom/jcraft/jsch/Buffer;->fromBytes([[B)Lcom/jcraft/jsch/Buffer;

    move-result-object v2

    iget-object v0, v2, Lcom/jcraft/jsch/Buffer;->buffer:[B

    goto :goto_6
.end method

.method public getSignature([B)[B
    .registers 9
    .param p1, "data"    # [B

    .prologue
    .line 321
    :try_start_0
    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v5, "signature.rsa"

    invoke-static {v5}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 322
    .local v1, "c":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jcraft/jsch/SignatureRSA;

    move-object v0, v5

    check-cast v0, Lcom/jcraft/jsch/SignatureRSA;

    move-object v2, v0

    .line 323
    .local v2, "rsa":Lcom/jcraft/jsch/SignatureRSA;
    invoke-interface {v2}, Lcom/jcraft/jsch/SignatureRSA;->init()V

    .line 324
    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    iget-object v6, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-interface {v2, v5, v6}, Lcom/jcraft/jsch/SignatureRSA;->setPrvKey([B[B)V

    .line 326
    invoke-interface {v2, p1}, Lcom/jcraft/jsch/SignatureRSA;->update([B)V

    .line 327
    invoke-interface {v2}, Lcom/jcraft/jsch/SignatureRSA;->sign()[B

    move-result-object v3

    .line 328
    .local v3, "sig":[B
    const/4 v5, 0x2

    new-array v4, v5, [[B

    .line 329
    .local v4, "tmp":[[B
    const/4 v5, 0x0

    sget-object v6, Lcom/jcraft/jsch/KeyPairRSA;->sshrsa:[B

    aput-object v6, v4, v5

    .line 330
    const/4 v5, 0x1

    aput-object v3, v4, v5

    .line 331
    invoke-static {v4}, Lcom/jcraft/jsch/Buffer;->fromBytes([[B)Lcom/jcraft/jsch/Buffer;

    move-result-object v5

    iget-object v5, v5, Lcom/jcraft/jsch/Buffer;->buffer:[B
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_38} :catch_39

    .line 335
    .end local v1    # "c":Ljava/lang/Class;
    .end local v2    # "rsa":Lcom/jcraft/jsch/SignatureRSA;
    .end local v3    # "sig":[B
    .end local v4    # "tmp":[[B
    :goto_38
    return-object v5

    .line 333
    :catch_39
    move-exception v5

    .line 335
    const/4 v5, 0x0

    goto :goto_38
.end method

.method public getVerifier()Lcom/jcraft/jsch/Signature;
    .registers 7

    .prologue
    .line 340
    :try_start_0
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->jsch:Lcom/jcraft/jsch/JSch;

    const-string v4, "signature.rsa"

    invoke-static {v4}, Lcom/jcraft/jsch/JSch;->getConfig(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 341
    .local v2, "c":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jcraft/jsch/SignatureRSA;

    move-object v0, v4

    check-cast v0, Lcom/jcraft/jsch/SignatureRSA;

    move-object v3, v0

    .line 342
    .local v3, "rsa":Lcom/jcraft/jsch/SignatureRSA;
    invoke-interface {v3}, Lcom/jcraft/jsch/SignatureRSA;->init()V

    .line 344
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    if-nez v4, :cond_3f

    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    if-nez v4, :cond_3f

    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getPublicKeyBlob()[B

    move-result-object v4

    if-eqz v4, :cond_3f

    .line 345
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    invoke-virtual {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getPublicKeyBlob()[B

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 346
    .local v1, "buf":Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    .line 347
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    .line 348
    invoke-virtual {v1}, Lcom/jcraft/jsch/Buffer;->getString()[B

    move-result-object v4

    iput-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    .line 351
    .end local v1    # "buf":Lcom/jcraft/jsch/Buffer;
    :cond_3f
    iget-object v4, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    iget-object v5, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-interface {v3, v4, v5}, Lcom/jcraft/jsch/SignatureRSA;->setPubKey([B[B)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_46} :catch_47

    .line 356
    .end local v2    # "c":Ljava/lang/Class;
    .end local v3    # "rsa":Lcom/jcraft/jsch/SignatureRSA;
    :goto_46
    return-object v3

    .line 354
    :catch_47
    move-exception v4

    .line 356
    const/4 v3, 0x0

    goto :goto_46
.end method

.method parse([B)Z
    .registers 16
    .param p1, "plain"    # [B

    .prologue
    const/4 v13, 0x2

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 129
    const/4 v4, 0x0

    .line 130
    .local v4, "index":I
    const/4 v6, 0x0

    .line 132
    .local v6, "length":I
    :try_start_5
    iget v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->vendor:I

    if-ne v11, v13, :cond_37

    .line 133
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, p1}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 134
    .local v0, "buf":Lcom/jcraft/jsch/Buffer;
    array-length v11, p1

    invoke-virtual {v0, v11}, Lcom/jcraft/jsch/Buffer;->skip(I)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_12} :catch_83

    .line 137
    const/4 v11, 0x4

    :try_start_13
    const-string v12, ""

    invoke-virtual {v0, v11, v12}, Lcom/jcraft/jsch/Buffer;->getBytes(ILjava/lang/String;)[[B

    move-result-object v7

    .line 138
    .local v7, "tmp":[[B
    const/4 v11, 0x0

    aget-object v11, v7, v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    .line 139
    const/4 v11, 0x1

    aget-object v11, v7, v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    .line 140
    const/4 v11, 0x2

    aget-object v11, v7, v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    .line 141
    const/4 v11, 0x3

    aget-object v11, v7, v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B
    :try_end_2d
    .catch Lcom/jcraft/jsch/JSchException; {:try_start_13 .. :try_end_2d} :catch_34
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_2d} :catch_83

    .line 147
    :try_start_2d
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getEPArray()[B

    .line 148
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getEQArray()[B

    .line 296
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v7    # "tmp":[[B
    :cond_33
    :goto_33
    return v9

    .line 143
    .restart local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    :catch_34
    move-exception v1

    .local v1, "e":Lcom/jcraft/jsch/JSchException;
    move v9, v10

    .line 144
    goto :goto_33

    .line 153
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v1    # "e":Lcom/jcraft/jsch/JSchException;
    :cond_37
    iget v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->vendor:I

    if-ne v11, v9, :cond_88

    .line 154
    aget-byte v11, p1, v4

    const/16 v12, 0x30

    if-eq v11, v12, :cond_86

    .line 155
    new-instance v0, Lcom/jcraft/jsch/Buffer;

    invoke-direct {v0, p1}, Lcom/jcraft/jsch/Buffer;-><init>([B)V

    .line 156
    .restart local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    .line 157
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    .line 158
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    .line 159
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v8

    .line 160
    .local v8, "u_array":[B
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    .line 161
    invoke-virtual {v0}, Lcom/jcraft/jsch/Buffer;->getMPIntBits()[B

    move-result-object v11

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    .line 162
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    if-eqz v11, :cond_79

    .line 163
    new-instance v11, Ljava/math/BigInteger;

    iget-object v12, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-direct {v11, v12}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v11}, Ljava/math/BigInteger;->bitLength()I

    move-result v11

    iput v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I

    .line 166
    :cond_79
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getEPArray()[B

    .line 167
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getEQArray()[B

    .line 168
    invoke-direct {p0}, Lcom/jcraft/jsch/KeyPairRSA;->getCArray()[B
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_82} :catch_83

    goto :goto_33

    .line 292
    .end local v0    # "buf":Lcom/jcraft/jsch/Buffer;
    .end local v8    # "u_array":[B
    :catch_83
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    :goto_84
    move v9, v10

    .line 294
    goto :goto_33

    .end local v1    # "e":Ljava/lang/Exception;
    :cond_86
    move v9, v10

    .line 172
    goto :goto_33

    .line 191
    :cond_88
    add-int/lit8 v4, v4, 0x1

    .line 192
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .local v5, "index":I
    :try_start_8c
    aget-byte v11, p1, v4
    :try_end_8e
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_8e} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 193
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_a9

    .line 194
    and-int/lit8 v2, v6, 0x7f

    .local v2, "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 195
    .end local v2    # "foo":I
    .local v3, "foo":I
    :goto_98
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_a9

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_a0
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_98

    .end local v3    # "foo":I
    :cond_a9
    move v4, v5

    .line 198
    .end local v5    # "index":I
    .restart local v4    # "index":I
    aget-byte v11, p1, v4
    :try_end_ac
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_ac} :catch_83

    if-eq v11, v13, :cond_b0

    move v9, v10

    goto :goto_33

    .line 199
    :cond_b0
    add-int/lit8 v4, v4, 0x1

    .line 200
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_b4
    aget-byte v11, p1, v4
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_b6} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 201
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_d1

    .line 202
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 203
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_c0
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_d1

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_c8
    aget-byte v12, p1, v5
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_ca} :catch_83

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_c0

    .end local v3    # "foo":I
    :cond_d1
    move v4, v5

    .line 205
    .end local v5    # "index":I
    .restart local v4    # "index":I
    add-int/2addr v4, v6

    .line 207
    add-int/lit8 v4, v4, 0x1

    .line 208
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_d7
    aget-byte v11, p1, v4
    :try_end_d9
    .catch Ljava/lang/Exception; {:try_start_d7 .. :try_end_d9} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 209
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_f4

    .line 210
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 211
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_e3
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_f4

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_eb
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_e3

    .end local v3    # "foo":I
    :cond_f4
    move v4, v5

    .line 213
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    .line 214
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_ff
    .catch Ljava/lang/Exception; {:try_start_eb .. :try_end_ff} :catch_83

    .line 215
    add-int/2addr v4, v6

    .line 217
    add-int/lit8 v4, v4, 0x1

    .line 218
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_104
    aget-byte v11, p1, v4
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_104 .. :try_end_106} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 219
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_121

    .line 220
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 221
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_110
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_121

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_118
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_110

    .end local v3    # "foo":I
    :cond_121
    move v4, v5

    .line 223
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    .line 224
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->pub_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_12c
    .catch Ljava/lang/Exception; {:try_start_118 .. :try_end_12c} :catch_83

    .line 225
    add-int/2addr v4, v6

    .line 227
    add-int/lit8 v4, v4, 0x1

    .line 228
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_131
    aget-byte v11, p1, v4
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_131 .. :try_end_133} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 229
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_14e

    .line 230
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 231
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_13d
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_14e

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_145
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_13d

    .end local v3    # "foo":I
    :cond_14e
    move v4, v5

    .line 233
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    .line 234
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->prv_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_159
    .catch Ljava/lang/Exception; {:try_start_145 .. :try_end_159} :catch_83

    .line 235
    add-int/2addr v4, v6

    .line 237
    add-int/lit8 v4, v4, 0x1

    .line 238
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_15e
    aget-byte v11, p1, v4
    :try_end_160
    .catch Ljava/lang/Exception; {:try_start_15e .. :try_end_160} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 239
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_17b

    .line 240
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 241
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_16a
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_17b

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_172
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_16a

    .end local v3    # "foo":I
    :cond_17b
    move v4, v5

    .line 243
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    .line 244
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->p_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_186
    .catch Ljava/lang/Exception; {:try_start_172 .. :try_end_186} :catch_83

    .line 245
    add-int/2addr v4, v6

    .line 247
    add-int/lit8 v4, v4, 0x1

    .line 248
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_18b
    aget-byte v11, p1, v4
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_18b .. :try_end_18d} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 249
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_1a8

    .line 250
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 251
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_197
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_1a8

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_19f
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_197

    .end local v3    # "foo":I
    :cond_1a8
    move v4, v5

    .line 253
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    .line 254
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->q_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1b3
    .catch Ljava/lang/Exception; {:try_start_19f .. :try_end_1b3} :catch_83

    .line 255
    add-int/2addr v4, v6

    .line 257
    add-int/lit8 v4, v4, 0x1

    .line 258
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_1b8
    aget-byte v11, p1, v4
    :try_end_1ba
    .catch Ljava/lang/Exception; {:try_start_1b8 .. :try_end_1ba} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 259
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_1d5

    .line 260
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 261
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_1c4
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_1d5

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_1cc
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_1c4

    .end local v3    # "foo":I
    :cond_1d5
    move v4, v5

    .line 263
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    .line 264
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->ep_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1e0
    .catch Ljava/lang/Exception; {:try_start_1cc .. :try_end_1e0} :catch_83

    .line 265
    add-int/2addr v4, v6

    .line 267
    add-int/lit8 v4, v4, 0x1

    .line 268
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_1e5
    aget-byte v11, p1, v4
    :try_end_1e7
    .catch Ljava/lang/Exception; {:try_start_1e5 .. :try_end_1e7} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 269
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_202

    .line 270
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 271
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_1f1
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_202

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_1f9
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_1f1

    .end local v3    # "foo":I
    :cond_202
    move v4, v5

    .line 273
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    .line 274
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->eq_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_20d
    .catch Ljava/lang/Exception; {:try_start_1f9 .. :try_end_20d} :catch_83

    .line 275
    add-int/2addr v4, v6

    .line 277
    add-int/lit8 v4, v4, 0x1

    .line 278
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "index":I
    .restart local v5    # "index":I
    :try_start_212
    aget-byte v11, p1, v4
    :try_end_214
    .catch Ljava/lang/Exception; {:try_start_212 .. :try_end_214} :catch_24e

    and-int/lit16 v6, v11, 0xff

    .line 279
    and-int/lit16 v11, v6, 0x80

    if-eqz v11, :cond_22f

    .line 280
    and-int/lit8 v2, v6, 0x7f

    .restart local v2    # "foo":I
    const/4 v6, 0x0

    move v3, v2

    .line 281
    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    :goto_21e
    add-int/lit8 v2, v3, -0x1

    .end local v3    # "foo":I
    .restart local v2    # "foo":I
    if-lez v3, :cond_22f

    shl-int/lit8 v11, v6, 0x8

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "index":I
    .restart local v4    # "index":I
    :try_start_226
    aget-byte v12, p1, v5

    and-int/lit16 v12, v12, 0xff

    add-int v6, v11, v12

    move v3, v2

    .end local v2    # "foo":I
    .restart local v3    # "foo":I
    move v5, v4

    .end local v4    # "index":I
    .restart local v5    # "index":I
    goto :goto_21e

    .end local v3    # "foo":I
    :cond_22f
    move v4, v5

    .line 283
    .end local v5    # "index":I
    .restart local v4    # "index":I
    new-array v11, v6, [B

    iput-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    .line 284
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->c_array:[B

    const/4 v12, 0x0

    invoke-static {p1, v4, v11, v12, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 285
    add-int/2addr v4, v6

    .line 287
    iget-object v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    if-eqz v11, :cond_33

    .line 288
    new-instance v11, Ljava/math/BigInteger;

    iget-object v12, p0, Lcom/jcraft/jsch/KeyPairRSA;->n_array:[B

    invoke-direct {v11, v12}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v11}, Ljava/math/BigInteger;->bitLength()I

    move-result v11

    iput v11, p0, Lcom/jcraft/jsch/KeyPairRSA;->key_size:I
    :try_end_24c
    .catch Ljava/lang/Exception; {:try_start_226 .. :try_end_24c} :catch_83

    goto/16 :goto_33

    .line 292
    .end local v4    # "index":I
    .restart local v5    # "index":I
    :catch_24e
    move-exception v1

    move v4, v5

    .end local v5    # "index":I
    .restart local v4    # "index":I
    goto/16 :goto_84
.end method
