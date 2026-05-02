.class public Lcom/nostra13/universalimageloader/cache/disc/naming/Md5FileNameGenerator;
.super Ljava/lang/Object;
.source "Md5FileNameGenerator.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;


# static fields
.field private static final HASH_ALGORITHM:Ljava/lang/String; = "MD5"

.field private static final RADIX:I = 0x24


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getMD5([B)[B
    .registers 6
    .param p1, "data"    # [B

    .prologue
    .line 43
    const/4 v2, 0x0

    .line 45
    .local v2, "hash":[B
    :try_start_1
    const-string v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 46
    .local v0, "digest":Ljava/security/MessageDigest;
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 47
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B
    :try_end_d
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_d} :catch_f

    move-result-object v2

    .line 51
    .end local v0    # "digest":Ljava/security/MessageDigest;
    :goto_e
    return-object v2

    .line 48
    :catch_f
    move-exception v1

    .line 49
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    goto :goto_e
.end method


# virtual methods
.method public generate(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/nostra13/universalimageloader/cache/disc/naming/Md5FileNameGenerator;->getMD5([B)[B

    move-result-object v1

    .line 38
    .local v1, "md5":[B
    new-instance v2, Ljava/math/BigInteger;

    invoke-direct {v2, v1}, Ljava/math/BigInteger;-><init>([B)V

    invoke-virtual {v2}, Ljava/math/BigInteger;->abs()Ljava/math/BigInteger;

    move-result-object v0

    .line 39
    .local v0, "bi":Ljava/math/BigInteger;
    const/16 v2, 0x24

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
